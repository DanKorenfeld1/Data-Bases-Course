-- Find contradictions for CustomerNo -> Country
SELECT DISTINCT s1.TransactionNo, s1.ProductNo
FROM sales s1, sales s2
WHERE s1.CustomerNo = s2.CustomerNo
AND s1.Country <> s2.Country

UNION

-- Find contradictions for ProductNo -> ProductName
SELECT DISTINCT s1.TransactionNo, s1.ProductNo
FROM sales s1, sales s2
WHERE s1.ProductNo = s2.ProductNo
AND s1.ProductName <> s2.ProductName

UNION

-- Find contradictions for TransactionNo -> Date
SELECT DISTINCT s1.TransactionNo, s1.ProductNo
FROM sales s1, sales s2
WHERE s1.TransactionNo = s2.TransactionNo
AND s1.Date <> s2.Date

UNION

-- Find contradictions for TransactionNo -> CustomerNo
SELECT DISTINCT s1.TransactionNo, s1.ProductNo
FROM sales s1, sales s2
WHERE s1.TransactionNo = s2.TransactionNo
AND s1.CustomerNo <> s2.CustomerNo
ORDER BY TransactionNo, ProductNo;