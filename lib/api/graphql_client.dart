import 'package:graphql/client.dart';
import 'package:tech_x_preparation/views/company/models/company_model.dart';
import 'package:tech_x_preparation/views/spaceships/models/spaceship.dart';

class QlClient {
  //
  static late GraphQLClient _client;
  QlClient.init() {
    Link link = HttpLink("https://spacex-production.up.railway.app");
    GraphQLCache cache = GraphQLCache();

    final client = GraphQLClient(link: link, cache: cache);

    _client = client;
  }

  static Future<Company?> getCompany() async {
    String query = r""" 
              query Company {
              company {
                  ceo
                  coo
                  cto
                  cto_propulsion
                  employees
                  founded
                  founder
                  launch_sites
                  name
                  summary
                  test_sites
                  valuation
                  vehicles
              }
          }
    """;

    final QueryOptions options = QueryOptions(
      document: gql(query),
    );

    final QueryResult result = await _client.query(options);

    if (result.data?['company'] != null) {
      return Company.fromJson(result.data?['company']);
    }

    return null;
  }

  static Future<List<Spaceship>> getSpaceships(int offset) async {
    String query = """ 
        query Ships {
        ships(offset: $offset, limit: 10) {
          abs
          active
          attempted_landings
          class
          course_deg
          home_port
          id
          image
          imo
          mmsi
          model
          name
          roles
          speed_kn
          status
          successful_landings
          type
          url
          weight_kg
          weight_lbs
          year_built
            }
        }
    """;

    final QueryOptions options = QueryOptions(
      document: gql(query),
    );

    final result = await _client.query(options);
    final List ships = result.data?["ships"];
    return List.generate(
        ships.length, (index) => Spaceship.fromJson(ships[index]));
  }
}
