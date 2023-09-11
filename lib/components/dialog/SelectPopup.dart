import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// import 'package:update_project/Container/SelectRoom.dart';
class SelectPopup extends StatelessWidget {
  final List<bool> result;
  const SelectPopup({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(result);
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 311,
        height: 317,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
        ),
        child: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 32),
              child: SvgPicture.asset('assets/icons/schedule/Group 1668.svg')),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              'LỰA CHỌN',
              style: TextStyle(
                color: Color(0xFF444444),
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                result[0] == false || result[1] == false
                    ? Text(
                  'Bạn chắc chắn muốn chọn tất cả chứ ?',
                  style: TextStyle(
                    color: Color(0xFF535858),
                    fontSize: 14,
                  ),
                )
                    : Text(
                  'Bạn chắc chắn muốn hủy chọn tất cả chứ ?',
                  style: TextStyle(
                    color: Color(0xFF535858),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding:
              EdgeInsets.only(top: 16, bottom: 0, left: 16, right: 16),
              child: ElevatedButton(
                // ignore: sort_child_properties_last
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    result[0] == false
                        ? Text('Chọn tất cả tư vấn online')
                        : Text('Huỷ tất cả tư vấn online')
                  ],
                ),
                onPressed: () {
                  if (result[0] == false) {
                    Navigator.pop(context, 'allTuVan');
                  } else {
                    Navigator.pop(context, 'removeTuVan');
                  }

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             SelectRoom(checkTatCaTuVan: true)));
                },
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll(Color(0xFF6F9BD4)),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    side: MaterialStatePropertyAll(
                        BorderSide(color: Color(0xFF6F9BD4))),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)))),
              )),
          Padding(
              padding:
              EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
              child: ElevatedButton(
                // ignore: sort_child_properties_last
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    result[1] == false
                        ? Text('Chọn tất cả đặt lịch CSYT')
                        : Text('Hủy tất cả đặt lịch CSYT')
                  ],
                ),
                onPressed: () {
                  if (result[1] == false) {
                    Navigator.pop(context, 'allDatLich');
                  } else {
                    Navigator.pop(context, 'removeDatLich');
                  }

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             SelectRoom(checkTatCaDatLich: true)));
                },
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll(Color(0xFF5CBBB8)),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    side: MaterialStatePropertyAll(
                        BorderSide(color: Color(0xFF5CBBB8))),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)))),
              ))
        ]),
      ),
    );
  }
}
