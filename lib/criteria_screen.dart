import 'package:flutter/material.dart';

class CriteriaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Criteria Screen'),
      ),
      body: Center(
          child: Text(
        'Критерии\n'
        '1) 0 баллов – работа не сделана\n'
        '2) 1-3 балла – генерация не работает, но интерфейс отрисован\n'
        '3) 4-5 баллов – отрисован интерфейс одного экрана в заданном цвете\n'
        '4) 6-7 баллов – отрисован интерфейс экрана и показ результата\n'
        '5) 8-9 баллов – отрисован интерфейс двух экранов с кастомным переходом в соответствии с заданием и показ результата\n'
        '6) 10 баллов – все выполнено и комбинации заданий не повторяются (каждый раз уникальный набор, пока не закончится)',
      )),
    );
  }
}
