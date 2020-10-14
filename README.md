# PerformDemo

[iOS的那几个__bridge*究竟做了啥](https://madordie.github.io/post/what-happened-to-the-bridge-in-ios/)的源码, 一个会**崩溃**的demo

崩溃的解决方案:

```sh
╰─>$ git diff 
diff --git a/PerformDemo/NSObject+test.m b/PerformDemo/NSObject+test.m
index 828f7c1..a5c70aa 100644
--- a/PerformDemo/NSObject+test.m
+++ b/PerformDemo/NSObject+test.m
@@ -30,11 +30,11 @@ - (id)performSelector:(SEL)aSelector withObjects:(NSArray *)objects {
         }
         [invocation invoke];
         //返回值处理
-        id callBackObject = NULL;
+        void* callBackObject = NULL;
         if(methodSignature.methodReturnLength) {
             [invocation getReturnValue:&callBackObject];
         }
-        return callBackObject;
+        return (__bridge id)callBackObject;
     }
     
}
```

并**未修改**在仓库中

# 遗留的疑问

使用LLDB进行单步调试和直接运行崩溃位置不同, 确切来说 直接运行的时候崩溃位置更接近代码异常的位置.

重现步骤:

- 在[NSObject+test.m#L37](https://github.com/madordie/PerformDemo/blob/master/PerformDemo/NSObject%2Btest.m#L37)设置断点
- |─>场景一: 执行`continue`
- ╰─>场景二: 一直执行`next`
- 两处崩溃位置并不相同

详细的问题描述放在了[一个意外](https://madordie.github.io/post/what-happened-to-the-bridge-in-ios/#%E4%B8%80%E4%B8%AA%E6%84%8F%E5%A4%96)
