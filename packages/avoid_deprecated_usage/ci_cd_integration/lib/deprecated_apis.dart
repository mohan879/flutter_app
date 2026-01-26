@deprecated
class OldService {
  void execute() {}
}

@Deprecated('Use NewRepository instead')
class OldRepository {
  List<String> getAll() => [];
}
