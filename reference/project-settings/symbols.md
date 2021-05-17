## symbols

打开/关闭调试符号表生成。

```lua
symbols "switch"
```

默认情况下，生成的项目文件将使用编译器的默认设置来生成调试符号。这可能是打开或关闭，或完全取决于配置。

### 参数

switch是符号信息的标识符。

| option   | 可用性                       |
| -------- | ---------------------------- |
| Default  | 总是可用                     |
| Off      | 总是可用                     |
| On       | 总是可用                     |
| FastLink | Visual studio 2015或更新版本 |
| Full     | Visual Studio 2017或更新版本 |

### 应用于

项目配置

### 可用性

premake 5.0 或更高版本

### 示例

该项目生成调试符号信息，以进行更好的调试。

```lua
project "MyProject"
    symbols "On"
```

