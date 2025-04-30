#!/bin/bash

# Variables
DATABRICKS_WORKSPACE_PATH="/Shared/sample-assets"
PROFILE_NAME="<PROFILE_NAME>"

# Upload the files to Databricks
databricks workspace import_dir ./src $DATABRICKS_WORKSPACE_PATH --overwrite

echo "Deployment completed successfully."