import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Beranda")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.palette,
                size: 80, color: Colors.blueAccent), // Ikon seni
            SizedBox(height: 20),
            Text(
              "Selamat Datang di D Gallerie",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "Temukan berbagai karya seni inspiratif yang diunggah langsung oleh para seniman berbakat. "
              "Jelajahi galeri kami dan rasakan keindahan setiap goresan yang penuh makna.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
