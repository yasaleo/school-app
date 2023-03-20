import 'package:flutter/material.dart';

class CustomTextfeild extends StatefulWidget {
  const CustomTextfeild({
    Key? key,
    required this.label,
    this.controller,
    this.validator,
    this.passwordfeild = false,
    this.prefix,
    this.textInputType,
    this.icon,
    this.onTap,
  }) : super(key: key);

  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool passwordfeild;
  final Widget? prefix;
  final Widget? icon;
  final void Function()? onTap;

  final TextInputType? textInputType;

  @override
  State<CustomTextfeild> createState() => _CustomTextfeildState();
}

class _CustomTextfeildState extends State<CustomTextfeild> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        onTap: widget.onTap,
        keyboardType: widget.textInputType,
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.passwordfeild ? obscureText : widget.passwordfeild,
        decoration: InputDecoration(
          icon: widget.icon,
          iconColor: Colors.black,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          prefix: widget.prefix,
          suffixIcon: widget.passwordfeild
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black45,
                  ),
                )
              : null,
          label: Text(widget.label),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 4,
              color: Colors.white,
            ),
          ),
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 4, color: Colors.white),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 4, color: Colors.green),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 4,
              color: Colors.greenAccent,
            ),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(color: Colors.redAccent, width: 7),
          ),
          errorBorder: const UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(color: Colors.redAccent, width: 4),
          ),
        ),
      ),
    );
  }
}
