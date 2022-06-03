import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:low_perfomace_practice/item_model.dart';

class MockRepository {
  static const _words = [
    'Каспер',
    'Аметист',
    'Радуга',
    'Нил',
    'Ракета',
    'Дар',
    'Недорозумение',
    'Меркурий',
    'Космос',
    'Сёрфер',
    'Экстренный',
    'Панда',
    'Жираф',
    'Рыбка',
    'Лягушка',
    'Слон',
  ];

  static const _imageLinks = [
    'https://cameralabs.org/media/lab18/12/26-1/Pobediteli-fotokonkursa-Dikaya-priroda-Rossii-2018_12.jpg',
    'https://cdn.unenvironment.org/styles/article_billboard_image/s3/2020-09/nature-3545314_1920.jpg?h=516575c1&amp;itok=AXjeTlsg',
    'https://motaen.com/upload/wallpapers/source/2009/07/15/11/02/3583/animals_636.jpg',
    'https://geeksspaceship.com/uploads/images/original/18/01-09/animals-foxes-7587.jpg',
    'https://shutnikov.club/wp-content/uploads/2019/11/redkie_zhivotnye_kartinki_21_15130958.jpg',
    'https://i.artfile.me/wallpaper/06-03-2011/2048x1536/zhivotnye-pandy-363706.jpg',
    'https://www.linda.nl/lindanl-assets/uploads/2018/11/22133304/Caught-in-the-Act-by-Mary-McGowan-Comedy-Wildlife-Photography-Awards-2018.jpg',
    'https://i.pinimg.com/originals/17/dd/04/17dd045387ffb89d8cc66126ed98268c.jpg',
    'https://www.nastol.com.ua/pic/201704/1920x1200/nastol.com.ua-216959.jpg',
  ];

  List<ItemModel> getItems() => List.generate(1000, _getRandomItem);

  ItemModel _getRandomItem(int index) {
    final titleIndex = Random().nextInt(_words.length);
    final subtitleIndex = Random().nextInt(_words.length);
    final imageIndex = Random().nextInt(_imageLinks.length);
    final isFavorite = ValueNotifier<bool>(false);
    return ItemModel(
      id: index,
      title: _words[titleIndex],
      subtitle: _words[subtitleIndex],
      imageLink: _imageLinks[imageIndex],
      isFavorite: isFavorite,
    );
  }
}
