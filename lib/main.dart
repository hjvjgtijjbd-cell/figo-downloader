import 'package:flutter/material.dart';
void main() => runApp(FigoApp());
class FigoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainNav());
  }
}
class MainNav extends StatefulWidget {
  @override
  State<MainNav> createState() => _MainNavState();
}
class _MainNavState extends State<MainNav> {
  int current = 0;
  final names = ["TikTok", "Facebook", "Instagram", "Pinterest"];
  final icons = [Icons.music_note, Icons.facebook, Icons.camera_alt, Icons.push_pin];
  final controller = TextEditingController();
  String status = "";
  void download() {
    String url = controller.text.toLowerCase();
    if (url.isEmpty) { setState(()=> status = "دخل الرابط"); return; }
    bool ok = url.contains("tiktok") || url.contains("facebook") || url.contains("fb.watch") || url.contains("instagram") || url.contains("pinterest") || url.contains("pin.it");
    if (!ok) { setState(()=> status = "هاد الرابط ماشي من المنصات 4 المدعومة"); return; }
    setState(()=> status = "جاري التحميل من ${names[current]} ✅");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Figo - ${names[current]}"), backgroundColor: Colors.pink),
      body: Padding(padding: EdgeInsets.all(20), child: Column(children: [
        Icon(icons[current], size: 80, color: Colors.pink),
        SizedBox(height: 20),
        TextField(controller: controller, decoration: InputDecoration(labelText: "رابط ${names[current]}", border: OutlineInputBorder(), prefixIcon: Icon(Icons.link))),
        SizedBox(height: 20),
        SizedBox(width: double.infinity, height: 50, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, foregroundColor: Colors.white), onPressed: download, child: Text("تحميل من ${names[current]}"))),
        SizedBox(height: 20), Text(status, textAlign: TextAlign.center),
      ])),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current, onTap: (i)=> setState(()=> current = i), type: BottomNavigationBarType.fixed, selectedItemColor: Colors.pink,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: "TikTok"),
          BottomNavigationBarItem(icon: Icon(Icons.facebook), label: "Facebook"),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: "Instagram"),
          BottomNavigationBarItem(icon: Icon(Icons.push_pin), label: "Pinterest"),
        ],
      ),
    );
  }
}
