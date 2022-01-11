typedef FavoriteCallback = void Function();

class DetailTutorArgument {
  final String tutorId;
  final FavoriteCallback callback;
  DetailTutorArgument(this.tutorId, this.callback);
}