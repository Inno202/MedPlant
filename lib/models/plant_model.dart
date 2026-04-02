class PlantModel {
  final String name;
  final String? scientificName;
  final String imageUrl;

  final String? description;
  final String? medicinalUses;
  final String? commonName;
  final String? localName;
  final String? family;
  final String? genus;
  final String? partsUsed;
  final String? speciesId;

  PlantModel({
    required this.name,
    this.scientificName,
    required this.imageUrl,
     this.description,
     this.medicinalUses,
     this.commonName,
     this.localName,
     this.family,
     this.genus,
     this.partsUsed,
     this.speciesId,
  });
}