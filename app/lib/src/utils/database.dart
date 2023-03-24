import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final String time = DateTime.now().toString().substring(0, 20);

class Database {
  static Future<void> addItem({
    required String title,
    required String description,
    required String user,
  }) async {
    DocumentReference documentReferencer = _firestore.collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
      "user": user,
      "time": time,
      "likes": 0
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> addMyAddsItem(
      {required String title,
      required String price,
      required String location,
      required String quantity,
      required String phoneNumber,
      required String description,
      required String user,
      required String signedUrl}) async {
    DocumentReference documentReferencer = _firestore.collection('ads').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "price": price,
      "location": location,
      "quantity": quantity,
      "phoneNumber": phoneNumber,
      "description": description,
      "user": user,
      "time": time,
      "signedUrl": signedUrl
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note ads added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> editSellItem(
      {required String title,
      required String price,
      required String location,
      required String quantity,
      required String phoneNumber,
      required String description,
      required String signedUrl,
      required String documentId,
      required String user}) async {
    DocumentReference documentReferencer =
        _firestore.collection('ads').doc(documentId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "price": price,
      "location": location,
      "quantity": quantity,
      "phoneNumber": phoneNumber,
      "description": description,
      "signedUrl": signedUrl,
      "user": user
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note ads added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> addQuestion({
    required String title,
    required String question,
    required String user,
  }) async {
    DocumentReference documentReferencer =
        _firestore.collection('question').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "question": question,
      "user": user,
      "time": time,
      "likes": 0
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note question added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> addNews({
    required String title,
    required String description,
  }) async {
    DocumentReference documentReferencer = _firestore.collection('news').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
      "time": time,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note question added to the database"))
        .whenComplete(() => print("Note news added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> addReview({
    required String description,
  }) async {
    DocumentReference documentReferencer =
        _firestore.collection('review').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "description": description,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    required String title,
    required String description,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _firestore.collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateQuestion({
    required String title,
    required String question,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _firestore.collection('question').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "question": question,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note question updated in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> addComplaint(
      {required String title,
      required String question,
      required String user,
      required String ad}) async {
    DocumentReference documentReferencer =
        _firestore.collection('complaint').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "complaint": question,
      "user": user,
      "time": time,
      "ad": ad
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note question added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateLikes({
    required int likes,
    required String docId,
  }) async {
    int increment = 1 + likes;

    DocumentReference documentReferencer =
        _firestore.collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "likes": increment,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateLikesQ({
    required int likes,
    required String docId,
  }) async {
    int increment = 1 + likes;

    DocumentReference documentReferencer =
        _firestore.collection('question').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "likes": increment,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note question updated in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateNews({
    required String docId,
    required String title,
    required String description,
  }) async {
    DocumentReference documentReferencer =
        _firestore.collection('news').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note news updated in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> decrementLikes({
    required int likes,
    required String docId,
  }) async {
    int increment = likes - 1;

    DocumentReference documentReferencer =
        _firestore.collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "likes": increment,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> decrementLikesQ({
    required int likes,
    required String docId,
  }) async {
    int increment = likes - 1;

    DocumentReference documentReferencer =
        _firestore.collection('question').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "likes": increment,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note question updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    Query<Map<String, dynamic>> notesItemCollection =
        _firestore.collection('items').orderBy("time", descending: true);
    print('fetched');

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readNews() {
    Query<Map<String, dynamic>> notesItemCollection =
        _firestore.collection('news').orderBy("time", descending: true);
    print('fetched');

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readMyAdd() {
    Query<Map<String, dynamic>> notesItemCollection =
        _firestore.collection('ads');
    print('fetched');

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readALLAdds() {
    Query<Map<String, dynamic>> notesItemCollection =
        _firestore.collection('ads');
    print('fetched');

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readQuestions() {
    Query<Map<String, dynamic>> noteQuestionCollection =
        _firestore.collection('question').orderBy("time", descending: true);
    print('fetched');

    return noteQuestionCollection.snapshots();
  }

  static Stream<QuerySnapshot> readReviews() {
    Query<Map<String, dynamic>> noteQuestionCollection =
        _firestore.collection('review');
    print('fetched');

    return noteQuestionCollection.snapshots();
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _firestore.collection('items').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }

  static Future<void> deleteQuestion({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _firestore.collection('question').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note question deleted from the database'))
        .catchError((e) => print(e));
  }

  static Future<void> deleteNews({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _firestore.collection('news').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note news deleted from the database'))
        .catchError((e) => print(e));
  }

//-----------------------------------Comments------------------------------------------------------
  static Future<void> addComment(
      {required String comment,
      required String user,
      required String title}) async {
    DocumentReference documentReferencer =
        _firestore.collection('comments').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "user": user,
      "comment": comment,
      "time": time,
      "title": title
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> addAnswer(
      {required String answer,
      required String user,
      required String title}) async {
    DocumentReference documentReferencer =
        _firestore.collection('answer').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "user": user,
      "answer": answer,
      "time": time,
      "title": title
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note answer added to the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readComments(param) {
    Query<Map<String, dynamic>> notesItemCollection = _firestore
        .collection('comments')
        .where("title", isEqualTo: param)
        .orderBy("time", descending: true);
    print('fetched');

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readComplaints(param) {
    Query<Map<String, dynamic>> notesItemCollection =
        _firestore.collection('complaint').where("ad", isEqualTo: param);

    print('fetched');

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readAnswers(param) {
    Query<Map<String, dynamic>> notesItemCollection = _firestore
        .collection('answer')
        .where("title", isEqualTo: param)
        .orderBy("time", descending: true);
    print('fetched');

    return notesItemCollection.snapshots();
  }

//-----------------------------------Private------------------------------------------------------
  static Stream<QuerySnapshot> readPrivateItems(param) {
    Query<Map<String, dynamic>> notesItemCollection = _firestore
        .collection('items')
        .where("user", isEqualTo: param)
        .orderBy("time", descending: true);
    print('fetched');

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readMyItems(param) {
    Query<Map<String, dynamic>> notesItemCollection =
        _firestore.collection('ads').where("user", isEqualTo: param);
    print('fetched');

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readPrivateQuestions(param) {
    Query<Map<String, dynamic>> notesItemCollection = _firestore
        .collection('question')
        .where("user", isEqualTo: param)
        .orderBy("time", descending: true);
    print('fetched');

    return notesItemCollection.snapshots();
  }

  static Future<void> updateComments({
    required String comment,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _firestore.collection('comments').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "comment": comment,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note comment updated in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateAnswrs({
    required String answer,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _firestore.collection('answer').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "answer": answer,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note answer updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readPrivateComments(param) {
    Query<Map<String, dynamic>> notesItemCollection = _firestore
        .collection('comments')
        .where("user", isEqualTo: param)
        .orderBy("time", descending: true);
    print('fetched');

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readPrivateAnswers(param) {
    Query<Map<String, dynamic>> notesItemCollection = _firestore
        .collection('answer')
        .where("user", isEqualTo: param)
        .orderBy("time", descending: true);
    print('fetched');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteComment({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _firestore.collection('comments').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note comment deleted from the database'))
        .catchError((e) => print(e));
  }

  static Future<void> deleteAd({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _firestore.collection('ads').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note ad deleted from the database'))
        .catchError((e) => print(e));
  }

  static Future<void> deleteAnswer({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _firestore.collection('answer').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note answer deleted from the database'))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> searchItem(param) {
    Query<Map<String, dynamic>> notesItemCollection = _firestore
        .collection('items')
        .where("user", isEqualTo: param)
        .orderBy("time", descending: true);
    print('fetched');

    return notesItemCollection.snapshots();
  }
}
