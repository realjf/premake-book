## 构建设置

Premake提供了不断增长的构建设置列表，您可以对其进行调整。 下表列出了一些最常见的配置任务，以及指向相应功能的链接。 有关可用设置和功能的完整列表，请参见Project API和Lua库添加。

如果您认为应该可以做一些事情，但又不知道该怎么做，请参阅支持。

| 指定二进制类型（可执行文件，库） | kind                     |
| -------------------------------- | ------------------------ |
| 指定源代码文件                   | files, removefiles       |
| 定义编译器或预处理器符号         | defines                  |
| 找到包含文件                     | includedirs              |
| 设置预编译头                     | pchheader,pchsource      |
| 链接库，框架或其他项目           | links,libdirs            |
| 启用调试信息                     | symbols                  |
| 针对大小或速度进行优化           | optimize                 |
| 添加任意构建标志                 | buildoptions,linkoptions |
| 设置编译目标的名称或位置         | targetname, targetdir    |

