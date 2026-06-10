MATCH (accountHolder:AccountHolder)-[]->(contactInformation)
WITH contactInformation, count(accountHolder) AS RingSize
WHERE RingSize > 1

MATCH (contactInformation)<-[]-(accountHolder)
OPTIONAL MATCH (accountHolder)-[]->(finance)

WITH contactInformation, collect(DISTINCT accountHolder.UniqueId) AS FraudRing, RingSize,
     sum(
        CASE
            WHEN finance:CreditCard THEN finance.Limit
            WHEN finance:UnsecuredLoan THEN finance.Balance
            ELSE 0
        END
     ) AS TotalFinancialRisk

RETURN FraudRing,
       labels(contactInformation) AS ContactType,
       RingSize,
       TotalFinancialRisk
ORDER BY TotalFinancialRisk DESC