/*
================================================================================
                  �������   ���̺�  �������
================================================================================
*/
CREATE TABLE TBL_ADMIN (
	ADMIN_CODE	VARCHAR2(10)	NOT NULL,
	ADMIN_PW	VARCHAR2(7)	NULL
);

CREATE TABLE TBL_PROF (
	PROF_CODE	VARCHAR2(10)	NOT NULL,
	PROF_PW	VARCHAR2(7)	NULL,
	PROF_NAME	VARCHAR2(10)	NULL,
	PROF_RRN	VARCHAR2(14)	NULL,
	PROF_TEL	VARCHAR2(13)	NULL
);

CREATE TABLE TBL_STD (
	STD_NUMBER	VARCHAR2(10)	NOT NULL,
	STD_NAME	VARCHAR2(10)	NULL,
	STD_PW	VARCHAR2(7)	NULL,
	STD_RRN	VARCHAR2(14)	NULL
);

CREATE TABLE TBL_OPENCOU (
	OPENCOU_CODE	VARCHAR2(10)	NOT NULL,
	COURSE_CODE	VARCHAR2(10)	NOT NULL,
	CLASS_CODE	VARCHAR2(10)	NOT NULL,
	OPENCOU_START	DATE	NULL,
	OPENCOU_END	DATE	NULL
);

CREATE TABLE TBL_SUGANG (
	SUGANG_CODE	VARCHAR2(10)	NOT NULL,
	OPENCOU_CODE	VARCHAR2(10)	NOT NULL,
	STD_NUMBER	VARCHAR2(10)	NOT NULL,
	SUGANG_DATE	DATE	NULL
);

CREATE TABLE TBL_SCO (
	SCO_CODE	VARCHAR2(10)	NOT NULL,
	OPENSUB_CODE	VARCHAR2(10)	NOT NULL,
	SUGANG_CODE	VARCHAR2(10)	NOT NULL,
	SCO_ATTEND	NUMBER(3)	NULL,
	SCO_WRITE	NUMBER(3)	NULL,
	SCO_PRAC	NUMBER(3)	NULL
);

CREATE TABLE TBL_BOOK (
	BOOK_CODE	VARCHAR2(10)	NOT NULL,
	BOOK_NAME	VARCHAR2(20)	NULL,
	BOOK_AUTHOR	VARCHAR2(20)	NULL
);

CREATE TABLE TBL_CLASS (
	CLASS_CODE	VARCHAR2(10)	NOT NULL,
	CLASS_NAME	VARCHAR2(20)	NULL
);

CREATE TABLE TBL_SUB (
	SUB_CODE	VARCHAR2(10)	NOT NULL,
	SUB_NAME	VARCHAR2(20)	NULL
);

CREATE TABLE TBL_COURSE (
	COURSE_CODE	VARCHAR2(10)	NOT NULL,
	COURSE_NAME	VARCHAR2(100)	NULL
);

CREATE TABLE TBL_OPENSUB (
	OPENSUB_CODE	VARCHAR2(10)	NOT NULL,
	OPENCOU_CODE	VARCHAR2(10)	NOT NULL,
	PROF_CODE	VARCHAR2(10)	NOT NULL,
	SUB_CODE	VARCHAR2(10)	NOT NULL,
	BOOK_CODE	VARCHAR2(10)	NOT NULL,
	OPENSUB_DATE	DATE	NULL,
	OPENSUB_END	DATE	NULL,
	OPENSUB_ATTEND	NUMBER(2)	NULL,
	OPENSUB_WRITE	NUMBER(2)	NULL,
	OPENSUB_PRAC	NUMBER(2)	NULL
);

CREATE TABLE TBL_OUT (
	OUT_CODE	VARCHAR2(10)	NOT NULL,
	SUGANG_CODE	VARCHAR2(10)	NOT NULL,
	OUT_REASON_CODE	VARCHAR2(10)	NOT NULL,
	OUT_DATE	DATE	NULL
);

CREATE TABLE TBL_OUT_REASON (
	OUT_REASON_CODE	VARCHAR2(10)	NOT NULL,
	OUT_REASON	VARCHAR2(40)	NULL
);

ALTER TABLE TBL_ADMIN ADD CONSTRAINT PK_TBL_ADMIN PRIMARY KEY (
	ADMIN_CODE
);

ALTER TABLE TBL_PROF ADD CONSTRAINT PK_TBL_PROF PRIMARY KEY (
	PROF_CODE
);

ALTER TABLE TBL_STD ADD CONSTRAINT PK_TBL_STD PRIMARY KEY (
	STD_NUMBER
);

ALTER TABLE TBL_OPENCOU ADD CONSTRAINT PK_TBL_OPENCOU PRIMARY KEY (
	OPENCOU_CODE
);

ALTER TABLE TBL_SUGANG ADD CONSTRAINT PK_TBL_SUGANG PRIMARY KEY (
	SUGANG_CODE
);

ALTER TABLE TBL_SCO ADD CONSTRAINT PK_TBL_SCO PRIMARY KEY (
	SCO_CODE
);

ALTER TABLE TBL_BOOK ADD CONSTRAINT PK_TBL_BOOK PRIMARY KEY (
	BOOK_CODE
);

ALTER TABLE TBL_CLASS ADD CONSTRAINT PK_TBL_CLASS PRIMARY KEY (
	CLASS_CODE
);

ALTER TABLE TBL_SUB ADD CONSTRAINT PK_TBL_SUB PRIMARY KEY (
	SUB_CODE
);

ALTER TABLE TBL_COURSE ADD CONSTRAINT PK_TBL_COURSE PRIMARY KEY (
	COURSE_CODE
);

ALTER TABLE TBL_OPENSUB ADD CONSTRAINT PK_TBL_OPENSUB PRIMARY KEY (
	OPENSUB_CODE
);

ALTER TABLE TBL_OUT ADD CONSTRAINT PK_TBL_OUT PRIMARY KEY (
	OUT_CODE
);

ALTER TABLE TBL_OUT_REASON ADD CONSTRAINT PK_TBL_OUT_REASON PRIMARY KEY (
	OUT_REASON_CODE
);

ALTER TABLE TBL_OPENCOU ADD CONSTRAINT FK_TBL_COURSE_TO_TBL_OPENCOU_1 FOREIGN KEY (
	COURSE_CODE
)
REFERENCES TBL_COURSE (
	COURSE_CODE
);

ALTER TABLE TBL_OPENCOU ADD CONSTRAINT FK_TBL_CLASS_TO_TBL_OPENCOU_1 FOREIGN KEY (
	CLASS_CODE
)
REFERENCES TBL_CLASS (
	CLASS_CODE
);

ALTER TABLE TBL_SUGANG ADD CONSTRAINT FK_TBL_OPENCOU_TO_TBL_SUGANG_1 FOREIGN KEY (
	OPENCOU_CODE
)
REFERENCES TBL_OPENCOU (
	OPENCOU_CODE
);

ALTER TABLE TBL_SUGANG ADD CONSTRAINT FK_TBL_STD_TO_TBL_SUGANG_1 FOREIGN KEY (
	STD_NUMBER
)
REFERENCES TBL_STD (
	STD_NUMBER
);

ALTER TABLE TBL_SCO ADD CONSTRAINT FK_TBL_OPENSUB_TO_TBL_SCO_1 FOREIGN KEY (
	OPENSUB_CODE
)
REFERENCES TBL_OPENSUB (
	OPENSUB_CODE
);

ALTER TABLE TBL_SCO ADD CONSTRAINT FK_TBL_SUGANG_TO_TBL_SCO_1 FOREIGN KEY (
	SUGANG_CODE
)
REFERENCES TBL_SUGANG (
	SUGANG_CODE
);

ALTER TABLE TBL_OPENSUB ADD CONSTRAINT OPENSUB_OPENCOU_CODE_FK FOREIGN KEY (
	OPENCOU_CODE
)
REFERENCES TBL_OPENCOU (
	OPENCOU_CODE
);

ALTER TABLE TBL_OPENSUB ADD CONSTRAINT FK_TBL_PROF_TO_TBL_OPENSUB_1 FOREIGN KEY (
	PROF_CODE
)
REFERENCES TBL_PROF (
	PROF_CODE
);

ALTER TABLE TBL_OPENSUB ADD CONSTRAINT FK_TBL_SUB_TO_TBL_OPENSUB_1 FOREIGN KEY (
	SUB_CODE
)
REFERENCES TBL_SUB (
	SUB_CODE
);

ALTER TABLE TBL_OPENSUB ADD CONSTRAINT FK_TBL_BOOK_TO_TBL_OPENSUB_1 FOREIGN KEY (
	BOOK_CODE
)
REFERENCES TBL_BOOK (
	BOOK_CODE
);

ALTER TABLE TBL_OUT ADD CONSTRAINT FK_TBL_SUGANG_TO_TBL_OUT_1 FOREIGN KEY (
	SUGANG_CODE
)
REFERENCES TBL_SUGANG (
	SUGANG_CODE
);

ALTER TABLE TBL_OUT ADD CONSTRAINT FK_TBL_OUT_REASON_TO_TBL_OUT_1 FOREIGN KEY (
	OUT_REASON_CODE
)
REFERENCES TBL_OUT_REASON (
	OUT_REASON_CODE
);

ALTER TABLE TBL_OPENCOU
ADD CONSTRAINT OPENCOU_END_CK CHECK(OPENCOU_END > OPENCOU_START);



/*
================================================================================
                  �������   ���ν���   �������
================================================================================
*/

--�� ������
-- PRC_ADM_LOGIN		(������ �α���)
create or replace PROCEDURE PRC_ADM_LOGIN 
(LOGIN_PW IN TBL_ADMIN.ADMIN_PW%TYPE)   
IS
    V_ADMIN_CODE TBL_ADMIN.ADMIN_CODE%TYPE;
    V_FLAG NUMBER := 1;
    USER_DEFINE_ERROR1 EXCEPTION;

BEGIN

    SELECT COUNT(*) INTO V_FLAG
    FROM TBL_ADMIN
    WHERE LOGIN_PW = ADMIN_PW;

    IF (V_FLAG = 0)
        THEN RAISE USER_DEFINE_ERROR1;
    END IF;

    SELECT ADMIN_CODE INTO V_ADMIN_CODE
    FROM TBL_ADMIN
    WHERE LOGIN_PW = ADMIN_PW;

    DBMS_OUTPUT.PUT_LINE(V_ADMIN_CODE || ' ������ �α��� �Ϸ�');

    EXCEPTION
        WHEN USER_DEFINE_ERROR1
        THEN RAISE_APPLICATION_ERROR(-20201,'�α��ο� �����߽��ϴ�. �н����带 �ٽ� �Է��ϼ���');
        ROLLBACK;

    COMMIT;

END;






-- PRC_ADMIN_DELETE		(������ ����)
create or replace PROCEDURE PRC_ADMIN_DELETE
( V_ADMIN_PW   IN TBL_ADMIN.ADMIN_PW%TYPE)
IS
    V_FLAG NUMBER := 1;
    V_ADMIN_CODE TBL_ADMIN.ADMIN_CODE%TYPE;
    USER_DEFINE_ERROR1   EXCEPTION;

BEGIN 
    -- �����ϸ� 1, �������ϸ� 0 �������ڵ� ��ȸ
    SELECT COUNT(*) INTO V_FLAG
    FROM TBL_ADMIN
    WHERE V_ADMIN_PW = ADMIN_PW;

    IF(V_FLAG = 0)
        THEN RAISE USER_DEFINE_ERROR1; 
    END IF;

    -- ������ �ڵ� ���
    SELECT ADMIN_CODE INTO V_ADMIN_CODE
    FROM TBL_ADMIN
    WHERE V_ADMIN_PW = ADMIN_PW;

    -- ������ ����
    DELETE  
    FROM TBL_ADMIN
    WHERE V_ADMIN_PW = ADMIN_PW;

    DBMS_OUTPUT.PUT_LINE(V_ADMIN_CODE || ' ������ ����');

    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20203,'�ش� �����ڰ� �����ϴ�.');
            ROLLBACK;

    COMMIT;

END;






-- PRC_ADMIN_INSERT		(������ ���)
create or replace PROCEDURE PRC_ADMIN_INSERT
( V_ADMIN_PW IN TBL_ADMIN.ADMIN_PW%TYPE )
IS
    V_ADMIN_CODE TBL_ADMIN.ADMIN_CODE%TYPE;
    V_FLAG NUMBER := 0;
    USER_DEFINE_ERROR1 EXCEPTION;

BEGIN
    -- PW�� �ִ��� Ȯ��
    -- �����ϸ� 1 
    -- �������� ������ 0
    SELECT COUNT(*) INTO V_FLAG
    FROM TBL_ADMIN
    WHERE V_ADMIN_PW = ADMIN_PW;

    IF(V_FLAG = 1)
        THEN RAISE USER_DEFINE_ERROR1;
    END IF;

    -- ������ �ڵ� ����
    V_ADMIN_CODE := TO_CHAR(TBL_ADMIN_SEQ.NEXTVAL);
    V_ADMIN_CODE := 'ADM' || LPAD(V_ADMIN_CODE,3,'0');

    INSERT INTO TBL_ADMIN(ADMIN_CODE,ADMIN_PW)
    VALUES(V_ADMIN_CODE, V_ADMIN_PW);

    DBMS_OUTPUT.PUT_LINE('������ "' || V_ADMIN_CODE || '"�߰��Ǿ����ϴ�.');

    EXCEPTION
    WHEN USER_DEFINE_ERROR1
        THEN RAISE_APPLICATION_ERROR(-20202,'�ش� ��й�ȣ�� ����� �� �����ϴ�.');
        ROLLBACK;

    COMMIT;

END;






-- PRC_ADMIN_UPDATE		(������ ����)
create or replace PROCEDURE PRC_ADMIN_UPDATE
( V_ADMIN_PW IN TBL_ADMIN.ADMIN_PW%TYPE
, V_ADMIN_NEWPW IN TBL_ADMIN.ADMIN_PW%TYPE)
IS
    V_FLAG NUMBER := 1;
    USER_DEFINE_ERROR1 EXCEPTION;
BEGIN
    -- ���� ��й�ȣ �����ϴ��� Ȯ��
    SELECT COUNT(*) INTO V_FLAG
    FROM TBL_ADMIN
    WHERE V_ADMIN_PW = ADMIN_PW;

    IF(V_FLAG = 0)
        THEN RAISE USER_DEFINE_ERROR1;
    END IF;

    -- ���� ��� ����ó���� UPDATE ����

    UPDATE TBL_ADMIN
    SET ADMIN_PW = V_ADMIN_NEWPW
    WHERE V_ADMIN_PW = ADMIN_PW;

    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20203,'�ش� �����ڰ� �����ϴ�.(��й�ȣ ����ġ)');
            ROLLBACK;
    COMMIT;

END;








--�� ����
-- PRC_BOOK_DELETE		(���� ����)
create or replace PROCEDURE PRC_BOOK_DELETE
( V_BOOK_CODE   IN TBL_BOOK.BOOK_CODE%TYPE
)
IS
    BOOK_CHECK_CODE TBL_BOOK.BOOK_CODE%TYPE;
    USER_DEFINE_ERROR EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;
BEGIN

    -- �����ڵ� ��ȸ
    SELECT NVL((SELECT BOOK_CODE
                FROM TBL_BOOK
                WHERE BOOK_CODE = V_BOOK_CODE), '0') INTO BOOK_CHECK_CODE
    FROM DUAL;

    -- ���� �Ǵ����� �����߻�, �����ڵ尡 ������ ���� �߻�
    IF (BOOK_CHECK_CODE = '0')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;   

    -- �����Ϸ��� ���縦 ���� ������� ������ �ִ��� ��ȸ�� �Ѵ�.
    SELECT NVL((SELECT COUNT(BOOK_CODE)
                FROM TBL_OPENSUB
                WHERE BOOK_CODE = V_BOOK_CODE), '0') INTO BOOK_CHECK_CODE
    FROM DUAL;

    IF (BOOK_CHECK_CODE != '0')
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;

    DELETE
    FROM TBL_BOOK
    WHERE BOOK_CODE = V_BOOK_CODE;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20802, '��ϵ��� ���� �����ڵ��Դϴ�.');
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20803, '�ش� ���縦 �̹� ������Դϴ�.');
        ROLLBACK;
    -- Ŀ��
    COMMIT;
END;





