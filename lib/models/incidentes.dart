class Incidente {
  final int id;
  final String title;
  final String description;
  final double latitude;
  final double longitude;

  Incidente(
      {this.id, this.title, this.description, this.latitude, this.longitude});
}

List<Incidente> incidentes = [
  Incidente(
    id: 1,
    title: "Incidente 1",
    description: "Descriçao de ajuda 1",
    latitude: 1,
    longitude: 1,
  ),
  Incidente(
    id: 2,
    title: "Incidente 2",
    description: "Descriçao de ajuda 2",
    latitude: 1,
    longitude: 1,
  ),
  Incidente(
    id: 3,
    title: "Incidente 3",
    description: "Descriçao de ajuda 3",
    latitude: 1,
    longitude: 1,
  ),
];
