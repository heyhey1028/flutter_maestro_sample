enum Product {
  bunny(
    id: '001',
    name: 'bunny dash',
    description: 'hop! hop!',
    tag: 'bunny',
    price: 100000,
    imagePath: 'images/bunny_dash.png',
  ),
  coffee(
    id: '002',
    name: 'coffee dash',
    description: 'coffee! coffee!',
    tag: 'coffee',
    price: 100000,
    imagePath: 'images/coffee_dash.png',
  ),
  fire(
    id: '003',
    name: 'fire dash',
    description: 'fire! fire!',
    tag: 'fire',
    price: 100000,
    imagePath: 'images/fire_dash.png',
  ),
  guiter(
    id: '004',
    name: 'guiter dash',
    description: 'guiter! guiter!',
    tag: 'guiter',
    price: 100000,
    imagePath: 'images/guiter_dash.png',
  ),
  gym(
    id: '005',
    name: 'gym dash',
    description: 'gym! gym!',
    tag: 'gym',
    price: 100000,
    imagePath: 'images/gym_dash.png',
  ),
  pencil(
    id: '006',
    name: 'pencil dash',
    description: 'pencil! pencil!',
    tag: 'pencil',
    price: 100000,
    imagePath: 'images/pencil_dash.png',
  ),
  professor(
    id: '007',
    name: 'professor dash',
    description: 'professor! professor!',
    tag: 'professor',
    price: 100000,
    imagePath: 'images/professor_dash.png',
  ),
  superman(
    id: '008',
    name: 'superman dash',
    description: 'superman! superman!',
    tag: 'superman',
    price: 100000,
    imagePath: 'images/superman_dash.png',
  ),
  ;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.tag,
    required this.price,
    required this.imagePath,
  });

  final String id;
  final String name;
  final String description;
  final String tag;
  final int price;
  final String imagePath;
}
