# SocraticAgent Design Document

## Overview
This document describes the design of the SocraticAgent, a sophisticated AI system for a game environment that utilizes a parallel processing architecture. Each state within the agent, known as a ParallelState, operates independently and concurrently, allowing for a dynamic and responsive AI that can adapt to complex scenarios in real-time.

## System Architecture
- **ParallelStates**: The core of the agent's architecture, where each state is an independent process capable of being activated or deactivated based on its action potential.
- **StateProperties**: Individual properties and context for each ParallelState, enabling localized decision-making and actions without direct interference from other states.
- **SessionProperties**: A set of properties that can be shared across ParallelStates, allowing for coordinated actions and information exchange without concurrency issues.
- **Action Potential**: A dynamic value associated with each ParallelState that determines its activation, ensuring the agent can adapt its focus and resources as needed.

## Agent States

The SocraticAgent's functionality is encapsulated within a Parallel State Machine, where each state operates independently and concurrently. The states are activated based on their respective action potentials, allowing the agent to adaptively manage its focus and resources. The states, in their operational sequence, are as follows:

1. **Observe**: Gathers environmental data for informed decision-making.
2. **Orient**: Analyzes the data to understand the situation and identify key elements.
3. **Decide**: Determines the best course of action based on the analysis.
4. **Act**: Executes the chosen actions to influence the game environment.
5. **Learn**: Reviews outcomes to refine strategies and improve future performance.

Each state is designed to function autonomously, with its own set of StateProperties, while also being capable of referencing shared SessionProperties. This structure ensures that the agent can process multiple streams of information and actions simultaneously, adapting to the game environment in real-time.

### Agent States Overview

The SocraticAgent's Parallel State Machine is composed of five distinct states, each with a specific role in the agent's interaction with the game environment. These states are designed to work both independently and collaboratively, ensuring a comprehensive and adaptive AI system.

#### Observe
- **Purpose**: The Observe state is responsible for gathering data from the environment. It serves as the agent's sensory input, collecting information that will inform subsequent states.
- **Reward Handling**: Rewards in this state are given for the timely and accurate collection of relevant data. The agent is incentivized to focus on significant changes or events that require attention.

#### Orient
- **Purpose**: In the Orient state, the agent analyzes the data collected during the Observe state. It contextualizes the information to understand the current situation and identify potential opportunities or threats.
- **Reward Handling**: The agent receives rewards for successful identification of actionable insights and patterns within the data. The complexity and accuracy of the analysis are key factors in the reward mechanism.

#### Decide
- **Purpose**: The Decide state is where the agent selects the most appropriate course of action based on the analysis provided by the Orient state. It involves weighing options and predicting outcomes.
- **Reward Handling**: Decision-making is rewarded based on the quality and effectiveness of the chosen actions. Decisions that lead to positive outcomes yield higher rewards, encouraging the agent to make sound choices.

#### Act
- **Purpose**: The Act state is the execution phase where the agent carries out the actions determined in the Decide state. This state directly affects the game environment.
- **Reward Handling**: Execution is rewarded for both the precision of the actions and their impact on the environment. Successful actions that contribute to achieving the agent's goals are highly rewarded.

#### Learn
- **Purpose**: The Learn state is a reflective phase where the agent assesses the outcomes of its actions and adapts its strategies accordingly. It is crucial for the agent's long-term improvement and adaptability.
- **Reward Handling**: Learning is rewarded based on the agent's ability to improve its performance over time. The agent is encouraged to develop new strategies and avoid repeating ineffective behaviors.

## Parallel State Machine Overview

The **Parallel State Machine** is a pivotal element of the SocraticAgent's framework, facilitating the simultaneous operation of multiple states. This structure is essential for the agent's advanced functionality within game environments, enabling it to handle intricate tasks and make decisions autonomously and precisely.

### Functionality and Dynamics
- **Dynamic State Activation**: States, termed ParallelStates, are activated based on their action potential, a dynamic metric influenced by the current context and environmental conditions.
- **Concurrent Execution**: These states operate in parallel, each in its own process, ensuring multitasking capabilities and swift adaptation to environmental changes.
- **StateProperties and SessionProperties**: Each state has unique StateProperties guiding its behavior, while SessionProperties are shared across states for coordinated action without concurrency issues.
- **Immutable Vector Spaces**: The machine's design prevents simultaneous creation of identical state types, yet allows all states to run concurrently as distinct instances.

