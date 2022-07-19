import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Bottom Navigationbar

class BottmNav extends StatefulWidget {
  const BottmNav({Key? key}) : super(key: key);

  @override
  State<BottmNav> createState() => _BottmNavState();
}

class _BottmNavState extends State<BottmNav> {
  int page = 0;
  List<Widget> Pages = [
    HomePage(),
    Page01(),
    Page02(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: page,
        selectedLabelStyle: TextStyle(color: Colors.black),
        onTap: (value) {
          setState(() {
            page = value;
          });
        },
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: Pages[page],
    );
  }
}

//Home Page

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> Items = [
    {
      'Name': 'Pasta',
      'Image': 'assets/image/pngegg (11).png',
    },
    {
      'Name': 'Sushi',
      'Image': 'assets/image/pngegg (15).png',
    },
    {
      'Name': 'Salads',
      'Image': 'assets/image/pngegg (13).png',
    },
    {
      'Name': 'Chez Pasta',
      'Image': 'assets/image/pngegg (14).png',
    },
  ];

  List<Map<String, dynamic>> Foods = [
    {
      'Image':
          'assets/image/front-view-chicken-burger-with-cheese-green-salad-wooden-desk-sandwich-fast-food-meal-food.jpg',
    },
    {
      'Image': 'assets/image/crispy-french-fries-with-ketchup-mayonnaise.jpg',
    },
    {
      'Image': 'assets/image/healthy-vegetables-wooden-table.jpg',
    }
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.18),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: width * 0.03, top: height * 0.01),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.deepOrange,
                        ),
                        Text(
                          ' 800 Cheese avenue,',
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' NYC',
                          style: TextStyle(
                              color: Colors.grey, fontSize: width * 0.04),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 17),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        hintText: 'Search for food',
                        hintStyle: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w500),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none),
                        // disabledBorder: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(15),
                        // ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.03),
                child: Text(
                  'Something new',
                  style: TextStyle(
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * 0.26,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(10)),
                      child: InkResponse(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Page04(),
                              ));
                        },
                        child: Container(
                          // height: height * 0.22,
                          width: width * 0.38,
                          margin: EdgeInsets.only(left: width * 0.03),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: height * 0.03, left: width * 0.02),
                                child: Text(
                                  Items[index]['Name'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.04,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: height * 0.07,
                                top: height * 0.13,
                                child: Image.asset(
                                  Items[index]['Image'],
                                  height: height * 0.2,
                                  width: height * 0.2,
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
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.03, top: height * 0.03),
                child: Text(
                  'Recommended',
                  style: TextStyle(
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: height * 0.33,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: height * 0.22,
                          width: width * 0.65,
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.teal,
                              image: DecorationImage(
                                image: AssetImage(
                                  Foods[index]['Image'],
                                ),
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Heaven's Food",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: width * 0.035),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: width * 0.04,
                                  ),
                                  Text(
                                    ' 4.5   •  ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: width * 0.03,
                                    ),
                                  ),
                                  Icon(
                                    Icons.watch_later,
                                    color: Colors.grey,
                                    size: width * 0.04,
                                  ),
                                  Text(
                                    '  25 - 30 min',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: width * 0.03),
                                  ),
                                  Text(
                                    '  •  \$\$\$',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: width * 0.03),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Text(
                                        ' Steak ',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: width * 0.03),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Text(
                                        ' Fish ',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: width * 0.03),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Text(
                                        ' Experimental ',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: width * 0.03),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Order page

class Page01 extends StatefulWidget {
  const Page01({Key? key}) : super(key: key);

  @override
  State<Page01> createState() => _Page01State();
}

class _Page01State extends State<Page01> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Order page')),
    );
  }
}

//Profile

class Page02 extends StatefulWidget {
  const Page02({Key? key}) : super(key: key);

  @override
  State<Page02> createState() => _Page02State();
}

