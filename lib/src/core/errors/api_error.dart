class ApiError implements Exception {
  final String message;
  ApiError({required this.message});
}
