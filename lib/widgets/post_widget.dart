import 'package:flutter/material.dart';

import '../models/featured.dart';
import 'featured_card_widget.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: [
        FeaturedCard(
          featured: listFeatured[0],
        ),
        FeaturedCard(
          featured: listFeatured[1],
        ),
        FeaturedCard(
          featured: listFeatured[2],
        ),
      ],
    );
  }
}
