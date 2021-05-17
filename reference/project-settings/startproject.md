## startproject

指定工作空间的启动项目。

```lua
startproject "name"
```

当前，Visual Studio仅支持启动项目。

### 参数

name是启动项目的名称。此名称应与定义项目的对project（）的调用中提供的名称匹配。

### 应用于

工作空间

### 可用性

premake 5.0或更高版本

### 示例

```lua
workspace "MyWorkspace"
    configurations { "Debug", "Release" }
    startproject "MyProject2"

project "MyProject1"
    -- define project 1 here

project "MyProject2"
    -- define project 2 here
```

