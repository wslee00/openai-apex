# OpenAI Apex

An Apex implementation of the OpenAI API client, mimicking the structure and functionality of the [openai-java](https://github.com/openai/openai-java) repository.

## Overview

This project provides a Salesforce Apex implementation of the OpenAI API client that follows the same design patterns and structure as the official Java SDK. The implementation includes:

- **OpenAIClient Interface**: Main interface defining all API operations
- **OpenAIOkHttpClient**: Implementation using Salesforce HTTP callouts
- **Builder Pattern**: Fluent API for creating parameters and options
- **Model Classes**: Apex equivalents of OpenAI API models
- **Operation Interfaces**: Organized API operations by category

## Current Implementation Status

This is the first phase of implementation, focusing on the core structure and the specific functionality requested:

### ✅ Implemented

- **Core Interfaces**: All operation interfaces defined
- **Client Implementation**: Basic client with builder pattern
- **Response Operations**: Full implementation with mock responses
- **Chat Operations**: Structure in place for chat completions
- **Model Classes**: Response, ChatCompletion, and parameter classes
- **Builder Pattern**: Fluent API for all parameter classes
- **Validation**: Basic validation for required fields

### 🔄 Partially Implemented

- **HTTP Callouts**: Currently returns mock responses
- **Environment Configuration**: Placeholder for API key management
- **Additional Operations**: Structure defined but not implemented

### ❌ Not Yet Implemented

- **Actual API Calls**: HTTP callouts to OpenAI API
- **Authentication**: Proper API key management
- **Error Handling**: Comprehensive error handling
- **Rate Limiting**: API rate limiting
- **Streaming**: Support for streaming responses

## Usage Example

The following Apex code is equivalent to the Java example from the openai-java repository:

```apex
// Configures using a named credential and external credential
OpenAIClient client = OpenAIOkHttpClient.fromNamedCredential('OpenAI');

ResponseCreateParams params = ResponseCreateParams.builder()
    .input('Say this is a test')
    .model(ChatModel.GPT_4_1)
    .build();

Response response = client.responses().create(params);
```

## Architecture

### Core Components

1. **OpenAIClient Interface**: Defines the contract for all API operations
2. **OpenAIOkHttpClient**: Main implementation class
3. **Operation Interfaces**: Organized by API category (responses, chat, models, etc.)
4. **Model Classes**: Apex representations of OpenAI API models
5. **Parameter Classes**: Builder-pattern classes for API parameters

### Design Patterns

- **Builder Pattern**: Fluent API for creating complex objects
- **Interface Segregation**: Separate interfaces for different operation types
- **Factory Pattern**: Static factory methods for client creation
- **Validation**: Built-in validation for required parameters

## File Structure

```
force-app/main/default/classes/
├── OpenAIClient.cls                           # Main interface
├── OpenAIOkHttpClient.cls                     # Main implementation
├── ResponseOperations.cls                      # Response operations interface
├── ResponseOperationsImpl.cls                  # Response operations implementation
├── ChatOperations.cls                          # Chat operations interface
├── ChatOperationsImpl.cls                      # Chat operations implementation
├── ChatCompletionsOperations.cls               # Chat completions interface
├── ChatCompletionsOperationsImpl.cls           # Chat completions implementation
├── Response.cls                                # Response model
├── ResponseCreateParams.cls                    # Response parameters with builder
├── ChatCompletion.cls                          # Chat completion model
├── ChatCompletionCreateParams.cls              # Chat completion parameters with builder
├── ChatModel.cls                               # Chat model enum
├── RequestOptions.cls                          # Request options with builder
├── ResponseListParams.cls                      # Response list parameters with builder
├── [Other operation interfaces and implementations]
├── OpenAITest.cls                              # Comprehensive test suite
└── OpenAIExample.cls                           # Usage examples
```

## Testing

The implementation includes a comprehensive test suite (`OpenAITest.cls`) that verifies:

- Client creation and configuration
- Parameter building and validation
- Response creation and structure
- Error handling and validation
- Builder pattern functionality
- Enum values and constants

## Next Steps

### Phase 2: HTTP Implementation

- Implement actual HTTP callouts to OpenAI API
- Add proper authentication and error handling
- Implement rate limiting and retry logic

### Phase 3: Feature Completion

- Complete all operation implementations
- Add streaming support
- Implement comprehensive error handling
- Add logging and monitoring

### Phase 4: Production Ready

- Add comprehensive documentation
- Implement security best practices
- Add performance optimizations
- Create deployment packages

## Configuration

Currently, the implementation uses placeholder values for API configuration. To make it production-ready, you'll need to:

1. **Named Credentials**: Set up Named Credentials for API authentication
2. **Custom Settings**: Configure API keys and organization IDs
3. **Remote Site Settings**: Allow callouts to OpenAI API endpoints
4. **API Permissions**: Ensure proper API access permissions

## Contributing

This is a work in progress. Contributions are welcome, especially for:

- HTTP callout implementation
- Error handling improvements
- Additional API operations
- Testing and documentation

## License

This project follows the same Apache 2.0 license as the openai-java repository.

## References

- [OpenAI Java SDK](https://github.com/openai/openai-java)
- [OpenAI API Documentation](https://platform.openai.com/docs)
- [Salesforce Apex Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/)
