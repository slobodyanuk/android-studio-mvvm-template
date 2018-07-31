package ${packageName}.utils.realm;

import com.google.gson.Gson;
import com.google.gson.TypeAdapter;
import com.google.gson.annotations.SerializedName;
import com.google.gson.reflect.TypeToken;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;

import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.realm.RealmList;

public class RealmModelAdapter<T> extends TypeAdapter<T> {

    private Gson gson;
    private Map<Field, Method> settersMap;
    private Map<Field, Method> gettersMap;
    private Map<String, Field> serializedNamesMap;

    private Class<?> serializedClass;

    @SuppressWarnings("unchecked")
    RealmModelAdapter(Gson gson, TypeToken<T> type) {
        this.gson = gson;

        serializedClass = type.getRawType();

        initMaps();
    }

    @Override
    public void write(JsonWriter out, T value) throws IOException {
        out.beginObject();

        for (Map.Entry<String, Field> entry : serializedNamesMap.entrySet()) {
            out.name(entry.getKey());

            Method getter = getGetter(entry.getValue());

            try {
                out.jsonValue(gson.toJson(getter.invoke(value, (Object[]) null)));
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
        }

        out.endObject();
    }

    @SuppressWarnings({"TryWithIdenticalCatches", "unchecked"})
    @Override
    public T read(JsonReader in) throws IOException {
        T object = null;

        try {
            object = (T) serializedClass.newInstance();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }

        boolean isObject = in.peek().equals(JsonToken.BEGIN_OBJECT);

        if (isObject) {
            in.beginObject();
        } else {
            in.beginArray();
        }

        while (in.hasNext()) {
            String name = in.nextName();
            Field field = getField(name);

            if (field == null) {
                in.skipValue();
                continue;
            }

            Method setter = getSetter(field);

            if (setter == null) {
                in.skipValue();
                continue;
            }

            try {
                if (field.getType().equals(RealmList.class)) {
                    RealmList o = gson.fromJson(in, field.getGenericType());
                    setter.invoke(object, o);
                }else {
                    Object o = gson.fromJson(in, field.getType());
                    setter.invoke(object, o);
                }
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
        }

        if (isObject) {
            in.endObject();
        } else {
            in.endArray();
        }

        return object;
    }

    private void initMaps() {
        gettersMap = new HashMap<>();
        settersMap = new HashMap<>();
        serializedNamesMap = new HashMap<>();

        List<Field> declaredFields = new ArrayList<>(Arrays.asList(serializedClass.getDeclaredFields()));
        List<Method> declaredMethods = new ArrayList<>(Arrays.asList(serializedClass.getDeclaredMethods()));

        for (Field field : declaredFields) {
            SerializedName annotation = field.getAnnotation(SerializedName.class);

            if (annotation == null) {
                continue;
            }

            serializedNamesMap.put(annotation.value(), field);
        }

        for (Method method : declaredMethods) {
            boolean isGetter = isGetter(method);
            boolean isSetter = isSetter(method);

            String croppedName = cropMethodName(isGetter, isSetter, method);

            if (croppedName == null) {
                continue;
            }

            for (Field field : declaredFields) {
                if (!field.getName().equals(croppedName)) {
                    continue;
                }

                if (isGetter) {
                    gettersMap.put(field, method);
                } else {
                    settersMap.put(field, method);
                }
            }
        }
    }

    private String cropMethodName(boolean isGetter, boolean isSetter, Method method) {
        if (!isGetter && !isSetter) {
            return null;
        }

        if (isSetter &&
                method.getParameterTypes()[0].getName().equals(boolean.class.getCanonicalName())) {

            char[] c = new StringBuilder(method.getName()).substring(2).toCharArray();
            c[0] = Character.toLowerCase(c[0]);

            return new String(c);
        }

        char[] c = new StringBuilder(method.getName()).substring(3).toCharArray();
        c[0] = Character.toLowerCase(c[0]);

        return new String(c);
    }

    private boolean isGetter(Method method) {
        return method.getName().startsWith("get") &&
                method.getParameterTypes().length == 0 &&
                !void.class.equals(method.getReturnType());
    }

    private boolean isSetter(Method method) {
        return method.getName().startsWith("set") &&
                method.getParameterTypes().length == 1;
    }

    private Field getField(String name) {
        return serializedNamesMap.get(name);
    }

    private Method getSetter(Field field) {
        return settersMap.get(field);
    }

    private Method getGetter(Field field) {
        return gettersMap.get(field);
    }
}