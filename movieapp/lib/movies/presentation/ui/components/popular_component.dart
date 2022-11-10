import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/network/api_consts.dart';
import 'package:movieapp/core/utils/enums.dart';
import 'package:movieapp/movies/presentation/controller/movie_bloc.dart';
import 'package:movieapp/movies/presentation/controller/movie_state.dart';
import 'package:shimmer/shimmer.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
        buildWhen: (previous, current) =>
            previous.popularDataState != current.popularDataState,
        builder: (context, state) {
          print('popular Bloc');
          switch (state.nowPlayingDataState) {
            case RequestApiDataState.dataLoading:
              return const SizedBox(
                height: 170,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                ),
              );
            case RequestApiDataState.dataLoaded:
              return FadeIn(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: 170.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: state.popularMovies.length,
                    itemBuilder: (context, index) {
                      final movie = state.popularMovies[index];
                      return Container(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                          onTap: () {
                            /// TODO : NAVIGATE TO  MOVIE DETAILS
                          },
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            child: CachedNetworkImage(
                              width: 120.0,
                              fit: BoxFit.cover,
                              imageUrl: ApiConst.imageUrl(movie.movieImage),
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[800]!,
                                child: Container(
                                  height: 170.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            case RequestApiDataState.dataError:
              return const SizedBox(
                height: 170,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ),
              );
          }
        });
  }
}
