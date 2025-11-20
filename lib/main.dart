import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// GLOBAL HISTORY
List<Map<String, String>> orderHistory = [];

// GLOBAL FAVORITE
List<Map<String, String>> favoriteList = [];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dessert Aesthetic',
      home: const LoginPage(),
    );
  }
}

// ------------------------------------------------------------
// LOGIN PAGE
// ------------------------------------------------------------
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Center(
        child: AnimatedScale(
          duration: const Duration(milliseconds: 400),
          scale: 1.0,
          child: Card(
            elevation: 10,
            color: Colors.white,
            shadowColor: Colors.pink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: 330,
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Login Dessert 🍰",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                  const SizedBox(height: 20),

                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.email, color: Colors.pink),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  TextField(
                    controller: passController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock, color: Colors.pink),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  if (errorMessage != null)
                    Text(errorMessage!, style: const TextStyle(color: Colors.red)),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (emailController.text == "user@example.com" &&
                          passController.text == "123456") {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(milliseconds: 600),
                            pageBuilder: (_, __, ___) => const MainNavigation(),
                            transitionsBuilder: (_, anim, __, child) =>
                                FadeTransition(opacity: anim, child: child),
                          ),
                        );
                      } else {
                        setState(() => errorMessage = "Email atau password salah!");
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// BOTTOM NAVIGATION
// ------------------------------------------------------------
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int pageIndex = 0;

  final pages = [
    const DessertPage(),
    const HistoryPage(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        onTap: (i) => setState(() => pageIndex = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.cake_rounded),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// DESSERT PAGE
// ------------------------------------------------------------
class DessertPage extends StatelessWidget {
  const DessertPage({super.key});

  final List<Map<String, dynamic>> desserts = const [
    {"name": "Cupcake", "emoji": "🧁", "price": "Rp 12.000"},
    {"name": "Donut", "emoji": "🍩", "price": "Rp 10.000"},
    {"name": "Cake", "emoji": "🍰", "price": "Rp 18.000"},
    {"name": "Ice Cream", "emoji": "🍨", "price": "Rp 15.000"},
    {"name": "Pudding", "emoji": "🍮", "price": "Rp 18.000"},
    {"name": "Candy", "emoji": "🍬", "price": "Rp 5.000"},
    {"name": "Macaron", "emoji": "🍥", "price": "Rp 20.000"},
    {"name": "Croissant", "emoji": "🥐", "price": "Rp 14.000"},
    {"name": "Cheesecake", "emoji": "🧀🍰", "price": "Rp 22.000"},
    {"name": "Waffle", "emoji": "🧇", "price": "Rp 16.000"},
    {"name": "Brownies", "emoji": "🍫", "price": "Rp 17.000"},
    {"name": "Tiramisu", "emoji": "🎂", "price": "Rp 25.000"},
    {"name": "Muffin", "emoji": "🧁", "price": "Rp 11.000"},
    {"name": "Milkshake", "emoji": "🥤", "price": "Rp 13.000"},
    {"name": "Cookies", "emoji": "🍪", "price": "Rp 9.000"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Cute Dessert Menu 🍰",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFd46ba3),
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: desserts.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 180,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.95,
                ),
                itemBuilder: (context, index) {
                  final dessert = desserts[index];

                  return TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0.8, end: 1),
                    duration: Duration(milliseconds: 300 + (index * 50)),
                    curve: Curves.easeOutBack,
                    builder: (context, scale, child) {
                      return Transform.scale(scale: scale, child: child);
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DessertDetailPage(
                              name: dessert["name"],
                              emoji: dessert["emoji"],
                              price: dessert["price"],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade100.withOpacity(0.75),
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Hero(
                              tag: dessert["name"],
                              child: Text(
                                dessert["emoji"],
                                style: const TextStyle(fontSize: 50),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              dessert["name"],
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.pink.shade800,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              dessert["price"],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.pink.shade600,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// DETAIL PAGE (Add to History + Add to Favorite)
// ------------------------------------------------------------
class DessertDetailPage extends StatelessWidget {
  final String name;
  final String emoji;
  final String price;

  const DessertDetailPage({
    super.key,
    required this.name,
    required this.emoji,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        title: Text(name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: name,
              child: Text(emoji, style: const TextStyle(fontSize: 120)),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(
                  fontSize: 32, fontWeight: FontWeight.bold, color: Colors.pink),
            ),
            const SizedBox(height: 10),
            Text(
              price,
              style: const TextStyle(
                  fontSize: 26,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),

            // Add To History Button
            ElevatedButton(
              onPressed: () {
                orderHistory.add({
                  "name": name,
                  "price": price,
                  "emoji": emoji,
                  "time": DateTime.now().toString().substring(0, 16),
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("$name ditambahkan ke history!")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Add to History 🧾",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            const SizedBox(height: 15),

            // -----------------------------
            // ADD TO FAVORITE BUTTON
            // -----------------------------
            ElevatedButton(
              onPressed: () {
                final exists =
                    favoriteList.any((item) => item["name"] == name);

                if (!exists) {
                  favoriteList.add({
                    "name": name,
                    "price": price,
                    "emoji": emoji,
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("$name ditambahkan ke favorit 💗")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("$name sudah ada di favorit!")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink.shade200,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Add to Favorite 💗",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// HISTORY PAGE
// ------------------------------------------------------------
class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        title: const Text("Order History"),
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.pink.shade300,
        label: const Text(
          "Tambahkan Pesanan",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.add_shopping_cart),
        onPressed: () => Navigator.pop(context),
      ),

      body: orderHistory.isEmpty
          ? Center(
              child: Text(
                "Belum ada riwayat pesanan 🧾\nTekan tombol di bawah untuk memesan.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.pink.shade600),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: orderHistory.length,
              itemBuilder: (context, index) {
                final item = orderHistory[index];
                return Card(
                  color: Colors.pink.shade100,
                  margin: const EdgeInsets.only(bottom: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    leading: Text(item["emoji"]!,
                        style: const TextStyle(fontSize: 40)),
                    title: Text(
                      item["name"]!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "${item["price"]}\n${item["time"]}",
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

// ------------------------------------------------------------
// FAVORITE PAGE (UPDATED)
// ------------------------------------------------------------
class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        title: const Text("Favorit Dessert"),
      ),

      body: favoriteList.isEmpty
          ? Center(
              child: Text(
                "Belum ada dessert favorit 💗",
                style: TextStyle(fontSize: 22, color: Colors.pink.shade600),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: favoriteList.length,
              itemBuilder: (context, index) {
                final item = favoriteList[index];

                return Card(
                  color: Colors.pink.shade100,
                  margin: const EdgeInsets.only(bottom: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    leading: Text(item["emoji"]!,
                        style: const TextStyle(fontSize: 40)),
                    title: Text(
                      item["name"]!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(item["price"]!,
                        style: const TextStyle(fontSize: 16)),

                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() => favoriteList.removeAt(index));

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text("${item["name"]} dihapus dari favorit")),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}

// ------------------------------------------------------------
// PROFILE PAGE
// ------------------------------------------------------------
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.pink.shade200,
              child: const Icon(Icons.person, size: 70, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text("Dessert App",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text(
              "Version 1.0.0\nCreated with Flutter 💖",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
