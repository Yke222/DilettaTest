import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:store_app/presentation/details/bloc/item_details_bloc.dart';
import 'package:store_app/routes/route_app.dart';

class DescriptionCard extends StatefulWidget {
  final int index;
  const DescriptionCard({super.key, required this.index});

  @override
  State<DescriptionCard> createState() => _DescriptionCardState();
}

class _DescriptionCardState extends State<DescriptionCard> {
  final ItemDetailsBloc itemDetailsBloc = Modular.get<ItemDetailsBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ItemDetailsBloc, ItemDetailsState>(
            bloc: itemDetailsBloc,
            builder: (context, state) {
              switch (state.status) {
                case GetItemDetailsStatus.sucess:
                  return Column(
                    children: [
                      Container(
                        height: 300,
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50, left: 0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  GestureDetector(
                                      onTap: () {
                                        Modular.to.pushNamed(AppRoutes.itemDetails);
                                      },
                                      child: const Icon(Icons.arrow_back_ios)),
                                  Text(
                                    state.status.name,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 200,
                                width: 200,
                                child: CachedNetworkImage(
                                  height: 160,
                                  width: 160,
                                  placeholder: (context, url) => Container(
                                    height: 150,
                                    width: 150,
                                    color: Colors.transparent,
                                  ),
                                  imageUrl: state.getItemDetailsEntities?[widget.index].image ?? "",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              topRight: Radius.circular(50.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(0, -2),
                              ),
                            ],
                          ),
                          child: DefaultTabController(
                            length: 4,
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView(
                                    children: [
                                      ListTile(
                                        title: Text('Title: ${state.getItemDetailsEntities?[widget.index].title}'),
                                      ),
                                      ListTile(
                                        title: Text('Price: ${state.getItemDetailsEntities?[widget.index].price}'),
                                      ),
                                      ListTile(
                                        title:
                                            Text('Category: ${state.getItemDetailsEntities?[widget.index].category}'),
                                      ),
                                      ListTile(
                                        title: Text(
                                            'Description: ${state.getItemDetailsEntities?[widget.index].description}'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
            }));
  }
}
