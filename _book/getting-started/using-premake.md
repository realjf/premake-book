## 使用 premake

是Premake的新手吗？您可能想从什么是Premake开始？

如果尚未安装，则可以在此处下载Premake，也可以从源代码进行构建。 Premake是一个小型命令行可执行文件，以单个文件形式提供。只需解压缩下载文件，然后将可执行文件放在系统搜索路径或其他方便的位置。

### 使用Premake生成项目文件

最简单的Premake命令是：

```sh
premake5 [action]
```

Premake开箱即用地定义了以下动作列表；项目也可以添加自己的自定义操作。

| Action   | 描述                                       |
| -------- | ------------------------------------------ |
| vs2019   | 生成Visual Studio 2019项目文件             |
| vs2017   | 生成Visual Studio 2017项目文件             |
| vs2015   | 生成Visual Studio 2015项目文件             |
| vs2013   | 生成Visual Studio 2013项目文件             |
| vs2012   | 生成Visual Studio 2012项目文件             |
| vs2010   | 生成Visual Studio 2010项目文件             |
| vs2008   | 生成Visual Studio 2008项目文件             |
| vs2005   | 生成Visual Studio 2005项目文件             |
| gmake    | 生成GNU Makefile（此生成器已被gmake2弃用） |
| gmake2   | 生成GNU Makefile（包括Cygwin和MinGW）      |
| xcode4   | XCode项目                                  |
| codelite | CodeLite项目                               |

Premake4支持尚未移植到此新版本的一些其他操作；有关整个列表，请参见“可用功能列表”。

要生成Visual Studio 2013项目文件，请使用以下命令：

```shell
premake5 vs2013
```

您可以使用以下命令查看项目支持的操作和其他选项的完整列表：

```
premake5 --help
```

### 使用生成的项目

对于像Visual Studio和Xcode这样的工具集，您可以简单地将生成的工作空间加载到IDE中并像往常一样进行构建。

如果生成了makefile，则不带选项运行make将使用项目作者设置的默认配置来构建所有目标。要查看可用配置列表，请键入：

```sh
make help
```

要构建其他配置，请添加config参数：

```sh
make config=release
```

要删除所有生成的二进制文件和中间文件：

```sh
make clean                 # to clean the default target
make config=release clean  # to clean a different target
```

Premake生成的makefile（当前）不支持make安装步骤。相反，鼓励项目所有者在其Premake脚本中添加安装操作，这具有在任何平台上使用任何工具集的优势。

您可以通过查看帮助来检查是否存在安装操作（在项目目录中运行premake5 --help）