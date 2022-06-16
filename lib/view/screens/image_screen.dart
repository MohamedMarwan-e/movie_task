import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:movie_task/core/helper/colors.dart';
import 'package:movie_task/view/widgets/custom_text.dart';
import 'package:photo_view/photo_view.dart';


class ImageDetailScreen extends StatelessWidget {
  final String? image;
  const ImageDetailScreen({Key? key,required this.image,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: image != null ?
      Container(child: _buildFullscreenImage(image!, context)) : const SizedBox(),
    );
  }


  Widget _buildFullscreenImage(String image, BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: Stack(
          children: [
            PhotoView(
              imageProvider: NetworkImage(image),
              backgroundDecoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                        CupertinoIcons.clear_circled_solid,
                        color: MyColors.primary
                    )
                )
            ),
            Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () async{
                      await GallerySaver.saveImage(image);
                       ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: CustomText(text: "Downloaded to Gallery!",)
                            )
                       );
                    },
                    icon: Icon(
                        Icons.save_alt,
                        color: MyColors.primary
                    )
                )
            ),
          ],
        ),
        //   content: buildImage(image)
      ),
    );
  }


}
