import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDanhMuc/data/model/diretory.dart';

abstract class DirectoryRepository{
  Future<Directory> getAllTimeAppointment(String index);
}