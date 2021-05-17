## include

查找并执行另一个脚本文件（如果以前未运行过）

```lua
include("path")
```

### 参数

path是脚本文件或目录的文件系统路径。如果指定了目录，Premake将在该目录中查找名为premake5.lua的文件并运行（如果找到）。

如果指定的文件或目录以前已经包含在内，则该调用将被忽略。如果要多次执行同一脚本，请改用Lua的dofile（）

### 返回值

包含的脚本返回的所有值都将传递给调用方。

### 可用性

premake 5.0或更高版本

### 示例

```lua
-- runs "src/MyApplication/premake5.lua"
include "src/MyApplication"

-- runs "my_script.lua" just once
include "my_script.lua"
include "my_script.lua"
```

