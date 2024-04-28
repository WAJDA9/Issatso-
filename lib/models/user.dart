class LeaderboardDetail {
  String image;
  String name;
  String rank;
  int point;

  LeaderboardDetail({
    required this.image,
    required this.name,
    required this.rank,
    required this.point,
  });
}

List<LeaderboardDetail> userItems = [

  LeaderboardDetail(
    image: "assets/a.png",
    name: 'Oussema Ayed',
    rank: "4 ",
    point: 6432,
  ),
  LeaderboardDetail(
    image: "assets/b.png",
    name: 'Wajdi Zakhama',
    rank: "5 ",
    point: 5232,
  ),
  LeaderboardDetail(
    image: "assets/c.png",
    name: 'Rami chargui',
    rank: "6 ",
    point: 5200,
  ),
  LeaderboardDetail(
    image: "assets/d.png",
    name: 'amina said',
    rank: "7 ",
    point: 4900,
  ),
  LeaderboardDetail(
    image: "assets/f.jpeg",
    name: 'Sarra lazreg',
    rank: "8 ",
    point: 4100,
  ),
  LeaderboardDetail(
    image: "assets/h.jpeg",
    name: 'Mohamed ben salah',
    rank: "43",
    point: 2200,
  ),
];