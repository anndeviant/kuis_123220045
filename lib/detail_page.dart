import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final int likes;
  final String title;
  final String image;
  final String description;

  const DetailPage({
    super.key,
    required this.title,
    required this.likes,
    required this.image,
    required this.description,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int numLikes = 0;
  bool _isLike = false;

  @override
  void initState() {
    super.initState();
    numLikes = widget.likes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("News Detail")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  widget.image,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    widget.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_isLike) {
                          numLikes--;
                          _isLike = false;
                        } else {
                          numLikes++;
                          _isLike = true;
                        }
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          _isLike ? Icons.favorite : Icons.favorite_border,
                          color: _isLike ? Colors.red : Colors.grey,
                          size: 16, // Sesuaikan ukuran jika diperlukan
                        ),
                        SizedBox(
                          width: 4,
                        ), // Memberi jarak antara ikon dan teks
                        Text(
                          '$numLikes likes',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
