import 'package:flutter/material.dart';

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: ShapeDecoration(
        color: const Color(0xFFEEE5FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6.0),
            child: Text(
              'See All',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF7E3DFF),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 0.09,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
