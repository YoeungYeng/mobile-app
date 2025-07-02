import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/Category.dart';
import 'package:news/Config.dart';
import 'package:news/page/NewViews.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<Data> categoryList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getCategory();
  }

  Future<void> getCategory() async {
    final String url = "${Config.connection}/getcategory";

    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        final Map<String, dynamic> decodeBody = jsonDecode(res.body);
        final List<dynamic> result = (decodeBody['data'] as List<dynamic>?) ?? [];

        setState(() {
          categoryList = result.map((e) => Data.fromJson(e)).toList();
          isLoading = false;
        });
      } else {
        print("Error: Server returned status code ${res.statusCode}");
      }
    } catch (e) {
      print("Exception occurred: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categoryList.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("យឿង យ៉េង"),
          centerTitle: true,
          bottom: isLoading
              ? null
              : TabBar(
            isScrollable: true,
            tabs: categoryList
                .map(
                  (category) => Tab(
                child: Text(
                  category.name.toString(),
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            )
                .toList(),
          ),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : TabBarView(
          children: categoryList.map((category) {

            return Newviews(
              title: category.name.toString(),
              category_id:category.id!
            );
          }).toList(),
        ),
      ),
    );
  }
}
