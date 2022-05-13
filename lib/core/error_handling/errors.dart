/// The operation was not allowed by the object.
///
/// This [Error] is thrown when an instance cannot implement one of the methods
/// in its signature.
@pragma("vm:entry-point")
class PermissionDenied extends UnsupportedError {
  PermissionDenied(String message) : super(message);

  @override
  String toString() => "Permission denied: $message";
}

class FileNotFound extends Error {
  @override
  String toString() => "Không tìm thấy file!";
}
