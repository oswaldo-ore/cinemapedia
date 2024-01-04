import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorsRepository = ref.watch(actorRepositoryProvider).getActorByMovieId;
  return ActorsByMovieNotifier(getActors: actorsRepository);
});
/*
  {
    '50643': <Actor>[],
    '50643': <Actor>[],
    '50643': <Actor>[],
    '50643': <Actor>[],
    '50643': <Actor>[],
  }
*/

typedef GetActorCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorCallback getActors;
  ActorsByMovieNotifier({required this.getActors}) : super({});
  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final List<Actor> actores = await getActors(movieId);
    state = {...state, movieId: actores};
  }
}
