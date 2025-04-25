import 'package:flutter/material.dart';

class CountryCodeDropdown extends StatefulWidget {
  final void Function(String code)? onChanged;

  const CountryCodeDropdown({super.key, this.onChanged});

  @override
  State<CountryCodeDropdown> createState() => _CountryCodeDropdownState();
}

class _CountryCodeDropdownState extends State<CountryCodeDropdown> {
  String _selectedValue = '🇧🇩 +880';

  final List<Map<String, String>> _countries = [
    {'flag': '🇧🇩', 'code': '+880'},
    {'flag': '🇮🇳', 'code': '+91'},
    {'flag': '🇺🇸', 'code': '+1'},
    {'flag': '🇬🇧', 'code': '+44'},
    {'flag': '🇨🇦', 'code': '+1'},
    {'flag': '🇦🇺', 'code': '+61'},
    {'flag': '🇵🇰', 'code': '+92'},
    {'flag': '🇸🇦', 'code': '+966'},
    {'flag': '🇦🇪', 'code': '+971'},
    {'flag': '🇩🇪', 'code': '+49'},
    {'flag': '🇫🇷', 'code': '+33'},
    {'flag': '🇨🇳', 'code': '+86'},
    {'flag': '🇯🇵', 'code': '+81'},
    {'flag': '🇰🇷', 'code': '+82'},
    {'flag': '🇳🇵', 'code': '+977'},
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        padding: EdgeInsets.zero,
        value: _selectedValue,
        // isDense: true,
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              _selectedValue = newValue;
            });
            final String code = newValue.split(' ').last;
            widget.onChanged?.call(code);
          }
        },
        items:
            _countries.map((country) {
              final displayValue = "${country['flag']} ${country['code']}";
              return DropdownMenuItem<String>(
                value: displayValue,
                child: Text(displayValue, style: const TextStyle(fontSize: 14)),
              );
            }).toList(),
        icon: SizedBox(),
      ),
    );
  }
}
