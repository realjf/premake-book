## 共享配置设置

过去在新旧论坛上都有讨论。搜索“用法”。如果有机会的话，将它们汇集在一起作为参考非常好。同时，请随时在下面添加您的方法。

我们在这里使用函数。要指定如何针对库进行编译和链接：

```lua
-- How to declare it
function someLibrary(options)
   defines { ... }
   links { ... }
   options = options or {}
   if options.someFlag then
      defines { ... }
   end
end

-- How to use it
project "someOtherProject"
   kind "ConsoleApp"
   someLibrary { someFlag="true" }
```

对于定义项目的“类”：

```lua
function someComponent_test(name)
   project(name)
   kind "ConsoleApp"
   defines { ... }
   links { ... }
   filter {}
end
```

