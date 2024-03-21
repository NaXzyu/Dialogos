# Minimal Tokenizer Design Document

## Objective
The goal is to create a tokenizer that can accurately identify and categorize tokens in a string as single characters, punctuation, whitespace, words, and sequences of words.

## Data Collection
- **Source**: Describe where the data will be sourced from (e.g., public datasets, self-generated sentences).
- **Size**: Aim for a few thousand diverse sentences to start with.
- **Annotation**: Outline the process for marking tokens and their types in the dataset.

## Model Selection
- **Algorithm**: Soft Actor-Critic (SAC) for its efficiency with continuous action spaces.
- **Representation**: Define how tokenization actions will be represented as continuous values.

## Model Architecture
- **Token Processing**: Unlike traditional transformers that use self-attention mechanisms, our model will process tokens based on a policy learned through SAC. This approach allows for a more focused and potentially simpler model architecture, specifically tailored for the tokenization task.
- **Continuous Actions**: The model will learn to take continuous actions to determine the boundaries between tokens, which differs from the discrete output space typically used in transformer models.
- **Efficiency**: While traditional transformers are powerful and versatile, they can be computationally intensive. Our model aims to be efficient and specialized for the tokenization task.

## Feature Engineering
- **Input Features**: Specify the features that the model will use (e.g., characters, character sequences).

## Training
- **Config Files**: Reference the existing SAC config files.
- **Environment Setup**: Detail the setup of the training environment.
- **Reward Function**: Define the reward function for correct and incorrect tokenization actions.

## Evaluation
- **Validation Set**: Describe the creation of a separate validation set for testing.
- **Metrics**: List the metrics that will be used to evaluate the tokenizer's performance (e.g., accuracy, precision, recall).

## Iteration
- **Improvement Process**: Explain the process for iterating on the model based on evaluation results.

## Deployment
- **Integration**: Discuss how the tokenizer will be integrated into the command console for real-time interaction.

## Next Steps
- **Further Data Collection**: Plan for expanding the dataset.
- **Complexity Increase**: Consider adding more complex sentences to the dataset.
- **Performance Tuning**: Strategies for tuning the model to improve performance.

## Conclusion
Summarize the tokenizer design and the expected outcomes of the project.
