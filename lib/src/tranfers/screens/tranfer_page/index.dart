import 'package:flutter/material.dart';
import 'components/amount_money.dart';
import 'components/buttom_output_input.dart';
import 'components/button_arrow_back.dart';
import 'components/receiver_list.dart';
import 'components/textform_search.dart';

class TranferPage extends StatelessWidget {
  const TranferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: const [
            // Title
            ButtomArrowBack(),
            // Số tiền còn lại
            AmountMoney(),
            //button nạp thêm và rút ra
            InputOutputButtom(),
            SizedBox(height: 20),
            Divider(color: Colors.black, height: 1),
            SizedBox(height: 30),
            //Tìm kiếm
            TextFormSearch(),
            SizedBox(height: 30),
            //Danh sách người nhận
            ReceiverList(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
