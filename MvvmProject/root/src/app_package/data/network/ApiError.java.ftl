package ${packageName}.data.network;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import lombok.Getter;

public class ApiError {

    @Expose
    @Getter
    @SerializedName("error")
    private String error;

}