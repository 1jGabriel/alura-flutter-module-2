import 'package:mockito/mockito.dart';

import '../save_contact_flow.mocks.dart';

void mockFindAllContacts(MockContactDao mockContactDao) {
  when(mockContactDao.findAll()).thenAnswer((_) async => []);
}
