## disablewarnings

禁用特定的编译器警告。

```lua
disablewarnings { "warnings" }
```

### 参数

warnings 是要禁用的警告列表。

对于Visual Studio，应使用MSC警告号来指定警告。在其他编译器上，警告应按名称标识。

### 应用于

项目配置

### 可用性

premake 5.0 或更高版本

Xcode项目生成尚不支持disablewarnings。解决方法是，可以像这样使用[[xcodebuildsettings]]：

```lua
xcodebuildsettings { 
    WARNING_CFLAGS = "-Wall -Wextra " ..
        "-Wno-missing-field-initializers " ..
        "-Wno-unknown-pragmas " ..
        "-Wno-unused-parameter " ..
        "-Wno-unused-local-typedef " ..
        "-Wno-missing-braces " ..
        "-Wno-microsoft-anon-tag "
}
```

### 示例

禁用有关使用旧式C强制转换的GCC警告（-Wno-old-style-cast命令行参数）：

```lua
filter "options:cc=gcc"
  disablewarnings "old-style-cast"
```

