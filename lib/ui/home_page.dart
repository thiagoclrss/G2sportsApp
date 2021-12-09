import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget buildCard(int index) => Material(
        elevation: 10,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
          ),
          onPressed: () {},
          child: Container(
            width: 157,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/cards/image_${index}.jpg",
                ),
                const SizedBox(height: 4),
                const Text(
                  'Tênis Adidas',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'R\$ 189,90',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff593CFF),
        elevation: 20,
        flexibleSpace: Row(
          children: [
            IconButton(
              padding: const EdgeInsets.fromLTRB(15, 10, 43, 0),
              iconSize: 35,
              icon: const Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {},
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 35, 30, 20),
              width: 176,
              child: Image.asset(
                "assets/images/G2sports.png",
                width: 176,
                height: 59,
              ),
            ),
            IconButton(
              padding: const EdgeInsets.fromLTRB(11, 10, 0, 0),
              iconSize: 35,
              icon: const Icon(Icons.shopping_cart),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 50, 15, 18),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'O que você procura?',
                  hintStyle: const TextStyle(
                    color: Color(0xffB8ACFF),
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.fromLTRB(17, 0, 20, 0),
                    child: Icon(
                      Icons.search,
                      color: Color(0xffB8ACFF),
                      size: 38,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20.0)),
                  fillColor: const Color(0xff8874FF),
                  filled: true),
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(7),
                bottomRight: Radius.circular(7))),
      ),
      extendBody: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25, 0, 0, 35),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 26, 18, 26),
              child: Text(
                'Novidades para você',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff593CFF),
                  shadows: <Shadow>[
                    Shadow(
                      color: Colors.grey,
                      blurRadius: 11,
                      offset: Offset(0, 3.5),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 230,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (context, _) => const SizedBox(
                  width: 12,
                ),
                itemBuilder: (context, index) => buildCard(index),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 26, 22, 26),
              child: Text(
                'Mais vendidos',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff593CFF),
                  shadows: <Shadow>[
                    Shadow(
                      color: Colors.grey,
                      blurRadius: 11,
                      offset: Offset(0, 3.5),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 230,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (context, _) => const SizedBox(
                  width: 12,
                ),
                itemBuilder: (context, index) => buildCard(index),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 26, 22, 26),
              child: Text(
                'Ofertas para você',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff593CFF),
                  shadows: <Shadow>[
                    Shadow(
                      color: Colors.grey,
                      blurRadius: 11,
                      offset: Offset(0, 3.5),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 230,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (context, _) => const SizedBox(
                  width: 12,
                ),
                itemBuilder: (context, index) => buildCard(index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
