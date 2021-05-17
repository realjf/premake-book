## objdir

设置在构建项目时应放置对象和其他中间文件的目录。

```lua
objdir ("path")
```

默认情况下，中间文件将存储在与项目相同的目录中的名为“ obj”的目录中。 objdir函数允许您更改此位置。

为了避免构建配置之间的冲突，Premake将通过附加一个或多个构建配置名称，平台名称或项目名称来确保每个中间目录都是唯一的。您可以使用“！”前缀可防止此行为，并允许重叠的中间目录。有关更多信息，请参见下面的示例。

### 参数

path是对象和中间文件的存储目录，相对于当前正在执行的脚本文件指定。可以使用令牌

### 应用于

项目配置

### 可用性

Premake 4.0或更高版本。这 ”！”前缀是在Premake 5.0中引入的。

### 示例

将名为“ obj”的目录（默认）用于中间文件。实际目录将为obj / Debug和obj / Release。

```lua
workspace "MyWorkspace"
   configurations { "Debug", "Release" }

project "MyProject"
   objdir "obj"
```

将名为“ obj”的目录（默认）用于中间文件。实际目录将为obj / Debug / x32，obj / Debug / x64，obj / Release / x32和obj / Release / x64。

```lua
workspace "MyWorkspace"
   configurations { "Debug", "Release" }
   platforms { "x32", "x64" }

project "MyProject"
   objdir "obj"
```

使用令牌重新格式化路径。由于最终结果是唯一的，因此Premake将不会追加任何额外的目录。实际目录将为obj / x32_Debug，obj / x64_Debug，obj / x32_Release和obj / x64_Release。

```lua
workspace "MyWorkspace"
   configurations { "Debug", "Release" }
   platforms { "x32", "x64" }

project "MyProject"
   objdir "obj/%{cfg.platform}_%{cfg.buildcfg}"
```

使用 ”！”前缀以使用Visual Studio提供的环境变量而不是Premake令牌来强制特定目录。

```lua
workspace "MyWorkspace"
   configurations { "Debug", "Release" }
   platforms { "x32", "x64" }

project "MyProject"
   objdir "!obj/$(Platform)_$(Configuration)"
```

