## staticruntime

```lua
staticruntime "value"
```

### 参数

| value   | visual studio                                 | xcode    | gmake    |
| ------- | --------------------------------------------- | -------- | -------- |
| on      | 设置<RuntimeLibrary>为MultiThreaded（多线程） | 没有效果 | 没有效果 |
| off     | 将<RuntimeLibrary>设置为“ MultiThreadedDLL”   | 没有效果 | 没有效果 |
| default | 不为<RuntimeLibrary>设置值                    | 没有效果 | 没有效果 |

### 应用于

config域

### 可用性

premake 5.0.0 alpha 12或更高版本

### 示例

```lua
staticruntime "on"
```

