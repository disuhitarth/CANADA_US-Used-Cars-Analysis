-- DAB 203 PROJECT


--Sheet 2  Canada Average price vs Car Body type
SELECT Avg([carsca_clean].[price]) AS [avg_price],
       [carsca_clean].[body_type]  AS [body_type]
FROM   [dbo].[carsca_clean] [carsca_clean]
GROUP  BY [carsca_clean].[body_type]

--Sheet 1  USA Average price vs Car Body type
SELECT Avg([carus_clean].[price]) AS [avg_price],
       [carus_clean].[body_type]  AS [body_type]
FROM   [dbo].[carus_clean] [carus_clean]
GROUP  BY [carus_clean].[body_type]

--brands in usa 
SELECT TOP 20 Sum(Cast(1 AS BIGINT)) AS [cnt_carus_clean],
              [carus_clean].[brand]  AS [brand]
FROM   [dbo].[carus_clean] [carus_clean]
GROUP  BY [carus_clean].[brand]
ORDER  BY 1 DESC,
          2 ASC

--brands in canada
SELECT TOP 20 Sum(Cast(1 AS BIGINT)) AS [cnt_carca_clean],
              [carsca_clean].[brand] AS [brand]
FROM   [dbo].[carsca_clean] [carsca_clean]
GROUP  BY [carsca_clean].[brand]
ORDER  BY 1 DESC,
          2 ASC

-- state cars usa for map
SELECT Sum(Cast(1 AS BIGINT))   AS [cnt_carus_clean],
       [carus_clean].[province] AS [province]
FROM   [dbo].[carus_clean] [carus_clean]
WHERE  ( [carus_clean].[province] IN ( 'AL','AK','AZ','AR','CA','CO','CT','DE','FL',
'GA','HI','ID','IL','IN','IA','KS', 'KY','LA',
'ME','MD','MA','MI','MN','MS','MO','MT','NE',
'NV','NH','NJ','NM','NY', 'NC','ND','OH','OK',
'OR','PA','RI','SC','SD','TN','TX','UT','VT',
'VA','WA','WV', 'WI','WY' ) )
GROUP  BY [carus_clean].[province] 

-- state cars canada for map
SELECT Sum(Cast(1 AS BIGINT))   AS [cnt_carsca_clean],
       [carsca_clean].[province] AS [province]
FROM   [dbo].[carsca_clean] [carsca_clean]
WHERE  ( [carsca_clean].[province] IN ( 'AB', 'BC', 'MB', 'NB',
                                        'NL', 'NS', 'ON', 'PE',
                                        'QC', 'SK', 'YT' ) )
GROUP  BY [carsca_clean].[province] 

-- USA Car prices timeline
SELECT Avg([carus_clean].[price]) AS [avg_price],
       [carus_clean].[year]       AS [year]
FROM   [dbo].[carus_clean] [carus_clean]
GROUP  BY [carus_clean].[year]

-- CANADA Car prices timeline
SELECT Avg([carsca_clean].[price]) AS [avg_price],
       [carsca_clean].[year]       AS [year (carsca_clean)]
FROM   [dbo].[carsca_clean] [carsca_clean]
GROUP  BY [carsca_clean].[year]

-- canada price vs body type
SELECT Sum(Cast(1 AS BIGINT))      AS [cnt_carsca_clean],
       Avg([carsca_clean].[price]) AS [avg_price],
       [carsca_clean].[body_type]  AS [body_type]
FROM   [dbo].[carsca_clean] [carsca_clean]
GROUP  BY [carsca_clean].[body_type]

-- usa price vs body type
SELECT Sum(Cast(1 AS BIGINT))     AS [cnt_carus_clean],
       Avg([carus_clean].[price]) AS [avg_price],
       [carus_clean].[body_type]  AS [body_type]
FROM   [dbo].[carus_clean] [carus_clean]
GROUP  BY [carus_clean].[body_type]

-- Ford USA average price and count by model(dual chart)
SELECT Sum(Cast(1 AS BIGINT))     AS [cnt_carus_clean],
       Avg([carus_clean].[price]) AS [avg_price],
       [carus_clean].[brand]      AS [brand],
       [carus_clean].[model]      AS [model]
FROM   [dbo].[carus_clean] [carus_clean]
WHERE  ( [carus_clean].[brand] = 'Ford' )
GROUP  BY [carus_clean].[brand],
          [carus_clean].[model]

-- Ford CANADA average price and count by model(dual chart)
SELECT Sum(Cast(1 AS BIGINT))      AS [cnt_carsca_clean],
       Avg([carsca_clean].[price]) AS [avg_price (carsca_clean)],
       [carsca_clean].[brand]      AS [brand (carsca_clean)],
       [carsca_clean].[model]      AS [model (carsca_clean)]
FROM   [dbo].[carsca_clean] [carsca_clean]
WHERE  ( [carsca_clean].[brand] = 'Ford' )
GROUP  BY [carsca_clean].[brand],
          [carsca_clean].[model]

-- windsor avg price(Analysis)
SELECT Sum(Cast(1 AS BIGINT))      AS [cnt_carsca_clean],
       Avg([carsca_clean].[price]) AS [avg_price (carsca_clean)],
       [carsca_clean].[brand]      AS [brand (carsca_clean)],
       [carsca_clean].[city]       AS [city (carsca_clean)]
