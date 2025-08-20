/**
 * @description Options for customizing API requests
 * @author OpenAI Apex Implementation
 * @version 1.0.0
 */
public class RequestOptions {
    @AuraEnabled
    public Boolean responseValidation { get; set; }

    @AuraEnabled
    public Map<String, String> headers { get; set; }

    @AuraEnabled
    public Integer timeout { get; set; }

    public RequestOptions() {
        this.responseValidation = false;
        this.headers = new Map<String, String>();
        this.timeout = 60000; // Default 60 seconds
    }

    /**
     * @description Builder class for RequestOptions
     */
    public class Builder {
        private RequestOptions options;

        public Builder() {
            this.options = new RequestOptions();
        }

        /**
         * @description Enable response validation
         * @param validation Whether to validate responses
         * @return This builder instance
         */
        public Builder responseValidation(Boolean validation) {
            this.options.responseValidation = validation;
            return this;
        }

        /**
         * @description Add custom header
         * @param key Header key
         * @param value Header value
         * @return This builder instance
         */
        public Builder header(String key, String value) {
            this.options.headers.put(key, value);
            return this;
        }

        /**
         * @description Set timeout in milliseconds
         * @param timeout Timeout in milliseconds
         * @return This builder instance
         */
        public Builder timeout(Integer timeout) {
            this.options.timeout = timeout;
            return this;
        }

        /**
         * @description Build the RequestOptions instance
         * @return RequestOptions instance
         */
        public RequestOptions build() {
            return this.options;
        }
    }

    /**
     * @description Get a new builder instance
     * @return Builder instance
     */
    public static Builder builder() {
        return new Builder();
    }
}
