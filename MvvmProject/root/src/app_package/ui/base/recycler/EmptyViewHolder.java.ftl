package ${packageName}.ui.base.recycler;

import android.databinding.ObservableBoolean;

import ${packageName}.databinding.LayoutEmptyListBinding;

public class EmptyViewHolder extends BaseViewHolder implements EmptyItemViewModelListener {

    private final ObservableBoolean isEmpty = new ObservableBoolean(false);

    private LayoutEmptyListBinding mBinding;
    private RetryClickListener listener;

    public EmptyViewHolder(LayoutEmptyListBinding binding, RetryClickListener listener) {
        super(binding.getRoot());
        this.mBinding = binding;
        this.listener = listener;
    }

    @Override
    public void onBind(int position) {
        EmptyItemViewModel emptyItemViewModel = new EmptyItemViewModel(this);
        mBinding.setViewModel(emptyItemViewModel);
    }

    @Override
    public void onRetryClick() {
        listener.onRetryClick();
    }

    public void setEmpty(boolean isEmpty){
        this.isEmpty.set(isEmpty);
    }

    public ObservableBoolean getEmpty() {
        return isEmpty;
    }
}