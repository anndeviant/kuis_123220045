import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  final String id;
  final String title;
  final String image;
  final String description;
  final int likes;
  final Function(String, String, String, int) onDetail;

  const NewsItem({
    super.key,
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.likes,
    required this.onDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              child: Image.network(image, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "\u2764 $likes likes",
                  style: const TextStyle(color: Colors.grey),
                ),
                // Icon(Icons.airport_shuttle, semanticLabel: 'Likes'),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      onDetail(title, image, description, likes);
                    },
                    child: const Text("Detail News"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
