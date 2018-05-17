#!/bin/bash
set -e

# If there were build failures, abort
if [ "${TRAVIS_TEST_RESULT}" = "1" ]; then
  echo "Deploy aborted, there were build/test failures."
  exit
fi

ncftpput -R -v -u "${GOOGIEHOST_USER}" -p "${GOOGIEHOST_PASS}" $GOOGIEHOST_HOST public_html build/es5-bundled