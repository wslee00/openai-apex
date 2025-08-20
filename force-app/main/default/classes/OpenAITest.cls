/**
 * @description Test class for OpenAI Apex implementation
 * @author OpenAI Apex Implementation
 * @version 1.0.0
 */
@IsTest
public class OpenAITest {
    @IsTest
    static void testOpenAIClientCreation() {
        // Test the equivalent of the Java code:
        // OpenAIClient client = OpenAIOkHttpClient.fromEnv();

        OpenAIClient client = OpenAIOkHttpClient.fromEnv();

        // Verify client is created
        System.assertNotEquals(null, client, 'Client should not be null');
        System.assert(client instanceof OpenAIOkHttpClient, 'Client should be instance of OpenAIOkHttpClient');
    }

    @IsTest
    static void testResponseCreation() {
        // Test the equivalent of the Java code:
        // ResponseCreateParams params = ResponseCreateParams.builder()
        //     .input("Say this is a test")
        //     .model(ChatModel.GPT_4_1)
        //     .build();

        ResponseCreateParams params = ResponseCreateParams.builder()
            .input('Say this is a test')
            .model(ChatModel.GPT_4_1)
            .build();

        // Verify params are created correctly
        System.assertNotEquals(null, params, 'Params should not be null');
        System.assertEquals('Say this is a test', params.input, 'Input should match');
        System.assertEquals('GPT_4_1', params.model, 'Model should match');
    }

    @IsTest
    static void testResponseCreationWithStringModel() {
        // Test creating params with string model
        ResponseCreateParams params = ResponseCreateParams.builder().input('Test input').model('gpt-4').build();

        // Verify params are created correctly
        System.assertNotEquals(null, params, 'Params should not be null');
        System.assertEquals('Test input', params.input, 'Input should match');
        System.assertEquals('gpt-4', params.model, 'Model should match');
    }

    @IsTest
    static void testResponseCreationWithAdditionalProperties() {
        // Test creating params with additional properties
        ResponseCreateParams params = ResponseCreateParams.builder()
            .input('Test input')
            .model(ChatModel.GPT_4)
            .putAdditionalHeader('Custom-Header', 'Custom-Value')
            .putAdditionalQueryParam('custom_param', 'custom_value')
            .putAdditionalBodyProperty('customProperty', 'customValue')
            .build();

        // Verify additional properties are set
        System.assertEquals(
            'Custom-Value',
            params.getAdditionalHeaders().get('Custom-Header'),
            'Custom header should be set'
        );
        System.assertEquals(
            'custom_value',
            params.getAdditionalQueryParams().get('custom_param'),
            'Custom query param should be set'
        );
        System.assertEquals(
            'customValue',
            params.getAdditionalBodyProperties().get('customProperty'),
            'Custom body property should be set'
        );
    }

    @IsTest
    static void testResponseCreationValidation() {
        // Test validation - should throw exception for missing input
        try {
            ResponseCreateParams params = ResponseCreateParams.builder().model(ChatModel.GPT_4).build();
            System.assert(false, 'Should have thrown exception for missing input');
        } catch (IllegalStateException e) {
            System.assertEquals('Input is required', e.getMessage(), 'Exception message should match');
        }

        // Test validation - should throw exception for missing model
        try {
            ResponseCreateParams params = ResponseCreateParams.builder().input('Test input').build();
            System.assert(false, 'Should have thrown exception for missing model');
        } catch (IllegalStateException e) {
            System.assertEquals('Model is required', e.getMessage(), 'Exception message should match');
        }
    }

    @IsTest
    static void testOpenAIClientBuilder() {
        // Test the builder pattern
        OpenAIOkHttpClient client = OpenAIOkHttpClient.builder()
            .apiKey('test-api-key')
            .orgId('test-org-id')
            .projectId('test-project-id')
            .baseUrl('https://test-api.openai.com/v1')
            .responseValidation(true)
            .timeout(30000)
            .build();

        // Verify client properties
        System.assertEquals('test-api-key', client.getApiKey(), 'API key should match');
        System.assertEquals('https://test-api.openai.com/v1', client.getBaseUrl(), 'Base URL should match');
        System.assertEquals(true, client.getResponseValidation(), 'Response validation should match');
        System.assertEquals(30000, client.getTimeout(), 'Timeout should match');
    }

    @IsTest
    static void testOpenAIClientBuilderValidation() {
        // Test validation - should throw exception for missing API key
        try {
            OpenAIOkHttpClient client = OpenAIOkHttpClient.builder().orgId('test-org-id').build();
            System.assert(false, 'Should have thrown exception for missing API key');
        } catch (IllegalStateException e) {
            System.assertEquals('API key is required', e.getMessage(), 'Exception message should match');
        }
    }

