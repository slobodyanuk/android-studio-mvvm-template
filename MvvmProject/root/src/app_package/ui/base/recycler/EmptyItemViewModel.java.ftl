package ${packageName}.ui.base.recycler;

public class EmptyItemViewModel {

    private EmptyItemViewModelListener emptyViewHolder;

    public EmptyItemViewModel(EmptyItemViewModelListener emptyViewHolder) {
        this.emptyViewHolder = emptyViewHolder;
    }

    public void onRetryClick(){
        emptyViewHolder.onRetryClick();
    }
}