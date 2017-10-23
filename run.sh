java -Xmx500M -cp "/usr/local/lib/antlr-4.5.3-complete.jar:$CLASSPATH" org.antlr.v4.Tool Atalk.g4;
javac *.java;
java org.antlr.v4.gui.TestRig Atalk -tree;