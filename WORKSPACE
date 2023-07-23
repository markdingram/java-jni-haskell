# Give your project a name. :)
workspace(name = "fib")

# shim to match up with expectations in the JNI
local_repository(
    name = "openjdk",
    path = "./openjdk",
)

local_repository(
    name = "sed",
    path = "./sed",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")


# Load the repository rule to download an http archive.
load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive"
)

# Download rules_haskell and make it accessible as "@rules_haskell".
# upgrade to pick up a fix for https://github.com/tweag/rules_haskell/issues/1832
http_archive(
    name = "rules_haskell",
    sha256 = "26f71338e1dad10d8026ed447f65406ab0fe44d81d36fb6a8813be6efcc294f1",
    strip_prefix = "rules_haskell-c5335e62829e0e08d7986457a97eb94886081d78",
    url = "https://github.com/tweag/rules_haskell/archive/c5335e62829e0e08d7986457a97eb94886081d78.tar.gz",
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

# TODO: Remove when tests are run with a ghc version containing Cabal >= 3.10
# See https://github.com/tweag/rules_haskell/issues/1871
http_archive(
    name = "Cabal",
    build_file_content = """
load("@rules_haskell//haskell:cabal.bzl", "haskell_cabal_library")
haskell_cabal_library(
    name = "Cabal",
    srcs = glob(["Cabal/**"]),
    verbose = False,
    version = "3.6.3.0",
    visibility = ["//visibility:public"],
)
    """,
    sha256 = "f69b46cb897edab3aa8d5a4bd7b8690b76cd6f0b320521afd01ddd20601d1356",
    strip_prefix = "cabal-gg-8220-with-3630",
    urls = ["https://github.com/tweag/cabal/archive/refs/heads/gg/8220-with-3630.zip"],
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
    local_snapshot = "//:stack-snapshot.yaml",
    components = {
        "attoparsec": [
            # attoparsec contains an internal library which is not exposed publicly,
            # but required to build the public library, hence the declaration of
            # those 2 components, as well as the explicit declaration of the
            # dependency between them.
            "lib",
            "lib:attoparsec-internal",
        ],
    },
    components_dependencies = {
        "attoparsec": """{"lib:attoparsec": ["lib:attoparsec-internal"]}""",
    },
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
        "transformers-compat"
    ],

    setup_deps = {
        "async": ["@Cabal//:Cabal"],
        "base": ["@Cabal//:Cabal"],
        "bytestring": ["@Cabal//:Cabal"],
        "choice": ["@Cabal//:Cabal"],
        "containers": ["@Cabal//:Cabal"],
        "constraints": ["@Cabal//:Cabal"],
        "deepseq": ["@Cabal//:Cabal"],
        "inline-c": ["@Cabal//:Cabal"],
        "linear-base": ["@Cabal//:Cabal"],
        "singletons-base": ["@Cabal//:Cabal"],
        "stm": ["@Cabal//:Cabal"],
        "text": ["@Cabal//:Cabal"],
        "transformers-compat": ["@Cabal//:Cabal"],

    },)