    @IsTest
    static void testResponseOperations() {
        // Test the equivalent of the Java code:
        // Response response = client.responses().create(params);

        OpenAIClient client = OpenAIOkHttpClient.fromEnv();
        ResponseCreateParams params = ResponseCreateParams.builder()
            .input('Say this is a test')
            .model(ChatModel.GPT_4_1)
            .build();

        Response response = client.responses().create(params);

        // Verify response is created
        System.assertNotEquals(null, response, 'Response should not be null');
        System.assertNotEquals(null, response.id, 'Response ID should not be null');
        System.assertEquals('response', response.objectX, 'Response object should match');
        System.assertEquals('GPT_4_1', response.model, 'Response model should match');
        System.assertNotEquals(null, response.choices, 'Response choices should not be null');
        System.assertEquals(1, response.choices.size(), 'Response should have one choice');
        System.assertNotEquals(null, response.usage, 'Response usage should not be null');
    }

    @IsTest
    static void testChatOperations() {
        // Test chat operations
        OpenAIClient client = OpenAIOkHttpClient.fromEnv();

        // Verify chat operations are accessible
        System.assertNotEquals(null, client.chat(), 'Chat operations should not be null');
        System.assertNotEquals(null, client.chat().completions(), 'Chat completions should not be null');
    }

    @IsTest
    static void testChatCompletionCreateParams() {
        // Test chat completion params
        ChatCompletionCreateParams params = ChatCompletionCreateParams.builder()
            .model(ChatModel.GPT_4)
            .message(new ChatCompletionCreateParams.Message('user', 'Hello, how are you?'))
            .build();

        // Verify params are created correctly
        System.assertNotEquals(null, params, 'Params should not be null');
        System.assertEquals('GPT_4', params.model, 'Model should match');
        System.assertEquals(1, params.messages.size(), 'Should have one message');
        System.assertEquals('user', params.messages[0].role, 'Message role should match');
        System.assertEquals('Hello, how are you?', params.messages[0].content, 'Message content should match');
    }

    @IsTest
    static void testChatCompletionCreateParamsValidation() {
        // Test validation - should throw exception for missing model
        try {
            ChatCompletionCreateParams params = ChatCompletionCreateParams.builder()
                .message(new ChatCompletionCreateParams.Message('user', 'Hello'))
                .build();
            System.assert(false, 'Should have thrown exception for missing model');
        } catch (IllegalStateException e) {
            System.assertEquals('Model is required', e.getMessage(), 'Exception message should match');
        }

        // Test validation - should throw exception for missing messages
        try {
            ChatCompletionCreateParams params = ChatCompletionCreateParams.builder().model(ChatModel.GPT_4).build();
            System.assert(false, 'Should have thrown exception for missing messages');
        } catch (IllegalStateException e) {
            System.assertEquals('At least one message is required', e.getMessage(), 'Exception message should match');
        }
    }

    @IsTest
    static void testRequestOptions() {
        // Test request options
        RequestOptions options = RequestOptions.builder()
            .responseValidation(true)
            .header('Custom-Header', 'Custom-Value')
            .timeout(45000)
            .build();

        // Verify options are set correctly
        System.assertEquals(true, options.responseValidation, 'Response validation should match');
        System.assertEquals('Custom-Value', options.headers.get('Custom-Header'), 'Custom header should be set');
        System.assertEquals(45000, options.timeout, 'Timeout should match');
    }

    @IsTest
    static void testResponseListParams() {
        // Test response list params
        ResponseListParams params = ResponseListParams.builder()
            .maxResults(50)
            .after('cursor_after')
            .before('cursor_before')
            .build();

        // Verify params are set correctly
        System.assertEquals(50, params.maxResults, 'Max results should match');
        System.assertEquals('cursor_after', params.after, 'After cursor should match');
        System.assertEquals('cursor_before', params.before, 'Before cursor should match');
    }

    @IsTest
    static void testChatModelEnum() {
        // Test chat model enum values
        System.assertEquals('GPT_4_1', ChatModel.GPT_4_1.name(), 'GPT_4_1 enum value should match');
        System.assertEquals('GPT_4', ChatModel.GPT_4.name(), 'GPT_4 enum value should match');
        System.assertEquals('GPT_4_TURBO', ChatModel.GPT_4_TURBO.name(), 'GPT_4_TURBO enum value should match');
        System.assertEquals('GPT_3_5_TURBO', ChatModel.GPT_3_5_TURBO.name(), 'GPT_3_5_TURBO enum value should match');
        System.assertEquals('GPT_4O', ChatModel.GPT_4O.name(), 'GPT_4O enum value should match');
        System.assertEquals('GPT_4O_MINI', ChatModel.GPT_4O_MINI.name(), 'GPT_4O_MINI enum value should match');
    }
}
