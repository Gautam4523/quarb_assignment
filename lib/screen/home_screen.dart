import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quarb/screen/search_screen.dart';
import '../common_utils/common_utils.dart';
import '../controller/movie_controller.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieController movieController = Get.put(MovieController());

  @override
  void initState() {
    super.initState();
    movieController.fetchMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text("Movie"),
            actions: [
              Obx(() => Visibility(
                    visible: movieController.isSearching,
                    child: Search(
                        width: 200,
                        hintText: 'Movie name',
                        searchText: (searchText) {
                          if (searchText.isNotEmpty) {
                            movieController.fetchMovie(searchText: searchText);
                          } else {
                            movieController.fetchMovie();
                          }
                        }),
                  ))
            ],
          ),
          body: movieController.isLoading
              ? Center(child: CircularProgressIndicator())
              : movieController.movie.isNotEmpty
                  ? GridView.builder(
                      padding: EdgeInsets.all(10),
                      itemCount: movieController.movie.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisExtent: 500),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                    movie: movieController.movie[index].show!),
                              ));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                height: 400,
                                width: 400,
                                child: NetworkImageWidget(
                                    imageUrl:
                                        "${movieController.movie[index].show?.image?.medium}"),
                              ),
                              Text(
                                  '${movieController.movie[index].show?.name}'),
                              Text(
                                '${movieController.movie[index].show?.summary}' ??
                                    'No summary available',
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Center(child: Text('No record found')),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: IconButton(
                      onPressed: () {
                        movieController.setSearching(false);
                      },
                      icon: Icon(Icons.home)),
                  label: 'Home'),
              BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    movieController.setSearching(true);
                  },
                  icon: Icon(Icons.search),
                ),
                label: 'Search',
              ),
            ],
            onTap: (index) {
              if (index == 1) {
                movieController.setSearching(true);
              } else {
                movieController.setSearching(false);
              }
            },
          ),
        ));
  }
}
