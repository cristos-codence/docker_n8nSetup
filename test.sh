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

# Run the scripts
run_test "./src/run_n8n_MAC.sh"
run_test "./src/run_compose_MAC.sh" 

run_test "pwsh ./src/run_n8n_WIN.ps1"
run_test "pwsh ./src/run_compose_WIN.ps1"

# Check exit status
if [ $? -eq 0 ]; then
  echo "All tests PASSED"
else
  echo "Some tests FAILED"
  exit 1
fi

exit 0
