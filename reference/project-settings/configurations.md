## configurations

指定工作区或项目的构建配置集，例如“ Debug”和“ Release”。

```lua
configurations { "names" }
```

配置封装了一组构建设置，使开发人员可以轻松地在它们之间进行切换。 “调试”和“发布”是最常见的配置名称。

### 参数

names是配置名称的列表。允许使用空格，但使用某些Premake功能（例如命令行配置选择）可能会更加困难。

### 应用于

工作空间和项目

### 可用性

Premake 4.0或更高版本。每个项目的配置列表是在Premake 5.0中引入的。

### 示例

指定工作区的调试和发布配置。

```lua
workspace "MyWorkspace"
  configurations { "Debug", "Release" }
```

为动态链接库版本添加其他配置。

```lua
configurations { "Debug", "Release", "DebugDLL", "ReleaseDLL" }
```

