Bazel Java JNI Haskell
======================

Bazel project showing Java calling Haskell via JNI.


````
bazel run //fibhs:main 10
bazel run //fibjava:main 10
...
fib(10) = 89
````
