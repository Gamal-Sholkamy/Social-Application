class MessageModel{

  String? text;
  String? senderID;
  String? receiverID;
  String? dateTime;

  MessageModel({
  this.text,
  this.senderID,
  this.receiverID,
  this.dateTime,

  });
  MessageModel.fromJson(Map<String ,dynamic>json){
    text=json['text'];
    senderID=json['senderID'];
    receiverID=json['receiverID'];
  dateTime=json['dateTime'];


  }
  Map<String ,dynamic> toMap(){
  return {
  'text':text,
  'senderID':senderID,
  'receiverID':receiverID,
  'dateTime':dateTime,


  };
  }
}
