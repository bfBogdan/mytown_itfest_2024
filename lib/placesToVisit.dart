import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PlacesToVisit extends StatefulWidget {
  const PlacesToVisit({Key? key}) : super(key: key);

  @override
  State<PlacesToVisit> createState() => _PlacesToVisitState();
}

class _PlacesToVisitState extends State<PlacesToVisit> {
  List<dynamic> placesToVisitResults = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    placesToVisit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('placesToVisit'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: placesToVisitResults.length,
              itemBuilder: (context, index) {
                final places = placesToVisitResults[index];
                final title = places['title'];
                final description = places['description'];
                final rating = places['rating'];
                final image = places['thumbnail'];
                return Center(
                  child: ListTile(
                    leading: Image.network(image),
                    title: Text(title.toString()),
                    subtitle: Text(description.toString()),
                  ),
                );
              },
            ),
    );
  }

  void placesToVisit() async {
    print('placesToVisit called');
    const url =
        'https://serpapi.com/search.json?engine=google_local&q=Places+to+visit&location=Timisoara,+Timis,+Romania&hl=ro&api_key=7f7e1424f6982617431e7611888805511d4bc8cf153284386f3c9cecab6683f0';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    //nu schimba in CamelCase ca bubuie codu
    final Json = await json.decode(response.body);
    setState(() {
      placesToVisitResults = Json['local_results'];
      isLoading = false;
    });
    print('placesToVisit completed');
  }
}
