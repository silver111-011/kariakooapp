import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UshahidiPage extends StatefulWidget {
  @override
  _UshahidiPageState createState() => _UshahidiPageState();
}

class _UshahidiPageState extends State<UshahidiPage> {
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lango la Malipo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'INGIZA USHAHIDI HAPA-',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'tuma File lako hapa',
                suffixIcon: _image == null
                    ? IconButton(
                        icon: Icon(Icons.upload),
                        onPressed: _pickImage,
                      )
                    : IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            _image = null;
                          });
                        },
                      ),
              ),
              readOnly: true,
              onTap: _pickImage,
            ),
            if (_image != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Image.file(_image!),
              ),
            Spacer(),
            Text(
              ' LIPA NAMBA',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              'Screenshot message ya muamala/ risiti al fu upload',
              style: TextStyle(fontSize: 14.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                 Get.toNamed('/mwisho');
                
                // Implement your continue action here
              },
              child: Text('Endelea'),
              style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:Theme.of(context).primaryColor,// Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: Size(double.infinity, 60), // Increase the height of the button
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
