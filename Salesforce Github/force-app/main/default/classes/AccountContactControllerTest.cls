@isTest
private class AccountContactControllerTest {
    @isTest
    static void getAccountContactsReturnsEmptyListWhenNoTestDataExists() {
        // This will start the test context which will call the getAccountContacts method.
        Test.startTest();
        // This will call the getAccountContacts method and store the results in a list.
        List<Contact> results = AccountContactController.getAccountContacts();
        // This will stop the test context and return the results to the test method.
        Test.stopTest();
        // This will assert or state that the results are not null and data is returned from the controller method.
        Assert.isNotNull(results, 'The controller should always return a list.');
        // This will assert or state that the results list is empty and no data is returned from the controller method.
        Assert.isTrue(results.isEmpty(), 'The isolated test has no related contacts.');
    }
}