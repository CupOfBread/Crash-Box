import 'package:bruno/bruno.dart';
import 'package:crash_box/models/Portfolio.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';

class PortfolioInfo extends StatelessWidget {
  const PortfolioInfo({super.key, required this.target, required this.strategy, required this.tag, required this.portfolio});

  final String target;
  final String strategy;
  final String tag;
  final Portfolio portfolio;

  getTags(String tags) {
    List<Widget> list = [];

    if (tags == '') {
      return const Row();
    }

    var tagList = tags.split(',');
    for (var element in tagList) {
      list.add(Padding(
        padding: const EdgeInsets.only(left: 4),
        child: BrnTagCustom(
          tagText: element,
          backgroundColor: Colors.green,
          tagBorderRadius: const BorderRadius.only(bottomLeft: Radius.circular(5), topRight: Radius.circular(5)),
        ),
      ));
    }

    return Row(
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BrnShadowCard(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 12),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BrnCommonCardTitle(
              title: '组合目标',
            ),
            SizedBox(
              child: BrnExpandableText(
                text: target,
                maxLines: 2,
              ),
            ),
            const BrnCommonCardTitle(
              title: '组合策略',
            ),
            SizedBox(
              child: BrnExpandableText(
                text: strategy,
                maxLines: 2,
              ),
            ),
            const BrnCommonCardTitle(
              title: '组合标签',
            ),
            getTags(tag),
            const BrnCommonCardTitle(
              title: '创建人',
            ),
            Row(
              children: [
                portfolio.user?.avatar != null
                    ? GFAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(portfolio.user?.avatar),
                        size: 18,
                      )
                    : const SizedBox(),
                Container(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                ),
                Text(portfolio.user?.nickName ?? "")
              ],
            )
          ],
        ));
  }
}
