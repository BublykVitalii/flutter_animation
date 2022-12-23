import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_animation/infrastructure/theme/app_images.dart';

import 'package:flutter_animation/screens/dji_shop/domain/product.dart';
import 'package:flutter_animation/screens/dji_shop/domain/product_repository.dart';

@Singleton(as: ProductRepository)
class MockRepository implements ProductRepository {
  final productList = <Product>[
    Product(
      productName: 'Mini 3 pro',
      description:
          'Мініатюрний та дуже вправний DJI Mini 3 Pro настільки ж потужний, як та портативний. Завдяки меншій за 249 г масі він не лише відповідає безпековим нормам більшості регуляторів, а й насправді є найбезпечнішим коптером серії. 1/1,3-дюймовий сенсор та першокласні функції одразу нагадають, як це — літати на Mini.',
      price: '40 000',
      id: 1,
      imageProduct: [
        AppImages.djiMini3Pro,
        AppImages.djiMini3Pro1,
        AppImages.djiMini3Pro2,
        AppImages.djiMini3Pro3,
        AppImages.djiMini3Pro4,
      ],
    ),
    Product(
      productName: 'FPV',
      description:
          'Таким FPV ви ще не бачили Аеродинамічно-обтічний коптер DJI FPV спроектовано для мінімального спротиву повітрю. Потужна тяга й тривалий час польоту на одному заряді акумулятора роблять FPV не лише привабливим естетично, а й неймовірно ефективним.',
      price: '59 200',
      id: 2,
      imageProduct: [
        AppImages.djiFpv,
        AppImages.djiFpv1,
        AppImages.djiFpv2,
        AppImages.djiFpv3,
        AppImages.djiFpv4,
        AppImages.djiFpv5,
      ],
    ),
    Product(
      productName: 'Phantom 4 RTK',
      description:
          'Компанія DJI переосмислила технології безпілотників із нуля для досягнення нового стандарту, запропонувавши користувачам Phantom 4 RTK дані сантиметрової точності, вимагаючи менше наземних контрольних точок.Сантиметрова система позиціонування Новий RTK-модуль інтегрований безпосередньо в Phantom 4 RTK для позиціонування в реальному часі з сантиметровою точністю. Безпосередньо під RTK-приймачем розташовується резервний модуль GNSS для підтримки стабільності польоту в районах із низьким рівнем сигналу, таких як карєри чи щільно забудовані міста.',
      price: '336 980',
      id: 3,
      imageProduct: [
        AppImages.djiPhantom4Rtk0,
        AppImages.djiPhantom4Rtk1,
        AppImages.djiPhantom4Rtk2,
        AppImages.djiPhantom4Rtk3,
        AppImages.djiPhantom4Rtk4,
        AppImages.djiPhantom4Rtk5,
      ],
    ),
    Product(
      productName: 'Air 2s',
      description:
          'Мільярд кольорів. Пориньте в море відтінків. 10-бітний профіль Dlog-M дає змогу зафіксувати до мільярда відтінків, зберігаючи дрібні деталі, які роблять кадри ще яскравішими.',
      price: '53 440',
      id: 4,
      imageProduct: [
        AppImages.djiAir2S,
        AppImages.djiAir2S1,
        AppImages.djiAir2S2,
        AppImages.djiAir2S3,
        AppImages.djiAir2S4,
      ],
    ),
    Product(
      productName: 'Matrice 30',
      description:
          'MATRICE 30 Потужність в портативност.Унікальний авіаційний інтелект для зйомок без межі.',
      price: '681 000',
      id: 5,
      imageProduct: [
        AppImages.djiMatrice30_1,
        AppImages.djiMatrice30_2,
        AppImages.djiMatrice30_3,
        AppImages.djiMatrice30_4,
        AppImages.djiMatrice30_5,
      ],
    ),
    Product(
      productName: 'Matrice 300 RTK',
      description:
          'Matrice 300 RTK — новий стандарт індустрії комерційних коптерів, що черпає натхнення в технологіях сучасної авіації. Поєднуючи інтелектуальні функції штучного інтелекту з високою продуктивністю та неперевершеною надійністю, Matrice 300 RTK може виконувати місії з картографування та промислової інспекції тривалістю до 55 хвилин.',
      price: '880 000',
      id: 6,
      imageProduct: [
        AppImages.djiMatrice300Rtk_1,
        AppImages.djiMatrice300Rtk_2,
        AppImages.djiMatrice300Rtk_3,
        AppImages.djiMatrice300Rtk_4,
        AppImages.djiMatrice300Rtk_5,
        AppImages.djiMatrice300Rtk_6,
      ],
    ),
  ];

  @override
  Future<Product> getProduct(int id) async {
    try {
      final productBiId = productList.elementAt(id);
      return productBiId;
    } on DioError catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<Product>> getProducts() async {
    try {
      final products = productList;
      return products;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
