## flags

指定构建标志以修改编译或链接过程。

```lua
flags { "flag_list" }
```

### 参数

flag_list是字符串标志名称的列表；有关有效标志的列表，请参见下文。标志值不区分大小写。特定平台或工具集不支持的标志将被忽略。

| flag                  | 描述                                                         | 备注 |
| --------------------- | ------------------------------------------------------------ | ---- |
| ExcludeFromBuild      | 从构建中排除当前配置的源代码文件。                           |      |
| FatalCompileWarnings  | 将编译器警告视为错误。                                       |      |
| FatalLinkWarnings     | 将链接器警告视为错误。                                       |      |
| FatalWarnings         | 将所有警告视为错误；等同于FatalCompileWarnings，FatalLinkWarnings |      |
| LinkTimeOptimization  | 启用链接时（即整个程序）优化。                               |      |
| Maps                  | 为Visual Studio启用生成地图文件                              |      |
| MFC                   | 启用对Microsoft基础类的支持。                                |      |
| MultiProcessorCompile | 使Visual Studio可以在构建时使用多个编译器进程。              |      |
| No64BitChecks         | 禁用64位可移植性警告。                                       |      |
| NoBufferSecurityCheck | 关闭堆栈保护检查。                                           |      |
| NoCopyLocal           | 防止将引用的程序集复制到目标目录（C＃）                      |      |
| NoFramePointer        | 禁用堆栈帧指针的生成。                                       |      |
| NoImplicitLink        | 禁用Visual Studio自动链接依赖项目的默认行为。                |      |
| NoImportLib           | 防止为Windows DLL生成导入库。                                |      |
| NoIncrementalLink     | 禁用对Visual Studio的增量链接功能的支持。                    |      |
| NoManifest            | 防止为Windows可执行文件和共享库生成清单。                    |      |
| NoMinimalRebuild      | Visual Studio的最小重建禁用功能。                            |      |
| NoPCH                 | 禁用预编译头支持。如果未指定，将使用工具集的默认行为。       |      |
| NoRuntimeChecks       | 在调试版本上禁用Visual Studio的默认堆栈框架和未初始化的变量检查。 |      |
| OmitDefaultLibrary    | 省略对象文件中运行时库的规范。                               |      |
| RelativeLinks         | 强制链接器使用库的相对路径，而不是绝对路径。                 |      |
| ShadowedVariables     | 当变量，类型声明或函数被遮盖时发出警告。                     |      |
| StaticRuntime         | 针对标准运行时库执行静态链接。                               |      |
| UndefinedIdentifiers  | 如果在#if指令中评估了未定义的标识符，则发出警告。            |      |
| WinMain               | 使用WinMain（）作为Windows应用程序的入口点，而不是默认的main（）。 |      |
| WPF                   | 将项目标记为使用Windows Presentation Framework，而不是WinForms。 |      |
| C++11                 | 将c ++ 11标志传递给gcc / clang编译器（msvc当前将其忽略）     |      |
| C++14                 | 将c ++ 14标志传递给gcc / clang编译器（msvc当前将其忽略）     |      |
| C90                   | 将c90标志传递给gcc / clang编译器（msvc当前将其忽略）         |      |
| C99                   | 将c99标志传递给gcc / clang编译器（msvc当前将其忽略）         |      |

### 应用于

项目和文件配置，尽管并非所有标记都支持所有导出器中的文件。

### 可用性

除非另有说明，否则为Premake 5.0或更高版本。

### 示例

```lua
-- Enable link-time (i.e. whole program) optimizations.
flags { "LinkTimeOptimization" }
```

