import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.white38,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.white38,
          ),
        ),
        labelText: 'Search',
        suffixIcon: IconButton(
          icon: const Icon(UniconsLine.search),
          onPressed: () {},
        ),
      ),
    );
  }
}
