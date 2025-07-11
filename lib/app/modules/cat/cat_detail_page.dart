import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/consts/app_const_image.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/app_base_page.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/card_widget.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/characteristics_level_widget.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/additional_resources_widget.dart';
import 'package:flutter_mobile_challenge_pragma/app/domain/models/cat_item_list_data_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/consts/app_const_colors.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/app_const_text.dart';

class CatDetailPage extends StatelessWidget {
  const CatDetailPage({super.key, required this.catDetail});
  final CatItemListDataModel catDetail;

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      title: 'Cat Detail',
      bodyWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: catDetail.id,

            child: Material(
              type: MaterialType.transparency,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    child:
                        catDetail.image?.url != null
                            ? AspectRatio(
                              aspectRatio: catDetail.image!.width / catDetail.image!.height,
                              child: Image.network(
                                gaplessPlayback: true,
                                catDetail.image!.url,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.error, size: 50, color: AppConstColors.red);
                                },

                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes != null
                                              ? loadingProgress.cumulativeBytesLoaded /
                                                  (loadingProgress.expectedTotalBytes ?? 1)
                                              : null,
                                    ),
                                  );
                                },
                              ),
                            )
                            : AspectRatio(
                              aspectRatio: 1.25,
                              child: Image.asset(AppConstImage.cat_404, fit: BoxFit.cover, gaplessPlayback: true),
                            ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            AppConstColors.black.withAlpha((0.45 * 255).round()),
                            AppConstColors.black.withAlpha((0.35 * 255).round()),
                            AppConstColors.black.withAlpha((0.25 * 255).round()),
                            AppConstColors.black.withAlpha((0.05 * 255).round()),

                            AppConstColors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    bottom: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppConstText.extraLargeText(
                          text: catDetail.name,
                          color: AppConstColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 2),
                        Row(
                          children: [
                            Icon(Icons.location_pin, color: AppConstColors.white, size: 18),
                            SizedBox(width: 4),
                            AppConstText.smallText(
                              text: catDetail.origin,
                              color: AppConstColors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.watch_later, color: AppConstColors.white, size: 18),
                            SizedBox(width: 4),
                            AppConstText.smallText(
                              text: '${catDetail.lifeSpan} años',
                              color: AppConstColors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                spacing: 15,
                children: [
                  CardWidget(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,

                      children: [
                        AppConstText.largeText(
                          text: 'Description:',
                          color: AppConstColors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 8),
                        AppConstText.miniText(
                          text: catDetail.description,
                          color: AppConstColors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),

                  GridView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 3 / 2,
                    ),
                    children: [
                      _buildCaracteristica(
                        color: AppConstColors.yellow700,
                        description: '${catDetail.weight.imperial} lbs',
                        icon: Icon(Icons.monitor_weight, color: AppConstColors.white, size: 25),
                        text: 'Weight',
                      ),
                      _buildCaracteristica(
                        color: AppConstColors.green,

                        description: '${catDetail.lifeSpan} years',
                        icon: Icon(Icons.timer_sharp, color: AppConstColors.white, size: 25),
                        text: 'Life span',
                      ),
                      _buildCaracteristica(
                        color: AppConstColors.red,

                        description: catDetail.indoor == 1 ? 'Yes' : 'No',
                        icon: Icon(Icons.home, color: AppConstColors.white, size: 25),
                        text: 'Homelike',
                      ),
                      _buildCaracteristica(
                        color: AppConstColors.blue,

                        description: catDetail.suppressedTail == 1 ? 'Yes' : 'No',
                        icon: Icon(FontAwesomeIcons.scissors, color: AppConstColors.white, size: 20),
                        text: 'Suppressed tail',
                      ),
                    ],
                  ),
                  CardWidget(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,

                      children: [
                        AppConstText.largeText(
                          text: 'Temperamento',
                          color: AppConstColors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 8),
                        Wrap(
                          spacing: 4,
                          children: List.generate(
                            catDetail.temperamentList.length,
                            (value) => Chip(
                              backgroundColor: AppConstColors.white,
                              labelPadding: EdgeInsets.zero,
                              label: AppConstText.miniText(
                                text: catDetail.temperamentList[value],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CardWidget(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppConstText.titleMedium(text: "Personality trait", fontWeight: FontWeight.bold),
                        SizedBox(height: 12),
                        CharacteristicsLevelWidget(
                          label: 'Affection',
                          color: AppConstColors.red,
                          level: catDetail.affectionLevel,
                        ),
                        CharacteristicsLevelWidget(
                          label: 'Intelligence',
                          color: AppConstColors.green,
                          level: catDetail.intelligence,
                        ),
                        CharacteristicsLevelWidget(
                          label: 'Child friendly',
                          color: AppConstColors.yellow700,
                          level: catDetail.childFriendly,
                        ),
                        CharacteristicsLevelWidget(
                          label: 'Dog friendly',
                          color: AppConstColors.brown,
                          level: catDetail.dogFriendly,
                        ),
                        CharacteristicsLevelWidget(
                          label: 'Adaptability',
                          color: AppConstColors.blue,
                          level: catDetail.dogFriendly,
                        ),
                      ],
                    ),
                  ),
                  CardWidget(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppConstText.titleMedium(text: "Health and Care", fontWeight: FontWeight.bold),
                        SizedBox(height: 12),
                        if (catDetail.cfaUrl != null)
                          AdditionalResourcesWidget(
                            icon: Icons.emoji_events, // Trofeo
                            title: "CFA",
                            subtitle: "Official information",
                            color: AppConstColors.blue,
                            url: catDetail.cfaUrl!,
                          ),

                        if (catDetail.vetstreetUrl != null)
                          AdditionalResourcesWidget(
                            icon: Icons.medical_services, // Icono de salud
                            title: "VetStreet",
                            subtitle: "Veterinary care",
                            color: AppConstColors.green,
                            url: catDetail.vetstreetUrl!,
                          ),
                        if (catDetail.vcaHospitalsUrl != null)
                          AdditionalResourcesWidget(
                            icon: Icons.local_hospital, // Icono de hospital
                            title: "VCA Hospitals",
                            subtitle: "Health guide",
                            color: AppConstColors.primaryPurple,
                            url: catDetail.vcaHospitalsUrl!,
                          ),
                        if (catDetail.wikipediaUrl != null)
                          AdditionalResourcesWidget(
                            icon: Icons.menu_book, // Libro para Wikipedia
                            title: "Wikipedia",
                            subtitle: "History and data",
                            color: AppConstColors.orange,
                            url: catDetail.wikipediaUrl!,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCaracteristica({
    required Widget icon,
    required String text,
    required String description,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: AppConstColors.white),
      child: Center(
        child: Column(
          spacing: 4,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(backgroundColor: color, child: icon),
            AppConstText.mediumText(text: text, fontWeight: FontWeight.bold),
            AppConstText.smallText(text: description),
          ],
        ),
      ),
    );
  }
}
