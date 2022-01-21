import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? _choiceChipValue = 1;
  List<String> chipName = ['Artan Fiyat', 'Azalan Fiyat', 'Tarih'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deneme'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          children: List<Widget>.generate(
            3,
            (int index) {
              return ChoiceChip(
                side: const BorderSide(color: Color(0xFF475963), width: 1),
                selectedColor: const Color(0xFF475963),
                disabledColor: const Color(0xFF475963),
                labelStyle: TextStyle(
                    color: _choiceChipValue == index
                        ? Colors.white
                        : Colors.black),
                label: Text(
                  chipName[index],
                ),
                selected: _choiceChipValue == index,
                onSelected: (bool selected) {
                  setState(() {
                    _choiceChipValue = selected ? index : null;
                  });
                },
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
