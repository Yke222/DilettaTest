import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:store_app/presentation/category/bloc/category_bloc.dart';
import 'package:store_app/presentation/category/widget/custom_card.dart';
import 'package:store_app/presentation/details/bloc/item_details_bloc.dart';
import 'package:store_app/routes/route_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CategoryBloc allCategoryBloc = Modular.get<CategoryBloc>();
  final ItemDetailsBloc itemDetailsBloc = Modular.get<ItemDetailsBloc>();
  @override
  void initState() {
    allCategoryBloc.add(GetAllCategoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: BlocBuilder<CategoryBloc, AllCategoryState>(
            bloc: allCategoryBloc,
            builder: (context, state) {
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Selecione a Categoria",
                      style: TextStyle(fontSize: 26, fontFamily: 'Pacifico'),
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: allCategoryBloc.state.getAllCategoryEntities?.length ?? 0,
                          itemBuilder: (context, i) {
                            return CustomCardCategory(
                              nameCategory: allCategoryBloc.state.getAllCategoryEntities?[i].nameCategory ?? "",
                              func: () async {
                                itemDetailsBloc.add(
                                  ValueCategory(
                                    valueCategory: allCategoryBloc.state.getAllCategoryEntities?[i].nameCategory ?? "",
                                  ),
                                );
                                Modular.to.navigate(AppRoutes.itemDetails);
                              },
                            );
                          })),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
