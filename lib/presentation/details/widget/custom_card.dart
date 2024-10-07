import 'package:flutter/material.dart';

class CustomCardItemDetailsCategory extends StatelessWidget {
  final String nameProduct;
  final String image;
  final Function() func;
  final bool isFavorite;
  final Function() onFavoriteToggle;
  const CustomCardItemDetailsCategory({
    super.key,
    required this.func,
    required this.nameProduct,
    required this.image,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Positioned(
            top: 10.0,
            left: 10.0,
            child: Container(
              height: 65.0,
              width: 200.0,
              color: Colors.transparent,
              alignment: Alignment.center,
              child: Text(nameProduct),
            ),
          ),
          Positioned(
            top: 70.0,
            left: 10.0,
            child: Container(
              height: 99.0,
              width: 170.0,
              color: Colors.transparent,
              alignment: Alignment.center,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Image(
                  image: NetworkImage(scale: 8, image),
                ),
              ),
            ),
          ),
          Positioned(
            top: 150.0,
            right: 2.0,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: onFavoriteToggle,
            ),
          ),
        ],
      ),
    );
  }
}
