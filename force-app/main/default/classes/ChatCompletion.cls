/**
 * @description Model class for OpenAI API chat completion
 * @author OpenAI Apex Implementation
 * @version 1.0.0
 */
public class ChatCompletion {
    @AuraEnabled
    public String id { get; set; }

    @AuraEnabled
    public String objectX { get; set; }

    @AuraEnabled
    public Long created { get; set; }

    @AuraEnabled
    public String model { get; set; }

    @AuraEnabled
    public List<Choice> choices { get; set; }

    @AuraEnabled
    public Usage usage { get; set; }

    @AuraEnabled
    public Map<String, Object> additionalProperties { get; set; }

    public ChatCompletion() {
        this.choices = new List<Choice>();
        this.additionalProperties = new Map<String, Object>();
    }

    /**
     * @description Get additional properties
     * @return Map of additional properties
     */
    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    /**
     * @description Set additional property
     * @param key Property key
     * @param value Property value
     */
    public void setAdditionalProperty(String key, Object value) {
        this.additionalProperties.put(key, value);
    }

    /**
     * @description Validate the response
     * @return This ChatCompletion instance
     */
    public ChatCompletion validate() {
        // TODO: Implement validation logic
        return this;
    }

    /**
     * @description Inner class for completion choices
     */
    public class Choice {
        @AuraEnabled
        public Integer index { get; set; }

        @AuraEnabled
        public Message message { get; set; }

        @AuraEnabled
        public String finishReason { get; set; }

        public Choice() {
            this.message = new Message();
        }
    }

    /**
     * @description Inner class for messages
     */
    public class Message {
        @AuraEnabled
        public String role { get; set; }

        @AuraEnabled
        public String content { get; set; }

        @AuraEnabled
        public List<ToolCall> toolCalls { get; set; }

        public Message() {
            this.toolCalls = new List<ToolCall>();
        }
    }

    /**
     * @description Inner class for tool calls
     */
    public class ToolCall {
        @AuraEnabled
        public String id { get; set; }

        @AuraEnabled
        public String type { get; set; }

        @AuraEnabled
        public Function function { get; set; }

        public ToolCall() {
            this.function = new Function();
        }
    }

    /**
     * @description Inner class for functions
     */
    public class Function {
        @AuraEnabled
        public String name { get; set; }

        @AuraEnabled
        public String arguments { get; set; }
    }

    /**
     * @description Inner class for usage statistics
     */
    public class Usage {
        @AuraEnabled
        public Integer promptTokens { get; set; }

        @AuraEnabled
        public Integer completionTokens { get; set; }

        @AuraEnabled
        public Integer totalTokens { get; set; }
    }
}
