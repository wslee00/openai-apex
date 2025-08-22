/**
 * @description HTTP Callout Mock for OpenAI API testing
 * @author OpenAI Apex Implementation
 * @version 1.0.0
 */
@IsTest
public class OpenAIMockHttpCallout implements HttpCalloutMock {
    /**
     * @description Respond to HTTP callouts with mock data
     * @param request The HTTP request
     * @return HttpResponse with mock data
     */
    public HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setStatus('OK');
        response.setHeader('Content-Type', 'application/json');

        // Mock response based on the endpoint
        if (request.getEndpoint().contains('/responses')) {
            response.setBody(getMockResponseBody());
        } else if (request.getEndpoint().contains('/chat/completions')) {
            response.setBody(getMockChatCompletionBody());
        } else if (request.getEndpoint().contains('/embeddings')) {
            response.setBody(getMockEmbeddingsBody());
        } else {
            // Default mock response
            response.setBody('{"error": "Unknown endpoint"}');
        }

        return response;
    }

    /**
     * @description Get mock response body for /responses endpoint
     * @return JSON string representing a mock Response object
     */
    private String getMockResponseBody() {
        Map<String, Object> mockResponse = new Map<String, Object>();
        mockResponse.put('id', 'resp_' + String.valueOf(Datetime.now().getTime()));
        mockResponse.put('object', 'response');
        mockResponse.put('created_at', Datetime.now().getTime());
        mockResponse.put('status', 'completed');
        mockResponse.put('background', false);
        mockResponse.put('model', 'GPT_4_1');

        // Mock output
        List<Map<String, Object>> outputs = new List<Map<String, Object>>();
        Map<String, Object> output = new Map<String, Object>();
        output.put('id', 'out_' + String.valueOf(Datetime.now().getTime()));
        output.put('type', 'text');
        output.put('status', 'completed');
        output.put('role', 'assistant');

        List<Map<String, Object>> contents = new List<Map<String, Object>>();
        Map<String, Object> content = new Map<String, Object>();
        content.put('type', 'text');
        content.put('text', 'This is a test response for your input.');
        contents.add(content);
        output.put('content', contents);

        outputs.add(output);
        mockResponse.put('output', outputs);

        // Mock usage
        Map<String, Object> usage = new Map<String, Object>();
        usage.put('input_tokens', 10);
        usage.put('output_tokens', 15);
        usage.put('total_tokens', 25);

        Map<String, Object> inputTokensDetails = new Map<String, Object>();
        inputTokensDetails.put('cached_tokens', 0);
        usage.put('input_tokens_details', inputTokensDetails);

        Map<String, Object> outputTokensDetails = new Map<String, Object>();
        outputTokensDetails.put('reasoning_tokens', 5);
        usage.put('output_tokens_details', outputTokensDetails);

        mockResponse.put('usage', usage);

        return JSON.serialize(mockResponse);
    }

    /**
     * @description Get mock response body for /chat/completions endpoint
     * @return JSON string representing a mock chat completion response
     */
    private String getMockChatCompletionBody() {
        Map<String, Object> mockResponse = new Map<String, Object>();
        mockResponse.put('id', 'chatcmpl_' + String.valueOf(Datetime.now().getTime()));
        mockResponse.put('object', 'chat.completion');
        mockResponse.put('created', Datetime.now().getTime());
        mockResponse.put('model', 'gpt-4');

        List<Map<String, Object>> choices = new List<Map<String, Object>>();
        Map<String, Object> choice = new Map<String, Object>();
        choice.put('index', 0);
        choice.put('finish_reason', 'stop');

        Map<String, Object> message = new Map<String, Object>();
        message.put('role', 'assistant');
        message.put('content', 'Hello! How can I help you today?');
        choice.put('message', message);

        choices.add(choice);
        mockResponse.put('choices', choices);

        Map<String, Object> usage = new Map<String, Object>();
        usage.put('prompt_tokens', 10);
        usage.put('completion_tokens', 15);
        usage.put('total_tokens', 25);
        mockResponse.put('usage', usage);

        return JSON.serialize(mockResponse);
    }

    /**
     * @description Get mock response body for /embeddings endpoint
     * @return JSON string representing a mock embeddings response
     */
    private String getMockEmbeddingsBody() {
        Map<String, Object> mockResponse = new Map<String, Object>();
        mockResponse.put('object', 'list');
        mockResponse.put('data', new List<Object>());
        mockResponse.put('model', 'text-embedding-ada-002');

        Map<String, Object> usage = new Map<String, Object>();
        usage.put('prompt_tokens', 10);
        usage.put('total_tokens', 10);
        mockResponse.put('usage', usage);

        return JSON.serialize(mockResponse);
    }
}
