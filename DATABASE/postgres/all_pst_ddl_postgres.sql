--DROP TABLE IDS CASCADE;
CREATE TABLE IDS  (
  TABLE_NAME varchar(20) NOT NULL,
  NEXT_ID numeric(30,0) DEFAULT 0 NOT NULL ,
  CONSTRAINT IDS_PK PRIMARY KEY (TABLE_NAME)
);
--DROP TABLE LETTCCMMNCLCODE CASCADE;
CREATE TABLE LETTCCMMNCLCODE (
  CL_CODE varchar(3) NOT NULL,
  CL_CODE_NM varchar(60) ,
  CL_CODE_DC varchar(200) ,
  USE_AT char(1) ,
  FRST_REGIST_PNTTM timestamp ,
  FRST_REGISTER_ID varchar(20) ,
  LAST_UPDT_PNTTM timestamp ,
  LAST_UPDUSR_ID varchar(20) ,
  CONSTRAINT LETTCCMMNCLCODE_PK PRIMARY KEY (CL_CODE)
) ;
--DROP TABLE LETTCCMMNCODE CASCADE;
CREATE TABLE LETTCCMMNCODE (
  CODE_ID varchar(6) NOT NULL,
  CODE_ID_NM varchar(60) ,
  CODE_ID_DC varchar(200) ,
  USE_AT char(1) ,
  CL_CODE varchar(3) ,
  FRST_REGIST_PNTTM timestamp ,
  FRST_REGISTER_ID varchar(20) ,
  LAST_UPDT_PNTTM timestamp ,
  LAST_UPDUSR_ID varchar(20) ,
  CONSTRAINT LETTCCMMNCODE_PK PRIMARY KEY (CODE_ID),
  CONSTRAINT LETTCCMMNCODE_ibfk_1 FOREIGN KEY (CL_CODE) REFERENCES LETTCCMMNCLCODE (CL_CODE)
) ;
--DROP TABLE LETTCCMMNDETAILCODE CASCADE;
CREATE TABLE LETTCCMMNDETAILCODE (
  CODE_ID varchar(6) NOT NULL,
  CODE varchar(15) NOT NULL,
  CODE_NM varchar(60) ,
  CODE_DC varchar(200) ,
  USE_AT char(1) ,
  FRST_REGIST_PNTTM timestamp ,
  FRST_REGISTER_ID varchar(20) ,
  LAST_UPDT_PNTTM timestamp ,
  LAST_UPDUSR_ID varchar(20) ,
  CONSTRAINT LETTCCMMNDETAILCODE_PK PRIMARY KEY (CODE_ID,CODE),
  CONSTRAINT LETTCCMMNDETAILCODE_ibfk_1 FOREIGN KEY (CODE_ID) REFERENCES LETTCCMMNCODE (CODE_ID)
) ;
--DROP TABLE LETTNORGNZTINFO CASCADE;
CREATE TABLE LETTNORGNZTINFO (
  ORGNZT_ID varchar(20) DEFAULT '' NOT NULL,
  ORGNZT_NM varchar(20) NOT NULL,
  ORGNZT_DC varchar(100) ,
  CONSTRAINT LETTNORGNZTINFO_PK PRIMARY KEY (ORGNZT_ID)
) ;
--DROP TABLE LETTNAUTHORGROUPINFO CASCADE;
CREATE TABLE LETTNAUTHORGROUPINFO (
  GROUP_ID varchar(20) DEFAULT '' NOT NULL,
  GROUP_NM varchar(60) NOT NULL,
  GROUP_CREAT_DE timestamp NOT NULL,
  GROUP_DC varchar(100) ,
  CONSTRAINT LETTNAUTHORGROUPINFO_PK PRIMARY KEY (GROUP_ID)
) ;
--DROP TABLE LETTNAUTHORINFO CASCADE;
CREATE TABLE LETTNAUTHORINFO (
  AUTHOR_CODE varchar(30) DEFAULT '' NOT NULL,
  AUTHOR_NM varchar(60) NOT NULL,
  AUTHOR_DC varchar(200) ,
  AUTHOR_CREAT_DE timestamp NOT NULL,
  CONSTRAINT LETTNAUTHORINFO_PK PRIMARY KEY (AUTHOR_CODE)
) ;
--DROP TABLE LETTNROLES_HIERARCHY CASCADE;
CREATE TABLE LETTNROLES_HIERARCHY (
  PARNTS_ROLE varchar(30) NOT NULL,
  CHLDRN_ROLE varchar(30) NOT NULL,
  CONSTRAINT LETTNROLES_HIERARCHY_PK PRIMARY KEY (PARNTS_ROLE,CHLDRN_ROLE),
  CONSTRAINT LETTNROLES_HIERARCHY_ibfk_2 FOREIGN KEY (CHLDRN_ROLE) REFERENCES LETTNAUTHORINFO (AUTHOR_CODE) ON DELETE CASCADE,
  CONSTRAINT LETTNROLES_HIERARCHY_ibfk_1 FOREIGN KEY (PARNTS_ROLE) REFERENCES LETTNAUTHORINFO (AUTHOR_CODE) ON DELETE CASCADE
) ;
--DROP TABLE LETTNROLEINFO CASCADE;
CREATE TABLE LETTNROLEINFO (
  ROLE_CODE varchar(50) DEFAULT '' NOT NULL,
  ROLE_NM varchar(60) NOT NULL,
  ROLE_PTTRN varchar(300) ,
  ROLE_DC varchar(200) ,
  ROLE_TY varchar(80) ,
  ROLE_SORT varchar(10) ,
  ROLE_CREAT_DE timestamp NOT NULL,
  CONSTRAINT LETTNROLEINFO_PK PRIMARY KEY (ROLE_CODE)
) ;
--DROP TABLE LETTNAUTHORROLERELATE CASCADE;
CREATE TABLE LETTNAUTHORROLERELATE (
  AUTHOR_CODE varchar(30) NOT NULL,
  ROLE_CODE varchar(50) NOT NULL,
  CREAT_DT timestamp ,
  CONSTRAINT LETTNAUTHORROLERELATE_PK PRIMARY KEY (AUTHOR_CODE,ROLE_CODE),
  CONSTRAINT LETTNAUTHORROLERELATE_ibfk_2 FOREIGN KEY (ROLE_CODE) REFERENCES LETTNROLEINFO (ROLE_CODE) ON DELETE CASCADE,
  CONSTRAINT LETTNAUTHORROLERELATE_ibfk_1 FOREIGN KEY (AUTHOR_CODE) REFERENCES LETTNAUTHORINFO (AUTHOR_CODE) ON DELETE CASCADE
) ;
--DROP TABLE LETTNGNRLMBER CASCADE;
CREATE TABLE LETTNGNRLMBER (
  MBER_ID varchar(20) DEFAULT '' NOT NULL,
  PASSWORD varchar(200) NOT NULL,
  PASSWORD_HINT varchar(100) NOT NULL,
  PASSWORD_CNSR varchar(100) NOT NULL,
  IHIDNUM varchar(200) ,
  MBER_NM varchar(50) NOT NULL,
  ZIP varchar(6) ,
  ADRES varchar(100) ,
  AREA_NO varchar(4) ,
  MBER_STTUS varchar(15) ,
  DETAIL_ADRES varchar(100) ,
  END_TELNO varchar(4) ,
  MBTLNUM varchar(20) ,
  GROUP_ID varchar(20) ,
  MBER_FXNUM varchar(20) ,
  MBER_EMAIL_ADRES varchar(50) ,
  MIDDLE_TELNO varchar(4) ,
  SBSCRB_DE timestamp ,
  SEXDSTN_CODE char(1) ,
  ESNTL_ID varchar(20) NOT NULL,
  CONSTRAINT LETTNGNRLMBER_PK PRIMARY KEY (MBER_ID),
  CONSTRAINT LETTNGNRLMBER_ibfk_1 FOREIGN KEY (GROUP_ID) REFERENCES LETTNAUTHORGROUPINFO (GROUP_ID) ON DELETE CASCADE
) ;
--DROP TABLE LETTNEMPLYRSCRTYESTBS CASCADE;
CREATE TABLE LETTNEMPLYRSCRTYESTBS (
  SCRTY_DTRMN_TRGET_ID varchar(20) NOT NULL,
  MBER_TY_CODE varchar(15) ,
  AUTHOR_CODE varchar(30) NOT NULL,
  CONSTRAINT LETTNEMPLYRSCRTYESTBS_PK PRIMARY KEY (SCRTY_DTRMN_TRGET_ID),
  CONSTRAINT LETTNEMPLYRSCRTYESTBS_ibfk_4 FOREIGN KEY (AUTHOR_CODE) REFERENCES LETTNAUTHORINFO (AUTHOR_CODE)
) ;
--DROP TABLE LETTNTMPLATINFO CASCADE;
CREATE TABLE LETTNTMPLATINFO (
  TMPLAT_ID varchar(20) DEFAULT '' NOT NULL,
  TMPLAT_NM varchar(255) ,
  TMPLAT_COURS varchar(2000) ,
  USE_AT char(1) ,
  TMPLAT_SE_CODE varchar(6) ,
  FRST_REGISTER_ID varchar(20) ,
  FRST_REGIST_PNTTM timestamp ,
  LAST_UPDUSR_ID varchar(20) ,
  LAST_UPDT_PNTTM timestamp ,
  CONSTRAINT LETTNTMPLATINFO_PK PRIMARY KEY (TMPLAT_ID)
) ;
--DROP TABLE LETTNBBSMASTER CASCADE;
CREATE TABLE LETTNBBSMASTER (
  BBS_ID varchar(20) NOT NULL,
  BBS_NM varchar(255) NOT NULL,
  BBS_INTRCN varchar(2400) ,
  BBS_TY_CODE varchar(6) NOT NULL,
  BBS_ATTRB_CODE varchar(6) NOT NULL,
  REPLY_POSBL_AT char(1) ,
  FILE_ATCH_POSBL_AT char(1) NOT NULL,
  ATCH_POSBL_FILE_NUMBER numeric(2,0) NOT NULL,
  ATCH_POSBL_FILE_SIZE numeric(8,0) ,
  USE_AT char(1) NOT NULL,
  TMPLAT_ID varchar(20) ,
  FRST_REGISTER_ID varchar(20) NOT NULL,
  FRST_REGIST_PNTTM timestamp NOT NULL,
  LAST_UPDUSR_ID varchar(20) ,
  LAST_UPDT_PNTTM timestamp ,
  CONSTRAINT LETTNBBSMASTER_PK PRIMARY KEY (BBS_ID)
) ;
--DROP TABLE LETTNBBSUSE CASCADE;
CREATE TABLE LETTNBBSUSE (
  BBS_ID varchar(20) NOT NULL,
  TRGET_ID varchar(20) DEFAULT '' NOT NULL,
  USE_AT char(1) NOT NULL,
  REGIST_SE_CODE varchar(6) ,
  FRST_REGIST_PNTTM timestamp ,
  FRST_REGISTER_ID varchar(20) NOT NULL,
  LAST_UPDT_PNTTM timestamp ,
  LAST_UPDUSR_ID varchar(20) ,
  CONSTRAINT LETTNBBSUSE_PK PRIMARY KEY (BBS_ID,TRGET_ID),
  CONSTRAINT LETTNBBSUSE_ibfk_1 FOREIGN KEY (BBS_ID) REFERENCES LETTNBBSMASTER (BBS_ID)
) ;
--DROP TABLE LETTNBBS CASCADE;
CREATE TABLE LETTNBBS (
  NTT_ID numeric(20,0) NOT NULL,
  BBS_ID varchar(20) NOT NULL,
  NTT_NO numeric(20,0) ,
  NTT_SJ varchar(2000) ,
  NTT_CN text,
  ANSWER_AT char(1) ,
  PARNTSCTT_NO numeric(10,0) ,
  ANSWER_LC numeric(8) ,
  SORT_ORDR numeric(8,0) ,
  RDCNT numeric(10,0) ,
  USE_AT char(1) NOT NULL,
  NTCE_BGNDE varchar(20) ,
  NTCE_ENDDE varchar(20) ,
  NTCR_ID varchar(20) ,
  NTCR_NM varchar(20) ,
  PASSWORD varchar(200) ,
  ATCH_FILE_ID varchar(20) ,
  FRST_REGIST_PNTTM timestamp NOT NULL,
  FRST_REGISTER_ID varchar(20) NOT NULL,
  LAST_UPDT_PNTTM timestamp ,
  LAST_UPDUSR_ID varchar(20) ,
  CONSTRAINT LETTNBBS_PK PRIMARY KEY (NTT_ID,BBS_ID),
  CONSTRAINT LETTNBBS_ibfk_1 FOREIGN KEY (BBS_ID) REFERENCES LETTNBBSMASTER (BBS_ID)
) ;
--DROP TABLE LETTNBBSMASTEROPTN CASCADE;
CREATE TABLE LETTNBBSMASTEROPTN (
  BBS_ID varchar(20) DEFAULT '' NOT NULL,
  ANSWER_AT char(1) DEFAULT '' NOT NULL,
  STSFDG_AT char(1) DEFAULT '' NOT NULL,
  FRST_REGIST_PNTTM timestamp DEFAULT now()::timestamp NOT NULL,
  LAST_UPDT_PNTTM timestamp ,
  FRST_REGISTER_ID varchar(20) DEFAULT '' NOT NULL,
  LAST_UPDUSR_ID varchar(20) ,
  CONSTRAINT LETTNBBSMASTEROPTN_PK PRIMARY KEY (BBS_ID)
) ;
--DROP TABLE LETTNEMPLYRINFO CASCADE;
CREATE TABLE LETTNEMPLYRINFO (
  EMPLYR_ID varchar(20) NOT NULL,
  ORGNZT_ID varchar(20) ,
  USER_NM varchar(60) NOT NULL,
  PASSWORD varchar(200) NOT NULL,
  EMPL_NO varchar(20) ,
  IHIDNUM varchar(200) ,
  SEXDSTN_CODE char(1) ,
  BRTHDY varchar(20) ,
  FXNUM varchar(20) ,
  HOUSE_ADRES varchar(100) ,
  PASSWORD_HINT varchar(100) NOT NULL,
  PASSWORD_CNSR varchar(100) NOT NULL,
  HOUSE_END_TELNO varchar(4) ,
  AREA_NO varchar(4) ,
  DETAIL_ADRES varchar(100) ,
  ZIP varchar(6) ,
  OFFM_TELNO varchar(20) ,
  MBTLNUM varchar(20) ,
  EMAIL_ADRES varchar(50) ,
  OFCPS_NM varchar(60) ,
  HOUSE_MIDDLE_TELNO varchar(4) ,
  GROUP_ID varchar(20) ,
  PSTINST_CODE varchar(8) ,
  EMPLYR_STTUS_CODE varchar(15) NOT NULL,
  ESNTL_ID varchar(20) NOT NULL,
  CRTFC_DN_VALUE varchar(20) ,
  SBSCRB_DE timestamp ,
  CONSTRAINT LETTNEMPLYRINFO_PK PRIMARY KEY (EMPLYR_ID),
  CONSTRAINT LETTNEMPLYRINFO_ibfk_2 FOREIGN KEY (GROUP_ID) REFERENCES LETTNAUTHORGROUPINFO (GROUP_ID) ON DELETE CASCADE,
  CONSTRAINT LETTNEMPLYRINFO_ibfk_1 FOREIGN KEY (ORGNZT_ID) REFERENCES LETTNORGNZTINFO (ORGNZT_ID) ON DELETE CASCADE
) ;
--DROP TABLE LETTCZIP CASCADE;
CREATE TABLE LETTCZIP (
  ZIP varchar(6) NOT NULL,
  SN numeric(10,0) DEFAULT '0' NOT NULL,
  CTPRVN_NM varchar(20) ,
  SIGNGU_NM varchar(20) ,
  EMD_NM varchar(60) ,
  LI_BULD_NM varchar(60) ,
  LNBR_DONG_HO varchar(20) ,
  FRST_REGIST_PNTTM timestamp ,
  FRST_REGISTER_ID varchar(20) ,
  LAST_UPDT_PNTTM timestamp ,
  LAST_UPDUSR_ID varchar(20) ,
  CONSTRAINT LETTCZIP_PK PRIMARY KEY (ZIP,SN)
) ;

