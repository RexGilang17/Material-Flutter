import 'package:flutter/material.dart';

class RowColumnExample extends StatelessWidget {
  RowColumnExample({super.key});

  Widget rowExample = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [BlueBox(), BiggerBlueBox(), BlueBox()],
  );

  Widget columnExample = SizedBox(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [BlueBox(), BiggerBlueBox(), BlueBox()],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: rowExample),
    );
  }
}

class BlueBox extends StatelessWidget {
  const BlueBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      width: 50,
      height: 50,
      decoration: BoxDecoration(color: Colors.blue, border: Border.all()),
    );
  }
}

class BiggerBlueBox extends StatelessWidget {
  const BiggerBlueBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: Colors.blue, border: Border.all()),
    );
  }
}

class RowColumnPractice extends StatelessWidget {
  const RowColumnPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Ancol",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Destinasi di tepi laut Ancol memiliki pantai yang populer untuk olahraga air dan kompleks di tepi laut yang dilengkapi rollercoaster serta wahana di Dunia Fantasi dan taman rekreasi air Atlantis Water Adventure. Keluarga juga dapat menikmati akuarium SeaWorld dengan hiu dan kura-kuranya, serta Ocean Dream Samudra yang menampilkan pertunjukan lumba-lumba dan singa laut. Pasar Seni Ancol menampilkan seniman lokal yang baru muncul dan mengadakan pertunjukan tarian di akhir pekan",
              textAlign: TextAlign.center,
            ),
            Spacer(
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Ulasan: "),
                Row(
                  children: [
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                  ],
                ),
                Text("dari 36 pengulas"),
              ],
            ),
            Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.location_pin),
                    Text("DISTANCE"),
                    Text("10 Km")
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.label),
                    Text("TICKETS"),
                    Text("Rp. 25.000")
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.access_time),
                    Text("OPEN"),
                    Text("09:00 AM")
                  ],
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
