import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class PortfolioListComponent extends StatefulWidget {
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
                  child: Container(
                    height: 65,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.6,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      state.portfolioList[index].portfolioName ?? '-',
                                      style: TextStyle(
                                        color: Color(0xFF171717),
                                        fontSize: 16,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w600,
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
                                      style: TextStyle(
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
                            decoration: BoxDecoration(),
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Container(
                                //   decoration: BoxDecoration(),
                                //   child: Column(
                                //     mainAxisSize: MainAxisSize.max,
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     crossAxisAlignment: CrossAxisAlignment.end,
                                //     children: [
                                //       Text(
                                //         '0.7349',
                                //       ),
                                //       Text(
                                //         '0.00%',
                                //         style: TextStyle(
                                //           fontSize: 11,
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        state.portfolioList[index].marketValue!.toStringAsFixed(2),
                                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                                      ),
                                      logic.getPercent(state.portfolioList[index].marketValue!, state.portfolioList[index].marketValueYes!),
                                    ],
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
            });
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
