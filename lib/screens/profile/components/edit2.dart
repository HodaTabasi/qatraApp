import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class edit2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 60.h,
      style: TextStyle(
          color: Colors.black,
          fontSize: 40.sp,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w700),
      initialValue: "",
      // controller: widget.textEditingController,
      // autofocus: widget.autofocus,
      maxLines: 3,
      // onTap: widget.onTap,
      readOnly: true,
      textAlign: TextAlign.start,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.ice_skating),
        filled: true,
        suffixIconConstraints: BoxConstraints(minWidth: 30.w, minHeight: 30.h),
        prefixIconConstraints: BoxConstraints(minWidth: 40.w, minHeight: 40.h),
        fillColor: Color(0xfff4f8f7),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
        hintText: "widget.hintText",
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(6.56.r),
          borderSide: BorderSide(
            color: Colors.amber,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.56.r),
          borderSide: BorderSide(
            color: Colors.black26,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.56.r),
          borderSide: BorderSide(
            color: Colors.amber,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.56.r),
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 1.0.w,
          ),
        ),
      ),
    );
  }
}
