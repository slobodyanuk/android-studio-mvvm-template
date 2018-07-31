package ${packageName}.di;

import dagger.Module;
import dagger.android.ContributesAndroidInjector;

import ${packageName}.${activityClass};
import ${packageName}.${suffix}ActivityModule;

import dagger.Module;
import dagger.android.ContributesAndroidInjector;

@Module
public abstract class ActivityBuilder {

    @ContributesAndroidInjector(modules = ${suffix}ActivityModule.class)
    abstract ${activityClass} bind${suffix}Activity();

}