package ${packageName}.di;

import com.androidnetworking.gsonparserfactory.GsonParserFactory;

import ${packageName}.data.IApiHelper;
import ${packageName}.data.IDataManager;
import ${packageName}.data.network.ApiHeaders;
import ${packageName}.data.network.ApiHelper;
import ${packageName}.di.scopes.ApplicationScope;

import java.util.concurrent.TimeUnit;

import dagger.Module;
import dagger.Provides;
import okhttp3.OkHttpClient;

@Module
public class RestModule {

    @Provides
    @ApplicationScope
    OkHttpClient defaultOkHttp() {
        return new OkHttpClient().newBuilder()
                .connectTimeout(30, TimeUnit.SECONDS)
                .readTimeout(30, TimeUnit.SECONDS)
                .writeTimeout(30, TimeUnit.SECONDS)
                .build();
    }

    @Provides
    @ApplicationScope
    IApiHelper provideApiHelper(ApiHeaders apiHeaders) {
        return new ApiHelper(apiHeaders);
    }

    @Provides
    @ApplicationScope
    GsonParserFactory gsonParserFactory() {
        return new GsonParserFactory();
    }
}
