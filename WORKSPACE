# Give your project a name. :)
workspace(name = "fib")

# shim to match up with expectations in the JNI
local_repository(
    name = "openjdk",
    path = "./openjdk",
)

# Load the repository rule to download an http archive.
load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive"
)

# Download rules_haskell and make it accessible as "@rules_haskell".
http_archive(
    name = "rules_haskell",
    strip_prefix = "rules_haskell-0.12",
    urls = ["https://github.com/tweag/rules_haskell/archive/v0.12.tar.gz"],
    sha256 = "56a8e6337df8802f1e0e7d2b3d12d12d5d96c929c8daecccc5738a0f41d9c1e4",
)

load(
    "@rules_haskell//haskell:repositories.bzl",
    "rules_haskell_dependencies",
)

# Setup all Bazel dependencies required by rules_haskell.
rules_haskell_dependencies()

load(
    "@rules_haskell//haskell:ghc_bindist.bzl",
    "haskell_register_ghc_bindists",
)

haskell_register_ghc_bindists(
    version = "8.6.5",
    compiler_flags = ["-fPIE", "-fPIC", "-fexternal-dynamic-refs"]
)


load(
    "@rules_haskell//haskell:toolchain.bzl",
    "haskell_toolchain",
)

load(
    "@bazel_tools//tools/build_defs/repo:git.bzl",
    "git_repository"
)

git_repository(
    name = "tweag_inline_java",
    remote = "https://github.com/tweag/inline-java.git",
    commit = "a897d32df99e4ed19314d2a7e245785152e9099d")


load("@rules_haskell//haskell:cabal.bzl", "stack_snapshot")

stack_snapshot(
    name = "stackage",
    packages = [
        "base",
        "bytestring",
        "choice",
        "containers",
        "constraints",
        "deepseq",
        "inline-c",
        "singletons"
    ],
    snapshot = "lts-14.27"
)