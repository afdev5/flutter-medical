import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffFF725E),
        title: Text("Choose your doctor"),
      ),
      body: Container(
        child: Column(
          children: [
            DefaultTabController(
              length: 4,
              child: TabBar(
                labelColor: Colors.black,
                indicatorColor: Color(0xffFF725E),
                unselectedLabelColor: Colors.grey,
                onTap: (index) {
                },
                tabs: [
                  Tab(
                    text: "All",
                  ),
                  Tab(
                    text: "Cardiologist",
                  ),
                  Tab(
                    text: "Neurologists",
                  ),
                  Tab(
                    text: "Orthoped",
                  )
                ],
              ),
            ),
            cardDoctor("assets/doctor1.jpg", "Dr. Dewi Hasan", "Neurologists",
                isFirst: true),
            cardDoctor("assets/doctor2.jpg", "Dr. Fajar Duke", "Cardiologists"),
            cardDoctor("assets/doctor3.jpg", "Dr. Rocky Yute", "Cardiologists"),
            cardDoctor("assets/doctor4.jpg", "Dr. Jafar Anki", "Orthoped"),
            cardDoctor("assets/doctor5.jpg", "Dr. Yuki Keto", "Neurologists")
          ],
        ),
      ),
    );
  }

  Widget cardDoctor(String image, String name, String specialist,
      {bool isFirst = false}) {
    return Card(
      color: Colors.grey[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 2,
      margin: isFirst
          ? EdgeInsets.all(12)
          : EdgeInsets.only(left: 12, right: 12, bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ListTile(
          leading: Container(
            height: 100,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.fill)),
            // child: Image.asset(image, fit: BoxFit.fill)),
          ),
          title: Text(name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          subtitle: Text(specialist),
          trailing: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color(0xffFF725E)),
            child: Center(
                child: Icon(Icons.arrow_forward_ios, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
