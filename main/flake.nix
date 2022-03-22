{
  description = ''Generic tokenizer written in Nim language 👑 Powered by Nim's Macros'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-toktok-main.flake = false;
  inputs.src-toktok-main.owner = "openpeep";
  inputs.src-toktok-main.ref   = "main";
  inputs.src-toktok-main.repo  = "toktok";
  inputs.src-toktok-main.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-toktok-main"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-toktok-main";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}