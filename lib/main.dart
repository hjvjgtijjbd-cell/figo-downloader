import 'package:flutter/material.dart';
void main() => runApp(FigoApp());
class FigoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, title: 'Figo Downloader', theme: ThemeData.dark(), home: HomePage());
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  TextEditingController linkController = TextEditingController();
  String status = "لسق رابط الفيديو هنا";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("برنامج تنزيل فيجو", style: TextStyle(fontWeight: FontWeight.bold)), backgroundColor: Colors.redAccent, centerTitle: true),
      body: Padding(padding: EdgeInsets.all(16), child: Column(children: [
        TextField(controller: linkController, decoration: InputDecoration(hintText: "https://www.youtube.com/watch?v=...", labelText: "رابط الفيديو", border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), prefixIcon: Icon(Icons.link), filled: true)),
        SizedBox(height: 16),
        ElevatedButton.icon(style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, minimumSize: Size(double.infinity, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: (){setState(() {if(linkController.text.isEmpty){status = "عافاك دخل الرابط أولا";} else {status = "جاري تحليل الرابط...\n${linkController.text}";}});}, icon: Icon(Icons.download, size: 28), label: Text("تحميل الآن", style: TextStyle(fontSize: 18))),
        SizedBox(height: 24),
        Expanded(child: GridView.count(crossAxisCount: 3, children: [platform("YouTube", Icons.play_circle_fill, Colors.red), platform("Facebook", Icons.facebook, Colors.blue), platform("Instagram", Icons.camera_alt, Colors.purple), platform("TikTok", Icons.music_note, Colors.black), platform("Twitter", Icons.flutter_dash, Colors.lightBlue), platform("WhatsApp", Icons.chat, Colors.green)])),
        Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(12)), child: Text(status, textAlign: TextAlign.center))
      ])),
    );
  }
  Widget platform(String name, IconData icon, Color color){return Card(color: Colors.grey[850], child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: color, size: 40), SizedBox(height: 8), Text(name)]));}
}
