/**
 * @description OpenAI HTTP client implementation using Salesforce HTTP callouts
 * @author OpenAI Apex Implementation
 * @version 1.0.0
 */
public class OpenAIOkHttpClient implements OpenAIClient {
    private String apiKey;
    private String orgId;
    private String projectId;
    private String baseUrl;
    private Boolean responseValidation;
    private Integer timeout;

    public OpenAIOkHttpClient() {
        this.baseUrl = 'callout:OpenAI/v1';
        this.responseValidation = false;
        this.timeout = 60000;
    }

    /**
     * @description Create client from environment variables
     * @return OpenAIOkHttpClient instance
     */
    public static OpenAIOkHttpClient fromNamedCredential(String namedCredential) {
        OpenAIOkHttpClient client = new OpenAIOkHttpClient();
        client.baseUrl = 'callout:' + namedCredential + '/v1';

        return client;
    }

    /**
     * @description Builder class for OpenAIOkHttpClient
     */
    public class Builder {
        private OpenAIOkHttpClient client;

        public Builder() {
            this.client = new OpenAIOkHttpClient();
        }

        /**
         * @description Set API key
         * @param apiKey The OpenAI API key
         * @return This builder instance
         */
        public Builder apiKey(String apiKey) {
            this.client.apiKey = apiKey;
            return this;
        }

        /**
         * @description Set organization ID
         * @param orgId The OpenAI organization ID
         * @return This builder instance
         */
        public Builder orgId(String orgId) {
            this.client.orgId = orgId;
            return this;
        }

        /**
         * @description Set project ID
         * @param projectId The OpenAI project ID
         * @return This builder instance
         */
        public Builder projectId(String projectId) {
            this.client.projectId = projectId;
            return this;
        }

        /**
         * @description Set base URL
         * @param baseUrl The base URL for OpenAI API
         * @return This builder instance
         */
        public Builder baseUrl(String baseUrl) {
            this.client.baseUrl = baseUrl;
            return this;
        }

        /**
         * @description Enable response validation
         * @param validation Whether to validate responses
         * @return This builder instance
         */
        public Builder responseValidation(Boolean validation) {
            this.client.responseValidation = validation;
            return this;
        }

        /**
         * @description Set timeout
         * @param timeout Timeout in milliseconds
         * @return This builder instance
         */
        public Builder timeout(Integer timeout) {
            this.client.timeout = timeout;
            return this;
        }

        /**
         * @description Build the OpenAIOkHttpClient instance
         * @return OpenAIOkHttpClient instance
         */
        public OpenAIOkHttpClient build() {
            if (String.isBlank(this.client.apiKey)) {
                throw new IllegalStateException('API key is required');
            }
            return this.client;
        }
    }

    /**
     * @description Get a new builder instance
     * @return Builder instance
     */
    public static Builder builder() {
        return new Builder();
    }

    // Implementation of OpenAIClient interface methods

    public ResponseOperations responses() {
        return new ResponseOperationsImpl(this);
    }

    public ChatOperations chat() {
        return new ChatOperationsImpl(this);
    }

    public ModelsOperations models() {
        return new ModelsOperationsImpl();
    }

    public FilesOperations files() {
        return new FilesOperationsImpl();
    }

    public FineTuningOperations fineTuning() {
        return new FineTuningOperationsImpl();
    }

    public EmbeddingsOperations embeddings() {
        return new EmbeddingsOperationsImpl();
    }

    public ModerationsOperations moderations() {
        return new ModerationsOperationsImpl();
    }

    public AudioOperations audio() {
        return new AudioOperationsImpl();
    }

    public ImagesOperations images() {
        return new ImagesOperationsImpl();
    }

    public AssistantsOperations assistants() {
        return new AssistantsOperationsImpl();
    }

    public ThreadsOperations threads() {
        return new ThreadsOperationsImpl();
    }

    public RunsOperations runs() {
        return new RunsOperationsImpl();
    }

    public MessagesOperations messages() {
        return new MessagesOperationsImpl();
    }

    public VectorStoresOperations vectorStores() {
        return new VectorStoresOperationsImpl();
    }

    public VectorStoreFilesOperations vectorStoreFiles() {
        return new VectorStoreFilesOperationsImpl();
    }

    public BatchesOperations batches() {
        return new BatchesOperationsImpl();
    }

    public BetaOperations beta() {
        return new BetaOperationsImpl();
    }

    /**
     * @description Get the API key
     * @return API key
     */
    public String getApiKey() {
        return this.apiKey;
    }

    /**
     * @description Get the base URL
     * @return Base URL
     */
    public String getBaseUrl() {
        return this.baseUrl;
    }

    /**
     * @description Get response validation setting
     * @return Response validation setting
     */
    public Boolean getResponseValidation() {
        return this.responseValidation;
    }

    /**
     * @description Get timeout setting
     * @return Timeout in milliseconds
     */
    public Integer getTimeout() {
        return this.timeout;
    }
}