-- PRC_BOOK_INSERT		(���� ���)
create or replace PROCEDURE PRC_BOOK_INSERT
( V_BOOK_NAME   IN TBL_BOOK.BOOK_NAME%TYPE
, V_BOOK_AUTHOR IN TBL_BOOK.BOOK_AUTHOR%TYPE
)
IS
    BOOK_CHECK_NAME TBL_BOOK.BOOK_NAME%TYPE;
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    -- �Է¹��� å �̸��� �ִ��� Ȯ���ϰ� 
    -- BOOK_CHECK_NAME�� ������ �Է� ���� �̸� �״�� �ְ� ������ 0�� �ִ´�.
    SELECT NVL((SELECT BOOK_NAME 
                FROM TBL_BOOK 
                WHERE BOOK_NAME = V_BOOK_NAME), '0') INTO BOOK_CHECK_NAME
    FROM DUAL;

    -- ���ǹ����� BOOK_CHECK_NAME�� å �̸��� �������� ���� �߻�
    -- �װ� �ƴ϶�� INSERT�� �������� �Ѿ��.
    IF (BOOK_CHECK_NAME != '0')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- INSERT ������ ����
    INSERT INTO TBL_BOOK(BOOK_CODE, BOOK_NAME, BOOK_AUTHOR)
    VALUES(('BOK' || LPAD(TO_CHAR(TBL_BOOK_SEQ.NEXTVAL), 3, '0')), V_BOOK_NAME, V_BOOK_AUTHOR);

    -- ���� ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20801, '�̹� ��ϵ� �����Դϴ�.');
            ROLLBACK;
        --WHEN OTHERS
            --THEN ROLLBACK;
    -- Ŀ��
    COMMIT;
END;





-- PRC_BOOK_UPDATE		(���� ����)
create or replace PROCEDURE PRC_BOOK_UPDATE
( V_BOOK_CODE   IN TBL_BOOK.BOOK_CODE%TYPE
, V_BOOK_NAME   IN TBL_BOOK.BOOK_NAME%TYPE
, V_BOOK_AUTHOR IN TBL_BOOK.BOOK_AUTHOR%TYPE  
)
IS
    BOOK_CHECK_CODE TBL_BOOK.BOOK_CODE%TYPE;
    BOOK_CHECK_NAME TBL_BOOK.BOOK_NAME%TYPE;
    USER_DEFINE_ERROR EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;
BEGIN
    -- �����ڵ尡 ������ �Ǵ��ϱ� ���� ��ȸ
    SELECT NVL((SELECT BOOK_CODE
                FROM TBL_BOOK
                WHERE BOOK_CODE = V_BOOK_CODE), '0') INTO BOOK_CHECK_CODE
    FROM DUAL;

    -- ���� �Ǵ����� �����߻�
    IF (BOOK_CHECK_CODE != '0')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- ������� ������ �Ǵ��ϱ� ���� ��ȸ
    SELECT NVL((SELECT BOOK_NAME 
                FROM TBL_BOOK 
                WHERE BOOK_NAME = V_BOOK_NAME), '0') INTO BOOK_CHECK_NAME
    FROM DUAL;

    -- ���� �Ǵ����� �����߻�
    IF (BOOK_CHECK_NAME != '0')
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;


    -- ������Ʈ ������
    UPDATE TBL_BOOK
    SET BOOK_NAME = V_BOOK_NAME, BOOK_AUTHOR = V_BOOK_AUTHOR
    WHERE BOOK_CODE = V_BOOK_CODE;


    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20802, '��ϵ��� ���� �����ڵ��Դϴ�.');
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20803, '�̹� ��ϵ� �����Դϴ�.');
        ROLLBACK;

    -- Ŀ��
    COMMIT;
END;








--�� ���ǽ�
-- PRC_CALSS_INSERT		(���ǽ� ���)
create or replace PROCEDURE PRC_CLASS_INSERT
( V_CLASS_NAME IN TBL_CLASS.CLASS_NAME%TYPE
)

IS
    --�ʿ亯�� 
    --1.�������� �ִ��� Ȯ���� ���� V_CLASS_CHECK
    --2.����� ���� ����
    --CLASS_DEFINE_ERROR1; -20701 '�ش� ���ǽ��� �����մϴ�');

    V_CLASS_CHECK NUMBER(2);
    V_CLASS_CODE TBL_CLASS.CLASS_CODE%TYPE;
    CLASS_DEFINE_ERROR1 EXCEPTION;

BEGIN

    SELECT COUNT(*) INTO V_CLASS_CHECK
    FROM TBL_CLASS
    WHERE CLASS_NAME = V_CLASS_NAME;

    IF(V_CLASS_CHECK != 0)
        THEN RAISE CLASS_DEFINE_ERROR1;
    END IF;

    V_CLASS_CODE := TO_CHAR(SEQ_CLASS.NEXTVAL);
    V_CLASS_CODE := 'CLA' || LPAD(V_CLASS_CODE,3,0);

    INSERT INTO TBL_CLASS(CLASS_CODE, CLASS_NAME)
    VALUES(V_CLASS_CODE, V_CLASS_NAME);

    EXCEPTION
        WHEN CLASS_DEFINE_ERROR1
        THEN RAISE_APPLICATION_ERROR(-20701,'�ش簭�ǽ��� �����մϴ�.');
        ROLLBACK;


END;






-- PRC_CLASS_DELETE		(���ǽ� ����)
create or replace PROCEDURE PRC_CLASS_DELETE
( V_CLASS_NAME IN TBL_CLASS.CLASS_NAME%TYPE 
)
IS
    --�ʿ亯�� 
    --1.�������� �ִ��� Ȯ���� ���� V_CLASS_CHECK
    --2.����� ���� ����
    --CLASS_DEFINE_ERROR1; -20700 '�ش� ���ǽ��� �������� �ʽ��ϴ�.');

    V_CLASS_CHECK NUMBER(2);

    CLASS_DEFINE_ERROR1 EXCEPTION;


BEGIN

    SELECT COUNT(*) INTO V_CLASS_CHECK
    FROM TBL_CLASS
    WHERE CLASS_NAME = V_CLASS_NAME;

    IF(V_CLASS_CHECK = 0)
        THEN RAISE CLASS_DEFINE_ERROR1;
    END IF;

    DELETE
    FROM TBL_CLASS
    WHERE CLASS_NAME = V_CLASS_NAME;

    EXCEPTION
        WHEN CLASS_DEFINE_ERROR1
        THEN RAISE_APPLICATION_ERROR(-20700,'�ش� ���ǽ��� �������� �ʽ��ϴ�.');

END;






-- PRC_CLASS_UPDATE		(���ǽ� ����)
create or replace PROCEDURE PRC_CLASS_UPDATE
( V_CLASS_CODE IN TBL_CLASS.CLASS_CODE%TYPE
, V_CLASS_NAME IN TBL_CLASS.CLASS_NAME%TYPE 
)
                                            
IS
    --�ٲٷ��� ���ǽǸ��� �����ϴ��� Ȯ��
    --�ִٸ� �ش簭�ǽǸ��� �̹� �����Ѵٴ� ����� ���� ����
    --���ٸ� �״�� UPDATE
    V_CLASS_CHECK NUMBER(2);

    CLASS_DEFINE_ERROR1 EXCEPTION;  --20701


BEGIN

    SELECT COUNT(*) INTO V_CLASS_CHECK
    FROM TBL_CLASS
    WHERE CLASS_NAME = V_CLASS_NAME;

    IF(V_CLASS_CHECK != 0)
        THEN RAISE CLASS_DEFINE_ERROR1;
    END IF;

    UPDATE TBL_CLASS
    SET CLASS_NAME = V_CLASS_NAME
    WHERE CLASS_CODE = V_CLASS_CODE;


    EXCEPTION
        WHEN CLASS_DEFINE_ERROR1
        THEN RAISE_APPLICATION_ERROR(-20701,'�ش簭�ǽ��� �����մϴ�.');

END;







--�� ����, ���� ����
-- PRC_COURSE_DELETE		(����, �������� ����)
create or replace PROCEDURE PRC_COURSE_DELETE
( V_COURSE_CODE IN TBL_COURSE.COURSE_CODE%TYPE
)

IS

BEGIN

    DELETE
    FROM TBL_COURSE
    WHERE COURSE_CODE = V_COURSE_CODE;

    COMMIT;

END;






-- PRC_COURSE_INSERT		(����, �������� ���)
create or replace PROCEDURE PRC_COURSE_INSERT
( V_COURSE_NAME   IN TBL_COURSE.COURSE_NAME%TYPE
, V_OPENCOU_START IN TBL_OPENCOU.OPENCOU_START%TYPE
, V_OPENCOU_END IN TBL_OPENCOU.OPENCOU_END%TYPE
, V_CLASS_NAME IN TBL_CLASS.CLASS_NAME%TYPE
)

IS    --INSERT���� �� ���ǽ� ��������  �����ڵ�� ����
    V_COURSE_CODE TBL_COURSE.COURSE_CODE%TYPE;
    V_CLASS_CODE TBL_CLASS.CLASS_CODE%TYPE;
    V_OPENCOU_CODE TBL_OPENCOU.OPENCOU_CODE%TYPE;


    --�ش� �������� �̹� �������̺� �����Ѵٸ�
    EXIST_COURSE_NAME VARCHAR2(5);
    EXIST_CLASS_NAME VARCHAR2(5);
    --����� ���� ���� 2����  1.�ش� �������� ����� 2.���纸�� ������¥�� ������ �Է��Ҽ� ����

    DATE_DEFINE_ERROR1  EXCEPTION;
    DATE_DEFINE_ERROR2  EXCEPTION;




    --����� ������ �Ҵ�� ���ǽǿ� ���� �ٸ� ������ �������϶� ���ϱ� ���� Ŀ��
    --�Է¹��� ���ǽǸ� �ش��ϴ� �ڵ带 ������  ���������� ���� �����ϵ��� �����´�.
    CURSOR CUR_CLASS_CHECK
    IS
    SELECT OPENCOU_END
    FROM TBL_OPENCOU
    WHERE CLASS_CODE IN (SELECT CLASS_CODE FROM TBL_CLASS WHERE CLASS_NAME = V_CLASS_NAME);  

    --Ŀ���� ���� ���� ������ ����

    V_OPENCOU_END_TEMP TBL_OPENCOU.OPENCOU_END%TYPE;



BEGIN
    --���ǽ� �̸��� ��ģ�ٸ�? (��¥ �������� �����)
    OPEN CUR_CLASS_CHECK;                                                --Ŀ�� ����

        LOOP

            FETCH CUR_CLASS_CHECK INTO V_OPENCOU_END_TEMP; 

            EXIT WHEN CUR_CLASS_CHECK%NOTFOUND;

               IF(V_OPENCOU_START <=  V_OPENCOU_END_TEMP)
                    THEN RAISE DATE_DEFINE_ERROR1;
               END IF;

        END LOOP;

    CLOSE CUR_CLASS_CHECK;                                              --Ŀ�� ��



    --��ϰ����� ���� ��¥���� ���̶�� 
    -- �ȵǰ� �ϱ� 

    IF(V_OPENCOU_START < SYSDATE)
        THEN RAISE DATE_DEFINE_ERROR2;
    END IF;

    --���������ڵ� ����    
    V_OPENCOU_CODE := TO_CHAR(SEQ_OPENCOU.NEXTVAL);
    V_OPENCOU_CODE := 'OPC' || LPAD(V_OPENCOU_CODE,3,0);

    --TBL_������ ������ �Է� �׸��� �ڵ� �ڵ� �Է�, �̷��� �����ڵ�� ���� �����̾ ���� ���� ������.
                                                 --�׷��Ƿ� ���� ������ �ִ��� �Ǵ��ϰ� �ش������ �ִٸ� --�ش� ���� ������ V_COURSE_CODE�� ���
                                                --INSERT���� �ѱ�°� �´�.
    SELECT CASE WHEN EXISTS(SELECT 1 FROM TBL_COURSE WHERE COURSE_NAME = V_COURSE_NAME) THEN '1'
                ELSE '0'
                END
                INTO EXIST_COURSE_NAME
                FROM DUAL;


    IF (EXIST_COURSE_NAME = '1')
      THEN SELECT COURSE_CODE INTO V_COURSE_CODE
           FROM TBL_COURSE
           WHERE COURSE_NAME = V_COURSE_NAME;
      ELSE
           --�����ڵ� ����
            V_COURSE_CODE := TO_CHAR(SEQ_COURSE.NEXTVAL);
            V_COURSE_CODE := 'COU' || LPAD(V_COURSE_CODE,3,0);
            INSERT INTO TBL_COURSE(COURSE_CODE, COURSE_NAME)
            VALUES(V_COURSE_CODE, V_COURSE_NAME);
    END IF;


 --���ǽ��� �̹� �����ϴ� ��� �ش� ���ǽ� �ڵ带 ���� �Ἥ INSERT   

     SELECT CASE WHEN EXISTS(SELECT 1 FROM TBL_CLASS WHERE CLASS_NAME = V_CLASS_NAME) THEN '1'
                ELSE '0'
                END
                INTO EXIST_CLASS_NAME
                FROM DUAL;


     IF (EXIST_CLASS_NAME = '1')
      THEN SELECT CLASS_CODE INTO V_CLASS_CODE
           FROM TBL_CLASS
           WHERE CLASS_NAME = V_CLASS_NAME;
      ELSE
            --���� ���ǽ� �̹Ƿ� ���ǽ� �ڵ���� �� ������ �Է�
            V_CLASS_CODE := TO_CHAR(SEQ_CLASS.NEXTVAL);
            V_CLASS_CODE := 'CLA' || LPAD(V_CLASS_CODE,3,0);  
            INSERT INTO TBL_CLASS(CLASS_CODE, CLASS_NAME)
            VALUES(V_CLASS_CODE, V_CLASS_NAME);
    END IF;





    --TBL_���������� ������ �Է� �׸��� �ڵ� �ڵ� �Է�
    INSERT INTO TBL_OPENCOU(OPENCOU_CODE, COURSE_CODE, CLASS_CODE, OPENCOU_START, OPENCOU_END)
    VALUES(V_OPENCOU_CODE, V_COURSE_CODE, V_CLASS_CODE, V_OPENCOU_START, V_OPENCOU_END);


    --����ó��
    EXCEPTION
        WHEN DATE_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20400, '�ش� �������� ���� �������Դϴ�.');
            ROLLBACK;
        WHEN DATE_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20401, '������Ϻ��� ������ ������ �����Ҽ��� �����ϴ�.');



    COMMIT;

END;






-- PRC_COURSE_UPDATE		(����, �������� ����)
create or replace PROCEDURE PRC_COURSE_UPDATE
( V_OPENCOU_CODE   IN TBL_OPENCOU.OPENCOU_CODE%TYPE
, V_COURSE_CODE    IN TBL_OPENCOU.CLASS_CODE%TYPE
, V_OPENCOU_START  IN TBL_OPENCOU.OPENCOU_START%TYPE
, V_OPENCOU_END    IN TBL_OPENCOU.OPENCOU_END%TYPE
, V_CLASS_NAME     IN TBL_CLASS.CLASS_NAME%TYPE
)

IS
    --�ʿ亯��
    --������ ������ �ִ��� ������ �Ǵ��ϱ� ���� V_COURSE_CHECK
    --��� 4���� ���� Ŀ�� CUR_COURSE
    --Ŀ���� ���� V_COURSE_ENDDAY ����
    --���ǽ��� �ִ��� ������ �ɴ��ϱ� ���� V_CLASS_CHECK
    --1,3 �� ����� ���� ����
    
    
    
    V_COURSE_CHECK NUMBER;
    V_CLASS_CHECK NUMBER;
    V_OPENCOU_END_TEMP TBL_OPENCOU.OPENCOU_END%TYPE;
    V_CLASS_CODE TBL_OPENCOU.CLASS_CODE%TYPE;

    CLASS_DEFINE_ERROR1 EXCEPTION;
    COURSE_DEFINE_ERROR1 EXCEPTION;
    DATE_DEFINE_ERROR1 EXCEPTION; -- -20400
    DATE_DEFINE_ERROR2 EXCEPTION; -- -20401     --���糯¥ ���� ������ ���� ���� �Է��� �Ұ����ϰ� �Ѱſ��µ�
                                               --���� �������� �߸��Է��ؼ� �����ؾ� �Ѵٸ�?.... �ֵ��̶� ����غ���



