import 'package:flutter/material.dart';

import './event/event_model.dart';

class DetailsPage extends StatelessWidget {
  final EventDetail eventDetail;
  DetailsPage(this.eventDetail);
  @override
  Widget build(BuildContext context) {
    Widget sectionWidget(String title, List<String> list) {
      if (list.length == 0) {
        return Container();
      }
      return Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 8.0,
          ),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              children: list.map((e) => TextSpan(text: e + '\n\n')).toList(),
            ),
          ),
        ),
      ]);
    }

    Widget headingWidget(String name, String desc) {
      return Column(
        children: [
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      );
    }

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
                  headingWidget(
                      eventDetail.name ?? "", eventDetail.shortDesc ?? ""),
                  sectionWidget("About:", eventDetail.about ?? []),
                  sectionWidget("Event Details:", eventDetail.details ?? []),
                  sectionWidget("Prizes:", eventDetail.prize ?? []),
                  sectionWidget("Judging Criteria:", eventDetail.judge ?? []),
                  sectionWidget("Eligibility Criteria:",
                      eventDetail.rules?.eligible ?? []),
                  sectionWidget("Participant’s Guidelines:",
                      eventDetail.rules?.guide ?? []),
                  sectionWidget(
                      "Submission details:", eventDetail.submission ?? []),
                  sectionWidget("Event timeline:", eventDetail.timeline ?? []),
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
