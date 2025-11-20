import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: const Text("Beranda Wisata"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sapaan dan nama mahasiswa
            const Text(
              "Selamat Datang!",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Fany Milani (232101276) & Asty Maulida (232101317) ",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),

            const SizedBox(height: 16),

            // Gambar utama
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                "https://images.unsplash.com/photo-1493558103817-58b2924bce98",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            // Kolom pencarian
            TextField(
              decoration: InputDecoration(
                hintText: "Cari tempat wisata favoritmu...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Kategori Pilihan
            const Text(
              "Kategori Pilihan",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
            const SizedBox(height: 12),

            // GridView kategori dengan tombol bulat (tanpa kuliner, pantai, tour)
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              children: [
                _buildCircularButton(Icons.hotel, "Hotel"),
                _buildCircularButton(Icons.flight_takeoff, "Pesawat"),
                _buildCircularButton(Icons.hiking, "Petualangan"),
              ],
            ),

            const SizedBox(height: 10),

            // Ulasan destinasi
            const Text(
              "Tempat Favorit Pengunjung",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
            const SizedBox(height: 12),
            _buildDestinationCard(
              imageUrl:
                  "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
              title: "Gunung Bromo",
              rating: 4.9,
              desc: "Nikmati sunrise indah dari puncak gunung Bromo!",
            ),
            _buildDestinationCard(
              imageUrl:
                  "https://images.unsplash.com/photo-1537996194471-e657df975ab4",
              title: "Labuan Bajo",
              rating: 4.8,
              desc: "Pesona laut biru dan pulau eksotis Indonesia timur.",
            ),
          ],
        ),
      ),
    );
  }

  // Widget tombol kategori berbentuk bulat
  static Widget _buildCircularButton(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.purple.shade100,
          ),
          child: Icon(icon, color: Colors.purple, size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
        ),
      ],
    );
  }

  // Widget kartu destinasi
  static Widget _buildDestinationCard({
    required String imageUrl,
    required String title,
    required double rating,
    required String desc,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              height: 110,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    Text(" $rating"),
                  ],
                ),
                const SizedBox(height: 4),
                Text(desc),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