BEGIN

  --�ʿ� ���
  --1.�ִ� �����ڵ������� Ȯ���� ������ ����
  -- �ִ� �����ڵ��� �ش� �������� �ٲ�
  --2. ���ǽ� �ڵ尡 �ִ��� Ȯ���� ������ ����
  --3. ���ǽ� �ڵ尡 �ִٸ� ���ǽ��� ������� �������� ���� ���ᳯ¥��
  --  ����ڰ� �Է��� ���� ���۳�¥�� ��
  --4.3���� �������� ���ǽ� �ڵ尡 ���°��� �ɷ������Ƿ�
  --  CLASS_CODE��Ƽ� UPDATE����



    --1.
    SELECT COUNT(*) INTO V_COURSE_CHECK
    FROM TBL_COURSE
    WHERE COURSE_CODE = V_COURSE_CODE;


    IF (V_COURSE_CHECK = 0)
        THEN RAISE COURSE_DEFINE_ERROR1;
    END IF;


    --2. ���ǽ��ڵ忡 ���� ���ǽ� �̸��� ������Ƿ�
    -- ���ǽ� �̸����� ���ص� �ȴ�. 
    SELECT COUNT(*) INTO V_CLASS_CHECK
    FROM TBL_CLASS
    WHERE CLASS_NAME = V_CLASS_NAME;


    IF (V_CLASS_CHECK =0)
        THEN RAISE CLASS_DEFINE_ERROR1;

    ELSE
        --3.
        DECLARE
            CURSOR CUR_COURSE_CHECK
            IS
            SELECT OPENCOU_END
            FROM TBL_OPENCOU
            WHERE CLASS_CODE IN (SELECT CLASS_CODE FROM TBL_CLASS WHERE CLASS_NAME = V_CLASS_NAME)
                  AND OPENCOU_CODE != V_OPENCOU_CODE;

        BEGIN

            OPEN CUR_COURSE_CHECK;
                LOOP

                FETCH CUR_COURSE_CHECK INTO V_OPENCOU_END_TEMP;

                EXIT WHEN CUR_COURSE_CHECK%NOTFOUND;

                IF(V_OPENCOU_START <= V_OPENCOU_END_TEMP )
                    THEN RAISE DATE_DEFINE_ERROR1;
                END IF;

                END LOOP;

            CLOSE CUR_COURSE_CHECK;

        END;

    END IF;

    --4.
    --CLASS_NAME�� ���� CLASS_CODE ���
    --CLASS_CODE�� �������� �ʴ´ٸ� EMPTY���� �����⿡ EXISTS���

    SELECT CLASS_CODE INTO V_CLASS_CODE
    FROM TBL_CLASS
    WHERE CLASS_NAME = V_CLASS_NAME;


    --���̺� ������Ʈ
    UPDATE TBL_OPENCOU
    SET   COURSE_CODE = V_COURSE_CODE
         , CLASS_CODE = V_CLASS_CODE
         , OPENCOU_START = V_OPENCOU_START
         , OPENCOU_END = V_OPENCOU_END
    WHERE OPENCOU_CODE = V_OPENCOU_CODE;







    --����ó��
    EXCEPTION
        WHEN COURSE_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20402, '�ش������ �������� �ʽ��ϴ�. ���� ����ϼ���');
            ROLLBACK;
        WHEN CLASS_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20700, '�ش簭������ �������� �ʽ��ϴ�. ���� ����ϼ���');
            ROLLBACK;
        WHEN DATE_DEFINE_ERROR1 -- -20400
            THEN RAISE_APPLICATION_ERROR(-20400, '�ش� ���ǽ��� ������Դϴ�.');
            ROLLBACK;

END;








--�� ��������
-- PRC_OPENSUB_DELETE		(�������� ����)
create or replace PROCEDURE PRC_OPENSUB_DELETE
( V_OPENSUB_CODE IN TBL_OPENSUB.OPENSUB_CODE%TYPE
)
IS
    CHECK_OPENSUB_CODE NUMBER;

    V_SCO_ATTEND NUMBER;
    V_SCO_WRITE NUMBER;
    V_SCO_PRAC NUMBER;

    USER_DEFINE_ERROR1 EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;
BEGIN   

    SELECT COUNT(*) INTO CHECK_OPENSUB_CODE
    FROM TBL_OPENSUB
    WHERE OPENSUB_CODE = V_OPENSUB_CODE;

    IF (CHECK_OPENSUB_CODE = 0)
        THEN RAISE USER_DEFINE_ERROR1;
    END IF;

    -- ������ �� �ִٸ� ������ �ȵǰ� �Ѵ�.
    SELECT  SCO_ATTEND, SCO_WRITE, SCO_PRAC INTO V_SCO_ATTEND, V_SCO_WRITE, V_SCO_PRAC
    FROM TBL_SCO
    WHERE OPENSUB_CODE = V_OPENSUB_CODE;

    IF (V_SCO_ATTEND >= 0)
        THEN RAISE USER_DEFINE_ERROR2;
    ELSIF (V_SCO_WRITE >= 0)
        THEN RAISE USER_DEFINE_ERROR2;
    ELSIF (V_SCO_PRAC >= 0)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;

    -- ����
    DELETE
    FROM TBL_OPENSUB
    WHERE OPENSUB_CODE = V_OPENSUB_CODE;

    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20512, '���� ������ �����ϴ�.');
                ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20518, '������ �ԷµǾ� �־� �����Ұ��մϴ�.');
                ROLLBACK;

    COMMIT;
END;






-- PRC_OPENSUB_INSERT		(�������� ���)
create or replace PROCEDURE PRC_OPENSUB_INSERT
( V_OPENCOU_CODE        IN TBL_OPENCOU.OPENCOU_CODE%TYPE
, V_SUB_CODE            IN TBL_SUB.SUB_CODE%TYPE
, V_PROF_CODE           IN TBL_PROF.PROF_CODE%TYPE
, V_BOOK_CODE           IN TBL_BOOK.BOOK_CODE%TYPE
, V_OPENSUB_START       IN TBL_OPENSUB.OPENSUB_START%TYPE
, V_OPENSUB_END         IN TBL_OPENSUB.OPENSUB_END%TYPE
, V_OPENSUB_ATTEND      IN TBL_OPENSUB.OPENSUB_ATTEND%TYPE
, V_OPENSUB_WRITE       IN TBL_OPENSUB.OPENSUB_WRITE%TYPE
, V_OPENSUB_PRAC        IN TBL_OPENSUB.OPENSUB_PRAC%TYPE
)
IS
    OPENCOU_CHECK_CODE      TBL_OPENCOU.OPENCOU_CODE%TYPE;
    SUB_CHECK_CODE      TBL_SUB.SUB_CODE%TYPE;
    PROF_CHECK_CODE         TBL_PROF.PROF_CODE%TYPE;
    BOOK_CHECK_CODE         TBL_BOOK.BOOK_CODE%TYPE;

    V_OPENSUB_CODE TBL_OPENSUB.OPENSUB_CODE%TYPE;

    COU_START DATE; --���� ���� ������
    COU_END DATE; --���� ���� ������

    OLD_START DATE; --���� ���� ������
    OLD_END DATE; --���� ���� ������

    CURSOR CUR_CHECK_DATE
    IS
    SELECT OPENSUB_START, OPENSUB_END
    FROM TBL_OPENSUB
    WHERE OPENCOU_CODE = V_OPENCOU_CODE
      AND SUB_CODE = V_SUB_CODE;


    -- ���� ����
    USER_DEFINE_ERROR1 EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;
    USER_DEFINE_ERROR3 EXCEPTION;
    USER_DEFINE_ERROR4 EXCEPTION;
    USER_DEFINE_ERROR5 EXCEPTION;
    USER_DEFINE_ERROR6 EXCEPTION;
    USER_DEFINE_ERROR7 EXCEPTION;
BEGIN
    -- ������ ������ 100�� �Ǿ�� �Ѵ�. �ȵǸ� ���� �߻�
    IF (V_OPENSUB_ATTEND + V_OPENSUB_WRITE + V_OPENSUB_PRAC != 100)
        THEN RAISE USER_DEFINE_ERROR1;
    END IF;

    -- ���� ���� üũ
    SELECT NVL(MAX(OPENCOU_CODE), '0') INTO OPENCOU_CHECK_CODE
    FROM TBL_OPENCOU
    WHERE OPENCOU_CODE = V_OPENCOU_CODE;

    IF (OPENCOU_CHECK_CODE = '0')
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;

    -- ���� ���� üũ
    SELECT NVL(MAX(SUB_CODE), '0') INTO SUB_CHECK_CODE
    FROM TBL_SUB
    WHERE SUB_CODE = V_SUB_CODE;

    IF (SUB_CHECK_CODE = '0')
        THEN RAISE USER_DEFINE_ERROR3;
    END IF;

    -- ���� ���� üũ
    SELECT NVL(MAX(PROF_CODE), '0') INTO PROF_CHECK_CODE
    FROM TBL_PROF
    WHERE PROF_CODE = V_PROF_CODE;

    IF (PROF_CHECK_CODE = '0')
        THEN RAISE USER_DEFINE_ERROR4;
    END IF;


    -- ���� ���� üũ
    SELECT NVL(MAX(BOOK_CODE), '0') INTO BOOK_CHECK_CODE
    FROM TBL_BOOK
    WHERE BOOK_CODE = V_BOOK_CODE;

    IF (BOOK_CHECK_CODE = '0')
        THEN RAISE USER_DEFINE_ERROR5;
    END IF;



    -- ���� �����ϰ� ������ ��������
    SELECT OPENCOU_START, OPENCOU_END INTO COU_START, COU_END
    FROM TBL_OPENCOU
    WHERE OPENCOU_CODE = V_OPENCOU_CODE;

    -- ����������ڰ� ���纸�� �����̸� �ȵ�
    IF (V_OPENSUB_START < SYSDATE
        -- ���� �����ϰ� ���� �������� ���� �����ϰ� ���� ������ ���̿� �־�� ��
        OR V_OPENSUB_START NOT BETWEEN COU_START AND COU_END
        OR V_OPENSUB_END NOT BETWEEN COU_START AND COU_END)
        THEN RAISE USER_DEFINE_ERROR6;
    END IF;



    -- ������ �ִ� ������ ������, ������ ������ ��ġ�� �ȵȴ�.
    -- Ŀ�� ����
    OPEN CUR_CHECK_DATE;
        LOOP
            -- FETCH ��������޾Ƽ�ó��
            FETCH CUR_CHECK_DATE INTO OLD_START, OLD_END;

            EXIT WHEN CUR_CHECK_DATE%NOTFOUND; --Ŀ���� ������ EXIT

            -- �Է��� ���� �������� ������ ��������� ����, �����̰�
            -- �Է��� ���� �������� ������ ��������� ����, �����̸� ���� �߻�
            IF (V_OPENSUB_START <= OLD_START AND V_OPENSUB_END >= OLD_START)
                THEN RAISE USER_DEFINE_ERROR7;            
            -- �Է��� ���� �������� ������ ��������� ����, �����̰�
            -- �Է��� ���� �������� ������ ���������� ����, �����̸� ���� �߻�
            ELSIF (V_OPENSUB_START <= OLD_END AND V_OPENSUB_END >= OLD_END)
                THEN RAISE USER_DEFINE_ERROR7;            
            -- �Է��� ���� �������� �����ǰ�������� ����, �����̰�
            -- �Է��� ���� �������� ������ ���������� ����, �����̸� ���� �߻�
            ELSIF (V_OPENSUB_START >= OLD_START AND V_OPENSUB_END >= OLD_END)
                THEN RAISE USER_DEFINE_ERROR7;
            END IF;
        END LOOP;

    CLOSE CUR_CHECK_DATE;


    -- ���������ڵ� �Է�
    V_OPENSUB_CODE := 'OSJ' || LPAD(TO_CHAR(TBL_OPENSUB_SEQ.NEXTVAL), 3, '0');

    -- INSERT ������
    INSERT INTO TBL_OPENSUB(OPENSUB_CODE, OPENCOU_CODE, PROF_CODE, SUB_CODE, BOOK_CODE
    , OPENSUB_START, OPENSUB_END, OPENSUB_ATTEND, OPENSUB_WRITE, OPENSUB_PRAC)
    VALUES(V_OPENSUB_CODE, V_OPENCOU_CODE, V_PROF_CODE, V_SUB_CODE, V_BOOK_CODE
    , V_OPENSUB_START, V_OPENSUB_END, V_OPENSUB_ATTEND, V_OPENSUB_WRITE, V_OPENSUB_PRAC);

    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20511, '���� ������ 100���̾�� �մϴ�.');            
            ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20512, '���� ������ �����ϴ�.');
            ROLLBACK;
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20513, '�ش� ������ �����ϴ�.');
            ROLLBACK;            
        WHEN USER_DEFINE_ERROR4
            THEN RAISE_APPLICATION_ERROR(-20514, '�ش� ������ �����ϴ�.');
            ROLLBACK;            
        WHEN USER_DEFINE_ERROR5
            THEN RAISE_APPLICATION_ERROR(-20515, '�ش� ����� �����ϴ�.');
            ROLLBACK;            
        WHEN USER_DEFINE_ERROR6
            THEN RAISE_APPLICATION_ERROR(-20516, '������ �����Ϸ��� ������������ ����/���Ŀ��� ������ �� �����ϴ�.');
            ROLLBACK;
        WHEN USER_DEFINE_ERROR7
            THEN RAISE_APPLICATION_ERROR(-20517, '�Է±Ⱓ �߿� �������� ������ �ֽ��ϴ�.');
            ROLLBACK;

    -- Ŀ�� 
    COMMIT;
END;






-- PRC_OPENSUB_UPDATE		(�������� ����)
create or replace PROCEDURE PRC_OPENSUB_UPDATE
( V_OPENSUB_CODE        IN TBL_OPENSUB.OPENSUB_CODE%TYPE
, V_OPENSUB_START       IN TBL_OPENSUB.OPENSUB_START%TYPE
, V_OPENSUB_END         IN TBL_OPENSUB.OPENSUB_END%TYPE
, V_OPENCOU_CODE       IN TBL_OPENCOU.OPENCOU_CODE%TYPE
, V_BOOK_CODE           IN TBL_BOOK.BOOK_CODE%TYPE
, V_SUB_CODE            IN TBL_SUB.SUB_CODE%TYPE
, V_OPENSUB_ATTEND      IN TBL_OPENSUB.OPENSUB_ATTEND%TYPE
, V_OPENSUB_WRITE       IN TBL_OPENSUB.OPENSUB_WRITE%TYPE
, V_OPENSUB_PRAC        IN TBL_OPENSUB.OPENSUB_PRAC%TYPE
)
IS
    CHECK_OPENCOU_CODE TBL_OPENCOU.OPENCOU_CODE%TYPE;
    CHECK_OPENSUB_CODE TBL_OPENSUB.OPENSUB_CODE%TYPE;
    OPENSUB_CODE_CHECK TBL_OPENSUB.OPENSUB_CODE%TYPE;

    USER_DEFINE_ERROR0 EXCEPTION;

    USER_DEFINE_ERROR1 EXCEPTION; -- ������ ���� �� ���� �߻�
    USER_DEFINE_ERROR2 EXCEPTION; -- ������ ���� �� ���� �߻�
    USER_DEFINE_ERROR3 EXCEPTION; -- ���� ����� �Ⱓ ��ĥ�� ����
    USER_DEFINE_ERROR4 EXCEPTION; -- ���� ���� ���� �߻�
    USER_DEFINE_ERROR5 EXCEPTION; -- ���� ������, ������ ���� �����϶� ���� �߻�

    V_OPENCOU_START TBL_OPENCOU.OPENCOU_START%TYPE;
    V_OPENCOU_END TBL_OPENCOU.OPENCOU_END%TYPE;

    OPENSUB_OLD_START DATE;
    OPENSUB_OLD_END DATE;

    CURSOR CUR_CHECK_DATE
    IS
    SELECT OPENSUB_START, OPENSUB_END
    FROM TBL_OPENSUB
    WHERE OPENCOU_CODE = V_OPENCOU_CODE
      AND SUB_CODE != V_SUB_CODE;
