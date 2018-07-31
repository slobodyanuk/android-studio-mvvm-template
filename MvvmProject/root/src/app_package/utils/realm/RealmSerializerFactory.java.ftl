package ${packageName}.utils.realm;

import com.google.gson.Gson;
import com.google.gson.TypeAdapter;
import com.google.gson.TypeAdapterFactory;
import com.google.gson.reflect.TypeToken;

import io.realm.RealmObject;

public class RealmSerializerFactory implements TypeAdapterFactory {

    @SuppressWarnings("unchecked")
    @Override
    public <T> TypeAdapter<T> create(Gson gson, TypeToken<T> type) {
        if (!RealmObject.class.isAssignableFrom(type.getRawType())) {
            return null;
        }

        return new RealmModelAdapter<>(gson, type);
    }
}