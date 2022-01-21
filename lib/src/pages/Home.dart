import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? _choiceChipValue = 1;
  List<String> chipName = ['Artan Fiyat', 'Azalan Fiyat', 'Tarih'];
  List<Map<String, String>> productList = [
    {
      'name': 'Kalem',
      'price': '10',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deneme'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
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
          Expanded(
            child: ListView.separated(
              itemCount: productList.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    '${productList[index]['name']}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF475963),
                        fontSize: 24),
                  ),
                  trailing: Text(
                    '${productList[index]['price']} TL',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF475963),
                        fontSize: 24),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
