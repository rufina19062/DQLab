-- Mendapatkan jumlah nilai pinalty
SELECT 
    customer_id, 
    SUM(pinalty) 
FROM invoice
GROUP BY customer_id 
HAVING SUM(pinalty) > 0

-- Mencari customer yang mengganti layanan
SELECT 
    name, 
    group_concat(t3.product_name) 
FROM 
    customer t1 
JOIN 
    subscription t2 
ON 
    t1.id = t2.customer_id 
JOIN 
    product t3 
ON 
    t2.product_id = t3.ID 
WHERE 
    t1.id IN (
	SELECT customer_id 
    FROM subscription 
    GROUP BY customer_id 
    HAVING COUNT(customer_id) > 1
)
GROUP BY name