BEGIN

    -- ���������ڵ� üũ
    SELECT NVL(MAX(OPENSUB_CODE), '0') INTO OPENSUB_CODE_CHECK
    FROM TBL_OPENSUB
    WHERE OPENSUB_CODE = V_OPENSUB_CODE;

    IF (OPENSUB_CODE_CHECK = '0')
        THEN RAISE USER_DEFINE_ERROR0;
    END IF;

    -- ���� ���� üũ
    SELECT NVL(MAX(OPENCOU_CODE), '0') INTO CHECK_OPENCOU_CODE
    FROM TBL_OPENSUB
    WHERE OPENCOU_CODE = V_OPENCOU_CODE;

    IF (CHECK_OPENCOU_CODE = '0')
        THEN RAISE USER_DEFINE_ERROR1;
    END IF;

    -- ���� ������, ���� ������ ���� ���� üũ
    SELECT OPENCOU_START, OPENCOU_END INTO V_OPENCOU_START, V_OPENCOU_END
    FROM TBL_OPENCOU
    WHERE OPENCOU_CODE = V_OPENCOU_CODE;

    -- ���� �Է��� ���� �������� ������ ���� �����Ϻ��� �����̰ų�
    -- ���� �Է��� ���� �������� ������ ���� �����Ϻ��� �����̰ų�
    IF (V_OPENSUB_START < V_OPENCOU_START OR V_OPENSUB_END > V_OPENCOU_END)
        THEN RAISE USER_DEFINE_ERROR3;
    END IF;

    -- ���� 100�� �ʰ��� �����߻�
    IF (V_OPENSUB_ATTEND + V_OPENSUB_WRITE + V_OPENSUB_PRAC != 100)
        THEN RAISE USER_DEFINE_ERROR4;
    END IF;


    -- ������ �ִ� ������ �Ⱓ�� ��ĥ ��� ���� �߻�
    OPEN CUR_CHECK_DATE;

    LOOP
        FETCH CUR_CHECK_DATE INTO OPENSUB_OLD_START, OPENSUB_OLD_END;
        EXIT WHEN CUR_CHECK_DATE%NOTFOUND;

        -- �Է��� ����������� ����, �����̰� �Է��� ������������ ����, �����̸� �����߻�
        IF (V_OPENSUB_START <= OPENSUB_OLD_START AND V_OPENSUB_END >= OPENSUB_OLD_END)
            THEN RAISE USER_DEFINE_ERROR5;
        ELSIF (V_OPENSUB_START <= OPENSUB_OLD_END AND V_OPENSUB_END >= OPENSUB_OLD_END)
            THEN RAISE USER_DEFINE_ERROR5;    
        ELSIF (V_OPENSUB_START >= OPENSUB_OLD_START AND V_OPENSUB_END <= OPENSUB_OLD_END)
            THEN RAISE USER_DEFINE_ERROR5;  
        END IF;
    END LOOP;

    CLOSE CUR_CHECK_DATE;


    UPDATE TBL_OPENSUB
    SET OPENSUB_START = V_OPENSUB_START
    , OPENSUB_END = V_OPENSUB_END
    , OPENSUB_ATTEND = V_OPENSUB_ATTEND
    , OPENSUB_WRITE = V_OPENSUB_WRITE
    , OPENSUB_PRAC = V_OPENSUB_PRAC
    , BOOK_CODE = V_BOOK_CODE
    , OPENCOU_CODE = V_OPENCOU_CODE
    , SUB_CODE = V_SUB_CODE
    WHERE OPENSUB_CODE = V_OPENSUB_CODE;



    EXCEPTION
        WHEN USER_DEFINE_ERROR0
            THEN RAISE_APPLICATION_ERROR(-20961, '���� ���� �ڵ尡 �����ϴ�.');
                ROLLBACK;

        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20961, '���� ������ �����ϴ�.');
                ROLLBACK;

        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20963, '���� ������ ���� ���� �Ⱓ���� ����/������ �� �����ϴ�.');
                ROLLBACK;

        WHEN USER_DEFINE_ERROR4
            THEN RAISE_APPLICATION_ERROR(-20964, '������ ������ 100�� �̾�� �մϴ�.');
                ROLLBACK;

        WHEN USER_DEFINE_ERROR5
            THEN RAISE_APPLICATION_ERROR(-20965, '�ش� �Ⱓ�� ���� ���� ������ �ֽ��ϴ�.');
                ROLLBACK;

    --Ŀ��
    COMMIT;

END;







--�� �ߵ�Ż��
-- PRC_OUT_INSERT		(�ߵ�Ż�� ���)
create or replace PROCEDURE PRC_OUT_INSERT
( V_SUGANG_CODE         IN TBL_OUT.SUGANG_CODE%TYPE
, V_OUT_REASON_CODE     IN TBL_OUT.OUT_REASON_CODE%TYPE
)
IS
    -- üũ�� �ڵ� ����
    CHECK_OUT_CODE TBL_OUT.OUT_CODE%TYPE;
    CHECK_SUGANG_CODE TBL_SUGANG.SUGANG_CODE%TYPE;
    CHECK_OUT_REASON_CODE TBL_OUT_REASON.OUT_REASON_CODE%TYPE;

    CHECK_SUGANG_CODE2 NUMBER;
    -- �ߵ�Ż�� �ڵ�
    V_OUT_CODE TBL_OUT.OUT_CODE%TYPE;

    -- ���� �����ϰ� ������
    V_OPENCOU_START TBL_OPENCOU.OPENCOU_START%TYPE;
    V_OPENCOU_END TBL_OPENCOU.OPENCOU_END%TYPE;

    -- ���� ó��
    USER_DEFINE_ERROR1 EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;
    USER_DEFINE_ERROR3 EXCEPTION;
    USER_DEFINE_ERROR4 EXCEPTION;
BEGIN

    -- �����ڵ尡 ������ ����, ������ ���� �߻�
    SELECT NVL((SELECT SUGANG_CODE FROM TBL_SUGANG WHERE SUGANG_CODE = V_SUGANG_CODE), '0') INTO CHECK_SUGANG_CODE
    FROM DUAL;

    IF (CHECK_SUGANG_CODE = '0')
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;


    -- OUT���̺� �����ڵ尡 �̹� �ִ� ���̸� ���� �߻�
    SELECT COUNT(*) INTO CHECK_SUGANG_CODE2
    FROM TBL_OUT
    WHERE SUGANG_CODE = V_SUGANG_CODE;

    IF (CHECK_SUGANG_CODE2 >= 1)
        THEN RAISE USER_DEFINE_ERROR1;
    END IF;


    -- Ż�������ڵ尡 ������ ����, ������ ���� �߻�
    SELECT NVL((SELECT OUT_REASON_CODE FROM TBL_OUT_REASON WHERE OUT_REASON_CODE = V_OUT_REASON_CODE), '0') INTO CHECK_OUT_REASON_CODE
    FROM DUAL;

    IF (CHECK_OUT_REASON_CODE = '0')
        THEN RAISE USER_DEFINE_ERROR3;
    END IF;   


    -- ���������ϰ� ������ ���̿� ���� ������ �ߵ� ����,Ż����ų �� ���� ó���Ѵ�.
    -- ������û ���̺� �ִ� ���� �ڵ�� �Է��� �����ڵ尡 ���� ���� ã��
    -- �����ڵ带 ��������
    -- �� �����ڵ尡 �����������̺� �ִ� �����ڵ�� ���� ����
    -- �������� ������, �������� �������� �����´�.
    SELECT OPENCOU_START, OPENCOU_END INTO V_OPENCOU_START, V_OPENCOU_END
    FROM TBL_OPENCOU
    WHERE OPENCOU_CODE = (SELECT OPENCOU_CODE FROM TBL_SUGANG WHERE SUGANG_CODE = V_SUGANG_CODE);

    IF (SYSDATE NOT BETWEEN V_OPENCOU_START AND V_OPENCOU_END)
        THEN RAISE USER_DEFINE_ERROR4;
    END IF;


    -- INSERT ����
    INSERT INTO TBL_OUT(OUT_CODE, SUGANG_CODE, OUT_REASON_CODE, OUT_DATE)
    VALUES(('OUT' || LPAD(TO_CHAR(TBL_OUT_SEQ.NEXTVAL), 3, '0')), V_SUGANG_CODE, V_OUT_REASON_CODE, SYSDATE);

    -- ���� �̴��� ���� ����ؼ� �ߵ�Ż���� ��Ͻ�Ű���� ������ ������ �������������� ���������ʾ�����..?

    -- ����ó�� 
    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20971, '�̹� �ش� ������ �ߵ� ����,Ż���� �л��Դϴ�.');
            ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20972, '�������� ���� �����ڵ��Դϴ�.');
            ROLLBACK;  
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20973, '�������� ���� Ż�������ڵ��Դϴ�.');
            ROLLBACK;  
        WHEN USER_DEFINE_ERROR4
            THEN RAISE_APPLICATION_ERROR(-20974, 'ó���� �� �ִ� �����Ⱓ�� �ƴմϴ�.');
            ROLLBACK;  

    -- Ŀ��
    COMMIT;
END;






-- PRC_OUT_UPDATE		(�ߵ�Ż�� ����)
create or replace PROCEDURE PRC_OUT_UPDATE
( V_OUT_CODE        IN TBL_OUT.OUT_CODE%TYPE
, V_OUT_REASON_CODE IN TBL_OUT_REASON.OUT_REASON_CODE%TYPE
)
IS
    CHECK_OUT_REASON_CODE TBL_OUT_REASON.OUT_REASON_CODE%TYPE;

    USER_DEFINE_ERROR1 EXCEPTION;
BEGIN

    -- ���� ���� �ߵ�Ż�������ڵ尡 �ߵ�Ż�����̺� �����ϴ� �ڵ����� Ȯ��
    SELECT NVL((SELECT OUT_REASON_CODE 
                FROM TBL_OUT_REASON 
                WHERE OUT_REASON_CODE = V_OUT_REASON_CODE), '0') INTO CHECK_OUT_REASON_CODE
    FROM DUAL;

    IF (CHECK_OUT_REASON_CODE != '0')
        THEN RAISE USER_DEFINE_ERROR1;
    END IF;

    UPDATE TBL_OUT
    SET OUT_REASON_CODE = V_OUT_REASON_CODE
    WHERE OUT_CODE = V_OUT_CODE;

    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20973, '�������� ���� Ż�������ڵ��Դϴ�.');
            ROLLBACK;

    COMMIT;

END;









--�� �ߵ�Ż�� ����
-- PRC_OUT_REASON_DELETE	(�ߵ�Ż�� ���� ����)
create or replace PROCEDURE PRC_OUT_REASON_DELETE
( V_OUT_REASON_CODE IN TBL_OUT_REASON.OUT_REASON_CODE%TYPE
)
IS

    CHECK_OUT_REASON_CODE TBL_OUT_REASON.OUT_REASON_CODE%TYPE;
    CHECK_OUT_REASON_CODE_COUNT TBL_OUT.OUT_CODE%TYPE;

    USER_DEFINE_ERROR1 EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;

BEGIN

    -- �ߵ�Ż������ ���̺� �����ڵ尡 �ִ��� üũ ����
    SELECT NVL((SELECT OUT_REASON_CODE 
                FROM TBL_OUT_REASON
                WHERE OUT_REASON_CODE = V_OUT_REASON_CODE),'0') INTO CHECK_OUT_REASON_CODE
    FROM DUAL;

    IF (CHECK_OUT_REASON_CODE = '0')
        THEN RAISE USER_DEFINE_ERROR1;
    END IF;

    -- �ߵ�Ż�� ���̺� �����ڵ尡 �����ִ����� üũ�ϴ� ����
    SELECT COUNT(*) INTO CHECK_OUT_REASON_CODE_COUNT
    FROM TBL_OUT
    WHERE OUT_REASON_CODE = V_OUT_REASON_CODE;

    IF (CHECK_OUT_REASON_CODE_COUNT != 0)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;

    -- DELETE ������
    DELETE 
    FROM TBL_OUT_REASON
    WHERE OUT_REASON_CODE = V_OUT_REASON_CODE;

    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20961, '�������� �ʴ� �����ڵ��Դϴ�.');
            ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20962, '�ߵ�Ż�����̺� �Էµ� �����ڵ��Դϴ�.');
            ROLLBACK;
    --Ŀ��
    COMMIT;
END;






-- PRC_OUT_REASON_INSERT	(�ߵ�Ż�� ���� ���)
create or replace PROCEDURE PRC_OUT_REASON_INSERT
( V_OUT_REASON IN TBL_OUT_REASON.OUT_REASON%TYPE
)
IS
BEGIN
    -- INSERT ������
    INSERT INTO TBL_OUT_REASON(OUT_REASON_CODE, OUT_REASON)
    VALUES(('OR' || LPAD(TO_CHAR(TBL_OUT_REASON_SEQ.NEXTVAL), 3, '0')), V_OUT_REASON);

    -- Ŀ��
    COMMIT;
END;






-- PRC_OUT_REASON_UPDATE	(�ߵ�Ż�� ���� ����)
create or replace PROCEDURE PRC_OUT_REASON_UPDATE
( V_OUT_REASON_CODE IN TBL_OUT_REASON.OUT_REASON_CODE%TYPE
, V_OUT_REASON IN TBL_OUT_REASON.OUT_REASON%TYPE
)
IS
    CHECK_OUT_REASON_CODE TBL_OUT_REASON.OUT_REASON_CODE%TYPE;
    USER_DEFINE_ERROR EXCEPTION;
BEGIN

    -- �ߵ�Ż�������ڵ� üũ ����
    SELECT NVL((SELECT OUT_REASON_CODE 
                FROM TBL_OUT_REASON
                WHERE OUT_REASON_CODE = V_OUT_REASON_CODE),'0') INTO CHECK_OUT_REASON_CODE
    FROM DUAL;

    IF (CHECK_OUT_REASON_CODE = '0')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;


    --UPDATE ������
    UPDATE TBL_OUT_REASON
    SET OUT_REASON = V_OUT_REASON
    WHERE OUT_REASON_CODE = V_OUT_REASON_CODE;

    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20961, '�������� �ʴ� �����ڵ��Դϴ�.');
            ROLLBACK;

    --Ŀ��
    COMMIT;
END;







--�� ������
-- PRC_PROF_DELETE		(������ ����)
create or replace PROCEDURE PRC_PROF_DELETE
( V_PROF_CODE   IN TBL_PROF.PROF_CODE%TYPE
)
IS

BEGIN

    -- ���� �ڵ�� ��ġ�ϴ� ���� ����
    DELETE
    FROM TBL_PROF
    WHERE PROF_CODE = V_PROF_CODE;

    --TBL_�������� �����ڵ�� ��ġ�ϴ� ���� ����
    DELETE
    FROM TBL_OPENSUB
    WHERE PROF_CODE = V_PROF_CODE;

    COMMIT;

END;






-- PRC_PROF_INSERT		(������ ���)
create or replace PROCEDURE PRC_PROF_INSERT
( V_PROF_NAME IN TBL_PROF.PROF_NAME%TYPE
, V_PROF_RRN  IN TBL_PROF.PROF_RRN%TYPE
, V_PROF_TEL  IN TBL_PROF.PROF_TEL%TYPE
)
IS
    V_PROF_CODE     TBL_PROF.PROF_CODE%TYPE;
    V_PROF_PW       TBL_PROF.PROF_PW%TYPE;

    E_PROF_RRN    TBL_PROF.PROF_RRN%TYPE := '0'; --�ߺ�üũ������ ����

    PROF_DEFINE_ERROR1   EXCEPTION;
    PROF_DEFINE_ERROR2   EXCEPTION;
BEGIN
    -------������Ȳ-------
    --�� �ֹι�ȣ �ߺ�
    --�Է¹��� �ֹι�ȣ�� ��ġ�ϴ� �ֹι�ȣ ���
    BEGIN
        SELECT PROF_RRN INTO E_PROF_RRN FROM TBL_PROF  WHERE PROF_RRN=V_PROF_RRN;


        --���������� ����ؼ� �ֹι�ȣ�� �ߺ��˻�
        IF(E_PROF_RRN IS NOT NULL)
            THEN RAISE PROF_DEFINE_ERROR1;
        END IF;

        EXCEPTION 
        WHEN NO_DATA_FOUND 
        THEN E_PROF_RRN := NULL;
    END;


    --�� �Է½Ǽ�
    IF(V_PROF_RRN NOT LIKE '______-_______' )
        THEN RAISE PROF_DEFINE_ERROR2;
    END IF;

    IF(V_PROF_TEL NOT LIKE '___-____-____')
        THEN RAISE PROF_DEFINE_ERROR2;
    END IF;



    --������ ����ؼ� �����ڵ尪 ����
    V_PROF_CODE := TO_CHAR(PROF_CODE_SEQ.NEXTVAL);
    V_PROF_CODE := 'PRO' || LPAD(V_PROF_CODE,3,'0');


    --�޾ƿ� �ֹι�ȣ ���ڸ��� ��й�ȣ
    V_PROF_PW := SUBSTR(V_PROF_RRN,8);

    -- INSERT
    INSERT INTO TBL_PROF(PROF_CODE, PROF_PW, PROF_NAME, PROF_RRN, PROF_TEL)
    VALUES (V_PROF_CODE, V_PROF_PW, V_PROF_NAME, V_PROF_RRN, V_PROF_TEL);


    --����ó��
    EXCEPTION
    WHEN PROF_DEFINE_ERROR1
        THEN RAISE_APPLICATION_ERROR(-20101,'�ֹι�ȣ�� �ߺ��˴ϴ�.');
        ROLLBACK;
    WHEN PROF_DEFINE_ERROR2
        THEN RAISE_APPLICATION_ERROR(-20102,'�Էµ� ������ �߸��Ǿ����ϴ�.');
        ROLLBACK;


    COMMIT;

