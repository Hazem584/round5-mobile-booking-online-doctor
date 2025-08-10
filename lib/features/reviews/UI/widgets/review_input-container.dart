import 'package:flutter/material.dart';

class ReviewInputContainer extends StatefulWidget {
  final String? hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final int maxLines;
  final int? maxLength;
  final TextEditingController? controller;
  const ReviewInputContainer({
    super.key,
    this.hintText = "Write your review",
    this.onChanged,
    this.onSubmitted,
    this.maxLines = 8,
    this.maxLength, this.controller,
  });

  @override
  State<ReviewInputContainer> createState() => _ReviewInputContainerState();
}

class _ReviewInputContainerState extends State<ReviewInputContainer> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: widget.controller ?? _controller,
        focusNode: _focusNode,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black87,
          height: 1.5,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 18.0,
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          counterText: widget.maxLength != null ? null : '',
        ),
      ),
    );
  }
}
