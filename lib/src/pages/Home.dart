import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? _choiceChipValue = 2;
  String productName = '';
  String productPrice = '';
  List<String> chipName = ['Artan Fiyat', 'Azalan Fiyat', 'Tarih'];
  List<Map<String, dynamic>> productList = [];

  final productNameController = TextEditingController();
  final productPriceController = TextEditingController();

  @override
  void dispose() {
    productNameController.dispose();
    productPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                        switch (index) {
                          case 0:
                            productList.sort(
                                (a, b) => a['price'].compareTo(b['price']));
                            break;
                          case 1:
                            productList.sort(
                                (a, b) => b['price'].compareTo(a['price']));
                            break;
                          case 2:
                            productList
                                .sort((a, b) => a['date'].compareTo(b['date']));
                            break;

                          default:
                        }
                      });
                    },
                  );
                },
              ).toList(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      '${productList[index]['name']}',
                      style: const TextStyle(
                          color: Color(0xFF475963), fontSize: 20),
                    ),
                    subtitle: Text(
                      '${productList[index]['date']}'.split(' ')[0],
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: productNameController,
                onChanged: (text) {
                  productName = text;
                },
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  labelStyle: TextStyle(color: Color(0xFF475963)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Color(0xFF475963),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: productPriceController,
                onChanged: (text) {
                  productPrice = text;
                },
                decoration: const InputDecoration(
                  labelText: 'Price',
                  labelStyle: TextStyle(color: Color(0xFF475963)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Color(0xFF475963),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF475963))),
                  onPressed: () {
                    setState(() {
                      productList.add({
                        'name': productName,
                        'price': double.parse(productPrice),
                        'date': DateTime.now().toString(),
                      });
                    });
                    productNameController.clear();
                    productPriceController.clear();
                  },
                  child: const Text('Add')),
            )
          ],
        ),
      ),
    );
  }
}