END;






-- PRC_PROF_UPDATE		(������ ����)
create or replace PROCEDURE PRC_PROF_UPDATE
( V_PROF_CODE   IN TBL_PROF.PROF_NAME%TYPE
, V_PROF_NAME   IN TBL_PROF.PROF_NAME%TYPE
, V_PROF_TEL    IN TBL_PROF.PROF_NAME%TYPE
)
IS
    
    PROF_DEFINE_ERROR2   EXCEPTION;
BEGIN
    -------������Ȳ-------
    -- �Է½Ǽ�
    IF(V_PROF_TEL NOT LIKE '___-____-____')
        THEN RAISE PROF_DEFINE_ERROR2;
    END IF;



    --������Ʈ (�̸�, ��ȭ��ȣ)
    UPDATE TBL_PROF
    SET   PROF_NAME = V_PROF_NAME
        , PROF_TEL = V_PROF_TEL
    WHERE PROF_CODE = V_PROF_CODE;

    --����ó��
    EXCEPTION
    --WHEN PROF_DEFINE_ERROR1
    --    THEN RAISE_APPLICATION_ERROR(-20101,'�ֹι�ȣ�� �ߺ��˴ϴ�.');
    --    ROLLBACK;
    WHEN PROF_DEFINE_ERROR2
        THEN RAISE_APPLICATION_ERROR(-20102,'�Էµ� ������ �߸��Ǿ����ϴ�.');
        ROLLBACK;


    COMMIT;

END;






-- PRC_PROF_LOGIN		(������ �α���)
create or replace PROCEDURE PRC_PROF_LOGIN
( V_PROF_CODE   IN TBL_PROF.PROF_CODE%TYPE
, V_PROF_PW     IN TBL_PROF.PROF_PW%TYPE
)
IS
    V_PROF_NAME TBL_PROF.PROF_NAME%TYPE;
    E_PROF_PW   TBL_PROF.PROF_PW%TYPE;

    --���ǰ��� ����� ���� Ŀ��
    CURSOR CUR_SUBNAME_SELECT
    IS
    SELECT TS.SUB_NAME
    FROM TBL_OPENSUB TOS JOIN TBL_SUB TS
        ON TOS.SUB_CODE=TS.SUB_CODE
    WHERE TOS.PROF_CODE =V_PROF_CODE; 

    V_SUB_NAME  TBL_SUB.SUB_NAME%TYPE;  

    PROF_DEFINE_ERROR   EXCEPTION;
BEGIN

    SELECT PROF_PW, PROF_NAME INTO E_PROF_PW, V_PROF_NAME 
    FROM TBL_PROF 
    WHERE PROF_CODE = V_PROF_CODE;


    IF(E_PROF_PW != V_PROF_PW)
        THEN RAISE PROF_DEFINE_ERROR;
    END IF;


    -- �������� ���� ���
    DBMS_OUTPUT.PUT_LINE(V_PROF_NAME || '�� �α��εǾ����ϴ�.');

    -- Ŀ������
    OPEN CUR_SUBNAME_SELECT;
    -- Ŀ�� ������ ó��
    LOOP
        FETCH CUR_SUBNAME_SELECT INTO V_SUB_NAME;

        EXIT WHEN CUR_SUBNAME_SELECT%NOTFOUND;

        --���
        DBMS_OUTPUT.PUT_LINE(' ���ǰ��� : '||V_SUB_NAME);
    END LOOP;
    -- Ŀ��Ŭ����
    CLOSE CUR_SUBNAME_SELECT;

    --����ó��
    EXCEPTION
        WHEN NO_DATA_FOUND 
        THEN RAISE_APPLICATION_ERROR(-20050,'���̵� �Ǵ� �н����带 �߸� �Է��ϼ̽��ϴ�.');
        WHEN PROF_DEFINE_ERROR
        THEN RAISE_APPLICATION_ERROR(-20050,'���̵� �Ǵ� �н����带 �߸� �Է��ϼ̽��ϴ�.');
             ROLLBACK;


    COMMIT;
END;






-- PRC_PROF_OUT			(������ �л� �ߵ�Ż�� ó��)
create or replace PROCEDURE PRC_PROF_OUT
( V_SUGANG_CODE IN TBL_SUGANG.SUGANG_CODE%TYPE
)
IS
    V_FLAG NUMBER := 1;
    V_OUT_REASON_CODE  TBL_OUT_REASON.OUT_REASON_CODE%TYPE;
    V_OUT_CODE         TBL_OUT.OUT_CODE%TYPE;
    USER_DEFINE_ERROR1 EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;

BEGIN

    -- �ش� �����ڵ尡 �����ϴ��� ���� Ȯ��
    SELECT COUNT(*) INTO V_FLAG
    FROM TBL_SUGANG
    WHERE V_SUGANG_CODE = SUGANG_CODE; 

    -- �����ڵ� ������ ���� �л����� ����
    IF(V_FLAG = 0)
        THEN RAISE USER_DEFINE_ERROR1;
    END IF;

    -- �÷��� �ʱ�ȭ
    V_FLAG := 1;

    -- �ߵ� Ż���� �̹� �Ǿ��ִ� �л����� ���� Ȯ��
    SELECT COUNT(*) INTO V_FLAG
    FROM TBL_OUT
    WHERE V_SUGANG_CODE = SUGANG_CODE;

    -- �����ڵ尡 �̹� �ߵ�Ż�� ���̺� �����Ѵٸ� �ߺ� ���� 
    IF(V_FLAG = 1)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;

    -- �ش� �����ڵ� ���� AND �ߺ��ƴ� ���
    -- �ش� �����ڵ带 ���� �л��� �ߵ�Ż�� ó��
    SELECT OUT_REASON_CODE INTO V_OUT_REASON_CODE
    FROM TBL_OUT_REASON
    WHERE OUT_REASON = '���� �µ� �ҷ�';

    -- �ߵ�Ż�� �ڵ� ����
    V_OUT_CODE := TO_CHAR(TBL_OUT_SEQ.NEXTVAL);
    V_OUT_CODE := 'OUT' || LPAD(V_OUT_CODE,3,0);

    -- �ߵ�Ż�� ���̺� INSERT
    INSERT INTO TBL_OUT
    VALUES(V_OUT_CODE, V_SUGANG_CODE, V_OUT_REASON_CODE, SYSDATE);


    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20972,'�������� �ʴ� �����ڵ��Դϴ�.');
            ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20971, '�̹� �ش� ������ �ߵ� ����, Ż���� �л��Դϴ�.');
            ROLLBACK;

        COMMIT;

END;







--�� ������ ��������
-- PRC_SCO_INSERT		(������ ���� �Է�)
create or replace PROCEDURE PRC_SCO_INSERT
( V_SUGANG_CODE IN TBL_SUGANG.SUGANG_CODE%TYPE
, V_OPENSUB_CODE IN TBL_OPENSUB.OPENSUB_CODE%TYPE
, V_SCO_ATTEND IN TBL_SCO.SCO_ATTEND%TYPE
, V_SCO_WRITE IN TBL_SCO.SCO_WRITE%TYPE
, V_SCO_PRAC IN TBL_SCO.SCO_PRAC%TYPE
)

IS
    --�ʿ亯��
    --1.�������� �����Էµ� �����ڵ�
    --2.3,4���� ���� CHECK ���� 2��(����,��������)
    --3.����ڰ� �Է��� ���� �����ڵ尡 ������ ��� ����
    --4.�����ڵ尡 ������ ��� ����
    --5.�ߵ�Ż���ڸ� ���� �ߵ�Ż�� �ڵ�
    --6.�ߵ�Ż���ڸ� �������� ���� ���������� �����׸� 3��
    --7.�����׸� ���� ���� ����
    
    V_SCO_CODE                  TBL_SCO.SCO_CODE%TYPE;
    V_OUT_CODE                  TBL_OUT.OUT_CODE%TYPE;
    V_OUT_REASON_CODE1          TBL_OUT_REASON.OUT_REASON_CODE%TYPE; --�����̴�
    V_OUT_REASON_CODE2          TBL_OUT_REASON.OUT_REASON_CODE%TYPE; --������


    V_OPENSUB_CODE_CHECK            NUMBER(2);
    V_OPENSUB_CODE_EXIST_CHECK      NUMBER(2);
    V_SUGANG_CHECK                  NUMBER(2);
    V_OUT_CODE_CHECK                NUMBER(2);
    V_TOTAL                         NUMBER(3);


    V_OPENSUB_ATTEND        TBL_OPENSUB.OPENSUB_ATTEND%TYPE;
    V_OPENSUB_WRITE         TBL_OPENSUB.OPENSUB_WRITE%TYPE;
    V_OPENSUB_PRAC          TBL_OPENSUB.OPENSUB_PRAC%TYPE;

    V_SCO_ATTEND_RESULT        TBL_SCO.SCO_ATTEND%TYPE;
    V_SCO_WRITE_RESULT         TBL_SCO.SCO_WRITE%TYPE;
    V_SCO_PRAC_RESULT          TBL_SCO.SCO_PRAC%TYPE;

    V_OPENSUB_ATTEND_STANDARD       TBL_OPENSUB.OPENSUB_ATTEND%TYPE; --������ �Ǵ�

    SUGANG_DEFINE_ERROR1    EXCEPTION;
    OPENSUB_DEFINE_ERROR1    EXCEPTION;
    SCO_DEFINE_ERROR1       EXCEPTION;   --���� �����ڵ忡 ���� ���� �Է±���
    OUT_DEFINE_ERROR1       EXCEPTION;    --   -20971




BEGIN


    --�����ڵ尡 ������
    SELECT COUNT(*) INTO V_SUGANG_CHECK 
    FROM TBL_SUGANG
    WHERE SUGANG_CODE = V_SUGANG_CODE;

    --�Է��� ���������ڵ尡 �����ڵ带 ���� �ҷ��� ������������ ������
    SELECT  COUNT(*) INTO V_OPENSUB_CODE_CHECK
    FROM TBL_OPENSUB
    WHERE OPENSUB_CODE IN ( SELECT OPS.OPENSUB_CODE
                            FROM TBL_OPENCOU OPC JOIN TBL_SUGANG SG
                            ON OPC.OPENCOU_CODE = SG.OPENCOU_CODE
                            JOIN TBL_OPENSUB OPS
                            ON OPC.OPENCOU_CODE = OPS.OPENCOU_CODE
                            WHERE SG.SUGANG_CODE = V_SUGANG_CODE
                                AND OPS.OPENSUB_CODE = V_OPENSUB_CODE);


    --�̹� ���� �����ڵ忡 �ش� ���� ���� �Է��Ѱ��

    SELECT COUNT(*) INTO V_OPENSUB_CODE_EXIST_CHECK
    FROM TBL_SCO
    WHERE OPENSUB_CODE IN (SELECT OPENSUB_CODE FROM TBL_SCO 
                            WHERE SUGANG_CODE = V_SUGANG_CODE
                                   AND OPENSUB_CODE = V_OPENSUB_CODE);


    IF(V_SUGANG_CHECK = 0)
        THEN RAISE SUGANG_DEFINE_ERROR1;

        ELSIF (V_OPENSUB_CODE_CHECK = 0)
            THEN RAISE OPENSUB_DEFINE_ERROR1;
        ELSIF (V_OPENSUB_CODE_EXIST_CHECK != 0)
            THEN RAISE SCO_DEFINE_ERROR1;
    END IF;

    V_SCO_CODE := TO_CHAR(SEQ_SCO.NEXTVAL);
    V_SCO_CODE := 'SCO' || LPAD(V_SCO_CODE,3,0);


    INSERT INTO TBL_SCO(SCO_CODE, OPENSUB_CODE, SUGANG_CODE, SCO_ATTEND, SCO_WRITE, SCO_PRAC)
    VALUES(V_SCO_CODE, V_OPENSUB_CODE, V_SUGANG_CODE, V_SCO_ATTEND, V_SCO_WRITE, V_SCO_PRAC);


   --���� �̴� OR ���̴��̶�� �ٷ� �ߵ�Ż���� ���



   -- �ش� �л��� �̹� �ߵ�Ż���� ����� �Ǿ��ִٰ� �����ֱ�
   --Ż�� �ڵ忡 �����ϴ��� Ȯ��


    SELECT COUNT(*) INTO V_OUT_CODE_CHECK
    FROM TBL_OUT
    WHERE SUGANG_CODE = V_SUGANG_CODE;

    IF(V_OUT_CODE_CHECK != 0)
       THEN RAISE OUT_DEFINE_ERROR1;   --   -20971
    END IF;


    --�������񿡼� ������������
    SELECT OPENSUB_ATTEND, OPENSUB_WRITE, OPENSUB_PRAC
          INTO V_OPENSUB_ATTEND
             , V_OPENSUB_WRITE
             , V_OPENSUB_PRAC
    FROM TBL_OPENSUB
    WHERE OPENSUB_CODE = V_OPENSUB_CODE;


    --������� ���ؿ�  �Էµ� ����������
    V_OPENSUB_ATTEND_STANDARD := V_SCO_ATTEND;

    --����*���,�ʱ�,�Ǳ� ����
    V_SCO_ATTEND_RESULT := (V_OPENSUB_ATTEND/100 * V_SCO_ATTEND); 
    V_SCO_WRITE_RESULT := (V_OPENSUB_WRITE/100 * V_SCO_WRITE);
    V_SCO_PRAC_RESULT := (V_OPENSUB_PRAC/100 * V_SCO_PRAC);

    --�� ������ ����
    V_TOTAL := V_SCO_ATTEND_RESULT + V_SCO_WRITE_RESULT + V_SCO_PRAC_RESULT;


    --�ߵ�Ż���ڵ� ����
    V_OUT_CODE := TO_CHAR(TBL_OUT_SEQ.NEXTVAL);
    V_OUT_CODE := 'OUT' || LPAD(V_OUT_CODE,3,0);

    --�ߵ�Ż������ �ڵ� ��������

    SELECT OUT_REASON_CODE INTO  V_OUT_REASON_CODE1
    FROM TBL_OUT_REASON
    WHERE OUT_REASON = '���� �̴�';

    SELECT OUT_REASON_CODE INTO  V_OUT_REASON_CODE2
    FROM TBL_OUT_REASON
    WHERE OUT_REASON = '��� �ҷ�';


    IF(V_OPENSUB_ATTEND_STANDARD < 70 AND V_OPENSUB_ATTEND>0)   --�п� ������ ���� 70
        THEN INSERT INTO TBL_OUT(OUT_CODE, SUGANG_CODE, OUT_REASON_CODE, OUT_DATE)
            VALUES(V_OUT_CODE, V_SUGANG_CODE, V_OUT_REASON_CODE2 , SYSDATE);


    ELSIF(V_TOTAL <50)
        THEN INSERT INTO TBL_OUT(OUT_CODE, SUGANG_CODE, OUT_REASON_CODE, OUT_DATE)
            VALUES(V_OUT_CODE, V_SUGANG_CODE, V_OUT_REASON_CODE1 , SYSDATE);
    END IF;

    COMMIT;

    --����ó��
    EXCEPTION
        WHEN SUGANG_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20903,'�����ڵ尡 �������� �ʽ��ϴ� �ٽ� �Է��ϼ���');
            ROLLBACK;
        WHEN  OPENSUB_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20966,'���������� �������� �ʽ��ϴ� �ٽ� �Է��ϼ���');
            ROLLBACK;
        WHEN SCO_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20600,'�ش� ������ ������ �̹� �Է��߽��ϴ�.');   ------------------���� ��Ͼ��ߴ�. -20600��
            ROLLBACK;
        WHEN OUT_DEFINE_ERROR1   --   -20971
            THEN RAISE_APPLICATION_ERROR(-20971, '�̹� �ش� ������ �ߵ� ����,Ż���� �л��Դϴ�.');
            ROLLBACK;

END;







