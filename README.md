# SBF Notes

## Introduction
This guide provides instructions for installing and using Septentrio's RxTools on Windows and Ubuntu systems.

## Installation

### Windows
1. **Download the Application:**
   - Visit the Septentrio website and download RxTools from the following link: [Septentrio RxTools](https://www.septentrio.com/en/products/gps-gnss-receiver-software/rxtools).

2. **Install the Application:**
   - Follow the standard Windows installation process to install the application.

3. **Using the Software:**
   - After installation, you can run the software commands directly by navigating to the directory where the commands are located or by adding the command directory to your system's PATH environment variable.

### Ubuntu
1. **Download the Application:**
   - Visit the Septentrio website and download the Linux version of RxTools from the following link: [Septentrio RxTools](https://www.septentrio.com/en/products/gps-gnss-receiver-software/rxtools).

2. **Make the File Executable:**
   - Open a terminal and navigate to the directory where the downloaded file is located.
   - Run the following command to make the file executable:
     ```bash
     chmod +x filename.bin
     ```

3. **Install the Application:**
   - Execute the following command to start the installation (admin/root required):
     ```bash
     sudo ./filename.bin
     ```
   - Follow the on-screen instructions to complete the installation.

4. **Using the Software:**
   - You can run the software commands directly by navigating to the installation directory or by adding the command directory to your PATH environment variable.

## Adding Commands to PATH (Optional)
To make it easier to run RxTools commands from any directory, you can add the command directory to your system's PATH environment variable.

### Windows
1. Right-click on "This PC" or "My Computer" and select "Properties."
2. Click on "Advanced system settings."
3. Click on "Environment Variables."
4. Under "System variables," find the `Path` variable and click "Edit."
5. Click "New" and add the path to the RxTools command directory.
6. Click "OK" to save the changes.

### Ubuntu
1. Open a terminal.
2. Edit the `.bashrc` file with the following command:
   ```bash
   vi ~/.bashrc
   ```
3. Add the following line at the end of the file, replacing `/path/to/command/directory` with the actual path:
   ```bash
   export PATH="$PATH:/path/to/command/directory"
   ```
4. Save and close the file, then run the following command to apply the changes:
    ```bash
    source ~/.bashrc
    ``` 
