package ${packageName}.data.network;

import javax.inject.Inject;
import ${packageName}.data.IApiHelper;
import ${packageName}.di.scopes.ApplicationScope;


@ApplicationScope
public class ApiHelper implements IApiHelper {

	private final ApiHeaders apiHeaders;

	@Inject
    public ApiHelper(ApiHeaders apiHeaders) {
		this.apiHeaders = apiHeaders;
    }

    @Override
    public ApiHeaders getApiHeaders() {
        return apiHeaders;
    }
}