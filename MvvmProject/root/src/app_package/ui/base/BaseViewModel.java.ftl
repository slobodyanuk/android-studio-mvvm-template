package ${packageName}.ui.base;

import android.arch.lifecycle.ViewModel;
import android.databinding.ObservableBoolean;
import android.databinding.ObservableField;

<#if generateApiHelper>
import com.androidnetworking.error.ANError;</#if>
import io.reactivex.ObservableTransformer;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.schedulers.Schedulers;
import lombok.Getter;
import lombok.Setter;

<#if generateApiHelper>import static ${packageName}.utils.NetworkUtils.NETWORK_ERROR;</#if>


public abstract class BaseViewModel<N extends BaseNavigator> extends ViewModel {

    public ObservableBoolean isLoading = new ObservableBoolean(false);
    public ObservableField<String> title = new ObservableField<>("");
    public ObservableBoolean toolbarShown = new ObservableBoolean(true);
    public ObservableBoolean backButtonVisible = new ObservableBoolean(false);

    private Disposable disposableSaved;

    @Getter
    @Setter
    private N navigator;

    <#if generateApiHelper>
    protected <U> ObservableTransformer<U, U> loadingDialogTransformer() {
        return upstream -> upstream.doOnSubscribe(disposable -> setLoading(true))
                .doFinally(() -> setLoading(false))
                .doOnEach(object -> setLoading(false))
                .doOnTerminate(() -> setLoading(false))
                .doOnDispose(() -> setLoading(false));
    }

    protected <U> ObservableTransformer<U, U> networkStatusTransformer() {
        return upstream -> upstream.doOnSubscribe(disposable -> {
            if (!isNetworkConnected()) {
                throw new ANError(NETWORK_ERROR);
            }
        });
    }

    protected <U> ObservableTransformer<U, U> compositeDisposableTransformer(CompositeDisposable compositeDisposable) {
        return upstream -> upstream
                .doOnSubscribe(disposable1 -> {
                    this.disposableSaved = disposable1;
                    compositeDisposable.add(this.disposableSaved);
                })
                .doOnTerminate(() -> {
                    if (!compositeDisposable.isDisposed() && this.disposableSaved != null)
                        compositeDisposable.delete(disposableSaved);
                })
                .doOnDispose(() -> {
                    if (!compositeDisposable.isDisposed() && this.disposableSaved != null)
                        compositeDisposable.delete(disposableSaved);
                });
    }

    protected <U> ObservableTransformer<U, U> allTransformers(CompositeDisposable compositeDisposable) {
        return upstream -> upstream
                .compose(compositeDisposableTransformer(compositeDisposable))
                .compose(loadingDialogTransformer())
                .compose(uiSchedulerTransformer())
                .compose(networkStatusTransformer());

    }
    </#if>

    protected <U> ObservableTransformer<U, U> uiSchedulerTransformer() {
        return observable -> observable.subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }


     public void setActivityViewModel(BaseViewModel activityViewModel) {
        this.isLoading = activityViewModel.isLoading;
        this.toolbarShown = activityViewModel.toolbarShown;
        this.backButtonVisible = activityViewModel.backButtonVisible;
        this.title = activityViewModel.title;
    }

    public void onBackClicked() {
        getNavigator().onBackClicked();
    }

    <#if generateApiHelper>
    public boolean isNetworkConnected() {
        return navigator.isNetworkConnected();
    }
    </#if>

    public ObservableBoolean isLoading() {
        return this.isLoading;
    }

    public void setLoading(boolean isLoading) {
        this.isLoading.set(isLoading);
    }

    public ObservableBoolean isToolbarVisible() {
        return toolbarShown;
    }

    public void setToolbarVisible(boolean visible) {
        this.toolbarShown.set(visible);
    }

    public ObservableBoolean isBackButtonVisible() {
        return backButtonVisible;
    }

    public void setBackButtonVisible(boolean backVisible) {
        this.backButtonVisible.set(backVisible);
    }
    public ObservableField<String> getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title.set(title);
    }

    @Override
    public void onCleared() {
        clear();
        super.onCleared();
    }

    public abstract void clear();

}