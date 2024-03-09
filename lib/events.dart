import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Events extends StatefulWidget {
  const Events({super.key});

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
    const url = 'https://serpapi.com/search.json?engine=google_events&q=Events+in+Timisoara&hl=en&gl=us&api_key=7f7e1424f6982617431e7611888805511d4bc8cf153284386f3c9cecab6683f0';
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