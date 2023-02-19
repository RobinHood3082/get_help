import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_help/models/counseling_post.dart';
import 'package:get_help/presentation/widgets/scaffold_wrapper.dart';
import 'package:google_fonts/google_fonts.dart';

class AllCounselingRequestsScreen extends StatelessWidget {
  const AllCounselingRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CounselingPost> posts = [
      CounselingPost(
        title: 'I need help',
        description: 'I need help with my studies',
        image:
            'https://lh3.googleusercontent.com/a/AEdFTp6SnJdpVZT8zGRK_xDxMqzBr8LV2_ewtPjDHPrU8Q=s96-c',
        isAnonymous: true,
        studentID: '1704090',
        studentName: 'John Doe',
      ),
      CounselingPost(
        title: 'I need help',
        description: 'I need help with my studies',
        image:
            'https://lh3.googleusercontent.com/a/AEdFTp6SnJdpVZT8zGRK_xDxMqzBr8LV2_ewtPjDHPrU8Q=s96-c',
        isAnonymous: false,
        studentID: '1704090',
        studentName: 'John Doe',
      ),
    ];
    return ScaffoldWrapper(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'All Requests',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {},
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(posts[index].title,
                              style: GoogleFonts.poppins()),
                          Text(posts[index].description,
                              style: GoogleFonts.poppins()),
                        ],
                      ),
                      Spacer(),
                      FaIcon(FontAwesomeIcons.circleChevronRight)
                    ],
                  )),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
