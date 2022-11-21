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
  Department('Công nghệ thông tin'),
  Department('Điện tử viễn thông'),
  Department('Báo chí'),
  Department('Công nghệ sinh học'),
  Department('Toán kinh tế')
];

List<Classroom> classes = [
  Classroom('Thực tập chuyên ngành cuối khoá - Nhóm 1', 10, departments[1],
      teachers[0]),
  Classroom('Thực tập chuyên ngành cuối khoá - Nhóm 2', 10, departments[1],
      teachers[1]),
  Classroom('Thực tập chuyên ngành cuối khoá - Nhóm 3', 10, departments[1],
      teachers[2]),
  Classroom('Thực tập chuyên ngành cuối khoá - Nhóm 4', 10, departments[1],
      teachers[3]),
  Classroom('Thực tập chuyên ngành cuối khoá - Nhóm 5', 10, departments[1],
      teachers[4]),
  Classroom('Thực tập chuyên ngành cuối khoá - Nhóm 6', 10, departments[1],
      teachers[5]),
  Classroom('Thực tập chuyên ngành cuối khoá - Nhóm 7', 10, departments[1],
      teachers[6]),
  Classroom('Thực tập chuyên ngành cuối khoá - Nhóm 8', 10, departments[1],
      teachers[7]),
  Classroom('Thực tập chuyên ngành cuối khoá - Nhóm 9', 10, departments[1],
      teachers[8]),
  Classroom('Thực tập chuyên ngành cuối khoá - Nhóm 10', 10, departments[1],
      teachers[9]),
];

List<Major> majors = [
  Major('Mạng máy tính', departments[1]),
  Major('Khoa học máy tính', departments[1]),
  Major('Công nghệ phần mềm', departments[1]),
  Major('Điện tử', departments[2])
];

List<Teacher> teachers = [
  Teacher("Nguyễn Mậu Hân"),
  Teacher("Nguyễn Dũng"),
  Teacher("Nguyễn Hoàng Hà"),
  Teacher("Trần Nguyên Phong"),
  Teacher("Nguyễn Ngọc Thuỷ"),
  Teacher("Lê Nguyễn Thủy Nhi"),
  Teacher("Nguyễn Quang Hưng"),
  Teacher("Trần Việt Khoa"),
  Teacher("Nguyễn Văn Trung"),
  Teacher("Trương công Tuấn"),
  Teacher("Nguyễn Đăng Bình"),
];

List<Company> companies = [
  Company("Viễn thông Thừa Thiên Huế"),
  Company("FPT Telecom chi nhánh Huế"),
  Company("Công ty Cổ phần Trực tuyến GOSU"),
  Company("FPT Software Đà Nẵng"),
  Company("Công ty TNHH Kỹ Thuật Phần mềm Pi"),
  Company("Công ty Phần mềm Quốc tế 3S Huế"),
  Company("Công ty Enclave Việt Nam"),
  Company("THỰC TẬP TẠI TRƯỜNG"),
  Company("Công ty TNHH GENEAT"),
];

List<Student> students = [
  Student("18T1021133", "Nguyễn Mạnh Hùng", "Công nghệ phần mềm",
      "Nguyễn Văn Trung", "FPT Software Đà Nẵng", classes[1], true),
  Student("18T1025005", "Nguyễn Văn Công", "Công nghệ phần mềm",
      "Trương Công Tuấn", "Công ty Phần mềm Quốc tế 3S Huế", classes[2], true),
  Student("18T1021012", "Nguyễn Anh Văn", "Công nghệ phần mềm",
      "Nguyễn Mậu Hân", "FPT Telecom chi nhánh Huế", classes[2], true),
  Student("18T1021021", "Nguyễn Thanh Hùng", "Nguyễn Dũng", "Mạng máy tính",
      "FPT Telecom chi nhánh Huế", classes[2], true),
  Student("18T1021023", "Đỗ Tiến Quân", "Khoa học máy tính", "Nguyễn Hoàng Hà",
      "FPT Software Đà Nẵng", classes[1], true),
  Student("18T1021051", "Trần Hữu Cường", "Công nghệ phần mềm",
      "Nguyễn Văn Trung", "FPT Software Đà Nẵng", classes[1], true),
  Student("18T1021057", "Trần Công Giàu", "Công nghệ phần mềm",
      "Nguyễn Mậu Hân", "FPT Telecom chi nhánh Huế", classes[1], true),
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
