## kind

设置由项目或配置创建的二进制对象的类型，例如控制台或窗口化应用程序，或共享库或静态库。

```lua
kind ("kind")
```

### 参数

kind是以下字符串标识符之一：

| 值          | 描述                                                         |
| ----------- | ------------------------------------------------------------ |
| ConsoleApp  | 控制台或命令行应用程序。                                     |
| WindowedApp | 在桌面窗口中运行的应用程序。此区别不适用于Linux，但在Windows和Mac OS X上很重要。 |
| SharedLib   | 共享库或DLL。                                                |
| StaticLib   | 静态库。                                                     |
| Makefile    | 一种特殊的配置类型，可调用一个或多个外部命令。未指定创建的二进制文件的实际类型。有关更多信息，请参见Makefile项目。 |
| Utility     | 仅包含自定义构建规则的配置。                                 |
| None        | 构造中不包含的配置。对于仅包含网页，头文件或支持文档的项目很有用。 |
| Packaging   | 用于创建.androidproj文件的配置类型，该文件将在Visual Studio下的Android应用程序中构建apk。注意，这以前是AndroidProj。 |

### 应用于

项目配置

### 可用性

Makefile和None类型仅在Premake 5.0和更高版本中可用，并且当前仅在Visual Studio中受支持。 “**Utility** ”类型仅适用于Visual Studio和gmake2，并且对gmake的支持非常有限。

### 示例

设置项目以构建命令行可执行文件。

```lua
kind "ConsoleApp"
```

设置项目以构建共享库（DLL）。

```lua
kind "SharedLib"
```

根据所选的构建配置，构建静态库或共享库。

```lua
workspace "MyWorkspace"
   configurations { "DebugLib", "DebugDLL", "ReleaseLib", "ReleaseDLL" }

project "MyProject"

   filter "*Lib"
      kind "StaticLib"

   filter "*DLL"
      kind "SharedLib"
```