--DROP TABLE LETTNBANNER CASCADE;
CREATE TABLE LETTNBANNER (
  BANNER_ID varchar(20) DEFAULT '' NOT NULL,
  BANNER_NM varchar(60) NOT NULL,
  LINK_URL varchar(255) NOT NULL,
  BANNER_IMAGE varchar(60) NOT NULL,
  BANNER_DC varchar(200) ,
  REFLCT_AT char(1) NOT NULL,
  FRST_REGISTER_ID varchar(20) ,
  FRST_REGIST_PNTTM timestamp ,
  LAST_UPDUSR_ID varchar(20) ,
  LAST_UPDT_PNTTM timestamp ,
  BANNER_IMAGE_FILE varchar(60) ,
  SORT_ORDR numeric(8,0) ,
  CONSTRAINT LETTNBANNER_PK PRIMARY KEY (BANNER_ID)
) ;
--DROP TABLE LETTNENTRPRSMBER CASCADE;
CREATE TABLE LETTNENTRPRSMBER (
  ENTRPRS_MBER_ID varchar(20) DEFAULT '' NOT NULL,
  ENTRPRS_SE_CODE varchar(15) ,
  BIZRNO varchar(10) ,
  JURIRNO varchar(13) ,
  CMPNY_NM varchar(60) NOT NULL,
  CXFC varchar(50) ,
  ZIP varchar(6) ,
  ADRES varchar(100) ,
  ENTRPRS_MIDDLE_TELNO varchar(4) ,
  FXNUM varchar(20) ,
  INDUTY_CODE varchar(15) ,
  APPLCNT_NM varchar(50) ,
  APPLCNT_IHIDNUM varchar(200) ,
  SBSCRB_DE timestamp ,
  ENTRPRS_MBER_STTUS varchar(15) ,
  ENTRPRS_MBER_PASSWORD varchar(200) NOT NULL,
  ENTRPRS_MBER_PASSWORD_HINT varchar(100) NOT NULL,
  ENTRPRS_MBER_PASSWORD_CNSR varchar(100) NOT NULL,
  GROUP_ID varchar(20) ,
  DETAIL_ADRES varchar(100) ,
  ENTRPRS_END_TELNO varchar(4) ,
  AREA_NO varchar(4) ,
  APPLCNT_EMAIL_ADRES varchar(50) ,
  ESNTL_ID varchar(20) NOT NULL,
  CONSTRAINT LETTNENTRPRSMBER_PK PRIMARY KEY (ENTRPRS_MBER_ID),
  CONSTRAINT LETTNENTRPRSMBER_ibfk_1 FOREIGN KEY (GROUP_ID) REFERENCES LETTNAUTHORGROUPINFO (GROUP_ID) ON DELETE CASCADE
) ;
--DROP TABLE LETTNFILE CASCADE;
CREATE TABLE LETTNFILE (
  ATCH_FILE_ID varchar(20) NOT NULL,
  CREAT_DT timestamp NOT NULL,
  USE_AT char(1) ,
  CONSTRAINT LETTNFILE_PK PRIMARY KEY (ATCH_FILE_ID)
) ;
--DROP TABLE LETTNFILEDETAIL CASCADE;
CREATE TABLE LETTNFILEDETAIL (
  ATCH_FILE_ID varchar(20) NOT NULL,
  FILE_SN numeric(10,0) NOT NULL,
  FILE_STRE_COURS varchar(2000) NOT NULL,
  STRE_FILE_NM varchar(255) NOT NULL,
  ORIGNL_FILE_NM varchar(255) ,
  FILE_EXTSN varchar(20) NOT NULL,
  FILE_CN text,
  FILE_SIZE numeric(8,0) ,
  CONSTRAINT LETTNFILEDETAIL_PK PRIMARY KEY (ATCH_FILE_ID,FILE_SN),
  CONSTRAINT LETTNFILEDETAIL_ibfk_1 FOREIGN KEY (ATCH_FILE_ID) REFERENCES LETTNFILE (ATCH_FILE_ID)
) ;
--DROP TABLE LETTNFAQINFO CASCADE;
CREATE TABLE LETTNFAQINFO (
  FAQ_ID varchar(20) NOT NULL,
  QESTN_SJ varchar(255) ,
  QESTN_CN varchar(2500) ,
  ANSWER_CN varchar(2500) ,
  RDCNT numeric(10,0) ,
  FRST_REGIST_PNTTM timestamp NOT NULL,
  FRST_REGISTER_ID varchar(20) NOT NULL,
  LAST_UPDT_PNTTM timestamp NOT NULL,
  LAST_UPDUSR_ID varchar(20) NOT NULL,
  ATCH_FILE_ID varchar(20) ,
  QNA_PROCESS_STTUS_CODE char(1) ,
  CONSTRAINT LETTNFAQINFO_PK PRIMARY KEY (FAQ_ID),
  CONSTRAINT LETTNFAQINFO_ibfk_1 FOREIGN KEY (ATCH_FILE_ID) REFERENCES LETTNFILE (ATCH_FILE_ID)
) ;
--DROP TABLE LETTNINDVDLINFOPOLICY CASCADE;
CREATE TABLE LETTNINDVDLINFOPOLICY (
  INDVDL_INFO_POLICY_ID varchar(20) DEFAULT '' NOT NULL,
  INDVDL_INFO_POLICY_CN varchar(2500) ,
  INDVDL_INFO_POLICY_AGRE_AT char(1) ,
  FRST_REGISTER_ID varchar(20) ,
  FRST_REGIST_PNTTM timestamp ,
  LAST_UPDUSR_ID varchar(20) ,
  LAST_UPDT_PNTTM timestamp ,
  INDVDL_INFO_POLICY_NM varchar(255) ,
  CONSTRAINT LETTNINDVDLINFOPOLICY_PK PRIMARY KEY (INDVDL_INFO_POLICY_ID)
) ;
--DROP TABLE LETTNPROGRMLIST CASCADE;
CREATE TABLE LETTNPROGRMLIST (
  PROGRM_FILE_NM varchar(60) DEFAULT '' NOT NULL,
  PROGRM_STRE_PATH varchar(100) NOT NULL,
  PROGRM_KOREAN_NM varchar(60) ,
  PROGRM_DC varchar(200) ,
  URL varchar(100) NOT NULL,
  CONSTRAINT LETTNPROGRMLIST_PK PRIMARY KEY (PROGRM_FILE_NM)
) ;
--DROP TABLE LETTNMENUINFO CASCADE;
CREATE TABLE LETTNMENUINFO (
  MENU_NM varchar(60) NOT NULL,
  PROGRM_FILE_NM varchar(60) NOT NULL,
  MENU_NO numeric(20,0) NOT NULL,
  UPPER_MENU_NO numeric(20,0) ,
  MENU_ORDR numeric(5,0) NOT NULL,
  MENU_DC varchar(250) ,
  RELATE_IMAGE_PATH varchar(100) ,
  RELATE_IMAGE_NM varchar(60) ,
  CONSTRAINT LETTNMENUINFO_PK PRIMARY KEY (MENU_NO),
  CONSTRAINT LETTNMENUINFO_ibfk_2 FOREIGN KEY (UPPER_MENU_NO) REFERENCES LETTNMENUINFO (MENU_NO),
  CONSTRAINT LETTNMENUINFO_ibfk_1 FOREIGN KEY (PROGRM_FILE_NM) REFERENCES LETTNPROGRMLIST (PROGRM_FILE_NM) ON DELETE CASCADE
) ;
--DROP TABLE LETTNMENUCREATDTLS CASCADE;
CREATE TABLE LETTNMENUCREATDTLS (
  MENU_NO numeric(20,0) NOT NULL,
  AUTHOR_CODE varchar(30) NOT NULL,
  MAPNG_CREAT_ID varchar(30) ,
  CONSTRAINT LETTNMENUCREATDTLS_PK PRIMARY KEY (MENU_NO,AUTHOR_CODE),
  CONSTRAINT LETTNMENUCREATDTLS_ibfk_3 FOREIGN KEY (AUTHOR_CODE) REFERENCES LETTNAUTHORINFO (AUTHOR_CODE),
  CONSTRAINT LETTNMENUCREATDTLS_ibfk_1 FOREIGN KEY (MENU_NO) REFERENCES LETTNMENUINFO (MENU_NO) ON DELETE CASCADE
) ;
--DROP TABLE LETTNQAINFO CASCADE;
CREATE TABLE LETTNQAINFO (
  QA_ID varchar(20) NOT NULL,
  QESTN_SJ varchar(255) ,
  QESTN_CN varchar(2500) ,
  WRITNG_DE varchar(20) ,
  RDCNT numeric(10,0) ,
  EMAIL_ADRES varchar(50) ,
  FRST_REGIST_PNTTM timestamp ,
  FRST_REGISTER_ID varchar(20) ,
  LAST_UPDT_PNTTM timestamp ,
  LAST_UPDUSR_ID varchar(20) ,
  QNA_PROCESS_STTUS_CODE char(1) ,
  WRTER_NM varchar(20) ,
  ANSWER_CN varchar(2500) ,
  WRITNG_PASSWORD varchar(20) ,
  ANSWER_DE varchar(20) ,
  EMAIL_ANSWER_AT char(1) ,
  AREA_NO varchar(4) ,
  MIDDLE_TELNO varchar(4) ,
  END_TELNO varchar(4) ,
  CONSTRAINT LETTNQAINFO_PK PRIMARY KEY (QA_ID)
) ;

