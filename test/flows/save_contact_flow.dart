import 'package:bytebank/database/contact_dao.dart';
import 'package:bytebank/main.dart';
import 'package:bytebank/model/contact_model.dart';
import 'package:bytebank/network/webclients/transaction_webclient.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:bytebank/screens/contacts_list.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../matchers/matchers.dart';
import '../mocks/mock_calls.dart';
import 'actions.dart';
import 'save_contact_flow.mocks.dart';

@GenerateMocks([ContactDao, TransactionWebClient])
void main() {
  testWidgets('Should save a contact', (tester) async {
    final mockContactDao = MockContactDao();
    final mockTransactionWebClient = MockTransactionWebClient();
    mockFindAllContacts(mockContactDao);
    await tester.pumpWidget(BytebankApp(
      contactDao: mockContactDao,
      webClient: mockTransactionWebClient,
    ));

    final dashboard = find.byType(DashboardView);
    expect(dashboard, findsOneWidget);

    await clickOnTheTransferFeatureItem(tester);
    await tester.pumpAndSettle();

    final contactsList = find.byType(ContactsList);
    expect(contactsList, findsOneWidget);

    verify(mockContactDao.findAll()).called(1);

    await clickOnTheFabNew(tester);
    await tester.pumpAndSettle();

    final contactForm = find.byType(ContactForm);
    expect(contactForm, findsOneWidget);

    await fillTextFieldWithTextLabel(tester,
        text: 'Alex', labelText: 'Full name');

    await fillTextFieldWithTextLabel(tester,
        labelText: 'Account number', text: '1000');

    await clickOntheElevatedButtonWithText(tester, 'Create');
    await tester.pumpAndSettle();

    verify(mockContactDao.save(ContactModel(0, 'Alex', 1000)));

    final contactsListBack = find.byType(ContactsList);
    expect(contactsListBack, findsOneWidget);

    verify(mockContactDao.findAll());
  });
}
