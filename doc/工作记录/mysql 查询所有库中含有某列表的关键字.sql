-- 语句
SELECT   CONCAT(    'select * from ',    t.`TABLE_SCHEMA`,    '.',    t.table_name,    ' where ',    t.`COLUMN_NAME`,    '=\'关键字\';'  ) 
FROM
  information_schema.`COLUMNS` t 
WHERE t.`COLUMN_NAME` = 'title' 
  AND t.`TABLE_SCHEMA` = 'post' ;

-- 把数据库中所有表中   content=""  and    st="Y"  的数据的title和url取出来
SELECT 
 CONCAT( 'select title,url from ',a.`TABLE_SCHEMA`, '.', a.table_name,  ' where content=""  and    st="Y"  union all '  ) 
 FROM  information_schema.`COLUMNS` a 
WHERE a.`COLUMN_NAME`= 'content'
OR  a.`COLUMN_NAME`= 'st'
OR  a.`COLUMN_NAME`= 'title'
OR  a.`COLUMN_NAME`= 'url'
GROUP BY a.`TABLE_NAME`,a.`TABLE_SCHEMA`
HAVING COUNT(1)=4


-- 结果 


SELECT title,url FROM a001.neteaseblog WHERE content=""  AND    st="Y"  UNION ALL                                         
SELECT title,url FROM post.neteaseblog WHERE content=""  AND    st="Y"  UNION ALL                                         
SELECT title,url FROM a001.neteaseblog_copy WHERE content=""  AND    st="Y"  UNION ALL                                    
SELECT title,url FROM a001.post_baidu WHERE content=""  AND    st="Y"  UNION ALL                                          
SELECT title,url FROM post.post_中国青年网_3 WHERE content=""  AND    st="Y"  UNION ALL                              
SELECT title,url FROM post.post_凯迪社区_1 WHERE content=""  AND    st="Y"  UNION ALL                                 
SELECT title,url FROM post.post_凯迪社区_经信委_1 WHERE content=""  AND    st="Y"  UNION ALL                       
SELECT title,url FROM post.post_天健社区_1 WHERE content=""  AND    st="Y"  UNION ALL                                 
SELECT title,url FROM post.post_天涯论坛_3 WHERE content=""  AND    st="Y"  UNION ALL                                 
SELECT title,url FROM post.post_天涯论坛百姓声音_3 WHERE content=""  AND    st="Y"  UNION ALL                     
SELECT title,url FROM post.post_新浪微博_1 WHERE content=""  AND    st="Y"  UNION ALL                                 
SELECT title,url FROM post.post_新浪微博_经信委_1 WHERE content=""  AND    st="Y"  UNION ALL                       
SELECT title,url FROM post.post_猫扑_3 WHERE content=""  AND    st="Y"  UNION ALL                                       
SELECT title,url FROM post.post_百度贴吧_1 WHERE content=""  AND    st="Y"  UNION ALL                                 
SELECT title,url FROM post.post_百度贴吧_经信委_1 WHERE content=""  AND    st="Y"  UNION ALL                       
SELECT title,url FROM post.post_网易博客_1 WHERE content=""  AND    st="Y"  UNION ALL                                 
SELECT title,url FROM post.post_网易博客_经信委_1 WHERE content=""  AND    st="Y"  