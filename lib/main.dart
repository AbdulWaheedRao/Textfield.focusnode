import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _textEditingController;
  String displaytext = '';
  FocusNode userNameFouchNode = FocusNode();
  FocusNode passWordFouchNode = FocusNode();
  FocusNode setButtonFouchNode = FocusNode();
  FocusNode fetchButtonFouchNode = FocusNode();
  FocusNode clearButtonFouchNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    displaytext = _textEditingController.text;

    passWordFouchNode.skipTraversal = true;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
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
            SizedBox(
                width: 400,
                child: PhysicalModel(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.black38,
                  shadowColor: Colors.amber,
                  elevation: 10,
                  child: TextField(
                    autofocus: true,
                    focusNode: userNameFouchNode,
                    controller: _textEditingController,
                    // obscureText: true, this is for hide a password
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.cyan,
                                width: 3,
                                strokeAlign: StrokeAlign.outside),
                            gapPadding: 2),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Colors.black12,
                                width: 4,
                                strokeAlign: StrokeAlign.outside),
                            gapPadding: 2),
                        prefix: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.alarm,
                              color: Colors.amber,
                            )),
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        floatingLabelStyle: const TextStyle(color: Colors.pink),
                        // prefixIcon: Icon(Icons.person),
                        hintText: 'Enter User Name',
                        hintStyle: TextStyle(color: Colors.amber),
                        hoverColor: Colors.blueGrey,
                        labelText: 'UserName',
                        enabled: true,
                        filled: true,
                        fillColor: Color.fromARGB(255, 121, 112, 241)),
                  ),
                )),
            SizedBox(
                width: 300,
                child: TextField(
                  obscureText: true,
                  focusNode: passWordFouchNode,
                  decoration:
                      InputDecoration(suffixIcon: Icon(Icons.remove_red_eye)),
                )),
            Text(
              displaytext,
              style:
                  TextStyle(color: Colors.black, backgroundColor: Colors.amber),
            ),
            Text(_textEditingController.text),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    focusNode: fetchButtonFouchNode,
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text('Fetch Text')),
                ElevatedButton(
                    focusNode: setButtonFouchNode,
                    onPressed: () {
                      _textEditingController.text = 'pakistan';
                    },
                    child: Text('Set Text')),
                ElevatedButton(
                    focusNode: clearButtonFouchNode,
                    onPressed: () {
                      _textEditingController.clear();
                      passWordFouchNode.unfocus();
                    },
                    child: Text('Clear Text'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
