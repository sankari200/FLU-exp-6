import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'product.dart';

void main() => runApp(const MaterialApp(home: ProductInventory()));

class ProductInventory extends StatefulWidget {
  const ProductInventory({super.key});

  @override
  State<ProductInventory> createState() => _ProductInventoryState();
}

class _ProductInventoryState extends State<ProductInventory> {
  final nameController = TextEditingController();
  final qtyController = TextEditingController();
  final priceController = TextEditingController();

  List<Product> productList = [];

  @override
  void initState() {
    super.initState();
    refreshProducts();
  }

  Future<void> refreshProducts() async {
    productList = await DBHelper.instance.getProducts();
    setState(() {});
  }

  Future<void> saveProduct() async {
    if (nameController.text.isEmpty ||
