## 代码概述

### Premake快速浏览

Premake源代码分为几个不同的文件夹：

- src / actions包含内置操作和导出程序的代码，例如“ vs2012”或“ gmake”。我们正在逐步将它们迁移到独立的模块中，但是现在它们就住在这里。

- src / base包含核心的Lua脚本，用于读取和处理项目脚本的代码以及操作和导出程序的支持逻辑。

- src / host包含所有C语言代码，这些逻辑要么由于需要与底层操作系统交互的方式而难以用Lua编写，要么因为Lua的实现速度太慢。我们尝试将C代码保持在最低限度，并尽可能使用Lua来启用覆盖和调用数组。

- src / tools包含用于命令行工具集（例如GCC和Clang）的适配器。在不久的将来，我们可能还会将它们迁移到模块中。

- modules包含正式的模块集，这些模块作为Premake的一部分进行分发。这些模块将对其他语言和工具集的支持添加到src文件夹中的核心代码中。


除了这些常规类别之外，还有一些特殊的注释文件：

- src / _premake_main.lua包含Lua端程序入口点，并负责主应用程序流。 C侧程序入口点main（）位于src / host / premake_main.c中。

- src / _premake_init.lua设置了许多初始配置，包括所有项目脚本功能，默认的命令行参数集和默认的项目配置。

- src / _modules.lua包含在启动时自动加载的内置模块的列表。有关更多信息，请参见嵌入模块。

- src / _manifest.lua列出了在构建发行版时应嵌入到Premake可执行文件中的Lua脚本。 Premake的核心脚本和每个嵌入式模块都有单独的清单。


### 代码执行概述

执行从src / host / premake_main.c中的main（）开始，它调用src / host / premake.c来进行真正的引导工作：

- premake_init（）将所有Premake的本机C扩展安装到Lua脚本环境。

- premake_execute（）查找并运行src / _premake_main.lua，该文件可能会嵌入可执行文件中以进行发行版本构建，也可以位于文件系统上。

- src / _premake_main.lua依次读取src / _manifest.lua并加载那里列出的所有脚本。值得注意的是，这包括src / _premake_init.lua

- src / premake_main.lua完成后，premake_execute（）调用_premake_main（），它位于src / _premake_main.lua的末尾，并等待其返回。


在这一点上，处决已经进入并留在了Lua。现在可以通过覆盖函数和调用数组来扩展Premake。

_premake_main（）使用调用数组来控制评估用户脚本和对结果执行操作的高级过程。此列表中的重要功能包括：

- prepareEnvironment（）设置更多的全局变量，否则可以立即使用脚本环境。

- locateUserScript（）用于查找用户的项目脚本，即文件系统上的premake5.lua。

- 如果需要，checkInteractive（）负责启动REPL提示符。

- runSystemScript（）运行用户的系统脚本，runUserScript（）运行由locateUserScript（）找到的项目脚本。

- processCommandLine（）处理任何命令行选项并设置目标操作和参数。这需要在项目脚本运行后发生，以防它定义了新选项或修改了现有选项的行为，这是一个常见的混淆点。

- bake（）接受用户项目脚本中指定的所有项目和配置信息，并准备将其供目标操作使用，该操作有些复杂，在src / base / oven.lua中实现。

- validate（）检查已处理的配置信息，并尝试确保所有信息都有意义，并且所有必需的数据均可用。主要的验证逻辑位于src / base / validation.lua中。

- callAction（）将每个工作空间，项目，规则和其他容器传递给目标操作，从而导致发生适当的结果（例如生成Visual Studio项目或GNU makefile）。此容器迭代是在src / base / action.lua中的action.call（）中完成的。


通过callAction（）调用动作是大多数人最感兴趣的部分开始的地方。控制权现在转移到出口商之一，从而导致项目文件被写入。有关如何发生的更多信息，请参阅创建新操作。