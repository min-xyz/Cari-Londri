import 'package:flutter/material.dart';
import 'page2.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CariLondri'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      body: const mainPage(),
    );
  }
}

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _HomePageState();
}

class _HomePageState extends State<mainPage> {
  final controller = TextEditingController();
  List<Laundry> laundry = allLaundry;
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: controller,
                onChanged: (value) {
                  setState(() {
                    isSearching = value.isNotEmpty;
                    laundry = allLaundry
                        .where((element) => element.nama
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search for laundry',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: laundry.length,
            itemBuilder: (context, index) {
              final item = laundry[index];
              return ListTile(
                leading: Image.asset(item.foto,
                    width: 80, height: 80, fit: BoxFit.cover),
                title: Text(item.nama),
                subtitle: Text(item.alamat),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Page2(laundry: item)),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class Laundry {
  final String nama;
  final String foto;
  final String alamat;
  final String deskripsi;

  const Laundry(
      {required this.nama,
      required this.foto,
      required this.alamat,
      required this.deskripsi});
}

const allLaundry = [
  Laundry(
      nama: 'Laundry Kusuma',
      foto: 'images/satu.jpg',
      alamat: 'Jl. Kusuma, Jakarta',
      deskripsi:
          'Laundry ini didirikan pada tahun 2023, sekarang Laundry ini memiliki 2 cabang. Kami sangat melayani pelanggan yang ingin pakainnya di Laundry'),
  Laundry(
      nama: 'Laundry Uda',
      foto: 'images/dua.jpg',
      alamat: 'Jl. Uda, Jakarta',
      deskripsi:
          'Laundry ini didirikan pada tahun 2023, sekarang Laundry ini memiliki 3 cabang. Kami sangat melayani pelanggan yang ingin pakainnya di Laundry'),
  Laundry(
      nama: 'Laundry Udin',
      foto: 'images/tiga.jpg',
      alamat: 'Jl. Udin, Jakarta',
      deskripsi:
          'Laundry ini didirikan pada tahun 2024, sekarang Laundry ini memiliki 2 cabang. Kami sangat melayani pelanggan yang ingin pakainnya di Laundry'),
  Laundry(
      nama: 'Laundry Aca',
      foto: 'images/empat.jpg',
      alamat: 'Jl. Aca, Jakarta',
      deskripsi:
          'Laundry ini didirikan pada tahun 2020, sekarang Laundry ini memiliki 5 cabang. Kami sangat melayani pelanggan yang ingin pakainnya di Laundry')
];
