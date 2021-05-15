## 工作区和项目

为了方便起见，Premake遵循Visual Studio约定来构建内部版本及其组件的命名。

### 工作区

​		在每个版本的顶层都有一个工作区，它充当项目的容器。 其他工具（尤其是Visual Studio）可以使用术语解决方案。 

工作区定义了一套通用的构建配置和平台，可在所有包含的项目中使用。 您还可以在此级别指定其他构建设置（定义，包含路径等），这些设置将类似地由项目继承。 

使用 **workspace** 功能定义工作空间。 大多数构建只需要一个工作空间，但是如果需要，您可以自由创建更多工作空间。 构建配置是使用 **configurations** 功能指定的，并且是必需的。 有关更多信息，请参见[配置和平台](writing-premake-scripts/configurations-and-platforms.md)。

```lua
workspace "HelloWorld"
   configurations { "Debug", "Release" }
```

作为函数参数提供的工作空间名称用作生成的工作空间文件的默认文件名，因此最好避免使用特殊字符（可以的空格）。如果您希望使用其他名称，请使用 **filename** 功能进行指定。

```lua
workspace "Hello World"
   filename "Hello"
   configurations { "Debug", "Release" }
```

> 注意：由于Xcode处理目标依赖项的方式存在错误，因此我们目前尚未为其生成“工作区”文件。

### 项目

工作区的主要目的是充当项目的容器。 一个项目列出了构建一个二进制目标所需的设置和源文件。 几乎每个IDE都为此使用术语“项目”。 在Make的世界中，您可以将项目视为一个特定库或可执行文件的makefile。 工作区是一个元生成文件，可根据需要调用每个项目。

使用 **project** 功能定义项目。您必须首先创建包含工作区。

```lua
workspace "MyWorkspace"
  configurations { "Debug", "Release" }

project "MyProject"
```

项目名称与工作区名称一样，都用作生成的项目文件的文件名，因此请避免使用特殊字符，或使用 **filename** 功能提供其他值。

每个项目都指定一种类型，该类型确定生成哪种类型的输出，例如控制台或窗口可执行文件，还是共享库或静态库。 **kind**  功能用于指定该值。

每个项目还指定其使用的编程语言，例如C ++或C＃。**language** 功能用于设置该值。

```lua
project "MyProject"
  kind "ConsoleApp"
  language "C++"
```

### 位置

默认情况下，Premake会将生成的工作空间和项目文件与定义它们的脚本放在同一目录中。如果您的Premake脚本位于C：\ Code \ MyProject中，则生成的文件也将位于C：\ Code \ MyProject中。

您可以使用 **location** 功能更改输出位置。

```
workspace "MyWorkspace"
  configurations { "Debug", "Release" }
  location "build"

project "MyProject"
  location "build/MyProject"
```

像Premake中的所有路径一样，应该相对于脚本文件指定 **location**。使用上面的示例和脚本，将生成的工作空间放置在C：\ Code \ MyProject \ build中，并将项目放置在C：\ Code \ MyProject \ build \ MyProject中。

