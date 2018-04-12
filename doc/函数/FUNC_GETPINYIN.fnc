CREATE OR REPLACE FUNCTION FUNC_GETPINYIN(P_STR IN VARCHAR2,
                                          P_FLAG NUMBER DEFAULT NULL)
RETURN VARCHAR2
AS
    V_COMPARE VARCHAR2 (4);
    V_PINYIN  VARCHAR2 (10);
    V_RETURN  VARCHAR2 (4000);
    V_LENGTH  INT := 0;
    V_SUBSTR  VARCHAR2 (4);
    FUNCTION FUNC_NLSSORT(P_WORD IN VARCHAR2) RETURN VARCHAR2 AS
    BEGIN
        RETURN SUBSTR(NLSSORT(P_WORD, 'NLS_SORT=SCHINESE_PINYIN_M'), 1, 4);
    END FUNC_NLSSORT;
BEGIN
    IF P_STR IS NULL THEN
        RETURN NULL;
    END IF;

    -- 取得汉字的长度
    V_LENGTH := LENGTH (P_STR);

    --P_FLAG为1简拼小写，P_FLAG为2简拼大写，P_FLAG为3全拼小写，P_FLAG为4全拼首字母大写，P_FLAG为其它全拼大写
    IF P_FLAG = 1 OR P_FLAG = 2
    THEN
        FOR I IN 1 .. V_LENGTH
        LOOP
            V_SUBSTR := SUBSTR (P_STR, I, 1);
            V_COMPARE := FUNC_NLSSORT(V_SUBSTR);
            CASE
                WHEN V_COMPARE BETWEEN '3B29' AND '3C82'
                THEN
                    V_PINYIN := 'A';
                WHEN V_COMPARE BETWEEN '3C84' AND '427C'
                THEN
                    V_PINYIN := 'B';
                WHEN V_COMPARE BETWEEN '427D' AND '4BA9'
                THEN
                    V_PINYIN := 'C';
                WHEN V_COMPARE BETWEEN '4BAD' AND '5200'
                THEN
                    V_PINYIN := 'D';
                WHEN V_COMPARE BETWEEN '5205' AND '5332'
                THEN
                    V_PINYIN := 'E';
                WHEN V_COMPARE BETWEEN '5334' AND '5739'
                THEN
                    V_PINYIN := 'F';
                WHEN V_COMPARE BETWEEN '573C' AND '5CB6'
                THEN
                    V_PINYIN := 'G';
                WHEN V_COMPARE BETWEEN '5CB8' AND '63FA'
                THEN
                    V_PINYIN := 'H';
                WHEN V_COMPARE = 'B359'
                THEN
                    V_PINYIN := 'I';
                WHEN V_COMPARE BETWEEN '63FE' AND '6E85'
                THEN
                    V_PINYIN := 'J';
                WHEN V_COMPARE BETWEEN '5BC8' AND '7226'
                THEN
                    V_PINYIN := 'K';
                WHEN V_COMPARE BETWEEN '722C' AND '7C98'
                THEN
                    V_PINYIN := 'L';
                WHEN V_COMPARE BETWEEN '569D' AND '821E'
                THEN
                    V_PINYIN := 'M';
                WHEN V_COMPARE BETWEEN '8224' AND '8574'
                THEN
                    V_PINYIN := 'N';
                WHEN V_COMPARE BETWEEN '8575' AND '85AE'
                THEN
                    V_PINYIN := 'O';
                WHEN V_COMPARE BETWEEN '85B1' AND '89C4'
                THEN
                    V_PINYIN := 'P';
                WHEN V_COMPARE BETWEEN '7E0C' AND '90AA'
                THEN
                    V_PINYIN := 'Q';
                WHEN V_COMPARE BETWEEN '90B0' AND '92E4'
                THEN
                    V_PINYIN := 'R';
                WHEN V_COMPARE BETWEEN '92E5' AND '9BA9'
                THEN
                    V_PINYIN := 'S';
                WHEN V_COMPARE BETWEEN '5160' AND 'A1AE'
                THEN
                    V_PINYIN := 'T';
                WHEN V_COMPARE BETWEEN '9AF0' AND 'A5D4'
                THEN
                    V_PINYIN := 'W';
                WHEN V_COMPARE BETWEEN 'A5D6' AND 'AF1E'
                THEN
                    V_PINYIN := 'X';
                WHEN V_COMPARE BETWEEN 'AF20' AND 'BC58'
                THEN
                    V_PINYIN := 'Y';
                WHEN V_COMPARE BETWEEN 'BC59' AND 'C7B4'
                THEN
                    V_PINYIN := 'Z';
                ELSE
                    V_PINYIN := V_SUBSTR;
            END CASE;
            V_RETURN := V_RETURN || V_PINYIN;
        END LOOP;
        IF P_FLAG = 1
        THEN
            V_RETURN := LOWER(V_RETURN);
        ELSE
            V_RETURN := V_RETURN;
        END IF;
    ELSE
        FOR I IN 1 .. V_LENGTH
        LOOP
            V_SUBSTR := SUBSTR (P_STR, I, 1);
            V_COMPARE := FUNC_NLSSORT (V_SUBSTR);
            CASE
                WHEN V_COMPARE BETWEEN '3B29' AND '3B30'
                THEN
                    V_PINYIN := 'A';
                WHEN V_COMPARE = '3B31'
                THEN
                    V_PINYIN := 'AES';
                WHEN V_COMPARE BETWEEN '3B32' AND '3B9E'
                THEN
                    V_PINYIN := 'AI';
                WHEN V_COMPARE BETWEEN '3BA0' AND '3BFE'
                THEN
                    V_PINYIN := 'AN';
                WHEN V_COMPARE BETWEEN '3C01' AND '3C14'
                THEN
                    V_PINYIN := 'ANG';
                WHEN V_COMPARE BETWEEN '3C15' AND '3C82'
                THEN
                    V_PINYIN := 'AO';
                WHEN V_COMPARE BETWEEN '3C84' AND '3CE9'
                THEN
                    V_PINYIN := 'BA';
                WHEN V_COMPARE BETWEEN '3CED' AND '3D1D'
                THEN
                    V_PINYIN := 'BAI';
                WHEN V_COMPARE BETWEEN '3D20' AND '3D64'
                THEN
                    V_PINYIN := 'BAN';
                WHEN V_COMPARE BETWEEN '3D66' AND '3DA2'
                THEN
                    V_PINYIN := 'BANG';
                WHEN V_COMPARE BETWEEN '3DA4' AND '3E10'
                THEN
                    V_PINYIN := 'BAO';
                WHEN V_COMPARE = '3E11'
                THEN
                    V_PINYIN := 'BE';
                WHEN V_COMPARE BETWEEN '3E12' AND '3E7A'
                THEN
                    V_PINYIN := 'BEI';
                WHEN V_COMPARE BETWEEN '3E7C' AND '3EA0'
                THEN
                    V_PINYIN := 'BEN';
                WHEN V_COMPARE BETWEEN '3EA1' AND '3ED5'
                THEN
                    V_PINYIN := 'BENG';
                WHEN V_COMPARE BETWEEN '3ED8' AND '3FE9'
                THEN
                    V_PINYIN := 'BI';
                WHEN V_COMPARE BETWEEN '3FEA' AND '4055'
                THEN
                    V_PINYIN := 'BIAN';
                WHEN V_COMPARE BETWEEN '4058' AND '40AE'
                THEN
                    V_PINYIN := 'BIAO';
                WHEN V_COMPARE = '4060'
                THEN
                    V_PINYIN := 'BIA';
                WHEN V_COMPARE BETWEEN '40B4' AND '40D4'
                THEN
                    V_PINYIN := 'BIE';
                WHEN V_COMPARE BETWEEN '40D6' AND '4116'
                THEN
                    V_PINYIN := 'BIN';
                WHEN V_COMPARE BETWEEN '4118' AND '4160'
                THEN
                    V_PINYIN := 'BING';
                WHEN V_COMPARE BETWEEN '4161' AND '4224'
                THEN
                    V_PINYIN := 'BO';
                WHEN V_COMPARE BETWEEN '4225' AND '427C'
                THEN
                    V_PINYIN := 'BU';
                WHEN V_COMPARE BETWEEN '427D' AND '4289'
                THEN
                    V_PINYIN := 'CA';
                WHEN V_COMPARE BETWEEN '428C' AND '42B5'
                THEN
                    V_PINYIN := 'CAI';
                WHEN V_COMPARE BETWEEN '42B9' AND '430C'
                THEN
                    V_PINYIN := 'CAN';
                WHEN V_COMPARE BETWEEN '430D' AND '4334'
                THEN
                    V_PINYIN := 'CANG';
                WHEN V_COMPARE BETWEEN '4335' AND '435C'
                THEN
                    V_PINYIN := 'CAO';
                WHEN V_COMPARE BETWEEN '435D' AND '438C'
                THEN
                    V_PINYIN := 'CE';
                WHEN V_COMPARE BETWEEN '4390' AND '4398'
                THEN
                    V_PINYIN := 'CEN';
                WHEN V_COMPARE BETWEEN '439D' AND '43AA'
                THEN
                    V_PINYIN := 'CENG';
                WHEN V_COMPARE = '43AC'
                THEN
                    V_PINYIN := 'CEOK';
                WHEN V_COMPARE = '43AE'
                THEN
                    V_PINYIN := 'CEOM';
                WHEN V_COMPARE = '43B0'
                THEN
                    V_PINYIN := 'CEON';
                WHEN V_COMPARE = '43B1'
                THEN
                    V_PINYIN := 'CEOR';
                WHEN V_COMPARE BETWEEN '43B2' AND '440A'
                THEN
                    V_PINYIN := 'CHA';
                WHEN V_COMPARE BETWEEN '440E' AND '442D'
                THEN
                    V_PINYIN := 'CHAI';
                WHEN V_COMPARE BETWEEN '4431' AND '44E1'
                THEN
                    V_PINYIN := 'CHAN';
                WHEN V_COMPARE BETWEEN '44E4' AND '4552'
                THEN
                    V_PINYIN := 'CHANG';
                WHEN V_COMPARE BETWEEN '4554' AND '458E'
                THEN
                    V_PINYIN := 'CHAO';
                WHEN V_COMPARE BETWEEN '4590' AND '45C8'
                THEN
                    V_PINYIN := 'CHE';
                WHEN V_COMPARE BETWEEN '45C9' AND '463D'
                THEN
                    V_PINYIN := 'CHEN';
                WHEN V_COMPARE BETWEEN '463E' AND '46CD'
                THEN
                    V_PINYIN := 'CHENG';
                WHEN V_COMPARE BETWEEN '46CE' AND '47A6'
                THEN
                    V_PINYIN := 'CHI';
                WHEN V_COMPARE BETWEEN '47A8' AND '47EC'
                THEN
                    V_PINYIN := 'CHONG';
                WHEN V_COMPARE BETWEEN '47ED' AND '484C'
                THEN
                    V_PINYIN := 'CHOU';
                WHEN V_COMPARE BETWEEN '484D' AND '48E2'
                THEN
                    V_PINYIN := 'CHU';
                WHEN V_COMPARE BETWEEN '48E9' AND '48F4'
                THEN
                    V_PINYIN := 'CHUAI';
                WHEN V_COMPARE BETWEEN '48F6' AND '4924'
                THEN
                    V_PINYIN := 'CHUAN';
                WHEN V_COMPARE BETWEEN '4925' AND '4951'
                THEN
                    V_PINYIN := 'CHUANG';
                WHEN V_COMPARE BETWEEN '4954' AND '496E'
                THEN
                    V_PINYIN := 'CHUI';
                WHEN V_COMPARE BETWEEN '4971' AND '49C6'
                THEN
                    V_PINYIN := 'CHUN';
                WHEN V_COMPARE BETWEEN '49C8' AND '49EA'
                THEN
                    V_PINYIN := 'CHUO';
                WHEN V_COMPARE BETWEEN '49EC' AND '4A4A'
                THEN
                    V_PINYIN := 'CI';
                WHEN V_COMPARE = '4A50'
                THEN
                    V_PINYIN := 'CIS';
                WHEN V_COMPARE BETWEEN '4A51' AND '4AB2'
                THEN
                    V_PINYIN := 'CONG';
                WHEN V_COMPARE BETWEEN '4AB4' AND '4ABA'
                THEN
                    V_PINYIN := 'COU';
                WHEN V_COMPARE BETWEEN '4ABC' AND '4AEA'
                THEN
                    V_PINYIN := 'CU';
                WHEN V_COMPARE BETWEEN '4AEE' AND '4B0C'
                THEN
                    V_PINYIN := 'CUAN';
                WHEN V_COMPARE BETWEEN '4B0D' AND '4B56'
                THEN
                    V_PINYIN := 'CUI';
                WHEN V_COMPARE BETWEEN '4B59' AND '4B6C'
                THEN
                    V_PINYIN := 'CUN';
                WHEN V_COMPARE BETWEEN '4B70' AND '4BA9'
                THEN
                    V_PINYIN := 'CUO';
                WHEN V_COMPARE BETWEEN '4BAD' AND '4BFE'
                THEN
                    V_PINYIN := 'DA';
                WHEN V_COMPARE BETWEEN '4C00' AND '4C4E'
                THEN
                    V_PINYIN := 'DAI';
                WHEN V_COMPARE BETWEEN '4C50' AND '4CDC'
                THEN
                    V_PINYIN := 'DAN';
                WHEN V_COMPARE BETWEEN '4CDE' AND '4D26'
                THEN
                    V_PINYIN := 'DANG';
                WHEN V_COMPARE BETWEEN '4D28' AND '4D76'
                THEN
                    V_PINYIN := 'DAO';
                WHEN V_COMPARE BETWEEN '4D7E' AND '4D8D'
                THEN
                    V_PINYIN := 'DE';
                WHEN V_COMPARE = '4D8E'
                THEN
                    V_PINYIN := 'DEM';
                WHEN V_COMPARE BETWEEN '4D90' AND '4D91'
                THEN
                    V_PINYIN := 'DEN';
                WHEN V_COMPARE BETWEEN '4D94' AND '4DC0'
                THEN
                    V_PINYIN := 'DENG';
                WHEN V_COMPARE BETWEEN '4DC4' AND '4E8A'
                THEN
                    V_PINYIN := 'DI';
                WHEN V_COMPARE = '4E8C'
                THEN
                    V_PINYIN := 'DIA';
                WHEN V_COMPARE BETWEEN '4E8D' AND '4EE8'
                THEN
                    V_PINYIN := 'DIAN';
                WHEN V_COMPARE BETWEEN '4EE9' AND '4F38'
                THEN
                    V_PINYIN := 'DIAO';
                WHEN V_COMPARE BETWEEN '4F39' AND '4F90'
                THEN
                    V_PINYIN := 'DIE';
                WHEN V_COMPARE = '4F8D'
                THEN
                    V_PINYIN := 'DEI';
                WHEN V_COMPARE = '4F91'
                THEN
                    V_PINYIN := 'DIM';
                WHEN V_COMPARE BETWEEN '4F92' AND '4FCD'
                THEN
                    V_PINYIN := 'DING';
                WHEN V_COMPARE BETWEEN '4FCD' AND '4FD4'
                THEN
                    V_PINYIN := 'DIU';
                WHEN V_COMPARE BETWEEN '4FD5' AND '5032'
                THEN
                    V_PINYIN := 'DONG';
                WHEN V_COMPARE BETWEEN '5034' AND '507C'
                THEN
                    V_PINYIN := 'DOU';
                WHEN V_COMPARE = '5044'
                THEN
                    V_PINYIN := 'DUL';
                WHEN V_COMPARE BETWEEN '507E' AND '50E9'
                THEN
                    V_PINYIN := 'DU';
                WHEN V_COMPARE BETWEEN '50EA' AND '5110'
                THEN
                    V_PINYIN := 'DUAN';
                WHEN V_COMPARE BETWEEN '5114' AND '514E'
                THEN
                    V_PINYIN := 'DUI';
                WHEN V_COMPARE BETWEEN '5152' AND '518D'
                THEN
                    V_PINYIN := 'DUN';
                WHEN V_COMPARE = '5160'
                THEN
                    V_PINYIN := 'TON';
                WHEN V_COMPARE BETWEEN '518E' AND '5200'
                THEN
                    V_PINYIN := 'DUO';
                WHEN V_COMPARE BETWEEN '5205' AND '52C2'
                THEN
                    V_PINYIN := 'E';
                WHEN V_COMPARE BETWEEN '52C4' AND '52CD'
                THEN
                    V_PINYIN := 'EN';
                WHEN V_COMPARE = '52D4'
                THEN
                    V_PINYIN := 'ENG';
                WHEN V_COMPARE = '52D5'
                THEN
                    V_PINYIN := 'EO';
                WHEN V_COMPARE = '52D6'
                THEN
                    V_PINYIN := 'EOL';
                WHEN V_COMPARE = '52D8'
                THEN
                    V_PINYIN := 'EOS';
                WHEN V_COMPARE BETWEEN '52D9' AND '5332'
                THEN
                    V_PINYIN := 'ER';
                WHEN V_COMPARE BETWEEN '5334' AND '5366'
                THEN
                    V_PINYIN := 'FA';
                WHEN V_COMPARE BETWEEN '536A' AND '53FA'
                THEN
                    V_PINYIN := 'FAN';
                WHEN V_COMPARE BETWEEN '53FD' AND '5438'
                THEN
                    V_PINYIN := 'FANG';
                WHEN V_COMPARE BETWEEN '5439' AND '54B2'
                THEN
                    V_PINYIN := 'FEI';
                WHEN V_COMPARE BETWEEN '54B4' AND '5528'
                THEN
                    V_PINYIN := 'FEN';
                WHEN V_COMPARE BETWEEN '5529' AND '55A9'
                THEN
                    V_PINYIN := 'FENG';
                WHEN V_COMPARE BETWEEN '55AA' AND '55AE'
                THEN
                    V_PINYIN := 'FO';
                WHEN V_COMPARE BETWEEN '55B1' AND '55BC'
                THEN
                    V_PINYIN := 'FOU';
                WHEN V_COMPARE BETWEEN '55BD' AND '5739'
                THEN
                    V_PINYIN := 'FU';
                WHEN V_COMPARE = '569D'
                THEN
                    V_PINYIN := 'M';
                WHEN V_COMPARE BETWEEN '573C' AND '574C'
                THEN
                    V_PINYIN := 'GA';
                WHEN V_COMPARE BETWEEN '574D' AND '578C'
                THEN
                    V_PINYIN := 'GAI';
                WHEN V_COMPARE BETWEEN '578D' AND '57F0'
                THEN
                    V_PINYIN := 'GAN';
                WHEN V_COMPARE BETWEEN '57F1' AND '582C'
                THEN
                    V_PINYIN := 'GANG';
                WHEN V_COMPARE BETWEEN '582E' AND '5884'
                THEN
                    V_PINYIN := 'GAO';
                WHEN V_COMPARE BETWEEN '5885' AND '5905'
                THEN
                    V_PINYIN := 'GE';
                WHEN V_COMPARE = '5906'
                THEN
                    V_PINYIN := 'GEI';
                WHEN V_COMPARE BETWEEN '5909' AND '5915'
                THEN
                    V_PINYIN := 'GEN';
                WHEN V_COMPARE BETWEEN '5918' AND '594E'
                THEN
                    V_PINYIN := 'GENG';
                WHEN V_COMPARE = '5956'
                THEN
                    V_PINYIN := 'GIB';
                WHEN V_COMPARE = '5958'
                THEN
                    V_PINYIN := 'GO';
                WHEN V_COMPARE BETWEEN '5959' AND '59BA'
                THEN
                    V_PINYIN := 'GONG';
                WHEN V_COMPARE BETWEEN '59BD' AND '5A0E'
                THEN
                    V_PINYIN := 'GOU';
                WHEN V_COMPARE BETWEEN '5A10' AND '5AB2'
                THEN
                    V_PINYIN := 'GU';
                WHEN V_COMPARE BETWEEN '5AB4' AND '5AE8'
                THEN
                    V_PINYIN := 'GUA';
                WHEN V_COMPARE BETWEEN '5AE9' AND '5AF8'
                THEN
                    V_PINYIN := 'GUAI';
                WHEN V_COMPARE BETWEEN '5AFD' AND '5B5E'
                THEN
                    V_PINYIN := 'GUAN';
                WHEN V_COMPARE BETWEEN '5B60' AND '5B8C'
                THEN
                    V_PINYIN := 'GUANG';
                WHEN V_COMPARE BETWEEN '5B8D' AND '5C2E'
                THEN
                    V_PINYIN := 'GUI';
                WHEN V_COMPARE = '5BC8'
                THEN
                    V_PINYIN := 'KWI';
                WHEN V_COMPARE BETWEEN '5C30' AND '5C58'
                THEN
                    V_PINYIN := 'GUN';
                WHEN V_COMPARE BETWEEN '5C51' AND '5CB6'
                THEN
                    V_PINYIN := 'GUO';
                WHEN V_COMPARE BETWEEN '5CB8' AND '5CBD'
                THEN
                    V_PINYIN := 'HA';
                WHEN V_COMPARE BETWEEN '5CC6' AND '5CEC'
                THEN
                    V_PINYIN := 'HAI';
                WHEN V_COMPARE = '5CED'
                THEN
                    V_PINYIN := 'HAL';
                WHEN V_COMPARE BETWEEN '5CEE' AND '5D99'
                THEN
                    V_PINYIN := 'HAN';
                WHEN V_COMPARE BETWEEN '5D9D' AND '5DBC'
                THEN
                    V_PINYIN := 'HANG';
                WHEN V_COMPARE BETWEEN '5DBE' AND '5E20'
                THEN
                    V_PINYIN := 'HAO';
                WHEN V_COMPARE = '5E02'
                THEN
                    V_PINYIN := 'HO';
                WHEN V_COMPARE BETWEEN '5E22' AND '5EC5'
                THEN
                    V_PINYIN := 'HE';
                WHEN V_COMPARE BETWEEN '5EC6' AND '5ECE'
                THEN
                    V_PINYIN := 'HEI';
                WHEN V_COMPARE BETWEEN '5ED0' AND '5EDC'
                THEN
                    V_PINYIN := 'HEN';
                WHEN V_COMPARE BETWEEN '5EDD' AND '5EDC'
                THEN
                    V_PINYIN := 'HENG';
                WHEN V_COMPARE = '5F04'
                THEN
                    V_PINYIN := 'HOL';
                WHEN V_COMPARE BETWEEN '5F05' AND '5F8D'
                THEN
                    V_PINYIN := 'HONG';
                WHEN V_COMPARE BETWEEN '5F8E' AND '5FD2'
                THEN
                    V_PINYIN := 'HOU';
                WHEN V_COMPARE BETWEEN '5FD4' AND '60B1'
                THEN
                    V_PINYIN := 'HU';
                WHEN V_COMPARE BETWEEN '60B2' AND '6111'
                THEN
                    V_PINYIN := 'HUA';
                WHEN V_COMPARE BETWEEN '6112' AND '612D'
                THEN
                    V_PINYIN := 'HUAI';
                WHEN V_COMPARE BETWEEN '612E' AND '61C6'
                THEN
                    V_PINYIN := 'HUAN';
                WHEN V_COMPARE BETWEEN '61CA' AND '624A'
                THEN
                    V_PINYIN := 'HUANG';
                WHEN V_COMPARE BETWEEN '624C' AND '6344'
                THEN
                    V_PINYIN := 'HUI';
                WHEN V_COMPARE BETWEEN '6346' AND '6388'
                THEN
                    V_PINYIN := 'HUN';
                WHEN V_COMPARE BETWEEN '638C' AND '63FA'
                THEN
                    V_PINYIN := 'HUO';
                WHEN V_COMPARE = '63FD'
                THEN
                    V_PINYIN := 'HWA';
                WHEN V_COMPARE BETWEEN '63FE' AND '6601'
                THEN
                    V_PINYIN := 'JI';
                WHEN V_COMPARE BETWEEN '6604' AND '6691'
                THEN
                    V_PINYIN := 'JIA';
                WHEN V_COMPARE BETWEEN '6692' AND '67F8'
                THEN
                    V_PINYIN := 'JIAN';
                WHEN V_COMPARE BETWEEN '67F9' AND '6860'
                THEN
                    V_PINYIN := 'JIANG';
                WHEN V_COMPARE BETWEEN '6862' AND '6930'
                THEN
                    V_PINYIN := 'JIAO';
                WHEN V_COMPARE BETWEEN '6931' AND '6A18'
                THEN
                    V_PINYIN := 'JIE';
                WHEN V_COMPARE BETWEEN '6A1A' AND '6AC9'
                THEN
                    V_PINYIN := 'JIN';
                WHEN V_COMPARE BETWEEN '6ACA' AND '6B65'
                THEN
                    V_PINYIN := 'JING';
                WHEN V_COMPARE BETWEEN '6B66' AND '6B9A'
                THEN
                    V_PINYIN := 'JIONG';
                WHEN V_COMPARE BETWEEN '6B9C' AND '6C0C'
                THEN
                    V_PINYIN := 'JIU';
                WHEN V_COMPARE = '6C0D'
                THEN
                    V_PINYIN := 'JOU';
                WHEN V_COMPARE BETWEEN '6C0E' AND '6D2A'
                THEN
                    V_PINYIN := 'JU';
                WHEN V_COMPARE BETWEEN '6D2D' AND '6D80'
                THEN
                    V_PINYIN := 'JUAN';
                WHEN V_COMPARE BETWEEN '6D82' AND '6E28'
                THEN
                    V_PINYIN := 'JUE';
                WHEN V_COMPARE BETWEEN '6E2A' AND '6E85'
                THEN
                    V_PINYIN := 'JUN';
                WHEN V_COMPARE BETWEEN '6E86' AND '6E92'
                THEN
                    V_PINYIN := 'KA';
                WHEN V_COMPARE BETWEEN '6E94' AND '6EC9'
                THEN
                    V_PINYIN := 'KAI';
                WHEN V_COMPARE = '6ECC'
                THEN
                    V_PINYIN := 'KAL';
                WHEN V_COMPARE BETWEEN '6ECD' AND '6F00'
                THEN
                    V_PINYIN := 'KAN';
                WHEN V_COMPARE BETWEEN '6F02' AND '6F30'
                THEN
                    V_PINYIN := 'KANG';
                WHEN V_COMPARE BETWEEN '6F31' AND '6F4D'
                THEN
                    V_PINYIN := 'KAO';
                WHEN V_COMPARE BETWEEN '6F50' AND '6FC8'
                THEN
                    V_PINYIN := 'KE';
                WHEN V_COMPARE BETWEEN '6FC9' AND '6FDA'
                THEN
                    V_PINYIN := 'KEN';
                WHEN V_COMPARE BETWEEN '6FDC' AND '6FF5'
                THEN
                    V_PINYIN := 'KENG';
                WHEN V_COMPARE = '6FFC'
                THEN
                    V_PINYIN := 'KI';
                WHEN V_COMPARE BETWEEN '6FFD' AND '7016'
                THEN
                    V_PINYIN := 'KONG';
                WHEN V_COMPARE = '7018'
                THEN
                    V_PINYIN := 'KOS';
                WHEN V_COMPARE BETWEEN '7019' AND '703E'
                THEN
                    V_PINYIN := 'KOU';
                WHEN V_COMPARE BETWEEN '7041' AND '707A'
                THEN
                    V_PINYIN := 'KU';
                WHEN V_COMPARE BETWEEN '707C' AND '7095'
                THEN
                    V_PINYIN := 'KUA';
                WHEN V_COMPARE BETWEEN '709A' AND '70C1'
                THEN
                    V_PINYIN := 'KUAI';
                WHEN V_COMPARE BETWEEN '70C2' AND '70D4'
                THEN
                    V_PINYIN := 'KUAN';
                WHEN V_COMPARE BETWEEN '70D8' AND '7128'
                THEN
                    V_PINYIN := 'KUANG';
                WHEN V_COMPARE BETWEEN '7129' AND '71B1'
                THEN
                    V_PINYIN := 'KUI';
                WHEN V_COMPARE BETWEEN '71B2' AND '71FE'
                THEN
                    V_PINYIN := 'KUN';
                WHEN V_COMPARE BETWEEN '7200' AND '7226'
                THEN
                    V_PINYIN := 'KUO';
                WHEN V_COMPARE = '7228'
                THEN
                    V_PINYIN := 'KWEOK';
                WHEN V_COMPARE BETWEEN '722C' AND '726A'
                THEN
                    V_PINYIN := 'LA';
                WHEN V_COMPARE BETWEEN '726C' AND '72B5'
                THEN
                    V_PINYIN := 'LAI';
                WHEN V_COMPARE BETWEEN '72B9' AND '733C'
                THEN
                    V_PINYIN := 'LAN';
                WHEN V_COMPARE BETWEEN '733D' AND '7388'
                THEN
                    V_PINYIN := 'LANG';
                WHEN V_COMPARE BETWEEN '7389' AND '73E5'
                THEN
                    V_PINYIN := 'LAO';
                WHEN V_COMPARE BETWEEN '73E8' AND '7402'
                THEN
                    V_PINYIN := 'LE';
                WHEN V_COMPARE BETWEEN '7404' AND '7485'
                THEN
                    V_PINYIN := 'LEI';
                WHEN V_COMPARE BETWEEN '7488' AND '7499'
                THEN
                    V_PINYIN := 'LENG';
                WHEN V_COMPARE BETWEEN '749C' AND '7642'
                THEN
                    V_PINYIN := 'LI';
                WHEN V_COMPARE BETWEEN '7644' AND '7645'
                THEN
                    V_PINYIN := 'LIA';
                WHEN V_COMPARE BETWEEN '7646' AND '76EC'
                THEN
                    V_PINYIN := 'LIAN';
                WHEN V_COMPARE BETWEEN '76ED' AND '7731'
                THEN
                    V_PINYIN := 'LIANG';
                WHEN V_COMPARE BETWEEN '7732' AND '7794'
                THEN
                    V_PINYIN := 'LIAO';
                WHEN V_COMPARE BETWEEN '7795' AND '77E2'
                THEN
                    V_PINYIN := 'LIE';
                WHEN V_COMPARE BETWEEN '77E4' AND '785D'
                THEN
                    V_PINYIN := 'LIN';
                WHEN V_COMPARE = '77EA'
                THEN
                    V_PINYIN := 'LEN';
                WHEN V_COMPARE BETWEEN '7860' AND '7904'
                THEN
                    V_PINYIN := 'LING';
                WHEN V_COMPARE BETWEEN '7905' AND '7986'
                THEN
                    V_PINYIN := 'LIU';
                WHEN V_COMPARE BETWEEN '7988' AND '7989'
                THEN
                    V_PINYIN := 'LO';
                WHEN V_COMPARE BETWEEN '798A' AND '79FD'
                THEN
                    V_PINYIN := 'LONG';
                WHEN V_COMPARE BETWEEN '79FE' AND '7A49'
                THEN
                    V_PINYIN := 'LOU';
                WHEN V_COMPARE BETWEEN '7A4C' AND '7B4D'
                THEN
                    V_PINYIN := 'LU';
                WHEN V_COMPARE BETWEEN '7B4E' AND '7B80'
                THEN
                    V_PINYIN := 'LUAN';
                WHEN V_COMPARE BETWEEN '7B81' AND '7BB2'
                THEN
                    V_PINYIN := 'LUN';
                WHEN V_COMPARE BETWEEN '7BB5' AND '7C25'
                THEN
                    V_PINYIN := 'LUO';
                WHEN V_COMPARE BETWEEN '7C26' AND '7C82'
                THEN
                    V_PINYIN := 'LV';
                WHEN V_COMPARE BETWEEN '7C84' AND '7C98'
                THEN
                    V_PINYIN := 'LUE';
                WHEN V_COMPARE BETWEEN '7C9C' AND '7CE4'
                THEN
                    V_PINYIN := 'MA';
                WHEN V_COMPARE BETWEEN '7CE5' AND '7DOC'
                THEN
                    V_PINYIN := 'MAI';
                WHEN V_COMPARE BETWEEN '7D11' AND '7D6E'
                THEN
                    V_PINYIN := 'MAN';
                WHEN V_COMPARE BETWEEN '7D70' AND '7DA9'
                THEN
                    V_PINYIN := 'MANG';
                WHEN V_COMPARE BETWEEN '7DAC' AND '7E15'
                THEN
                    V_PINYIN := 'MAO';
                WHEN V_COMPARE = '7E0C'
                THEN
                    V_PINYIN := 'Q';
                WHEN V_COMPARE BETWEEN '7E18' AND '7E1E'
                THEN
                    V_PINYIN := 'ME';
                WHEN V_COMPARE BETWEEN '7E20' AND '7E9A'
                THEN
                    V_PINYIN := 'MEI';
                WHEN V_COMPARE BETWEEN '7E9D' AND '7EC1'
                THEN
                    V_PINYIN := 'MEN';
                WHEN V_COMPARE BETWEEN '7EC2' AND '7F36'
                THEN
                    V_PINYIN := 'MENG';
                WHEN V_COMPARE = '7F38'
                THEN
                    V_PINYIN := 'MEO';
                WHEN V_COMPARE BETWEEN '7F39' AND '7FE4'
                THEN
                    V_PINYIN := 'MI';
                WHEN V_COMPARE BETWEEN '7FE6' AND '8034'
                THEN
                    V_PINYIN := 'MIAN';
                WHEN V_COMPARE BETWEEN '8035' AND '805A'
                THEN
                    V_PINYIN := 'MIAO';
                WHEN V_COMPARE BETWEEN '805C' AND '8081'
                THEN
                    V_PINYIN := 'MIE';
                WHEN V_COMPARE BETWEEN '8084' AND '80E4'
                THEN
                    V_PINYIN := 'MIN';
                WHEN V_COMPARE = '8096'
                THEN
                    V_PINYIN := 'LEM';
                WHEN V_COMPARE BETWEEN '80E5' AND '8116'
                THEN
                    V_PINYIN := 'MING';
                WHEN V_COMPARE BETWEEN '8119' AND '811D'
                THEN
                    V_PINYIN := 'MIU';
                WHEN V_COMPARE BETWEEN '811E' AND '81A9'
                THEN
                    V_PINYIN := 'MO';
                WHEN V_COMPARE BETWEEN '81AC' AND '81CC'
                THEN
                    V_PINYIN := 'MOU';
                WHEN V_COMPARE BETWEEN '81CD' AND '821E'
                THEN
                    V_PINYIN := 'MU';
                WHEN V_COMPARE = '8220'
                THEN
                    V_PINYIN := 'MYEO';
                WHEN V_COMPARE = '8221'
                THEN
                    V_PINYIN := 'MYEON';
                WHEN V_COMPARE = '8222'
                THEN
                    V_PINYIN := 'MYEONG';
                WHEN V_COMPARE BETWEEN '8224' AND '8258'
                THEN
                    V_PINYIN := 'NA';
                WHEN V_COMPARE BETWEEN '825D' AND '8285'
                THEN
                    V_PINYIN := 'NAI';
                WHEN V_COMPARE BETWEEN '8289' AND '82B5'
                THEN
                    V_PINYIN := 'NAN';
                WHEN V_COMPARE BETWEEN '82B9' AND '82D0'
                THEN
                    V_PINYIN := 'NANG';
                WHEN V_COMPARE BETWEEN '82D1' AND '8311'
                THEN
                    V_PINYIN := 'NAO';
                WHEN V_COMPARE BETWEEN '8312' AND '8320'
                THEN
                    V_PINYIN := 'NE';
                WHEN V_COMPARE BETWEEN '8322' AND '8331'
                THEN
                    V_PINYIN := 'NEI';
                WHEN V_COMPARE = '8334'
                THEN
                    V_PINYIN := 'NEM';
                WHEN V_COMPARE = '8336'
                THEN
                    V_PINYIN := 'NEN';
                WHEN V_COMPARE = '8339'
                THEN
                    V_PINYIN := 'NENG';
                WHEN V_COMPARE = '833E'
                THEN
                    V_PINYIN := 'NEUS';
                WHEN V_COMPARE = '8342'
                THEN
                    V_PINYIN := 'NGAG';
                WHEN V_COMPARE = '8344'
                THEN
                    V_PINYIN := 'NGAI';
                WHEN V_COMPARE = '8345'
                THEN
                    V_PINYIN := 'NGAM';
                WHEN V_COMPARE BETWEEN '8346' AND '83B9'
                THEN
                    V_PINYIN := 'NI';
                WHEN V_COMPARE BETWEEN '83BC' AND '83ED'
                THEN
                    V_PINYIN := 'NIAN';
                WHEN V_COMPARE BETWEEN '83EE' AND '83F5'
                THEN
                    V_PINYIN := 'NIANG';
                WHEN V_COMPARE BETWEEN '83F8' AND '8414'
                THEN
                    V_PINYIN := 'NIAO';
                WHEN V_COMPARE BETWEEN '8415' AND '8478'
                THEN
                    V_PINYIN := 'NIE';
                WHEN V_COMPARE BETWEEN '8479' AND '8480'
                THEN
                    V_PINYIN := 'NIN';
                WHEN V_COMPARE BETWEEN '8481' AND '84B4'
                THEN
                    V_PINYIN := 'NING';
                WHEN V_COMPARE BETWEEN '84B5' AND '84D1'
                THEN
                    V_PINYIN := 'NIU';
                WHEN V_COMPARE BETWEEN '84D4' AND '84FA'
                THEN
                    V_PINYIN := 'NONG';
                WHEN V_COMPARE = '84E8'
                THEN
                    V_PINYIN := 'NUNG';
                WHEN V_COMPARE BETWEEN '84FD' AND '850E'
                THEN
                    V_PINYIN := 'NOU';
                WHEN V_COMPARE BETWEEN '8511' AND '8522'
                THEN
                    V_PINYIN := 'NU';
                WHEN V_COMPARE BETWEEN '8524' AND '852C'
                THEN
                    V_PINYIN := 'NUAN';
                WHEN V_COMPARE = '852D'
                THEN
                    V_PINYIN := 'NUN';
                WHEN V_COMPARE BETWEEN '8530' AND '8559'
                THEN
                    V_PINYIN := 'NUO';
                WHEN V_COMPARE BETWEEN '855A' AND '8566'
                THEN
                    V_PINYIN := 'NV';
                WHEN V_COMPARE BETWEEN '856D' AND '8574'
                THEN
                    V_PINYIN := 'NUE';
                WHEN V_COMPARE = '8575'
                THEN
                    V_PINYIN := 'O';
                WHEN V_COMPARE = '8579'
                THEN
                    V_PINYIN := 'OES';
                WHEN V_COMPARE = '857A'
                THEN
                    V_PINYIN := 'OL';
                WHEN V_COMPARE = '857C'
                THEN
                    V_PINYIN := 'ON';
                WHEN V_COMPARE BETWEEN '857D' AND '85AE'
                THEN
                    V_PINYIN := 'OU';
                WHEN V_COMPARE BETWEEN '85B1' AND '85C9'
                THEN
                    V_PINYIN := 'PA';
                WHEN V_COMPARE BETWEEN '85CA' AND '85E4'
                THEN
                    V_PINYIN := 'PAI';
                WHEN V_COMPARE = '85E5'
                THEN
                    V_PINYIN := 'PAK';
                WHEN V_COMPARE BETWEEN '85E8' AND '8625'
                THEN
                    V_PINYIN := 'PAN';
                WHEN V_COMPARE BETWEEN '8626' AND '8658'
                THEN
                    V_PINYIN := 'PANG';
                WHEN V_COMPARE BETWEEN '8659' AND '8688'
                THEN
                    V_PINYIN := 'PAO';
                WHEN V_COMPARE BETWEEN '868A' AND '86C5'
                THEN
                    V_PINYIN := 'PEI';
                WHEN V_COMPARE BETWEEN '86C8' AND '86D6'
                THEN
                    V_PINYIN := 'PEN';
                WHEN V_COMPARE BETWEEN '86D8' AND '8740'
                THEN
                    V_PINYIN := 'PENG';
                WHEN V_COMPARE = '8741'
                THEN
                    V_PINYIN := 'PEOL';
                WHEN V_COMPARE = '8742'
                THEN
                    V_PINYIN := 'PHAS';
                WHEN V_COMPARE = '8744'
                THEN
                    V_PINYIN := 'PHDENG';
                WHEN V_COMPARE = '8745'
                THEN
                    V_PINYIN := 'PHOI';
                WHEN V_COMPARE = '8746'
                THEN
                    V_PINYIN := 'PHOS';
                WHEN V_COMPARE BETWEEN '8748' AND '880D'
                THEN
                    V_PINYIN := 'PI';
                WHEN V_COMPARE BETWEEN '880E' AND '883A'
                THEN
                    V_PINYIN := 'PIAN';
                WHEN V_COMPARE BETWEEN '883C' AND '8869'
                THEN
                    V_PINYIN := 'PIAO';
                WHEN V_COMPARE BETWEEN '886D' AND '8879'
                THEN
                    V_PINYIN := 'PIE';
                WHEN V_COMPARE BETWEEN '887A' AND '88A0'
                THEN
                    V_PINYIN := 'PIN';
                WHEN V_COMPARE BETWEEN '88A1' AND '88EC'
                THEN
                    V_PINYIN := 'PING';
                WHEN V_COMPARE BETWEEN '88F0' AND '8938'
                THEN
                    V_PINYIN := 'PO';
                WHEN V_COMPARE BETWEEN '893E' AND '8958'
                THEN
                    V_PINYIN := 'POU';
                WHEN V_COMPARE BETWEEN '895A' AND '895C'
                THEN
                    V_PINYIN := 'PPUN';
                WHEN V_COMPARE BETWEEN '895D' AND '89C4'
                THEN
                    V_PINYIN := 'PU';
                WHEN V_COMPARE BETWEEN '89C5' AND '8B3E'
                THEN
                    V_PINYIN := 'QI';
                WHEN V_COMPARE BETWEEN '8B41' AND '8B61'
                THEN
                    V_PINYIN := 'QIA';
                WHEN V_COMPARE BETWEEN '8B62' AND '8C54'
                THEN
                    V_PINYIN := 'QIAN';
                WHEN V_COMPARE BETWEEN '8C5A' AND '8CB4'
                THEN
                    V_PINYIN := 'QIANG';
                WHEN V_COMPARE BETWEEN '8CB8' AND '8D3D'
                THEN
                    V_PINYIN := 'QIAO';
                WHEN V_COMPARE BETWEEN '8D40' AND '8D7E'
                THEN
                    V_PINYIN := 'QIE';
                WHEN V_COMPARE BETWEEN '8D81' AND '8DFA'
                THEN
                    V_PINYIN := 'QIN';
                WHEN V_COMPARE BETWEEN '8DFC' AND '8E5D'
                THEN
                    V_PINYIN := 'QING';
                WHEN V_COMPARE BETWEEN '8E5E' AND '8E98'
                THEN
                    V_PINYIN := 'QIONG';
                WHEN V_COMPARE BETWEEN '8E9A' AND '8F2A'
                THEN
                    V_PINYIN := 'QIU';
                WHEN V_COMPARE BETWEEN '8F2E' AND '8FE9'
                THEN
                    V_PINYIN := 'QU';
                WHEN V_COMPARE BETWEEN '8FEA' AND '905D'
                THEN
                    V_PINYIN := 'QUAN';
                WHEN V_COMPARE BETWEEN '905E' AND '9099'
                THEN
                    V_PINYIN := 'QUE';
                WHEN V_COMPARE BETWEEN '909A' AND '90AA'
                THEN
                    V_PINYIN := 'QUN';
                WHEN V_COMPARE BETWEEN '90B0' AND '90B1'
                THEN
                    V_PINYIN := 'RA';
                WHEN V_COMPARE = '90B2'
                THEN
                    V_PINYIN := 'RAM';
                WHEN V_COMPARE BETWEEN '90B4' AND '90E5'
                THEN
                    V_PINYIN := 'RAN';
                WHEN V_COMPARE BETWEEN '90E6' AND '9104'
                THEN
                    V_PINYIN := 'RANG';
                WHEN V_COMPARE BETWEEN '9105' AND '911C'
                THEN
                    V_PINYIN := 'RAO';
                WHEN V_COMPARE BETWEEN '911D' AND '9120'
                THEN
                    V_PINYIN := 'RE';
                WHEN V_COMPARE BETWEEN '9121' AND '9180'
                THEN
                    V_PINYIN := 'REN';
                WHEN V_COMPARE BETWEEN '9181' AND '918D'
                THEN
                    V_PINYIN := 'RENG';
                WHEN V_COMPARE BETWEEN '918E' AND '9196'
                THEN
                    V_PINYIN := 'RI';
                WHEN V_COMPARE BETWEEN '9189' AND '91F1'
                THEN
                    V_PINYIN := 'RONG';
                WHEN V_COMPARE BETWEEN '91F2' AND '9218'
                THEN
                    V_PINYIN := 'ROU';
                WHEN V_COMPARE BETWEEN '9219' AND '9269'
                THEN
                    V_PINYIN := 'RU';
                WHEN V_COMPARE BETWEEN '926C' AND '9292'
                THEN
                    V_PINYIN := 'RUAN';
                WHEN V_COMPARE BETWEEN '9294' AND '92BD'
                THEN
                    V_PINYIN := 'RUI';
                WHEN V_COMPARE BETWEEN '92BE' AND '92C9'
                THEN
                    V_PINYIN := 'RUN';
                WHEN V_COMPARE = '92CA'
                THEN
                    V_PINYIN := 'RUA';
                WHEN V_COMPARE BETWEEN '92CA' AND '92E4'
                THEN
                    V_PINYIN := 'RUO';
                WHEN V_COMPARE BETWEEN '92E5' AND '9309'
                THEN
                    V_PINYIN := 'SA';
                WHEN V_COMPARE = '930A'
                THEN
                    V_PINYIN := 'SAENG';
                WHEN V_COMPARE BETWEEN '930C' AND '9325'
                THEN
                    V_PINYIN := 'SAI';
                WHEN V_COMPARE = '9328'
                THEN
                    V_PINYIN := 'SAL';
                WHEN V_COMPARE BETWEEN '9329' AND '9355'
                THEN
                    V_PINYIN := 'SAN';
                WHEN V_COMPARE BETWEEN '9358' AND '936A'
                THEN
                    V_PINYIN := 'SANG';
                WHEN V_COMPARE BETWEEN '936C' AND '9391'
                THEN
                    V_PINYIN := 'SAO';
                WHEN V_COMPARE BETWEEN '9392' AND '93C5'
                THEN
                    V_PINYIN := 'SE';
                WHEN V_COMPARE = '93C6'
                THEN
                    V_PINYIN := 'SED';
                WHEN V_COMPARE BETWEEN '93C8' AND '93CC'
                THEN
                    V_PINYIN := 'SEN';
                WHEN V_COMPARE BETWEEN '93CD' AND '93D0'
                THEN
                    V_PINYIN := 'SENG';
                WHEN V_COMPARE = '93D1'
                THEN
                    V_PINYIN := 'SEO';
                WHEN V_COMPARE = '93D2'
                THEN
                    V_PINYIN := 'SEON';
                WHEN V_COMPARE BETWEEN '93D4' AND '941A'
                THEN
                    V_PINYIN := 'SHA';
                WHEN V_COMPARE BETWEEN '941D' AND '9428'
                THEN
                    V_PINYIN := 'SHAI';
                WHEN V_COMPARE BETWEEN '9429' AND '94C1'
                THEN
                    V_PINYIN := 'SHAN';
                WHEN V_COMPARE BETWEEN '94C2' AND '94EE'
                THEN
                    V_PINYIN := 'SHANG';
                WHEN V_COMPARE BETWEEN '94F1' AND '952D'
                THEN
                    V_PINYIN := 'SHAO';
                WHEN V_COMPARE BETWEEN '952E' AND '9571'
                THEN
                    V_PINYIN := 'SHE';
                WHEN V_COMPARE BETWEEN '9574' AND '9602'
                THEN
                    V_PINYIN := 'SHEN';
                WHEN V_COMPARE BETWEEN '9604' AND '965C'
                THEN
                    V_PINYIN := 'SHENG';
                WHEN V_COMPARE BETWEEN '965E' AND '9786'
                THEN
                    V_PINYIN := 'SHI';
                WHEN V_COMPARE BETWEEN '9788' AND '97AE'
                THEN
                    V_PINYIN := 'SHOU';
                WHEN V_COMPARE BETWEEN '97B0' AND '9878'
                THEN
                    V_PINYIN := 'SHU';
                WHEN V_COMPARE BETWEEN '987A' AND '987E'
                THEN
                    V_PINYIN := 'SHUA';
                WHEN V_COMPARE BETWEEN '9880' AND '988A'
                THEN
                    V_PINYIN := 'SHUAI';
                WHEN V_COMPARE BETWEEN '988C' AND '9894'
                THEN
                    V_PINYIN := 'SHUAN';
                WHEN V_COMPARE BETWEEN '9895' AND '98BE'
                THEN
                    V_PINYIN := 'SHUANG';
                WHEN V_COMPARE BETWEEN '98C0' AND '98D6'
                THEN
                    V_PINYIN := 'SHUI';
                WHEN V_COMPARE BETWEEN '98DC' AND '98EE'
                THEN
                    V_PINYIN := 'SHUN';
                WHEN V_COMPARE BETWEEN '98F1' AND '9911'
                THEN
                    V_PINYIN := 'SHUO';
                WHEN V_COMPARE BETWEEN '9912' AND '99AD'
                THEN
                    V_PINYIN := 'SI';
                WHEN V_COMPARE = '99AE'
                THEN
                    V_PINYIN := 'SO';
                WHEN V_COMPARE = '99B0'
                THEN
                    V_PINYIN := 'SOL';
                WHEN V_COMPARE BETWEEN '99B1' AND '99F6'
                THEN
                    V_PINYIN := 'SONG';
                WHEN V_COMPARE BETWEEN '99F8' AND '9A36'
                THEN
                    V_PINYIN := 'SOU';
                WHEN V_COMPARE BETWEEN '9A38' AND '9AB6'
                THEN
                    V_PINYIN := 'SU';
                WHEN V_COMPARE BETWEEN '9AB8' AND '9AC4'
                THEN
                    V_PINYIN := 'SUAN';
                WHEN V_COMPARE BETWEEN '9AC5' AND '9B3A'
                THEN
                    V_PINYIN := 'SUI';
                WHEN V_COMPARE = '9AF0'
                THEN
                    V_PINYIN := 'WIE';
                WHEN V_COMPARE BETWEEN '9B3C' AND '9B62'
                THEN
                    V_PINYIN := 'SUN';
                WHEN V_COMPARE BETWEEN '9B65' AND '9BA9'
                THEN
                    V_PINYIN := 'SUO';
                WHEN V_COMPARE BETWEEN '9BAA' AND '9C10'
                THEN
                    V_PINYIN := 'TA';
                WHEN V_COMPARE = '9C11'
                THEN
                    V_PINYIN := 'TAE';
                WHEN V_COMPARE BETWEEN '9C12' AND '9C59'
                THEN
                    V_PINYIN := 'TAI';
                WHEN V_COMPARE BETWEEN '9C5A' AND '9CE0'
                THEN
                    V_PINYIN := 'TAN';
                WHEN V_COMPARE BETWEEN '9CE2' AND '9D55'
                THEN
                    V_PINYIN := 'TANG';
                WHEN V_COMPARE BETWEEN '9D56' AND '9DB4'
                THEN
                    V_PINYIN := 'TAO';
                WHEN V_COMPARE = '9DB6'
                THEN
                    V_PINYIN := 'TAP';
                WHEN V_COMPARE BETWEEN '9DB8' AND '9DC6'
                THEN
                    V_PINYIN := 'TE';
                WHEN V_COMPARE BETWEEN '9DC8' AND '9DED'
                THEN
                    V_PINYIN := 'TENG';
                WHEN V_COMPARE = '9DEE'
                THEN
                    V_PINYIN := 'TEO';
                WHEN V_COMPARE = '9DF0'
                THEN
                    V_PINYIN := 'TEUL';
                WHEN V_COMPARE BETWEEN '9DF1' AND '9E82'
                THEN
                    V_PINYIN := 'TI';
                WHEN V_COMPARE BETWEEN '9E85' AND '9EED'
                THEN
                    V_PINYIN := 'TIAN';
                WHEN V_COMPARE BETWEEN '9EEE' AND '9F38'
                THEN
                    V_PINYIN := 'TIAO';
                WHEN V_COMPARE BETWEEN '9F39' AND '9F56'
                THEN
                    V_PINYIN := 'TIE';
                WHEN V_COMPARE BETWEEN '9F59' AND '9FAE'
                THEN
                    V_PINYIN := 'TING';
                WHEN V_COMPARE = '9FB0'
                THEN
                    V_PINYIN := 'TOL';
                WHEN V_COMPARE BETWEEN '9FB1' AND 'A015'
                THEN
                    V_PINYIN := 'TONG';
                WHEN V_COMPARE BETWEEN 'A016' AND 'A03A'
                THEN
                    V_PINYIN := 'TOU';
                WHEN V_COMPARE BETWEEN 'A040' AND 'A0A9'
                THEN
                    V_PINYIN := 'TU';
                WHEN V_COMPARE BETWEEN 'A0AA' AND 'A0D5'
                THEN
                    V_PINYIN := 'TUAN';
                WHEN V_COMPARE BETWEEN 'A0D6' AND 'A106'
                THEN
                    V_PINYIN := 'TUI';
                WHEN V_COMPARE BETWEEN 'A108' AND 'A131'
                THEN
                    V_PINYIN := 'TUN';
                WHEN V_COMPARE BETWEEN 'A134' AND 'A1AE'
                THEN
                    V_PINYIN := 'TUO';
                WHEN V_COMPARE BETWEEN 'A1B0' AND 'A1E8'
                THEN
                    V_PINYIN := 'WA';
                WHEN V_COMPARE BETWEEN 'A1E9' AND 'A1F5'
                THEN
                    V_PINYIN := 'WAI';
                WHEN V_COMPARE BETWEEN 'A1F8' AND 'A279'
                THEN
                    V_PINYIN := 'WAN';
                WHEN V_COMPARE BETWEEN 'A27A' AND 'A2B9'
                THEN
                    V_PINYIN := 'WANG';
                WHEN V_COMPARE BETWEEN 'A2BC' AND 'A408'
                THEN
                    V_PINYIN := 'WEI';
                WHEN V_COMPARE BETWEEN 'A40D' AND 'A47C'
                THEN
                    V_PINYIN := 'WEN';
                WHEN V_COMPARE BETWEEN 'A47D' AND 'A4A2'
                THEN
                    V_PINYIN := 'WENG';
                WHEN V_COMPARE BETWEEN 'A4A4' AND 'A4EA'
                THEN
                    V_PINYIN := 'WO';
                WHEN V_COMPARE BETWEEN 'A4EC' AND 'A5D4'
                THEN
                    V_PINYIN := 'WU';
                WHEN V_COMPARE BETWEEN 'A5D6' AND 'A784'
                THEN
                    V_PINYIN := 'XI';
                WHEN V_COMPARE BETWEEN 'A785' AND 'A7FA'
                THEN
                    V_PINYIN := 'XIA';
                WHEN V_COMPARE BETWEEN 'A7FD' AND 'A951'
                THEN
                    V_PINYIN := 'XIAN';
                WHEN V_COMPARE BETWEEN 'A954' AND 'A9CE'
                THEN
                    V_PINYIN := 'XIANG';
                WHEN V_COMPARE BETWEEN 'A9D0' AND 'AA8A'
                THEN
                    V_PINYIN := 'XIAO';
                WHEN V_COMPARE BETWEEN 'AA8D' AND 'AB7E'
                THEN
                    V_PINYIN := 'XIE';
                WHEN V_COMPARE BETWEEN 'AB80' AND 'ABEE'
                THEN
                    V_PINYIN := 'XIN';
                WHEN V_COMPARE BETWEEN 'ABF0' AND 'AC41'
                THEN
                    V_PINYIN := 'XING';
                WHEN V_COMPARE BETWEEN 'AC42' AND 'AC64'
                THEN
                    V_PINYIN := 'XIONG';
                WHEN V_COMPARE BETWEEN 'AC65' AND 'ACBA'
                THEN
                    V_PINYIN := 'XIU';
                WHEN V_COMPARE BETWEEN 'ACBC' AND 'AD90'
                THEN
                    V_PINYIN := 'XU';
                WHEN V_COMPARE = 'ACD9'
                THEN
                    V_PINYIN := 'CHUA';
                WHEN V_COMPARE BETWEEN 'AD91' AND 'AE32'
                THEN
                    V_PINYIN := 'XUAN';
                WHEN V_COMPARE BETWEEN 'AE34' AND 'AE89'
                THEN
                    V_PINYIN := 'XUE';
                WHEN V_COMPARE BETWEEN 'AE8C' AND 'AF1E'
                THEN
                    V_PINYIN := 'XUN';
                WHEN V_COMPARE BETWEEN 'AF20' AND 'AF96'
                THEN
                    V_PINYIN := 'YA';
                WHEN V_COMPARE BETWEEN 'AF98' AND 'B118'
                THEN
                    V_PINYIN := 'YAN';
                WHEN V_COMPARE = 'B030'
                THEN
                    V_PINYIN := 'EOM';
                WHEN V_COMPARE BETWEEN 'B11A' AND 'B1A8'
                THEN
                    V_PINYIN := 'YANG';
                WHEN V_COMPARE BETWEEN 'B1AD' AND 'B275'
                THEN
                    V_PINYIN := 'YAO';
                WHEN V_COMPARE BETWEEN 'B276' AND 'B30A'
                THEN
                    V_PINYIN := 'YE';
                WHEN V_COMPARE BETWEEN 'B30D' AND 'B30E'
                THEN
                    V_PINYIN := 'YEN';
                WHEN V_COMPARE BETWEEN 'B310' AND 'B594'
                THEN
                    V_PINYIN := 'YI';
                WHEN V_COMPARE = 'B359'
                THEN
                    V_PINYIN := 'I';
                WHEN V_COMPARE BETWEEN 'B596' AND 'B684'
                THEN
                    V_PINYIN := 'YIN';
                WHEN V_COMPARE BETWEEN 'B685' AND 'B768'
                THEN
                    V_PINYIN := 'YING';
                WHEN V_COMPARE BETWEEN 'B76C' AND 'B76E'
                THEN
                    V_PINYIN := 'YO';
                WHEN V_COMPARE BETWEEN 'B770' AND 'B7EA'
                THEN
                    V_PINYIN := 'YONG';
                WHEN V_COMPARE BETWEEN 'B7EC' AND 'B8B2'
                THEN
                    V_PINYIN := 'YOU';
                WHEN V_COMPARE BETWEEN 'B8B5' AND 'BA98'
                THEN
                    V_PINYIN := 'YU';
                WHEN V_COMPARE BETWEEN 'BA99' AND 'BB58'
                THEN
                    V_PINYIN := 'YUAN';
                WHEN V_COMPARE BETWEEN 'BB59' AND 'BBBE'
                THEN
                    V_PINYIN := 'YUE';
                WHEN V_COMPARE BETWEEN 'BBC1' AND 'BC58'
                THEN
                    V_PINYIN := 'YUN';
                WHEN V_COMPARE BETWEEN 'BC59' AND 'BC7E'
                THEN
                    V_PINYIN := 'ZA';
                WHEN V_COMPARE BETWEEN 'BC81' AND 'BCA8'
                THEN
                    V_PINYIN := 'ZAI';
                WHEN V_COMPARE BETWEEN 'BCAA' AND 'BCEA'
                THEN
                    V_PINYIN := 'ZAN';
                WHEN V_COMPARE BETWEEN 'BCEE' AND 'BD0A'
                THEN
                    V_PINYIN := 'ZANG';
                WHEN V_COMPARE BETWEEN 'BD0C' AND 'BD46'
                THEN
                    V_PINYIN := 'ZAO';
                WHEN V_COMPARE BETWEEN 'BD48' AND 'BD99'
                THEN
                    V_PINYIN := 'ZE';
                WHEN V_COMPARE BETWEEN 'BD9A' AND 'BDA2'
                THEN
                    V_PINYIN := 'ZEI';
                WHEN V_COMPARE BETWEEN 'BDA5' AND 'BDAC'
                THEN
                    V_PINYIN := 'ZEN';
                WHEN V_COMPARE BETWEEN 'BDAD' AND 'BDCC'
                THEN
                    V_PINYIN := 'ZENG';
                WHEN V_COMPARE BETWEEN 'BDCE' AND 'BE40'
                THEN
                    V_PINYIN := 'ZHA';
                WHEN V_COMPARE = 'BDF8'
                THEN
                    V_PINYIN := 'GAD';
                WHEN V_COMPARE BETWEEN 'BE41' AND 'BE62'
                THEN
                    V_PINYIN := 'ZHAI';
                WHEN V_COMPARE BETWEEN 'BE65' AND 'BEF4'
                THEN
                    V_PINYIN := 'ZHAN';
                WHEN V_COMPARE BETWEEN 'BEF6' AND 'BF3E'
                THEN
                    V_PINYIN := 'ZHANG';
                WHEN V_COMPARE BETWEEN 'BF40' AND 'BF8C'
                THEN
                    V_PINYIN := 'ZHAO';
                WHEN V_COMPARE BETWEEN 'BF8E' AND 'BFF8'
                THEN
                    V_PINYIN := 'ZHE';
                WHEN V_COMPARE BETWEEN 'BFF9' AND 'C0B2'
                THEN
                    V_PINYIN := 'ZHEN';
                WHEN V_COMPARE BETWEEN 'C0B4' AND 'C11E'
                THEN
                    V_PINYIN := 'ZHENG';
                WHEN V_COMPARE BETWEEN 'C122' AND 'C2C4'
                THEN
                    V_PINYIN := 'ZHI';
                WHEN V_COMPARE BETWEEN 'C2C5' AND 'C31A'
                THEN
                    V_PINYIN := 'ZHONG';
                WHEN V_COMPARE BETWEEN 'C31D' AND 'C39A'
                THEN
                    V_PINYIN := 'ZHOU';
                WHEN V_COMPARE BETWEEN 'C39C' AND 'C47C'
                THEN
                    V_PINYIN := 'ZHU';
                WHEN V_COMPARE BETWEEN 'C47D' AND 'C484'
                THEN
                    V_PINYIN := 'ZHUA';
                WHEN V_COMPARE BETWEEN 'C485' AND 'C486'
                THEN
                    V_PINYIN := 'ZHUAI';
                WHEN V_COMPARE BETWEEN 'C488' AND 'C4C0'
                THEN
                    V_PINYIN := 'ZHUAN';
                WHEN V_COMPARE BETWEEN 'C4C2' AND 'C4E5'
                THEN
                    V_PINYIN := 'ZHUANG';
                WHEN V_COMPARE BETWEEN 'C4E6' AND 'C51C'
                THEN
                    V_PINYIN := 'ZHUI';
                WHEN V_COMPARE BETWEEN 'C51D' AND 'C530'
                THEN
                    V_PINYIN := 'ZHUN';
                WHEN V_COMPARE BETWEEN 'C534' AND 'C5A5'
                THEN
                    V_PINYIN := 'ZHUO';
                WHEN V_COMPARE BETWEEN 'C5A8' AND 'C648'
                THEN
                    V_PINYIN := 'ZI';
                WHEN V_COMPARE = 'C64A'
                THEN
                    V_PINYIN := 'ZO';
                WHEN V_COMPARE BETWEEN 'C64C' AND 'C6B5'
                THEN
                    V_PINYIN := 'ZONG';
                WHEN V_COMPARE BETWEEN 'C6B6' AND 'C6D6'
                THEN
                    V_PINYIN := 'ZOU';
                WHEN V_COMPARE BETWEEN 'C6E1' AND 'C714'
                THEN
                    V_PINYIN := 'ZU';
                WHEN V_COMPARE BETWEEN 'C715' AND 'C72D'
                THEN
                    V_PINYIN := 'ZUAN';
                WHEN V_COMPARE BETWEEN 'C72E' AND 'C75E'
                THEN
                    V_PINYIN := 'ZUI';
                WHEN V_COMPARE BETWEEN 'C760' AND 'C776'
                THEN
                    V_PINYIN := 'ZUN';
                WHEN V_COMPARE BETWEEN 'C77A' AND 'C7B4'
                THEN
                    V_PINYIN := 'ZUO';
                ELSE
                    V_PINYIN := V_SUBSTR;
            END CASE;
            IF P_FLAG = 4
            THEN
                V_PINYIN := SUBSTR(V_PINYIN, 1, 1) || LOWER(SUBSTR(V_PINYIN, 2));
            END IF;
            V_RETURN := V_RETURN || V_PINYIN;
        END LOOP;
        IF P_FLAG = 3
        THEN
            V_RETURN := LOWER(V_RETURN);
        ELSIF P_FLAG = 4
        THEN
            V_RETURN := V_RETURN;
        ELSE
            V_RETURN := UPPER(V_RETURN);
        END IF;
    END IF;
    RETURN V_RETURN;
END FUNC_GETPINYIN;
/
