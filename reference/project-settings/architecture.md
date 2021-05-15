## architecture

指定配置要针对的系统体系结构。

```lua
architecture ("value")
```

### 参数

`value` 可以是以下之一:

- `x86`
- `x86_64`
- `ARM`

### 适用于

项目配置

### 可用性

Premake 5.0 或更高版本

### 实例

设置32位和64位Windows版本。

```lua
workspace "MyWorkspace"
   configurations { "Debug32", "Release32", "Debug64", "Release64" }

   filter "configurations:*32"
      architecture "x86"

   filter "configurations:*64"
      architecture "x86_64"
```

