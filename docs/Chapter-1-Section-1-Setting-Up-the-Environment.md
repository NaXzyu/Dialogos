# Chapter 1: Section 1: Setting Up the Environment

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

### 1.4.4 Example Console Output
The following text output is from a successful run of the setup.bat:

```
Downloading miniconda...

  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 78.1M  100 78.1M    0     0  27.5M      0  0:00:02  0:00:02 --:--:-- 27.5M

Installing miniconda...

Creating the conda environment...
Channels:
 - conda-forge
 - defaults
Platform: win-64
Collecting package metadata (repodata.json): ...working... done
Solving environment: ...working... done
Preparing transaction: ...working... done
Verifying transaction: ...working... done
Executing transaction: ...working... done
Channels:
 - conda-forge
 - defaults
Platform: win-64
Collecting package metadata (repodata.json): ...working... done
Solving environment: ...working... done
Preparing transaction: ...working... done
Verifying transaction: ...working... done
Executing transaction: ...working... done
no change     C:\Users\User\Unity\Dialogos\miniconda\Scripts\conda.exe
no change     C:\Users\User\Unity\Dialogos\miniconda\Scripts\conda-env.exe
no change     C:\Users\User\Unity\Dialogos\miniconda\Scripts\conda-script.py
no change     C:\Users\User\Unity\Dialogos\miniconda\Scripts\conda-env-script.py
no change     C:\Users\User\Unity\Dialogos\miniconda\condabin\conda.bat
no change     C:\Users\User\Unity\Dialogos\miniconda\Library\bin\conda.bat
no change     C:\Users\User\Unity\Dialogos\miniconda\condabin\_conda_activate.bat
no change     C:\Users\User\Unity\Dialogos\miniconda\condabin\rename_tmp.bat
no change     C:\Users\User\Unity\Dialogos\miniconda\condabin\conda_auto_activate.bat
no change     C:\Users\User\Unity\Dialogos\miniconda\condabin\conda_hook.bat
no change     C:\Users\User\Unity\Dialogos\miniconda\Scripts\activate.bat
no change     C:\Users\User\Unity\Dialogos\miniconda\condabin\activate.bat
no change     C:\Users\User\Unity\Dialogos\miniconda\condabin\deactivate.bat
modified      C:\Users\User\Unity\Dialogos\miniconda\Scripts\activate
modified      C:\Users\User\Unity\Dialogos\miniconda\Scripts\deactivate
modified      C:\Users\User\Unity\Dialogos\miniconda\etc\profile.d\conda.sh
modified      C:\Users\User\Unity\Dialogos\miniconda\etc\fish\conf.d\conda.fish
no change     C:\Users\User\Unity\Dialogos\miniconda\shell\condabin\Conda.psm1
modified      C:\Users\User\Unity\Dialogos\miniconda\shell\condabin\conda-hook.ps1
no change     C:\Users\User\Unity\Dialogos\miniconda\Lib\site-packages\xontrib\conda.xsh
modified      C:\Users\User\Unity\Dialogos\miniconda\etc\profile.d\conda.csh
no change     C:\Users\User\OneDrive\Documents\WindowsPowerShell\profile.ps1

==> For changes to take effect, close and re-open your current shell. <==

(base) PS C:\Users\User\Unity\Dialogos>
```
### 1.4.5 Summary
These automation scripts make setting up the ML-Agents Toolkit hassle-free, allowing you to focus on agent development and training.

## 1.5 High-Level Scripts and Configuration
To facilitate the development process, we provide high-level scripts such as `doctor.bat`, `clean.bat`, and `engine.ini`. These scripts are designed to configure, maintain, and troubleshoot the project environment efficiently.

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

#### Example Ouput
The following text output is an example of what the doctor will output if everything is okay:

```
(base) PS C:\Users\User\Unity\Dialogos> .\bin\doctor.bat

✅ Everything is set up correctly 🎭

(base) PS C:\Users\User\Unity\Dialogos>
```

This script will perform a series of checks to ensure your development environment is correctly set up, all dependencies are properly installed, and will attempt to automatically fix any issues it detects.

However if there are errors, for example lets just remove the miniconda direction from our project root if you previously setup for testing sake. The following output would reflect the new output if various files or directories are missing. 

```
(base) PS C:\Users\3nigma\Unity\Dialogos> .\bin\doctor.bat

🚫 Project folder not found: C:\Users\User\Unity\Dialogos\bin\..\Dialogos
🚫 Miniconda folder not found: C:\Users\User\Unity\Dialogos\bin\..\miniconda\
The system cannot find the path specified.
🚫 Conda environment not activated: Dialogos

(base) PS C:\Users\User\Unity\Dialogos>
```
In the case of errors, the doctor can not only diagnose but also be able to fix your problem. Be advised you must consent to fix before proceding. You can run the fix by executing the following command:

`doctor.bat --fix`

should output the following consent for fix

```
(base) PS C:\Users\3nigma\Unity\Dialogos> .\bin\doctor.bat --fix

🚫 Project folder not found: C:\Users\3nigma\Unity\Dialogos\bin\..\Dialogos
🚫 Miniconda folder not found: C:\Users\3nigma\Unity\Dialogos\bin\..\miniconda\
The system cannot find the path specified.
🚫 Conda environment not activated: Dialogos
🚫 There were 3 errors in the installation and setup of the previous batch file.
Please press any key to begin the healing process.
Press any key to continue . . .
```

This is an important step of integrating human decision making into critical processes such as self repair or self replication. This provides a more ethical mechanism for software maintance. You may however disable this feature within the `engine.ini`. (See section below)


### 1.5.4 The `clean.bat` Script
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

#### Example Ouput
The following text output is from a successful clean of our project directories and files. Returning your project to square one.

```
(base) PS C:\Users\User\Unity\Dialogos> .\bin\clean.bat

🚮 Starting cleanup process...
✅ Cleanup process completed 🎭

(base) PS C:\Users\User\Unity\Dialogos>
```

### 1.5.5 The `engine.ini` Configuration File

The `engine.ini` file serves as the central configuration for the Dialogos LLM project. It specifies preferences, paths, and options for the training environment.

#### Usage
- **Language and Complexity**: Set your language preference and the complexity level of the LLM training.
- **Paths**: Define paths to training folders, results, and model directories.
- **Options**: Configure training instances, encryption, and tokenization options.

#### Advanced Configuration
- **Dataset Properties**: Customize properties related to the dataset such as size, diversity, and sampling rate.
- **Directory Management**: Specify the directory structure for organizing training data, checkpoints, and logs.
- **Training Options**: Set high-level training parameters including batch size, learning rate, and epoch count.

### 1.5.6 Summary
These high-level scripts are powerful tools that streamline the development workflow. Users are encouraged to familiarize themselves with these scripts to leverage their full potential. Support for Linux and macOS scripts is coming soon.
