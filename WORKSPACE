workspace(name = "fib")

RULES_HASKELL_SHA = "edcd7c107d49ba69c96fe625161c42d4e5610d30"
http_archive(
    name = "io_tweag_rules_haskell",
    strip_prefix = "rules_haskell-" + RULES_HASKELL_SHA,
    urls = ["https://github.com/tweag/rules_haskell/archive/{}.tar.gz".format(RULES_HASKELL_SHA)],
)

load("@io_tweag_rules_haskell//haskell:repositories.bzl", "haskell_repositories")
haskell_repositories()

RULES_NIXPKGS_SHA = "da7574a18e406fbce8b930bc7a2e67c3d7d3c2b2"
http_archive(
  name = "io_tweag_rules_nixpkgs",
  strip_prefix = "rules_nixpkgs-" + RULES_NIXPKGS_SHA,
  urls = ["https://github.com/tweag/rules_nixpkgs/archive/{}.tar.gz".format(RULES_NIXPKGS_SHA)]
)

load("@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl",
  "nixpkgs_git_repository",
  "nixpkgs_package",
)

nixpkgs_git_repository(
  name = "nixpkgs",
  revision = "18.03"
)

# These dependencies are built by Nix.
prebuilt_packages = [
  "Cabal",
  "base",
  "bytestring",
  "choice",
  "constraints",
  "containers",
  "deepseq",
  "directory",
  "distributed-closure",
  "exceptions",
  "filemanip",
  "filepath",
  "ghc",
  "hspec",
  "inline-c",
  "language-java",
  "mtl",
  "process",
  "singletons",
  "streaming",
  "template-haskell",
  "temporary",
  "text",
  "vector",
]

nixpkgs_package(
    name = "ghc",
    # For rts example. Not needed if you're not using the RTS directly.
    build_file_content = """
package(default_visibility = ["//visibility:public"])
filegroup(
    name = "bin",
    srcs = glob(["bin/*"]),
)
cc_library(
    name = "threaded-rts",
    srcs = glob(["lib/ghc-8.2.2/rts/libHSrts_thr-ghc*.so"]),
    hdrs = glob(["lib/ghc-8.2.2/include/**/*.h"]),
    strip_include_prefix = "lib/ghc-8.2.2/include",
)
  """,
    # For vector example. Just use `attribute_path = haskell.compiler.ghc822`
    # when no extra packages needed.
  nix_file_content = """
let pkgs = import <nixpkgs> {{}};
in pkgs.buildEnv {{
  name = "inline-java-toolchain";
  paths = with pkgs; [
    (haskell.packages.ghc822.ghcWithPackages (p: with p; [{0}]))
  ];
}}
""".format(" ".join(prebuilt_packages)),
    repository = "@nixpkgs",
)

nixpkgs_package(
  name = "openjdk",
  repository = "@nixpkgs",
  build_file_content = """
filegroup (
  name = "lib",
  srcs = ["lib/openjdk/jre/lib/amd64/server/libjvm.so"],
  visibility = ["//visibility:public"],
)
filegroup (
  name = "bin",
  srcs = ["bin/javac"],
  visibility = ["//visibility:public"],
)
filegroup (
  name = "jni_header",
  srcs = ["include/jni.h"],
  visibility = ["//visibility:public"],
)
filegroup (
  name = "jni_md_header",
  srcs = ["include/jni_md.h"],
  visibility = ["//visibility:public"],
)"""
)

git_repository(
    name = "tweag_inline_java",
    remote = "https://github.com/tweag/inline-java.git",
    tag = "v0.8.4")


register_toolchains("//:ghc")

