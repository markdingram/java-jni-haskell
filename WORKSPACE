# Give your project a name. :)
workspace(name = "fib")

# shim to match up with expectations in the JNI
local_repository(
    name = "openjdk",
    path = "./openjdk",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "fmeum_rules_jni",
    sha256 = "9a387a066f683a8aac4d165917dc7fe15ec2a20931894a97e153a9caab6123ca",
    strip_prefix = "rules_jni-0.4.0",
    url = "https://github.com/fmeum/rules_jni/archive/refs/tags/v0.4.0.tar.gz",
)

load("@fmeum_rules_jni//jni:repositories.bzl", "rules_jni_dependencies")

rules_jni_dependencies()

local_repository(
    name = "sed",
    path = "./sed",
)


# Load the repository rule to download an http archive.
load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive"
)

# Download rules_haskell and make it accessible as "@rules_haskell".
http_archive(
    name = "rules_haskell",
    sha256 = "2a07b55c30e526c07138c717b0343a07649e27008a873f2508ffab3074f3d4f3",
    strip_prefix = "rules_haskell-0.16",
    url = "https://github.com/tweag/rules_haskell/archive/refs/tags/v0.16.tar.gz",
)

load(
    "@rules_haskell//haskell:repositories.bzl",
    "rules_haskell_dependencies",
)

# Setup all Bazel dependencies required by rules_haskell.
rules_haskell_dependencies()

load(
    "@rules_haskell//haskell:toolchain.bzl",
    "rules_haskell_toolchains",
)

# Download a GHC binary distribution from haskell.org and register it as a toolchain.
rules_haskell_toolchains(
    version = "9.2.5",
)

load(
    "@bazel_tools//tools/build_defs/repo:git.bzl",
    "git_repository"
)

git_repository(
    name = "tweag_inline_java",
    remote = "https://github.com/tweag/inline-java.git",
    commit = "85c6a3e6a36c5fddb3571492a9781ea1ee59caeb"
)

load(
    "@rules_haskell//haskell:cabal.bzl",
    "stack_snapshot"
)

stack_snapshot(
    name = "stackage",
    packages = [
        "async",
        "base",
        "bytestring",
        "choice",
        "containers",
        "constraints",
        "deepseq",
        "inline-c",
        "linear-base",
        "singletons-base",
        "stm",
        "text",
    ],
    snapshot = "lts-20.11",
)
