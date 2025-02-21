import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nba/data/models/to/player_to.dart';
import 'package:nba/data/repositories/player_detail_repository.dart';
import 'package:nba/presentation/screens/team_detail.dart';
import 'package:nba/presentation/widgets/info_cell.dart';
import 'package:nba/presentation/widgets/section_header.dart';
import 'package:provider/provider.dart';

class PlayerDetailState extends ChangeNotifier {
  final playerDetailRepository = PlayerDetailRepository();
  bool isLoading = true;
  PlayerTO? player;
  String? error;

  Future<void> getPlayerDetail(int playerId) async {
    player = null;
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      player = await playerDetailRepository.getPlayerDetail(playerId);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      error = e.toString();
      notifyListeners();
    }
  }
}

class PlayerDetail extends StatefulWidget {
  const PlayerDetail({
    super.key,
    required this.playerId,
  });

  final int playerId;

  @override
  State<PlayerDetail> createState() => _PlayerDetailState(playerId: playerId);
}

class _PlayerDetailState extends State<PlayerDetail> {
  _PlayerDetailState({
    required this.playerId,
  });

  final int playerId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return ChangeNotifierProvider(
      create: (context) => PlayerDetailState()..getPlayerDetail(playerId),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.primary,
          title: const Text('NBA', style: TextStyle(color: Colors.white)),
        ),
        body: PlayerDetailContent(),
      ),
    );
  }
}

class PlayerDetailContent extends StatelessWidget {
  const PlayerDetailContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var contentState = context.watch<PlayerDetailState>();
    var player = contentState.player;
    var isLoading = contentState.isLoading;
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
              child: Column(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondaryContainer,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundColor: Colors.grey[200], // Pozadí, pokud obrázek není dostupný
                            child: ClipOval(
                              child: Image.network(
                                'https://randomuser.me/api/portraits/men/${player?.jerseyNumber}.jpg',
                                fit: BoxFit.cover,
                                width: 64,
                                height: 64,
                                errorBuilder: (context, error, stackTrace) {
                                  return SvgPicture.asset(
                                    'assets/images/ic_user_image_placeholder.svg',
                                    width: 64,
                                    height: 64,
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${player?.firstName ?? ''} ${player?.lastName ?? ''}',
                                  style: theme.textTheme.titleLarge,
                                ),
                                Text(
                                  '#${player?.jerseyNumber ?? '---'} | ${player?.position ?? '---'} | ${player?.country ?? '---'}',
                                  style: theme.textTheme.titleMedium,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
              
                  SectionHeader(title: 'Basic Info'),
              
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InfoCell(
                            title: 'Height', 
                            value: player?.height ?? '---', 
                            onTap: null
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 1,
                          child: InfoCell(
                            title: 'Weight', 
                            value: '${player?.weight ?? '---'} lbs', 
                            onTap: null
                          ),
                        ),
                      ],
                    ),
                  ),
              
                  SectionHeader(title: 'Team'),
              
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: InkWell(
                      splashColor: Colors.deepPurple.withAlpha(30),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TeamDetail(teamId: player?.team?.id ?? 0)),
                        ),
                      child: Material(
                        color: Colors.transparent,
                        child: InfoCell(
                          title: 'Team name', 
                          value: player?.team?.fullName ?? '---', 
                          onTap: () => {},
                        ),
                      ),
                    ),
                  ),
              
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InfoCell(
                            title: 'Conference', 
                            value: player?.team?.conference ?? '---', 
                            onTap: null
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 1,
                          child: InfoCell(
                            title: 'Division', 
                            value: player?.team?.division ?? '---', 
                            onTap: null
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 1,
                          child: InfoCell(
                            title: 'City', 
                            value: player?.team?.city ?? '---', 
                            onTap: null
                          ),
                        ),
                      ],
                    ),
                  ),
              
                  SectionHeader(title: 'Draft'),
              
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InfoCell(
                            title: 'Year', 
                            value: player?.draftYear.toString() ?? '---', 
                            onTap: null
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 1,
                          child: InfoCell(
                            title: 'Round', 
                            value: player?.draftRound.toString() ?? '---', 
                            onTap: null
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 1,
                          child: InfoCell(
                            title: 'Number', 
                            value: player?.draftNumber.toString() ?? '---', 
                            onTap: null
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              ),
            ),
        ]
      ),
    );
  }
}