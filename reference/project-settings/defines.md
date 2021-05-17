## defines

将预处理器或编译器符号添加到项目中。

```lua
defines { "symbols" }
```

### 参数

symbol指定要定义的符号列表。

### 应用于

项目配置

### 可用性

premake 4.0 或更高版本

### 示例

在当前项目中定义两个新符号

```lua
defines { "DEBUG", "TRACE" }
```

符号也可以分配值。

```lua
defines { "CALLSPEC=__dllexport" }
```

