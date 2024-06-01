import 'package:flutter/material.dart';

class Discount {
  final String code;
  final String description;
  final String expiryDate;

  Discount({
    required this.code,
    required this.description,
    required this.expiryDate,
  });
}

class DiscountTabPage extends StatefulWidget {
  const DiscountTabPage({super.key});

  @override
  State<DiscountTabPage> createState() => _DiscountTabPageState();
}

class _DiscountTabPageState extends State<DiscountTabPage> {
  final List<Discount> discounts = [
    Discount(
      code: "SUMMER21",
      description: "Giảm 20% cho chuyến đi mùa hè",
      expiryDate: "2024-06-30",
    ),
    Discount(
      code: "WELCOME10",
      description: "Giảm 10% cho chuyến đi đầu tiên",
      expiryDate: "2024-12-31",
    ),
    Discount(
      code: "VIP50",
      description: "Giảm 50% cho thành viên VIP",
      expiryDate: "2024-07-15",
    ),
    // Thêm nhiều mã giảm giá khác ở đây
  ];

  void applyDiscount(Discount discount) {
    // Thực hiện logic khi áp dụng mã giảm giá
    print("Áp dụng mã giảm giá ${discount.code}");
    // Ví dụ: Hiển thị thông báo thành công hoặc thất bại
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Áp dụng mã ${discount.code} thành công!"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffB81736),
        elevation: 0,
        title: const Text(
          "Chào mừng bạn đến với Wolf Care",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: discounts.length,
        itemBuilder: (context, index) {
          final discount = discounts[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              leading: Icon(Icons.local_offer, color: Color(0xffB81736)),
              title: Text(discount.code),
              subtitle: Text(
                "${discount.description}\nHết hạn: ${discount.expiryDate}",
                style: TextStyle(height: 1.5),
              ),
              isThreeLine: true,
              trailing: ElevatedButton(
                onPressed: () {
                  applyDiscount(discount);
                },
                child: Text("Áp dụng"),
              ),
            ),
          );
        },
      ),
    );
  }
}
