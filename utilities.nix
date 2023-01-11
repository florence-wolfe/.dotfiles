{ config, ... }:
{
  getPathFromSecret = dir: builtins.dirOf "${config.homeage.file.${dir}.path}";
  replacementStruct = variable: replacement: {
    inherit variable replacement;
  };
  generateReplacementLists = structs: {
    replacements = (map (struct: struct.replacement) structs);
    variables = (map (struct: struct.variable) structs);
  };
}
