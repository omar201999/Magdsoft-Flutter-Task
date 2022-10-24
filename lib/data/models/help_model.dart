class HelpModel {
  int? status;
  String? message;
  List<Help>? help;

  HelpModel({this.status, this.message, this.help});

  HelpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['help'] != null) {
      help = <Help>[];
      json['help'].forEach((v) {
        help!.add(Help.fromJson(v));
      });
    }
  }


}

class Help {
  int? id;
  String? question;
  String? answer;

  Help({this.id, this.question, this.answer});

  Help.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }
}