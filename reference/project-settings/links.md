## links

指定要链接的库和项目的列表。

```lua
links { "references" }
```

### 参数

references是库和项目名称的列表。

当链接到同一工作空间中的另一个项目时，请在此处指定项目名称，而不是库名称。 Premake将为当前配置找出要链接的正确库，并且还将在项目之间创建依赖关系以确保正确的构建顺序。

针对系统库进行链接时，请勿包含任何前缀或文件扩展名。 Premake将为当前平台使用适当的命名约定。 有两个例外：

- 通过显式指定“ .dll”文件扩展名，托管C ++项目可以链接到托管程序集。 应当继续指定不受管理的库，而不进行任何修饰。

- 可以通过显式包含“ .framework”文件扩展名来链接目标C框架。

- 对于Visual Studio，这会将指定的项目添加到“引用”中。 相反，“ dependson”在两个项目之间的解决方案中生成构建顺序依赖关系。

### 应用于

项目配置

### 可用性

premake 4.0 或更高版本

### 示例

链接到某些系统库。

```lua
configuration "windows"
   links { "user32", "gdi32" }

configuration "linux"
   links { "m", "png" }

configuration "macosx"
   -- OS X frameworks need the extension to be handled properly
   links { "Cocoa.framework", "png" }
```

在具有两个项目的工作区中，将库链接到可执行文件。请注意，项目名称用于指定链接。 Premake将自动找出正确的库文件名和目录，并创建项目依赖项。

```lua
workspace "MyWorkspace"
 configurations { "Debug", "Release" }
 language "C++"

 project "MyExecutable"
    kind "ConsoleApp"
    files "**.cpp"
    links { "MyLibrary" }

 project "MyLibrary"
    kind "SharedLib"
    files "**.cpp"
```

您也可以在非图书馆项目之间创建链接。 在这种情况下，Premake将生成一个生成依赖项（链接的项目将首先生成），而不是实际的链接。 在此示例中，MyProject使用构建依赖项来确保首先构建MyTool。 然后，它将MyTool用作其构建过程的一部分。

```lua
workspace "MyWorkspace"
   configurations { "Debug", "Release" }
   language "C++"

   project "MyProject"
      kind "ConsoleApp"
      files "**.cpp"
      links { "MyTool" }
      prebuildcommands { "MyTool --dosomething" }

   project "MyTool"
      kind "ConsoleApp"
      files "**.cpp"
```

