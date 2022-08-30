// To parse this JSON data, do
//
//     final transactionShowOtd = transactionShowOtdFromJson(jsonString)

import 'dart:convert';

class TransactionModel {
  TransactionModel({
    required this.hash,
    required this.blockHash,
    required this.blockNumber,
    required this.from,
    required this.to,
    required this.gas,
    required this.gasPrice,
    required this.value,
    required this.date,
  });

  String hash;
  String blockHash;
  int blockNumber;
  String from;
  String to;
  int gas;
  String gasPrice;
  String value;
  int date;

  factory TransactionModel.fromJson(String str) =>
      TransactionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromMap(Map<String, dynamic> json) =>
      TransactionModel(
        hash: json["hash"],
        blockHash: json["blockHash"],
        blockNumber: json["blockNumber"],
        from: json["from"],
        to: json["to"],
        gas: json["gas"],
        gasPrice: json["gasPrice"],
        value: '${json["value"]}',
        date: json["date"],
      );

  Map<String, dynamic> toMap() => {
        "hash": hash,
        "blockHash": blockHash,
        "blockNumber": blockNumber,
        "from": from,
        "to": to,
        "gas": gas,
        "gasPrice": gasPrice,
        "value": value,
        "date": date,
      };
}
