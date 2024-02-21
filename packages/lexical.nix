{ system, ... }:

(builtins.getFlake "github:lexical-lsp/lexical/a028a549e22f036d413334a42b67c9bb3cbdd13c").packages.${system}.default
