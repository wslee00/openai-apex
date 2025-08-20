/**
 * @description Interface for OpenAI API response operations
 * @author OpenAI Apex Implementation
 * @version 1.0.0
 */
public interface ResponseOperations {
    /**
     * @description Create a new response
     * @param params The parameters for creating the response
     * @return Response instance
     */
    Response create(ResponseCreateParams params);

    /**
     * @description Create a new response with custom request options
     * @param params The parameters for creating the response
     * @param options Custom request options
     * @return Response instance
     */
    Response create(ResponseCreateParams params, RequestOptions options);

    /**
     * @description Retrieve a response by ID
     * @param responseId The ID of the response to retrieve
     * @return Response instance
     */
    Response retrieve(String responseId);

    /**
     * @description List all responses with optional parameters
     * @param params Optional parameters for listing responses
     * @return List of Response instances
     */
    List<Response> listAll(ResponseListParams params);

    /**
     * @description List all responses
     * @return List of Response instances
     */
    List<Response> listAll();
}
