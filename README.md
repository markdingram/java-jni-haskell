Bazel Java JNI Haskell
======================

Bazel project showing Java calling Haskell via JNI.


````
bazel run //fibhs:main 10
bazel run //fibjava:main 10
...
fib(10) = 89
````


# Notes

A few quirks made the Haskell stack quite sensitive to precise versions / configuration (Jul 23):

- "The latest versions of attoparsec use an internal library, and when using the newest stackage snapshots, one needs to do extra configuration in the stack_snapshot rule." https://github.com/tweag/rules_haskell/issues/1764 
- "fatal error: ghcplatform.h: No such file or directory" https://github.com/tweag/rules_haskell/issues/1805
- "The current version of Cabal has an issue causing the generated Paths_ files to miss the definition of splitFileName and minusFileName (See #1832)." https://github.com/tweag/rules_haskell/issues/1871
