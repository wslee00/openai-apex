/**
 * @description Model class for OpenAI API response
 * @author OpenAI Apex Implementation
 * @version 1.0.0
 */
public class Response {
    @AuraEnabled
    public String id { get; set; }

    public String objectX { get; set; }

    @AuraEnabled
    public Long created_at { get; set; }

    @AuraEnabled
    public String status { get; set; }

    @AuraEnabled
    public Boolean background { get; set; }

    @AuraEnabled
    public String error { get; set; }

    @AuraEnabled
    public String incomplete_details { get; set; }

    @AuraEnabled
    public String instructions { get; set; }

    @AuraEnabled
    public Integer max_output_tokens { get; set; }

    @AuraEnabled
    public Integer max_tool_calls { get; set; }

    @AuraEnabled
    public String model { get; set; }

    @AuraEnabled
    public List<Output> output { get; set; }

    @AuraEnabled
    public Boolean parallel_tool_calls { get; set; }

    @AuraEnabled
    public String previous_response_id { get; set; }

    @AuraEnabled
    public String prompt_cache_key { get; set; }

    @AuraEnabled
    public Reasoning reasoning { get; set; }

    @AuraEnabled
    public String safety_identifier { get; set; }

    @AuraEnabled
    public String service_tier { get; set; }

    @AuraEnabled
    public Boolean store { get; set; }

    @AuraEnabled
    public Decimal temperature { get; set; }

    @AuraEnabled
    public Text text { get; set; }

    @AuraEnabled
    public String tool_choice { get; set; }

    @AuraEnabled
    public List<Object> tools { get; set; }

    @AuraEnabled
    public Integer top_logprobs { get; set; }

    @AuraEnabled
    public Decimal top_p { get; set; }

    @AuraEnabled
    public String truncation { get; set; }

    @AuraEnabled
    public Usage usage { get; set; }

    @AuraEnabled
    public String user { get; set; }

    @AuraEnabled
    public Map<String, Object> metadata { get; set; }

    @AuraEnabled
    public Map<String, Object> additionalProperties { get; set; }

    public Response() {
        this.output = new List<Output>();
        this.tools = new List<Object>();
        this.metadata = new Map<String, Object>();
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
     * @return This Response instance
     */
    public Response validate() {
        // TODO: Implement validation logic
        return this;
    }

    /**
     * @description Inner class for response output
     */
    public class Output {
        @AuraEnabled
        public String id { get; set; }

        @AuraEnabled
        public String type { get; set; }

        @AuraEnabled
        public String status { get; set; }

        @AuraEnabled
        public List<Content> content { get; set; }

        @AuraEnabled
        public String role { get; set; }

        public Output() {
            this.content = new List<Content>();
        }
    }

    /**
     * @description Inner class for content
     */
    public class Content {
        @AuraEnabled
        public String type { get; set; }

        @AuraEnabled
        public List<Object> annotations { get; set; }

        @AuraEnabled
        public List<Object> logprobs { get; set; }

        @AuraEnabled
        public String text { get; set; }

        public Content() {
            this.annotations = new List<Object>();
            this.logprobs = new List<Object>();
        }
    }

    /**
     * @description Inner class for reasoning
     */
    public class Reasoning {
        @AuraEnabled
        public String effort { get; set; }

        @AuraEnabled
        public String summary { get; set; }
    }

    /**
     * @description Inner class for text configuration
     */
    public class Text {
        @AuraEnabled
        public Format format { get; set; }

        @AuraEnabled
        public String verbosity { get; set; }

        public Text() {
            this.format = new Format();
        }
    }

    /**
     * @description Inner class for format
     */
    public class Format {
        @AuraEnabled
        public String type { get; set; }
    }

    /**
     * @description Inner class for usage statistics
     */
    public class Usage {
        @AuraEnabled
        public Integer input_tokens { get; set; }

        @AuraEnabled
        public InputTokensDetails input_tokens_details { get; set; }

        @AuraEnabled
        public Integer output_tokens { get; set; }

        @AuraEnabled
        public OutputTokensDetails output_tokens_details { get; set; }

        @AuraEnabled
        public Integer total_tokens { get; set; }

        public Usage() {
            this.input_tokens_details = new InputTokensDetails();
            this.output_tokens_details = new OutputTokensDetails();
        }
    }

    /**
     * @description Inner class for input tokens details
     */
    public class InputTokensDetails {
        @AuraEnabled
        public Integer cached_tokens { get; set; }
    }

    /**
     * @description Inner class for output tokens details
     */
    public class OutputTokensDetails {
        @AuraEnabled
        public Integer reasoning_tokens { get; set; }
    }
}
