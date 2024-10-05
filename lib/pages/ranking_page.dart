import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "RankingPage"
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              FutureBuilder(
                future: http.get(Uri.parse("http://10.0.2.2:5000/explore")),
                builder: (context, snapshot){
                  return Text(
                      snapshot.hasData ? snapshot.data!.body : 'Loading...',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  );
                }
              ),
              SizedBox(height: 20,),
              FutureBuilder(
                  future: http.get(Uri.parse("http://10.0.2.2:5000/test2")),
                  builder: (context, snapshot){
                    return Text(
                        snapshot.hasData ? snapshot.data!.body : 'Loading...',
                      style: TextStyle(
                        fontSize: 20
                      ),
                    );
                  }
              ),
            ],
          ),
        )
      ),
    );
  }
}
