# Ứng Dụng Mua Sắm (Flutter + Firebase)

## Tổng Quan

Đây là một ứng dụng mua sắm chỉ dành cho người dùng được xây dựng bằng Flutter và Firebase. Ứng dụng cung cấp trải nghiệm mua sắm liền mạch, nơi người dùng có thể duyệt sản phẩm, quản lý giỏ hàng và theo dõi đơn hàng mà


## Tính năng

### 1. Xác Thực Người Dùng

Đăng ký/đăng nhập bằng email, số điện thoại hoặc tài khoản mạng xã hội.

Xác thực bảo mật bằng Firebase Authentication.

### 2. Danh Sách & Chi Tiết Sản Phẩm

Duyệt sản phẩm theo nhiều danh mục khác nhau.

Trang chi tiết sản phẩm có hình ảnh, mô tả, thông số kỹ thuật, giá cả và đánh giá.

### 3. Giỏ Hàng

Thêm sản phẩm vào giỏ hàng.

Cập nhật số lượng hoặc xóa sản phẩm khỏi giỏ hàng.

### 4. Thanh Toán & Giao Dịch

Hỗ trợ nhiều phương thức thanh toán: thẻ tín dụng/thẻ ghi nợ, ví điện tử, UPI và thanh toán khi nhận hàng (COD).

Xử lý thanh toán an toàn bằng Firebase và các cổng thanh toán bên thứ ba.

### 5. Quản Lý Đơn Hàng

Xem lịch sử đơn hàng với ngày đặt, giá tiền và trạng thái.

Theo dõi đơn hàng với cập nhật theo thời gian thực và thời gian giao hàng ước tính.

## Công Nghệ Sử Dụng
Flutter (Dart)

Provider / Riverpod để quản lý trạng thái

Firebase Authentication (Đăng nhập & Đăng ký)

Firebase Firestore (Cơ sở dữ liệu NoSQL)

## Class Diagram
![image](https://github.com/user-attachments/assets/e3000a26-4dbe-45e6-aa67-400dd08cd683)


## Cấu trúc thư mục

```
shopping-app/
│-- lib/
│   │-- main.dart              # Điểm vào chính
│   │-- controllers/          # Quản lý logic điều khiển
│   │-- models/               # Mô hình dữ liệu
│   │-- provider/             # Quản lý trạng thái
│   │-- views/
│   │   │-- screens/          # Màn hình giao diện người dùng
│   │   │   │-- authentication_screens/  # Màn hình xác thực
│   │   │   │-- inner_screens/           # Màn hình bên trong ứng dụng
│   │   │   │-- nav_screens/             # Màn hình điều hướng chính
│   │   │   │-- main_screens.dart        # Màn hình chính
│   │-- firebase_options.dart  # Cấu hình Firebase
│-- android/                   # Tệp dành cho Android
│-- ios/                       # Tệp dành cho iOS
│-- pubspec.yaml               # Danh sách dependencies & packages
```

## Ảnh màn hình

![image](https://github.com/user-attachments/assets/47237e4c-f332-4962-aa56-8c00863d29da)

![image](https://github.com/user-attachments/assets/92af6ddd-967e-4fdf-8e16-df8ee8ce54c1)

![image](https://github.com/user-attachments/assets/d417370d-6ac0-42cc-ae65-8805a8c02e39)

![image](https://github.com/user-attachments/assets/624bf7b2-be83-499e-8df5-53eb32b803b2)

![image](https://github.com/user-attachments/assets/07337bf3-ad4a-49bf-8f8f-016c79cb5ac6)

![image](https://github.com/user-attachments/assets/b4fc8ceb-b5ff-4145-beee-96a960f0fab0)

![image](https://github.com/user-attachments/assets/7ad02713-f022-424f-86b5-0806909c601f)


