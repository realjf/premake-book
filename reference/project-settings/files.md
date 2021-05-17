## files

将文件添加到项目。

```lua
files { "file_list" }
```

### 参数

file_list指定一个或多个文件模式。应该相对于当前正在执行的脚本文件指定文件路径。文件模式可能包含*通配符以与当前目录中的文件匹配，或者包含 **通配符以执行递归匹配。

如果通配符匹配的文件数量超出您的期望，则可以使用removefiles（）函数过滤结果。

### 应用于

项目配置。但是，并不是所有的导出器当前都支持按配置的文件列表。

### 示例

从包含脚本的同一目录中将两个文件从添加到当前项目。

```lua
files { "hello.cpp", "goodbye.cpp" }
```

将src /目录中的所有C ++文件添加到项目中。

```lua
files { "src/*.cpp" }
```

从src /目录和任何子目录添加所有C ++文件

```lua
files { "src/**.cpp" }
```

为特定系统添加文件；可能不适用于所有出口商。

```lua
filter "system:Windows"
  files { "src/windows/*.h", "src/windows/*.cpp" }

filter "system:MacOSX"
  files { "src/mac/*.h", "src/mac/*.cpp" }
```

