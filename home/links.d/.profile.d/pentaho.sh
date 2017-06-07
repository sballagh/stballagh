PENTAHO_DI_JAVA_OPTIONS="-Xmx4096m -XX:MaxPermSize=512m"
export PENTAHO_DI_JAVA_OPTIONS
base="/usr/local/share/pentaho"
export PENTAHO_HOME="${base}/biserver-ce"
export KETTLE_HOME="${base}/data-integration"
unset base
