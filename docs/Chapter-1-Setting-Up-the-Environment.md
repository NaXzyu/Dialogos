# Chapter 1: Setting Up the Environment

## 1.1 Introduction
In this chapter, we will guide you through the initial setup required to begin working with Dialogos LLM within the Unity environment. This process involves preparing your system, importing necessary packages, and ensuring that all prerequisites are met for a smooth development experience.

## 1.2 System Requirements
Before proceeding, ensure that your system meets the following requirements:
- Operating System: Windows 11 or later, macOS, or Linux
- Unity Version: 2023.2 LTS or later
- Additional Software: Git for version control

## 1.3 Installing Unity
Unity Hub is a gateway to managing your Unity experience and workflows. Download and install Unity Hub from the official Unity website. Through Unity Hub, install the recommended Unity Editor version mentioned above.

> Downloading Unity is free for educational and individual use: https://unity.com/download  Additionally you may Unity's source code on GitHub https://github.com/Unity-Technologies

## 1.4 ML-Agents Toolkit Automation

The ML-Agents Toolkit is an open-source project that enables games and simulations to serve as environments for training intelligent agents. To streamline the setup process, we have developed automation scripts that handle the installation and configuration of the necessary components.

### 1.4.1 Automated Installation
Our automation scripts simplify the installation of the ML-Agents Toolkit by performing the following steps:
- **Miniconda Installation**: The script begins by installing Miniconda, a minimal installer for conda, which is an open-source package management system and environment management system.
- **Environment Setup**: Once Miniconda is installed, the script sets up a new conda environment tailored for ML-Agents development.

### 1.4.2 Cloning ML-Agents
The automation continues with the cloning of the ML-Agents repository:
- **Develop Branch**: By default, the script clones the `develop` branch of the ML-Agents repository, ensuring you have the latest updates and features.
- **Post Mortem Branches**: For projects in post-mortem, the script can be configured to clone a specific branch that reflects the state of the project at that time.

### 1.4.3 Running the Installation
The entire process is executed within a Python environment managed by conda:
- **Conda Python Instance**: The script runs a Python instance using conda to manage dependencies and isolate the project environment.
- **Shell Instance**: Within this Python environment, a shell instance is initiated to execute git commands.
- **Python Program Execution**: The `run.py` Python program is used to clone the ML-Agents repository using git, bypassing the need for OS-specific command-line tools.

### 1.4.4 Summary
With these automation scripts, setting up the ML-Agents Toolkit becomes a hassle-free process, allowing you to focus on developing and training your agents. The next section will delve deeper into the design and interaction of agents within the Unity environment.


## 1.5 Preparing the Unity Scene
A Unity scene is where you design your game or simulation's environment. It's essential to set up the scene correctly for training your agents.

### 1.5.1 Scene Creation
- Navigate to the Unity Editor.
- Create a new scene dedicated to the LLM.

### 1.5.2 Scene Configuration
- Ensure the scene includes all necessary objects and configurations for agent training.
- Set up lighting, physics, and any other components that will interact with your agents.

## 1.6 Creating Agents
Agents are entities within your environment that will learn and perform tasks.

### 1.6.1 Agent Prefabs
- Access the Unity Hierarchy window.
- Instantiate new agent prefabs in the scene.

### 1.6.2 Agent Design
- Design agents with capabilities to perceive the environment and seek rewards.
- Attach sensors and actuators to the agents.

## 1.7 Writing Configuration Files
Configuration files define the training parameters for your agents.

### 1.7.1 trainer_config.yaml
- Create a `trainer_config.yaml` file in your project directory.
- Define hyperparameters such as batch size, buffer size, and learning rate.

### 1.7.2 Python Environment
- Set up a Python environment to work with the ML-Agents toolkit.
- Use the `mlagents-learn` command to initiate training.

## 1.8 Summary
By the end of this chapter, you should have a fully prepared environment within Unity, ready for the development and training of your Dialogos LLM agents. The next chapter will delve into the design and interaction of these agents, setting the stage for their learning journey.
