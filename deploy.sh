#!/bin/bash

# Variables
DATABRICKS_WORKSPACE_PATH="/Shared/sample-assets"
PROFILE_NAME="<PROFILE_NAME>"

# Upload the files to Databricks
databricks workspace import_dir ./notebooks $DATABRICKS_WORKSPACE_PATH --profile $PROFILE_NAME --overwrite

echo "Deployment completed successfully."
