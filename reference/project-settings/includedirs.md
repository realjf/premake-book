## includedirs

指定编译器的包含文件搜索路径。

```lua
includedirs { "paths" }
```

### 参数

路径指定包含文件搜索目录的列表。应该相对于当前正在运行的脚本文件指定路径。

### 应用于

项目配置

### 可用性

premake 4.0或更高版本

### 示例

定义两个包含文件搜索路径。

```lua
includedirs { "../lua/include", "../zlib" }
```

您也可以使用通配符来匹配多个目录。 * 将与单个目录匹配，** 也将递归到子目录中

```lua
includedirs { "../includes/**" }
```

