## system

指定目标操作系统。

```lua
system ("value")
```

如果未指定系统，则Premake将识别并定位当前操作系统。可以使用--os命令行参数将其覆盖，并提供以下系统标识符之一。

### 参数

value 是其中之一

- aix
- bsd
- [haiku](http://www.haiku-os.org/)
- linux
- macosx
- solaris
- wii
- windows
- xbox360

### 应用于

项目配置

### 可用性

premake 5.0 或更高版本

### 示例

```lua
workspace "MyWorkspace"
   configurations { "Debug", "Release" }
   system { "Windows", "Unix", "Mac" }

   filter "system:Windows"
      system "windows"

   filter "system:Unix"
      system "linux"

   filter "system:Mac"
      system "macosx"
```

