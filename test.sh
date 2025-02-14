#!/bin/bash

# Function to run a script and check for success
run_test() {
  script_name="$1"
  echo "Running $script_name..."
  
  if bash "$script_name"; then
    echo "$script_name: PASSED"
  else
    echo "$script_name: FAILED"
    return 1  # Indicate failure
  fi
}
# Function to cleanup after a script
cleanup() {
  echo "Cleaning up..."
  # Remove any created n8n_data directories
  rm -rf ./n8n_data
  # Stop and remove any n8n containers
  docker stop n8n &> /dev/null || true
  docker rm n8n &> /dev/null || true
  echo "Cleanup complete."
}

# Run the scripts
run_test "./src/run_n8n_MAC.sh"
cleanup
run_test "./src/run_compose_MAC.sh"
cleanup
run_test "pwsh ./src/run_n8n_WIN.ps1" 
cleanup
run_test "pwsh ./src/run_compose_WIN.ps1"

# Check exit status
if [ $? -eq 0 ]; then
  echo "All tests PASSED"
else
  echo "Some tests FAILED"
  exit 1
fi

exit 0
