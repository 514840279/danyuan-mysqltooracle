-- 大连的地税发票只有收款方 没有付款方
-- 新疆、湖北、浙江房屋交易
select * from zhcx_invoice_union t
where t.收款方名称 like '%房%交易%'
and t.付款方名称 like '%公司%'
