# SocraticAgent Design Document

## Overview
This document outlines the design for a SocraticAgent that operates within a game environment. The agent is structured around a dictionary of Finite State Machines (FSMs), each with its own state context, and governed by a root StateChart.

## System Architecture
- **Dictionary of FSMs**: A collection of FSMs, each responsible for handling specific tasks within the agent's operation.
- **State Context**: Each FSM maintains its own state context, allowing for localized decision-making and actions.
- **Root StateChart**: A global class that encapsulates the dictionary of FSMs and manages transitions based on action potentials.

## Agent States
The root StateChart manages the following states:
1. **Observe**: Monitors the environment and gathers data.
2. **Orient**: Analyzes the data to understand the situation.
3. **Decide**: Determines the best course of action.
4. **Act**: Executes the chosen action.

## Multitasking
- **Concurrent FSMs**: Multiple FSMs operate concurrently, each managing different aspects of the agent's behavior.
- **State Synchronization**: The root StateChart synchronizes the states of individual FSMs.

## Reward Signal
- **Action Potential**: A continuous value that triggers state transitions when exceeding a threshold.
- **Action Threshold**: A predefined threshold that determines when a state change should occur.

## Development Tools
- **Unity Hub**: Manages Unity project versions and installations.
- **Visual Studio Code**: Codes the agent's behavior and FSM logic.
- **Windows Tools**: Utilizes built-in Windows tools for debugging and performance monitoring.

## Implementation Steps
1. **Define FSMs**: Create FSMs for different tasks and define their state contexts.
2. **Implement StateChart**: Develop the root StateChart that manages the FSMs.
3. **Integrate with Game Environment**: Ensure the agent's FSMs and StateChart are fully integrated with the game's runtime environment.
4. **Testing and Iteration**: Conduct thorough testing and iterate based on performance and user feedback.

## Code Snippets

### StateChart Class
```plaintext
class StateChart {
    Dictionary<string, FSM> fsmDictionary;
    float actionThreshold;

    StateChart(float threshold) {
        fsmDictionary = new Dictionary<string, FSM>();
        actionThreshold = threshold;
    }
    void updateStateChart() {
        foreach (var fsm in fsmDictionary) {
            float actionPotential = fsm.Value.calculateActionPotential();
            stateChart.updateState(fsm.Key, actionPotential);
        }
    }
    void updateState(string fsmKey, float actionPotential) {
        if (actionPotential > actionThreshold) {
            fsmDictionary[fsmKey].nextState();
        }
    }
}
```

### FSM Class
```plaintext
class FSM {
    State currentState;

    void nextState() {
        // Logic for state transition
    }
}
```

### Main Loop
```plaintext
StateChart stateChart = new StateChart(0.5); // Example threshold

while (gameIsRunning) {
    updateStateChart()
    calculateReward();
}
```

## ASCII Art Class Outline

```
+-------------------+
|    StateChart     |
|-------------------|
| -fsmDictionary    |
| -actionThreshold  |
|-------------------|
| +updateState()    |
+-------------------+
         |
         V
+-------------------+
|        FSM        |
|-------------------|
| -currentState     |
|-------------------|
| +nextState()      |
+-------------------+
```
