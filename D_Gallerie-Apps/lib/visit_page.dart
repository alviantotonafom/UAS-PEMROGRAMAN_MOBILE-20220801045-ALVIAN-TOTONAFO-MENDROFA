import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VisitPage extends StatelessWidget {
  final String mapsUrl =
      "https://www.google.com/maps/search/?api=1&query=-6.243521,106.799297";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kunjungi Kami")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Temui Kami di Lokasi",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Temukan pengalaman seni yang luar biasa di pusat kreatif kami! "
              "Kunjungi langsung galeri kami di lokasi berikut dan nikmati berbagai karya seni yang menginspirasi.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.red, size: 30),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Jl. Barito I No.3, RT.10/RW.7, Kramat Pela, Kec. Kby. Baru, "
                      "Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12130",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _launchURL(),
                icon: Icon(Icons.map, size: 24),
                label: Text("Buka Google Maps"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(mapsUrl);

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw "Tidak dapat membuka Maps";
    }
  }
}
