import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logistics_now/core/constants/app_assets_path.dart';
import 'package:logistics_now/presentation/cubit/home_cubit.dart';
import 'package:logistics_now/core/widgets/custom_search_bar.dart';
import 'package:logistics_now/presentation/widgets/info_widget.dart';
import 'package:logistics_now/presentation/widgets/no_result_found.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  final HomeCubit _homeCubit = HomeCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeCubit,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset(AppAssetsPath.logisticsNowIcon,
                  height: 100, width: 200),
              CustomSearchBar(
                outsidePadding: 0,
                onChanged: (value) {
                  _homeCubit.searchingLocationData(value);
                },
                searchController: _searchTextEditingController,
                hint: "Search location",
              ),
              BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
                if (_searchTextEditingController.value.text.isEmpty) {
                  return const SizedBox.shrink();
                }
                if (_searchTextEditingController.value.text.length <= 2) {
                  return const InfoWidget(
                      textTitle: "Type more than 2 character to search");
                }
                if (state is HomeLoading) {
                  return const Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }

                if (_homeCubit.locationValue.value?.isEmpty ?? true) {
                  return const NoResultFound();
                }

                return _locationItemWidget();
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget _locationItemWidget() {
    return Expanded(
      child: ListView.builder(
        itemCount: _homeCubit.locationValue.value?.length ?? 0,
        padding: const EdgeInsets.only(top: 24.0),
        itemBuilder: (context, index) {
          var item = _homeCubit.locationValue.value?[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            color: Colors.grey[50],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text("${item?.locationName}"),
                  subtitle: Text(
                    'District: ${item?.location?.district}, State: ${item?.location?.state}',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Coordinates: ${item?.location?.lat}, ${item?.location?.lon}',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
