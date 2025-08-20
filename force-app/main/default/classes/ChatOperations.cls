/**
 * @description Interface for OpenAI API chat operations
 * @author OpenAI Apex Implementation
 * @version 1.0.0
 */
public interface ChatOperations {
    /**
     * @description Access to chat completions API operations
     * @return ChatCompletionsOperations instance
     */
    ChatCompletionsOperations completions();
}
