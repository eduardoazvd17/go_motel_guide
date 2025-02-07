// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go/src/features/home/presentation/pages/widgets/slider_motel_suite_widget.dart';

import '../../home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _pageController;
  HomeController get _bloc => context.read<HomeController>();

  @override
  void initState() {
    _pageController = PageController();
    _bloc.getMotelList();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, size: 30),
        ),
        title: const TabButtonsWidget(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, size: 30),
          ),
        ],
      ),
      body: Container(
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 15),
              child: MyLocationButton(),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Container(
                  color: Colors.grey.shade50,
                  child: BlocBuilder<HomeController, HomeControllerState>(
                    builder: (context, state) {
                      if (state is HomeControllerLoadingState) {
                        return _loadingStateWidget();
                      }

                      if (state is HomeControllerErrorState) {
                        return _errorStateWidget(state.error.message);
                      }

                      return _successStateWidget(
                        (state as HomeControllerSuccessState),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _successStateWidget(HomeControllerSuccessState state) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 15),
      children: [
        SizedBox(
          height: 200,
          child: PageView(
            controller: _pageController,
            children: state.discountSuites.map((discountSuite) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SliderMotelSuiteWidget(
                  discountSuite: discountSuite,
                ),
              );
            }).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SliderIndicatorWidget(
            pageController: _pageController,
            totalPages: state.discountSuites.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            color: const Color.fromARGB(252, 252, 252, 255),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: FiltersBarWidget(),
                ),
                Divider(color: Colors.grey.shade200, height: 0),
                ...state.motelList.map((motel) => MotelWidget(motel: motel)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _loadingStateWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _errorStateWidget(String errorMessage) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Não foi possível obter dados',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: TextButton.icon(
              onPressed: _bloc.getMotelList,
              icon: Icon(Icons.refresh),
              label: const Text('Tentar novamente'),
            ),
          ),
        ],
      ),
    );
  }
}
