#!/bin/bash

# Function to run a script and check for success
run_test() {
  script_name="$1"
  # Capture the output of the script
  output=$($script_name 2>&1)
  echo "Running $script_name..."
  echo "$output"
  
  # Check for error messages in the output
  if [[ $output == *"error"* ]] || [[ $output == *"Error"* ]]; then
    echo "$script_name: FAILED (Script Error)"
    return 1
  fi

  # Check if n8n container is running
  if ! docker ps | grep -q "n8n"; then
    echo "$script_name: FAILED (Container not running)"
    return 1
  else
    echo "$script_name: Container running check PASSED"
  fi

  # Test if the container can write to its internal volume
  docker exec n8n touch /home/node/.n8n/testfile.txt
  if [ $? -ne 0 ]; then
    echo "$script_name: FAILED (Write test failed)"
    return 1
  else
    echo "$script_name: Write test PASSED"
  fi

  # Test if the container can read from its internal volume
  docker exec n8n cat /home/node/.n8n/testfile.txt &> /dev/null
    if [ $? -ne 0 ]; then
    echo "$script_name: FAILED (Read test failed)"
    return 1
  else
    echo "$script_name: Read test PASSED"
  fi

  echo "$script_name: PASSED"
  return 0  # Indicate success

} #fixme
# Function to cleanup after a script
cleanup() {
  echo "Cleaning up..."
  
  # Stop and remove any n8n containers
  docker stop n8n &> /dev/null || true
  docker rm n8n &> /dev/null || true

  # Remove the test file from inside the container
  docker exec n8n rm -f /home/node/.n8n/testfile.txt &> /dev/null || true

  echo "Cleanup complete."

}

# Change to the directory where the scripts are located
cd ./src || exit 1

# Run the scripts
run_test "./run_n8n_MAC.sh"
cleanup
run_test "./run_compose_MAC.sh"
cleanup
run_test "pwsh ./run_n8n_WIN.ps1"
cleanup
run_test "pwsh ./run_compose_WIN.ps1"
cleanup

# Check exit status
if [ $? -eq 0 ]; then
  echo "All tests PASSED"
else
  echo "Some tests FAILED"
  exit 1
fi

exit 0
