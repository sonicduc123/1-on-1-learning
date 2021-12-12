import 'dart:ffi';

class TutorDTO {
  final String id;
  final String name;
  final List<String> specialities;
  final int rating;

  TutorDTO(this.id, this.name, this.specialities, this.rating);
}
