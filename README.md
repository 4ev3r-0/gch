# gch
Github Commit Helper (For idiots that dont know how to explain or forgot that they did the commits!)

## DISCLAIMER
THIS DOES NOT COMMIT FOR YOU. YOU **MUST** COMMIT YOURSELF USING EITHER GITHUB DESKTOP OR GIT.
THIS DOES NOT HAVE DEEP AST PARSING, FULL SEMANTIC RENAME TRACKING, AND IT **CANNOT** DETECT **WHAT SPECIFIC CODE** CHANGED IN A FILE

## Requirements
```text
Lua 5.1+ or LuaJIT equivalent
Git
SOME form of clipboarding tool IF YOU USE AUTOCLIPBOARD, it is OFF by default.
```

## Usage
```text
I personally just put an alias in my bashrc:
alias gch='lua /the/exact/path/to/the/main.lua'
but other than that idk just call it directly ig
```

## Configure
```text
its dead simple, just look at the src/config.lua and change from true to false or vise versa.
```

## Currently Supported languages (For things like new/removed functions & classes and all that jazz)
```text
Lua
JavaScript
TypeScript
Python
Java
C
C++
C#
Go
Rust

(Other languages MAY work but dont be suprised when they dont.)
```

## General Information
### Output Format
```text
SUMMARY: -- What you should put in your summary
<your summary>

DESCRIPTION: -- What your description should be
- per-file bullet list of specific changes

do or dont use this, i dont care it's your project
```

### Detects
```text
Added / removed classes
Added / removed functions
Internal logic changes
Multiple common languages via heuristics
```

