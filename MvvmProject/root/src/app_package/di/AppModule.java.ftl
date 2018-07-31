package ${packageName}.di;

import android.app.Application;

import dagger.Binds;
import dagger.Module;

import android.content.Context;
import android.content.ContextWrapper;


<#if generateApiHelper>
import io.reactivex.disposables.CompositeDisposable;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import ${packageName}.utils.NetworkUtils;

</#if>

 <#if usePrefs>
import com.pixplicity.easyprefs.library.Prefs;</#if>

import ${packageName}.R;
import ${packageName}.di.scopes.ApplicationScope;

import dagger.Module;
import dagger.Provides;


 <#if generateRealmHelper>
import io.realm.RealmConfiguration;
import ${packageName}.utils.realm.RealmSerializerFactory;</#if>


import uk.co.chrisjenx.calligraphy.CalligraphyConfig;

@Module
public abstract class AppModule {

    @Binds
    abstract Context provideContext(Application application);

<#if generateApiHelper>

    @Provides
    @ApplicationScope
    static CompositeDisposable compositeDisposable() {
        return new CompositeDisposable();
    }

    @Provides
    @ApplicationScope
    static Gson gson(){
        return new GsonBuilder()
                .registerTypeAdapterFactory(new RealmSerializerFactory())
                .setLenient()
                .create();
    }

    @Provides
    @ApplicationScope
    static NetworkUtils networkUtils(Context context) {
        return new NetworkUtils(context);
    }
    </#if>


    @Provides
    @ApplicationScope
    static CalligraphyConfig calligraphyConfig() {
        return new CalligraphyConfig.Builder()
                .setDefaultFontPath("fonts/Ubuntu-Regular.ttf")
                .setFontAttrId(R.attr.fontPath)
                .build();
    }

 <#if generateRealmHelper>
    @Provides
    @ApplicationScope
    static RealmConfiguration realmConfiguration() {
        return new RealmConfiguration.Builder()
                .deleteRealmIfMigrationNeeded()
                .build();
    }</#if>
 <#if usePrefs>

    @Provides
    @ApplicationScope
    static Prefs.Builder prefs(Context context) {
        return new Prefs.Builder()
                .setContext(context)
                .setMode(ContextWrapper.MODE_PRIVATE)
                .setPrefsName(context.getPackageName())
                .setUseDefaultSharedPreference(true);
    }
</#if>
}