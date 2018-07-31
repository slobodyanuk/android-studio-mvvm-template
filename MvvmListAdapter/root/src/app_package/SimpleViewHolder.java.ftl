package ${packageName};

import ${applicationPackage}.databinding.ItemHolder${suffix}Binding;
import ${applicationPackage}.ui.base.recycler.BaseViewHolder;

import java.util.List;


public class ${suffix}ViewHolder extends BaseViewHolder implements ${suffix}ItemViewModel.${suffix}ItemViewModelListener {

    private ItemHolder${suffix}Binding itemView;
    private List<${dataClass}> items;

    public ${suffix}ViewHolder(ItemHolder${suffix}Binding itemView, List<${dataClass}> items) {
        super(itemView.getRoot());
        this.itemView = itemView;
        this.items = items;
    }

    @Override
    public void onBind(int position) {
        final ${dataClass} item = items.get(position);
        ${suffix}ItemViewModel viewModel = new ${suffix}ItemViewModel(this, item);
        itemView.setViewModel(viewModel);
        itemView.executePendingBindings();
    }

    @Override
    public void onItemClick(${dataClass} item) {
        
    }
}
