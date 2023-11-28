DROP   TABLE COMMENTS
CREATE TABLE COMMENTS
(
      CNO      NUMBER(6)        PRIMARY KEY        -- 
    , WRITER   VARCHAR2(12)                        -- 글쓴이
    , WDATE    DATE             DEFAULT SYSDATE    -- 댓글작성시간
    , CONTENT  VARCHAR2(1000)                      -- 댓글 내용
    , BNO      NUMBER(9)        not null   
           REFERENCES  BOARDBOOT(BNO)              -- 게시글번호 댓글에 해당하는  
)