import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDatasource datasource;
  ActorRepositoryImpl({required this.datasource});

  @override
  Future<List<Actor>> getActorByMovieId(String movieId) {
    return datasource.getActorByMovieId(movieId);
  }
}
