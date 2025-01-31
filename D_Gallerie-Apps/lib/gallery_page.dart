import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List artworks = [];

  Future<void> fetchArtworks() async {
    final response = await http.get(Uri.parse('http://localhost/api/artworks'));

    if (response.statusCode == 200) {
      setState(() {
        artworks = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchArtworks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: artworks.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: artworks.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.network("http://localhost/storage/" +
                          artworks[index]['image']),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              artworks[index]['title'],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(artworks[index]['description']),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
