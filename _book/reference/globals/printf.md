## printf

printf的性能类似于其C副本，它打印格式化的字符串。

```lua
printf("format", ...)
```

等效于以下Lua代码：

```lua
print(string.format(format, unpack(arg))
```

### 参数

format是包含C printf（）样式格式代码的格式字符串。它后面是要替换为格式字符串的参数列表。