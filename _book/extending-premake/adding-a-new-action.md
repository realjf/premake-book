## 添加新的action

Visual Studio，Makefile和Premake中包含的其他导出器都是“动作”。 他们从您的项目脚本中获取信息并执行操作：在这些示例中，他们输出特定工具集的项目文件。

Premake提供了创建自己的动作的功能。 这些可以是简单的一次性操作，例如为首次使用准备源代码的工作副本，也可以是对全新工具集的复杂支持。

本教程分步介绍了创建新动作的过程，该动作将解决方案和项目信息输出为Lua表，然后您可以根据需要使用Premake进行读取和操作。

- 开始新动作
- 生成项目文件
- 使用配置
- 更多内容！
