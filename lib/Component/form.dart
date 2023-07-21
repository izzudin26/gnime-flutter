import 'package:flutter/material.dart';
import 'package:flutter_gogonime/Colors.dart' as kcolors;
import 'package:lucide_icons/lucide_icons.dart';

TextField kTextField({TextEditingController? controller, void Function(String)? onChange}) {
  return TextField(
    controller: controller,
    style: const TextStyle(color: kcolors.primary),
    onChanged: onChange,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        prefixIcon: const Icon(LucideIcons.search, color: kcolors.primary),
        filled: true,
        fillColor: kcolors.slate600,
        focusColor: kcolors.slate600,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none)),
  );
}
