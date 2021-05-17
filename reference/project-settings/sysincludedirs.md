## sysincludedirs

指定系统包含文件搜索路径。

```lua
sysincludedirs { "paths" }
```

对于Visual Studio，这些路径位于“ VC ++目录”属性面板中。 对于GCC和Clang，它们前面带有-isystem标志，而不是-I。 对于不支持系统包含目录概念的工具集，将它们视为普通的包含目录。

通过系统包含目录定位的包含文件将被视为正确：文件内容不会显示任何警告。

### 参数

paths指定包含文件搜索目录的列表。应该相对于当前正在运行的脚本文件指定路径。

### 应用于

项目配置

### 可用性

premake 5.0 或更高版本

### 示例

定义两个系统包含文件的搜索路径。

```lua
sysincludedirs { "../lua/include", "../zlib" }
```

您也可以使用通配符来匹配多个目录。 *将与单个目录匹配，**也将递归到子目录中。

```lua
sysincludedirs { "../includes/**" }
```

