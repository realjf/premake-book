## location

设置生成的工作空间或项目文件的目标目录。

```lua
location ("path")
```

默认情况下，工作空间和项目文件与定义它们的脚本生成在同一目录中。location功能可让您更改此位置。

请注意，与其他值不同，location不会自动传播到所包含的项目。除非明确覆盖，否则项目将使用其默认位置。

### 参数

path是应该将生成的文件存储在的目录，相对于当前正在执行的脚本文件指定。

### 应用于

工作空间和项目

### 可用性

premake 4.0 或更高版本

### 示例

设置工作空间的目标目录。为项目设置位置的方法相同。

```lua
workspace "MyWorkspace"
  location "../build"
```

如果计划使用同一源树中的多个工具进行构建，则可能需要按工具集拆分项目文件。_ACTION全局变量包含在命令行上指定的当前工具集标识符。请注意，在这种情况下，Lua语法需要在函数参数周围加上括号。

```lua
location ("../build/" .. _ACTION)
```
