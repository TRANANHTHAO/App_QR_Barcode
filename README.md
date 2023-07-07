# Ứng Dụng Quét Mã Vạch
Quét mã vạch là ứng dụng di động được xây dựng trên nền tảng Android, bằng ngôn ngữ lập trình Dart kết hợp với Framework Flutter. Ứng dụng dựa trên cơ chế sử dụng của điện thoại để quét mã vạch hoặc mã QR trên bao bì sản phẩm. Được xây dựng một số tính năng như đăng ký, đăng nhập, đọc dữ liệu từ API để cung cấp và hiển thị thông tin trên trang chi tiết sản sản phẩm, đồng thời những mã đã quét sẽ lưu vào trang lịch sử và cho phép xóa lịch sử đã quét.
# Hình Ảnh Demo
 <img src="https://github.com/TRANANHTHAO/App_QR_Barcode/assets/103154241/d89c3de2-ccc3-47b1-9b03-498ef9aaf801" width="200">
 <br/>
 <img src="https://github.com/TRANANHTHAO/App_QR_Barcode/assets/103154241/33bed845-f0ce-4efd-bb4f-a401d549a82e" width="200">
  <br/>
  <img src="https://github.com/TRANANHTHAO/App_QR_Barcode/assets/103154241/6019672d-53ee-4e1b-87e3-821c80263583" width="200">
   <br/>
   <img src="https://github.com/TRANANHTHAO/App_QR_Barcode/assets/103154241/546adce5-e453-4c5c-a073-facac9b65928" width="200">
    <br/>
    <img src="https://github.com/TRANANHTHAO/App_QR_Barcode/assets/103154241/239465c2-b8a4-481a-9e73-e5dccbe750be" width="200">
     <br/>
    <img src="https://github.com/TRANANHTHAO/App_QR_Barcode/assets/103154241/240bce13-208b-4f50-b640-1ba182641693" width="200">
     <br/>
 <img src="https://github.com/TRANANHTHAO/App_QR_Barcode/assets/103154241/8dedae36-dc70-4bc2-b7e8-99bf6f5c8b0b" width="200">
### Yêu cầu
Trước khi bắt đầu, hãy đảm bảo máy tính của bạn đã cài đặt các phần mềm sau:

