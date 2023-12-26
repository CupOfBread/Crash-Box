import 'package:bruno/bruno.dart';
import 'package:flutter/cupertino.dart';

class TradeNoticeBar extends StatelessWidget {
  const TradeNoticeBar({super.key, required this.isTrade});

  final bool isTrade;

  @override
  Widget build(BuildContext context) {
    return BrnNoticeBar(
      content: isTrade ? '开盘中' : '休市中',
      noticeStyle: isTrade ? NoticeStyles.succeedWithArrow : NoticeStyles.normalNoticeWithArrow,
    );
  }
}
