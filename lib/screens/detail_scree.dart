import 'package:flutter/material.dart';

class CoffeeDetailScreen extends StatefulWidget {
  @override
  _CoffeeDetailScreenState createState() => _CoffeeDetailScreenState();
}

class _CoffeeDetailScreenState extends State<CoffeeDetailScreen> {
  // Track the selected size
  String selectedSize = 'S';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section with overlaying text
          Stack(
            children: [
              // Large image taking up half the screen height
              ClipRRect(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
                child: Image.asset(
                  'images/cappuccino.jpg',
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Overlay for title, description, and rating
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cappuccino',
                        style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'With Oat Milk',
                        style: TextStyle(color: Colors.white54, fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 20),
                          SizedBox(width: 5),
                          Text(
                            '4.5 (986)',
                            style: TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                          Text(
                            'Medium Roasted',
                            style: TextStyle(color: Colors.white54),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Description section
                Text(
                  'Description',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  'A cappuccino is a coffee-based drink made primarily from espresso and milk.',
                  style: TextStyle(color: Colors.white54),
                ),
                SizedBox(height: 16),

                // Size selector section
                Text(
                  'Size',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Choice chips for selecting size
                    ChoiceChip(
                      label: Text('S', style: TextStyle(color: Colors.white)),
                      selected: selectedSize == 'S',
                      onSelected: (selected) {
                        setState(() {
                          selectedSize = 'S';
                        });
                      },
                      backgroundColor: Colors.grey[800],
                      selectedColor: Colors.orange,
                    ),
                    ChoiceChip(
                      label: Text('M', style: TextStyle(color: Colors.white)),
                      selected: selectedSize == 'M',
                      onSelected: (selected) {
                        setState(() {
                          selectedSize = 'M';
                        });
                      },
                      backgroundColor: Colors.grey[800],
                      selectedColor: Colors.orange,
                    ),
                    ChoiceChip(
                      label: Text('L', style: TextStyle(color: Colors.white)),
                      selected: selectedSize == 'L',
                      onSelected: (selected) {
                        setState(() {
                          selectedSize = 'L';
                        });
                      },
                      backgroundColor: Colors.grey[800],
                      selectedColor: Colors.orange,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          // Bottom price and Buy Now button with updated styling
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(color: Colors.white54, fontSize: 16),
                    ),
                    Text(
                      '\$4.20',
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Buy Now', style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
