import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String? hintText;
  final VoidCallback? onTap;
  const SearchBar({Key? key, this.hintText, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.01),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height * 0.055,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              SizedBox(width: width * 0.04),
              const Icon(Icons.search, color: Colors.grey),
              SizedBox(width: width * 0.02),
              Expanded(
                child: Text(
                  hintText ?? "Search for 'atta, dal and more'",
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Poppins', // Use AppFonts.poppins if available
                    fontSize: height * 0.021,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