--DROP TABLE LETTNQUSTNRTMPLAT CASCADE;
CREATE TABLE LETTNQUSTNRTMPLAT (
  QUSTNR_TMPLAT_ID varchar(20) NOT NULL,
  QUSTNR_TMPLAT_TY varchar(100) ,
  QUSTNR_TMPLAT_DC varchar(2000) ,
  QUSTNR_TMPLAT_PATH_NM varchar(100) ,
  FRST_REGIST_PNTTM timestamp ,
  FRST_REGISTER_ID varchar(20) ,
  LAST_UPDT_PNTTM timestamp ,
  LAST_UPDUSR_ID varchar(20) ,
  QUSTNR_TMPLAT_IMAGE_INFO text,
  CONSTRAINT LETTNQUSTNRTMPLAT_PK PRIMARY KEY (QUSTNR_TMPLAT_ID)
) ;

--DROP TABLE LETTNQESTNRINFO CASCADE;
CREATE TABLE LETTNQESTNRINFO (
  QUSTNR_TMPLAT_ID varchar(20) NOT NULL,
  QESTNR_ID varchar(20) NOT NULL,
  QUSTNR_SJ varchar(255) ,
  QUSTNR_PURPS varchar(1000) ,
  QUSTNR_WRITNG_GUIDANCE_CN varchar(2000) ,
  QUSTNR_TRGET varchar(1000) ,
  QUSTNR_BGNDE varchar(20) ,
  QUSTNR_ENDDE varchar(20) ,
  FRST_REGIST_PNTTM timestamp ,
  FRST_REGISTER_ID varchar(20) ,
  LAST_UPDT_PNTTM timestamp ,
  LAST_UPDUSR_ID varchar(20) ,
  CONSTRAINT LETTNQESTNRINFO_PK PRIMARY KEY (QUSTNR_TMPLAT_ID,QESTNR_ID),
  CONSTRAINT LETTNQESTNRINFO_ibfk_1 FOREIGN KEY (QUSTNR_TMPLAT_ID) REFERENCES LETTNQUSTNRTMPLAT (QUSTNR_TMPLAT_ID)
) ;
--DROP TABLE LETTNQUSTNRQESITM CASCADE;
CREATE TABLE LETTNQUSTNRQESITM (
  QESTNR_ID varchar(20) NOT NULL,
  QUSTNR_QESITM_ID varchar(20) NOT NULL,
  QUSTNR_TMPLAT_ID varchar(20) NOT NULL,
  QESTN_SN numeric(10,0) ,
  QESTN_TY_CODE char(1) ,
  QESTN_CN varchar(2500) ,
  MXMM_CHOISE_CO numeric(5,0) ,
  FRST_REGIST_PNTTM timestamp NOT NULL,
  FRST_REGISTER_ID varchar(20) NOT NULL,
  LAST_UPDT_PNTTM timestamp NOT NULL,
  LAST_UPDUSR_ID varchar(20) NOT NULL,
  CONSTRAINT LETTNQUSTNRQESITM_PK PRIMARY KEY (QESTNR_ID,QUSTNR_QESITM_ID,QUSTNR_TMPLAT_ID),
  CONSTRAINT LETTNQUSTNRQESITM_ibfk_1 FOREIGN KEY (QUSTNR_TMPLAT_ID, QESTNR_ID) REFERENCES LETTNQESTNRINFO (QUSTNR_TMPLAT_ID, QESTNR_ID)
) ;
--DROP TABLE LETTNQUSTNRIEM CASCADE;
CREATE TABLE LETTNQUSTNRIEM (
  QUSTNR_TMPLAT_ID varchar(20) NOT NULL,
  QESTNR_ID varchar(20) NOT NULL,
  QUSTNR_QESITM_ID varchar(20) NOT NULL,
  QUSTNR_IEM_ID varchar(20) NOT NULL,
  IEM_SN numeric(5,0) ,
  IEM_CN varchar(1000) ,
  ETC_ANSWER_AT char(1) ,
  FRST_REGIST_PNTTM timestamp ,
  FRST_REGISTER_ID varchar(20) ,
  LAST_UPDT_PNTTM timestamp ,
  LAST_UPDUSR_ID varchar(20) ,
  CONSTRAINT LETTNQUSTNRIEM_PK PRIMARY KEY (QUSTNR_TMPLAT_ID,QESTNR_ID,QUSTNR_QESITM_ID,QUSTNR_IEM_ID),
  CONSTRAINT LETTNQUSTNRIEM_ibfk_1 FOREIGN KEY (QESTNR_ID, QUSTNR_QESITM_ID, QUSTNR_TMPLAT_ID) REFERENCES LETTNQUSTNRQESITM (QESTNR_ID, QUSTNR_QESITM_ID, QUSTNR_TMPLAT_ID)
) ;

