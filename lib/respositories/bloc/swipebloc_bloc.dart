// ignore_for_file: avoid_print, override_on_non_overriding_member
import 'dart:async';
import 'package:dating_app/models/user.dart';
import 'package:dating_app/respositories/baseusers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'swipebloc_event.dart';
part 'swipebloc_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  final Usersdata? _baseUsersRepo;
  StreamSubscription? _usersSubscription;
  SwipeBloc({
    Usersdata? baseUsersRepo,
  })  : _baseUsersRepo = baseUsersRepo,
        super(SwipeLoading());
        
          @override
            SwipeState? get currentState => null;

  Stream<SwipeState> mapEventToState(
    SwipeEvent event,
  ) async* {
    if (event is LoadedSwipe) {
      yield* _mapLoadUsersToState();
    }
    if (event is LoadUsersEvent) {
      yield* _mapUpdateProductsToState(event);
    }
    if (event is SwipeLeftEvent) {
      yield* _mapSwipeLeftEventToState(event, state);
    }
    if (event is SwipeRightEvent) {
      yield* _mapSwipeRightEventToState(event, state);
    }
  }

  Stream<SwipeState> _mapLoadUsersToState() async* {
    _usersSubscription?.cancel();
    _usersSubscription = _baseUsersRepo?.getUsers().listen(
          (users) => add(LoadUsersEvent(users)),
        );
  }

  Stream<SwipeState> _mapUpdateProductsToState(LoadUsersEvent event) async* {
    yield SwipeLoaded(users: event.users);
  }

  Stream<SwipeState> _mapSwipeLeftEventToState(
    SwipeLeftEvent event,
    SwipeState state,
  ) async* {
    if (state is SwipeLoaded) {
      try {
        yield SwipeLoaded(users: List.from(state.users)..remove(event.user));
        if (state.users.isEmpty) {
          yield const SwipeEmpty(
            message: 'There is no more user to swipe',
          );
        }
      } catch (_) {}
    }
  }

  Stream<SwipeState> _mapSwipeRightEventToState(
    SwipeRightEvent event,
    SwipeState state,
  ) async* {
    if (state is SwipeLoaded) {
      try {
        yield SwipeLoaded(users: List.from(state.users)..remove(event.user));
        if (state.users.isEmpty) {
          yield const SwipeEmpty(
            message: 'There is no more user to swipe',
          );
        }
      } catch (_) {
        print('error');
      }
    }
  }
}
