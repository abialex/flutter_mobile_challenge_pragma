import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/consts/app_const_gif.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/consts/app_const_image.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/router/go_router/app_routes_enum.dart';
import 'package:flutter_mobile_challenge_pragma/app/domain/models/cat_item_list_data_model.dart';
import 'package:go_router/go_router.dart';

class CatCard extends StatelessWidget {
  const CatCard({super.key, required this.catItem});
  final CatItemListDataModel catItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: catItem.id,
            child: Material(
              type: MaterialType.transparency,

              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    child:
                        catItem.image?.url != null
                            ? AspectRatio(
                              aspectRatio: catItem.image!.width / catItem.image!.height,
                              child: Image.network(
                                gaplessPlayback: true,
                                catItem.image!.url,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.error, size: 50, color: Colors.red);
                                },

                                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                                  final isLoaded = frame != null || wasSynchronouslyLoaded;

                                  return AnimatedSwitcher(
                                    duration: Duration(milliseconds: 500),
                                    child:
                                        isLoaded
                                            ? child
                                            : Center(
                                              child: Image.asset(
                                                AppConstGif.loading_cat,
                                                width: 200,
                                                height: 200,
                                                fit: BoxFit.contain,
                                              ),
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
                            Colors.black.withOpacity(0.45),
                            Colors.black.withOpacity(0.35),
                            Colors.black.withOpacity(0.25),
                            Colors.black.withOpacity(0.05),

                            Colors.transparent,
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
                        Text(
                          catItem.name,
                          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 2),
                        Row(
                          children: [
                            Icon(Icons.location_pin, color: Colors.white, size: 18),
                            SizedBox(width: 4),
                            Text(
                              catItem.origin,
                              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.watch_later, color: Colors.white, size: 18),
                            SizedBox(width: 4),
                            Text(
                              '${catItem.lifeSpan} años',
                              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Positioned(
                  //   right: 16,
                  //   bottom: 8,
                  //   child: Align(
                  //     alignment: Alignment.centerRight,
                  //     child: ElevatedButton(
                  //       onPressed: () {
                  //         context.pushNamed(AppRoutes.catDetail.name, extra: catItem);
                  //       },
                  //       style: ElevatedButton.styleFrom(
                  //         padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),

                  //         backgroundColor: Colors.purple.withAlpha(205),
                  //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  //       ),
                  //       child: const Icon(Icons.remove_red_eye, color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 4,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.pets, color: Colors.pink),
                              SizedBox(width: 8),
                              Text('Temperamento', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            ],
                          ),
                          Wrap(
                            spacing: 4,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            runAlignment: WrapAlignment.start,

                            children: List.generate(
                              catItem.temperamentList.length.clamp(0, 3),
                              (value) => Chip(
                                backgroundColor: Colors.white,
                                labelPadding: EdgeInsets.zero,
                                label: Text(
                                  catItem.temperamentList[value],
                                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.pushNamed(AppRoutes.catDetail.name, extra: catItem);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        backgroundColor: Colors.purple.withAlpha(205),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Row(
                        // spacing: 5,
                        children: [
                          // Text(
                          //   'Detalle',
                          //   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                          // ),
                          const Icon(Icons.remove_red_eye, color: Colors.white, size: 20),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildAttributeRow('Intelligence', catItem.intelligence, Colors.green, Icons.psychology),
                    _buildAttributeRow(
                      'Energy',
                      catItem.energyLevel,
                      Colors.yellow.shade700,
                      Icons.energy_savings_leaf_outlined,
                    ),
                    _buildAttributeRow('Afecto', catItem.strangerFriendly, Colors.red, Icons.favorite),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttributeRow(String label, int value, Color color, IconData icon) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          spacing: 2.5,
          children: [
            CircleAvatar(backgroundColor: color.withAlpha(100), child: Icon(icon, size: 25, color: color)),

            const SizedBox(width: 8),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),

            // Expanded(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const SizedBox(height: 4),
            //       LinearProgressIndicator(
            //         value: value / 5,
            //         color: color,
            //         backgroundColor: Colors.grey.shade300,
            //         minHeight: 6,
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(width: 8),
            Text('$value/5', style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
