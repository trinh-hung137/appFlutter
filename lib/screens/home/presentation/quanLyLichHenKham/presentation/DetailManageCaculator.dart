import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vncare_qlhk/components/button/FixedBottomButton.dart';
import 'package:vncare_qlhk/components/dialog/InputDialog.dart';
import 'package:vncare_qlhk/components/schedule/CallDialog.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';
import 'package:vncare_qlhk/screens/home/presentation/quanLyLichHenKham/presentation/ManageCaculatorViewModel.dart';

import '../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../utils/AppLocalizations.dart';
import '../data/model/ChiTietLichHen.dart';
import 'components/ItemDetailManageCaculator.dart';


class DetailManageCaculator extends StatefulWidget {
  final String idHenKham;
  const DetailManageCaculator({
    Key? key,
    required this.idHenKham,
  }):super(key: key);

  @override
  State<DetailManageCaculator> createState() => _DetailManageCaculatorState();
}

class _DetailManageCaculatorState extends State<DetailManageCaculator> {
  ManageCaculatorViewModel viewModel = new ManageCaculatorViewModel();
  //bubbles icon call
  final GlobalKey _floatingKey = GlobalKey(); //biến tham chiếu đến widget call
  late Size floatingSize; //biến lưu kích thước widget call
  Offset floatingLocation = Offset(300, 400); // biến lưu vị trí x,y
  // lấy kích thước của widget được xác định bằng _floatingKey và gán kích thước đó cho biến floatingSize
  void getFloatingSize() {
    RenderBox _floatingBox =
    _floatingKey.currentContext!.findRenderObject() as RenderBox;
    floatingSize = _floatingBox.size;
  }

//hàm cập nhật vị trí widget call trong quá trình kéo
  void onDrapUpdate(BuildContext context, DragUpdateDetails details) {
    //vi tri cu chi
    final RenderBox box = context.findRenderObject()! as RenderBox;
    final Offset offset = box.globalToLocal(details.globalPosition);

    //khu vuc man hinh
    const double startX = 0;
    final double endX = MediaQuery.of(context).size.width - floatingSize.width;
    // print(endX);
    final double startY = MediaQuery.of(context).padding.top;
    // final double endY = context.size?.height ?? -floatingSize.height;
    final double endY =
        MediaQuery.of(context).size.height - 115 - floatingSize.height;
    // print(endY);
    //kiem tra nam trong kich thuoc phu hop k
    if (startX < offset.dx && offset.dx < endX) {
      if (startY < offset.dy && offset.dy < endY) {
        setState(() {
          floatingLocation = Offset(offset.dx, offset.dy);
        });
      }
    }

    //update vi tri
  }

  Map<String, String> ketqua = {};
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getFloatingSize();
    });
    initApi();
    // fetchTest();
  }

  void initApi() async {
    try{
      viewModel.getDetaill(widget.idHenKham);
      viewModel.manage.listen((data) {
        setState(() {
          ketqua = data.result;
        });
      });
    }catch(e){
      print('DetailManageCaculator => Lỗi call api: ${e.toString()} ');
    }
    // String apiUrl =
    //     'https://staging-apidatlichkham.vncare.vn/patient_api/api/QlhkMobile/v1.3.0/business-service/';
    // String param = 'chiTietLichHenKham?henKhamId=${widget.idHenKham}';
    // final result = await BaseApi().get(apiUrl, param);
    // final kqua = chiTietLichHenFromJson(result);
    // setState(() {
    //   ketqua = kqua.result;
    // });
  }

  @override
  Widget build(BuildContext context) {
    final width_screen = MediaQuery.of(context).size.width;
    // print(widget.idHenKham);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
            text: AppLocalizations.of(context)!.translate('offline_detail_title'),
            check: false,
            onPress: () {
              Navigator.pop(context);
            }),
      ),
      body: Scaffold(
        body: GestureDetector(
          onVerticalDragUpdate: (DragUpdateDetails details) {
            onDrapUpdate(context, details);
          },
          onHorizontalDragUpdate: (DragUpdateDetails details) {
            onDrapUpdate(context, details);
          },
          child: Stack(children: [
            Container(
              width: width_screen,
              // height: height_screen - 136,
              child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Container(
                      child: ItemDetailAppoint(
                        valueSate: ketqua['trangThaiLichHen'].toString(),
                        valueStateAppoint:
                        ketqua['trangThaiDenKham'].toString(),
                        valueRegistry: ketqua['kenhDangKy'].toString(),
                        valueObject: ketqua['doiTuongBenhNhan'].toString(),
                        valueBHYT: ketqua['soTheBhyt'].toString(),
                        valueName: ketqua['hoTen'].toString(),
                        valueBirthday: ketqua['ngaySinh'].toString(),
                        valueJob: ketqua['ngheNghiep'].toString(),
                        valueSex: ketqua['gioiTinh'].toString(),
                        valuePeople: ketqua['danToc'].toString(),
                        valueCountry: ketqua['quocTich'].toString(),
                        valueProvince: ketqua['tinhKhaiSinh'].toString(),
                        valuePhone: ketqua['trangThaiLichHen'].toString(),
                        valueIdCart: ketqua['sdt'].toString(),
                        valueCountryLiving: ketqua['tinhTp'].toString(),
                        valueDistrict: ketqua['huyen'].toString(),
                        valueCommune: ketqua['xa'].toString(),
                        valueHouse: ketqua['soNha'].toString(),
                        valueRequest: ketqua['yeuCauKham'].toString(),
                        valueRoom: ketqua['phongKham'].toString(),
                        valueDoctor: ketqua['bacSi'].toString(),
                        valueDate: ketqua['thoiGianDenKham'].toString(),
                        valueContent: ketqua['yeuCauKham'].toString(),
                        valueNote: ketqua['ghiChu'].toString(),
                        trangThaiDenKham:
                        ketqua['maTrangThaiDenKham'].toString(),
                      ),
                    )),
              ),
            ),
            Builder(
              builder: (context) {
                return Positioned(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CallDialog(phonenumber: "");
                          });
                    },
                    child: SvgPicture.asset(
                      'assets/call_bubbles.svg',
                      key: _floatingKey,
                    ),
                  ),
                  //set vị trí ban đầu
                  left: floatingLocation.dx,
                  top: floatingLocation.dy,
                );
              },
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        width: width_screen,
        height: 64,
        // margin: EdgeInsets.only(bottom: 7),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 16,
            ),
            Expanded(
              flex: 3,
              child: Builder(
                builder: (context) {
                  return FixedBottomButton(text: AppLocalizations.of(context)!.translate('fixed_bottom_button_defuse_offline_detail_title'), icon: Qlhk.cancel, height: 32,press: (){
                    showDialog(
                        context: context,
                        builder: (context) {
                          return InputDialog();
                        });
                  });
                },
              ),
            ),
            Container(
              width: 8,
            ),
            Expanded(
              flex: 2,
              child: FixedBottomButton(text: AppLocalizations.of(context)!.translate('fixed_bottom_button_edit_offline_detail_title'), icon: Qlhk.edit, height: 32,press: (){
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => EditSchedule()));
              },)
            ),
            Container(
              width: 8,
            ),
            Expanded(
              flex: 4,
              child: FixedBottomButton(text: AppLocalizations.of(context)!.translate('fixed_bottom_button_accept_offline_detail_title'), icon: Qlhk.confirm, height: 32,press: (){
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => DetailManageCaculator()),
                // );
              },)
            ),
            Container(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
