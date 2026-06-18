import 'package:flutter/material.dart';

class PurchaserPage extends StatelessWidget {
  const PurchaserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).padding.top;
    debugPrint('$height');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: .fromHeight(height),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/top-extra-bg.png'),
              alignment: .topCenter,
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.only(top: height),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                const Text(
                  '采购经理A',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            constraints: BoxConstraints(minWidth: double.infinity),
            color: Color(int.parse('FF27C1A5', radix: 16)),
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 12.0,
            ),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text('111'),
            ),
          ),
        ],
      ),
    );
  }
}
