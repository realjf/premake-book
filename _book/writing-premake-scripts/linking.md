## 链接

链接到外部库是通过 **links** 功能完成的。

```lua
links { "png", "zlib" }
```

指定库时，应省略系统特定的修饰，例如前缀或文件扩展名。 Premake将根据目标平台自动合成正确的格式。该规则的一个例外是Mac OS X框架，其中需要文件扩展名来标识它。

```lua
links { "Cocoa.framework" }
```

要链接到同级项目（同一工作空间中的项目），请使用项目名称。 Premake将根据当前平台和配置推导出正确的库路径和名称。

```lua
workspace "MyWorkspace"

   project "MyLibraryProject"
      -- ...project settings here...

   project "MyExecutableProject"
      -- ...project settings here...
      links { "MyLibraryProject" }
```

### 查找库

您可以使用libdirs函数告诉Premake在哪里搜索库。

```lua
libdirs { "libs", "../mylibs" }
```

如果需要发现库的位置，请使用os.findlib函数。

```lua
libdirs { os.findlib("X11") }
```

