import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDanhMuc/presentation/DirectoryViewModel.dart';

import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../config/styles/Dimens.dart';
import '../../../../../../qlhk_icons.dart';

class Directorys extends StatefulWidget {
  const Directorys(
      {Key? key, required this.onPress, required this.index})
      : super(key: key);

  final Function(String) onPress;
  final int index;

  @override
  State<Directorys> createState() => _DirectorysState();
}

class _DirectorysState extends State<Directorys> {
  final DirectoryViewModel directoryViewModel= new DirectoryViewModel();
  @override
  void initState() {
    // TODO: implement initState
    loadDirectory();
  }
  final TextEditingController _textEditingController=TextEditingController();
  List<String> listItem=[];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
            text: "Danh mục",
            check: false,
            onPress: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              height: 50,
              child: TextField(
                  maxLines: 1,
                  style: TextStyle(
                    color: Color(0xFF444444),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  controller: _textEditingController,
                  // focusNode: focusNode,
                  // onChanged: onChanged,
                  decoration: new InputDecoration(
                    contentPadding: const EdgeInsets.only(
                        left: defaultTextInsideBoxPadding, right: 0),
                    fillColor: Colors.white,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFFE0E0E0), width: 1.0),
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(4.0),
                    ),
                    // suffixIcon: Visibility(
                    //   // visible: isShowIcon ?? false,
                    //   visible: focusNode.hasFocus == false &&
                    //           textController.text != ''
                    //       ? true
                    //       : false,
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       textController.clear();
                    //     },
                    //     child: Icon(Qlhk.cancel),
                    //   ),
                    // ),
                    prefixIcon: Icon(Qlhk.search),
                    suffixIconConstraints: BoxConstraints(
                      minHeight: 25,
                      minWidth: 30,
                    ),
                  )),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            widget.onPress(listItem[index]);
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            height: 50,
                            // color: Colors.white,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0, 1),
                                  ),
                                ]),
                            // margin: EdgeInsets.all(10),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                listItem[index],
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    );
                  },
                  itemCount: listItem.length),
            ),
          ],
        ),
      ),
    );
  }

  void loadDirectory() {
    directoryViewModel.getDirectory(widget.index.toString());
    directoryViewModel.directory.listen((data) {
      if (data.toString().isNotEmpty) {
        setState(() {
          listItem=data.listItem!;
        });
        print(data.listItem.toString());
        print('===================================\nget data thanh cong');
      } else {
        print('==================================\napi khong thanh cong');
      }
    });
  }
}
