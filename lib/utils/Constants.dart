// API STATUS
const TIME_OUT = 20;
const OK_Code = 200;
const Bad_Request_Code = 400;
const Unauthorized_Code = 401;
const Server_Error_Code = 500;
const ERROR_CODE_SUCCESS = 0;
const ERROR_CODE_FAIL = 1;

// LOAI HEN KHAM
const LOAI_KHAM_TVTX = "0";
const LOAI_KHAM_CSYT = "1";
const NHAC_LICH_KHAM_BS_TVTX = "2";
const NHAC_LICH_KHAM_BS_CSYT = "3";
const HUY_LICH_KHAM_TVTX = "4";
const HUY_LICH_KHAM_CSYT = "5";

// MA DOI TUONG BENH NHAN
const DOI_TUONG_BHYT = "1";
const DOI_TUONG_VIEN_PHI = "2";

// LOAI DANH MUC
const DM_YEU_CAU_KHAM = 0;
const DM_PHONG_KHAM = 1;
const DM_BAC_SI = 2;
const DM_DONG_PHI = 3;
const DM_KENH_DANG_KY_SEARCH = 4;
const DM_TRANG_THAI_LICH_HEN_CSYT = 5;
const DM_TRANG_THAI_DEN_KHAM = 6;
const DM_TRANG_THAI_LICH_HEN_TVTX = 7;
const DM_TRIEU_CHUNG = 8;
const DM_BENH_MAN_TINH = 9;
const DM_DAN_TOC = 10;
const DM_DOI_TUONG = 11;
const DM_GIOI_TINH = 12;
const DM_KENH_DANG_KY = 13;
const DM_NGHE_NGHIEP = 14;
const DM_QUOC_GIA = 15;
const DM_TINH_TP = 16;
const DM_TUYEN = 17;
const DM_TINH_KHAI_SINH = 18;
const DM_HUYEN = 19;
const DM_XA = 20;
const DM_MA_VUNG = 21;
const DM_BENH_CHINH = 22;
const DM_BENH_PHU = 23;
const DM_THUOC = 24;

// TRANG THAI LICH HEN
const TT_MOI_DANG_KY = "1";
const TT_DA_XAC_NHAN = "2";
const TT_DA_HUY = "3";
const TT_DA_TRA_KET_QUA = "4";

// TRANG THAI DEN KHAM
const TT_CHUA_DEN_KHAM = "0";
const TT_DA_DEN_KHAM = "1";
const TT_DEN_KHAM_MUON = "2";

// CAP DIA PHUONG
const CAP_TINH = "1";
const CAP_QUAN_HUYEN = "2";
const CAP_PHUONG_XA = "3";

//TRANG THAI KHOA
const TT_KHOA_SU_DUNG = "Sử dụng";
const TT_KHOA_HUY_BO = "Hủy bỏ";

//LUA CHON DANH MUC
const DANH_MUC = "--Lựa chọn--";
const DM_CHINH_KHOA = "Quản lý Khoa";
const DM_LOAI_KHOA = "37";
const DM_CHUYEN_KHOA = "38";
const DM_TRUONG_KHOA = "39";
const DM_HANG_BH_TRAI_TUYEN = "40";
const DM_CO_SO_Y_TE = "41";
