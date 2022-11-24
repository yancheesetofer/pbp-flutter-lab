import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/drawer.dart';
import 'addMyWatchlist.dart';

class MoviePage extends StatelessWidget {
  const MoviePage(
      {super.key,
      required this.data,
      required this.addData,
      required this.watched,
      required this.title,
      required this.rating,
      required this.releaseDate,
      required this.review});

  final List<Budget> data;
  final Function(Budget) addData;
  final bool watched;
  final String title;
  final int rating;
  final DateTime releaseDate;
  final String review;

  @override
  Widget build(BuildContext context) {
    var date = releaseDate.toString().substring(0, 10);
    var ratingStr = rating.toString();
    var watchedStr;
    if (watched) {
      watchedStr = 'watched';
    } else {
      watchedStr = 'not watched';
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
        ),

        // Menambahkan drawer menu
        drawer: PublicDrawer(
          data: data,
          addData: addData,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            Container(
                child: Align(
              alignment: Alignment.center,
              child: Text(title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34)),
            )),
            const SizedBox(height: 20.0),
            Row(children: [
              Text(
                'Release Date: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(date),
            ]),
            const SizedBox(height: 20.0),
            Row(children: [
              Text(
                'Rating: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('$rating/5'),
            ]),
            const SizedBox(height: 20.0),
            Row(children: [
              Text(
                'Release Date: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(watchedStr),
            ]),
            const SizedBox(height: 20.0),
            Text('Review:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(review),
            Spacer(),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: (() {
                        Navigator.pop(context);
                      }),
                      child: Text(
                        'Back',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                    ))),
          ],
        ));
  }
}

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage(
      {Key? key, required this.data, required this.addData})
      : super(key: key);
  final List<Budget> data;
  final Function(Budget) addData;

  @override
  _MyWatchlistPageState createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  late final Future finalFuture;
  @override
  void initState() {
    super.initState();
    finalFuture = addMyWatchlist();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Watchlist'),
        ),

        // Menambahkan drawer menu
        drawer: PublicDrawer(
          data: widget.data,
          addData: widget.addData,
        ),
        body: FutureBuilder(
            future: finalFuture,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada to do list :(",
                        style:
                            TextStyle(color: Color.fromARGB(255, 31, 85, 120), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MoviePage(
                                      data: widget.data,
                                      addData: widget.addData,
                                      watched:
                                          snapshot.data![index].fields.watched,
                                      title: snapshot.data![index].fields.title,
                                      rating:
                                          snapshot.data![index].fields.rating,
                                      releaseDate: snapshot
                                          .data![index].fields.releaseDate,
                                      review:
                                          snapshot.data![index].fields.review,
                                    )));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: snapshot.data![index].fields.watched
                                        ? Colors.blue
                                        : Colors.red,
                                    width: 2.5),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${snapshot.data![index].fields.title}",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: CheckboxListTile(
                                          value: snapshot
                                              .data![index].fields.watched,
                                          onChanged: (newVal) {
                                            setState(() {
                                              snapshot.data![index].fields
                                                      .watched =
                                                  !snapshot.data![index].fields
                                                      .watched;
                                              // watched = !watched;
                                            });
                                          }),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )));
                }
              }
            }));
  }
}