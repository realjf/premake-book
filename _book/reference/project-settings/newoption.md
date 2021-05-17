## newoption

注册新的命令行选项。

```lua
newoption { description }
```

### 参数

description是描述新选项的表格。它可能包含以下字段：

|             |                                                              |
| ----------- | ------------------------------------------------------------ |
| trigger     | 用户在命令行上键入的内容以选择选项，例如“ --name”。          |
| description | 选项的简短描述，将显示在帮助文本中。                         |
| value       | 可选的。如果该选项需要一个值，则向用户提示需要什么类型的数据。 |
| allowed     | 可选的。键值对列表，列出了该选项的允许值。                   |
| default     | 可选的。如果未在命令行上指定，则设置此选项的默认值。         |

### 可用性

premake 4.0或更高版本

### 示例

注册新选项以选择3D应用程序的渲染API。

```lua
newoption {
   trigger     = "gfxapi",
   value       = "API",
   description = "Choose a particular 3D API for rendering",
   default     = "opengl",
   allowed = {
      { "opengl",    "OpenGL" },
      { "direct3d",  "Direct3D (Windows only)" },
      { "software",  "Software Renderer" }
   }
}
```

