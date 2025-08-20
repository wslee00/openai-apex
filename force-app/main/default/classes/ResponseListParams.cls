/**
 * @description Parameters for listing OpenAI API responses
 * @author OpenAI Apex Implementation
 * @version 1.0.0
 */
public class ResponseListParams {
    @AuraEnabled
    public Integer maxResults { get; set; }

    @AuraEnabled
    public String after { get; set; }

    @AuraEnabled
    public String before { get; set; }

    public ResponseListParams() {
        this.maxResults = 20; // Default max results
    }

    /**
     * @description Builder class for ResponseListParams
     */
    public class Builder {
        private ResponseListParams params;

        public Builder() {
            this.params = new ResponseListParams();
        }

        /**
         * @description Set the maximum results
         * @param maxResults The maximum number of responses to return
         * @return This builder instance
         */
        public Builder maxResults(Integer maxResults) {
            this.params.maxResults = maxResults;
            return this;
        }

        /**
         * @description Set the after cursor
         * @param after The cursor to start after
         * @return This builder instance
         */
        public Builder after(String after) {
            this.params.after = after;
            return this;
        }

        /**
         * @description Set the before cursor
         * @param before The cursor to start before
         * @return This builder instance
         */
        public Builder before(String before) {
            this.params.before = before;
            return this;
        }

        /**
         * @description Build the ResponseListParams instance
         * @return ResponseListParams instance
         */
        public ResponseListParams build() {
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
}
