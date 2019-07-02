import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimetableInput extends StatefulWidget {
  @override
  _TimetableInputState createState() => _TimetableInputState();
}

class _TimetableInputState extends State<TimetableInput> {
  bool _validate = true;
  final Firestore _db = Firestore.instance;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final AController = TextEditingController();
  final BController = TextEditingController();
  final CController = TextEditingController();
  final DController = TextEditingController();
  final EController = TextEditingController();
  final FController = TextEditingController();
  final GController = TextEditingController();

asyncFunc() async { // Async func to handle Futures easier; or use Future.then
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('A', AController.text);
prefs.setString('B', BController.text);
prefs.setString('C', CController.text);
prefs.setString('D', DController.text);
prefs.setString('E', EController.text);
prefs.setString('F', FController.text);
prefs.setString('G', GController.text);
 

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Step One"),
        ),
        body: Form(
          child: Container(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Theory Slots",
                    style:
                        TextStyle(fontWeight: FontWeight.w200, fontSize: 20)),
                Padding(padding: EdgeInsets.only(top: 20)),
                Center(
                  child: Text("Note: Type in the format 'SUBJECT+VENUE'",
                      style:
                          TextStyle(fontWeight: FontWeight.w200, fontSize: 15)),
                ),
                Center(
                  child: Text("Example: OS TP601",
                      style:
                          TextStyle(fontWeight: FontWeight.w200, fontSize: 15)),
                ),
                new Row(
                  children: <Widget>[
                    new Flexible(
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        decoration: InputDecoration(
                          labelText: "A Slot ",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorText: _validate
                              ? null
                              : 'Registration Number is not in the right format!',
                        ),
                        keyboardType: TextInputType.text,
                        autocorrect: true,
                      controller: AController,
                      ),

                      
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    new Flexible(
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        decoration: InputDecoration(
                          labelText: "B Slot ",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorText: _validate
                              ? null
                              : 'Registration Number is not in the right format!',
                        ),
                        keyboardType: TextInputType.text,
                        autocorrect: true,
                        controller: BController,
                      ), 
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Flexible(
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        decoration: InputDecoration(
                          labelText: "C Slot",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorText: _validate
                              ? null
                              : 'Registration Number is not in the right format!',
                        ),
                        keyboardType: TextInputType.text,
                        autocorrect: true, controller: CController,
                      ), 
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    new Flexible(
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        decoration: InputDecoration(
                          labelText: "D Slot",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorText: _validate
                              ? null
                              : 'Registration Number is not in the right format!',
                        ),
                        keyboardType: TextInputType.text,
                        autocorrect: true,
                         controller: DController,
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Flexible(
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        decoration: InputDecoration(
                          labelText: "E Slot",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorText: _validate
                              ? null
                              : 'Registration Number is not in the right format!',
                        ),
                        keyboardType: TextInputType.text,
                        autocorrect: true, controller: EController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    new Flexible(
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        decoration: InputDecoration(
                          labelText: "F Slot",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorText: _validate
                              ? null
                              : 'Registration Number is not in the right format!',
                        ),
                         controller: FController,
                        keyboardType: TextInputType.text,
                        autocorrect: true,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(15),
                  ],
                  decoration: InputDecoration(
                    labelText: "G Slot",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    errorText: _validate
                        ? null
                        : 'Registration Number is not in the right format!',
                  ),
                  keyboardType: TextInputType.text,
                  autocorrect: true,
                   controller: GController,
                ),
                Padding(padding:EdgeInsets.only(top:20)),
                Card(
          color: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: () async{
             await asyncFunc();
               await _firebaseAuth.currentUser().then((userId) {
                  DocumentReference ref =
                      _db.collection("timetable").document(userId.uid);
                  ref.setData({
                    'A': AController.text,
                    'B': BController.text,
                    'C': CController.text,
                    'D': DController.text,
                    'E': EController.text,
                    'F':FController.text,
                    'G':GController.text,
                  }, merge: true);
                });
              Navigator.pushNamed(context, '/timetableInputTwo');
            },
            child: Container(
              height: 50,
              width: 200,
              child: Center(
                child: Text(
                  'Save and Proceed',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
        ),
              ],
            ),
          ),
        ));
  }
}