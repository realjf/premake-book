## 预编译头

由于不同工具集处理预编译头文件的方式不同，这个主题比它需要的复杂得多。

VisualStudio需要两条信息才能启用预编译头：*头文件*将被预编译，并且*源文件*触发和控制编译。在默认的、现成的visualstudio生成的C项目中，这些 *stdafx.h.公司*和*stdafx.cpp公司*分别。可以在Premake中如下设置：

```lua
pchheader "stdafx.h"
pchsource "stdafx.cpp"
```

其他工具集（到目前为止）只需要头文件。

PCH源文件只是一个常规的旧源代码文件，其中包含一行：一个include语句，它拉入要预编译的头：

```lua
#include "stdafx.h"
```

没有什么特别的，但是您必须拥有此文件才能使预编译头在VisualStudio中工作。您可以随意调用此文件，并将其放在源代码树中的任何位置。与任何其他文件一样，预编译头源文件的路径应相对于项目脚本进行设置，并自动相对于生成的项目文件进行设置。非visualstudio工具集将忽略`pchsource`值，所以无条件地设置它是安全的。

另一方面，设置头文件要复杂一些。

### 设置头文件

在设置预编译头文件时，您没有提供预期的文件路径。而是指定include在源代码中的显示方式。大多数情况下，标题位于项目源树的根级别，与项目文件位于同一文件夹中，并且您可以这样包含它：

```lua
#include "stdafx.h"
```

在这种情况下，您的预编译头应该设置为“stdafx.h”。很简单。在预生成脚本中，将设置：

```lua
pchheader "stdafx.h"
```

如果您有嵌套在子文件夹中的源代码，例如`./utils/myhelper.cpp`? 通常，在这种情况下，您需要修改include语句，以引用位于项目根目录（比您高一级）的头文件：

```lua
#include "../stdafx.h"
```

但是visualstudio将给您一个错误，声称找不到预编译头。它是项目的所有文件，寻找与预编译头字符串“stdafx.h”完全匹配的文件。如果源代码嵌套在多个级别的文件夹中，则它们都必须包含使用相同字符串的预编译头，其中包含标头的文件夹列在包含文件搜索路径中。在Premake speak中，您必须：

```lua
pchheader "stdafx.h"
includedirs { "." }  -- assuming the project file will be in this directory
```

所有源代码文件都必须包含以下标题：

```lua
#include "stdafx.h"
```

如果确实要在include语句中包含路径，则必须在预生成脚本中完全匹配该路径。

```lua
#include "include/stdafx.h"
```

```lua
pchheader "include/stdafx.h"
```

如果你需要更多的信息，或者一步一步的解释，这里有[关于CodeProject的一篇好文章](http://www.codeproject.com/Articles/320056/Projects-in-Visual-Cplusplus-2010-Part-3-Precompil)其中介绍了为VisualStudio设置预编译头的过程。

注：指定时`pchsource`请确保包含指向` PCH源`文件就像你的常规源文件一样。否则，Visual Studio将不会生成 ***.pch公司**文件。提供了一个示例，其中src_dir是指向源代码的路径。

```lua
pchsource(src_dir.."stdafx.cpp")
files{src_dir.."**.h", src_dir.."**.cpp"}
```

## 非visualstudio工具的注意事项

Premake尽其所能使所有这些在其支持的工具集上透明地工作。例如，如果您的头位于一个名为`includes`你的项目设置如下：

```lua
pchheader "stdafx.h"
includedirs { "includes" }
```

…Premake足够聪明，可以检查include搜索路径以定位头，并在生成的makefile中创建所需的force include。

```lua
FORCE_INCLUDE = -include includes/stdafx.h
```

如果出于任何原因，您无法在其他平台上遵循visualstudio约定，则可以始终将头描述嵌套在适当的配置块中。

```lua
filter "action:vs*"  -- for Visual Studio actions
    pchheader "stdafx.h"
    pchsource "stdafx.cpp"

filter "action:not vs*"  -- for everything else
    pchheader "includes/std.afx.h"
```

### 摘要

这里需要记住的重要事项是：

- 如果希望代码在VisualStudio中使用预编译头生成，则`#include`语句在所有源代码文件中必须完全相同。或者可以使用编译器选项/FI（名称强制包含文件）https://docs.microsoft.com/en-us/cpp/build/reference/fi-name-forced-include-file?view=vs-2017
- 在预生成脚本中指定PCH头时，提供的值应与源代码中的值匹配`#include`完全正确
- 提供给`pchheader`被视为*一串*，不是*路径*与生成的项目文件不相关。更确切地说，它是按原样通过的。
- 如果源代码树中有多个文件夹级别，则必须将包含要预编译的头的文件夹添加到包含文件搜索路径中。