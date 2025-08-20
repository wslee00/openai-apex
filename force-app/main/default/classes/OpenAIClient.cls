/**
 * @description Interface for OpenAI API client operations
 * @author OpenAI Apex Implementation
 * @version 1.0.0
 */
public interface OpenAIClient {
    /**
     * @description Access to responses API operations
     * @return ResponseOperations instance
     */
    ResponseOperations responses();

    /**
     * @description Access to chat API operations
     * @return ChatOperations instance
     */
    ChatOperations chat();

    /**
     * @description Access to models API operations
     * @return ModelsOperations instance
     */
    ModelsOperations models();

    /**
     * @description Access to files API operations
     * @return FilesOperations instance
     */
    FilesOperations files();

    /**
     * @description Access to fine-tuning API operations
     * @return FineTuningOperations instance
     */
    FineTuningOperations fineTuning();

    /**
     * @description Access to embeddings API operations
     * @return EmbeddingsOperations instance
     */
    EmbeddingsOperations embeddings();

    /**
     * @description Access to moderations API operations
     * @return ModerationsOperations instance
     */
    ModerationsOperations moderations();

    /**
     * @description Access to audio API operations
     * @return AudioOperations instance
     */
    AudioOperations audio();

    /**
     * @description Access to images API operations
     * @return ImagesOperations instance
     */
    ImagesOperations images();

    /**
     * @description Access to assistants API operations
     * @return AssistantsOperations instance
     */
    AssistantsOperations assistants();

    /**
     * @description Access to threads API operations
     * @return ThreadsOperations instance
     */
    ThreadsOperations threads();

    /**
     * @description Access to runs API operations
     * @return RunsOperations instance
     */
    RunsOperations runs();

    /**
     * @description Access to messages API operations
     * @return MessagesOperations instance
     */
    MessagesOperations messages();

    /**
     * @description Access to vector stores API operations
     * @return VectorStoresOperations instance
     */
    VectorStoresOperations vectorStores();

    /**
     * @description Access to vector store files API operations
     * @return VectorStoreFilesOperations instance
     */
    VectorStoreFilesOperations vectorStoreFiles();

    /**
     * @description Access to batches API operations
     * @return BatchesOperations instance
     */
    BatchesOperations batches();

    /**
     * @description Access to beta API operations
     * @return BetaOperations instance
     */
    BetaOperations beta();
}
