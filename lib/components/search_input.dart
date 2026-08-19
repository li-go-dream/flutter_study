import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  final String initval;
  final String placeholder;
  final Function valueChange;
  final Color color;

  const SearchInput({
    super.key,
    this.initval = '',
    this.placeholder = '请输入',
    this.color = Colors.white,
    required this.valueChange,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initval;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 4, 4, 4),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.search, size: 16, color: Color(0xFFBDBDBD)),
          const SizedBox(width: 4),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: .none,
                isDense: true,
                hintText: widget.placeholder,
                hintStyle: TextStyle(color: Color(0xFFBDBDBD)),
              ),
              style: TextStyle(fontSize: 14, fontWeight: .w400),
            ),
          ),
          InkWell(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: Text(
                '搜索',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: .w400,
                  color: Color(0xFF27C1A5),
                ),
              ),
            ),
            onTap: () {
              widget.valueChange(_controller.text);
            },
          ),
        ],
      ),
    );
  }
}
