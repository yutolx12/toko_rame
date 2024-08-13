import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  String _selectedPackage = 'Paket 1';
  String _selectedColor = 'Brown';

  final List<String> _productImages = [
    'assets/produk1.png',
    'assets/produk2.png',
    'assets/produk3.png',
  ];

  final List<Map<String, String>> _relatedProducts = [
    {
      'image': 'assets/produk1.png',
      'name': 'Beauty Set by Irvie',
      'price': 'Rp142.400',
      'stock': '99+ pcs',
    },
    {
      'image': 'assets/produk2.png',
      'name': 'Beauty Set by Irvie',
      'price': 'Rp142.400',
      'stock': '99+ pcs',
    },
    {
      'image': 'assets/produk3.png',
      'name': 'Beauty Set by Irvie',
      'price': 'Rp142.400',
      'stock': '99+ pcs',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image Carousel with Indicator
            Stack(
              children: [
                Container(
                  height: 250,
                  child: PageView.builder(
                    itemCount: _productImages.length,
                    onPageChanged: (int index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(_productImages[index]);
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_productImages.length, (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == index ? 8 : 6,
                        height: _currentPage == index ? 8 : 6,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? Colors.white
                              : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),

            // Product Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    color: Colors.yellow,
                    child: Text(
                      'NEW  Product Baru',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Beauty Set by Irvie',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Irvie group official',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Rp178.000', style: TextStyle(fontSize: 18)),
                          Text(
                            'Rp142.400',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        color: Colors.yellow,
                        child: Text(
                          'Komisi Rp35.600 (20%)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Size and Color options
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Ukuran', style: TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          _buildOptionButton('Paket 1'),
                          SizedBox(width: 10),
                          _buildOptionButton('Paket 2'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Warna', style: TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          _buildColorOption('Brown'),
                          SizedBox(width: 10),
                          _buildColorOption('Grey'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Stok: 99+ pcs',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '*New Material*\nTerbuat dari bahan 100% Katun Linen yang membuat nyaman jika digunakan. Menggunakan fit Relaxed Fit.',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),

            // Related Products Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Produk lain dari Irvie group official',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 500, // Adjust this height as needed
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: _relatedProducts.length,
                      itemBuilder: (context, index) {
                        final product = _relatedProducts[index];
                        return Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                product['image']!,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 8),
                              Text(
                                product['name']!,
                                style: TextStyle(fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 4),
                              Text(
                                product['price']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Stok: ${product['stock']}',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                child: Text(
                                  'Bagikan Produk',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(String package) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPackage = package;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: _selectedPackage == package
              ? Colors.grey.shade300
              : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: _selectedPackage == package ? Colors.black : Colors.grey),
        ),
        child: Text(
          package,
          style: TextStyle(
            fontSize: 14,
            color: _selectedPackage == package ? Colors.black : Colors.grey,
          ),
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
        radius: 14,
        child: _selectedColor == color
            ? Icon(Icons.check, color: Colors.white, size: 16)
            : null,
      ),
    );
  }
}