--DROP TABLE LETTNQUSTNRRESPONDINFO CASCADE;
CREATE TABLE LETTNQUSTNRRESPONDINFO (
  QUSTNR_TMPLAT_ID varchar(20) NOT NULL,
  QESTNR_ID varchar(20) NOT NULL,
  QUSTNR_RESPOND_ID varchar(20) NOT NULL,
  SEXDSTN_CODE char(1) ,
  OCCP_TY_CODE char(1) ,
  RESPOND_NM varchar(50) ,
  BRTHDY varchar(20) ,
  AREA_NO varchar(4) ,
  MIDDLE_TELNO varchar(4) ,
  END_TELNO varchar(4) ,
  FRST_REGIST_PNTTM timestamp ,
  FRST_REGISTER_ID varchar(20) ,
  LAST_UPDT_PNTTM timestamp ,
  LAST_UPDUSR_ID varchar(20) ,
  CONSTRAINT LETTNQUSTNRRESPONDINFO_PK PRIMARY KEY (QUSTNR_TMPLAT_ID,QESTNR_ID,QUSTNR_RESPOND_ID),
  CONSTRAINT LETTNQUSTNRRESPONDINFO_ibfk_1 FOREIGN KEY (QUSTNR_TMPLAT_ID, QESTNR_ID) REFERENCES LETTNQESTNRINFO (QUSTNR_TMPLAT_ID, QESTNR_ID)
) ;
--DROP TABLE LETTNQUSTNRRSPNSRESULT CASCADE;
CREATE TABLE LETTNQUSTNRRSPNSRESULT (
  QUSTNR_RSPNS_RESULT_ID varchar(20) NOT NULL,
  QESTNR_ID varchar(20) NOT NULL,
  QUSTNR_QESITM_ID varchar(20) NOT NULL,
  QUSTNR_TMPLAT_ID varchar(20) NOT NULL,
  RESPOND_ANSWER_CN varchar(1000) ,
  ETC_ANSWER_CN varchar(1000) ,
  RESPOND_NM varchar(50) ,
  FRST_REGIST_PNTTM timestamp ,
  FRST_REGISTER_ID varchar(20) ,
  LAST_UPDT_PNTTM timestamp ,
  LAST_UPDUSR_ID varchar(20) ,
  QUSTNR_IEM_ID varchar(20) ,
  CONSTRAINT LETTNQUSTNRRSPNSRESULT_PK PRIMARY KEY (QUSTNR_RSPNS_RESULT_ID,QESTNR_ID,QUSTNR_QESITM_ID,QUSTNR_TMPLAT_ID),
  CONSTRAINT LETTNQUSTNRRSPNSRESULT_ibfk_1 FOREIGN KEY (QESTNR_ID, QUSTNR_QESITM_ID, QUSTNR_TMPLAT_ID) REFERENCES LETTNQUSTNRQESITM (QESTNR_ID, QUSTNR_QESITM_ID, QUSTNR_TMPLAT_ID)
) ;

