## editAndContinue

打开和关闭工具集或平台的编辑并继续功能。

```lua
editAndContinue "value"
```

如果未为配置设置任何值，则将使用工具集的默认设置（通常为“开”）。

### 参数

value是一个布尔值，即“On”或“Off”。

### 应用于

项目配置

### 可用性

premake 5.0或更高版本

### 示例

```lua
-- Turn off edit and continue
editAndContinue "Off"
```

