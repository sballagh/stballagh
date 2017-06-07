export JAVA_HOME=$(cd $(dirname $(readlink -f $(which java)))/..; pwd)
export JDK_HOME="$JAVA_HOME"
export JRE_HOME="$JAVA_HOME/jre/bin"
