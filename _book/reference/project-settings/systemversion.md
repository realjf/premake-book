## systemversion

指定目标操作系统的最低和最高版本。

```lua
systemversion ("value")
```

### 参数

value是用冒号分隔的字符串，指定最小和最大版本min：max。

### 应用于

项目

### 可用性

premake 5.0 或更高版本

### 示例

```lua
workspace "MyWorkspace"
   configurations { "Debug", "Release" }
   platforms { "Windows" }

   filter "system:Windows"
      systemversion "10.0.10240.0" -- To specify the version of the SDK you want
```

```lua
workspace "MyWorkspace"
   configurations { "Debug", "Release" }
   platforms { "Windows" }

   filter "system:Windows"
      systemversion "latest" -- To use the latest version of the SDK available
```