### Signal Propagation and Reward System
- **Membrane Dynamics**: Action potentials are akin to signals traversing a membrane, with the membrane's properties affecting signal behavior—mirroring the agent's action potential dynamics.
- **Action Potential Calculation**: The calculation reflects these dynamics, keeping the Observe state alert and transitioning to idle after inactivity.
- **Optimal State Processing**: Reward signals are structured to direct the agent through state processing in an optimal sequence for maximum reward.
- **Atomic Jobs and Events**: Tasks are atomic events, with the Observe state initiating the signal cascade and engaging other states as necessary.

## Multitasking
- **Concurrent FSMs**: Multiple FSMs operate concurrently, each managing different aspects of the agent's behavior.
- **State Synchronization**: The root StateChart synchronizes the states of individual FSMs.
- **Dynamic FSM Management**: The membrane layer dynamically manages FSMs, creating new ones for novel behaviors and pruning those that yield negative rewards.

## Reward Signal
- **Action Potential**: A continuous value that triggers state transitions when exceeding a threshold.
- **Action Threshold**: A predefined threshold that determines when a state change should occur.
- **Behavior Evaluation**: The reward system now includes mechanisms for evaluating new behaviors and their contribution to the agent's overall performance.

## Implementation Steps
1. **Define FSMs**: Create FSMs for different tasks and define their state contexts.
2. **Implement StateChart**: Develop the root StateChart that manages the FSMs.
3. **Integrate with Game Environment**: Ensure the agent's FSMs and StateChart are fully integrated with the game's runtime environment.
4. **Testing and Iteration**: Conduct thorough testing and iterate based on performance and user feedback.
5. **Implement Membrane Layer**: Develop the membrane layer to manage FSM creation and removal based on the agent's learning and behavior evaluation.

## Code Snippets

### StateChart Class
```plaintext
class StateChart {
    Dictionary<string, FSM> fsmDictionary;
    float actionThreshold;
    MembraneLayer membraneLayer;

    StateChart(float threshold) {
        fsmDictionary = new Dictionary<string, FSM>();
        actionThreshold = threshold;
        membraneLayer = new MembraneLayer();
    }
    void updateStateChart() {
        foreach (var fsm in fsmDictionary) {
            float actionPotential = fsm.Value.calculateActionPotential();
            updateState(fsm.Key, actionPotential);
            membraneLayer.manageFSMs(this, stateProperty);
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

### Membrane Layer Class
```plaintext
class MembraneLayer {
    // Logic to evaluate when to create or remove FSMs
    void manageFSMs(StateChart stateChart, StateProperty stateProperty) {
        // Evaluate the need for new FSMs
        if (shouldCreateFSM(stateProperty)) {
            String newFSMKey = createFSM();
            stateChart.addFSM(newFSMKey, new FSM());
        }

        // Remove FSMs that consistently yield negative rewards
        foreach (var fsmKey in stateChart.getFSMKeys()) {
            if (shouldRemoveFSM(fsmKey, stateProperty)) {
                stateChart.removeFSM(fsmKey);
            }
        }
    }

    // ... Additional methods for FSM management ...
}
```

### Main Loop
```plaintext
StateChart stateChart = new StateChart(0.5); // Example threshold

while (gameIsRunning) {
    stateChart.updateStateChart();
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
| -membraneLayer    |
| -stateProperty    |
|-------------------|
| +updateStateChart()|
| +updateState()    |
| +addFSM()         |
| +removeFSM()      |
+-------------------+
         |          |
+-------------------+-------------------+
|   MembraneLayer   |       States      |
|-------------------|-------------------|
|                   | 1. Observe        |
| +manageFSMs()     | 2. Orient         |
|                   | 3. Decide         |
+-------------------| 4. Act            |
         |          | 5. Learn          |
+-------------------|-------------------|
|    StateProperty  | +transitionLogic()|
|-------------------|                   |
| -properties       |                   |
|-------------------+-------------------+
| +setProperty()    |
| +getProperty()    |
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
         |
         +--------------------------------+
```
