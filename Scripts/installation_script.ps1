function InstallVm {

#Variables. Link aa 28 July 24
$VirtualBoxInstaller = "https://download.virtualbox.org/virtualbox/7.0.20/VirtualBox-7.0.20-163906-Win.exe"
$VirtualBoxExtensionPack = "https://download.virtualbox.org/virtualbox/7.0.20/Oracle_VM_VirtualBox_Extension_Pack-7.0.20.vbox-extpack"
$DirectoryPath = "C:/Program Files/VB/InstallationFolder/"
$SavedVBIFilePath = $DirectoryPath + $VirtualBoxInstaller 
$SavedVBEPFilePath = $DirectoryPath + $VirtualBoxExtensionPack

# Check if file directory exists
try {

if(Test-Path $DirectoryPath) {

# Print message that file directory alreadly exists
Write-Output "Directory already exists at: $DirectoryPath"

} else {

#Create file directory
New-Item -Path $DirectoryPath -ItemType Directory

# Print message after file directory created
Write-Output "Directory created at: $DirectoryPath"
 
}

} catch {

# Handle any errors that occur during directory creation
Write-Error "An error occurred: $_"

}

# Check if download file is successful

try {

#Download Virtual Box Platform 7.0.20 on Windows and save on file path
Invoke-WebRequest -Uri $VirtualBoxInstaller -OutFile $SavedVBIFilePath

# Print message after VirtualBox installer file download completes
Write-Output "VirtualBox Installer download completed"

} catch {

# Print message after download failed
Write-Error "Failed to download VirtualBox Installer: $_"

}

try { 

#Download Virtual Box Extension Pack 7.0.20 on Windows and save on file path
Invoke-WebRequest -Uri $VirtualBoxExtensionPack -OutFile $SavedVBEPFilePath

# Print message after VirtualBox Extension Pack installer file download completes
Write-Output "VirtualBox Extension Pack file download completed"

} catch { 

# Print message after download failed
Write-Error "Failed to download VirtualBox Extension Pack : $_"

}

try { 

#Start VirtualBox installer with silent installation
Start-Process -FilePath $SavedVBIFilePath -ArgumentList "/S" -Wait

# Print message after VirtualBox installer completes
Write-Output "VirtualBox installation completed"

} catch {

# Print message after installation failed
Write-Error "Failed to install VirtualBox Installer : $_"

}

try { 

#Start VirtualBox Extension Pack installer with silent installation
Start-Process -FilePath $SavedVBEPFilePath -ArgumentList "/S" -Wait

# Print message after VirtualBox Extension Pack completes
Write-Output "VirtualBox Extension Pack installation completed."

} catch {

# Print message after installation failed
Write-Error "Failed to install VirtualBox Extension Pack : $_"

}

#Update virtual box to latest version
#Placeholder

}

# Call the function to install virtualbox vm
InstallVm