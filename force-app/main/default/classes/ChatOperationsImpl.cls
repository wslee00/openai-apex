/**
 * @description Implementation of ChatOperations interface
 * @author OpenAI Apex Implementation
 * @version 1.0.0
 */
public class ChatOperationsImpl implements ChatOperations {
    private OpenAIOkHttpClient client;

    public ChatOperationsImpl(OpenAIOkHttpClient client) {
        this.client = client;
    }

    public ChatCompletionsOperations completions() {
        return new ChatCompletionsOperationsImpl(this.client);
    }
}
