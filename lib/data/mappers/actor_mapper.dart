import 'package:cinema_app/data/models/credits_response.dart';
import 'package:cinema_app/domain/models/actor.dart';

class ActorMapper {
  static Actor castToDomainModel(Cast cast) => Actor(
    id: cast.id,
    name: cast.name,
    profilePath: cast.profilePath != null
        ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
        : 'https://st3.depositphotos.com/4111759/13425/v/600/depositphotos_134255710-stock-illustration-avatar-vector-male-profile-gray.jpg',
    character: cast.character,
  );
}