-- PRC_SCO_DELETE		(������ ���� ����)
create or replace PROCEDURE PRC_SCO_DELETE
( V_SCO_CODE IN TBL_SCO.SCO_CODE%TYPE
, V_OPENSUB_CODE IN TBL_OPENSUB.OPENSUB_CODE%TYPE
)

IS
    --�����ڵ带 ���� ������û �ڵ带 �����ͼ� �ߵ�Ż���� ��ȸ�� ����
    
    V_SUGANG_CODE TBL_SUGANG.SUGANG_CODE%TYPE;
    V_OUT_CODE TBL_OUT.OUT_CODE%TYPE;

    V_SCO_CODE_CHECK NUMBER(2);
    V_OUT_CODE_CHECK NUMBER(2);

    V_OUT_FLAG CHAR(2);           --�ش� �л��� �ߵ�Ż�� ���̺� �����ϴ��� Ȯ���ϴ� ����

    --����� ���� ����
    SCO_DEFINE_ERROR1 EXCEPTION;   --  -20601�� �����ڵ� ����


BEGIN

    --�����ڵ尡 �����ϴ��� Ȯ��

    SELECT COUNT(*) INTO V_SCO_CODE_CHECK
    FROM TBL_SCO
    WHERE SCO_CODE = V_SCO_CODE;


    IF (V_SCO_CODE_CHECK = 0)
        THEN RAISE SCO_DEFINE_ERROR1;    
    END IF;

    --�����ڵ尡 �����Ѵٸ� INSERT�� �����ڵ尡 ���� �Է������̹Ƿ�
    --�����ڵ带 ���� ������û �ڵ� ��������
    SELECT SUGANG_CODE INTO V_SUGANG_CODE
    FROM TBL_SCO
    WHERE SCO_CODE = V_SCO_CODE
          AND OPENSUB_CODE = V_OPENSUB_CODE;


    --Ż�� �ڵ忡 �����ϴ��� Ȯ��


    SELECT COUNT(*) INTO V_OUT_CODE_CHECK
    FROM TBL_OUT
    WHERE SUGANG_CODE = V_SUGANG_CODE;

    IF(V_OUT_CODE_CHECK != 0)
       THEN
            --�������̺��� �����ڵ带 ���� �ߵ����̺�� JOIN�� �ش� �����ڵ��� �ߵ� Ż���ڵ� �������� 
        SELECT TOUT.OUT_CODE INTO V_OUT_CODE
        FROM TBL_OUT TOUT JOIN TBL_SCO SCO
        ON TOUT.SUGANG_CODE = SCO.SUGANG_CODE
        WHERE SCO.SCO_CODE = V_SCO_CODE;
        V_OUT_FLAG := '1';     --Ż���ڵ忡 �����Ѵٴ� �ǹ�


        ELSE
            V_OUT_FLAG := '2';
    END IF;


    DELETE 
    FROM TBL_SCO
    WHERE SCO_CODE = V_SCO_CODE
          AND OPENSUB_CODE = V_OPENSUB_CODE;



    IF (V_OUT_FLAG = '1')
        THEN
            DELETE
            FROM TBL_OUT
            WHERE OUT_CODE = V_OUT_CODE;

    END IF;


    EXCEPTION
        WHEN SCO_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20601,'�ش� �����ڵ�� �������� �ʽ��ϴ�.');
            ROLLBACK;



END;






-- PRC_SCO_UPDATE		(������ ���� ����)
create or replace PROCEDURE PRC_SCO_UPDATE
( V_SCO_CODE   IN TBL_SCO.SCO_CODE%TYPE
, V_SCO_ATTEND IN TBL_SCO.SCO_ATTEND%TYPE
, V_SCO_WRITE IN TBL_SCO.SCO_WRITE%TYPE
, V_SCO_PRAC IN TBL_SCO.SCO_PRAC%TYPE
)

IS
    
    
    V_SUGANG_CODE               TBL_SCO.SUGANG_CODE%TYPE;
    V_OPENSUB_CODE              TBL_SCO.OPENSUB_CODE%TYPE;

    V_SCO_CODE_CHECK            NUMBER(2);
    V_OUT_CODE                  TBL_OUT.OUT_CODE%TYPE;
    V_OUT_CHECK                 NUMBER(2);
    V_TOTAL                     NUMBER(3);
    V_OUT_REASON_CODE1          TBL_OUT_REASON.OUT_REASON_CODE%TYPE; --�����̴�
    V_OUT_REASON_CODE2          TBL_OUT_REASON.OUT_REASON_CODE%TYPE; --������


    V_OPENSUB_ATTEND            TBL_OPENSUB.OPENSUB_ATTEND%TYPE;
    V_OPENSUB_WRITE             TBL_OPENSUB.OPENSUB_WRITE%TYPE;
    V_OPENSUB_PRAC              TBL_OPENSUB.OPENSUB_PRAC%TYPE;

    V_SCO_ATTEND_RESULT         TBL_SCO.SCO_ATTEND%TYPE;
    V_SCO_WRITE_RESULT          TBL_SCO.SCO_WRITE%TYPE;
    V_SCO_PRAC_RESULT           TBL_SCO.SCO_PRAC%TYPE;

    SCO_DEFINE_ERROR1 EXCEPTION; --���� �����ڵ�

    OUT_DEFINE_ERROR1 EXCEPTION;  --������������ ����,����� ���� �̻��̶� OUT���̺��� �����ϴ� ������ ���ư� �Ŀ���
                                  --������ ������ �ߵ�Ż�����̺� �����Ѵٸ�
                                  --Ż�����̺��� �ش��л��� ��ȸ�Ͽ�
                                  --�̹� �����Ѵٸ� ���� INSERT���� �ʰ��ϴ� ����� ���� ����

BEGIN

    SELECT COUNT(*) INTO V_SCO_CODE_CHECK
    FROM TBL_SCO
    WHERE SCO_CODE = V_SCO_CODE;



    IF(V_SCO_CODE_CHECK = 0)
        THEN RAISE SCO_DEFINE_ERROR1;
    END IF;

    UPDATE TBL_SCO
    SET   SCO_ATTEND = V_SCO_ATTEND
        , SCO_WRITE = V_SCO_WRITE
        , SCO_PRAC = V_SCO_PRAC
    WHERE SCO_CODE = V_SCO_CODE;



    --�ظ��� �ߵ�Ż���� ��ϵǾ��� 
    -- ������ ������ �ߵ�Ż���� �Ȱɸ��ٸ� �ߵ�Ż������ ����

    --�� �ߵ�Ż���� �������� ������������ ���� ��ϵȴٸ�
    --   �ߵ�Ż���� ���

    --�����ڵ�� TBL_SCO���� �����ڵ�� ���������ڵ� ��������

    SELECT SUGANG_CODE, OPENSUB_CODE INTO V_SUGANG_CODE, V_OPENSUB_CODE
    FROM TBL_SCO
    WHERE SCO_CODE = V_SCO_CODE;

    --�ߵ�Ż���ڵ� ����
    V_OUT_CODE := TO_CHAR(TBL_OUT_SEQ.NEXTVAL);
    V_OUT_CODE := 'OUT' || LPAD(V_OUT_CODE,3,0);

    --�ߵ�Ż������ �ڵ� ��������

    SELECT OUT_REASON_CODE INTO  V_OUT_REASON_CODE1
    FROM TBL_OUT_REASON
    WHERE OUT_REASON = '���� �̴�';

    SELECT OUT_REASON_CODE INTO  V_OUT_REASON_CODE2
    FROM TBL_OUT_REASON
    WHERE OUT_REASON = '��� �ҷ�';



    --�������񿡼� ������������
    SELECT OPENSUB_ATTEND, OPENSUB_WRITE, OPENSUB_PRAC
          INTO V_OPENSUB_ATTEND
             , V_OPENSUB_WRITE
             , V_OPENSUB_PRAC
    FROM TBL_OPENSUB
    WHERE OPENSUB_CODE = V_OPENSUB_CODE;



    --����*���,�ʱ�,�Ǳ� ����
    V_SCO_ATTEND_RESULT := (V_OPENSUB_ATTEND/100 * V_SCO_ATTEND); 
    V_SCO_WRITE_RESULT := (V_OPENSUB_WRITE/100 * V_SCO_WRITE);
    V_SCO_PRAC_RESULT := (V_OPENSUB_PRAC/100 * V_SCO_PRAC);

    --�� ������ ����
    V_TOTAL := V_SCO_ATTEND_RESULT + V_SCO_WRITE_RESULT + V_SCO_PRAC_RESULT;



    IF( (V_TOTAL >50 AND V_SCO_ATTEND >70) AND V_OPENSUB_ATTEND >0 )
        THEN 
            DELETE
            FROM TBL_OUT
            WHERE SUGANG_CODE = V_SUGANG_CODE;
            --���� ����ȵ�

    END IF;

    --DELETE ������ ������Ŀ� ������ ������ �л��� TBL_OUT�� �����ִٸ� INSERT�� ���������ʰ�
    -- ���ٸ� INSERT�Ѵ�.

    SELECT COUNT(*) INTO V_OUT_CHECK
    FROM TBL_OUT
    WHERE SUGANG_CODE = V_SUGANG_CODE;


    IF (V_OUT_CHECK = 1)
        THEN RAISE OUT_DEFINE_ERROR1;

    ELSIF(V_TOTAL <50 AND V_OUT_CHECK = 0)
            THEN INSERT INTO TBL_OUT(OUT_CODE, SUGANG_CODE, OUT_REASON_CODE, OUT_DATE)
            VALUES(V_OUT_CODE, V_SUGANG_CODE, V_OUT_REASON_CODE1 , SYSDATE);

    ELSIF(V_SCO_ATTEND < 70 AND V_OPENSUB_ATTEND>0 AND V_OUT_CHECK = 0)   --�п� ������ ���� 70
        THEN 
            INSERT INTO TBL_OUT(OUT_CODE, SUGANG_CODE, OUT_REASON_CODE, OUT_DATE)
            VALUES(V_OUT_CODE, V_SUGANG_CODE, V_OUT_REASON_CODE2 , SYSDATE);

    END IF;


    EXCEPTION
        WHEN OUT_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20971,'�̹� �ش� ������ �ߵ� ����,Ż���� �л��Դϴ�.');
            ROLLBACK;
          WHEN SCO_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20601,'�ش� �����ڵ�� �������� �ʽ��ϴ�.');
            ROLLBACK;

    COMMIT;

END;






	
--�� �л�
-- PRC_STD_DELETE		(�л� ����)
create or replace PROCEDURE PRC_STD_DELETE
( V_STD_CODE IN  TBL_STD.STD_CODE%TYPE
)
IS
    --����� ���� ����ó�� ����
    USER_DEFINE_ERROR  EXCEPTION;
    --�л��ڵ� ���� Ȯ���� ���� ����
    VN_CNT          NUMBER := 0;

BEGIN

    --DELETE�� ������� ���� Ȯ��(�Է¹��� �л��ڵ尡 �������� ���� ��)
     SELECT COUNT(*) INTO VN_CNT
     FROM TBL_STD
     WHERE STD_CODE = V_STD_CODE;

     IF VN_CNT = 0 -- �й� �������� ���� �� 
        THEN RAISE USER_DEFINE_ERROR; -- ���� �߻�
     END IF;

    --DELETE�� ���� 
    DELETE
    FROM TBL_STD
    WHERE STD_CODE = V_STD_CODE;

    --����� ���� ����ó��
    EXCEPTION
    WHEN USER_DEFINE_ERROR
        THEN RAISE_APPLICATION_ERROR(-20032, '�ش� �й��� �������� �ʽ��ϴ�.');
    ROLLBACK;
    WHEN OTHERS
        THEN ROLLBACK;
    COMMIT;   
END;






-- PRC_STD_INSERT		(�л� ���)
create or replace PROCEDURE PRC_STD_INSERT
( V_STD_NAME IN  TBL_STD.STD_NAME%TYPE
, V_STD_RRN  IN  TBL_STD.STD_RRN%TYPE
)
IS
    -- �߰� ���� ����
    V_STD_CODE    TBL_STD.STD_CODE%TYPE;
    V_STD_PW      TBL_STD.STD_PW%TYPE;

    --����� ���� ���� ����1 (�̹� �����ϴ� �ֹι�ȣ�� ��)
    USER_DEFINE_ERROR1  EXCEPTION;
    -- ���� �ֹι�ȣ ���� ���� �Ǵ��� ���� ����
    VN_CNT NUMBER;

    -- ����� ���� ���ܼ���2(�ֹι�ȣ �ڸ��� OR ���� ���Է� ��)
    USER_DEFINE_ERROR2 EXCEPTION;


BEGIN

    ----INSERT�� ���� ���� Ȯ��
    SELECT COUNT(*) INTO VN_CNT
    FROM TBL_STD
    WHERE STD_RRN = V_STD_RRN;


    IF (VN_CNT != 0)    -- ������ �ֹι�ȣ �Է� �� 
        THEN RAISE USER_DEFINE_ERROR1;  -- ���� �߻�
    END IF;

    --INSERT�� ���� ���� Ȯ�� 
    IF (V_STD_RRN NOT LIKE '______-_______')    --�ֹι�ȣ �ڸ��� OR ���� ���Է� ��
        THEN RAISE USER_DEFINE_ERROR2;          --�����߻�
    END IF;


    --�޾ƿ� �ֹι�ȣ �� 7�ڸ��� ��й�ȣ ����
    V_STD_PW := SUBSTR(V_STD_RRN,8,7);

     --�й� ������
     V_STD_CODE := TO_CHAR(STD_SEQ.NEXTVAL);
     V_STD_CODE := 'STD' || LPAD(V_STD_CODE,3,'0');


    --INSERT��    
    INSERT INTO TBL_STD(STD_CODE, STD_NAME, STD_PW, STD_RRN)
    VALUES (V_STD_CODE, V_STD_NAME, V_STD_PW, V_STD_RRN);


    --����� ���� ����ó��
    EXCEPTION
    WHEN USER_DEFINE_ERROR1
        THEN RAISE_APPLICATION_ERROR(-20030, '�̹� ��ϵ� �л��Դϴ�');
    ROLLBACK;
    WHEN USER_DEFINE_ERROR2
        THEN RAISE_APPLICATION_ERROR(-20031, '�ֹι�ȣ �ڸ��� Ȥ�� �Է� ������ �߸��Ǿ����ϴ�. '-' �����Ͽ� �Է����ּ���!');
    WHEN OTHERS
        THEN ROLLBACK;
    COMMIT;  
END;






-- PRC_STD_LOGIN		(�л� �α���)
create or replace PROCEDURE PRC_STD_LOGIN --(�л� ���̵�, �л� �н�����)
( V_STD_CODE   IN   TBL_STD.STD_CODE%TYPE
, V_STD_PW     IN   TBL_STD.STD_PW%TYPE
)
IS
     -- �α��� ��ȿ�� Ȯ������ ����
     V_FLAG1  NUMBER; 
     V_FLAG2  NUMBER;
     V_FLAG3  NUMBER;
     V_FLAG4  NUMBER;
     --����� ���� ����                    
     USER_DEFINE_ERROR1 EXCEPTION;
     USER_DEFINE_ERROR2 EXCEPTION;
     USER_DEFINE_ERROR3 EXCEPTION;

     V_STD_NAME  TBL_STD.STD_NAME%TYPE;

     -- ���� �Ϸ� ���� ����� ���� Ŀ�� ����
     CURSOR CUR_SUB_SELECT
     IS
     SELECT SUB.SUB_NAME
     FROM TBL_STD STD 
     JOIN TBL_SUGANG SG
     ON STD.STD_CODE = SG.STD_CODE
        JOIN TBL_OPENCOU OC
        ON SG.OPENCOU_CODE = OC.OPENCOU_CODE
            JOIN TBL_OPENSUB OS
            ON OC.OPENCOU_CODE = OS.OPENCOU_CODE
                JOIN TBL_SUB SUB
                ON OS.SUB_CODE = SUB.SUB_CODE
     WHERE STD.STD_CODE = V_STD_CODE AND OS.OPENSUB_END < SYSDATE;  --�α����� �ش� �л� + �����Ϸ�� ���� ���

     -- Ŀ�� ����� ���� ���� ����
     V_STD_SUB  TBL_SUB.SUB_NAME%TYPE;


