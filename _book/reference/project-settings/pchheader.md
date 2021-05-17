## pchheader

指定预编译头文件名的#include形式。

```lua
pchheader ("name.h")
```

### 参数

name.h是预编译头文件的名称，如项目源代码的#include语句中所指定。如果您的源代码包含这样的标头：

```lua
#include "myproject.h"
```

...这样指定脚本中的标头，即使文件本身位于相对于项目的其他路径上（也可能是在编译时通过包含文件搜索路径找到的）：

```lua
pchheader "myproject.h"
```

### 应用于

项目配置

### 可用性

premake 4.0或更高版本