import 'package:app_flutter_thientin/src/home/models/campaign_model.dart';
import 'package:app_flutter_thientin/src/routes/routes_navigator.dart';
import 'package:app_flutter_thientin/src/utils/money_format.dart';
import 'package:flutter/material.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

import 'components/item_person.dart';
import 'components/title.dart';
import 'validation/data_validation.dart';

class ProofPage extends StatefulWidget {
  const ProofPage({Key? key, required this.validation}) : super(key: key);
  final ProofDataValidation validation;
  @override
  State<ProofPage> createState() => _ProofPageState();
}

class _ProofPageState extends State<ProofPage> {
  List<Widget> views(CampaignModel data) => [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: data.listUserDonate.length > 0
              ? SingleChildScrollView(
                  child: Column(
                    children: data.listUserDonate
                        .map(
                          (e) => ItemPerson(
                            name: e.name,
                            wallet: MoneyFormat.formatMoney(e.amount),
                            phone: widget.validation.convertPhone(e.phone),
                          ),
                        )
                        .toList(),
                  ),
                )
              : const Center(
                  child: Text(
                    'Hiện tại chiến dịch chưa có ủng hộ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: data.listUserReceiver.length > 0
              ? SingleChildScrollView(
                  child: Column(
                    children: data.listUserReceiver
                        .map(
                          (e) => ItemPerson(
                            name: e.name,
                            wallet: MoneyFormat.formatMoney(e.amount),
                            phone: widget.validation.convertPhone(e.phone),
                          ),
                        )
                        .toList(),
                  ),
                )
              : const Center(
                  child: Text(
                    'Hiện tại chiến dịch chưa đến thời điểm kiểm duyệt',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
        ),
      ];
  @override
  void initState() {
    widget.validation.addInitPage(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CampaignModel>(
        stream: widget.validation.streamCampaign,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return WillPopScope(
              onWillPop: () async {
                RouteNavigator.pushName(context, '/campaign',
                    arguments: '${snapshot.data!.idCaimpain}');
                return false;
              },
              child: SafeArea(
                child: Scaffold(
                  body: Column(
                    children: [
                      TitleComponent(
                        onBack: () {
                          RouteNavigator.pushName(context, '/campaign',
                              arguments: '${snapshot.data!.idCaimpain}');
                        },
                        onClickTransaction: () {
                          Navigator.of(context).pushNamed(
                            '/transaction',
                            arguments: snapshot.data!.idCaimpain,
                          );
                        },
                      ),
                      StreamBuilder<int>(
                          stream: widget.validation.streamInitPage,
                          builder: (context, init) {
                            if (init.hasData) {
                              return Expanded(
                                  child: ContainedTabBarView(
                                onChange: (i) {
                                  widget.validation.addInitPage(i);
                                },
                                tabs: [
                                  Text(
                                    'Đã ủng hộ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: init.data == 0
                                            ? Colors.red
                                            : Colors.black),
                                  ),
                                  Text(
                                    'Người nhận',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: init.data == 1
                                            ? Colors.red
                                            : Colors.black),
                                  ),
                                ],
                                views: views(snapshot.data!),
                              ));
                            }
                            return const SizedBox.shrink();
                          })
                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox.shrink(
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
