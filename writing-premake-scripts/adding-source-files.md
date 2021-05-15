## 添加源文件

您可以使用 **files** 功能将文件（源代码，资源等）添加到项目中。

```lua
files {
   "hello.h",  -- you can specify exact names
   "*.c",      -- or use a wildcard...
   "**.cpp"    -- ...and recurse into subdirectories
}
```

您可以在文件模式中使用通配符来匹配一组文件。通配符*将匹配一个目录中的文件；通配符**将匹配一个目录中的文件，并且还递归到任何子目录中。

应相对于脚本文件指定其他目录中的文件。例如，如果脚本位于MyProject / build上，而源文件位于MyProject / src，则文件应指定为：

```lua
files { "../src/*.cpp" }
```

路径应始终使用正斜杠/作为分隔符； Premake将根据需要转换为适当的特定于平台的分隔符。

### 排除文件

有时，您需要目录中的大多数（但不是全部）文件。在这种情况下，请使用removefiles（）函数掩盖这几个例外。

```lua
files { "*.c" }
removefiles { "a_file.c", "another_file.c" }
```

排除项也可以使用通配符。

```lua
files { "**.c" }
removefiles { "tests/*.c" }
```

有时您可能想排除特定目录中的所有文件，但不确定该目录在源树中的位置。

```lua
files { "**.c" }
removefiles { "**/Win32Specific/**" }
```

