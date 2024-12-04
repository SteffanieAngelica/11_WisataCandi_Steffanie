import 'package:flutter/material.dart';
import 'package:wisata_candi/models/candi.dart';
import 'package:wisata_candi/screens/detail_screen.dart';

class ItemCard extends StatelessWidget {
  //TODO:1. Deklarasikan variable yang dibutuhkan dan pasang pada konstruktor

  const ItemCard({super.key, required this.candi});
  final Candi candi;
  @override
  Widget build(BuildContext context) {
    //TODO: 6. Implementasikan routing ke DetailScreen
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(candi: candi),
          ),
        );
      },
      child: Card(
        //TODO: 2. tetapkan parameter shape, margin dan elevation dari Cari
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(4),
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO: 3. Buat Image sebagai anak dari Column
            Expanded(
              //TODO: 7. ImplementasikanHero animation
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  candi.imageAsset,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //TODO: 4. Buat Text sebagai anak dari Column
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                candi.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            //TODO: 5. Buat Text sebagai anak dari COlumn
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8),
              child: Text(
                candi.type,
                style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}