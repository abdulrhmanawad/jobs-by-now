import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomCard extends StatelessWidget {
final String company_name;
final String created_at;
final String Job_name;
final String Job_breif;
final String education;
final String experience;
CustomCard({this.company_name,this.education,this.created_at,this.experience,this.Job_breif,this.Job_name});
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final textTheme=Theme.of(context).textTheme;
    return Material(
      elevation: 5.0,
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal:8),
        padding:EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ann Martin",//This company_name
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .fontSize,
                              fontWeight: FontWeight.w500)),
                    ),
                    Text(
                      "2021-05-08 11:06:15",//this created_at
                      style: GoogleFonts.montserrat(
                          fontSize: textTheme.overline.fontSize,
                          fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap:(){},
                      child: SvgPicture.asset("assets/icons/save.svg",width:size.width * .06,
                        height:size.width * .06,),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Flutter Developer",//this Job_name
                  style: GoogleFonts.montserrat(
                      fontSize: textTheme.subtitle1.fontSize),
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of industry Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                  maxLines: 3,
                  style: GoogleFonts.montserrat(
                      fontSize: textTheme.bodyText2.fontSize,
                      fontWeight: FontWeight.w200),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  "assets/icons/exp.svg",
                  width:size.width * .05,
                  height: size.width * .06,
                ),
                Column(
                  children: [
                    Text("Education",
                        style: GoogleFonts.montserrat(
                            fontSize: textTheme.caption.fontSize,
                            fontWeight: FontWeight.w500)),
                    Text("Computer Science",//This education
                        style: GoogleFonts.montserrat(
                            fontSize: textTheme.caption.fontSize,
                            fontWeight: FontWeight.w300))
                  ],
                ),
                SvgPicture.asset(
                  "assets/icons/edu.svg",
                  width: size.width * .05,
                  height: size.width * .05,
                ),
                Column(
                  children: [
                    Text("Experience",
                        style: GoogleFonts.montserrat(
                            fontSize: textTheme.caption.fontSize,
                            fontWeight: FontWeight.w500)),
                    Text("2-3 years",//this Experience years
                        style: GoogleFonts.montserrat(
                            fontSize: textTheme.caption.fontSize,
                            fontWeight: FontWeight.w300))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
