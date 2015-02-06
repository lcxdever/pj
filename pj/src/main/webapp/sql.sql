CREATE TABLESPACE "GODEWIND" 
    LOGGING 
    DATAFILE 'D:\oracle\oradata\GODEWIND.ora' SIZE 40M
   AUTOEXTEND
    ON NEXT  100M MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL 
    SEGMENT SPACE MANAGEMENT  AUTO ;
  
  CREATE USER "GODEWIND"  PROFILE "DEFAULT" 
    IDENTIFIED BY "GODEWIND" DEFAULT TABLESPACE "GODEWIND" 
    ACCOUNT UNLOCK;
GRANT "CONNECT" TO "GODEWIND";
GRANT "DBA" TO "GODEWIND"

-- Create table
create table T_USER
(
  id         VARCHAR2(50) not null,
  username   VARCHAR2(100) not null,
  password   VARCHAR2(100),
  createtime DATE,
  createuser VARCHAR2(100)
)
tablespace GODEWIND
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_USER
  add constraint USER_PK primary key (ID)
  using index 
  tablespace GODEWIND
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table T_USER
  add constraint USER_USERNAME_PK unique (USERNAME)
  using index 
  tablespace GODEWIND
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
insert into T_USER (id, username, password, createtime, createuser)
values ('4fa22fae-bcf3-4347-8b2a-b5f00108f70a', 'admin', '202CB962AC59075B964B07152D234B70', to_date('06-02-2015 10:09:49', 'dd-mm-yyyy hh24:mi:ss'), 'admin');
-- Create table
create table NEWS
(
  id         VARCHAR2(50) not null,
  title      VARCHAR2(100),
  content    CLOB,
  createtime DATE,
  createuser VARCHAR2(100),
  url        VARCHAR2(500),
  type       NUMBER,
  ishot      NUMBER,
  filename   VARCHAR2(100),
  onlytxt    CLOB,
  summary    VARCHAR2(100),
  showpicurl VARCHAR2(1000)
)
tablespace GODEWIND
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 8
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table NEWS
  add constraint NEWS_PK primary key (ID)
  using index 
  tablespace GODEWIND
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
