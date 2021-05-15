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

注意每个键值对之后的逗号；这是表的Lua语法所必需的。一旦添加到脚本中，该选项将出现在帮助文本中，您可以将触发器用作配置块中的关键字。

```lua
configuration "with-opengl"
   links { "opengldrv" }

configuration "not with-opengl"
   links { "direct3ddrv" }
```

下一个示例显示了具有一组固定的允许值的选项。像上面的示例一样，它旨在允许用户指定3D API。

```lua
newoption {
   trigger = "gfxapi",
   value = "API",
   description = "Choose a particular 3D API for rendering",
   allowed = {
      { "opengl",    "OpenGL" },
      { "direct3d",  "Direct3D (Windows only)" },
      { "software",  "Software Renderer" }
   }
}
```

和以前一样，此新选项将与每个允许值的描述一起集成到帮助文本中。 Premake将在启动时检查选项值，并在无效值上引发错误。 值字段出现在帮助文本中，旨在为用户提供有关所需值类型的线索。 在这种情况下，帮助文本将如下所示：

```
--gfxapi=API      Choose a particular 3D API for rendering; one of:
    opengl        OpenGL
    direct3d      Direct3D (Windows only)
    software      Software Renderer
```

与上面的示例不同，现在您可以在配置块中将值用作关键字。

```lua
configuration "opengl"
   links { "opengldrv" }

configuration "direct3d"
    links { "direct3ddrv" }

configuration "software"
    links { "softwaredrv" }
```

否则您可能会更聪明。

```lua
links { _OPTIONS["gfxapi"] .. "drv" }
```

在此示例中，对于未指定选项的情况，您还希望提供默认行为。您可以在脚本中的任何位置放置这样的代码。

```lua
if not _OPTIONS["gfxapi"] then
   _OPTIONS["gfxapi"] = "opengl"
end
```

作为选项的最后一个示例，您可能希望指定一个接受不受限制的值的选项，例如输出路径。只需将其排除在允许值列表之外即可。

```lua
newoption {
   trigger     = "outdir",
   value       = "path",
   description = "Output directory for the compiled executable"
}
```

### 创建新动作

动作的定义方式与选项基本相同，可以如此简单：

```lua
newaction {
   trigger     = "install",
   description = "Install the software",
   execute = function ()
      -- copy files, etc. here
   end
}
```

触发动作时要执行的实际代码应放在execute（）函数中。

这是简单的版本，非常适合不需要访问特定项目信息的一次性操作。有关编写更完整动作的教程，请参阅添加新动作。