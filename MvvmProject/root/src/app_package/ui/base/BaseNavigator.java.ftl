package ${packageName}.ui.base;

public interface BaseNavigator {

    void handleError(Throwable throwable);

    void onError(String error);

    <#if generateApiHelper>boolean isNetworkConnected();</#if>

    void onBackClicked();

    <#if generateApiHelper>void openActivityOnTokenExpire();</#if>

}