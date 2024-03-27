# SocraticAgent Design Document

## Overview
This document presents the design for a SocraticAgent within a game environment. The agent utilizes a statechart architecture to manage complex, multitasking behaviors and interacts with the game through an emulated keyboard interface.

## System Architecture
- **Statechart Architecture**: Enables concurrent state activations for multitasking.
- **Emulated Keyboard Interaction**: Allows the agent to perform actions within the game environment as if pressing keys on a keyboard.
- **Observation of Console Buffer Logs**: Monitors and processes in-game console buffer logs in real-time.

## Agent States
The statechart consists of states aligned with the OODA loop:
1. **Observe**: Monitors the console buffer for new entries.
2. **Orient**: Analyzes the observed data to understand the current context.
3. **Decide**: Determines the best course of action based on the analysis.
4. **Act**: Executes the chosen action, such as responding to commands or updating the game state.

## Multitasking
- **Parallel Processing**: Handles multiple tasks simultaneously, with each state capable of running in parallel.
- **State Synchronization**: Communicates and synchronizes between states to ensure coherent behavior.

## Reward Signal
- **Gradient Array**: An array of gradients represents different aspects of the agent's performance.
- **Scaling and Combination**: Gradients are scaled according to their importance and combined into a single reward value.
- **AddReward Invocation**: The `AddReward` function is called with the combined reward value to reinforce the agent's learning.

## Development Tools
- **Unity Hub**: Manages Unity project versions and installations.
- **Visual Studio Code**: Codes the agent's behavior and statechart logic.
- **Windows Tools**: Utilizes built-in Windows tools for debugging and performance monitoring.

## Implementation Steps
1. **Define Observation Space**: Includes console buffer logs and game state information.
2. **Set Up Statechart**: Implements the statechart with defined states and transitions.
3. **Program Reward System**: Creates the gradient array and logic for scaling and combining gradients.
4. **Integrate with Game Environment**: Ensures the agent's statechart and reward system are fully integrated with the game's runtime environment.
5. **Testing and Iteration**: Conducts thorough testing and iterates based on performance and user feedback.

## Pseudocode for SocraticAgent Statechart

```plaintext
// Define the states of the statechart
enum State {
    OBSERVE,
    ORIENT,
    DECIDE,
    ACT
}

// Initialize the statechart with the OBSERVE state as the starting point
State currentState = State.OBSERVE;

// Define the agent's behavior in each state
function updateAgent() {
    switch (currentState) {
        case OBSERVE:
            // Code to observe the console buffer logs
            currentState = State.ORIENT;
            break;
        case ORIENT:
            // Code to analyze the observed data
            currentState = State.DECIDE;
            break;
        case DECIDE:
            // Code to decide on the best course of action
            currentState = State.ACT;
            break;
        case ACT:
            // Code to execute the chosen action via emulated keyboard
            handleActState();
            break;
    }
}

// Function to handle the ACT state with emulated keyboard output
function handleActState() {
    char keyToPress = decideKeyToPress();
    emulateKeyPress(keyToPress);
    currentState = State.OBSERVE;
}

// Main loop to update the agent, running at 60 fps
while (gameIsRunning) {
    updateAgent();
    calculateReward();
}
```
