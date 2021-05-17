## filter

将后续的构建设置限制为特定的环境。

```lua
filter { "prefix:keywords" }
```

脚本中此功能之后出现的所有设置将仅应用于与所有列出的关键字匹配的上下文。请参阅下面的一些用法示例。

### 参数

keywords是标识符列表，在其前面应测试的标识符字段。当此列表中的所有关键字均与当前上下文匹配时，将应用filter语句之后的设置。如果有任何关键字未通过此测试，则将忽略设置。关键字可以包含通配符，并且不区分大小写。请参阅下面的示例。

每个关键字必须包含一个前缀，以指定应测试的字段。当前支持以下字段前缀：

- [action](/reference/project-settings/action.md)
- [architecture](/reference/project-settings/architecture.md)
- [configurations](/reference/project-settings/configurations.md)
- [files](/reference/project-settings/files.md)
- [kind](/reference/project-settings/kind.md)
- [language](/reference/project-settings/language.md)
- [options](/reference/project-settings/options.md)
- [platforms](/reference/project-settings/platforms.md)
- [system](/reference/project-settings/system.md)
- [toolset](/reference/project-settings/toolset.md)

关键字可以使用\ *和\ * \ *通配符来匹配多个术语或文件。您也可以使用修饰符not和or建立更复杂的条件。同样，请参见下面的示例以获取更多信息。

### 可用性

premake 5.0或更高版本

### 示例

定义一个仅适用于调试版本的新符号。

```lua
workspace "MyWorkspace"
  configurations { "Debug", "Release" }

filter "configurations:Debug"
  defines { "_DEBUG" }
```

如果在关键字中未指定任何字段前缀，则默认使用“configurations”。

```lua
filter "Debug"
  defines { "_DEBUG" }
```

仅在以Visual Studio 2010为目标时定义符号。

```lua
filter "action:vs2010"
  defines { "VISUAL_STUDIO_2005" }
```

通配符可用于匹配多个术语。为所有版本的Visual Studio定义一个符号。

```lua
filter "action:vs*"
  defines { "VISUAL_STUDIO" }
```

当可能有多个值时，可以使用or修饰符。仅为库目标定义一个值。

```lua
filter "kind:SharedLib or StaticLib"
  defines { "LIBRARY_TARGET" }
```

当列出多个关键字时，在它们之间假定一个隐含一个and。仅在使用GNU Make和GCC时定义编译器选项。

```lua
filter { "action:gmake*", "toolset:gcc" }
  buildoptions {
    "-Wall", "-Wextra", "-Werror"
  }
```

如果任何关键字模式都无法匹配当前上下文，则将跳过整个过滤器。存在多个关键字时，必须使用Lua的大括号列表语法。

在库的调试版本中添加一个后缀。

```lua
-- (configurations == "Debug") and (kind == SharedLib or kind == "StaticLib")
filter { "Debug", "kind:SharedLib or StaticLib" }
  targetsuffix "_d"

-- Could also be written as
filter { "Debug", "kind:*Lib" }
  targetsuffix "_d"
```

根据自定义命令行选项的存在应用设置。

```lua
-- Using an option like --localized
filter "options:localized"
  files { "src/localizations/**" }

-- Using an option like --renderer=opengl
filter "options:renderer=opengl"
  files { "src/opengl/**.cpp" }
```

尽管当前支持有限，但是您也可以将设置应用于特定文件或文件集。本示例为所有PNG图像文件设置构建动作。

```lua
filter "files:*.png"
  buildaction "Embed"
```

对于文件，您也可以使用**通配符，该通配符将递归到子目录中

```lua
filter "files:**.png"
  buildaction "Embed"
```

您还可以使用not将设置应用于未设置标识符的所有环境。

```lua
filter "system:not windows"
  defines { "NOT_WINDOWS" }
```

您可以在单个关键字中组合不同的前缀。

```lua
filter "system:windows or language:C#"
```

最后，您可以通过向函数传递一个空表来重置过滤器并删除所有活动关键字。

```lua
filter {}
```

### 澄清说明

- 设置过滤器后，以前的所有过滤器操作都将变为无效状态。换句话说，启动过滤器的行为就像首先发生重置，然后设置新的过滤器条件一样。

- 过滤器可以看作是范围界定的概念。当调用过滤器重置操作或启动项目定义时，当前设置的过滤器将“超出范围”。