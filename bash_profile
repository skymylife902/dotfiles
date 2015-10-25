# for alias
source `dirname ${BASH_SOURCE[0]}`/.alias

# for iterm2
export CLICOLOR=1
export LSCOLORS=Fxbxaxdxcxegedabagacad

# for java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_67.jdk/Contents/Home

# for hadoop
export HADOOP_HOME=/usr/local/opt/hadoop
export PATH=${HADOOP_HOME}/bin:${PATH}

# for scala
export SCALA_HOME=/usr/local/opt/scala
export PATH=${SCALA_HOME}/bin:${PATH}
