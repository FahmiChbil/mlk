import 'package:equatable/equatable.dart';

class User  extends Equatable{
  final String? email; 
  final String?  password ;

  User({required this.email ,required this.password}) ; 
  
  @override
  // TODO: implement props
  List<Object?> get props => [email , password]; 
}
