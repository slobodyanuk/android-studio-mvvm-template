package ${packageName}.data;

<#if generateApiHelper>
import ${packageName}.data.network.IApiHelper;</#if>
<#if generateRealmHelper>
import ${packageName}.data.database.IDatabaseManager;</#if>

public interface IDataManager<#if generateRealmHelper || generateApiHelper> extends </#if>
	<#if generateRealmHelper && generateApiHelper>IApiHelper, IDatabaseManager<#else><#if generateApiHelper>IApiHelper</#if><#if generateRealmHelper>IDatabaseManager</#if></#if> {
	
}

