SELECT '总量' AS NAME, COUNT(1) FROM web_url
UNION
SELECT '未访问的总量' AS NAME, COUNT(1) FROM web_url WHERE flag='0'
UNION
SELECT '访问的总量' AS NAME,COUNT(1) FROM web_url WHERE flag<>'0'
UNION
SELECT '错误访问的总量' AS NAME,COUNT(1) FROM web_url WHERE flag ='-1'
UNION
SELECT '学习网' AS NAME,COUNT(1) FROM web_url WHERE  url LIKE 'http://www.xuexi111.com%'
UNION
SELECT '未访问学习网' AS NAME,COUNT(1) FROM web_url WHERE  url LIKE 'http://www.xuexi111.com%' AND flag='0'
UNION
SELECT '迅雷下载地址' AS NAME,COUNT(1) FROM web_url WHERE  url LIKE '%ed2k:%'
UNION
SELECT '迅雷下载地址' AS NAME,COUNT(1) FROM web_url WHERE  url LIKE '%magnet:%'
UNION
SELECT '图片地址' AS NAME,COUNT(1) FROM web_url WHERE  url LIKE '%.jpg%' OR  url LIKE '%.jpeg%' OR url LIKE '%.jbmp%' OR url LIKE '%.gif%' OR url LIKE '%.png%'
UNION
SELECT 'css地址' AS NAME,COUNT(1) FROM web_url WHERE  url LIKE '%.css%' 
UNION
SELECT 'js地址' AS NAME,COUNT(1) FROM web_url WHERE  url LIKE '%.js' 
UNION
SELECT 'exe执行文件地址' AS NAME,COUNT(1) FROM web_url WHERE  url LIKE '%.exe' 
UNION
SELECT '压缩包文件地址' AS NAME,COUNT(1) FROM web_url WHERE  url LIKE '%.rar'  OR url LIKE '%.zip' 

;


SELECT * FROM web_url t
WHERE flag = '0' 
AND TYPE <> 'media'  
AND url LIKE 'http://www.xuexi111.com%'
ORDER BY update_timestimp 
LIMIT 0,1
;






