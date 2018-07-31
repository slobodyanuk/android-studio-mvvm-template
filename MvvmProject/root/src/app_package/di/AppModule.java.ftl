package ${packageName}.di;

import android.app.Application;

import dagger.Binds;
import dagger.Module;

import android.content.Context;

@Module(includes = AppDeclarationModule.class)
public abstract class AppModule {

    @Binds
    abstract Context provideContext(Application application);

}