#!/bin/bash

verb="$1"
argument="$2"

if [[ "$verb" == "" ]]; then
  echo "error: Verb not provided."
  exit 1
fi

if [[ "$verb" == "help" ]]; then
  echo "Usage: gvm <verb> [Go version]"
  echo "Example: gvm use go1.17"
  echo "Verbs:"
  echo "- install: Install the specified Go version."
  echo "- use: Use the specified Go version."
  echo "- help: Display help."
elif [[ "$verb" == "install" ]]; then
  if [[ "$argument" == "" ]]; then
    echo "error: Go version not provided."
    exit 1
  fi

  go install golang.org/dl/${argument}@latest
  ${argument} download
elif [[ "$verb" == "use" ]]; then
  if [[ "$argument" == "" ]]; then
    echo "error: Go version not provided."
    exit 1
  fi

  export GOROOT="$(${argument} env GOROOT)"
  # The path must be converted to POSIX format before being added to the PATH environment variable.
  posix_goroot="$(cygpath "${GOROOT}")"
  export PATH="${posix_goroot}/bin:${PATH}"
else
  echo "error: Verb $verb unknown."
  exit 1
fi
