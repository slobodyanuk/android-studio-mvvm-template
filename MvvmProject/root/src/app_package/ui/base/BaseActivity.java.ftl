package ${packageName}.ui.base;

import dagger.android.support.DaggerAppCompatActivity;


import android.content.Context;
import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.databinding.ViewDataBinding;
import android.os.Bundle;
import android.support.annotation.ColorRes;
import android.support.annotation.LayoutRes;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import android.support.design.widget.Snackbar;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.Toast;

<#if generateApiHelper>
import com.androidnetworking.error.ANError;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import ${packageName}.data.network.ApiError;
import ${packageName}.utils.NetworkUtils;
import javax.net.ssl.HttpsURLConnection;</#if>

import ${packageName}.R;


import lombok.Getter;
import lombok.Setter;
import uk.co.chrisjenx.calligraphy.CalligraphyContextWrapper;
import javax.inject.Inject;

public abstract class BaseActivity<T extends ViewDataBinding, V extends BaseViewModel> extends DaggerAppCompatActivity
        implements BaseNavigator {

<#if generateApiHelper>
    @Inject
    NetworkUtils networkUtils;</#if>

    @Getter
    private T binding;

    private V viewModel;

    public abstract @LayoutRes
    int getLayoutId();

    public abstract int getBindingVariable();

    public abstract V getViewModel();

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        performDataBinding();
    }

    protected void performDataBinding() {
        binding = DataBindingUtil.setContentView(this, getLayoutId());
        this.viewModel = viewModel == null ? getViewModel() : viewModel;
        this.viewModel.setNavigator(this);
        binding.setVariable(getBindingVariable(), viewModel);
        binding.executePendingBindings();
    }

<#if generateApiHelper>
    @Override
    public boolean isNetworkConnected() {
        return networkUtils.isNetworkConnected();
    }</#if>

    @Override
    protected void attachBaseContext(Context newBase) {
        super.attachBaseContext(CalligraphyContextWrapper.wrap(newBase));
    }

    public void addFragment(int containerViewId, Fragment fragment) {
        getSupportFragmentManager().beginTransaction()
                .addToBackStack(fragment.getClass().getName())
                .add(containerViewId, fragment, fragment.getClass().getName())
                .commit();
    }

    public void replaceWithBackStackFragment(int containerViewId, Fragment fragment) {
        getSupportFragmentManager().beginTransaction()
                .addToBackStack(fragment.getClass().getName())
                .replace(containerViewId, fragment, fragment.getClass().getName())
                .commit();
    }

    public void replaceNonBackStackFragment(int containerViewId, Fragment fragment) {
        getSupportFragmentManager().beginTransaction()
                .replace(containerViewId, fragment, fragment.getClass().getName())
                .commit();
    }

    @Override
    public void handleError(Throwable throwable) {
        if (getViewModel() != null) {
            getViewModel().setLoading(false);
        }
        throwable.printStackTrace();
        throwable.getCause();
        <#if generateApiHelper>
        if (throwable instanceof ANError) {
            ANError error = (ANError) throwable;

            if (error.getMessage() != null) {
                switch (error.getMessage()) {
                    case NetworkUtils.NETWORK_ERROR:
                        onError(getString(R.string.error_no_internet_connection));
                        return;
                    default:
                        Log.e("error", "handleError: " + error.getMessage());
                        onError(getString(R.string.error_api_default));
                        return;
                }

            }

            if (error.getErrorBody() == null) {
                onError(getString(R.string.error_api_default));
            } else {
                final GsonBuilder builder = new GsonBuilder().excludeFieldsWithoutExposeAnnotation();
                final Gson gson = builder.create();

                try {
                    ApiError apiError = gson.fromJson(error.getErrorBody(), ApiError.class);

                    if (apiError != null && apiError.getError() != null) {
                        switch (apiError.getError()) {
                            default:
                                onError(apiError.getError());
                        }
                    }
                    Log.e("error", "handleError: " + error.getErrorCode());

                    switch (error.getErrorCode()) {
                        case HttpsURLConnection.HTTP_UNAUTHORIZED:
                        case HttpsURLConnection.HTTP_FORBIDDEN:
                            openActivityOnTokenExpire();
                            break;
                        case HttpsURLConnection.HTTP_INTERNAL_ERROR:
                        case HttpsURLConnection.HTTP_NOT_FOUND:
                            onError(getString(R.string.error_api_default));
                            break;
                    }
                } catch (JsonSyntaxException | NullPointerException e) {
                    onError(getString(R.string.error_api_default));
                }
            }
        } else {</#if>
            onError(getString(R.string.error_api_default));
        <#if generateApiHelper>}</#if>
    }

    @Override
    public void onError(String error) {
        showSnackBarMessage(binding.getRoot(), error, R.color.colorPink);
    }

    @Override
    public void onBackClicked() {
        onBackPressed();
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
    }

    public void showToastMessage(@StringRes int message) {
        Toast.makeText(this, message, Toast.LENGTH_LONG).show();
    }

    public void showToastMessage(String message) {
        Toast.makeText(this, message, Toast.LENGTH_LONG).show();
    }

    public void showSnackBarMessage(View view, String message) {
        Snackbar.make(view, message, Snackbar.LENGTH_LONG).setAction("Action", null).show();
    }

    public void showSnackBarMessage(View view, String message, @ColorRes int textColor) {
        if (view != null) {
            Snackbar snackbar = Snackbar.make(view, message, Snackbar.LENGTH_LONG)
                    .setAction("Action", null);

            FrameLayout frameLayout = (FrameLayout) snackbar.getView();
            int textId = android.support.design.R.id.snackbar_text;
            TextView textView = frameLayout.findViewById(textId);
            textView.setTextColor(getResources().getColor(textColor));

            snackbar.show();
        }
    }
<#if generateApiHelper>
    @Override
    public void openActivityOnTokenExpire() {
        //startActivity(new Intent(this, SplashActivity.class)
        //        .setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP
        //                | Intent.FLAG_ACTIVITY_SINGLE_TOP));
        //finish();
    }</#if>

    @Override
    protected void onDestroy() {
        viewModel.onCleared();
        super.onDestroy();
    }

}