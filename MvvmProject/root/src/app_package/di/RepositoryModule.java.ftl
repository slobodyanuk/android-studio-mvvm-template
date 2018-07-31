package ${packageName}.di;

import ${packageName}.data.IDataManager;
import ${packageName}.data.database.Repository;
import ${packageName}.di.scopes.ApplicationScope;

import dagger.Module;
import dagger.Provides;

@Module
public class RepositoryModule {

    @Provides
    @ApplicationScope
    IDataManager provideRepository() {
        return new Repository();
    }

}