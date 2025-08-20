/**
 * @description Interface for OpenAI API chat completions operations
 * @author OpenAI Apex Implementation
 * @version 1.0.0
 */
public interface ChatCompletionsOperations {
    /**
     * @description Create a new chat completion
     * @param params The parameters for creating the chat completion
     * @return ChatCompletion instance
     */
    ChatCompletion create(ChatCompletionCreateParams params);

    /**
     * @description Create a new chat completion with custom request options
     * @param params The parameters for creating the chat completion
     * @param options Custom request options
     * @return ChatCompletion instance
     */
    ChatCompletion create(ChatCompletionCreateParams params, RequestOptions options);
}
