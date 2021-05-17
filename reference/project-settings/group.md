## group

启动一个“工作区组”，这是一个包含一个或多个项目的虚拟文件夹。

```lua
group("name")
```

### 参数

name是虚拟文件夹的名称，它应该显示在IDE中。可以通过用正斜杠分隔名称来创建嵌套组。

### 应用于

工作空间

### 可用性

premake 5.0或更高版本

### 示例

```lua
workspace "MyWorkspace"

-- put the projects "Tests1" and "Tests2" in a virtual folder named "Tests"

group "Tests"

    project "Tests1"
      -- Tests1 stuff goes here

   project "Tests2"
      -- Tests2 stuff goes here

-- Any project defined after the call to group() will go into that group. The
-- project can be defined in a different script though.

group "Tests"

    include "tests/tests1"
    include "tests/tests2"

-- Groups can be nested with forward slashes, like a file path.

group "Tests/Unit"

-- To "close" a group and put projects back at the root level use
-- an empty string for the name.

group ""

   project "TestHarness"
```

首次声明项目时，会锁定组值，但以后可以覆盖该值：

```lua
local prj = project "Tests1"
prj.group = "NotActuallyATest"
```

或

```lua
project("Tests1").group = "NotActuallyATest"
```

