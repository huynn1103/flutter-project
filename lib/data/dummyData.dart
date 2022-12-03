import 'package:student_internships_management/models/Classroom.dart';
import 'package:student_internships_management/models/Company.dart';
import 'package:student_internships_management/models/Department.dart';
import 'package:student_internships_management/models/Major.dart';
import 'package:student_internships_management/models/Report.dart';
import 'package:student_internships_management/models/Student.dart';
import 'package:student_internships_management/models/Teacher.dart';

// Report(this.student, this.DeTai, this.noiDung, this.ngayBatDau, this.ngayKetThuc);
List<Report> reports = [
  Report(
    student: students[1],
    deTai: 'Hệ thông cho thuê xe tự hành BeTravel',
    noiDung:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release',
    ngayBaoCao: DateTime.now(),
  ),
];

List<Department> departments = [
  Department(tenKhoa: 'Công nghệ thông tin'),
  Department(tenKhoa: 'Điện tử viễn thông'),
  Department(tenKhoa: 'Báo chí'),
  Department(tenKhoa: 'Công nghệ sinh học'),
  Department(tenKhoa: 'Toán kinh tế')
];

List<Classroom> classes = [
  Classroom(
      tenLop: 'Thực tập chuyên ngành cuối khoá - Nhóm 1',
      soLuong: 10,
      khoa: departments[1],
      giangVien: teachers[0]),
  Classroom(
      tenLop: 'Thực tập chuyên ngành cuối khoá - Nhóm 2',
      soLuong: 10,
      khoa: departments[1],
      giangVien: teachers[1]),
  Classroom(
      tenLop: 'Thực tập chuyên ngành cuối khoá - Nhóm 3',
      soLuong: 10,
      khoa: departments[1],
      giangVien: teachers[2]),
  Classroom(
      tenLop: 'Thực tập chuyên ngành cuối khoá - Nhóm 4',
      soLuong: 10,
      khoa: departments[1],
      giangVien: teachers[3]),
  Classroom(
      tenLop: 'Thực tập chuyên ngành cuối khoá - Nhóm 5',
      soLuong: 10,
      khoa: departments[1],
      giangVien: teachers[4]),
  Classroom(
      tenLop: 'Thực tập chuyên ngành cuối khoá - Nhóm 6',
      soLuong: 10,
      khoa: departments[1],
      giangVien: teachers[5]),
  Classroom(
      tenLop: 'Thực tập chuyên ngành cuối khoá - Nhóm 7',
      soLuong: 10,
      khoa: departments[1],
      giangVien: teachers[6]),
  Classroom(
      tenLop: 'Thực tập chuyên ngành cuối khoá - Nhóm 8',
      soLuong: 10,
      khoa: departments[1],
      giangVien: teachers[7]),
  Classroom(
      tenLop: 'Thực tập chuyên ngành cuối khoá - Nhóm 9',
      soLuong: 10,
      khoa: departments[1],
      giangVien: teachers[8]),
  Classroom(
      tenLop: 'Thực tập chuyên ngành cuối khoá - Nhóm 10',
      soLuong: 10,
      khoa: departments[1],
      giangVien: teachers[9]),
];

List<Major> majors = [
  Major(tenChuyenNganh: 'Mạng máy tính', khoa: departments[1]),
  Major(tenChuyenNganh: 'Khoa học máy tính', khoa: departments[1]),
  Major(tenChuyenNganh: 'Công nghệ phần mềm', khoa: departments[1]),
  Major(tenChuyenNganh: 'Điện tử', khoa: departments[2])
];

List<Teacher> teachers = [
  Teacher(tenGiangVien: "Nguyễn Mậu Hân", khoa: departments[1]),
  Teacher(tenGiangVien: "Nguyễn Dũng", khoa: departments[1]),
  Teacher(tenGiangVien: "Nguyễn Hoàng Hà", khoa: departments[1]),
  Teacher(tenGiangVien: "Trần Nguyên Phong", khoa: departments[1]),
  Teacher(tenGiangVien: "Nguyễn Ngọc Thuỷ", khoa: departments[1]),
  Teacher(tenGiangVien: "Lê Nguyễn Thủy Nhi", khoa: departments[1]),
  Teacher(tenGiangVien: "Nguyễn Quang Hưng", khoa: departments[1]),
  Teacher(tenGiangVien: "Trần Việt Khoa", khoa: departments[1]),
  Teacher(tenGiangVien: "Nguyễn Văn Trung", khoa: departments[1]),
  Teacher(tenGiangVien: "Trương công Tuấn", khoa: departments[1]),
  Teacher(tenGiangVien: "Nguyễn Đăng Bình", khoa: departments[1]),
];

