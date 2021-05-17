## workspace

创建一个新的工作空间

```lua
workspace("name")
```

工作区是Premake构建脚本中的顶级对象，并且与Visual Studio解决方案同义。每个工作空间包含一个或多个项目，这些项目又包含生成单个二进制目标的设置。

### 参数

name是工作空间的唯一名称。如果具有给定名称的工作空间已经存在，则将其激活并返回。

如果未指定名称，则返回当前工作空间范围，并将其激活。

 如果使用“ *”，则将选择适用于所有工作空间的“ root”配置范围，并返回nil。

默认情况下，项目名称将用作生成的项目文件的文件名；注意空格和特殊字符。您可以使用[filename](reference/project-settings/filename.md)调用覆盖此默认设置。

### 可用性

premake 4.0或更高版本

### 示例

创建一个名为“ MyWorkspace”的新工作区，其中包含调试和发布构建配置

```lua
workspace "MyWorkspace"
   configurations { "Debug", "Release" }
```

