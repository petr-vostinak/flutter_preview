import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlayerListItem extends StatelessWidget {
  const PlayerListItem({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.team,
    required this.onTap,
  }) : super(key: key);

  final String name;
  final String imageUrl;
  final String team;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Card(
        child: InkWell(
          splashColor: Colors.deepPurple.withAlpha(30),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.grey[200], // Pozadí, pokud obrázek není dostupný
                  child: ClipOval(
                    child: Image.network(
                      imageUrl,
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
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        team,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}