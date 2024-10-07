import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:store_app/presentation/details/bloc/item_details_bloc.dart';
import 'package:store_app/presentation/details/widget/custom_card.dart';
import 'package:store_app/presentation/details/widget/description_card.dart';
import 'package:store_app/routes/route_app.dart';

class ItemDetailsPage extends StatefulWidget {
  const ItemDetailsPage({super.key});

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  final ItemDetailsBloc itemDetailsBloc = Modular.get<ItemDetailsBloc>();

  @override
  void initState() {
    super.initState();
    itemDetailsBloc.add(ItemDetailsEv(category: itemDetailsBloc.state.valueCategory ?? ""));
    itemDetailsBloc.add(LoadFavoritesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Modular.to.navigate(AppRoutes.base);
              },
            ),
            automaticallyImplyLeading: false,
            title: const Text(
              "Item Details",
              style: TextStyle(fontSize: 26, fontFamily: 'Pacifico'),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'All Items'),
                Tab(text: 'Favorites'),
              ],
            ),
          ),
          body: BlocBuilder<ItemDetailsBloc, ItemDetailsState>(
            bloc: itemDetailsBloc,
            builder: (context, state) {
              switch (state.status) {
                case GetItemDetailsStatus.sucess:
                  return TabBarView(
                    children: [
                      CustomScrollView(
                        slivers: [
                          SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                              (ctx, index) {
                                final item = state.getItemDetailsEntities?[index];
                                final isFavorite = state.favoriteItems.contains(item?.id.toString());

                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomCardItemDetailsCategory(
                                      image: item?.image ?? "",
                                      nameProduct: item?.title ?? "",
                                      isFavorite: isFavorite,
                                      func: () {
                                        Modular.to.push(
                                          MaterialPageRoute(
                                              builder: (context) => DescriptionCard(
                                                    index: index,
                                                  )),
                                        );
                                      },
                                      onFavoriteToggle: () {
                                        itemDetailsBloc.add(ToggleFavoriteEvent(
                                          itemId: item?.id.toString() ?? '',
                                        ));
                                      },
                                    ));
                              },
                              childCount: state.getItemDetailsEntities?.length ?? 0,
                            ),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                          ),
                        ],
                      ),
                      CustomScrollView(
                        slivers: [
                          SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                              (ctx, index) {
                                final itemId = state.favoriteItems[index];
                                final item = state.getItemDetailsEntities
                                    ?.firstWhere((element) => element.id.toString() == itemId);

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomCardItemDetailsCategory(
                                    image: item?.image ?? "",
                                    nameProduct: item?.title ?? "",
                                    isFavorite: true,
                                    func: () {},
                                    onFavoriteToggle: () {
                                      itemDetailsBloc.add(ToggleFavoriteEvent(
                                        itemId: itemId,
                                      ));
                                    },
                                  ),
                                );
                              },
                              childCount: state.favoriteItems.length,
                            ),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                case GetItemDetailsStatus.loading:
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.purple,
                    ),
                  );

                default:
                  return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
