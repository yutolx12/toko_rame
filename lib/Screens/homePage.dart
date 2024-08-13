import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedPackage = 'Paket 1';
  String _selectedColor = 'Brown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toko Rame'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image Carousel
            Container(
              height: 200,
              child: PageView(
                children: [
                  Image.asset('assets/onboarding1.png'),
                  Image.asset('assets/onboarding2.png'),
                  Image.asset('assets/onboarding3.png'),
                ],
              ),
            ),

            // Product Details
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Beauty Set by Irvie',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text('Rp178.000', style: TextStyle(fontSize: 16)),
                      SizedBox(width: 10),
                      Text(
                        'Rp142.400',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Komisi Rp35.600 (20%)',
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Size and color options
                  Row(
                    children: [
                      DropdownButton<String>(
                        value: _selectedPackage,
                        items:
                            <String>['Paket 1', 'Paket 2'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedPackage = newValue!;
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      Text('Warna'),
                      SizedBox(width: 10),
                      Row(
                        children: [
                          _buildColorOption('Brown'),
                          SizedBox(width: 10),
                          _buildColorOption('Grey'),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Stok: 99+ pcs',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '*New Material*\nTerbuat dari bahan 100% Katun Linen yang membuat nyaman jika digunakan. Menggunakan fit Relaxed Fit.',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),

            // Other Product Recommendations
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Produk lain dari Irvie group official',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildProductCard('assets/onboarding1.png'),
                        _buildProductCard('assets/onboarding2.png'),
                        _buildProductCard('assets/onboarding3.png'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorOption(String color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = color;
        });
      },
      child: CircleAvatar(
        backgroundColor: color == 'Brown' ? Colors.brown : Colors.grey,
        child: _selectedColor == color
            ? Icon(Icons.check, color: Colors.white)
            : null,
      ),
    );
  }

  Widget _buildProductCard(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(imagePath, height: 100, width: 100),
          SizedBox(height: 8),
          Text('Beauty Set by Irvie', style: TextStyle(fontSize: 14)),
          Text('Rp142.400',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