BEGIN
     -- �α��� ��ȿ�� Ȯ��
     SELECT COUNT(*) INTO V_FLAG1
     FROM TBL_STD
     WHERE STD_PW = V_STD_PW;

     SELECT COUNT(*) INTO V_FLAG2
     FROM TBL_STD
     WHERE STD_CODE = V_STD_CODE;

     SELECT STD_PW INTO V_FLAG3
     FROM TBL_STD
     WHERE STD_CODE = V_STD_CODE;

     IF (V_FLAG1 = 0)      -- ��й�ȣ�� �������� �������
        THEN RAISE USER_DEFINE_ERROR1;   --�����߻�
     ELSIF (V_FLAG2 = 0)   --���̵� �������� ���� ���
        THEN RAISE USER_DEFINE_ERROR2;   --�����߻�
     ELSIF (V_FLAG3 != V_STD_PW)  --���̵�� ��й�ȣ ��� ���������� ���� ��ġ���� ���� ���, 
        THEN RAISE USER_DEFINE_ERROR3;   --�����߻�
     END IF;

     -- �ߵ� Ż�� �л� Ȯ���� ����
     SELECT COUNT(*) INTO V_FLAG4
     FROM VIEW_OUT_IDPW
     WHERE V_STD_CODE = �й�;

     -- ~�� �α��� �Ǿ����ϴ�
     SELECT STD_NAME INTO V_STD_NAME
     FROM TBL_STD
     WHERE STD_CODE = V_STD_CODE;


     IF (V_FLAG4 = 1) --�ߵ�Ż��IDPW �信 �Է¹��� �й��� �ִٸ�,
        THEN DBMS_OUTPUT.PUT_LINE(V_STD_NAME || '�� �α��� �Ǿ����ϴ�. �����Ͻô� ���� �ߵ�Ż���Ǿ� �����Ϸ��� ���� ���� Ȯ���� �����մϴ�.');
     ELSE   -- �װ��� �ƴ϶��,
         DBMS_OUTPUT.PUT_LINE(V_STD_NAME || '�� �α��� �Ǿ����ϴ�.');
     END IF;

     -- ���� �Ϸ� ���� ���
     -- Ŀ������
     OPEN CUR_SUB_SELECT;
     -- Ŀ�� ������ ó��
     LOOP
        FETCH CUR_SUB_SELECT INTO V_STD_SUB;

        EXIT WHEN CUR_SUB_SELECT%NOTFOUND;

        --���
        DBMS_OUTPUT.PUT_LINE(' ���� �Ϸ� ���� : ' || V_STD_SUB );
     END LOOP;
     -- Ŀ��Ŭ����
     CLOSE CUR_SUB_SELECT;

     -- ���� ó��  
     EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20303,'���̵� �Ǵ� �н����尡 ��ġ���� �ʽ��ϴ�.'); 
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20303,'���̵� �Ǵ� �н����尡 ��ġ���� �ʽ��ϴ�.');
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20303,'���̵� �Ǵ� �н����尡 ��ġ���� �ʽ��ϴ�.');
        ROLLBACK; 
     COMMIT;
END;






-- PRC_STD_UPDATE		(�л� ����)
create or replace PROCEDURE PRC_STD_UPDATE
( V_STD_CODE IN TBL_STD.STD_CODE%TYPE
, V_STD_NAME IN TBL_STD.STD_NAME%TYPE
)
IS

    --����� ���� ���� ����
    USER_DEFINE_ERROR1  EXCEPTION;

    --�л��ڵ� �������� Ȯ�� ���� ����
    VN_CNT NUMBER :=0;


BEGIN

     --UPDATE�� ���� ���� Ȯ��
     SELECT COUNT(*) INTO VN_CNT
     FROM TBL_STD
     WHERE STD_CODE = V_STD_CODE;

     IF VN_CNT = 0
     THEN RAISE USER_DEFINE_ERROR1;
     END IF;


     --TBL_STD UPDATE�� ����
     UPDATE TBL_STD
     SET STD_NAME = V_STD_NAME
     WHERE STD_CODE = V_STD_CODE;


     --����� ���� ���� ó��
     EXCEPTION
     WHEN USER_DEFINE_ERROR1
        THEN RAISE_APPLICATION_ERROR(-20032, '�ش� �й��� �������� �ʽ��ϴ�');
     ROLLBACK;
     WHEN OTHERS
        THEN ROLLBACK;

    COMMIT;       
END;






--�� ����
-- PRC_SUB_DELETE		(���� ����)
create or replace PROCEDURE PRC_SUB_DELETE
( V_SUB_CODE IN TBL_SUB.SUB_CODE%TYPE
)
IS 
    SUB_CHECK_CODE TBL_SUB.SUB_CODE%tYPE;
    USER_DEFINE_ERROR EXCEPTION;
BEGIN

    SELECT NVL((SELECT SUB_CODE
                FROM TBL_SUB
                WHERE SUB_CODE = V_SUB_CODE), '0') INTO SUB_CHECK_CODE
    FROM DUAL;

    IF (SUB_CHECK_CODE = '0')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    DELETE
    FROM TBL_SUB
    WHERE SUB_CODE = V_SUB_CODE;

    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20503, '�������� �ʴ� �����Դϴ�.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;

    --Ŀ��
    COMMIT;   
END;






-- PRC_SUB_INSERT		(���� ���)
create or replace PROCEDURE PRC_SUB_INSERT
( V_SUB_NAME     IN TBL_SUB.SUB_NAME%TYPE
)
IS 
    SUB_CHECK_NAME TBL_SUB.SUB_NAME%TYPE;
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    -- �̹� �ִ� ��������� Ȯ��
    SELECT NVL((SELECT SUB_NAME
                FROM TBL_SUB
                WHERE SUB_NAME = V_SUB_NAME), '0') INTO SUB_CHECK_NAME
    FROM DUAL;

    -- ���� : ���� �߻�
    IF (SUB_CHECK_NAME != '0')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    INSERT INTO TBL_SUB(SUB_CODE, SUB_NAME)
    VALUES(('SUB' || LPAD(TO_CHAR(TBL_SUB_SEQ.NEXTVAL), 3, '0')), V_SUB_NAME);

    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20501, '�̹� ��ϵ� �����Դϴ�.');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;

    -- Ŀ��
    COMMIT;
END;






-- PRC_SUB_UPDATE		(���� ����)
create or replace PROCEDURE PRC_SUB_UPDATE
( V_SUB_CODE    IN TBL_SUB.SUB_CODE%TYPE -- �����ڵ�
, V_SUB_NAME    IN TBL_SUB.SUB_NAME%TYPE -- ������ �����
)
IS 
    SUB_CHECK_CODE TBL_SUB.SUB_CODE%TYPE;
    USER_DEFINE_ERROR EXCEPTION;
BEGIN

    -- �����ڵ尡 ������ �Ǵ��ϱ� ���� ��ȸ
    SELECT NVL((SELECT SUB_CODE
                FROM TBL_SUB
                WHERE SUB_CODE = V_SUB_CODE), '0') INTO SUB_CHECK_CODE
    FROM DUAL;

    -- ���� �Ǵ����� �����߻�, �ڵ尡 ������ ����
    IF (SUB_CHECK_CODE = '0')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;


    -- �����̸� ���� 
    UPDATE TBL_SUB
    SET SUB_NAME = V_SUB_NAME
    WHERE SUB_CODE = V_SUB_CODE;

    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20502, '�������� ���� �ڵ��Դϴ�..');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK; 
    -- Ŀ��
    COMMIT;
END;







--�� ������û
-- PRC_SUGANG_DELETE		(������û ����)
create or replace PROCEDURE PRC_SUGANG_DELETE
( V_SUGANG_CODE    IN TBL_SUGANG.SUGANG_CODE%TYPE)
IS
    E_SUGANG_CODE   TBL_SUGANG.SUGANG_CODE%TYPE;
    SUGANG_DEFINE_ERROR EXCEPTION;  -- �ش� �ڵ尡 ������ 

BEGIN
    -- �����ڵ� üũ
    SELECT NVL((SELECT SUGANG_CODE FROM TBL_SUGANG WHERE SUGANG_CODE=V_SUGANG_CODE),'0')
           INTO E_SUGANG_CODE 
    FROM DUAL;

    IF (E_SUGANG_CODE = '0')
        THEN RAISE SUGANG_DEFINE_ERROR;
    END IF;


    -- DELETE ��
    DELETE
    FROM TBL_SUGANG
    WHERE SUGANG_CODE = V_SUGANG_CODE;


    -- ����ó��
    EXCEPTION
        WHEN SUGANG_DEFINE_ERROR
        THEN RAISE_APPLICATION_ERROR(-20903,'�����ڵ尡 �������� �ʽ��ϴ�. �ٽ��Է��ϼ���.');
            ROLLBACK;
        WHEN OTHERS
        THEN ROLLBACK;


    -- Ŀ��
    COMMIT;
END;






-- PRC_SUGANG_INSERT		(������û)
create or replace PROCEDURE PRC_SUGANG_INSERT
( V_OPENCOU_CODE    IN TBL_SUGANG.OPENCOU_CODE%TYPE
, V_STD_CODE        IN TBL_SUGANG.STD_CODE%TYPE
)
IS
   V_SUGANG_CODE TBL_SUGANG.SUGANG_CODE%TYPE; 

   -- ���������� ���� ����
   V_OPENCOU_START TBL_OPENCOU.OPENCOU_START%TYPE;

   -- �ߺ���û�� üũ�� Ŀ��
   CURSOR CUR_SUGANG_CHECK          
   IS
   SELECT OPENCOU_CODE
   FROM TBL_SUGANG
   WHERE STD_CODE = V_STD_CODE;

   --Ŀ���� ���� ����
   V_OPENCOU_CODE_TEMP  TBL_SUGANG.OPENCOU_CODE%TYPE;


   SUGANG_DEFINE_ERROR1 EXCEPTION;  -- ������û���ڰ� ���������� ��
   SUGANG_DEFINE_ERROR2 EXCEPTION;  -- �����ߺ���û

BEGIN
    -- ���� ������ ���    
    SELECT OPENCOU_START INTO V_OPENCOU_START
    FROM TBL_OPENCOU
    WHERE OPENCOU_CODE = V_OPENCOU_CODE;

    -- ������û���� ���������� ���Ķ�� 2������ �߻�
    -- �������۴��Ͽ� ������û�Ҽ�����
    IF (V_OPENCOU_START <= SYSDATE)
        THEN RAISE SUGANG_DEFINE_ERROR1;
    END IF;

    -- ���� �ߺ���û�� ���� Ŀ�� ����
    OPEN CUR_SUGANG_CHECK;
        LOOP
            FETCH CUR_SUGANG_CHECK INTO V_OPENCOU_CODE_TEMP;

            -- ���������Ͱ� ������ ��������
            EXIT WHEN CUR_SUGANG_CHECK%NOTFOUND;

            -- ������ �ߺ��϶� 2������ �߻�
            IF(V_OPENCOU_CODE_TEMP = V_OPENCOU_CODE)
                THEN RAISE SUGANG_DEFINE_ERROR2;
            END IF;
        END LOOP;

    -- Ŀ�� Ŭ����
    CLOSE CUR_SUGANG_CHECK;



    -- ������û�ڵ� ����
    V_SUGANG_CODE := TO_CHAR(SUG_CODE_SEQ.NEXTVAL);
    V_SUGANG_CODE := 'SUG' || LPAD(V_SUGANG_CODE,3,0);

    -- INSERT��
    INSERT INTO TBL_SUGANG (SUGANG_CODE, OPENCOU_CODE, STD_CODE, SUGANG_DATE)
    VALUES (V_SUGANG_CODE, V_OPENCOU_CODE, V_STD_CODE, SYSDATE);



    -- ����ó��
    EXCEPTION
        WHEN SUGANG_DEFINE_ERROR1
        THEN RAISE_APPLICATION_ERROR(-20900, '�̹� ������ �����Դϴ�.');
        ROLLBACK;
        WHEN SUGANG_DEFINE_ERROR2
        THEN RAISE_APPLICATION_ERROR(-20901, '�̹� ��û�� �����Դϴ�.');
        ROLLBACK;


    -- Ŀ��
    COMMIT;

END;


--> ���� 38��
/*
================================================================================
                  �������   VIEW   �������
================================================================================
*/
--�� ��������
-- VIEW_COURSE_INFO
--> �����̸�, ���ǽ�, �����, ���������, ����������, �����, �����ڸ�
CREATE OR REPLACE FORCE VIEW "FOURTH"."VIEW_COURSE_INFO" ("�����̸�", "���ǽ�", "�����", "���������", "����������", "�����", "�����ڸ�") AS 
  SELECT COU.COURSE_NAME "�����̸�"
     , CLA.CLASS_NAME "���ǽ�"
     , SB.SUB_NAME "�����"
     , OSB.OPENSUB_START "���������"
     , OSB.OPENSUB_END "����������"
     , BO.BOOK_NAME "�����"
     , PR.PROF_NAME "�����ڸ�"
FROM TBL_OPENCOU OPC JOIN TBL_COURSE COU
    ON OPC.COURSE_CODE = COU.COURSE_CODE
    JOIN TBL_CLASS CLA
    ON CLA.CLASS_CODE = OPC.CLASS_CODE
    JOIN TBL_OPENSUB OSB
    ON OPC.OPENCOU_CODE = OSB.OPENCOU_CODE
    JOIN TBL_PROF PR
    ON OSB.PROF_CODE = PR.PROF_CODE
    JOIN TBL_BOOK BO
    ON OSB.BOOK_CODE = BO.BOOK_CODE
    JOIN TBL_SUB SB
    ON SB.SUB_CODE = OSB.SUB_CODE;






--�� ������ �л��� �α��� ����
-- VIEW_OUT_IDPW
--> �й�, �л�PW
CREATE OR REPLACE FORCE VIEW "FOURTH"."VIEW_OUT_IDPW" ("�й�", "�л�PW") AS 
  SELECT STD.STD_CODE "�й�", STD.STD_PW "�л�PW" 
FROM TBL_OUT OUT
        JOIN TBL_SUGANG SG
        ON OUT.SUGANG_CODE = SG.SUGANG_CODE
                JOIN TBL_STD STD
                ON SG.STD_CODE = STD.STD_CODE;






--�� �������� �������� ��ȸ
-- VIEW_PROF_INFO
--> �����̸�, ��������, ���������, ���� ������, �����, ���ǽ�, �������࿩��
CREATE OR REPLACE FORCE VIEW "FOURTH"."VIEW_PROF_INFO" ("�����̸�", "��������", "���������", "����������", "�����", "���ǽ�", "�������࿩��") AS 
  SELECT TP.PROF_NAME"�����̸�"
    ,  TS.SUB_NAME "��������"
    ,  TOS.OPENSUB_START "���������"
    ,  TOS.OPENSUB_END "����������"
    ,  TB.BOOK_NAME "�����"
    ,  TC.CLASS_NAME "���ǽ�"
    ,  CASE WHEN SYSDATE BETWEEN TOS.OPENSUB_START AND TOS.OPENSUB_END 
            THEN '������'
            WHEN SYSDATE < TOS.OPENSUB_START
            THEN '���ǿ���'
       ELSE '��������'
       END "�������࿩��"

FROM TBL_PROF TP , TBL_SUB TS, TBL_OPENSUB TOS, TBL_OPENCOU TOC, TBL_BOOK TB, TBL_CLASS TC
WHERE TOS.PROF_CODE = TP.PROF_CODE(+)
  AND TOS.SUB_CODE = TS.SUB_CODE(+)
  AND TOS.BOOK_CODE = TB.BOOK_CODE(+)
  AND TOS.OPENCOU_CODE = TOC.OPENCOU_CODE(+)
  AND TOC.CLASS_CODE = TC.CLASS_CODE(+)
ORDER BY 1;







--�� �����ڰ� �Է��� ������ ����
-- VIEW_PROF_SCORE_INFO
--> �����, ����Ⱓ, �����, �л���, ���, �ʱ�, �Ǳ�, ����, ��� , �ߵ�Ż������
CREATE OR REPLACE FORCE VIEW "FOURTH"."VIEW_PROF_SCORE_INFO" ("�����", "����Ⱓ", "�����", "�л���", "���", "�ʱ�", "�Ǳ�", "����", "���", "�ߵ�Ż������") AS 
  SELECT T.�����, T.����Ⱓ, T.�����, T.�л���, T.���, T.�ʱ�, T.�Ǳ�, T.����
