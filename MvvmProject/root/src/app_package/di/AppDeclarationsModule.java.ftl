package ${packageName}.di;

import android.content.Context;

import android.content.ContextWrapper;

import ${packageName}.data.DataManager;
import ${packageName}.data.IDataManager;


<#if generateApiHelper>
import io.reactivex.disposables.CompositeDisposable;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import ${packageName}.utils.NetworkUtils;

</#if>

 <#if usePrefs>
import com.pixplicity.easyprefs.library.Prefs;</#if>

<#if generateRealmHelper>
import io.realm.RealmConfiguration;
import ${packageName}.utils.realm.RealmSerializerFactory;</#if>


import uk.co.chrisjenx.calligraphy.CalligraphyConfig;

import ${packageName}.R;
import ${packageName}.di.scopes.ApplicationScope;

import dagger.Module;
import dagger.Provides;

@Module
public class AppDeclarationModule {

    <#if generateApiHelper>

    @Provides
    @ApplicationScope
    CompositeDisposable compositeDisposable() {
        return new CompositeDisposable();
    }

    @Provides
    @ApplicationScope
    Gson gson(){
        return new GsonBuilder()
                .registerTypeAdapterFactory(new RealmSerializerFactory())
                .setLenient()
                .create();
    }

    @Provides
    @ApplicationScope
    NetworkUtils networkUtils(Context context) {
        return new NetworkUtils(context);
    }
    </#if>


    @Provides
    @ApplicationScope
    CalligraphyConfig calligraphyConfig() {
        return new CalligraphyConfig.Builder()
                .setDefaultFontPath("fonts/Ubuntu-Regular.ttf")
                .setFontAttrId(R.attr.fontPath)
                .build();
    }

 <#if generateRealmHelper>
    @Provides
    @ApplicationScope
    RealmConfiguration realmConfiguration() {
        return new RealmConfiguration.Builder()
                .deleteRealmIfMigrationNeeded()
                .build();
    }</#if>
 <#if usePrefs>

    @Provides
    @ApplicationScope
    Prefs.Builder prefs(Context context) {
        return new Prefs.Builder()
                .setContext(context)
                .setMode(ContextWrapper.MODE_PRIVATE)
                .setPrefsName(context.getPackageName())
                .setUseDefaultSharedPreference(true);
    }
</#if>

    @Provides
    @ApplicationScope
    IDataManager dataManager(DataManager dataManager){
        return dataManager;
    }

}