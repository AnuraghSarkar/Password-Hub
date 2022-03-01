import 'package:client/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('fromJson', () {
    test(
      'GIVEN a valid user json '
      'WHEN a json deserialization is performed'
      'THEN a user model is output',
      () {
        //given
        final json = {
          '_id': '01',
          'id': '01',
          'name': 'John Doe',
          'email': 'john@gmail.com',
          'authType': 'email',
          'userId': '01',
          'createdDate': DateTime.now().toString(),
          'avatar': 'abc.jpg',
          'status': 'active',
          '__v': 1
        };

        //when
        final actual = User.fromJson(json);
        var matcher = User(
            id: '01',
            name: 'John Doe',
            email: 'john@gmail.com',
            authType: 'email',
            userId: '01',
            createdDate: DateTime.now(),
            avatar: 'abc.jpg',
            status: 'active',
            v: 1);

        //then
        expect(actual.toString(), matcher.toString());
      },
    );
  });

  group('toJson', () {
    test(
      'GIVEN a user model with user id '
      'WHEN a json serialization is performed '
      'THEN a user json with user id is output',
      () {
        //given
        var user = User(
          status: 'active',
          avatar: 'abc.jpg',
          authType: 'email',
          createdDate: DateTime.parse('2020-01-02'),
          id: '01',
          email: 'john@gmail.com',
          name: 'John Doe',
          v: 1,
          userId: '01',
        );

        //when
        final actual = user.toJson();
        final matcher = {
          'status': 'active',
          'avatar': 'abc.jpg',
          'authType': 'email',
          'createdDate': DateTime.parse('2020-01-02').toIso8601String(),
          '_id': '01',
          'name': 'John Doe',
          'email': 'john@gmail.com',
          '__v': 1,
          'id': '01',
        };

        //then
        expect(actual.toString(), matcher.toString());
      },
    );

    test(
      'GIVEN a user model with user id '
      "AND it's user id is null "
      'WHEN a json serialization is performed '
      'THEN a user json is output '
      "AND it doesn't contain a user_id key",
      () {
        //given
        var user = User(
          status: 'active',
          avatar: 'abc.jpg',
          authType: 'email',
          createdDate: DateTime.parse('2020-01-02'),
          id: 'null',
          email: 'john@gmail.com',
          name: 'John Doe',
          v: 1,
          userId: 'null',
        );

        //when
        final actual = user.toJson();
        final matcher = {
          'status': 'active',
          'avatar': 'abc.jpg',
          'authType': 'email',
          'createdDate': DateTime.parse('2020-01-02').toIso8601String(),
          '_id': 'null',
          'name': 'John Doe',
          'email': 'john@gmail.com',
          '__v': 1,
          'id': 'null',
        };

        //then
        expect(actual.toString(), matcher.toString());
      },
    );
  });

  group('equality', () {
    test(
      'GIVEN two user models '
      'WHEN properties are different '
      'THEN equality returns false',
      () {
        //given
        var user1 = User(
          status: 'inactive',
          avatar: 'xyz.jpg',
          authType: 'email',
          createdDate: DateTime.parse('2020-11-02'),
          id: '02',
          email: 'john@com',
          name: 'Example',
          v: 2,
          userId: '02',
        );

        //when
        var user2 = User(
          status: 'active',
          avatar: 'abc.jpg',
          authType: 'email',
          createdDate: DateTime.parse('2020-01-02'),
          id: '01',
          email: 'johdsfdsfn@gmail.com',
          name: 'John Doe',
          v: 1,
          userId: '01',
        );

        //then
        expect(user1 == user2, false);
      },
    );

    test(
      'GIVEN two user models '
      'WHEN properties are same '
      'THEN equality returns true',
      () {
        //given
        var user1 = User(
            id: '02',
            name: 'John Don',
            email: 'johndon@gmail.com',
            authType: 'email',
            userId: '02',
            createdDate: DateTime.now(),
            avatar: 'abcd.jpg',
            status: 'active',
            v: 2);

        var user2 = User(
            id: '02',
            name: 'John Don',
            email: 'johndon@gmail.com',
            authType: 'email',
            userId: '02',
            createdDate: DateTime.now(),
            avatar: 'abcd.jpg',
            status: 'active',
            v: 2);
        //then
        expect(user1.toString() == user2.toString(), true);
      },
    );
  });
}
