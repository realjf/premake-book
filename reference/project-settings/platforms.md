## platforms

指定一组构建平台，这些构建平台在构建时充当另一个配置轴。

```lua
platforms { "names" }
```

此处列出的平台只是要在IDE中显示的名称，没有内在的含义。名为“ x86_64”的平台将不会创建64位版本。仍然必须指定适当的体系结构。

### 参数

names是平台名称的列表。允许使用空格，但是使用某些Premake功能（例如命令行配置选择）可能会更加困难。

### 应用于

工作空间和项目

### 可用性

premake 5.0或更高版本

### 示例

使用32位和64位版本的静态和共享库“平台”为工作区指定调试和发布配置。

```lua
workspace "MyWorkspace"
  configurations { "Debug", "Release" }
  platforms { "Static32", "Shared32", "Static64", "Shared64" }

  filter "platforms:Static32"
    kind "StaticLib"
    architecture "x32"

  filter "platforms:Static64"
    kind "StaticLib"
    architecture "x64"

  filter "platforms:Shared32"
    kind "SharedLib"
    architecture "x32"

  filter "platforms:Shared64"
    kind "SharedLib"
    architecture "x64"
```

