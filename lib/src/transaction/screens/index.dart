import 'package:app_flutter_thientin/src/transaction/screens/index_transaction_page/components/contributor_page.dart';
import 'package:app_flutter_thientin/src/transaction/screens/index_transaction_page/components/receiver_page.dart';
import 'package:app_flutter_thientin/src/transaction/screens/index_transaction_page/components/title.dart';
import 'package:flutter/material.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const TitleComponent(),
            Expanded(
                child: ContainedTabBarView(
              onChange: (i) {},
              tabs: const [
                Text(
                  'Người nhận',
                  style: TextStyle(color: Colors.red),
                ),
                Text(
                  'Người ủng hộ',
                  style: TextStyle(color: Colors.red),
                ),
              ],
              views: const [
                ReceiverPage(),
                ContributorPage(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
