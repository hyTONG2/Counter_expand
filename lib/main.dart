import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, //去除右上角的debug标志
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Counter Expand(HYT)-step3'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //5.3 容器类组件-Transform(变换)
            Container(
              color: Colors.deepOrange,
              child: Transform(
                alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                transform: Matrix4.skewY(0.2), //沿Y轴倾斜0.2弧度
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.amberAccent,
                  child: Text('HAHA! THIS IS A COUNTER!',
                      style: Theme.of(context).textTheme.headline6),
                ),
              ),
            ),

            //3.3 基础组件-图片
            // 从网络加载图片
            Align(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage("images/image01.jpg"),
                width: 70.0,
                fit: BoxFit.fill,
              ),
            ),

            const Text(
              '\nYou have pushed the button this many times:\n',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),

            //3.2 基础组件-按钮
            //3.2.5 带图标的按钮
            //OutlineButton默认有一个边框，不带阴影且背景透明
            // 按下后，边框颜色会变亮、同时出现背景和阴影(较弱)
            OutlinedButton.icon(
              icon: Icon(Icons.add),
              label: Text("push"),
              onPressed: _incrementCounter,
            ),
          ],
        ),
      ),
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      */
    );
  }
}
