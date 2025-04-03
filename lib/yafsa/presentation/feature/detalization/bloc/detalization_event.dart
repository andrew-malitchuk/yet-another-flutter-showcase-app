import 'package:equatable/equatable.dart';
import 'package:yafsa/yafsa/domain/model/book_domain_model.dart';

class DetalizationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadDetailsEvent extends DetalizationEvent {
  final int id;

  LoadDetailsEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class ToggleDetailsEvent extends DetalizationEvent {
  final BookDomainModel bookDomainModel;

  ToggleDetailsEvent(this.bookDomainModel);

  @override
  List<Object?> get props => [bookDomainModel];
}
