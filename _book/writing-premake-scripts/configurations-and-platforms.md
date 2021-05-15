## 配置和平台

前面的示例显示了如何指定构建配置。

```lua
workspace "MyWorkspace"
   configurations { "Debug", "Release" }
```

您不仅限于这些名称，还可以使用对您的软件项目和构建环境有意义的任何名称。例如，如果可以将项目构建为静态库或共享库，则可以改用以下方法：

```lua
workspace "MyWorkspace"
   configurations { "Debug", "DebugDLL", "Release", "ReleaseDLL" }
```

重要的是要注意，这些名称本身并没有任何含义，您可以使用任何喜欢的名称。

```lua
workspace "MyWorkspace"
   configurations { "Froobniz", "Fozbat", "Cthulhu" }
```

构建配置的含义取决于您对其应用的设置，如前面的示例所示。

```lua
workspace "HelloWorld"
   configurations { "Debug", "Release" }

   filter "configurations:Debug"
      defines { "DEBUG" }
      flags { "Symbols" }

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
```

[过滤器](writing-premake-scripts/filters.md)部分将对此进行更详细的介绍

### 平台

“平台”在这里有点用词不当；我再次遵循Visual Studio命名法。实际上，平台只是另一组构建配置名称，提供了另一个用于配置项目的轴。

```lua
configurations { "Debug", "Release" }
platforms { "Win32", "Win64", "Xbox360" }
```

设置后，列出的平台将显示在IDE的“平台”列表中。因此，您可以选择“ Debug Win32”构建或“ Release Xbox360”构建，或两个列表的任意组合。

就像构建配置一样，平台名称本身没有任何意义。您可以通过使用 **filter** 功能应用设置来提供含义。

```lua
configurations { "Debug", "Release" }
platforms { "Win32", "Win64", "Xbox360" }

filter { "platforms:Win32" }
    system "Windows"
    architecture "x86"

filter { "platforms:Win64" }
    system "Windows"
    architecture "x86_64"

filter { "platforms:Xbox360" }
    system "Xbox360"
```

与构建配置不同，平台是完全可选的。如果您不需要它们，则根本不调用平台函数，并且将使用该工具集的默认行为。

平台只是构建配置的另一种形式。 您可以使用所有相同的设置，并且应用相同的作用域规则。 您可以在没有平台的情况下使用 **system** 和 **architecture（）** 的设置，也可以在平台配置中使用其他非平台的设置。 如果您曾经完成过诸如“ Debug Static”，“ Debug DLL”，“ Release Static”和“ Release DLL”之类的构建配置，则平台可以真正简化事情。

```lua
configurations { "Debug", "Release" }
platforms { "Static", "DLL" }

filter { "platforms:Static" }
    kind "StaticLib"

filter { "platforms:DLL" }
    kind "SharedLib"
    defines { "DLL_EXPORTS" }
```

### 每个项目的配置

现在可以按项目指定配置和平台列表。例如，应该为Windows构建而不是为游戏控制台构建的项目可以删除该平台：

```lua
workspace "MyWorkspace"
    configurations { "Debug", "Release" }
    platforms { "Windows", "PS3" }

project "MyProject"
    removeplatforms { "PS3" }
```

配置图的一个相关功能是将工作空间级别的配置转换为项目级别的值，从而允许将具有不同配置和平台列表的项目合并到一个工作空间中。 例如，可以使用通用调试和发布配置来配置单元测试库。

```lua
project "UnitTest"
    configurations { "Debug", "Release" }

```

要在包含一组更复杂的配置的工作空间中重用该测试项目，请创建从工作空间的配置到相应项目配置的映射。

```lua
workspace "MyWorkspace"
    configurations { "Debug", "Development", "Profile", "Release" }

project "UnitTest"
    configmap {
        ["Development"] = "Debug",
        ["Profile"] = "Release"
    }
```

重要的是要注意项目不能将新的配置添加到工作区。他们只能删除对现有工作空间配置的支持，或者将它们映射到其他项目配置。

