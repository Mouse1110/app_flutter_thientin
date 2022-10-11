import 'package:app_flutter_thientin/src/donate/views/validations/data_validation.dart';
import 'package:app_flutter_thientin/src/routes/routes_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../login/cubit/login_cubit.dart';
import '../../utils/input_money_format.dart';
import '../cubit/donate_cubit.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({
    Key? key,
    required this.validation,
  }) : super(key: key);
  final DonateDataValidation validation;

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _input = TextEditingController();
  @override
  void dispose() {
    _input.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        RouteNavigator.pushName(context, '/campaign',
            arguments: '${widget.validation.id.value}');
        return false;
      },
      child: SafeArea(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Scaffold(
            body: StreamBuilder<int>(
                stream: widget.validation.streamid,
                builder: (_, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                RouteNavigator.pushName(context, '/campaign',
                                    arguments: '${widget.validation.id.value}');
                              },
                              child: const Icon(Icons.arrow_back, size: 32),
                            ),
                            const Text('ỦNG HỘ',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black)),
                            const SizedBox(height: 20, width: 20),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(height: 70),
                              const Text('Số tiền còn lại:',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                              const SizedBox(height: 10),
                              StreamBuilder<String>(
                                  stream: widget.validation.streamTotal,
                                  builder: (_, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(snapshot.data!,
                                          style: const TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromRGBO(
                                                  35, 45, 94, 1)));
                                    }
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey.withOpacity(0.3),
                                      highlightColor:
                                          Colors.white.withOpacity(0.3),
                                      child: Container(
                                        width: double.infinity,
                                        height: 20,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 14),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  }),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text('Nhập số tiền muốn chuyển',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                              const SizedBox(height: 30),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.75))),
                                child: StreamBuilder<String>(
                                    stream: widget.validation.streamInput,
                                    builder: (_, input) {
                                      return TextFormField(
                                        textAlign: TextAlign.center,
                                        textInputAction: TextInputAction.done,
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(fontSize: 16),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '0 VNĐ',
                                        ),
                                        controller: _input,
                                        onChanged: widget.validation.addInput,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          CustomMoney()
                                        ],
                                      );
                                    }),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        StreamBuilder<bool>(
                            stream: widget.validation.streamButton,
                            builder: (_, button) {
                              return ElevatedButton(
                                onPressed: button.hasData
                                    ? (button.data!
                                        ? () {
                                            print(snapshot.data);
                                            context
                                                .read<DonateCubit>()
                                                .fetchDonateApi(
                                                    context
                                                        .read<LoginCubit>()
                                                        .user!
                                                        .accessToken,
                                                    id: snapshot.data!,
                                                    amount: widget.validation
                                                        .formatMoney(
                                                            _input.text));
                                          }
                                        : null)
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Container(
                                  height: 65,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Xác nhận',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
