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
  echo "- list: List all installed Go versions."
  echo "- use: Use the specified Go version."
  echo "- help: Display help."
elif [[ "$verb" == "install" ]]; then
  if [[ "$argument" == "" ]]; then
    echo "error: Go version not provided."
    exit 1
  fi

  go install "golang.org/dl/${argument}@latest"
  ${argument} download
elif [[ "$verb" == "list" ]]; then
  find \
    "${GOPATH}/bin" \
    -maxdepth 1 \
    -executable \
    -regex ".*/go[0-9]+\.[0-9]+.*" \
    -regextype posix-extended \
    -type f \
    -execdir \
    basename --suffix=".exe" '{}' \
    \;
elif [[ "$verb" == "use" ]]; then
  if [[ "$argument" == "" ]]; then
    echo "error: Go version not provided."
    exit 1
  fi

  GOROOT="$(GOTOOLCHAIN="${argument}" ${argument} env GOROOT)"
  export GOROOT
  # The path must be converted to POSIX format before being added to the PATH environment variable.
  posix_goroot="$(cygpath "${GOROOT}")"
  PATH="${posix_goroot}/bin:${PATH}"
  export PATH
else
  echo "error: Verb $verb unknown."
  exit 1
fi
