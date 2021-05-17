## require

Lua的require（）函数的扩展，增加了对Premake模块和版本检查的支持。

```lua
require ("modname", "versions")
```

在定位请求的模块时，Premake将使用其扩展的模块位置集。

### 参数

modname是要加载的模块的名称。有关如何定位Premake模块的更多信息，请参见定位脚本。

versions是版本要求的可选字符串。有关需求字符串格式的更多信息，请参见下面的示例。如果不满足要求，将引发错误。

### 返回值

模块对象

### 可用性

premake 5.0 或更高版本

### 示例

需要Premake 5.0或更高版本。

```lua
require("premake", ">=5.0")
```

如果未指定运算符，则默认为“> =”。我认为将其包含进来更具可读性。

```lua
require("premake", "5.0")
```

需要版本5.0 alpha 3或更高版本

```lua
require("premake", ">=5.0.0-alpha3")
```

需要Premake 5.1和6.0之间的任何内容。

```lua
require("premake", ">=5.0 <6.0")
```

相同的规则适用于第三方模块。

```lua
require("foo", ">=1.1")
```

