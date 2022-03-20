import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/Models/upcoming_movies_response.dart';
import 'package:movieapp/Screens/MovieWatchList/moviewatchlistcomponents.dart';
import 'package:movieapp/Screens/MovieWatchList/moviewatchlistprovider.dart';
import 'package:movieapp/Screens/moviewatchdetailed/moviewatchdetailscreen.dart';
import 'package:movieapp/animations/slide_right.dart';
import 'package:movieapp/res/assets.dart';
import 'package:movieapp/res/colors.dart';
import 'package:movieapp/res/res.dart';
import 'package:movieapp/widgets/common_widgets.dart';
import 'package:provider/provider.dart';

class MovieWatchLaterScreen extends StatefulWidget {
  const MovieWatchLaterScreen({Key? key}) : super(key: key);

  @override
  State<MovieWatchLaterScreen> createState() => _MovieWatchLaterScreenState();
}

class _MovieWatchLaterScreenState extends State<MovieWatchLaterScreen> {
  TextEditingController? searchController;
  bool? typing;
  late MovieWatchListProvider movieWatchListProvider;

  @override
  void initState() {
    movieWatchListProvider =
        Provider.of<MovieWatchListProvider>(context, listen: false);
    movieWatchListProvider.init(context: context);
    typing = false;
    searchController = TextEditingController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
         appBar: AppBar(
            toolbarHeight: sizes.height * 0.09,
            title:
            // typing??false ?
            TextField(
              controller: searchController,
              maxLength: 50,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.name,
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontFamily: Assets.poppinsMedium,
                  fontSize: getFontRatio() * 15),
              decoration: typing ?? false
              ? InputDecoration(
                  filled: true,
                  fillColor: AppColors.lightGrey,
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.lightGrey),
                    borderRadius: BorderRadius.circular(sizes.width*0.07),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.lightGrey),
                    borderRadius: BorderRadius.circular(sizes.width*0.07),
                  ),

                  hintStyle: TextStyle(
                      color: AppColors.lightGrey.withOpacity(0.5),
                      fontFamily: Assets.poppinsMedium,
                      fontSize: getFontRatio() * 12),
                  counterText: "",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        typing = !typing!;
                      });
                    },
                    icon: Icon(
                      Icons.clear,
                      color: AppColors.textColor,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(bottom: getHeightRatio() * 0),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.textColor,
                  ))
              : InputDecoration(
                  filled: false,
                  hintStyle: TextStyle(
                      color: AppColors.textColor,
                      fontFamily: Assets.poppinsMedium,
                      fontSize: getFontRatio() * 12),
                  counterText: "",
                  hintText: "Watch",
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          typing = !typing!;
                        });
                      },
                      icon: Icon(
                        Icons.search,
                        color: AppColors.textColor,
                      )),
                  contentPadding: EdgeInsets.only(bottom: getHeightRatio() * 0),
                  border: InputBorder.none,
                ),
        ),
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
      ),
      body: Container(
        height: sizes.height,
        width: sizes.width,
        color: AppColors.lightGrey,
        child: Column(
          children: [
            SizedBox(height: sizes.height*0.012,),
            FutureBuilder<UpcomingMoviesResponse>(
                future: movieWatchListProvider.getUpcomingMoviesList(),
                builder:(
                  BuildContext context,
                  AsyncSnapshot<UpcomingMoviesResponse> snapshot,
                ){
                  if (snapshot.hasError) {
                    return Text(
                      snapshot.error.toString(),
                      style: const TextStyle(color: Colors.red),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Flexible(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (snapshot.data!.results!.isNotEmpty) {
                    return Flexible(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data?.results?.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: ()
                               {
                                 Navigator.push(
                                     context,
                                     SlideRightRoute(
                                         page: MovieWatchDetailScreen(
                                           movieId: snapshot.data?.results?[index].id,
                                           posterPath: snapshot.data?.results?[index].posterPath
                                         )));

                               },
                              child: MovieWatchListComponents.movieCard(
                                  snapshot.data?.results?[index].posterPath,
                                  snapshot.data?.results?[index].originalTitle


                              ),
                            );
                          }),
                    );
                  }
                  else {
                    return Flexible(
                        child: Center(
                            child: CommonWidgets.customText(
                                text: "No Upcoming Movie Found!",
                                lines: 2,
                                fontWeight: FontWeight.bold,
                                fontSize: getHeightRatio() * 20,
                                fontFamily: Assets.poppinsMedium,
                                color: AppColors.darkBlue,
                                alignment: TextAlign.center)));
                  }
                }),

          ],
        ),
      ),
    ));
  }

}
