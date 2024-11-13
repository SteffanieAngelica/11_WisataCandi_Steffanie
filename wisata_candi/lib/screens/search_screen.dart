import 'package:flutter/material.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/models/candi.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //TODO: 1. Deklarasikan variable yang dibutuhkan
  List<Candi> _filteredCandis = candiList;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: 2. Buat appbar dengan judul Pencarian Candi
      appBar: AppBar(
        title: const Text('Pencarian Candi'),
      ),
      //TODO: 3. Buat body berupa Column
      body: Column(
        children: [
          //TODO: 4. Buat TextField pencarian sebagai anaka dari Column
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.deepPurple[50],
              ),
              child: const TextField(
                autofocus: false,
                //TODO: 6. Implementasi fitur pencarian 
                decoration: InputDecoration(
                  hintText: 'Cari Candi...',
                  prefixIcon: Icon(Icons.search),
                  //TODO: 7. Implementasi pengosongan input
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12)
                ),
              ),
            ),
          ),
          //TODO: 5. Buat ListView hasil pencarian sebagai anak dari Column
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCandis.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final candi = _filteredCandis[index];
                //TODO: 8.Implementasi GestureDetector dan Hero animation
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            candi.imageAsset,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              candi.name,
                              style: const TextStyle(
                                fontSize: 16,
                                height: 4,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(candi.location),
                          ],
                        ),
                      )
                    ],
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