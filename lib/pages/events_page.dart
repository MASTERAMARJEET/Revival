import 'package:flutter/material.dart';

import './details_page.dart';
import '../event/event_model.dart';
import '../event/event_services.dart';
import '../widgets/base_scaffold.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  List<EventDetail> _events = [];
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    loadEventList('assets/data/event_details.json').then(
      (value) => setState(
        () {
          _events = value;
          _loaded = true;
        },
      ),
    );
  }

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
              bottom: 45.0,
            ),
            child: _loaded
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
                      crossAxisCount: 2,
                    ),
                    itemCount: _events.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(_events[index]),
                          ),
                        ).then((value) => null),
                        child: Card(
                          color: Color.fromRGBO(122, 204, 252, 1),
                          child: Center(
                            child: Text(
                              _events[index].name?.toUpperCase() ?? "NONE",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
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