List<Company> companies = [
  Company(tenDoanhNghiep: "Viễn thông Thừa Thiên Huế"),
  Company(tenDoanhNghiep: "FPT Telecom chi nhánh Huế"),
  Company(tenDoanhNghiep: "Công ty Cổ phần Trực tuyến GOSU"),
  Company(tenDoanhNghiep: "FPT Software Đà Nẵng"),
  Company(tenDoanhNghiep: "Công ty TNHH Kỹ Thuật Phần mềm Pi"),
  Company(tenDoanhNghiep: "Công ty Phần mềm Quốc tế 3S Huế"),
  Company(tenDoanhNghiep: "Công ty Enclave Việt Nam"),
  Company(tenDoanhNghiep: "THỰC TẬP TẠI TRƯỜNG"),
  Company(tenDoanhNghiep: "Công ty TNHH GENEAT"),
];

List<Student> students = [
  Student(
    maSinhVien: "18T1021133",
    tenSinhVien: "Nguyễn Mạnh Hùng",
    chuyenNganh: "Công nghệ phần mềm",
    giangVienHuongDan: "Nguyễn Văn Trung",
    noiThucTap: "FPT Software Đà Nẵng",
    lopHocPhan: classes[1],
  ),
  Student(
    maSinhVien: "18T1025005",
    tenSinhVien: "Nguyễn Văn Công",
    chuyenNganh: "Công nghệ phần mềm",
    giangVienHuongDan: "Trương Công Tuấn",
    noiThucTap: "Công ty Phần mềm Quốc tế 3S Huế",
    lopHocPhan: classes[2],
  ),
  Student(
    maSinhVien: "18T1021012",
    tenSinhVien: "Nguyễn Anh Văn",
    chuyenNganh: "Công nghệ phần mềm",
    giangVienHuongDan: "Nguyễn Mậu Hân",
    noiThucTap: "FPT Telecom chi nhánh Huế",
    lopHocPhan: classes[2],
  ),
  Student(
    maSinhVien: "18T1021021",
    tenSinhVien: "Nguyễn Thanh Hùng",
    chuyenNganh: "Mạng máy tính",
    giangVienHuongDan: "Nguyễn Dũng",
    noiThucTap: "FPT Telecom chi nhánh Huế",
    lopHocPhan: classes[2],
  ),
  Student(
    maSinhVien: "18T1021023",
    tenSinhVien: "Đỗ Tiến Quân",
    chuyenNganh: "Khoa học máy tính",
    giangVienHuongDan: "Nguyễn Hoàng Hà",
    noiThucTap: "FPT Software Đà Nẵng",
    lopHocPhan: classes[1],
  ),
  Student(
    maSinhVien: "18T1021051",
    tenSinhVien: "Trần Hữu Cường",
    chuyenNganh: "Công nghệ phần mềm",
    giangVienHuongDan: "Nguyễn Văn Trung",
    noiThucTap: "FPT Software Đà Nẵng",
    lopHocPhan: classes[1],
  ),
  Student(
    maSinhVien: "18T1021057",
    tenSinhVien: "Trần Công Giàu",
    chuyenNganh: "Công nghệ phần mềm",
    giangVienHuongDan: "Nguyễn Mậu Hân",
    noiThucTap: "FPT Telecom chi nhánh Huế",
    lopHocPhan: classes[1],
  ),
];

// List<Student> students = [
//   Student("18T1021133", "Nguyễn Mạnh Hùng", "Công nghệ phần mềm",
//       "Nguyễn Văn Trung", "FPT Software Đà Nẵng", true),
//   Student("18T1025005", "Nguyễn Văn Công", "Công nghệ phần mềm",
//       "Trương Công Tuấn", "Công ty Phần mềm Quốc tế 3S Huế", true),
//   Student("18T1021012", "Nguyễn Anh Văn", "Công nghệ phần mềm",
//       "Nguyễn Mậu Hân", "FPT Telecom chi nhánh Huế", true),
//   Student("18T1021021", "Nguyễn Thanh Hùng", "Nguyễn Dũng", "Mạng máy tính",
//       "FPT Telecom chi nhánh Huế", true),
//   Student("18T1021023", "Đỗ Tiến Quân", "Khoa học máy tính", "Nguyễn Hoàng Hà",
//       "FPT Software Đà Nẵng", true),
//   Student("18T1021051", "Trần Hữu Cường", "Công nghệ phần mềm",
//       "Nguyễn Văn Trung", "FPT Software Đà Nẵng", true),
//   Student("18T1021057", "Trần Công Giàu", "Công nghệ phần mềm",
//       "Nguyễn Mậu Hân", "FPT Telecom chi nhánh Huế", true),
// ];
