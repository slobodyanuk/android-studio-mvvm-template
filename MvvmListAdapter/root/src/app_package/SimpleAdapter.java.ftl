package ${packageName};

import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.ViewGroup;

import ${applicationPackage}.databinding.ItemHolder${suffix}Binding;
import ${applicationPackage}.databinding.LayoutEmptyListBinding;
import ${applicationPackage}.ui.base.recycler.BaseViewHolder;
import ${applicationPackage}.ui.base.recycler.EmptyViewHolder;
import ${applicationPackage}.ui.base.recycler.RetryClickListener;
import ${applicationPackage}.ui.base.recycler.RecyclerConstants;

import java.util.List;

import javax.inject.Inject;

import lombok.Setter;

public class ${adapterClass} extends RecyclerView.Adapter<BaseViewHolder> {

    private List<${dataClass}> ${dataName};

    private RetryClickListener retryClickListener;

    @Inject
    public ${adapterClass}(List<${dataClass}> ${dataName}) {
        this.${dataName} = ${dataName};
    }

    @Override
    public int getItemViewType(int position) {
        return (${dataName} != null && !${dataName}.isEmpty())
                ? RecyclerConstants.RECYCLER_TYPE_NORMAL
                : RecyclerConstants.RECYCLER_TYPE_EMPTY;
    }

    public void setRetryListener(RetryClickListener listener){
        this.retryClickListener = listener;
    }

    @NonNull
    @Override
    public BaseViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        switch (viewType) {
            case RecyclerConstants.RECYCLER_TYPE_NORMAL:
                ItemHolder${suffix}Binding binding = ItemHolder${suffix}Binding
                        .inflate(LayoutInflater.from(parent.getContext()), parent, false);
                return new ${suffix}ViewHolder(binding, ${dataName});
            case RecyclerConstants.RECYCLER_TYPE_EMPTY:
            default:
                LayoutEmptyListBinding emptyListBinding = LayoutEmptyListBinding
                        .inflate(LayoutInflater.from(parent.getContext()), parent, false);
                return new EmptyViewHolder(emptyListBinding, retryClickListener);
        }
    }

    @Override
    public void onBindViewHolder(@NonNull BaseViewHolder holder, int position) {
        holder.onBind(position);
    }

    public void updateData(List<${dataClass}> ${dataName}) {
        this.${dataName}.addAll(${dataName});
        notifyDataSetChanged();
    }

    @Override
    public int getItemCount() {
        if (${dataName} != null && ${dataName}.size() > 0) {
            return ${dataName}.size();
        } else {
            return 1;
        }
    }

    public void clearItems() {
        this.${dataName}.clear();
    }
}