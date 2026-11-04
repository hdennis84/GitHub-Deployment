public with sharing class AccountContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getAccountContacts() {
        return [
            SELECT Id, Name, AccountId, Account.Name, Title, Email, Phone
            FROM Contact
            WHERE AccountId != null
            WITH USER_MODE
            ORDER BY Account.Name, Name
            LIMIT 2000
        ];
    }
}