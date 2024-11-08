import 'package:flutter/material.dart';
import 'package:flutter_application/screens/detail_scree.dart';

class CoffeeHomeScreen extends StatefulWidget {
  @override
  _CoffeeHomeScreenState createState() => _CoffeeHomeScreenState();
}

class _CoffeeHomeScreenState extends State<CoffeeHomeScreen> {
  String selectedCoffeeType = 'Cappuccino'; // Default selected coffee type

  void _onCoffeeTypeTap(String coffeeType) {
    setState(() {
      selectedCoffeeType = coffeeType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Find the best coffee for you',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // Add menu functionality
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Find Your Coffee...',
                  hintStyle: TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),

              // Coffee Types
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CoffeeTypeText(
                    coffeeType: 'Cappuccino',
                    isSelected: selectedCoffeeType == 'Cappuccino',
                    onTap: _onCoffeeTypeTap,
                  ),
                  CoffeeTypeText(
                    coffeeType: 'Espresso',
                    isSelected: selectedCoffeeType == 'Espresso',
                    onTap: _onCoffeeTypeTap,
                  ),
                  CoffeeTypeText(
                    coffeeType: 'Latte',
                    isSelected: selectedCoffeeType == 'Latte',
                    onTap: _onCoffeeTypeTap,
                  ),
                  CoffeeTypeText(
                    coffeeType: 'Flat White',
                    isSelected: selectedCoffeeType == 'Flat White',
                    onTap: _onCoffeeTypeTap,
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Coffee Grid
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: 2, // Adjust as needed
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CoffeeDetailScreen(),
                        ),
                      );
                    },
                    child: CoffeeCard(
                      coffeeType: selectedCoffeeType,
                      description: index == 0 ? 'With Oat Milk' : 'With Chocolate',
                      imagePath: selectedCoffeeType == 'Espresso'
                          ? 'images/espresso.jpg'
                          : 'images/espresso.jpg',
                    ),
                  );
                },
              ),
              SizedBox(height: 20),

              // "Special For You" Section
              Text(
                'Special For You',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              SpecialForYouCard(
                title: '5 Coffee Beans You Must Try!',
                imagePath: 'images/cappuccino.jpg', // Replace with your image path
              ),
              SpecialForYouCard(
                title: 'Discover the Best Coffee Shops',
                imagePath: 'images/cappuccino.jpg', // Replace with your image path
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.orange,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}

class CoffeeTypeText extends StatelessWidget {
  final String coffeeType;
  final bool isSelected;
  final Function(String) onTap;

  CoffeeTypeText({required this.coffeeType, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(coffeeType),
      child: Column(
        children: [
          Text(
            coffeeType,
            style: TextStyle(
              color: isSelected ? Colors.orange : Colors.white54,
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (isSelected)
            Container(
              margin: EdgeInsets.only(top: 4),
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}

class CoffeeCard extends StatelessWidget {
  final String coffeeType;
  final String description;
  final String imagePath;

  CoffeeCard({required this.coffeeType, required this.description, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.grey[800],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coffeeType,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  description,
                  style: TextStyle(color: Colors.white54, fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$4.20',
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                      ),
                      padding: EdgeInsets.all(4), // Padding around the icon
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SpecialForYouCard extends StatelessWidget {
  final String title;
  final String imagePath;

  SpecialForYouCard({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
