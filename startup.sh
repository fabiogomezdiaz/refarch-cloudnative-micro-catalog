#!/bin/bash
source scripts/add_elasticsearch_certificate.sh

# Set java.io.tmpdir to other than /tmp
if [ -n "$JAVA_TMP_DIR" ]; then
	export JAVA_OPTS="${JAVA_OPTS} -Djava.io.tmpdir=$JAVA_TMP_DIR"
fi

# Parse Elasticsearch certificate and add to Java keystore
add_elasticsearch_certificate

echo "Starting Java Application"

# Start the application
exec java ${JAVA_OPTS} -jar ./app.jar