import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class PortfolioListComponent extends StatefulWidget {
  const PortfolioListComponent({super.key});

  @override
  _PortfolioListComponent createState() => _PortfolioListComponent();
}

class _PortfolioListComponent extends State<PortfolioListComponent> with AutomaticKeepAliveClientMixin {
  final logic = Get.put(PortfolioListLogic());
  final state = Get.find<PortfolioListLogic>().state;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Expanded(
      child: GetBuilder<PortfolioListLogic>(builder: (logic) {
        return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: state.portfolioList.length,
            itemBuilder: (context, index) {
              return Ink(
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(
                      "/portfolio/detail?id=${state.portfolioList[index].id}&portfolioName=${state.portfolioList[index].portfolioName}",
                    );
                  },
                  child: SizedBox(
                    height: 65,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.6,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ConstrainedBox(
                                      constraints: const BoxConstraints(maxWidth: 170),
                                      child: Text(
                                        state.portfolioList[index].portfolioName ?? '-',
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Color(0xFF171717),
                                          fontSize: 16,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    logic.getTags(state.portfolioList[index].tag ?? '-')
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      state.portfolioList[index].user?.nickName ?? '',
                                      style: const TextStyle(
                                        color: Color.fromRGBO(102, 102, 102, 1),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.3,
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      state.portfolioList[index].marketValue!.toStringAsFixed(2),
                                      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                                    ),
                                    logic.getPercent(state.portfolioList[index].marketValue!, state.portfolioList[index].marketValueYes!),
                                  ],
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
            });
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
