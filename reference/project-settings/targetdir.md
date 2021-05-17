## targetdir

设置已编译二进制目标的目标目录

```lua
targetdir ("path")
```

默认情况下，生成的项目文件会将其编译后的输出放置在与脚本相同的目录中。 targetdir函数允许您更改此位置。

### 参数

path是应将已编译目标文件存储到的目录的文件系统路径。它是相对于当前正在执行的脚本文件指定的。

### 应用于

项目配置

### 可用性

premake 4.0或更高版本

### 示例

该项目按配置类型分离其编译输出。

```lua
project "MyProject"

  configuration "Debug"
    targetdir "bin/debug"

  configuration "Release"
    targetdir "bin/release"
```

