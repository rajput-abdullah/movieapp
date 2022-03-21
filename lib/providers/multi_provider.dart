
import 'package:movieapp/Screens/MovieWatchDetail/moviedetailprovider.dart';
import 'package:movieapp/Screens/MovieWatchList/moviewatchlistprovider.dart';
import 'package:provider/provider.dart';

final multiProviders = [
  ChangeNotifierProvider<MovieWatchListProvider>(
    create: (_) => MovieWatchListProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<MovieWatchDetailProvider>(
    create: (_) => MovieWatchDetailProvider(),
    lazy: true,
  )

];
