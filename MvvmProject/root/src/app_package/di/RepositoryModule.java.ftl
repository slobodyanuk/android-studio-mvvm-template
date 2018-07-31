package ${packageName}.di;

import ${packageName}.data.database.IDatabaseManager;
import ${packageName}.data.database.DatabaseManager;
import ${packageName}.di.scopes.ApplicationScope;

import dagger.Module;
import dagger.Provides;

@Module
public class RepositoryModule {

    @Provides
    @ApplicationScope
    IDatabaseManager provideDatabaseManager() {
        return new DatabaseManager();
    }

}