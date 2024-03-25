import 'dart:math';

import 'package:flutter/material.dart';

import 'criteria_screen.dart';
import 'custom_page_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exam',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Exam - Тимофей Тихонов'),
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
  bool selectedColorPink = false;
  bool selectedColorYellow = false;
  bool selectedColorGreen = false;
  bool selectedResultDialog = false;
  bool selectedResultSnackBar = false;
  bool selectedTransitionBottomTop = false;
  bool selectedTransitionTopBottom = false;
  bool selectedTransitionRightLeft = false;

  bool checkStates() {
    if (selectedColorPink && selectedResultDialog && selectedTransitionBottomTop ||
        selectedColorPink &&
            selectedResultDialog &&
            selectedTransitionTopBottom ||
        selectedColorPink &&
            selectedResultDialog &&
            selectedTransitionRightLeft ||
        selectedColorPink &&
            selectedResultSnackBar &&
            selectedTransitionBottomTop ||
        selectedColorPink &&
            selectedResultSnackBar &&
            selectedTransitionTopBottom ||
        selectedColorPink &&
            selectedResultSnackBar &&
            selectedTransitionRightLeft ||
        selectedColorYellow &&
            selectedResultDialog &&
            selectedTransitionBottomTop ||
        selectedColorYellow &&
            selectedResultDialog &&
            selectedTransitionTopBottom ||
        selectedColorYellow &&
            selectedResultDialog &&
            selectedTransitionRightLeft ||
        selectedColorYellow &&
            selectedResultSnackBar &&
            selectedTransitionBottomTop ||
        selectedColorYellow &&
            selectedResultSnackBar &&
            selectedTransitionTopBottom ||
        selectedColorYellow &&
            selectedResultSnackBar &&
            selectedTransitionRightLeft ||
        selectedColorGreen &&
            selectedResultDialog &&
            selectedTransitionBottomTop ||
        selectedColorGreen &&
            selectedResultDialog &&
            selectedTransitionTopBottom ||
        selectedColorGreen &&
            selectedResultDialog &&
            selectedTransitionRightLeft ||
        selectedColorGreen &&
            selectedResultSnackBar &&
            selectedTransitionBottomTop ||
        selectedColorGreen &&
            selectedResultSnackBar &&
            selectedTransitionTopBottom ||
        selectedColorGreen &&
            selectedResultSnackBar &&
            selectedTransitionRightLeft) {
      return true;
    }
    return false;
  }

  void randomizeStates() {
    final Random random = Random();

    setState(() {
      selectedColorPink = false;
      selectedColorYellow = false;
      selectedColorGreen = false;
      selectedResultDialog = false;
      selectedResultSnackBar = false;
      selectedTransitionBottomTop = false;
      selectedTransitionTopBottom = false;
      selectedTransitionRightLeft = false;

      selectedColorPink = random.nextBool();
      selectedColorYellow = selectedColorPink ? false : random.nextBool();
      selectedColorGreen =
          (selectedColorPink || selectedColorYellow) ? false : true;

      selectedResultDialog = random.nextBool();
      selectedResultSnackBar = selectedResultDialog ? false : true;

      selectedTransitionBottomTop = random.nextBool();
      selectedTransitionTopBottom =
          selectedTransitionBottomTop ? false : random.nextBool();
      selectedTransitionRightLeft =
          (selectedTransitionBottomTop || selectedTransitionTopBottom)
              ? false
              : true;
    });
  }

  bool generated = false;
  String result = '';

  void generateResult() {
    // Здесь вы можете добавить вашу логику для генерации результата
    // Например, присвоить случайный результат переменной result
    result = 'Результат';
    generated = true;
  }

  void _selectOption() {
    // Проверка выбора по крайней мере одного варианта из каждого блока

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Выбранные опции:'),
          content: Text(
              'Цвет: ${selectedColor()} \nРезультат: ${selectedResult()} \nПереход: ${selectedTransition()}'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ОК'),
            ),
          ],
        );
      },
    );
  }

  String selectedColor() {
    if (selectedColorPink) {
      return 'Розовый';
    } else if (selectedColorYellow) {
      return 'Желтый';
    } else if (selectedColorGreen) {
      return 'Зеленый';
    } else {
      return 'Не выбран';
    }
  }

  String selectedResult() {
    if (selectedResultDialog) {
      return 'Dialog';
    } else if (selectedResultSnackBar) {
      return 'SnackBar';
    } else {
      return 'Не выбран';
    }
  }

  String selectedTransition() {
    if (selectedTransitionBottomTop) {
      return 'Снизу Вверх';
    } else if (selectedTransitionTopBottom) {
      return 'Сверху Вниз';
    } else if (selectedTransitionRightLeft) {
      return 'Справо Налево';
    } else {
      return 'Не выбран';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Основной Цвет',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
            Row(
              children: [
                Spacer(),
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedColorPink = true;
                      selectedColorYellow = false;
                      selectedColorGreen = false;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor:
                        selectedColorPink ? Colors.lightGreenAccent : null,
                    textStyle: TextStyle(
                      decoration: TextDecoration.underline,
                      color: selectedColorPink ? Colors.white : null,
                    ),
                  ),
                  child: Text('Розовый'),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedColorPink = false;
                      selectedColorYellow = true;
                      selectedColorGreen = false;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor:
                        selectedColorYellow ? Colors.lightGreenAccent : null,
                    textStyle: TextStyle(
                      decoration: TextDecoration.underline,
                      color: selectedColorYellow ? Colors.white : null,
                    ),
                  ),
                  child: Text('Желтый'),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedColorPink = false;
                      selectedColorYellow = false;
                      selectedColorGreen = true;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor:
                        selectedColorGreen ? Colors.lightGreenAccent : null,
                    textStyle: TextStyle(
                      decoration: TextDecoration.underline,
                      color: selectedColorGreen ? Colors.white : null,
                    ),
                  ),
                  child: Text('Зеленый'),
                ),
                Spacer(),
              ],
            ),
            Text('Показ Результата',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
            Row(children: [
              Spacer(),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedResultDialog = true;
                    selectedResultSnackBar = false;
                  });
                },
                style: TextButton.styleFrom(
                  textStyle: TextStyle(decoration: TextDecoration.underline),
                  backgroundColor:
                      selectedResultDialog ? Colors.lightGreenAccent : null,
                ),
                child: Text('Dialog'),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedResultDialog = false;
                    selectedResultSnackBar = true;
                  });
                },
                style: TextButton.styleFrom(
                  textStyle: TextStyle(decoration: TextDecoration.underline),
                  backgroundColor:
                      selectedResultSnackBar ? Colors.lightGreenAccent : null,
                ),
                child: Text('SnackBar'),
              ),
              Spacer(),
            ]),
            Text('Переход между экранами',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
            Row(children: [
              Spacer(),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedTransitionBottomTop = true;
                    selectedTransitionTopBottom = false;
                    selectedTransitionRightLeft = false;
                  });
                },
                style: TextButton.styleFrom(
                  textStyle: TextStyle(decoration: TextDecoration.underline),
                  backgroundColor: selectedTransitionBottomTop
                      ? Colors.lightGreenAccent
                      : null,
                ),
                child: Text('Снизу вверх'),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedTransitionBottomTop = false;
                    selectedTransitionTopBottom = true;
                    selectedTransitionRightLeft = false;
                  });
                },
                style: TextButton.styleFrom(
                  textStyle: TextStyle(decoration: TextDecoration.underline),
                  backgroundColor: selectedTransitionTopBottom
                      ? Colors.lightGreenAccent
                      : null,
                ),
                child: Text('Сверху вниз'),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedTransitionBottomTop = false;
                    selectedTransitionTopBottom = false;
                    selectedTransitionRightLeft = true;
                  });
                },
                style: TextButton.styleFrom(
                  textStyle: TextStyle(decoration: TextDecoration.underline),
                  backgroundColor: selectedTransitionRightLeft
                      ? Colors.lightGreenAccent
                      : null,
                ),
                child: Text('Справа налево'),
              ),
              Spacer(),
            ]),
            Row(children: [
              Spacer(),
              TextButton(
                onPressed: () {
                  randomizeStates();
                },
                style: TextButton.styleFrom(
                  textStyle: TextStyle(decoration: TextDecoration.underline),
                  backgroundColor: Colors.lightGreenAccent,
                ),
                child: Text('Подобрать вариант'),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context, CustomPageRoute(page: CriteriaScreen()));
                },
                style: TextButton.styleFrom(
                  textStyle: TextStyle(decoration: TextDecoration.underline),
                  backgroundColor: Colors.lightGreenAccent,
                ),
                child: Text('Открыть критерии'),
              ),
              Spacer(),
            ]),
            if (checkStates())
              ElevatedButton(
                onPressed: () {
                  _selectOption();
                },
                child: Text('Открыть Dialog!'),
              ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
