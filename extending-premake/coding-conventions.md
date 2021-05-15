## 代码约定

虽然目前并非所有Premake的代码都遵循这些约定，但我们正在逐步朝着这个方向努力，并希望在最终5.0版本之前完成所有工作。 了解这些约定将使代码更易于阅读和遵循。

### 表作为命名空间

Premake表用作名称空间，相关功能组合在一起成为它们自己的名称空间表。 Premake自己的大多数代码都放在一个名为premake的表中。 与项目脚本API相关的代码位于premake.api中，与命令行选项相关的代码位于premake.options中，等等。

以这种方式组织代码有助于避免相似命名的函数之间的冲突，并且通常有助于使事情保持整洁。

### 局部变量作为别名

在每个源代码文件的顶部声明新的名称空间，然后是将在源文件中频繁使用的名称空间的别名。 例如：

```lua
-- define a new namespace for the VC 2010 related code
premake.vstudio.vc2010 = {}

-- create aliases for namespaces we'll use often
local p = premake
local vstudio = p.vstudio
local project = p.project

-- and the "m" alias represents the current module being implemented
local m = p.vstudio.vc2010
```

别名p通常用作premake名称空间的快捷方式。 别名m通常用于表示所实现的模块。

使用别名在编码时可以节省一些击键。 而且由于Premake将其所有脚本嵌入到发行可执行文件中，因此它也节省了最终的下载大小。

### 调用数组

Premake的项目文件导出器（写出Visual Studio项目，makefile等）基本上是一长串“输出此，然后此，然后此”的列表。 可以很容易地（曾经是）将其编写为一个巨大的函数，但实际上几乎不可能修改其行为。

取而代之的是，我们将项目的生成分为许多小功能，通常只将一行写到输出中。 这些功能中的任何一个都可以被您自己的脚本或模块覆盖。

```lua
-- instead of this...

    function m.outputConfig(cfg)
        if #cfg.defines > 0 or vstudio.isMakefile(cfg) then
            p.x('PreprocessorDefinitions="%s"', table.concat(cfg.defines, ";"))
        end

        if #cfg.undefines > 0 then
            p.x('UndefinePreprocessorDefinitions="%s"', table.concat(cfg.undefines, ";"))
        end

        if cfg.rtti == p.OFF and cfg.clr == p.OFF then
            p.w('RuntimeTypeInfo="false"')
        elseif cfg.rtti == p.ON then
            p.w('RuntimeTypeInfo="true"')
        end
    end

-- we do this...

    function m.preprocessorDefinitions(cfg)
        if #cfg.defines > 0 or vstudio.isMakefile(cfg) then
            p.x('PreprocessorDefinitions="%s"', table.concat(cfg.defines, ";"))
        end
    end

    function m.undefinePreprocessorDefinitions(cfg)
        if #cfg.undefines > 0 then
            p.x('UndefinePreprocessorDefinitions="%s"', table.concat(cfg.undefines, ";"))
        end
    end

    function m.runtimeTypeInfo(cfg)
        if cfg.rtti == p.OFF and cfg.clr == p.OFF then
            p.w('RuntimeTypeInfo="false"')
        elseif cfg.rtti == p.ON then
            p.w('RuntimeTypeInfo="true"')
        end
    end

```

同样，我们没有将项目特定部分的输出实现为调用一长串其他函数的函数，而是将这些函数放入数组中，然后遍历该数组。 我们称这些为“调用数组”，它们使您可以在运行时从数组中注入新功能或删除现有功能。

```lua
-- instead of this...

    function m.outputConfig(cfg)
        m.preprocessorDefinitions(cfg)
        m.undefinePreprocessorDefinitions(cfg)
        m.runtimeTypeInfo(cfg)
        -- and so on...
    end

-- we do this

    m.elements.config = function(cfg)
        return {
            m.preprocessorDefinitions,
            m.undefinePreprocessorDefinitions,
            m.runtimeTypeInfo,
            -- and so on...
        }
    end

    function m.outputConfig(cfg)
        p.callArray(m.element.config, cfg)
    end
```

有关如何使用这些约定实现新功能的示例，请参见覆盖和调用数组。