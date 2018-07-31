package ${packageName}.data;

import ${packageName}.data.IDataManager;

<#if generateApiHelper>
import ${packageName}.data.network.IApiHelper;
import ${packageName}.data.network.ApiHeaders;</#if>
<#if generateRealmHelper>
import ${packageName}.data.database.IDatabaseManager;</#if>

import javax.inject.Inject;

public class DataManager implements IDataManager {

<#if generateApiHelper>
    private final IApiHelper apiHelper;</#if>
<#if generateRealmHelper>
    private final IDatabaseManager databaseManager;</#if>

    @Inject
    public DataManager(<#if generateRealmHelper && generateApiHelper>IApiHelper apiHelper, IDatabaseManager databaseManager<#else><#if generateApiHelper>IApiHelper apiHelper</#if><#if generateRealmHelper>IDatabaseManager databaseManager</#if></#if>) {
    <#if generateApiHelper>
        this.apiHelper = apiHelper;</#if>
    <#if generateRealmHelper>
        this.databaseManager = databaseManager;</#if>
    }
	
	<#if generateApiHelper>
    @Override
    public ApiHeaders getApiHeaders() {
        return apiHelper.getApiHeaders();
    }</#if>

}
