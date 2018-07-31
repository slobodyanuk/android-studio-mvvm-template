package ${packageName}.di;

import android.app.Application;

import javax.inject.Singleton;

import dagger.BindsInstance;
import dagger.Component;
import dagger.android.AndroidInjector;
import dagger.android.DaggerApplication;
import dagger.android.support.AndroidSupportInjectionModule;
import ${packageName}.${applicationName};
<#if generateRealmHelper>import ${packageName}.di.RepositoryModule;</#if>
<#if generateApiHelper>import ${packageName}.di.RestModule;</#if>
import ${packageName}.di.scopes.ApplicationScope;

@ApplicationScope
@Component(modules = {
        AndroidSupportInjectionModule.class,
        AppModule.class, <#if generateRealmHelper>RepositoryModule.class,</#if>
        <#if generateApiHelper>RestModule.class,</#if> ActivityBuilder.class})
public interface AppComponent extends AndroidInjector<DaggerApplication> {

    void inject(${applicationName} app);

    @Override
    void inject(DaggerApplication instance);

    @Component.Builder
    interface Builder {
        @BindsInstance
        Builder application(Application application);
        AppComponent build();
    }
}