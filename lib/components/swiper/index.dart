import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_template/components/image/index.dart';
import 'package:flutter_template/globalConfig.dart';
import 'package:flutter_template/interface/index.dart';
import 'package:flutter_template/routers.dart';

class ComponentSwiper extends StatelessWidget {
  const ComponentSwiper({Key key, this.imgs}) : super(key: key);
  final List<IBanner> imgs;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: GlobalConfig.theme),
      child: Swiper(
        itemCount: imgs.length,
        pagination: SwiperPagination(),
        itemBuilder: (_, index) => GestureDetector(
            onTap: () {
              var _router = imgs[index].router;
              if (_router.isEmpty) return;
              Routers.jump(context, _router);
            },
            child: ComponentCacheImage(imageUrl: imgs[index].img)),
      ),
    );
  }
}
