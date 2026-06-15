# AutoUserCreation

PowerShell automation script for bulk local user creation on Windows using a CSV file.

## Features

* Create local Windows user accounts from a CSV file.
* Prevent duplicate account creation.
* Automatically assign users to local groups.
* Secure password handling using SecureString.
* Error handling and color-coded console output.

## Requirements

* Windows PowerShell 5.1 or later
* Administrator privileges
* CSV file containing user information

## Usage

1. Update the CSV file path in the script.
2. Run PowerShell as Administrator.
3. Execute:

```powershell
.\AutoUserCreation.ps1
```

## Author

Mahmoud Owis
