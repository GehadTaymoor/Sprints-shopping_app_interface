import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Shopping App"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Our products",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.05,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.3,
                  child: PageView(
                    children: [
                      Image.asset("assets/pngegg (7).png"),
                      Image.asset("assets/pngegg (8).png"),
                      Image.asset("assets/pngegg (9).png"),
                    ],
                  ),
                ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    crossAxisSpacing: screenWidth * 0.033,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: screenWidth * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/pngegg (7).png",
                            width: screenWidth * 0.1,
                          ),
                          Text("Product no. ${index + 1}"),
                          IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Added to the cart successfully'),
                                  duration: Duration(seconds: 2),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                            icon: Icon(Icons.shopping_cart),
                          ),

                        ],
                      ),
                    );
                  },
                  itemCount: 2,
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Hot Offers",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.05,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Image.asset(
                              "assets/pngegg (7).png",
                              width: screenWidth * 0.1,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Product no. ${index + 1}",
                              style: TextStyle(fontSize: screenWidth * 0.04),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
