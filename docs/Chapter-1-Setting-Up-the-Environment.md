# Chapter 1: Setting Up the Environment

## 1.1 Introduction
This chapter guides you through the initial setup required to begin working with the Dialogos LLM within the Unity environment. This includes preparing your system, importing necessary packages, and ensuring all prerequisites are met for a smooth development experience.

## 1.2 System Requirements
Ensure your system meets the following requirements:
- Operating System: Windows 11 or later, macOS, or Linux
- Unity Version: 2023.2 LTS or later
- Additional Software: Git for version control

## 1.3 Installing Unity
Unity Hub manages your Unity experience and workflows. Download and install Unity Hub from the official Unity website, and through it, install the recommended Unity Editor version.

> Unity is free for educational and individual use: Unity Download. You can also find Unity's source code on GitHub: Unity-Technologies.

## 1.4 ML-Agents Toolkit Automation
The ML-Agents Toolkit is an open-source project that enables games and simulations to serve as environments for training intelligent agents. We have developed automation scripts to streamline the setup process.

### 1.4.1 Automated Installation
Our scripts simplify the ML-Agents Toolkit installation by:
- **Miniconda Installation**: Installing Miniconda, a minimal installer for conda.
- **Environment Setup**: Setting up a new conda environment tailored for ML-Agents development.

### 1.4.2 Cloning ML-Agents
The automation continues with cloning the ML-Agents repository:
- **Develop Branch**: Cloning the `develop` branch by default.
- **Post Mortem Branches**: Cloning a specific branch for post-mortem projects.

### 1.4.3 Installation Process

The installation process is initiated by running the `setup.bat` script, which automates the setup of the development environment.

#### 1.4.3.1 Initiating Setup with `setup.bat`
To begin setting up your development environment, follow these steps:

- **Step 1**: Open the command prompt and navigate to the `bin` directory where the `setup.bat` script is located.
- **Step 2**: Run the `setup.bat` script to install Conda and configure the environment for ML-Agents development.

```bat
cd bin
setup.bat
```

Executing this script will install Conda and set up the necessary environment variables for the project.

#### 1.4.3.2 Confirming the Environment Setup
After running the `setup.bat` script, ensure that the Conda environment is correctly installed:

- **Step 1**: Use the `conda env list` command to display all Conda environments.
- **Step 2**: Look for the newly created environment in the list to confirm its existence.

```bat
conda env list
```

This will show all available Conda environments, including the one set up for the Dialogos LLM project.

#### 1.4.3.3 Activating the Development Environment
Once the installation is verified, activate the new Conda environment:

- **Step 1**: Use the `conda activate` command followed by the name of your environment.
- **Step 2**: Confirm that the environment is active and ready for development.

```bat
conda activate Dialogos
```

With the environment activated, you're now ready to proceed with ML-Agents development.

> **Note**: The `run.bat` script, which starts the `run.py` Python script, is not covered in this chapter. It is used later in the workflow to initiate the ML-Agents training process.

### 1.4.4 Summary
These automation scripts make setting up the ML-Agents Toolkit hassle-free, allowing you to focus on agent development and training.

## 1.5 High-Level Scripts and Configuration
To facilitate the development process, we provide high-level scripts such as `engine.ini`, `clean.bat`, and `doctor.bat`. These scripts are designed to configure, maintain, and troubleshoot the project environment efficiently.

### 1.5.1 The `engine.ini` Configuration File

The `engine.ini` file serves as the central configuration for the Dialogos LLM project. It specifies preferences, paths, and options for the training environment.

#### Usage
- **Language and Complexity**: Set your language preference and the complexity level of the LLM training.
- **Paths**: Define paths to training folders, results, and model directories.
- **Options**: Configure training instances, encryption, and tokenization options.

#### Advanced Configuration
- **Dataset Properties**: Customize properties related to the dataset such as size, diversity, and sampling rate.
- **Directory Management**: Specify the directory structure for organizing training data, checkpoints, and logs.
- **Training Options**: Set high-level training parameters including batch size, learning rate, and epoch count.

### 1.5.2 The `clean.bat` Script
The `clean.bat` script resets the repository to its original state, removing any temporary files or configurations that were created during development.

#### Capabilities
- **Clean Slate**: Brings the project back to its initial setup.
- **Remove Artifacts**: Clears build artifacts and temporary files.

#### Example Usage
To use the `clean.bat` script, navigate to the root directory of your project in the command prompt and execute the script:

```bat
cd path\to\your\project
clean.bat
```

### 1.5.3 The `doctor.bat` Script
The `doctor.bat` script is a troubleshooting tool that checks the environment for common issues and attempts to resolve them automatically.

#### Features
- **Environment Check**: Verifies the correct setup of the development environment.
- **Dependency Resolution**: Ensures all necessary dependencies are installed and configured.
- **Automated Fixes**: Applies fixes for detected issues.

#### Example Usage
To utilize the `doctor.bat` script, navigate to the root directory of your project in the command prompt and run the script:

```bat
cd path\to\your\project
doctor.bat
```

This script will perform a series of checks to ensure your development environment is correctly set up, all dependencies are properly installed, and will attempt to automatically fix any issues it detects.

### 1.5.4 Summary
These high-level scripts are powerful tools that streamline the development workflow. Users are encouraged to familiarize themselves with these scripts to leverage their full potential. Support for Linux and macOS scripts is coming soon.

## 1.6 Preparing the Unity Scene
A Unity scene is where you design your game or simulation's environment. It's essential to set up the scene correctly for training your agents.

### 1.6.1 Scene Creation
- Navigate to the Unity Editor.
- Create a new scene dedicated to the LLM.

### 1.6.2 Scene Configuration
- Ensure the scene includes all necessary objects and configurations for agent training.
- Set up lighting, physics, and any other components that will interact with your agents.

## 1.7 Creating Agents
Agents are entities within your environment that will learn and perform tasks.

### 1.7.1 Agent Prefabs
- Access the Unity Hierarchy window.
- Instantiate new agent prefabs in the scene.

### 1.7.2 Agent Design
- Design agents with capabilities to perceive the environment and seek rewards.
- Attach sensors and actuators to the agents.

## 1.8 Writing Configuration Files
Configuration files define the training parameters for your agents.

### 1.8.1 trainer_config.yaml
- Create a `trainer_config.yaml` file in your project directory.
- Define hyperparameters such as batch size, buffer size, and learning rate.

### 1.8.2 Python Environment
- Set up a Python environment to work with the ML-Agents toolkit.
- Use the `mlagents-learn` command to initiate training.

## 1.9 Summary
By the end of this chapter, you should have a fully prepared environment within Unity, ready for the development and training of your Dialogos LLM agents. The next chapter will delve into the design and interaction of these agents, setting the stage for their learning journey.
