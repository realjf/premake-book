## newaction

注册新的命令行操作参数。

```lua
newaction { description }
```

### 参数

description是描述新动作的表格。它可能包含以下字段：

|                  |                                                              |
| ---------------- | ------------------------------------------------------------ |
| trigger          | 用户在命令行上输入的内容以选择操作，例如“ vs2013”。          |
| shortname        | 帮助文本的简短摘要，例如“ Visual Studio 2013”。              |
| description      | 对动作结果的描述，例如“生成Visual Studio 2013项目文件”。     |
| execute          | 触发动作时要执行的功能。                                     |
| os               | 如果工具集针对特定的OS，则该OS的[标识符](/reference/project-settings/system.md)。 |
| valid_kinds      | 该操作支持的[项目类型](/reference/project-settings/kind.md)列表。 |
| valid_languages  | 操作支持的[语言](/reference/project-settings/language.md)列表。 |
| valid_tools      | 操作支持的[工具](/reference/project-settings/toolset.md)列表。 |
| onStart          | 标记动作处理开始的回调。                                     |
| onWorkspace      | 用户脚本中指定的每个工作区的回调。                           |
| onProject        | 用户脚本中指定的每个项目的回调。                             |
| onRule           | 用户脚本中指定的每个规则的回调。                             |
| onEnd            | 指示动作处理结束的回调。                                     |
| onCleanWorkspace | 选择clean动作时，每个工作区的回调。                          |
| onCleanProject   | 选择clean动作时，每个项目的回调。                            |
| onCleanTarget    | 选择清洁操作时，每个目标的回调                               |
| pathVars         | Premake令牌到工具集特定标识符的映射。                        |

回调将按以下顺序触发：

- onStart（）
  - 每个工作区的onWorkspace（）。
  - 每个工作区中每个项目的onProject（） 
- 每个规则的onRule（） 
- execute（） 
- onEnd（）

### 可用性

premake 5.0 或更高版本

### 示例

注册新操作以安装软件项目。

```lua
newaction {
   trigger     = "install",
   description = "Install the software",
   execute     = function ()
      os.copyfile("bin/debug/myprogram", "/usr/local/bin/myprogram")
   end
}
```

