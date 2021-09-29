import 'package:bytebank/model/contact_model.dart';
import 'package:mockito/mockito.dart';

import '../save_contact_flow.mocks.dart';

void mockFindAllContacts(MockContactDao mockContactDao) {
  when(mockContactDao.findAll())
      .thenAnswer((_) async => [ContactModel(0, 'Alex', 1000)]);
}
