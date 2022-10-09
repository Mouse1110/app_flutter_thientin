class TransactionModel {
  TransactionModel({
    required this.id,
    required this.idCaimpain,
    required this.publicKey,
    required this.hash,
    required this.type,
    required this.amount,
    required this.date,
  });

  String id;
  int idCaimpain;
  String publicKey;
  String hash;
  String type;
  String amount;
  int date;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json["id"] ?? '0',
        idCaimpain: json["id_caimpain"] ?? 0,
        publicKey: json["public_key"] ?? '',
        hash: json["hash"] ?? '',
        type: json["type"] ?? '',
        amount: '${json["amount"]}',
        date: json["date"] ?? '',
      );
}
