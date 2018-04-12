/*ÎÞÐ§


GRANT CONNECT,RESOURCE, CREATE PROCEDURE TO wth;
grant EXECUTE on dbms_crypto to wth;
--conn wth/wth

CREATE OR REPLACE FUNCTION gnuhash_sha256 (string IN VARCHAR2) RETURN VARCHAR2 AS  LANGUAGE JAVA NAME 'SHA256.calcHash(java.lang.String) return java.lang.String';


CREATE OR REPLACE FUNCTION gnuhash_sha512 (string IN VARCHAR2) RETURN VARCHAR2 AS LANGUAGE JAVA NAME 'SHA512.calcHash(java.lang.String) return java.lang.String';


 CREATE OR REPLACE FUNCTION gnuhash_sha1 (string IN VARCHAR2) RETURN VARCHAR2 AS LANGUAGE JAVA NAME 'SHA1.calcHash(java.lang.String) return java.lang.String';



select gnuhash_sha1('1234') from dual;

GNUHASH_SHA1('1234')
--------------------------------------------------------------------------------
7110eda4d09e062aa5e4a390b0a572ac0d2c0220

SQL> select gnuhash_sha256('1234') from dual;

GNUHASH_SHA256('1234')
--------------------------------------------------------------------------------
03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4

SQL> select gnuhash_sha512('1234') from dual;

GNUHASH_SHA512('1234')
--------------------------------------------------------------------------------
d404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db
