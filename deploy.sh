#!/bin/bash

# Define variables
DATABRICKS_WORKSPACE_PATH="/Shared/sample-assets"
LOCAL_SRC_PATH="./src"
DBFS_PATH="dbfs:/mnt/asset-bundle"
PROFILE_NAME="default"

echo "Starting deployment to Databricks..."

# Step 1: Import Notebooks into Databricks Workspace
echo "Uploading notebooks to Databricks workspace..."
databricks workspace import_dir $LOCAL_SRC_PATH $DATABRICKS_WORKSPACE_PATH --overwrite
if [ $? -ne 0 ]; then
    echo "Failed to upload notebooks. Exiting..."
    exit 1
fi

# Step 2: Upload Libraries (JARs, Python packages, etc.) to DBFS
if [ -d "./libraries" ]; then
    echo "Uploading libraries to DBFS..."
    databricks fs cp ./libraries/helloworld.jar dbfs:/mnt/asset-bundle/libraries/
    if [ $? -ne 0 ]; then
        echo "Failed to upload libraries. Exiting..."
        exit 1
    fi
else
    echo "No libraries folder found. Skipping library upload..."
fi

# Step 3: Upload Sample Data to DBFS
if [ -d "./data" ]; then
    echo "Uploading data to DBFS..."
    databricks fs cp --recursive ./data $DBFS_PATH/data
    if [ $? -ne 0 ]; then
        echo "Failed to upload data. Exiting..."
        exit 1
    fi
else
    echo "No data folder found. Skipping data upload..."
fi

# Step 4: Verify Uploaded Resources
echo "Verifying uploaded resources..."
databricks fs ls $DBFS_PATH
if [ $? -ne 0 ]; then
    echo "Failed to verify resources. Exiting..."
    exit 1
fi

# Step 5: Log Completion
echo "Deployment completed successfully! All assets have been uploaded to Databricks."
