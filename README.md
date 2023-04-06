# getx

1. [x] 数据，逻辑，页面分离
2. [x] 局部刷新
3. [x] 跨组件跨页面调用
4. [x] 路由

## 安装
```yaml
getx:
    git:
      url: https://github.com/clong1995/getx.git
```

## 使用方法

### 1. 一个带状态的页面由三个文件构成，目录结构如下：

**demo**  
┣  **logic.dart** (业务逻辑)  
┣  **page.dart** (页面结构)  
┗  **state.dart** (状态数据)

### 2. 简单用法

main.dart

```dart
import 'package:flutter/material.dart';
import 'package:getx/getx.dart';
import 'package:getx/key.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp //<=== MaterialApp
      (
      navigatorKey: getxNavKey, //<=== 增加用于路由的key
      home: Scaffold(
        body: Text("你的app"),
      ),
    );
  }
}
```

state.dart

```dart
class MyState {
  String datetime = "";
}
```

page.dart

```dart
import 'package:flutter/material.dart';
import 'logic.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyLogic logic = MyLogic().put(); //<===添加并且获取logic
    return Scaffold(
      body: Column(
        children: [
          logic.builder( //<=== 局部刷新的builder
            builder: () => Text("now:${logic.state.datetime}"), //<=== state中的状态数据
          ),
          ElevatedButton(
            onPressed: logic.onPressed, //<=== logic中的点击事件
            child: const Text("NOW"),
          ),
        ],
      ),
    );
  }
}
```

logic.dart

```dart
import 'package:getx/logic.dart';
import 'state.dart';

class MyLogic extends Logic<MyLogic> {
  final MyState state = MyState(); //<=== 状态数据

  void onPressed() {
    //修改状态数据
    state.datetime = DateTime.now().toString();
    //更新页面
    update();
  }

  @override
  MyLogic put() => putLogic(this); //<=== 添加到getx的管理中
}
```

### 3. 路由,不需要context

Getx.push :跳转到一个新的页面  
Getx.pushAndRemove :关闭所有页面跳转到新的页面  
Getx.pop :页面返回

### 4. 更多用法请看例子(example文件夹)

* 单个刷新
* 多个位置同时刷新
* 按照id刷新
* 跨组件调用
* 跨页面调用
* 路由