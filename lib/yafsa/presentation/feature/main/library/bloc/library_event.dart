import 'package:equatable/equatable.dart';

class LibraryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadLibraryEvent extends LibraryEvent {
  LoadLibraryEvent();
}

class RemoveFromLibraryEvent extends LibraryEvent {
  final String bookId;

  RemoveFromLibraryEvent(this.bookId);

  @override
  List<Object?> get props => [bookId];
}
