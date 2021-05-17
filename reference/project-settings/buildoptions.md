## buildoptions

将参数直接传递给编译器命令行，而不进行转换。

```lua
buildoptions { "options" }
```

如果项目包含对buildoptions的多次调用，则列表将按照它们在脚本中出现的顺序进行串联。

### 参数

options是特定于特定编译器的编译器标志和选项的列表。

### 应用于

项目配置

### 可用性

premake 4.0 或更高版本

### 示例

在具有GCC的Linux上构建时，请使用pkg-config样式配置。生成选项始终是特定于编译器的，并且应针对特定的工具集。

```lua
configuration { "linux", "gmake" }
  buildoptions { "`wx-config --cxxflags`", "-ansi", "-pedantic" }
```

