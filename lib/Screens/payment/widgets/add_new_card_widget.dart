import 'package:flutter/material.dart';
import 'package:grocceryplus/theme/const_color.dart';

class AddNewCardWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;

  final VoidCallback? onTap;

  const AddNewCardWidget({super.key, this.title, this.subtitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
      child: GestureDetector(
        onTap: onTap,
        //borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              //* Leading Icon/Image
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.pink.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: ConstColor.GreyColor.withValues(alpha: 0.3),
                  ),
                ),
                child: Icon(Icons.add, size: 24, color: Colors.pink),
              ),
              const SizedBox(width: 16),

              //* Title and Subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (subtitle != null) ...[
                      Text(
                        title ?? "N/A",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ConstColor.BlackColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        subtitle ?? "",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ConstColor.mediumBlack,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ] else ...[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title ?? "N/A",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: ConstColor.BlackColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),

              //* Trailing Icon
              // const SizedBox(width: 16),
              // const Icon(
              //   Icons.keyboard_arrow_right,
              //   size: 28,
              //   color: Colors.pink,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
