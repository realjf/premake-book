## filename

设置生成的工作空间，项目或规则文件的名称。结合位置使用它可以完全控制生成的文件目标。

```lua
filename ("name")
```

默认情况下，生成的工作空间，项目和规则文件使用其名称作为生成文件的名称。文件名功能允许您更改此设置。

### 参数

name是生成的工作空间或项目文件的所需文件名。不指定文件扩展名，Premake会自动将文件的正确扩展名添加到末尾。

### 应用于

工作空间、项目、和rule文件

### 示例

将工作空间名称更改为“Master”。

```lua
workspace "MyWorkspace"
  filename "Master"
```

如果计划使用同一源树中的多个工具进行构建，则可能需要按工具集拆分项目文件。 _ACTION全局变量包含在命令行上指定的当前工具集标识符。

```lua
workspace "MyWorkspace"
   filename "MyWorkspace_%{_ACTION or ''}"
```

