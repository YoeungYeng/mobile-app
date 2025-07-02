import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class Newdetail extends StatefulWidget {
  const Newdetail({
    super.key,
    required this.title,
    required this.content,
    required this.description,
    required this.image,
  });

  final title, content, description, image;

  @override
  State<Newdetail> createState() => _NewdetailState();
}

class _NewdetailState extends State<Newdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text(widget.title, style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.black54,
        ),
        body: ListView(
          children: [
            Padding(

              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          ImageNetwork(
                            image: widget.image,
                            height: 400,
                            width: 400,

                            fitAndroidIos: BoxFit.contain,
                            fitWeb: BoxFitWeb.contain,
                            onPointer: true,
                            debugPrint: false,
                          ),
                          Text(widget.title, style: TextStyle(fontSize: 24.0),),
                          Text(widget.content, style: TextStyle(fontSize: 16.0),),
                          Text(widget.description, style: TextStyle(fontSize: 14.0),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}
