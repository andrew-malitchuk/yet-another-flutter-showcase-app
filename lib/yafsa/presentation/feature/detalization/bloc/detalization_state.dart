import 'package:yafsa/yafsa/domain/model/book_domain_model.dart';

class DetalizationState {}

class DetalizationInitialState extends DetalizationState {}

class DetalizationLoadingState extends DetalizationState {}

class DetalizationLoadedState extends DetalizationState {
  BookDomainModel book;

  DetalizationLoadedState(this.book);
}

class DetalizationErrorState extends DetalizationState {}
