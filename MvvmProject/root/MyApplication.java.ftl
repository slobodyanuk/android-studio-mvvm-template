package ${packageName};

import dagger.android.AndroidInjector;
import dagger.android.DaggerApplication;

<#if generateApiHelper>
import com.androidnetworking.AndroidNetworking;
import okhttp3.OkHttpClient;
</#if>

<#if usePrefs>import com.pixplicity.easyprefs.library.Prefs;</#if>

import ${packageName}.di.AppComponent;
import ${packageName}.di.DaggerAppComponent;

import javax.inject.Inject;

<#if generateRealmHelper>
import dagger.Lazy;
import io.realm.Realm;
import io.realm.RealmConfiguration;
</#if>

import uk.co.chrisjenx.calligraphy.CalligraphyConfig;
import lombok.Getter;

public class ${applicationName} extends DaggerApplication {
	
	<#if generateBackstackTool>public static CharSequence PACKAGE_NAME;</#if>

	@Inject
    CalligraphyConfig calligraphyConfig;

    <#if generateRealmHelper>
    @Inject
    Lazy<RealmConfiguration> realmConfiguration;</#if>

	<#if usePrefs>
    @Inject
    Prefs.Builder prefsBuilder;</#if>

    <#if generateApiHelper>
    @Inject
    OkHttpClient okHttpClient;</#if>

	@Override
    public void onCreate() {
        super.onCreate();
        <#if generateBackstackTool>
        PACKAGE_NAME = getPackageName();</#if>
        setupAppTools();
    }

    private void setupAppTools() {
    	<#if generateApiHelper>
        setUpNetworking();</#if>

        CalligraphyConfig.initDefault(calligraphyConfig);

        <#if generateRealmHelper>
        Realm.init(this);
        Realm.setDefaultConfiguration(realmConfiguration.get());</#if>

        <#if usePrefs>prefsBuilder.build();</#if>
    }

    <#if generateApiHelper>
    private void setUpNetworking() {
		//AndroidNetworking.enableLogging(HttpLoggingInterceptor.Level.BODY);
        AndroidNetworking.initialize(getApplicationContext(), okHttpClient);
    }</#if>

    protected AndroidInjector<? extends DaggerApplication> applicationInjector() {
        AppComponent appComponent = DaggerAppComponent.builder().application(this).build();
        appComponent.inject(this);
        return appComponent;
    }

}
