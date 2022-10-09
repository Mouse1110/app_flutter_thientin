// To parse this JSON data, do
//
//     final infoTransactionModel = infoTransactionModelFromJson(jsonString);

import 'dart:convert';

class InfoTransactionModel {
  InfoTransactionModel({
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
  int value;
  int date;

  factory InfoTransactionModel.fromRawJson(String str) =>
      InfoTransactionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InfoTransactionModel.fromJson(Map<String, dynamic> json) =>
      InfoTransactionModel(
        hash: json["hash"],
        blockHash: json["blockHash"],
        blockNumber: json["blockNumber"],
        from: json["from"],
        to: json["to"],
        gas: json["gas"],
        gasPrice: json["gasPrice"],
        value: json["value"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
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
