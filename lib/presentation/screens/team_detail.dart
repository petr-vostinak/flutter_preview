import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:nba/data/models/to/team_to.dart';
import 'package:nba/data/repositories/team_detail_repository.dart';
import 'package:nba/presentation/widgets/info_cell.dart';
import 'package:nba/presentation/widgets/section_header.dart';
import 'package:provider/provider.dart';

class TeamDetailState extends ChangeNotifier {
  final teamDetailRepository = TeamDetailRepository();
  bool isLoading = true;
  TeamTO? team;
  String? error;

  Future<void> getTeamDetail(int teamId) async {
    team = null;
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      team = await teamDetailRepository.getTeamDetail(teamId);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      error = e.toString();
      notifyListeners();
    }
  }
}

class TeamDetail extends StatefulWidget {
  const TeamDetail({
    super.key,
    required this.teamId
  });

  final int teamId;

  @override
  State<TeamDetail> createState() => _TeamDetailState(teamId: teamId);
}

class _TeamDetailState extends State<TeamDetail> {
  _TeamDetailState({
    required this.teamId
  });

  final int teamId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ChangeNotifierProvider(
      create: (context) => TeamDetailState()..getTeamDetail(teamId),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.primary,
          title: const Text('NBA', style: TextStyle(color: Colors.white)),
        ),
        body: TeamDetailContent()
      ),
    );
  }
}

class TeamDetailContent extends StatelessWidget {
  const TeamDetailContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var teamDetailState = Provider.of<TeamDetailState>(context);
    var team = teamDetailState.team;
    var isLoading = teamDetailState.isLoading;
    var error = teamDetailState.error;

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: AspectRatio(
                        aspectRatio: 1.5,
                        child: Gif(
                          image: AssetImage('assets/images/${team?.abbreviation?.toLowerCase()}.gif'),
                          fit: BoxFit.contain,
                        ),
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
                            title: 'City', 
                            value: team?.city ?? '---', 
                            onTap: null
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 1,
                          child: InfoCell(
                            title: 'Name', 
                            value: team?.name ?? '---', 
                            onTap: null
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 1,
                          child: InfoCell(
                            title: 'Abbreviation', 
                            value: team?.abbreviation ?? '---', 
                            onTap: null
                          ),
                        ),
                      ],
                    ),
                  ),
              
                  SectionHeader(title: 'Whereabouts'),
              
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InfoCell(
                            title: 'Division', 
                            value: team?.division ?? '---', 
                            onTap: null
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 1,
                          child: InfoCell(
                            title: 'Conference', 
                            value: team?.conference ?? '---', 
                            onTap: null
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ],
      )
    );
  }
}