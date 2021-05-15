## 命令行参数

Premake提供了使用newaction和newoption函数从项目脚本中定义和处理新命令行参数的功能。

### 动作和选项

Premake可以识别两种类型的参数：操作和选项。

动作指示Premake在任何给定的运行中应执行的操作。 例如，vs2013操作指示应生成Visual Studio 2013项目文件。 清除操作将导致所有生成的文件被删除。 一次只能指定一个动作。

一个选项可以修改操作的行为。 例如，dotnet选项用于更改在生成的文件中使用的.NET编译器集。 选项可以接受--dotnet = mono之类的值，也可以作为--with-opengl之类的标志。

在脚本中，您可以使用**_ACTION** 全局变量（字符串值）来标识当前操作。 您可以使用 **_OPTIONS** 表检查选项，该表包含键/值对列表。 键是选项标识符（“ dotnet”），它引用命令行值（“ mono”）或无值选项的空字符串。

```lua
-- delete a file if the clean action is running
if _ACTION == "clean" then
   -- do something
end

-- use an option value in a configuration
targetdir ( _OPTIONS["outdir"] or "out" )
```

### 创建新选项

使用 **newoption** 函数创建新的命令行选项，并传递一个完整描述该选项的表。最好用一些例子来说明。

这是一个旨在强制在3D应用程序中使用OpenGL的选项。它只是一个简单的标志，没有任何值。

```lua
newoption {
   trigger = "with-opengl",
   description = "Force the use of OpenGL for rendering, regardless of platform"
}
```

