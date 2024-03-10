import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Events extends StatefulWidget {
  String city;
  Events({super.key, required this.city});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List<dynamic> eventsResults=[];

  @override
  void initState(){
    super.initState();

    liveEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('events'),
        ),
        body: ListView.builder(
          itemCount: eventsResults.length,
          itemBuilder: (context, index) {
            final event = eventsResults[index];
            final title = event['title'];
            final image = event['thumbnail'];
            final link = event['link'];
            return ListTile(
              leading: CircleAvatar(
                child: Image.network(image)
                ),
              title: Text(title.toString()),
              subtitle: Text(link),
            );
          },
        ),
    );
  }

  void liveEvents() async {
    print('events called');
    var url = 'https://serpapi.com/search.json?engine=google_events&q=Events+in+'+ widget.city +'&hl=en&gl=us&api_key=fd47a1058ed9175aa8539692a9ce77d94bd5e810b91b7c9b47e309fa3529d08b';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    //nu schimba in CamelCase ca bubuie codu
    final Json = await json.decode(response.body);
    setState(() {
      eventsResults = Json['events_results'];
    });
    print('events completed');
  }
}