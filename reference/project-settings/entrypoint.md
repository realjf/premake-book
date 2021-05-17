## entrypoint

指定程序入口点，例如main（）

```lua
entrypoint ("value")
```

### 参数

value是程序的入口点函数的名称。

### 应用于

项目配置

### 可用性

premake 5.0 或更高版本

### 示例

使用Microsoft Windows控制台应用程序入口点，而不是通常的WinMain（）。

```lua
entrypoint "mainCRTStartup"
```

