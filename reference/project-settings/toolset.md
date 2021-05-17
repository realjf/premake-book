## toolset

选择用于构建项目或配置的编译器，链接器等。

```
toolset ("identifier")
```

如果未为配置指定工具集，则将使用系统或IDE默认值。

### 参数

identifier是工具集的字符串标识符。默认情况下，Premake包含以下工具集。

| 工具集标识 | 描述                |
| ---------- | ------------------- |
| clang      | Clang               |
| dotnet     | 系统的默认C＃编译器 |
| gcc        | gnu 编译器集        |
| msc        | 微软 C/C++编译器    |

如果需要特定的工具集版本，则可以将其指定为标识符的一部分，并用短划线分隔。请参阅下面的示例。

### 应用于

项目配置

### 可用性

Premake 5.0及更高版本。当前仅针对Visual Studio 2010+实现版本。

### 示例

指定Windows平台工具集的版本110。

```lua
toolset "msc-v110" -- or...
toolset "v100"    -- for those more familiar with Visual Studio's way
```

在Visual Studio中使用Clang / C2

```lua
toolset "msc-llvm-vs2014"
```

使用Windows XP的工具集

```lua
toolset "v140_xp"
```

