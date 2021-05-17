## runtime

选择要使用的运行时库的类型。

```lua
runtime ("type")
```

如果未设置运行时类型，Premake将尝试根据符号生成和优化标志的设置来确定配置类型，并自动使用适当的运行时。

### 参数

type是一个字符串值，是“Debug”或“Release”之一。

### 应用于

项目配置

### 可用性

premake 5.0 或更高版本

### 示例

强制选择发布运行时

```lua
filter { "configurations:Debug" }
   symbols "On"
   runtime "Release"
```

