## linkoptions

将参数直接传递给链接器命令行，而不进行转换。

```lua
linkoptions { "options" }
```

### 参数

options是特定于特定链接程序的链接程序标志和选项的列表。

### 应用于

项目配置

### 可用性

premake 4.0 或更高版本

### 示例

在具有GCC的Linux上构建时，请使用pkg-config样式配置。构建选项始终是特定于链接程序的，并且应针对特定的工具集。

```lua
configuration { "linux", "gmake" }
  linkoptions { "`wx-config --libs`" }
```

