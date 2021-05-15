## 范围和继承

从前面的示例中您可能已经注意到，Premake使用伪声明性语法来指定项目信息。您为设置指定作用域（即工作空间或项目），然后将设置放置在该作用域中。

范围具有层次结构：包含工作区的全局范围，而工作区又包含项目。 放入外部作用域的值由内部作用域继承，因此工作空间继承了存储在全局作用域中的值，而项目继承了存储在工作空间中的值。

```lua
-- global scope, all workspaces will receive these values
defines { "GLOBAL" }

workspace "MyWorkspaces"
  -- workspace scope inherits the global scope; the list value
  -- will now be { "GLOBAL", "WORKSPACE" }
  defines { "WORKSPACE" }

project "MyProject"
  -- project scope inherits from its workspace; the list value
  -- will now be { "GLOBAL", "WORKSPACE", "PROJECT" }
  defines { "PROJECT" }
```

有时返回并向先前声明的范围添加值可能会有所帮助。您可以按照首先声明的方式进行操作：通过使用相同的名称调用 **workspace** 或 **project**

```lua
-- declare my workspace
workspace "MyWorkspace"
  defines { "WORKSPACE1" }

-- declare a project or two
project "MyProject"
  defines { "PROJECT" }

-- re-select my workspace to add more settings, which will be inherited
-- by all projects in the workspace
workspace "MyWorkspace"
  defines { "WORKSPACE2" }  -- value is now { "WORKSPACE1", "WORKSPACE2" }
```

您也可以通过使用特殊的“ *”名称来选择当前作用域的父项或容器，而不必知道其名称。

```lua
-- declare my workspace
workspace "MyWorkspace"
  defines { "WORKSPACE1" }

-- declare a project or two
project "MyProject"
  defines { "PROJECT" }

-- re-select my workspace to add more settings
project "*"
  defines { "WORKSPACE2" }  -- value is now { "WORKSPACE1", "WORKSPACE2" }

-- re-select the global scope
workspace "*"
```

将“ *”视为通配符，表示“我的父容器中的所有项目”或“全局范围内的所有工作空间”。

