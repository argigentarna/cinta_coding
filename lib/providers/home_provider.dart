// ignore_for_file: no_leading_underscores_for_local_identifiers, unnecessary_null_comparison, unused_local_variable

import 'dart:convert';

import 'package:cinta_coding/models/post_model.dart';
import 'package:cinta_coding/providers/login_provider.dart';
import 'package:flutter/material.dart';

import '../models/comment_model.dart';
import '../models/response_model.dart';
import '../shared/const.dart';
import '../shared/helper.dart';
import 'package:provider/provider.dart';

class HomeProvider with ChangeNotifier {
  bool _isAllComment = false;
  bool get isAllComment => _isAllComment;
  set isAllComment(bool val) {
    _isAllComment = val;
    notifyListeners();
  }

  List<Post> _listPost = [];
  List<Post>? get listPost => _listPost;
  set listPost(List<Post>? listPost) {
    _listPost = listPost!;
    notifyListeners();
  }

  List<Post>? listPostByText(String text, context) {
    LoginProvider prov = Provider.of<LoginProvider>(
      context,
      listen: false,
    );

    var _dataUser = [];

    var user = prov.listUser?.where(
      (u) =>
          u.name?.toLowerCase().trim().contains(text.toLowerCase().trim()) ==
          true,
    );
    if (user.toString() != "()") {
      _dataUser = user!.toList();
    }

    var post = _listPost.where(
      (p) {
        bool isNotEmpty =
            p.title?.toLowerCase().contains(text.toLowerCase()) == true ||
                p.body?.toLowerCase().contains(text.toLowerCase()) == true;

        if (_dataUser.toString() != "[]") {
          isNotEmpty =
              p.title?.toLowerCase().contains(text.toLowerCase()) == true ||
                  p.body?.toLowerCase().contains(text.toLowerCase()) == true ||
                  p.userId == _dataUser.first.id;
        }

        return isNotEmpty;
      },
    );

    if (post.toString() != "()") {
      return post.toList();
    }
    return [];
  }

  int countComment(List<Comment>? _listComment) {
    if (_listComment.toString() != "[]") {
      if (isAllComment) {
        return _listComment!.length;
      } else {
        if (_listComment!.length > 3) {
          return 3;
        }
        return _listComment.length;
      }
    }
    return 0;
  }

  int countPost() {
    return _listPost != null ? _listPost.length : 0;
  }

  int countPostByText(String text, context) {
    LoginProvider prov = Provider.of<LoginProvider>(
      context,
      listen: false,
    );

    var _dataUser = [];

    var user = prov.listUser?.where(
      (u) =>
          u.name?.toLowerCase().trim().contains(text.toLowerCase().trim()) ==
          true,
    );
    if (user.toString() != "()") {
      _dataUser = user!.toList();
    }

    print("CHECK DATA USER");
    print(_dataUser.toString());

    print("CHECK LIST POST");
    print(_listPost.toString());

    if (_listPost != null) {
      // ignore: unrelated_type_equality_checks
      var post = _listPost.where(
        (p) {
          bool isNotEmpty =
              p.title?.toLowerCase().contains(text.toLowerCase()) == true ||
                  p.body?.toLowerCase().contains(text.toLowerCase()) == true;

          if (_dataUser.toString() != "[]") {
            isNotEmpty = p.title?.toLowerCase().contains(text.toLowerCase()) ==
                    true ||
                p.body?.toLowerCase().contains(text.toLowerCase()) == true ||
                p.userId == _dataUser.first.id;
          }

          return isNotEmpty;
        },
      );
      if (post.toString() != "()") {
        return post.toList().length;
      }
    }
    return 0;
  }

  Future<void> fetchPosts() async {
    // NOTE : Data post yang diambil, semua data. Karena api tidak support untuk pagination.
    Helper().getApi(
      baseUrl,
      apiPost,
      (res) {
        ResponseModel resModel = ResponseModel.fromJson(res);
        if (resModel.rc == 200) {
          List<Post>? _listTemp = [];
          if (resModel.data.toString() != "[]") {
            for (var item in resModel.data) {
              // NOTE : Untuk ambil data semua comment berdasarkan post id
              Helper().getApi(
                baseUrl,
                apiComment(item['id'].toString()),
                (res) {
                  ResponseModel resModel2 = ResponseModel.fromJson(res);
                  Post _dataPost = Post.fromJson(item);
                  if (resModel2.rc == 200) {
                    List<Comment> _commentTemp = [];
                    for (var comment in resModel2.data) {
                      _commentTemp.add(Comment.fromJson(comment));
                      notifyListeners();
                    }
                    _dataPost.comment = _commentTemp;
                    notifyListeners();
                  }
                  _listTemp.add(_dataPost);
                  notifyListeners();
                },
              );
            }
            listPost = _listTemp;
          }
        }
      },
    );
  }
}
