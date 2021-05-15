## 过滤器

Premake的过滤器系统使您可以将构建设置的目标定位为希望它们出现的确切配置。您可以按特定的构建配置或平台，操作系统，目标操作等进行过滤。

这是一个示例，该示例在工作区的“调试”构建配置中设置名为“ DEBUG”的预处理器符号，在发布配置中设置名为“ NDEBUG”的预处理器符号。

```lua
workspace "MyWorkspace"
   configurations { "Debug", "Release" }

   filter "configurations:Debug"
      defines { "DEBUG" }

   filter "configurations:Release"
      defines { "NDEBUG" }
```

过滤器始终由两部分组成：一个前缀，用于指定要针对哪个字段进行过滤；一个模式，用于指定应接受该字段的哪些值。这是另一个按目标操作过滤的示例：

过滤器遵循其脚本的Premake伪声明式样式：调用filter（）使该过滤器条件“处于活动状态”。 此条件将过滤脚本中随后出现的所有设置，直到激活新的过滤器或容器（工作区，项目）为止。

```lua
-- All of these settings will appear in the Debug configuration
filter "configurations:Debug"
  defines { "DEBUG" }
  flags { "Symbols" }

-- All of these settings will appear in the Release configuration
filter "configurations:Release"
  defines { "NDEBUG" }
  optimize "On"

-- This is a sneaky bug (assuming you always want to link against these lib files).
-- Because the last filter set was Release. These libraries will only be linked for release.
-- To fix this place this after the "Deactivate" filter call below. Or before any filter calls.
links { "png", "zlib" }

-- "Deactivate" the current filter; these settings will apply
-- to the entire workspace or project (whichever is active)
filter {}
  files { "**.cpp" }
```

创建工作空间或项目文件并将其写入磁盘时，将在生成时评估过滤器。当需要输出此工作空间的“调试”构建配置的设置时，Premake会评估过滤器列表，以查找符合“调试”条件的过滤器。

使用上面的示例，Premake首先会考虑过滤器“ configurations：Debug”。它将检查当前正在输出的配置的名称，查看其是否匹配，因此包括所有设置，直到下一个过滤器调用为止。

过滤器“ configurations：Release”将被跳过，因为模式“ Release”与当前正在生成的配置名称（“ Debug”）不匹配。

最后一个过滤器“ {}”未定义任何过滤条件，因此也不排除任何内容。在此过滤器之后应用的所有设置将显示在工作空间或项目中的所有配置中。

过滤器也可以组合，使用“或”或“非”进行修改，并使用模式匹配。有关更完整的描述和大量示例，请参见过滤器。