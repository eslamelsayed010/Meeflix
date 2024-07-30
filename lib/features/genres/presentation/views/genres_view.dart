import 'package:flutter/material.dart';
import 'package:lomaTV/features/genres/data/models/genres_model.dart';
import 'package:lomaTV/features/genres/presentation/views/widgets/list_movie_genres_bloc_builder.dart';
import '../../../../core/utils/style/color_manager.dart';

class GenresListView extends StatefulWidget {
  const GenresListView({Key? key, required this.genreModel}) : super(key: key);
  final GenreModel genreModel;
  @override
  State<GenresListView> createState() => _GenresListViewState();
}

class _GenresListViewState extends State<GenresListView>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tabController =
        TabController(length: widget.genreModel.genres!.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: DefaultTabController(
        length: widget.genreModel.genres!.length,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              bottom: TabBar(
                controller: tabController,
                indicatorColor: ColorManager.red,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: ColorManager.lightGrey,
                isScrollable: true,
                physics: const BouncingScrollPhysics(),
                unselectedLabelStyle: const TextStyle(fontSize: 13),
                labelColor: ColorManager.red,
                tabs: widget.genreModel.genres!.map((e) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 16, top: 12),
                    child: Text(e.name!),
                  );
                }).toList(),
                padding: const EdgeInsets.only(bottom: 10),
              ),
            ),
          ),
          body: TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: widget.genreModel.genres!.map((e) {
              return ListMovieGenresBlocBuilder(id: e.id);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
