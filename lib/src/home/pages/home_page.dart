import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '/../core/core.dart';
import '../../../ui/theme/colors.dart';
import '../../../ui/widget/widget.dart';
import '../home.dart';
import 'widget/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = GetIt.I.get<HomeCubit>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _init();
      },
    );
    super.initState();
  }

  void _init() {
    _controller.fetchListStarships();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: _controller,
      listener: (context, state) {},
      builder: (context, state) {
        return AppLoading(
          loading: state.fetchListStarshipsStatus.isLoading,
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Row(
                        children: [
                          Text(
                            'Olá',
                            style: context.textTheme.displaySmall,
                          ),
                          const Spacer(),
                          Badge.count(
                            count: 10,
                            backgroundColor: AppColors.accent,
                            child: const Icon(
                              Icons.favorite_border,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: state.listStarshipsStatus.length,
                        (_, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4.0,
                            ),
                            child: StarshipItemWidget(
                              title: state.listStarshipsStatus[index].name,
                              description:
                                  state.listStarshipsStatus[index].model,
                              onTapAddToList: () {},
                              onTap: () => DetailsItemBottomSheet.show(
                                context: context,
                                starShipEntity:
                                    state.listStarshipsStatus[index],
                                onTapAddToList: () {},
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class StarshipItemWidget extends StatelessWidget {
  const StarshipItemWidget({
    required this.title,
    required this.description,
    required this.onTap,
    required this.onTapAddToList,
    super.key,
  });

  final String title;
  final String description;
  final VoidCallback onTap;
  final VoidCallback onTapAddToList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.bodySmall,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                description,
                style: context.textTheme.bodySmall,
              ),
              const SizedBox(
                height: 8,
              ),
              Align(
                child: TextButton.icon(
                  onPressed: onTapAddToList,
                  label: const Text('Adicionar a lista de desejos'),
                  icon: const Icon(Icons.add),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
