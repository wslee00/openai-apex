/**
 * @description Parameters for creating OpenAI API responses
 * @author OpenAI Apex Implementation
 * @version 1.0.0
 */
public class ResponseCreateParams {
    @AuraEnabled
    public String input { get; set; }

    @AuraEnabled
    public String model { get; set; }

    @AuraEnabled
    public Map<String, Object> additionalProperties { get; set; }

    @AuraEnabled
    public Map<String, String> additionalHeaders { get; set; }

    @AuraEnabled
    public Map<String, String> additionalQueryParams { get; set; }

    public ResponseCreateParams() {
    }

    /**
     * @description Builder class for ResponseCreateParams
     */
    public class Builder {
        private ResponseCreateParams params;

        public Builder() {
            this.params = new ResponseCreateParams();
        }

        /**
         * @description Set the input text
         * @param input The input text
         * @return This builder instance
         */
        public Builder input(String input) {
            this.params.input = input;
            return this;
        }

        /**
         * @description Set the model
         * @param model The model to use
         * @return This builder instance
         */
        public Builder model(ChatModel model) {
            switch on model {
                when GPT_4_1 {
                    this.params.model = 'gpt-4.1';
                }
                when else {
                    this.params.model = model.name();
                }
            }
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
         * @description Build the ResponseCreateParams instance
         * @return ResponseCreateParams instance
         */
        public ResponseCreateParams build() {
            // Validate required fields
            if (String.isBlank(this.params.input)) {
                throw new IllegalStateException('Input is required');
            }
            if (String.isBlank(this.params.model)) {
                throw new IllegalStateException('Model is required');
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
}
