/**
 * @description Example class demonstrating OpenAI Apex usage equivalent to Java code
 * @author OpenAI Apex Implementation
 * @version 1.0.0
 */
public class OpenAIExample {
    /**
     * @description Example method that demonstrates the equivalent of the Java code:
     *
     * import com.openai.client.OpenAIClient;
     * import com.openai.client.OpenAIClient;
     * import com.openai.models.ChatModel;
     * import com.openai.models.responses.Response;
     * import com.openai.models.responses.ResponseCreateParams;
     *
     * // Configures using a named credential and external credential
     * OpenAIClient client = OpenAIClient.fromNamedCredential('OpenAI');
     *
     * ResponseCreateParams params = ResponseCreateParams.builder()
     *         .input("Say this is a test")
     *         .model(ChatModel.GPT_4_1)
     *         .build();
     * Response response = client.responses().create(params);
     */
    public static void demonstrateOpenAIUsage() {
        try {
            // Configures using a named credential and external credential
            OpenAIClient client = OpenAIClient.fromNamedCredential('OpenAI');

            ResponseCreateParams params = ResponseCreateParams.builder()
                .input('Say this is a test')
                .model(ChatModel.GPT_4_1)
                .build();

            Response response = client.responses().create(params);

            // Log the response
            System.debug('Response ID: ' + response.id);
            System.debug('Response Model: ' + response.model);
            System.debug('Response Content: ' + response.output[0].content[0].text);
            System.debug('Response Usage: ' + response.usage.total_tokens + ' tokens');
        } catch (Exception e) {
            System.debug('Error: ' + e.getMessage());
            throw e;
        }
    }

    /**
     * @description Example method showing how to use the builder pattern with custom options
     */
    public static void demonstrateBuilderPattern() {
        try {
            // Create client with custom configuration
            OpenAIClient client = OpenAIClient.builder()
                .apiKey('your-custom-api-key')
                .orgId('your-org-id')
                .projectId('your-project-id')
                .responseValidation(true)
                .timeout(30000)
                .build();

            // Create params with additional properties
            ResponseCreateParams params = ResponseCreateParams.builder()
                .input('Custom test input')
                .model(ChatModel.GPT_4)
                .putAdditionalHeader('Custom-Header', 'Custom-Value')
                .putAdditionalQueryParam('custom_param', 'custom_value')
                .putAdditionalBodyProperty('customProperty', 'customValue')
                .build();

            // Create response with custom request options
            RequestOptions options = RequestOptions.builder()
                .responseValidation(true)
                .header('Extra-Header', 'Extra-Value')
                .timeout(45000)
                .build();

            Response response = client.responses().create(params, options);

            System.debug('Custom Response: ' + response.id);
        } catch (Exception e) {
            System.debug('Error: ' + e.getMessage());
            throw e;
        }
    }

    /**
     * @description Example method showing chat completions usage
     */
    public static void demonstrateChatCompletions() {
        try {
            OpenAIClient client = OpenAIClient.fromNamedCredential('OpenAI');

            // Create chat completion params
            ChatCompletionCreateParams params = ChatCompletionCreateParams.builder()
                .model(ChatModel.GPT_4)
                .message(new ChatCompletionCreateParams.Message('user', 'Hello, how are you?'))
                .build();

            // This would call the actual OpenAI API when implemented
            // ChatCompletion completion = client.chat().completions().create(params);

            System.debug('Chat completion params created successfully');
        } catch (Exception e) {
            System.debug('Error: ' + e.getMessage());
            throw e;
        }
    }
}
