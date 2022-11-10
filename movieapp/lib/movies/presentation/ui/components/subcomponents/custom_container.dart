import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomContainer extends StatelessWidget {
  final String categoryOfMovies;
  final VoidCallback pressSeeAll;

  const CustomContainer({
    Key? key,
    required this.categoryOfMovies,
    required this.pressSeeAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            categoryOfMovies,
            style: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: pressSeeAll,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    'See More',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
