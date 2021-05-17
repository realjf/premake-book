## targetextension

指定已编译的二进制目标的文件扩展名。

```lua
targetextension ("ext")
```

默认情况下，项目将使用系统的常规命名约定：.exe用于Windows可执行文件，.so用于Linux共享库，依此类推。 targetextension函数允许您更改此默认值。

### 参数

ext是新的文件扩展名，包括前导点

### 应用于

项目配置

### 可用性

premake 4.0 或更高版本

### 示例

```lua
targetextension ".zmf"
```

