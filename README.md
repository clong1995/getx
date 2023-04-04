# getx

*[x] 数据，逻辑，页面分离
*[x] 局部刷新
*[x] 跨组件跨页面调用
*[x] 路由

## 使用方法

### 1. 一个带状态的页面由三个文件构成，目录结构如下：

**demo**  
┣  **logic.dart** (业务逻辑)  
┣  **page.dart** (页面结构)  
┗  **state.dart** (状态数据)

### 2. 简单用法

state.dart

```dart
class MyState {
  String datetime = "";
}
```

page.dart

```dart
class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //添加并且获取logic
    final MyLogic logic = MyLogic().put();
    return Scaffold(
      body: Column(
        children: [
          //局部刷新的builder
          logic.builder(
            builder: () => Text("now:${logic.state.datetime}"), //state中的状态数据
          ),
          ElevatedButton(
            onPressed: logic.onPressed, //logic中的点击事件
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
class MyLogic extends Logic<MyLogic> {
  final MyState state = MyState(); //状态数据

  void onPressed() {
    //修改状态数据
    state.datetime = DateTime.now().toString();
    //更新页面
    update();
  }

  @override
  MyLogic put() => putLogic(this); //添加到getx的管理中
}
```

### 3. 路由api,不需要context

navPush :跳转到一个新的页面  
navPushAndRemove :关闭所有页面跳转到新的页面  
navPop :页面返回

### 4. 更多用法请看例子(example文件夹)

* 单个刷新
* 多个位置同时刷新
* 按照id刷新
* 跨组件调用
* 跨页面调用
* 路由