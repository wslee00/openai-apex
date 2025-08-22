/**
 * @description Implementation of ChatOperations interface
 * @author OpenAI Apex Implementation
 * @version 1.0.0
 */
public class ChatOperationsImpl implements ChatOperations {
    private OpenAIClient client;

    public ChatOperationsImpl(OpenAIClient client) {
        this.client = client;
    }

    public ChatCompletionsOperations completions() {
        return new ChatCompletionsOperationsImpl(this.client);
    }
}