class _Page02State extends State<Page02> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Profile')),
    );
  }
}

//Page02

class Page04 extends StatefulWidget {
  const Page04({Key? key}) : super(key: key);

  @override
  State<Page04> createState() => _Page04State();
}

class _Page04State extends State<Page04> {
  int Filter = 0;
  int Page = 0;
  PageController Pagecontroller = PageController();
  List<Map<String, dynamic>> FiltersList = [
    {
      'Name': 'Potato wedges',
      'Last': 'Recommended',
    },
    {
      'Name': 'Potato wedges',
      'Last': '',
    },
    {
      'Name': 'Potato wedges',
      'Last': '',
    }
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: height * 0.33,
                  width: double.infinity,
                  color: Colors.grey,
                  child: PageView(
                    onPageChanged: (value) {
                      setState(() {
                        Page = value;
                      });
                    },
                    controller: Pagecontroller,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Image.asset(
                        'assets/image/sk-uVPV_nV17Tw-unsplash.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/image/mike-PxJ9zkM2wdA-unsplash.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/image/jonathan-borba-8l8Yl2ruUsg-unsplash.jpg',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.orange,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.01,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              Page = index;
                            });
                          },
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor:
                                Page == index ? Colors.orange : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.035),
              child: Text(
                'Big Mad Burger',
                style: TextStyle(
                    fontSize: width * 0.055, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: height * 0.013,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.035),
              child: Text(
                'Potato Bun, cheddar cheese, beef, cucumber, red\nonion, iceberg lettuce, avocado, tomato',
                style: TextStyle(color: Colors.black26),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.035),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose addition',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.04,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        'Required',
                        style: TextStyle(color: Colors.black26),
                      )
                    ],
                  ),
                  Container(
                    height: height * 0.04,
                    width: height * 0.04,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black12,
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_up_outlined,
                      color: Colors.black26,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          setState(() {
                            Filter = index;
                          });
                        },
                        leading: Container(
                          height: height * 0.035,
                          width: height * 0.035,
                          decoration: BoxDecoration(
                            color: Filter == index
                                ? Colors.orange
                                : Colors.transparent,
                            shape: BoxShape.circle,
                            border: Filter == index
                                ? Border.all(color: Colors.transparent)
                                : Border.all(color: Colors.black26),
                          ),
                          child: Center(
                            child: Filter == index
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 17,
                                  )
                                : SizedBox(),
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(FiltersList[index]['Name']),
                            Text(
                              FiltersList[index]['Last'],
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(top: height * 0.015),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Order_Details(),
                ),
              );
            },
            child: Container(
              height: height * 0.13,
              width: double.infinity,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Container(
                    height: height * 0.08,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black87,
                    ),
                    child: Center(
                      child: Text(
                        'Add(1)to cart-12,90',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Order_Details extends StatefulWidget {
  const Order_Details({Key? key}) : super(key: key);

  @override
  State<Order_Details> createState() => _Order_DetailsState();
}

class _Order_DetailsState extends State<Order_Details> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.12),
        child: Container(
          width: double.infinity,
          height: height * 0.12,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(width * 0.03),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: width * 0.04,
              right: width * 0.04,
              top: width * 0.07,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkResponse(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: width * 0.07,
                  ),
                ),
                Text(
                  'Order details',
                  style: TextStyle(
                      fontSize: width * 0.04, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.help_outline,
                  size: width * 0.07,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Text(
              "Heaven's food",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: width * 0.07,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      color: Colors.orange,
                      size: width * 0.06,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Delivery / As soon as possible'),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black26,
                  size: width * 0.06,
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(top: height * 0.015),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderPage(),
              ),
            );
          },
          child: Container(
            height: height * 0.13,
            width: double.infinity,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Container(
                  height: height * 0.08,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black87,
                  ),
                  child: Center(
                    child: Text(
                      'Place order',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text('Order')),
      ),
    );
  }
}
