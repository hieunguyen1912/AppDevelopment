import 'package:app_web/views/side_bar_screens/widgets/category_list_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryScreen extends StatefulWidget {
  static const String id = '/categoryScreen';
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  dynamic _image;
  String? fileName;
  late String categoryName;

  pickImage() async {
    {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );
      if (result != null) {
        setState(() {
          _image = result.files.first.bytes;
          fileName = result.files.first.name;
        });
      }
    }
  }

  _uploadImageToStorage(dynamic imgage) async {
    Reference ref =
        FirebaseStorage.instance.ref().child('categories').child(fileName!);
    UploadTask uploadTask = ref.putData(_image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  uploadToFirebase() async {
    if (_formKey.currentState!.validate()) {
      if (_image != null) {
        String imageUrl = await _uploadImageToStorage(_image);
        await _firestore.collection('categories').doc(fileName).set({
          'categoryName': categoryName,
          'categoryImage': imageUrl,
        });
      }
      //upload category to firebase
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 140,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      border: Border.all(color: Colors.grey.shade800),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: _image != null
                          ? Image.memory(
                              _image,
                              fit: BoxFit.cover,
                              width: 150,
                              height: 140,
                            )
                          : Text(
                              'Upload Image ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        pickImage();
                      },
                      child: Text(
                        'Upload Image',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              SizedBox(
                width: 150,
                child: TextFormField(
                  onChanged: (value) {
                    categoryName = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a category name';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Category Name',
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.white,
                  ),
                  side: MaterialStateProperty.all(
                    BorderSide(
                      color: Colors.blue.shade900,
                    ),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //upload category to firebase
                  } else {
                    //show error message
                    print('bad response');
                  }
                },
                child: const Text(
                  "Save",
                ),
              ),
            ],
          ),
          CategoryListWidget(),
        ],
      ),
    );
  }
}
