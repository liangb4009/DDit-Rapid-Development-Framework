-- Table:Lines
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Lines','����'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '������','Lines','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Lines','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id(���)','Lines','DepartmentId'
EXEC [dbo].[sp_addextendedproperty_v2] '������д','Lines','LineAbbreviation'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id(����)','Lines','LineId'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','Lines','LineName'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','Lines','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','Lines','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','Lines','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '������','Lines','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','Lines','Update_Time'
-- End Table:Lines
-- Table:Devices
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Devices','�豸'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '������','Devices','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Devices','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id(���)','Devices','DepartmentId'
EXEC [dbo].[sp_addextendedproperty_v2] '�豸Id(����)','Devices','DeviceId'
EXEC [dbo].[sp_addextendedproperty_v2] '�豸����','Devices','DeviceName'
EXEC [dbo].[sp_addextendedproperty_v2] '�豸���','Devices','DeviceNumber'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id(���)','Devices','LineId'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','Devices','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','Devices','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','Devices','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '��λId(���)','Devices','StationId'
EXEC [dbo].[sp_addextendedproperty_v2] '������','Devices','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','Devices','Update_Time'
-- End Table:Devices
-- Table:User_Role
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'User_Role','�û���ɫ'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '�û���ɫ','User_Role','ID'
EXEC [dbo].[sp_addextendedproperty_v2] '�û�Id','User_Role','Role_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '��ɫId','User_Role','User_ID'
-- End Table:User_Role
-- Table:User
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'User','�û�'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','User','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id','User','Department_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '�û�ͷ��','User','HeadPortrait'
EXEC [dbo].[sp_addextendedproperty_v2] '�Ƿ���Ч(1-��Ч, 0-��Ч)','User','IsEnable'
EXEC [dbo].[sp_addextendedproperty_v2] '��ע','User','Remark'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','User','Update_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '�û�Id','User','User_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '�û�����','User','User_Name'
EXEC [dbo].[sp_addextendedproperty_v2] '�û�����','User','User_Password'
EXEC [dbo].[sp_addextendedproperty_v2] '�û���ʾ����','User','User_Reallyname'
-- End Table:User
-- Table:test
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'test','����'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '����','test','age'
EXEC [dbo].[sp_addextendedproperty_v2] '����ID','test','ID'
EXEC [dbo].[sp_addextendedproperty_v2] '����','test','Name'
EXEC [dbo].[sp_addextendedproperty_v2] '���ID','test','ForeighId'
-- End Table:test
-- Table:test2
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'test2','����2'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '����ID','test2','foreignkey'
-- End Table:test
-- Table:SystemInfo
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'SystemInfo','ϵͳ��Ϣ'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '�Ƿ���Ч����','SystemInfo','IsValidCode'
EXEC [dbo].[sp_addextendedproperty_v2] 'ϵͳ��Ȩ','SystemInfo','System_Copyright'
EXEC [dbo].[sp_addextendedproperty_v2] 'ϵͳId','SystemInfo','System_ID'
EXEC [dbo].[sp_addextendedproperty_v2] 'ϵͳ����','SystemInfo','System_Title'
EXEC [dbo].[sp_addextendedproperty_v2] 'ϵͳ�汾','SystemInfo','System_Version'
-- End Table:SystemInfo
-- Table:Role_Button
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Role_Button','��ɫ��ť'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '��ťID','Role_Button','Button_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '��ɫ��ť','Role_Button','ID'
EXEC [dbo].[sp_addextendedproperty_v2] '�˵�ID','Role_Button','Menu_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '��ɫID','Role_Button','Role_ID'
-- End Table:Role_Button
-- Table:Role
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Role','��ɫ'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Role','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '��ɫ����','Role','Role_Description'
EXEC [dbo].[sp_addextendedproperty_v2] '��ɫID','Role','Role_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '��ɫ����','Role','Role_Name'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Role','Update_Time'
-- End Table:Role
-- Table:Menu_Button
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Menu_Button','�˵���ť'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '��ťID','Menu_Button','Button_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '�˵���ť','Menu_Button','ID'
EXEC [dbo].[sp_addextendedproperty_v2] '�˵�ID','Menu_Button','Menu_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '�˵�����','Menu_Button','OrderBy'
-- End Table:Menu_Button
-- Table:LoginLog
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'LoginLog','��¼��־'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '��¼��ID','LoginLog','Login_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼IP','LoginLog','Login_IP'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼��','LoginLog','Login_Name'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼�ǳ�','LoginLog','Login_Nicker'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ʱ��','LoginLog','Login_Time'
-- End Table:LoginLog
-- Table:DictionaryCategory
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'DictionaryCategory','�ֵ����'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '���','DictionaryCategory','Category'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','DictionaryCategory','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '�Ƿ���Ч(1-��Ч,0-��Ч)','DictionaryCategory','Enabled'
EXEC [dbo].[sp_addextendedproperty_v2] 'ID','DictionaryCategory','ID'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','DictionaryCategory','Update_Time'
-- End Table:DictionaryCategory
-- Table:A_EF
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'A_EF','�¼�'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '������','A_EF','ChineseName'
EXEC [dbo].[sp_addextendedproperty_v2] 'Ա�����','A_EF','EmployeeNumber'
EXEC [dbo].[sp_addextendedproperty_v2] '����״̬(1-�½�,2-�������)','A_EF','HandleStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '������ַ','A_EF','HostAddress'
EXEC [dbo].[sp_addextendedproperty_v2] 'ID','A_EF','ID'
EXEC [dbo].[sp_addextendedproperty_v2] '���༭��','A_EF','LastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '���༭ʱ��','A_EF','LastEditDt'
EXEC [dbo].[sp_addextendedproperty_v2] '����','A_EF','Name'
EXEC [dbo].[sp_addextendedproperty_v2] '����','A_EF','Params'
EXEC [dbo].[sp_addextendedproperty_v2] '��ID','A_EF','ParentId'
EXEC [dbo].[sp_addextendedproperty_v2] 'ϵͳ����','A_EF','SystemCode'
EXEC [dbo].[sp_addextendedproperty_v2] '���ű���','A_EF','UnitCode'
-- End Table:A_EF
-- Table:Dictionary
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Dictionary','�ֵ�'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Dictionary','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '���ID','Dictionary','DicCategoryID'
EXEC [dbo].[sp_addextendedproperty_v2] '�ֵ�ֵ','Dictionary','DicValue'
EXEC [dbo].[sp_addextendedproperty_v2] '�Ƿ���Ч(1-��Ч,0-��Ч)','Dictionary','Enabled'
EXEC [dbo].[sp_addextendedproperty_v2] 'ID','Dictionary','ID'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Dictionary','Update_Time'
-- End Table:Dictionary
-- Table:Button
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Button','��ť'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '����','Button','Button_Describe'
EXEC [dbo].[sp_addextendedproperty_v2] '��ťID','Button','Button_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '��ťͼ��','Button','Button_Magic'
EXEC [dbo].[sp_addextendedproperty_v2] '��ť����','Button','Button_Name'
EXEC [dbo].[sp_addextendedproperty_v2] '��ť����','Button','Button_Operation'
EXEC [dbo].[sp_addextendedproperty_v2] '��ť����ID','Button','Button_OpID'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Button','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Button','Update_Time'
-- End Table:Button
-- Table:Stations
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Stations','��λ'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '������','Stations','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Stations','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id(���)','Stations','DepartmentId'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id(���)','Stations','LineId'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','Stations','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','Stations','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','Stations','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '��λId(����)','Stations','StationId'
EXEC [dbo].[sp_addextendedproperty_v2] '��λ����','Stations','StationName'
EXEC [dbo].[sp_addextendedproperty_v2] '��λ���','Stations','StationNumber'
EXEC [dbo].[sp_addextendedproperty_v2] '������','Stations','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','Stations','Update_Time'
-- End Table:Stations
-- Table:Account
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Account','�ʻ�'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '�ʻ�ID','Account','AccountID'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id','Account','TestID'
EXEC [dbo].[sp_addextendedproperty_v2] '����','Account','Total'
-- End Table:Account
-- Table:InternalStandard
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'InternalStandard','�ڿر�׼'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '������','InternalStandard','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','InternalStandard','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id(���)','InternalStandard','DepartmentId'
EXEC [dbo].[sp_addextendedproperty_v2] '�ڿر�׼Id(����)','InternalStandard','InternalStandardId'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id(���)','InternalStandard','LineId'
EXEC [dbo].[sp_addextendedproperty_v2] '��Ʒ����','InternalStandard','ProduceName'
EXEC [dbo].[sp_addextendedproperty_v2] '��Ʒ���','InternalStandard','ProductNo'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','InternalStandard','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','InternalStandard','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','InternalStandard','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '��׼�����ٶ�','InternalStandard','StandardProduceSpeed'
EXEC [dbo].[sp_addextendedproperty_v2] '��׼�����ٶȵ�λ','InternalStandard','StandardProduceSpeedUnit'
EXEC [dbo].[sp_addextendedproperty_v2] '��λId','InternalStandard','StationId'
EXEC [dbo].[sp_addextendedproperty_v2] '������','InternalStandard','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','InternalStandard','Update_Time'
-- End Table:InternalStandard
-- Table:WoBatchStatus
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'WoBatchStatus','��������'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '����Id(����)','WoBatchStatus','BatchId'
EXEC [dbo].[sp_addextendedproperty_v2] '������','WoBatchStatus','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','WoBatchStatus','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','WoBatchStatus','OrderDate'
EXEC [dbo].[sp_addextendedproperty_v2] '������','WoBatchStatus','OrderNumber'
EXEC [dbo].[sp_addextendedproperty_v2] '��Ʒ����','WoBatchStatus','ProductDesc'
EXEC [dbo].[sp_addextendedproperty_v2] '��Ʒ���','WoBatchStatus','ProductNo'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','WoBatchStatus','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','WoBatchStatus','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','WoBatchStatus','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '���','WoBatchStatus','ShiftCode'
EXEC [dbo].[sp_addextendedproperty_v2] '������','WoBatchStatus','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','WoBatchStatus','Update_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','WoBatchStatus','WorkCenterNo'
-- End Table:WoBatchStatus
-- Table:USERINFOMATION
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'USERINFOMATION','�û���Ϣ'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','USERINFOMATION','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id','USERINFOMATION','Department_ID'
EXEC [dbo].[sp_addextendedproperty_v2] 'ͷ��','USERINFOMATION','HeadPortrait'
EXEC [dbo].[sp_addextendedproperty_v2] '�Ƿ���Ч(1-��Ч, 0-��Ч)','USERINFOMATION','IsEnable'
EXEC [dbo].[sp_addextendedproperty_v2] '��ע','USERINFOMATION','Remark'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','USERINFOMATION','Update_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '�û�Id','USERINFOMATION','User_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '�û���','USERINFOMATION','User_Name'
EXEC [dbo].[sp_addextendedproperty_v2] '�û�����','USERINFOMATION','User_Password'
EXEC [dbo].[sp_addextendedproperty_v2] '�û���ʾ����','USERINFOMATION','User_Reallyname'
-- End Table:USERINFOMATION
-- Table:ProductTimeRecordHeader
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'ProductTimeRecordHeader','����ʱ���¼��ͷ'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '��������Id(���)','ProductTimeRecordHeader','BatchId'
EXEC [dbo].[sp_addextendedproperty_v2] '������','ProductTimeRecordHeader','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','ProductTimeRecordHeader','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '�豸Id(���)','ProductTimeRecordHeader','DeviceId'
EXEC [dbo].[sp_addextendedproperty_v2] '��ͷId(����)','ProductTimeRecordHeader','HeaderId'
EXEC [dbo].[sp_addextendedproperty_v2] '�Ƿ��̨����(1-�ǣ�2-��)','ProductTimeRecordHeader','IsMachineData'
EXEC [dbo].[sp_addextendedproperty_v2] '��������(1-������2-������)','ProductTimeRecordHeader','OrderType'
EXEC [dbo].[sp_addextendedproperty_v2] '����״̬(1-������2-ֹͣ)','ProductTimeRecordHeader','ProduceStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','ProductTimeRecordHeader','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','ProductTimeRecordHeader','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','ProductTimeRecordHeader','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '������','ProductTimeRecordHeader','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','ProductTimeRecordHeader','Update_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '���⹤������','ProductTimeRecordHeader','VirtualWorkCenterNo'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','ProductTimeRecordHeader','WorkCenterNo'
-- End Table:ProductTimeRecordHeader
-- Table:ProductTimeRecordDetail
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'ProductTimeRecordDetail','����ʱ���¼��ϸ'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '������','ProductTimeRecordDetail','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','ProductTimeRecordDetail','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] 'Ա������','ProductTimeRecordDetail','Crew'
EXEC [dbo].[sp_addextendedproperty_v2] '��ϸId(����)','ProductTimeRecordDetail','DetailID'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��(��λ��)','ProductTimeRecordDetail','Duration'
EXEC [dbo].[sp_addextendedproperty_v2] '��ʼʱ��','ProductTimeRecordDetail','EndTime'
EXEC [dbo].[sp_addextendedproperty_v2] '��ͷId(���)','ProductTimeRecordDetail','HeaderID'
EXEC [dbo].[sp_addextendedproperty_v2] '�˹���ʱ(��λ��)','ProductTimeRecordDetail','Labor'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','ProductTimeRecordDetail','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','ProductTimeRecordDetail','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','ProductTimeRecordDetail','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '��ע','ProductTimeRecordDetail','Remark'
EXEC [dbo].[sp_addextendedproperty_v2] 'ά����Ա(0-��, 1-���̲�, 2-����)','ProductTimeRecordDetail','RepairMan'
EXEC [dbo].[sp_addextendedproperty_v2] '��ʼʱ��','ProductTimeRecordDetail','StartTime'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬','ProductTimeRecordDetail','Status'
EXEC [dbo].[sp_addextendedproperty_v2] 'ͣ��ԭ�����','ProductTimeRecordDetail','StopReasonCode'
EXEC [dbo].[sp_addextendedproperty_v2] 'ͣ��ԭ������','ProductTimeRecordDetail','StopReasonDesc'
EXEC [dbo].[sp_addextendedproperty_v2] '������','ProductTimeRecordDetail','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','ProductTimeRecordDetail','Update_Time'
-- End Table:ProductTimeRecordDetail
-- Table:Departments
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Departments','����'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '������','Departments','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Departments','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '���ű���','Departments','DepartmentCode'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id(����)','Departments','DepartmentId'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','Departments','DepartmentName'
EXEC [dbo].[sp_addextendedproperty_v2] '�����ű���','Departments','DepartmentParentCode'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','Departments','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','Departments','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','Lines','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '������','Departments','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','Departments','Update_Time'
-- End Table:Departments
-- Table:Model
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Model','ģ��'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '������','Model','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Model','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] 'ģ��Id(����)','Model','ModelID'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','Model','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','Model','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','Model','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '������','Model','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','Model','Update_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '�汾Id(���)','Model','VersionID'
-- End Table:Model
-- Table:Element
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Element','Ԫ��'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '������','Element','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Element','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '����','Element','Description'
EXEC [dbo].[sp_addextendedproperty_v2] 'Ԫ��Id(����)','Element','ElementID'
EXEC [dbo].[sp_addextendedproperty_v2] 'ģ��Id(���)','Element','ModelID'
EXEC [dbo].[sp_addextendedproperty_v2] '����','Element','Name'
EXEC [dbo].[sp_addextendedproperty_v2] '��Ԫ��Id','Element','ParentElementID'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','Element','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','Element','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','Element','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '������','Element','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','Element','Update_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '�汾Id(���)','Element','VersionID'
-- End Table:Element
-- Table:ElementTemplate
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'ElementTemplate','Ԫ��ģ��'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '������','ElementTemplate','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','ElementTemplate','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '����','ElementTemplate','Description'
EXEC [dbo].[sp_addextendedproperty_v2] 'Ԫ��ģ��Id(����)','ElementTemplate','ElementTemplateID'
EXEC [dbo].[sp_addextendedproperty_v2] '����','ElementTemplate','Name'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','ElementTemplate','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','ElementTemplate','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','ElementTemplate','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '������','ElementTemplate','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','ElementTemplate','Update_Time'
-- End Table:ElementTemplate
-- Table:Attribute
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Attribute','����'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '����Id','Attribute','AttributeID'
EXEC [dbo].[sp_addextendedproperty_v2] '������','Attribute','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Attribute','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '����ԴId(���)','Attribute','DataSourceID'
EXEC [dbo].[sp_addextendedproperty_v2] 'Ĭ��ֵ','Attribute','DefaultValue'
EXEC [dbo].[sp_addextendedproperty_v2] '����','Attribute','Description'
EXEC [dbo].[sp_addextendedproperty_v2] 'Ԫ��Id(���)','Attribute','ElementID'
EXEC [dbo].[sp_addextendedproperty_v2] '����','Attribute','Name'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','Attribute','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','Attribute','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','Attribute','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id(���)','Attribute','TypeID'
EXEC [dbo].[sp_addextendedproperty_v2] '��λId(���)','Attribute','UomID'
EXEC [dbo].[sp_addextendedproperty_v2] '������','Attribute','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','Attribute','Update_Time'
EXEC [dbo].[sp_addextendedproperty_v2] 'ֵ','Attribute','Value'
-- End Table:Attribute
-- Table:AttributeTemplate
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'AttributeTemplate','����ģ��'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '����ģ��Id','AttributeTemplate','AttributeTemplateID'
EXEC [dbo].[sp_addextendedproperty_v2] '������','AttributeTemplate','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','AttributeTemplate','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '����ԴId(���)','AttributeTemplate','DataSourceID'
EXEC [dbo].[sp_addextendedproperty_v2] 'Ĭ��ֵ','AttributeTemplate','DefaultValue'
EXEC [dbo].[sp_addextendedproperty_v2] '����','AttributeTemplate','Description'
EXEC [dbo].[sp_addextendedproperty_v2] 'Ԫ��ģ��Id(���)','AttributeTemplate','ElementTemplateID'
EXEC [dbo].[sp_addextendedproperty_v2] '����','AttributeTemplate','Name'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','AttributeTemplate','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','AttributeTemplate','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','AttributeTemplate','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id(���)','AttributeTemplate','TypeID'
EXEC [dbo].[sp_addextendedproperty_v2] '��λId(���)','AttributeTemplate','UomID'
EXEC [dbo].[sp_addextendedproperty_v2] '������','AttributeTemplate','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','AttributeTemplate','Update_Time'
EXEC [dbo].[sp_addextendedproperty_v2] 'ֵ','AttributeTemplate','Value'
-- End Table:AttributeTemplate
-- Table:New
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'New','����'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','New','CreateTime'
EXEC [dbo].[sp_addextendedproperty_v2] '����','New','NewAuthor'
EXEC [dbo].[sp_addextendedproperty_v2] '����','New','NewContent'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id','New','NewId'
EXEC [dbo].[sp_addextendedproperty_v2] '����','New','NewTitle'
-- End Table:New
-- Table:Times
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Times','ʱ��'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '������','Times','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Times','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id(���)','Times','DepartmentId'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','Times','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','Times','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','Times','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '���㹫ʽ','Times','TimeCalcFormula'
EXEC [dbo].[sp_addextendedproperty_v2] 'ʱ�������','Times','TimeCategoryName'
EXEC [dbo].[sp_addextendedproperty_v2] 'ʱ�����','Times','TimeCode'
EXEC [dbo].[sp_addextendedproperty_v2] 'ʱ������Դ(1-����,2-�ֹ�)','Times','TimeDataSource'
EXEC [dbo].[sp_addextendedproperty_v2] 'ʱ��Ĭ��ֵ','Times','TimeDefaultValue'
EXEC [dbo].[sp_addextendedproperty_v2] 'ʱ��Id(����)','Times','TimeId'
EXEC [dbo].[sp_addextendedproperty_v2] 'ʱ������(1-ʣ��ʱ��,2-��ʧʱ��)','Times','TimeType'
EXEC [dbo].[sp_addextendedproperty_v2] 'ʱ�䵥λ(���)','Times','TimeUnit'
EXEC [dbo].[sp_addextendedproperty_v2] '������','Times','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','Times','Update_Time'
-- End Table:Times
-- Table:Analysis
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Analysis','����'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '����Id','Analysis','AnalysisID'
EXEC [dbo].[sp_addextendedproperty_v2] '������','Analysis','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Analysis','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '����','Analysis','Description'
EXEC [dbo].[sp_addextendedproperty_v2] '����','Analysis','Name'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','Analysis','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','Analysis','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','Analysis','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id(���)','Analysis','TypeId'
EXEC [dbo].[sp_addextendedproperty_v2] '������','Analysis','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','Analysis','Update_Time'
-- End Table:Analysis
-- Table:AnalysisTemplate
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'AnalysisTemplate','����ģ��'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '����ģ��Id','AnalysisTemplate','AnalysisTemplateID'
EXEC [dbo].[sp_addextendedproperty_v2] '������','AnalysisTemplate','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','AnalysisTemplate','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '����','AnalysisTemplate','Description'
EXEC [dbo].[sp_addextendedproperty_v2] '����','AnalysisTemplate','Name'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','AnalysisTemplate','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','AnalysisTemplate','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','AnalysisTemplate','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id(���)','AnalysisTemplate','TypeId'
EXEC [dbo].[sp_addextendedproperty_v2] '������','AnalysisTemplate','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','AnalysisTemplate','Update_Time'
-- End Table:AnalysisTemplate
-- Table:Expression
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Expression','���ʽ'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '����Id(���)','Expression','AnalysisID'
EXEC [dbo].[sp_addextendedproperty_v2] '������','Expression','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Expression','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '����','Expression','Description'
EXEC [dbo].[sp_addextendedproperty_v2] 'ģ��ֵ','Expression','EstimatedValue'
EXEC [dbo].[sp_addextendedproperty_v2] '���ʽ','Expression','Expression'
EXEC [dbo].[sp_addextendedproperty_v2] '���ʽId(����)','Expression','ExpressionID'
EXEC [dbo].[sp_addextendedproperty_v2] '����','Expression','Name'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','Expression','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','Expression','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','Expression','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '������','Expression','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','Expression','Update_Time'
-- End Table:Expression
-- Table:Version
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Version','�汾'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '������','Version','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Version','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '��Ч����','Version','EffiectiveDt'
EXEC [dbo].[sp_addextendedproperty_v2] '��ע','Version','Memo'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','Version','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','Version','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','Version','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '������','Version','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','Version','Update_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '�汾Id(����)','Version','VersionID'
EXEC [dbo].[sp_addextendedproperty_v2] '�汾��','Version','VersionNo'
-- End Table:Version
-- Table:Calendar
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Calendar','����'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '����Id','Calendar','CalendarId'
EXEC [dbo].[sp_addextendedproperty_v2] '������','Calendar','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Calendar','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '�Ƿ�����(1-�ǣ�0-��)','Calendar','IsWorkDay'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Calendar','PK_Date'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','Calendar','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','Calendar','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','Calendar','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '������','Calendar','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','Calendar','Update_Time'
-- End Table:Calendar
-- Table:UomConvert
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'UomConvert','��λת��'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] 'ת��ֵ','UomConvert','ConvertValue'
EXEC [dbo].[sp_addextendedproperty_v2] '������','UomConvert','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','UomConvert','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','UomConvert','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','UomConvert','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','UomConvert','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] 'Դ��λId(���)','UomConvert','SrcUomId'
EXEC [dbo].[sp_addextendedproperty_v2] 'Ŀ�굥λId(���)','UomConvert','TgtUomId'
EXEC [dbo].[sp_addextendedproperty_v2] '��λת��Id(����)','UomConvert','UomConvertId'
EXEC [dbo].[sp_addextendedproperty_v2] '������','UomConvert','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','UomConvert','Update_Time'
-- End Table:UomConvert
-- Table:Uom
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Uom','��λ'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '������','Uom','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Uom','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','Uom','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','Uom','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','Uom','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id(���)','Uom','TypeId'
EXEC [dbo].[sp_addextendedproperty_v2] '��λת��Id(���)','Uom','UomConvertId'
EXEC [dbo].[sp_addextendedproperty_v2] '��λId(����)','Uom','UomId'
EXEC [dbo].[sp_addextendedproperty_v2] '��λ��','Uom','UomName'
EXEC [dbo].[sp_addextendedproperty_v2] '������','Uom','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','Uom','Update_Time'
-- End Table:Uom
-- Table:Type
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Type','����'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '������','Type','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Type','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','Type','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','Type','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','Type','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id(����)','Type','TypeId'
EXEC [dbo].[sp_addextendedproperty_v2] '������','Type','TypeName'
EXEC [dbo].[sp_addextendedproperty_v2] '������','Type','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','Type','Update_Time'
-- End Table:Type
-- Table:DataSource
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'DataSource','����Դ'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '������','DataSource','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','DataSource','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '����ԴId','DataSource','DataSourceId'
EXEC [dbo].[sp_addextendedproperty_v2] '����Դ��','DataSource','DataSourceName'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','DataSource','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','DataSource','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','DataSource','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '������','DataSource','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','DataSource','Update_Time'
-- End Table:DataSource
-- Table:StopReasonCode
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'StopReasonCode','ͣ������'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '������','StopReasonCode','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','StopReasonCode','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id(���)','StopReasonCode','DepartmentId'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','StopReasonCode','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','StopReasonCode','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','StopReasonCode','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] 'ͣ������Id(����)','StopReasonCode','StopReasonCodeId'
EXEC [dbo].[sp_addextendedproperty_v2] 'һ��ͣ������','StopReasonCode','StopReasonCodeLevelOne'
EXEC [dbo].[sp_addextendedproperty_v2] 'һ��ͣ����������','StopReasonCode','StopReasonCodeLevelOneDesc'
EXEC [dbo].[sp_addextendedproperty_v2] '����ͣ������','StopReasonCode','StopReasonCodeLevelThree'
EXEC [dbo].[sp_addextendedproperty_v2] '����ͣ����������','StopReasonCode','StopReasonCodeLevelThreeDesc'
EXEC [dbo].[sp_addextendedproperty_v2] '����ͣ������','StopReasonCode','StopReasonCodeLevelTwo'
EXEC [dbo].[sp_addextendedproperty_v2] '����ͣ����������','StopReasonCode','StopReasonCodeLevelTwoDesc'
EXEC [dbo].[sp_addextendedproperty_v2] 'ͣ������Id','StopReasonCode','SubReasonCodeId'
EXEC [dbo].[sp_addextendedproperty_v2] '������','StopReasonCode','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','StopReasonCode','Update_Time'
-- End Table:StopReasonCode
-- Table:SubReasonCode
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'SubReasonCode','ͣ������'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '������','SubReasonCode','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','SubReasonCode','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id(���)','SubReasonCode','DepartmentId'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','SubReasonCode','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','SubReasonCode','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','SubReasonCode','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] 'ͣ������','SubReasonCode','SubReasonCategory'
EXEC [dbo].[sp_addextendedproperty_v2] 'ͣ������Id(����)','SubReasonCode','SubReasonCodeId'
EXEC [dbo].[sp_addextendedproperty_v2] 'ͣ����������','SubReasonCode','SubReasonDesc'
EXEC [dbo].[sp_addextendedproperty_v2] 'ʱ��Id(���)','SubReasonCode','TimeId'
EXEC [dbo].[sp_addextendedproperty_v2] '������','SubReasonCode','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','SubReasonCode','Update_Time'
-- End Table:SubReasonCode
-- Table:NoWorkTimes
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'NoWorkTimes','�ǹ���ʱ��'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '������','NoWorkTimes','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','NoWorkTimes','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '����Id(���)','NoWorkTimes','DepartmentId'
EXEC [dbo].[sp_addextendedproperty_v2] '�ǹ���ʱ��ԭ��','NoWorkTimes','NoWorkTimeReason'
EXEC [dbo].[sp_addextendedproperty_v2] '�ǹ���ʱ��Id(����)','NoWorkTimes','NoWorkTimesId'
EXEC [dbo].[sp_addextendedproperty_v2] '�ǹ���ʱ�䵥λ(���)','NoWorkTimes','NoWorkTimeUnit'
EXEC [dbo].[sp_addextendedproperty_v2] '�ǹ���ʱ��ֵ','NoWorkTimes','NoWorkTimeValue'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼ΨһId','NoWorkTimes','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼���༭��','NoWorkTimes','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '��¼״̬(1-����,0-����,-1-ɾ��)','NoWorkTimes','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '������','NoWorkTimes','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','NoWorkTimes','Update_Time'
-- End Table:NoWorkTimes
-- Table:Menu
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Menu','�˵�'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '����ʱ��','Menu','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '�Ƿ�ɼ�','Menu','IsVisible'
EXEC [dbo].[sp_addextendedproperty_v2] '�˵�ͼ��','Menu','Menu_Icon'
EXEC [dbo].[sp_addextendedproperty_v2] '�˵�Id(����)','Menu','Menu_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '�˵�����','Menu','Menu_Name'
EXEC [dbo].[sp_addextendedproperty_v2] '�˵�˳��','Menu','Menu_Order'
EXEC [dbo].[sp_addextendedproperty_v2] '���˵�Id','Menu','Menu_ParentID'
EXEC [dbo].[sp_addextendedproperty_v2] '�˵�·��','Menu','Menu_Url'
EXEC [dbo].[sp_addextendedproperty_v2] '��������','Menu','Update_Time'
-- End Table:Menu
-- Table:Role_Menu
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Role_Menu','��ɫ�˵�'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '�˵�Id','Role_Menu','Menu_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '��ɫId','Role_Menu','Role_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '��ɫ�˵�Id','Role_Menu','RoleMenu_ID'
-- End Table:Role_Menu