FROM   [dbo].[carsca_clean] [carsca_clean]
WHERE  ( [carsca_clean].[city] = 'Windsor' )
GROUP  BY [carsca_clean].[brand],
          [carsca_clean].[city]

-- windsor brands(Analysis)
SELECT Sum(Cast(1 AS BIGINT))    AS [cnt_carsca_clean],
       [carsca_clean].[province] AS [province (carsca_clean)]
FROM   [dbo].[carsca_clean] [carsca_clean]
WHERE  ( [carsca_clean].[province] IN ( 'AB', 'BC', 'MB', 'NB',
                                        'NL', 'NS', 'ON', 'PE',
                                        'QC', 'SK', 'YT' ) )
GROUP  BY [carsca_clean].[province]

SELECT TOP 32 [carsca_clean].[province] AS [province (carsca_clean)]
FROM   [dbo].[carsca_clean] [carsca_clean]
GROUP  BY [carsca_clean].[province]

-- Windsor search (Query structure for brand,model,trim and average price)
SELECT Avg([carsca_clean].[price]) AS [avg:price (carsca_clean)],
       [carsca_clean].[brand]      AS [brand (carsca_clean)],
       [carsca_clean].[model]      AS [model (carsca_clean)],
       [carsca_clean].[trim]       AS [trim (carsca_clean)]
FROM   [dbo].[carsca_clean] [carsca_clean]
WHERE  ( [carsca_clean].[city] = 'Windsor' )
GROUP  BY [carsca_clean].[brand],
          [carsca_clean].[model],
          [carsca_clean].[trim]
HAVING ( ( Avg([carsca_clean].[price]) >= 1999.99999999998 )
         AND ( Avg([carsca_clean].[price]) <= 87852.333333334202 ) )

SELECT [carsca_clean].[year] AS [year (carsca_clean)]
FROM   [dbo].[carsca_clean] [carsca_clean]
GROUP  BY [carsca_clean].[year]

-- Us search - Query for tabular data - brand,model and average price
SELECT [carus_clean].[brand] AS [brand]
FROM   [dbo].[carus_clean] [carus_clean]
GROUP  BY [carus_clean].[brand]
ORDER  BY 1 ASC

SELECT Avg([carus_clean].[price]) AS [avg_price],
       [carus_clean].[brand]      AS [brand],
       [carus_clean].[model]      AS [model]
FROM   [dbo].[carus_clean] [carus_clean]
GROUP  BY [carus_clean].[brand],
          [carus_clean].[model]

SELECT [carus_clean].[city] AS [city]
FROM   [dbo].[carus_clean] [carus_clean]
GROUP  BY [carus_clean].[city]
ORDER  BY 1 ASC

-- canada search - Query for tabular data - brand,model and average price
SELECT [carsca_clean].[brand] AS [brand]
FROM   [dbo].[carsca_clean] [carsca_clean]
GROUP  BY [carsca_clean].[brand]
ORDER  BY 1 ASC

SELECT Avg([carsca_clean].[price]) AS [avg_price],
       [carsca_clean].[brand]      AS [brand],
       [carsca_clean].[model]      AS [model]
FROM   [dbo].[carsca_clean] [carsca_clean]
GROUP  BY [carsca_clean].[brand],
          [carsca_clean].[model]

SELECT [carsca_clean].[city] AS [city]
FROM   [dbo].[carsca_clean] [carsca_clean]
GROUP  BY [carsca_clean].[city]
ORDER  BY 1 ASC

-- Car Price Range with corresponding year
SELECT ( CASE
           WHEN price < 10000 THEN 'low range'
           ELSE ( CASE
                    WHEN price >= 10000
                         AND price < 15000 THEN 'medium range'
                    ELSE 'high range'
                  END )
         END ) AS 'car_price_category_ca',
       year
FROM   [dbo].[carus_clean]

SELECT ( CASE
           WHEN price < 10000 THEN 'low range'
           ELSE ( CASE
                    WHEN price >= 10000
                         AND price < 15000 THEN 'medium range'
                    ELSE 'high range'
                  END )
         END ) AS 'car_price_category_us',
       year
FROM   [dbo].[carsca_clean]

SELECT province
FROM   [dbo].[carsca_clean]
UNION
SELECT province
FROM   [dbo].[carsca_clean]

-- Top 20 sellers in canada
SELECT TOP 20 Sum(Cast(1 AS BIGINT))       AS [cnt_carsca_clean],
              [carsca_clean].[seller_name] AS [seller_name (carsca_clean)]
FROM   [dbo].[carsca_clean] [carsca_clean]
GROUP  BY [carsca_clean].[seller_name]
ORDER  BY 1 DESC,
          2 ASC

-- Top 20 sellers in  us
SELECT TOP 20 Sum(Cast(1 AS BIGINT))      AS [cnt_carus_clean],
              [carus_clean].[seller_name] AS [seller_name]
FROM   [dbo].[carus_clean] [carus_clean]
WHERE  ( ( [carus_clean].[seller_name] >= '"123 car buying' )
         AND ( [carus_clean].[seller_name] <= 'zumbrota ford' ) )
GROUP  BY [carus_clean].[seller_name]
ORDER  BY 1 DESC,
          2 ASC 