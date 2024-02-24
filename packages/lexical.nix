{ system, ... }:

(builtins.getFlake "github:lexical-lsp/lexical/aba16bb757822535357a2100db7045b0cae0528a").packages.${system}.default
