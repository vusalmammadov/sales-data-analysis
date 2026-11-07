-- Sifarişlərin sayı
SELECT COUNT(*) AS sifaris_sayi FROM orders;

-- Kateqoriya üzrə satış və mənfəət
SELECT p.category, ROUND(SUM(i.quantity*i.unit_price*(1-i.discount)),2) AS revenue, ROUND(SUM(i.quantity*(i.unit_price*(1-i.discount)-i.unit_cost)),2) AS profit FROM order_items i JOIN products p ON p.product_id=i.product_id GROUP BY p.category ORDER BY profit DESC;

-- Aylar üzrə satış
SELECT substr(o.order_date,1,7) AS month, ROUND(SUM(i.quantity*i.unit_price*(1-i.discount)),2) AS revenue, ROUND(SUM(i.quantity*(i.unit_price*(1-i.discount)-i.unit_cost)),2) AS profit FROM orders o JOIN order_items i ON o.order_id=i.order_id GROUP BY month ORDER BY month;

-- Endirim qrupları
SELECT i.discount, SUM(i.quantity) AS units, ROUND(SUM(i.quantity*(i.unit_price*(1-i.discount)-i.unit_cost)),2) AS profit, ROUND(SUM(i.quantity*(i.unit_price*(1-i.discount)-i.unit_cost))/SUM(i.quantity),2) AS profit_per_unit FROM order_items i GROUP BY i.discount ORDER BY i.discount;