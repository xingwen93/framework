INSERT INTO OPERATOR_HISTORY SELECT
    O.OPERATOR_ID,
    NVL(
        (
            SELECT
                MAX(H.SEQ)
            FROM
                OPERATOR_HISTORY H
            WHERE
                H.OPERATOR_ID = :id
        ),
        0
    ) + 1 AS SEQ,
    O.ROLE_ID,
    O.OPERATOR_TYPE,
    O.OPERATOR_CODE,
    O.USER_NAME,
    O.PASSWORD,
    O.CREATE_DATE,
    O.STATE,
    O.STATE_DATE,
    O.IS_LOCKED,
    O.PWD_EXP_DATE,
    O.LOGIN_FAIL,
    O.REGIST_IP,
    O.LAST_IP,
    O.LAST_LOGIN_DATE,
    SYSDATE,
    :updateOperatorId
FROM
    OPERATOR O
WHERE
    O.OPERATOR_ID = :id