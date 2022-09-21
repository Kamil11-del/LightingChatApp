import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ttt/screens/registran_screen/components/image_picker_btn.dart';

class PofileContainer extends StatefulWidget {
  PofileContainer({
    Key? key,
  });

  State<PofileContainer> createState() => _PofileContainerState();
}

class _PofileContainerState extends State<PofileContainer> {
  ImagePicker picker = ImagePicker();
  File? _pickedImg;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          height: 150,
          width: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
          margin: EdgeInsets.all(4),
          child: CircleAvatar(
            child: _pickedImg != null
                ? Image.file(
                    _pickedImg!,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/profilimg.png',
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Positioned(
          top: 100,
          left: 80,
          child: RawMaterialButton(
            elevation: 10,
            shape: CircleBorder(),
            fillColor: Colors.deepPurple,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Text(
                        'Choose Option',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      content: SingleChildScrollView(
                        child: ListBody(children: [
                          buildImgPickerBtn(icon: Icons.camera,type: 'Camera',press:() {
                            takePhoto(ImageSource.camera);
                          }),
                          SizedBox(
                            height: 8.0,
                          ),
                         buildImgPickerBtn(icon: Icons.photo, type: 'Gallery', press:  () {
                           takePhoto(ImageSource.gallery);
                         },),
                          SizedBox(height: 8.0,),
                          buildImgPickerBtn(icon: Icons.remove_circle_outline, type: 'Remove', press:  () {
                            takePhoto(ImageSource.camera);
                          },),
                        ]),
                      ),
                    );
                  });
            },
            child: Icon(
              Icons.add_a_photo_outlined,
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
          ),
        ),
        Positioned(
          right: 30,
          top: -40,
          child: Hero(
            tag: 'logo',
            child: Container(
              height: 250.0,
              child: Image(
                image: AssetImage('assets/img1.png'),
              ),
            ),
          ),
        ),
      ],
    );
  }



  void takePhoto(ImageSource source) async {
    try {
      XFile? pickeFile = await picker.pickImage(source: source);
      if (pickeFile == null) return;
      final tempimg = File(pickeFile.path);
      setState(() {
        _pickedImg = tempimg;
      });
    } catch (e) {
      print(e);
    }
  }
}
