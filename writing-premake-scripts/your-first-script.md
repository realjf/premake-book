## 你的第一个脚本

首先，为传统的“ Hello，world！”配置一个构建。程序，用C语言编写：

```c
/* hello.c */
#include <stdio.h>

int main(void) {
   puts("Hello, world!");
   return 0;
}
```

例如以下示例的典型C程序的Premake脚本为：

```lua
-- premake5.lua
workspace "HelloWorld"
   configurations { "Debug", "Release" }

project "HelloWorld"
   kind "ConsoleApp"
   language "C"
   targetdir "bin/%{cfg.buildcfg}"

   files { "**.h", "**.c" }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
```

