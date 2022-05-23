abstract class UseCase<Type, Prams>{
  Future<Type> call(Prams prams);
}

class NoPrams{

}
