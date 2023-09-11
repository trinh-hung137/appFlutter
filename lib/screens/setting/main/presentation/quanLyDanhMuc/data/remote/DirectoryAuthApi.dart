
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDanhMuc/data/model/diretory.dart';

abstract class DirectoryAuthApi{
  Future<Directory> getDirectory(String index);
}