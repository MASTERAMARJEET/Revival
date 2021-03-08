import 'package:flutter/material.dart';

import './event/event_model.dart';
import './widgets/contact.dart';
import './widgets/heading.dart';
import './widgets/section.dart';

class DetailsPage extends StatelessWidget {
  final EventDetail eventDetail;
  DetailsPage(this.eventDetail);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/images/logo.png',
            scale: 2,
            fit: BoxFit.contain,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.cyan[100],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.cyan[200],
              ),
              child: Image.asset('assets/images/logo.png'),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Events'),
              onTap: () => Navigator.popAndPushNamed(context, '/events'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('About Us'),
              onTap: () => Navigator.popAndPushNamed(context, '/about'),
            ),
            ListTile(
              enabled: false,
              leading: Icon(Icons.event_note),
              title: Text('Schedule'),
            ),
            ListTile(
              enabled: false,
              leading: Icon(Icons.question_answer),
              title: Text('FAQ'),
            ),
          ],
        ),
      ),
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
                bottom: 45.0,
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
          Positioned(
            right: 40.0,
            bottom: 20.0,
            child: Image.asset(
              'assets/images/slashdot.png',
              height: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
