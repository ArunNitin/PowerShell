# Define the paths to your local repositories
$sourceRepoPath = "D:\Mohit Tasks and Important work\Year\2024\2025-06-Work\API Project\Finished sample"
$targetRepoPath = "D:\Mohit Tasks and Important work\Year\2024\2024-07-woek"

# Path of specific files you want to update
$filesToUpdate = @(
    "file1.Json",
    "file2.Json",
    "file3.Json"
)

# Navigate to the source repository
Set-Location -Path $sourceRepoPath

# Pull the latest changes from the source repository
git pull origin main

# Copy the updated files to the target repository
foreach ($file in $filesToUpdate) {
    Copy-Item -Path "$sourceRepoPath\$file" -Destination "$targetRepoPath\$file" -Force
}

# Navigate to the target repository
Set-Location -Path $targetRepoPath

# Add the changes to git
git add .

# Commit the changes with a message
$commitMessage = "Update files from source repository"
git commit -m $commitMessage

# Push the changes to the remote repository
git push origin main
