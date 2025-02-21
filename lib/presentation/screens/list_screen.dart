import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nba/presentation/screens/player_detail.dart';
import 'package:provider/provider.dart';
import 'package:nba/data/models/to/player_to.dart';
import 'package:nba/data/repositories/players_list_repository.dart';
import 'package:nba/presentation/widgets/player_list_item.dart';

Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 75,
    colors: true,
    printEmojis: true,
    printTime: false,
  ),
);

class ListScreenState extends ChangeNotifier {
  final listRepository = PlayersListRepository();
  final list = List<PlayerTO>.empty(growable: true);
  bool isLoading = true;
  bool isLoadingMore = false;
  String? error;

  Future<void> fetchInitData() async {
    list.clear();
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      final data = await listRepository.initLoadPlayers();
      list.addAll(data);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      error = e.toString();
      notifyListeners();
    }
  }

  Future<void> fetchMoreData() async {
    isLoadingMore = true;
    error = null;
    notifyListeners();
    try {
      final data = await listRepository.loadNexPage();
      list.addAll(data);
      isLoadingMore = false;
      notifyListeners();
    } catch (e) {
      isLoadingMore = false;
      error = e.toString();
      notifyListeners();
    }
  }
}

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final scrollController = ScrollController();
  late ListScreenState screenState;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(loadMore);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void loadMore() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      screenState.fetchMoreData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    screenState = ListScreenState();

    return ChangeNotifierProvider(
      create: (context) => screenState..fetchInitData(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.primary,
          title: const Text('NBA', style: TextStyle(color: Colors.white)),
        ),
        body: ListScreenContent(scrollController: scrollController),
      ),
    );
  }
}

class ListScreenContent extends StatelessWidget {
  const ListScreenContent({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    var contentState = context.watch<ListScreenState>();
    var list = contentState.list;
    var isLoading = contentState.isLoading;
    var isLoadingMore = contentState.isLoadingMore;
    var error = contentState.error;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (error != null) Text('Error: $error'),
          if (isLoading) 
            SizedBox(
              width: 200,
              height: 200,
              child: CircularProgressIndicator(),
            ),
          if (!isLoading)
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == list.length) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    final player = list[index];
                    return PlayerListItem(
                      key: Key(player.id?.toString() ?? ''),
                      name: '${player.firstName ?? ''} ${player.lastName ?? ''}',
                      imageUrl: 'https://randomuser.me/api/portraits/men/${player.jerseyNumber}.jpg',
                      team: player.team?.fullName ?? '',
                      onTap: () => 
                        //logger.d('Tapped on ${player.firstName} ${player.lastName}')
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PlayerDetail(playerId: player.id ?? 0)),
                        )
                      ,
                    );
                  }
                },
              ),
            ),
          if (isLoadingMore)
            LinearProgressIndicator(
              value: null,
              semanticsLabel: 'Linear progress indicator',
            ),
        ],
      ),
    );
  }
}