- Flutter SDK: [Cài đặt Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: [Cài đặt Dart](https://dart.dev/get-dart)
- Android Studio: [Cài đặt Android Studio](https://developer.android.com/studio)

### Cài đặt Flutter

#### Windows
1. Tải Flutter SDK từ trang web chính thức của Flutter.
2. Giải nén gói tải về vào một vị trí mong muốn trên máy tính.
3. Mở `Control Panel` và tìm kiếm `Environment Variables`.
4. Nhấp vào `Edit the system environment variables`.
5. Nhấp vào `Environment Variables` và tìm biến `Path` trong phần `System variables`. Nhấp vào `Edit`.
6. Nhấp vào `New` và thêm đường dẫn tới thư mục `bin` của Flutter (ví dụ: `C:\path\to\flutter\bin`).
7. Nhấp vào `OK` để lưu các thay đổi và đóng cửa sổ `Environment Variables`.
8. Khởi động lại máy tính.
9. Xác nhận Flutter đã được cài đặt chính xác:
   ```shell
   flutter doctor
   ```
   Lệnh này sẽ kiểm tra môi trường của bạn và hiển thị một báo cáo. Hãy đảm bảo tất cả các phụ thuộc cần thiết đã được cài đặt và không có vấn đề nào được báo cáo.

#### macOS
1. Tải Flutter SDK từ trang web chính thức của Flutter.
2. Giải nén gói tải về vào một vị trí mong muốn trên máy tính.
3. Mở Terminal và chạy lệnh sau để mở tệp ~/.bash_profile:
     ```shell
    open -e ~/.bash_profile  
    ```
4. Thêm dòng sau vào cuối tệp và lưu lại:
    ```shell
    export PATH="$PATH:/path/to/flutter/bin"
    ```
   (Thay thế /path/to/flutter bằng đường dẫn tới thư mục bin của Flutter trên máy tính của bạn).
5. Đóng và mở lại Terminal để cập nhật biến môi trường.
6. Xác nhận Flutter đã được cài đặt chính xác:
      ```shell
   flutter doctor
   ```
   Lệnh này sẽ kiểm tra môi trường của bạn và hiển thị một báo cáo. Hãy đảm bảo tất cả các phụ thuộc cần thiết đã được cài đặt và không có vấn đề nào được báo cáo.

### Cài đặt Android Studio
#### Windows
1. Tải về và cài đặt Android Studio từ trang web chính thức của Android Studio.
2. Khởi chạy Android Studio và làm theo trình hướng dẫn để hoàn tất cài đặt.
3. Mở Android Studio và điều hướng đến File > Settings.
4. Điều hướng đến Appearance & Behavior > System Settings > Android SDK.
5. Chọn tab SDK Platforms và chọn các phiên bản Android mà bạn muốn nhắm mục tiêu với ứng dụng Flutter của mình.
6. Chọn tab SDK Tools và kiểm tra các tùy chọn sau:
* Android SDK Build-Tools
* Android Emulator
* Android SDK Platform-Tools
* Nhấp vào Apply để cài đặt các thành phần đã chọn.
7. Nhấp vào Apply để cài đặt các thành phần đã chọn.

#### macOS
1. Tải về và cài đặt Android Studio từ trang web chính thức của Android Studio.
2. Khởi chạy Android Studio và làm theo trình hướng dẫn để hoàn tất cài đặt.
3. Mở Android Studio và điều hướng đến Preferences.
4. Điều hướng đến Appearance & Behavior > System Settings > Android SDK.=
5. Chọn tab SDK Platforms và chọn các phiên bản Android mà bạn muốn nhắm mục tiêu với ứng dụng Flutter của mình.
6. Chọn tab SDK Tools và kiểm tra các tùy chọn sau:
* Android SDK Build-Tools
* Android Emulator
* Android SDK Platform-Tools
7. Nhấp vào Apply để cài đặt các thành phần đã chọn.

### Cài đặt máy ảo trên Android Studio
#### Android
Để chạy ứng dụng trên máy ảo Android, làm theo các bước sau:
1. Mở Android Studio và điều hướng đến AVD Manager từ thanh công cụ hoặc đi đến Tools > AVD Manager.
2. Nhấp vào Create Virtual Device và chọn một định nghĩa thiết bị.
3. Chọn một hình ảnh hệ điều hành cho máy ảo (ví dụ: Android 12) và nhấp vào Next.=
4. Chọn một hình ảnh máy ảo và nhấp vào "Next".
5. Đặt tên cho máy ảo của bạn và nhấp vào "Finish" để hoàn tất quá trình tạo máy ảo.

#### macOS
1. Mở Android Studio và chọn "Configure" trên thanh công cụ.
2. Chọn "AVD Manager" để mở Android Virtual Device (AVD) Manager.
3. Nhấn nút "Create Virtual Device" để tạo máy ảo Android mới.
4. Chọn loại thiết bị và phiên bản hệ điều hành Android mà bạn muốn sử dụng trên máy ảo.
5. Tiếp tục với các cài đặt tùy chọn và nhấn "Finish" để tạo máy ảo.

### Chạy dự án quét mã vạch trên máy ảo
1. Mở một cửa sổ dòng lệnh và di chuyển đến thư mục mà bạn muốn lưu trữ dự án Flutter của mình.
2. Chạy lệnh sau để clone dự án từ GitHub:
   ```shell
   git clone <URL dự án GitHub của bạn>
   ```
3. Di chuyển vào thư mục dự án mới được tạo:
    ```shell
    cd <tên thư mục>
    ```
4. Chạy lệnh flutter pub get để tải xuống các phụ thuộc của dự án.
5. Chạy lệnh flutter run hoặc button ''run'' để chạy ứng dụng Flutter trên máy ảo Android hoặc iOS. Lựa chọn máy ảo mà bạn đã tạo từ AVD Manager (đối với Android) hoặc Simulator (đối với iOS).
