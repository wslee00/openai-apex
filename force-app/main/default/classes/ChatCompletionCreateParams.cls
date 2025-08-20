/**
 * @description Parameters for creating OpenAI API chat completions
 * @author OpenAI Apex Implementation
 * @version 1.0.0
 */
public class ChatCompletionCreateParams {
    @AuraEnabled
    public String model { get; set; }

    @AuraEnabled
    public List<Message> messages { get; set; }

    @AuraEnabled
    public Map<String, Object> additionalProperties { get; set; }

    @AuraEnabled
    public Map<String, String> additionalHeaders { get; set; }

    @AuraEnabled
    public Map<String, String> additionalQueryParams { get; set; }

    public ChatCompletionCreateParams() {
        this.messages = new List<Message>();
        this.additionalProperties = new Map<String, Object>();
        this.additionalHeaders = new Map<String, String>();
        this.additionalQueryParams = new Map<String, String>();
    }

    /**
     * @description Builder class for ChatCompletionCreateParams
     */
    public class Builder {
        private ChatCompletionCreateParams params;

        public Builder() {
            this.params = new ChatCompletionCreateParams();
        }

        /**
         * @description Set the model
         * @param model The model to use
         * @return This builder instance
         */
        public Builder model(ChatModel model) {
            this.params.model = model.name();
            return this;
        }

        /**
         * @description Set the model by string
         * @param model The model name as string
         * @return This builder instance
         */
        public Builder model(String model) {
            this.params.model = model;
            return this;
        }

        /**
         * @description Add a message
         * @param message The message to add
         * @return This builder instance
         */
        public Builder message(Message message) {
            this.params.messages.add(message);
            return this;
        }

        /**
         * @description Add additional header
         * @param key Header key
         * @param value Header value
         * @return This builder instance
         */
        public Builder putAdditionalHeader(String key, String value) {
            this.params.additionalHeaders.put(key, value);
            return this;
        }

        /**
         * @description Add additional query parameter
         * @param key Query parameter key
         * @param value Query parameter value
         * @return This builder instance
         */
        public Builder putAdditionalQueryParam(String key, String value) {
            this.params.additionalQueryParams.put(key, value);
            return this;
        }

        /**
         * @description Add additional body property
         * @param key Property key
         * @param value Property value
         * @return This builder instance
         */
        public Builder putAdditionalBodyProperty(String key, Object value) {
            this.params.additionalProperties.put(key, value);
            return this;
        }

        /**
         * @description Build the ChatCompletionCreateParams instance
         * @return ChatCompletionCreateParams instance
         */
        public ChatCompletionCreateParams build() {
            // Validate required fields
            if (String.isBlank(this.params.model)) {
                throw new IllegalStateException('Model is required');
            }
            if (this.params.messages.isEmpty()) {
                throw new IllegalStateException('At least one message is required');
            }
            return this.params;
        }
    }

    /**
     * @description Get a new builder instance
     * @return Builder instance
     */
    public static Builder builder() {
        return new Builder();
    }

    /**
     * @description Get additional headers
     * @return Map of additional headers
     */
    public Map<String, String> getAdditionalHeaders() {
        return this.additionalHeaders;
    }

    /**
     * @description Get additional query parameters
     * @return Map of additional query parameters
     */
    public Map<String, String> getAdditionalQueryParams() {
        return this.additionalQueryParams;
    }

    /**
     * @description Get additional body properties
     * @return Map of additional body properties
     */
    public Map<String, Object> getAdditionalBodyProperties() {
        return this.additionalProperties;
    }

    /**
     * @description Inner class for messages
     */
    public class Message {
        @AuraEnabled
        public String role { get; set; }

        @AuraEnabled
        public String content { get; set; }

        public Message() {
        }

        public Message(String role, String content) {
            this.role = role;
            this.content = content;
        }
    }
}
