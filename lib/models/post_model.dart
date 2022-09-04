// ignore_for_file: prefer_collection_literals, unnecessary_this, unnecessary_new

import 'comment_model.dart';

class Post {
  int? userId;
  int? id;
  String? title;
  String? body;
  List<Comment>? comment;

  int countComment() {
    return comment != null ? comment!.length : 0;
  }

  Post({this.userId, this.id, this.title, this.body});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
    if (json['comment'] != null) {
      json['comment'].forEach((v) {
        comment?.add(new Comment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['comment'] = this.comment;
    return data;
  }
}
