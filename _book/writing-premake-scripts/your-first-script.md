## 你的第一个脚本

首先，为传统的“ Hello，world！”配置一个构建。程序，用C语言编写：

```c
/* hello.c */
#include <stdio.h>

int main(void) {
   puts("Hello, world!");
   return 0;
}
```

例如以下示例的典型C程序的Premake脚本为：

```lua
-- premake5.lua
workspace "HelloWorld"
   configurations { "Debug", "Release" }

project "HelloWorld"
   kind "ConsoleApp"
   language "C"
   targetdir "bin/%{cfg.buildcfg}"

   files { "**.h", "**.c" }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
```

如果将此脚本另存为名为premake5.lua的文件，并将其放置在与上述hello.c相同的目录中，则可以通过运行以下命令来生成项目文件：

```sh
$ premake5 vs2013
```

此特定命令将为Visual Studio 2013生成HelloWorld.sln和HelloWorld.vcxproj文件（有关导出程序的完整列表，请参阅使用Premake或运行premake --help）。如果生成生成的工作区，则将在bin / Debug或bin / Release目录中获得一个名为HelloWorld.exe的命令行可执行文件，具体取决于在Visual Studio中选择的配置。

如果您碰巧是在Linux上，则可以生成并生成一个makefile，如下所示：

```sh
$ premake5 gmake
$ make                # build default (Debug) configuration
$ make config=release # build release configuration
$ make help           # show available configurations
```

如果您想使用脚本的名称而不是默认的“ premake5.lua”，请使用Premake的--file参数来告诉它应该加载哪个文件。

```
$ premake5 --file=MyProjectScript.lua vs2013
```

### 这里发生了什么？

在本手册的其余部分中，我将分解此样本，并以某种合乎逻辑的方式介绍Premake的所有功能。 它不是火箭科学，并且您可能已经从上面的示例中了解了它的要旨，因此随时可以跳过。 但是首先，一般了解有关Premake脚本的一些知识会有所帮助。

#### premake是lua

Premake基于Lua（一种功能强大，快速，轻量级的脚本语言）构建。 Premake脚本实际上是Lua程序，因此在Lua中可以执行的任何操作也可以在Premake脚本中完成。

Premake基于Lua运行时构建，添加了用于定义工作空间，项目和配置以及常见构建和文件管理任务的功能。它还提供了用于设置自己的命令行选项和参数的约定，从而允许构建复杂的构建配置和自动化脚本。

由于Lua语言具有描述性，因此您的构建脚本通常看起来像静态配置文件，而不是小型程序，如您从上面的示例中看到的那样。

您可以在这里或从其出色的参考手册中了解有关Lua的更多信息，但这是理解此示例所需的以下知识：

- 标识空白是任意的；这就是我碰巧喜欢的方式。

- 双破折号“-”开始单行注释。

- 大括号“ {”和“}”用于表示值列表。

#### 函数和参数

示例脚本中的每一行实际上都是一个函数调用。 当您使用简单的字符串或表参数调用Lua函数时，可以省略通常的括号以提高可读性。 因此，该示例的前两行也可以写成：

```lua
workspace("HelloWorld")
configurations({ "Debug", "Release" })
```

如果您使用的不是简单的字符串或表，则括号是强制性的。

```lua
local lang = "C++"
language (lang)  -- using a variable, needs parenthesis

workspace("HelloWorld" .. _ACTION) -- using string concatenation, needs parenthesis
```

#### 值和列表

Premake的大多数函数都接受单个字符串或字符串列表作为参数。单字符串参数易于使用和理解。

```lua
language "C++"
```

如果一个简单的值遇到多个值，则最后一个获胜。

```lua
language "C++"   -- the value is now "C++"
language "C"     -- the value is now "C"
```

对于接受值列表的函数，可以使用Lua的花括号语法或单个字符串值来提供列表

```lua
defines { "DEBUG", "TRACE" }  -- defines multiple values using list syntax
defines { "NDEBUG" }           -- defines a single value using list syntax
defines "NDEBUG"              -- defines a single value as a simple string
```

如果列表遇到多个值，则将它们串联。

```lua
defines { "DEBUG", "TRACE" }  -- value is now { "DEBUG", "TRACE" }
defines { "WINDOWS" }         -- value is now { "DEBUG", "TRACE", "WINDOWS" }
```

如果您希望删除以前设置的值，则所有列表函数都定义一个相应的remove ...（）调用。

```
defines { "DEBUG", "TRACE" }  -- value is now { "DEBUG", "TRACE" }
removedefines { "TRACE" }     -- value is now { "DEBUG" }
```

#### 路径

您将在Premake脚本中指定许多路径。 有两个规则要记住：
始终指定相对于它们出现在其中的脚本文件的路径。
始终使用正斜杠（“ /”）作为路径分隔符。 生成输出文件时，Premake将转换为适当的分隔符。