, RANK() OVER(PARTITION BY T.���������ڵ� ORDER BY T.���� DESC) "���"
, T.�ߵ�Ż������
FROM (
        SELECT SB.SUB_NAME "�����"
        , OS.OPENSUB_START || ' ~ ' || OS.OPENSUB_END "����Ⱓ"
        , BK.BOOK_NAME "�����"
        , SD.STD_NAME "�л���"
        , SC.SCO_ATTEND "���"
        , SC.SCO_WRITE "�ʱ�"
        , SC.SCO_PRAC "�Ǳ�"
        , FN_TOTAL_SCORE(SC.SCO_CODE, OS.OPENSUB_CODE)"����"
        , OS.OPENSUB_CODE "���������ڵ�"
        , CASE WHEN SG.SUGANG_CODE = OT.SUGANG_CODE
               THEN '��'
               ELSE '��'
                END "�ߵ�Ż������"
        FROM TBL_OPENSUB OS
        JOIN TBL_PROF PR
          ON OS.PROF_CODE = PR.PROF_CODE
        JOIN TBL_SUB SB
          ON OS.SUB_CODE = SB.SUB_CODE
        JOIN TBL_BOOK BK
          ON OS.BOOK_CODE = BK.BOOK_CODE
        JOIN TBL_SCO SC
          ON OS.OPENSUB_CODE = SC.OPENSUB_CODE
        JOIN TBL_SUGANG SG
          ON SC.SUGANG_CODE = SG.SUGANG_CODE
        JOIN TBL_STD SD
          ON SG.STD_CODE = SD.STD_CODE
        LEFT JOIN TBL_OUT OT
               ON SG.SUGANG_CODE = OT.SUGANG_CODE

) T;






--�� �����ڰ� ������ �Է��ҽ� ��ȸ�Ǵ� �л��� ����
-- VIEW_PROF_STD_INFO
--> ������, �����, ���������, ����������, �л���, �����ڵ�
CREATE OR REPLACE FORCE VIEW "FOURTH"."VIEW_PROF_STD_INFO" ("������", "�����", "���������", "����������", "�л���", "�����ڵ�") AS 
  SELECT TP.PROF_NAME "������" , TS.SUB_NAME "�����" 
    ,  OPS.OPENSUB_START "���������", OPS.OPENSUB_END "����������"
    ,  SD.STD_NAME "�л���", SG.SUGANG_CODE "�����ڵ�"
    
FROM TBL_OPENSUB OPS, TBL_SUB TS, TBL_SUGANG SG, TBL_STD SD
    ,TBL_OPENCOU OPC, TBL_PROF TP, TBL_OUT TOT
WHERE OPS.OPENCOU_CODE = OPC.OPENCOU_CODE(+)
  AND OPC.OPENCOU_CODE = SG.OPENCOU_CODE(+)    
  AND SG.STD_CODE  = SD.STD_CODE (+)       
  AND OPS.SUB_CODE = TS.SUB_CODE(+)      
  AND OPS.PROF_CODE = TP.PROF_CODE(+)        
  AND SG.SUGANG_CODE = TOT.SUGANG_CODE(+) 
  -- �ߵ�Ż�� ����
  AND TOT.OUT_CODE IS NULL
  -- �������ΰ͸� ���
  AND OPS.OPENSUB_START <= SYSDATE 
  -- ���� ���� �� 7���� �̳��� ����ó�� ����
  AND SYSDATE < OPS.OPENSUB_END+7
ORDER BY 2;






--�� �����ڰ� �л��� ���� ��ȸ
-- VIEW_STD_INFO
--> �л��̸�, ������, ��������, �������� ����
  CREATE OR REPLACE FORCE VIEW "FOURTH"."VIEW_STD_INFO" ("�л��̸�", "������", "��������", "�������� ����") AS 
  SELECT DISTINCT ST.STD_NAME "�л��̸�"
    ,  CO.COURSE_NAME "������"
    ,  SUB.SUB_NAME "��������"
    ,  CASE WHEN OUT.SUGANG_CODE IS NOT NULL THEN '�ߵ�Ż��, ���� ��ȸ �Ұ�.'
            WHEN SCO.SUGANG_CODE IS NULL THEN '���� �Է� �����Դϴ�.'
            ELSE TO_CHAR(SCO.SCO_ATTEND + SCO.SCO_WRITE + SCO.SCO_PRAC)
       END "������������"
FROM TBL_STD ST, TBL_SUGANG SG, TBL_OPENCOU OC, TBL_COURSE CO, TBL_OPENSUB OS, TBL_SUB SUB, TBL_SCO SCO, TBL_OUT OUT
WHERE SG.STD_CODE= ST.STD_CODE(+)
  AND SG.OPENCOU_CODE = OC.OPENCOU_CODE(+)
  AND OC.COURSE_CODE = CO.COURSE_CODE(+)
  AND OC.OPENCOU_CODE = OS.OPENCOU_CODE(+)
  AND OS.SUB_CODE = SUB.SUB_CODE(+)
  AND SG.SUGANG_CODE = SCO.SUGANG_CODE(+)
  AND SG.SUGANG_CODE = OUT.SUGANG_CODE(+)
ORDER BY �л��̸�, ������, ��������;





--�� �л��� ������ ��ȸ�� �� Ȯ���� �� �ִ� ����
-- VIEW_STD_SCO
--> �л��̸�, ������, �����, ���������, ����������, �����, ���, �ʱ�, �Ǳ�, ����, ���
  CREATE OR REPLACE FORCE VIEW "FOURTH"."VIEW_STD_SCO" ("�л��̸�", "������", "�����", "���������", "����������", "�����", "���", "�ʱ�", "�Ǳ�", "����", "���") AS 
  SELECT STD.STD_NAME "�л��̸�", COU.COURSE_NAME "������", SUB.SUB_NAME "�����", OS.OPENSUB_START "���������"
, OS.OPENSUB_END "����������", BK.BOOK_NAME "�����", SCO.SCO_ATTEND "���", SCO.SCO_WRITE "�ʱ�"
, SCO.SCO_PRAC "�Ǳ�", SCO.SCO_ATTEND + SCO.SCO_WRITE + SCO.SCO_PRAC "����" 
, RANK() OVER (PARTITION BY OS.OPENSUB_CODE ORDER BY SCO.SCO_ATTEND + SCO.SCO_WRITE + SCO.SCO_PRAC DESC) "���"
FROM TBL_SCO SCO 
     JOIN TBL_OPENSUB OS
     ON SCO.OPENSUB_CODE = OS.OPENSUB_CODE
        JOIN TBL_SUB SUB
        ON OS.SUB_CODE = SUB.SUB_CODE
            JOIN TBL_BOOK BK
            ON OS.BOOK_CODE = BK.BOOK_CODE
                JOIN TBL_SUGANG SG
                ON SCO.SUGANG_CODE = SG.SUGANG_CODE
                    JOIN TBL_STD STD
                    ON SG.STD_CODE = STD.STD_CODE
                        JOIN TBL_OPENCOU OC
                        ON SG.OPENCOU_CODE = OC.OPENCOU_CODE
                            JOIN TBL_COURSE COU
                            ON OC.COURSE_CODE = COU.COURSE_CODE
ORDER BY �л��̸�;







--�� ���������� Ȯ��
-- VIEW_SUB_INFO
--> ������, ���ǽǸ�, �����, �����, ���������, ����������, �����, �����̸�
CREATE OR REPLACE FORCE VIEW "FOURTH"."VIEW_SUB_INFO" ("������", "���ǽǸ�", "�����", "���������", "����������", "�����", "�����̸�") AS 
  SELECT CO.COURSE_NAME "������"
, CL.CLASS_NAME "���ǽǸ�"
, SB.SUB_NAME "�����"
, OS.OPENSUB_START "���������"
, OS.OPENSUB_END "����������"
, BK.BOOK_NAME "�����"
, PR.PROF_NAME "�����̸�"
FROM TBL_OPENSUB OS
JOIN TBL_OPENCOU OC
ON OS.OPENCOU_CODE = OC.OPENCOU_CODE
JOIN TBL_CLASS CL
ON OC.CLASS_CODE = CL.CLASS_CODE
JOIN TBL_COURSE CO
ON OC.COURSE_CODE = CO.COURSE_CODE
JOIN TBL_SUB SB
ON OS.SUB_CODE = SB.SUB_CODE
JOIN TBL_BOOK BK
ON OS.BOOK_CODE = BK.BOOK_CODE
JOIN TBL_PROF PR
ON OS.PROF_CODE = PR.PROF_CODE;






--> ���� 8��
-------------------------------------------------------------------------------------------

/*
�������   �Լ�   �������
*/

--�� �л� ���� ���� ��� �Լ�
-- FN_TOTAL_SCORE 
create or replace FUNCTION FN_TOTAL_SCORE
( V_SCO_CODE     IN TBL_SCO.SCO_CODE%TYPE       -- �����ڵ�
, V_OPENSUB_CODE IN TBL_OPENSUB.OPENSUB_CODE%TYPE --���������ڵ�
)
    RETURN NUMBER
IS
    RESULT NUMBER;

    V_ATTEND_PERC TBL_OPENSUB.OPENSUB_ATTEND%TYPE;
    V_WRITE_PERC TBL_OPENSUB.OPENSUB_WRITE%TYPE;
    V_PRAC_PERC TBL_OPENSUB.OPENSUB_PRAC%TYPE;

    V_ATTEND_SCORE TBL_SCO.SCO_ATTEND%TYPE;
    V_WRITE_SCORE TBL_SCO.SCO_WRITE%TYPE;
    V_PRAC_SCORE TBL_SCO.SCO_PRAC%TYPE;

BEGIN
    -- �ش� ���������ڵ��� ���� ��������
    SELECT NVL(OPENSUB_ATTEND, 0), NVL(OPENSUB_WRITE, 0), NVL(OPENSUB_PRAC, 0)
    INTO V_ATTEND_PERC, V_WRITE_PERC, V_PRAC_PERC
    FROM TBL_OPENSUB
    WHERE OPENSUB_CODE = V_OPENSUB_CODE;

    -- �ش� �����ڵ�� ���� ��������
    SELECT NVL(SCO_ATTEND, 0), NVL(SCO_WRITE, 0), NVL(SCO_PRAC, 0)
    INTO V_ATTEND_SCORE, V_WRITE_SCORE, V_PRAC_SCORE
    FROM TBL_SCO
    WHERE SCO_CODE = V_SCO_CODE;


    RESULT := (V_ATTEND_PERC * V_ATTEND_SCORE + V_WRITE_PERC * V_WRITE_SCORE + V_PRAC_PERC * V_PRAC_SCORE)/100;
    RETURN RESULT;
END;






--> ���� 1��
/*
================================================================================
                  �������   Ʈ����   �������
================================================================================
*/

--�� ������ ������ �� �̹� �������� ������ ������ ������ ����
-- TRG_SUB_DELETE1
create or replace TRIGGER TRG_SUB_DELETE1
    BEFORE
    DELETE ON TBL_SUB
    FOR EACH ROW
BEGIN
    DELETE 
    FROM TBL_OPENSUB
    WHERE SUB_CODE = :OLD.SUB_CODE;
END;






--�� ���ǽ��� ������ �� �̹� �������� ���Ե� ���ǽ��� ������ ����
-- TRG_CLASS_DELETE1
create or replace TRIGGER TRG_CLASS_DELETE1
        BEFORE
        DELETE ON TBL_CLASS
        FOR EACH ROW
BEGIN

    DELETE 
    FROM TBL_OPENCOU
    WHERE CLASS_CODE = :OLD.CLASS_CODE;

END;







--�� ������ �����ϱ� �� ���� ������ �̹� ���Ե� ���ǽ��� ������ ����
-- TRG_COURSE_DELETE1
create or replace TRIGGER TRG_COURSE_DELETE1
        BEFORE
        DELETE ON TBL_COURSE
        FOR EACH ROW
BEGIN

    DELETE 
    FROM TBL_OPENCOU
    WHERE COURSE_CODE = :OLD.COURSE_CODE;

END;







--�� ���� ������ �����ϱ� �� ������û�� �̷���� �������� ������ ����
-- TRG_COURSE_DELETE2
create or replace TRIGGER TRG_COURSE_DELETE2
        BEFORE
        DELETE ON TBL_OPENCOU
        FOR EACH ROW
BEGIN

    DELETE 
    FROM TBL_SUGANG
    WHERE OPENCOU_CODE = :OLD.OPENCOU_CODE;

END;







--�� ���� ������ �����ϱ� �� ���� ���� ������ �����Ǿ� �ִ��� ������ ����
-- TRG_COURSE_DELETE3 
create or replace TRIGGER TRG_COURSE_DELETE3
        BEFORE
        DELETE ON TBL_OPENCOU
        FOR EACH ROW
BEGIN

    DELETE 
    FROM TBL_OPENSUB
    WHERE OPENCOU_CODE = :OLD.OPENCOU_CODE;

END;







--> ���� 5��

/*
================================================================================
                  �������   ������   �������
================================================================================
*/
--�� ���ǽ� �ڵ� ������
-- SEQ_CLASS
CREATE SEQUENCE  "FOURTH"."SEQ_CLASS"  
MINVALUE 1 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 41 
CACHE 20 
ORDER  NOCYCLE ;







--�� �����ڵ� ������
-- PROF_CODE_SEQ
CREATE SEQUENCE  "FOURTH"."PROF_CODE_SEQ"  
MINVALUE 1 
MAXVALUE 999 
INCREMENT BY 1 
START WITH 64 
CACHE 20 
NOORDER  NOCYCLE ;







--�� ���� �ڵ� ������
-- SEQ_COURSE
CREATE SEQUENCE  "FOURTH"."SEQ_COURSE"  
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 41 
CACHE 20 
ORDER  NOCYCLE ;







--�� �������� �ڵ� ������
-- SEQ_OPENCOU
CREATE SEQUENCE  "FOURTH"."SEQ_OPENCOU"  
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 41 
CACHE 20 
ORDER  NOCYCLE ;







--�� �����ڵ� ������
-- SEQ_SCO
CREATE SEQUENCE  "FOURTH"."SEQ_SCO"  
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 21 
CACHE 20 
NOORDER  NOCYCLE ;







--�� �л��ڵ� ������
-- STD_SEQ
CREATE SEQUENCE  "FOURTH"."STD_SEQ"  
MINVALUE 1 
MAXVALUE 999 
INCREMENT BY 1 
START WITH 10 
NOCACHE  
NOORDER  NOCYCLE ;







--�� �����ڵ� ������
-- SUG_CODE_SEQ
CREATE SEQUENCE  "FOURTH"."SUG_CODE_SEQ"  
MINVALUE 1 
MAXVALUE 999 
INCREMENT BY 1 
START WITH 41 
CACHE 20 
NOORDER  NOCYCLE ;







--�� ������ �ڵ� ������
-- TBL_ADMIN_SEQ
CREATE SEQUENCE  "FOURTH"."TBL_ADMIN_SEQ"  
MINVALUE 1 
MAXVALUE 999 
INCREMENT BY 1 
START WITH 4 
NOCACHE  
NOORDER  NOCYCLE ;







--�� �����ڵ� ������
-- TBL_BOOK_SEQ
CREATE SEQUENCE  "FOURTH"."TBL_BOOK_SEQ"  
MINVALUE 1 
MAXVALUE 999 
INCREMENT BY 1 
START WITH 12 
NOCACHE  
NOORDER  NOCYCLE ;







--�� ���������ڵ� ������
-- TBL_OPENSUB_SEQ
CREATE SEQUENCE  "FOURTH"."TBL_OPENSUB_SEQ"  
MINVALUE 1 
MAXVALUE 999 
INCREMENT BY 1 
START WITH 9 
NOCACHE  
NOORDER  NOCYCLE ;







--�� �ߵ�Ż�������ڵ� ������
-- TBL_OUT_REASON_SEQ
CREATE SEQUENCE  "FOURTH"."TBL_OUT_REASON_SEQ"  
MINVALUE 1 
MAXVALUE 999 
INCREMENT BY 1 
START WITH 3 
NOCACHE  
NOORDER  NOCYCLE ;







--�� �ߵ�Ż�� �ڵ� ������
-- TBL_OUT_SEQ
CREATE SEQUENCE  "FOURTH"."TBL_OUT_SEQ"  
MINVALUE 1 
MAXVALUE 999 
INCREMENT BY 1 
START WITH 44 
NOCACHE  
NOORDER  NOCYCLE ;







--�� �����ڵ� ������
-- TBL_SUB_SEQ
CREATE SEQUENCE  "FOURTH"."TBL_SUB_SEQ"  
MINVALUE 1 
MAXVALUE 999 
INCREMENT BY 1 
START WITH 11 
NOCACHE  
NOORDER  NOCYCLE ;

--> 13��


