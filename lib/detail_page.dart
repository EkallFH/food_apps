import 'package:flutter/material.dart';
import 'package:food_apps/menu_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      setState(() {
        count--;
      });
    });
  }

  int count = 0;

  List size = [
    'S',
    'M',
    'L',
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(70, 43, 156, 1),
                  Color.fromRGBO(100, 74, 181, 1),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(children: [
                  Transform.translate(
                    offset: const Offset(-170, 40),
                    child: IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_left,
                        size: 40,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MenuPage(),
                          ),
                        );
                      },
                    ),
                  ),
                ]),
                Image.asset(
                  'images/cheese-pizza.png',
                  height: 320,
                  width: 320,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                  height: 500,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 110,
                            height: 52,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(70, 43, 156, 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: RichText(
                                text: const TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(251, 190, 33, 1),
                                        size: 20,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: SizedBox(
                                        width: 5,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '4.8',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 185,
                          ),
                          const Text(
                            '\$32',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22,
                              color: Color.fromRGBO(201, 170, 5, 1),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Cheese Pizza',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            width: 45,
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  decrement();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: const CircleBorder(
                                    side: BorderSide(color: Colors.black),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                              ),
                              Text('$count'),
                              ElevatedButton(
                                onPressed: () {
                                  increment();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: const CircleBorder(
                                    side: BorderSide(color: Colors.black),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        width: 360,
                        child: Text(
                          'Cheese pizza is a classic dish loved by many. It consists of a simple yet delicious combination of soft, melted cheese spread over a bed of tangy tomato sauce, all atop a perfectly baked crust.',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            letterSpacing: 0.1,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Transform.translate(
                        offset: const Offset(-155, 0),
                        child: const Text(
                          'Size',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 70,
                            child: ListView.builder(
                              itemCount: size.length,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      current = index;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    height: 43,
                                    width: 93,
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: current == index
                                          ? const Color.fromARGB(
                                              255, 236, 235, 243)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: current == index
                                          ? Border.all(
                                              color: const Color.fromRGBO(
                                                  70, 43, 156, 1),
                                            )
                                          : Border.all(color: Colors.black),
                                    ),
                                    child: Center(
                                      child: Text(
                                        size[index],
                                        style: TextStyle(
                                          fontFamily: 'Sora',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: current == index
                                              ? const Color.fromRGBO(
                                                  70, 43, 156, 1)
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MenuPage()),
                              );
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(70, 43, 156, 1),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 120, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'Add To Cart',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
