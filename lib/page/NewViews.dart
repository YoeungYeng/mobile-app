import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:news/CategoryDetails.dart';
import 'package:news/Config.dart';
import 'package:news/News.dart';
import 'package:http/http.dart' as http;
import 'package:news/page/NewDetail.dart';

class Newviews extends StatefulWidget {
  final int category_id;
  final String title;

  const Newviews({super.key, required this.category_id, required this.title});

  @override
  State<Newviews> createState() => _NewviewsState();
}

class _NewviewsState extends State<Newviews> {
  List<Data> newsList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNewsByCategory();
  }

  Future<void> fetchNewsByCategory() async {
    final url = '${Config.connection}/news/category/${widget.category_id}';

    try {
      final res = await http.get(Uri.parse(url));

      if (res.statusCode == 200) {
        final jsonData = jsonDecode(res.body);
        final newsData = Category_Details.fromJson(jsonData);

        setState(() {
          newsList = newsData.data ?? [];
          isLoading = false;
        });
      } else {
        print('Failed to load news. Code: ${res.statusCode}');
        setState(() => isLoading = false);
      }
    } catch (e) {
      print('Error: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : newsList.isEmpty
        ? const Center(child: Text("No news found."))
        : GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
      ),
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  // height: 300,
                  padding: EdgeInsets.all(8.0),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.white.withOpacity(0.6),
                  ),
                  child: ImageNetwork(
                    onTap:
                        () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => Newdetail(
                            title:
                            newsList[index].title
                                .toString(),
                            content:
                            newsList[index].content
                                .toString(),
                            description:
                            newsList[index].description
                                .toString(),
                            image:
                            newsList[index].image
                                .toString(),
                          ),
                        ),
                      ),
                    },
                    image: newsList[index].image.toString(),
                    borderRadius: BorderRadius.circular(6.0),
                    height: 300.0,
                    width: 600,
                    duration: 1500,
                    // curve: Curves.easeIn,
                    onPointer: true,
                    debugPrint: false,
                    fitAndroidIos: BoxFit.cover,
                    fitWeb: BoxFitWeb.cover,
                    onLoading: const CircularProgressIndicator(
                      color: Colors.indigoAccent,
                    ),
                    onError: const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    newsList[index].title.toString(), maxLines: 1,style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
