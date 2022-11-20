import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../../models/product.dart';

class ProductsManager with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Sách nấu ăn',
      description: 'Giúp bạn nấu những món ăn ngon',
      price: 300.00,
      imageUrl:
          'https://sachhoc.com/image/catalog/cook/120-mon-an-ngon-viet-nam.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p2',
      title: 'Sách học tiếng anh',
      description: 'Học tiếng anh một cách dễ dàng hơn đối với mỗi người',
      price: 500.00,
      imageUrl:
          'https://sach.info/wp-content/uploads/2022/11/2021_06_11_13_46_21_1-390x510-1.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Sách học cắm hoa',
      description: 'Giúp bạn cắm hoa đẹp hơn',
      price: 100.00,
      imageUrl:
          'https://daycamhoa.net/upload/hinhanh/thumb/top-7-sach-day-cam-hoa-nghe-thuat-hay-va-ban-chay-nhat-hien-nay199.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Truyện tranh',
      description: 'Đọc truyện giải trí',
      price: 49.99,
      imageUrl:
          'https://bookbuy.vn/Res/Images/Product/doraemon-tranh-truyen-mau-nam-2112-doraemon-ra-doi-tai-ban-2019-_102786_1.jpg',
      isFavorite: true,
    ),
  ];

  int get itemCount {
    return _items.length;
  }

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Product product) {
    _items.add(
      product.copyWith(
        id: 'p${DateTime.now().toIso8601String()}',
      ),
    );
    notifyListeners();
  }

  void updateProduct(Product product) {
    final index = _items.indexWhere((item) => item.id == product.id);
    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }

  void togglefavoriteStatus(Product product) {
    final savedStatus = product.isFavorite;
    product.isFavorite = !savedStatus;
  }

  void deleteProduct(String id) {
    final index = _items.indexWhere((item) => item.id == id);
    _items.removeAt(index);
    notifyListeners();
  }
}
