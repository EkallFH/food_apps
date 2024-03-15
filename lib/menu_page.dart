import 'package:flutter/material.dart';
import 'package:food_apps/detail_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<String> location = [
    'Bilzen, Tanjungbalai',
    'Giri, Banyuwangi',
    'Kalibaru, Banyuwangi',
    'Genteng, Banyuwangi'
  ];

  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Beef Burger",
      "price": "\$20",
      "images": "images/beef-burger.png",
    },
    {
      "title": "Cheese Pizza",
      "price": "\$32",
      "images": "images/cheese-pizza.png",
    },
    {
      "title": "Fried Fish",
      "price": "\$15",
      "images": "images/fried-fish.png",
    },
    {
      "title": "Pancake",
      "price": "\$10",
      "images": "images/pancake.png",
    },
  ];

  String selectLocation = '';

  List imgList = ['food-plate', 'burger', 'pizza', 'seafood', 'meringue'];
  List<String> nameList = ['All', 'Burger', 'Pizza', 'Seafood', 'Dessert'];
  int current = 0;
  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(30, 60, 30, 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Menu',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 36,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Image.asset(
                          'images/people.png',
                          width: 55,
                          height: 55,
                        ),
                      ],
                    ),
                    Transform.translate(
                      offset: const Offset(-75, 10),
                      child: DropdownButton<String>(
                        dropdownColor: Colors.white,
                        value: selectLocation.isEmpty ? null : selectLocation,
                        hint: const Text(
                          'Your Location',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        items: location.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          selectLocation = value!;
                          setState(() {});
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      style: const TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(124, 124, 124, 1),
                      ),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color.fromRGBO(124, 124, 124, 1),
                          size: 25,
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                          fontFamily: 'Sora',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(124, 124, 124, 1),
                        ),
                        fillColor: const Color.fromRGBO(196, 196, 196, 1),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: ListView.builder(
                        itemCount: imgList.length,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;
                              });
                            },
                            child: Column(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: current == index
                                          ? const Color.fromRGBO(100, 74, 181, 1)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Image.asset(
                                    'images/${imgList[index]}.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                Text(
                                  nameList[index],
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Promotions',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: 350,
                      height: 180,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(100, 74, 181, 1),
                            Color.fromRGBO(160, 133, 247, 1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Transform.translate(
                            offset: const Offset(120, -40),
                            child: Image.asset(
                              'images/fries.png',
                              width: 200,
                              height: 80,
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(-92, -60),
                            child: const Text(
                              'Today\'s Offer',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(-45, -45),
                            child: const Text(
                              'Free box of Fries',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(-60, -45),
                            child: const Text(
                              'all orders above \$150',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 30, left: 30, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Popular',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        mainAxisExtent: 230,
                      ),
                      itemCount: gridMap.length,
                      itemBuilder: (_, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color.fromRGBO(190, 190, 190, 1),
                                Color.fromRGBO(239, 238, 238, 1),
                              ],
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                '${gridMap.elementAt(index)['images']}',
                                width: 150,
                                height: 110,
                              ),
                              Transform.translate(
                                offset: const Offset(5, 15),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${gridMap.elementAt(index)['title']}',
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${gridMap.elementAt(index)['price']}',
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 18,
                                              color: Color.fromRGBO(201, 170, 5, 1),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 60,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const DetailPage()),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color.fromRGBO(14, 128, 60, 1),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              padding: const EdgeInsets.all(5),
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          iconSize: 30,
          selectedItemColor: const Color.fromRGBO(100, 74, 181, 1),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
        ),
      ),
    );
  }
}
