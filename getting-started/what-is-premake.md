## 什么是 premake？

Premake是一个命令行实用程序，它读取软件项目的脚本定义，并且最常见的是，使用它来为Visual Studio，Xcode或GNU Make等工具集生成项目文件。

```lua
workspace "MyWorkspace"
   configurations { "Debug", "Release" }

project "MyProject"
   kind "ConsoleApp"
   language "C++"
   files { "**.h", "**.cpp" }

   filter { "configurations:Debug" }
      defines { "DEBUG" }
      symbols "On"

   filter { "configurations:Release" }
      defines { "NDEBUG" }
      optimize "On"
```

premake示例脚本

```shell
$ premake5 vs2012
Building configurations...
Running action 'vs2012'...
Generating MyWorkspace.sln...
Generating MyProject.vcxproj...
Generating MyProject.vcxproj.user...
Done.
```

Premake读取脚本并生成项目脚本

### 使用Premake来…

- 通过允许开发人员使用他们喜欢的平台和工具集，最大程度地扩大潜在受众。
- 允许开发人员自定义构建，并输出特定于该配置的项目文件。
- 通过根据需要从Premake脚本生成项目，使构建在各个工具集之间保持同步。
- 快速更新具有许多工作区和项目的大型代码库：在Premake脚本中进行一次更改，然后重新生成。
- 为您不拥有的工具集创建项目文件。
- 快速升级到所选工具集的较新版本。
- 编写通用配置脚本并构建维护任务。

### 关键特性

当前的Premake 5.0开发版本可以生成针对以下方面的C，C ++或C＃项目：

- Microsft Visual Studio 2005-2019
- GNU Make, including Cygwin and MinGW
- Xcode
- Codelite

Premake的先前版本还支持导出MonoDevelop和Code :: Blocks。我们正在使这些出口商重新上线以获取最终版本。

Premake 5.0生成的项目可以支持：

- 32- and 64-bit builds
- Xbox 360 (Visual Studio only)

附加模块可以通过支持其他语言，框架和工具集来扩展Premake。

除了其项目生成功能外，Premake还提供了完整的Lua脚本环境，可实现复杂的配置任务的自动化，例如设置新的源代码树检出或创建部署包。这些脚本将在任何平台上运行，从而结束批处理/ shell脚本重复。

Premake是一个“普通C语言”应用程序，以单个可执行文件的形式分发。它很小，重约200K。它不需要安装任何其他库或运行时，并且几乎可以在任何地方构建和运行。目前正在Windows，Mac OS X，Linux和其他POSIX环境上对其进行测试和使用。它仅使用少数与平台相关的例程（主要是目录管理）。添加对其他工具集和语言的支持非常简单。源代码在BSD许可下可用。源代码直接托管在GitHub上；文件下载当前托管在SourceForge上。