--DROP TABLE LETTNSTPLATINFO CASCADE;
CREATE TABLE LETTNSTPLATINFO (
  USE_STPLAT_ID varchar(20) NOT NULL,
  USE_STPLAT_NM varchar(100) ,
  USE_STPLAT_CN text,
  INFO_PROVD_AGRE_CN text,
  FRST_REGIST_PNTTM timestamp ,
  FRST_REGISTER_ID varchar(20) ,
  LAST_UPDT_PNTTM timestamp ,
  LAST_UPDUSR_ID varchar(20) ,
  CONSTRAINT LETTNSTPLATINFO_PK PRIMARY KEY (USE_STPLAT_ID)
) ;

CREATE OR REPLACE VIEW COMVNUSERMASTER ( ESNTL_ID,USER_ID,PASSWORD,USER_NM,USER_ZIP,USER_ADRES,USER_EMAIL,GROUP_ID, USER_SE, ORGNZT_ID ) 
AS  
        SELECT ESNTL_ID, MBER_ID,PASSWORD,MBER_NM,ZIP,ADRES,MBER_EMAIL_ADRES,' ','GNR' AS USER_SE, ' ' ORGNZT_ID
        FROM LETTNGNRLMBER
    UNION ALL
        SELECT ESNTL_ID,EMPLYR_ID,PASSWORD,USER_NM,ZIP,HOUSE_ADRES,EMAIL_ADRES,GROUP_ID ,'USR' AS USER_SE, ORGNZT_ID
        FROM LETTNEMPLYRINFO
    UNION ALL
        SELECT ESNTL_ID,ENTRPRS_MBER_ID,ENTRPRS_MBER_PASSWORD,CMPNY_NM,ZIP,ADRES,APPLCNT_EMAIL_ADRES,' ' ,'ENT' AS USER_SE, ' ' ORGNZT_ID
        FROM LETTNENTRPRSMBER 
;