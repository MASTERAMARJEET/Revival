import 'package:demo/widgets/register_btn.dart';
import 'package:flutter/material.dart';

import '../event/event_model.dart';
import '../widgets/base_scaffold.dart';
import '../widgets/contact.dart';
import '../widgets/heading.dart';
import '../widgets/section.dart';

class DetailsPage extends StatelessWidget {
  final EventDetail eventDetail;
  DetailsPage(this.eventDetail);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 20.0,
                bottom: 40.0,
              ),
              child: ListView(
                children: <Widget>[
                  HeadingWidget(
                      eventDetail.name ?? "", eventDetail.shortDesc ?? ""),
                  SectionWidget("About:", eventDetail.about ?? []),
                  SectionWidget("Event Details:", eventDetail.details ?? []),
                  SectionWidget("Prizes:", eventDetail.prize ?? []),
                  SectionWidget("Judging Criteria:", eventDetail.judge ?? []),
                  SectionWidget("Eligibility Criteria:",
                      eventDetail.rules?.eligible ?? []),
                  SectionWidget("Participant’s Guidelines:",
                      eventDetail.rules?.guide ?? []),
                  SectionWidget(
                      "Submission details:", eventDetail.submission ?? []),
                  SectionWidget("Event timeline:", eventDetail.timeline ?? []),
                  ContactWidget("Contact Details", eventDetail.contact ?? []),
                ],
              )),
        ],
      ),
      floatingActionButton: RegisterBtn(eventDetail.register ?? ""),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
