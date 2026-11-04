public with sharing class AccountRelationshipController {
    public class RelatedRecords {
        @AuraEnabled
        public List<Contact> contacts { get; set; }

        @AuraEnabled
        public List<Opportunity> opportunities { get; set; }
    }

    @AuraEnabled(cacheable=true)
    public static RelatedRecords getRelatedRecords(Id accountId) {
        RelatedRecords result = new RelatedRecords();
        result.contacts = new List<Contact>();
        result.opportunities = new List<Opportunity>();

        if (accountId == null) {
            return result;
        }

        result.contacts = [
            SELECT Id, Name, Title, Email, Phone
            FROM Contact
            WHERE AccountId = :accountId
            WITH USER_MODE
            ORDER BY LastName, FirstName
            LIMIT 500
        ];
        result.opportunities = [
            SELECT Id, Name, StageName, CloseDate, Amount
            FROM Opportunity
            WHERE AccountId = :accountId
            WITH USER_MODE
            ORDER BY CloseDate DESC, Name
            LIMIT 500
        ];
        return result;
    }
}