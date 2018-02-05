-- Table:Lines
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Lines','产线'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','Lines','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','Lines','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '部门Id(外键)','Lines','DepartmentId'
EXEC [dbo].[sp_addextendedproperty_v2] '产线缩写','Lines','LineAbbreviation'
EXEC [dbo].[sp_addextendedproperty_v2] '产线Id(主键)','Lines','LineId'
EXEC [dbo].[sp_addextendedproperty_v2] '产线名字','Lines','LineName'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','Lines','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','Lines','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','Lines','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','Lines','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','Lines','Update_Time'
-- End Table:Lines
-- Table:Devices
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Devices','设备'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','Devices','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','Devices','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '部门Id(外键)','Devices','DepartmentId'
EXEC [dbo].[sp_addextendedproperty_v2] '设备Id(主键)','Devices','DeviceId'
EXEC [dbo].[sp_addextendedproperty_v2] '设备名称','Devices','DeviceName'
EXEC [dbo].[sp_addextendedproperty_v2] '设备编号','Devices','DeviceNumber'
EXEC [dbo].[sp_addextendedproperty_v2] '产线Id(外键)','Devices','LineId'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','Devices','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','Devices','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','Devices','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '岗位Id(外键)','Devices','StationId'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','Devices','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','Devices','Update_Time'
-- End Table:Devices
-- Table:User_Role
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'User_Role','用户角色'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '用户角色','User_Role','ID'
EXEC [dbo].[sp_addextendedproperty_v2] '用户Id','User_Role','Role_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '角色Id','User_Role','User_ID'
-- End Table:User_Role
-- Table:User
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'User','用户'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','User','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '部门Id','User','Department_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '用户头像','User','HeadPortrait'
EXEC [dbo].[sp_addextendedproperty_v2] '是否有效(1-有效, 0-无效)','User','IsEnable'
EXEC [dbo].[sp_addextendedproperty_v2] '备注','User','Remark'
EXEC [dbo].[sp_addextendedproperty_v2] '更新时间','User','Update_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '用户Id','User','User_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '用户名字','User','User_Name'
EXEC [dbo].[sp_addextendedproperty_v2] '用户密码','User','User_Password'
EXEC [dbo].[sp_addextendedproperty_v2] '用户显示名字','User','User_Reallyname'
-- End Table:User
-- Table:test
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'test','测试'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '年龄','test','age'
EXEC [dbo].[sp_addextendedproperty_v2] '主键ID','test','ID'
EXEC [dbo].[sp_addextendedproperty_v2] '姓名','test','Name'
EXEC [dbo].[sp_addextendedproperty_v2] '外键ID','test','ForeighId'
-- End Table:test
-- Table:test2
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'test2','测试2'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '主键ID','test2','foreignkey'
-- End Table:test
-- Table:SystemInfo
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'SystemInfo','系统信息'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '是否有效代码','SystemInfo','IsValidCode'
EXEC [dbo].[sp_addextendedproperty_v2] '系统版权','SystemInfo','System_Copyright'
EXEC [dbo].[sp_addextendedproperty_v2] '系统Id','SystemInfo','System_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '系统名字','SystemInfo','System_Title'
EXEC [dbo].[sp_addextendedproperty_v2] '系统版本','SystemInfo','System_Version'
-- End Table:SystemInfo
-- Table:Role_Button
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Role_Button','角色按钮'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '按钮ID','Role_Button','Button_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '角色按钮','Role_Button','ID'
EXEC [dbo].[sp_addextendedproperty_v2] '菜单ID','Role_Button','Menu_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '角色ID','Role_Button','Role_ID'
-- End Table:Role_Button
-- Table:Role
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Role','角色'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','Role','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '角色描述','Role','Role_Description'
EXEC [dbo].[sp_addextendedproperty_v2] '角色ID','Role','Role_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '角色名字','Role','Role_Name'
EXEC [dbo].[sp_addextendedproperty_v2] '更新时间','Role','Update_Time'
-- End Table:Role
-- Table:Menu_Button
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Menu_Button','菜单按钮'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '按钮ID','Menu_Button','Button_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '菜单按钮','Menu_Button','ID'
EXEC [dbo].[sp_addextendedproperty_v2] '菜单ID','Menu_Button','Menu_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '菜单排序','Menu_Button','OrderBy'
-- End Table:Menu_Button
-- Table:LoginLog
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'LoginLog','登录日志'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '登录人ID','LoginLog','Login_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '登录IP','LoginLog','Login_IP'
EXEC [dbo].[sp_addextendedproperty_v2] '登录名','LoginLog','Login_Name'
EXEC [dbo].[sp_addextendedproperty_v2] '登录昵称','LoginLog','Login_Nicker'
EXEC [dbo].[sp_addextendedproperty_v2] '登录时间','LoginLog','Login_Time'
-- End Table:LoginLog
-- Table:DictionaryCategory
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'DictionaryCategory','字典类别'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '类别','DictionaryCategory','Category'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','DictionaryCategory','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '是否有效(1-有效,0-无效)','DictionaryCategory','Enabled'
EXEC [dbo].[sp_addextendedproperty_v2] 'ID','DictionaryCategory','ID'
EXEC [dbo].[sp_addextendedproperty_v2] '更新时间','DictionaryCategory','Update_Time'
-- End Table:DictionaryCategory
-- Table:A_EF
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'A_EF','事件'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '中文名','A_EF','ChineseName'
EXEC [dbo].[sp_addextendedproperty_v2] '员工编号','A_EF','EmployeeNumber'
EXEC [dbo].[sp_addextendedproperty_v2] '处理状态(1-新建,2-处理完成)','A_EF','HandleStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '主机地址','A_EF','HostAddress'
EXEC [dbo].[sp_addextendedproperty_v2] 'ID','A_EF','ID'
EXEC [dbo].[sp_addextendedproperty_v2] '最后编辑人','A_EF','LastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '最后编辑时间','A_EF','LastEditDt'
EXEC [dbo].[sp_addextendedproperty_v2] '名字','A_EF','Name'
EXEC [dbo].[sp_addextendedproperty_v2] '参数','A_EF','Params'
EXEC [dbo].[sp_addextendedproperty_v2] '父ID','A_EF','ParentId'
EXEC [dbo].[sp_addextendedproperty_v2] '系统编码','A_EF','SystemCode'
EXEC [dbo].[sp_addextendedproperty_v2] '部门编码','A_EF','UnitCode'
-- End Table:A_EF
-- Table:Dictionary
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Dictionary','字典'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','Dictionary','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '类别ID','Dictionary','DicCategoryID'
EXEC [dbo].[sp_addextendedproperty_v2] '字典值','Dictionary','DicValue'
EXEC [dbo].[sp_addextendedproperty_v2] '是否有效(1-有效,0-无效)','Dictionary','Enabled'
EXEC [dbo].[sp_addextendedproperty_v2] 'ID','Dictionary','ID'
EXEC [dbo].[sp_addextendedproperty_v2] '更新时间','Dictionary','Update_Time'
-- End Table:Dictionary
-- Table:Button
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Button','按钮'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '描述','Button','Button_Describe'
EXEC [dbo].[sp_addextendedproperty_v2] '按钮ID','Button','Button_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '按钮图标','Button','Button_Magic'
EXEC [dbo].[sp_addextendedproperty_v2] '按钮名字','Button','Button_Name'
EXEC [dbo].[sp_addextendedproperty_v2] '按钮操作','Button','Button_Operation'
EXEC [dbo].[sp_addextendedproperty_v2] '按钮操作ID','Button','Button_OpID'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','Button','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '更新时间','Button','Update_Time'
-- End Table:Button
-- Table:Stations
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Stations','岗位'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','Stations','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','Stations','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '部门Id(外键)','Stations','DepartmentId'
EXEC [dbo].[sp_addextendedproperty_v2] '产线Id(外键)','Stations','LineId'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','Stations','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','Stations','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','Stations','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '岗位Id(主键)','Stations','StationId'
EXEC [dbo].[sp_addextendedproperty_v2] '岗位名字','Stations','StationName'
EXEC [dbo].[sp_addextendedproperty_v2] '岗位编号','Stations','StationNumber'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','Stations','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','Stations','Update_Time'
-- End Table:Stations
-- Table:Account
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Account','帐户'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '帐户ID','Account','AccountID'
EXEC [dbo].[sp_addextendedproperty_v2] '测试Id','Account','TestID'
EXEC [dbo].[sp_addextendedproperty_v2] '总数','Account','Total'
-- End Table:Account
-- Table:InternalStandard
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'InternalStandard','内控标准'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','InternalStandard','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','InternalStandard','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '部门Id(外键)','InternalStandard','DepartmentId'
EXEC [dbo].[sp_addextendedproperty_v2] '内控标准Id(主键)','InternalStandard','InternalStandardId'
EXEC [dbo].[sp_addextendedproperty_v2] '产线Id(外键)','InternalStandard','LineId'
EXEC [dbo].[sp_addextendedproperty_v2] '产品名字','InternalStandard','ProduceName'
EXEC [dbo].[sp_addextendedproperty_v2] '产品编号','InternalStandard','ProductNo'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','InternalStandard','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','InternalStandard','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','InternalStandard','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '标准生产速度','InternalStandard','StandardProduceSpeed'
EXEC [dbo].[sp_addextendedproperty_v2] '标准生产速度单位','InternalStandard','StandardProduceSpeedUnit'
EXEC [dbo].[sp_addextendedproperty_v2] '岗位Id','InternalStandard','StationId'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','InternalStandard','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','InternalStandard','Update_Time'
-- End Table:InternalStandard
-- Table:WoBatchStatus
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'WoBatchStatus','工单批次'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '批次Id(主键)','WoBatchStatus','BatchId'
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','WoBatchStatus','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','WoBatchStatus','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '订单日期','WoBatchStatus','OrderDate'
EXEC [dbo].[sp_addextendedproperty_v2] '订单号','WoBatchStatus','OrderNumber'
EXEC [dbo].[sp_addextendedproperty_v2] '产品描述','WoBatchStatus','ProductDesc'
EXEC [dbo].[sp_addextendedproperty_v2] '产品编号','WoBatchStatus','ProductNo'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','WoBatchStatus','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','WoBatchStatus','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','WoBatchStatus','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '班次','WoBatchStatus','ShiftCode'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','WoBatchStatus','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','WoBatchStatus','Update_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '工作中心','WoBatchStatus','WorkCenterNo'
-- End Table:WoBatchStatus
-- Table:USERINFOMATION
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'USERINFOMATION','用户信息'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','USERINFOMATION','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '部门Id','USERINFOMATION','Department_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '头像','USERINFOMATION','HeadPortrait'
EXEC [dbo].[sp_addextendedproperty_v2] '是否有效(1-有效, 0-无效)','USERINFOMATION','IsEnable'
EXEC [dbo].[sp_addextendedproperty_v2] '备注','USERINFOMATION','Remark'
EXEC [dbo].[sp_addextendedproperty_v2] '更新时间','USERINFOMATION','Update_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '用户Id','USERINFOMATION','User_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '用户名','USERINFOMATION','User_Name'
EXEC [dbo].[sp_addextendedproperty_v2] '用户密码','USERINFOMATION','User_Password'
EXEC [dbo].[sp_addextendedproperty_v2] '用户显示名字','USERINFOMATION','User_Reallyname'
-- End Table:USERINFOMATION
-- Table:ProductTimeRecordHeader
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'ProductTimeRecordHeader','生产时间记录表头'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '生产批次Id(外键)','ProductTimeRecordHeader','BatchId'
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','ProductTimeRecordHeader','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','ProductTimeRecordHeader','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '设备Id(外键)','ProductTimeRecordHeader','DeviceId'
EXEC [dbo].[sp_addextendedproperty_v2] '表头Id(主键)','ProductTimeRecordHeader','HeaderId'
EXEC [dbo].[sp_addextendedproperty_v2] '是否机台数据(1-是，2-否)','ProductTimeRecordHeader','IsMachineData'
EXEC [dbo].[sp_addextendedproperty_v2] '订单类型(1-生产，2-非生产)','ProductTimeRecordHeader','OrderType'
EXEC [dbo].[sp_addextendedproperty_v2] '生产状态(1-生产，2-停止)','ProductTimeRecordHeader','ProduceStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','ProductTimeRecordHeader','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','ProductTimeRecordHeader','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','ProductTimeRecordHeader','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','ProductTimeRecordHeader','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','ProductTimeRecordHeader','Update_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '虚拟工作中心','ProductTimeRecordHeader','VirtualWorkCenterNo'
EXEC [dbo].[sp_addextendedproperty_v2] '工作中心','ProductTimeRecordHeader','WorkCenterNo'
-- End Table:ProductTimeRecordHeader
-- Table:ProductTimeRecordDetail
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'ProductTimeRecordDetail','生产时间记录明细'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','ProductTimeRecordDetail','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','ProductTimeRecordDetail','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '员工人数','ProductTimeRecordDetail','Crew'
EXEC [dbo].[sp_addextendedproperty_v2] '明细Id(主键)','ProductTimeRecordDetail','DetailID'
EXEC [dbo].[sp_addextendedproperty_v2] '持续时间(单位秒)','ProductTimeRecordDetail','Duration'
EXEC [dbo].[sp_addextendedproperty_v2] '开始时间','ProductTimeRecordDetail','EndTime'
EXEC [dbo].[sp_addextendedproperty_v2] '表头Id(外键)','ProductTimeRecordDetail','HeaderID'
EXEC [dbo].[sp_addextendedproperty_v2] '人工工时(单位秒)','ProductTimeRecordDetail','Labor'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','ProductTimeRecordDetail','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','ProductTimeRecordDetail','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','ProductTimeRecordDetail','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '备注','ProductTimeRecordDetail','Remark'
EXEC [dbo].[sp_addextendedproperty_v2] '维修人员(0-无, 1-工程部, 2-车间)','ProductTimeRecordDetail','RepairMan'
EXEC [dbo].[sp_addextendedproperty_v2] '开始时间','ProductTimeRecordDetail','StartTime'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态','ProductTimeRecordDetail','Status'
EXEC [dbo].[sp_addextendedproperty_v2] '停机原因代码','ProductTimeRecordDetail','StopReasonCode'
EXEC [dbo].[sp_addextendedproperty_v2] '停机原因描述','ProductTimeRecordDetail','StopReasonDesc'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','ProductTimeRecordDetail','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','ProductTimeRecordDetail','Update_Time'
-- End Table:ProductTimeRecordDetail
-- Table:Departments
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Departments','部门'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','Departments','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','Departments','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '部门编码','Departments','DepartmentCode'
EXEC [dbo].[sp_addextendedproperty_v2] '部门Id(主键)','Departments','DepartmentId'
EXEC [dbo].[sp_addextendedproperty_v2] '部门名称','Departments','DepartmentName'
EXEC [dbo].[sp_addextendedproperty_v2] '父部门编码','Departments','DepartmentParentCode'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','Departments','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','Departments','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','Lines','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','Departments','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','Departments','Update_Time'
-- End Table:Departments
-- Table:Model
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Model','模型'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','Model','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','Model','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '模型Id(主键)','Model','ModelID'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','Model','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','Model','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','Model','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','Model','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','Model','Update_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '版本Id(外键)','Model','VersionID'
-- End Table:Model
-- Table:Element
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Element','元素'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','Element','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','Element','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '描述','Element','Description'
EXEC [dbo].[sp_addextendedproperty_v2] '元素Id(主键)','Element','ElementID'
EXEC [dbo].[sp_addextendedproperty_v2] '模型Id(外键)','Element','ModelID'
EXEC [dbo].[sp_addextendedproperty_v2] '名字','Element','Name'
EXEC [dbo].[sp_addextendedproperty_v2] '父元素Id','Element','ParentElementID'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','Element','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','Element','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','Element','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','Element','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','Element','Update_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '版本Id(外键)','Element','VersionID'
-- End Table:Element
-- Table:ElementTemplate
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'ElementTemplate','元素模板'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','ElementTemplate','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','ElementTemplate','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '描述','ElementTemplate','Description'
EXEC [dbo].[sp_addextendedproperty_v2] '元素模板Id(主键)','ElementTemplate','ElementTemplateID'
EXEC [dbo].[sp_addextendedproperty_v2] '名字','ElementTemplate','Name'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','ElementTemplate','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','ElementTemplate','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','ElementTemplate','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','ElementTemplate','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','ElementTemplate','Update_Time'
-- End Table:ElementTemplate
-- Table:Attribute
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Attribute','属性'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '属性Id','Attribute','AttributeID'
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','Attribute','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','Attribute','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '数据源Id(外键)','Attribute','DataSourceID'
EXEC [dbo].[sp_addextendedproperty_v2] '默认值','Attribute','DefaultValue'
EXEC [dbo].[sp_addextendedproperty_v2] '描述','Attribute','Description'
EXEC [dbo].[sp_addextendedproperty_v2] '元素Id(外键)','Attribute','ElementID'
EXEC [dbo].[sp_addextendedproperty_v2] '名字','Attribute','Name'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','Attribute','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','Attribute','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','Attribute','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '类型Id(外键)','Attribute','TypeID'
EXEC [dbo].[sp_addextendedproperty_v2] '单位Id(外键)','Attribute','UomID'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','Attribute','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','Attribute','Update_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '值','Attribute','Value'
-- End Table:Attribute
-- Table:AttributeTemplate
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'AttributeTemplate','属性模板'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '属性模板Id','AttributeTemplate','AttributeTemplateID'
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','AttributeTemplate','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','AttributeTemplate','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '数据源Id(外键)','AttributeTemplate','DataSourceID'
EXEC [dbo].[sp_addextendedproperty_v2] '默认值','AttributeTemplate','DefaultValue'
EXEC [dbo].[sp_addextendedproperty_v2] '描述','AttributeTemplate','Description'
EXEC [dbo].[sp_addextendedproperty_v2] '元素模板Id(外键)','AttributeTemplate','ElementTemplateID'
EXEC [dbo].[sp_addextendedproperty_v2] '名字','AttributeTemplate','Name'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','AttributeTemplate','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','AttributeTemplate','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','AttributeTemplate','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '类型Id(外键)','AttributeTemplate','TypeID'
EXEC [dbo].[sp_addextendedproperty_v2] '单位Id(外键)','AttributeTemplate','UomID'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','AttributeTemplate','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','AttributeTemplate','Update_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '值','AttributeTemplate','Value'
-- End Table:AttributeTemplate
-- Table:New
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'New','新闻'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','New','CreateTime'
EXEC [dbo].[sp_addextendedproperty_v2] '作者','New','NewAuthor'
EXEC [dbo].[sp_addextendedproperty_v2] '内容','New','NewContent'
EXEC [dbo].[sp_addextendedproperty_v2] '新闻Id','New','NewId'
EXEC [dbo].[sp_addextendedproperty_v2] '标题','New','NewTitle'
-- End Table:New
-- Table:Times
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Times','时间'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','Times','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','Times','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '部门Id(外键)','Times','DepartmentId'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','Times','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','Times','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','Times','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '计算公式','Times','TimeCalcFormula'
EXEC [dbo].[sp_addextendedproperty_v2] '时间类别名','Times','TimeCategoryName'
EXEC [dbo].[sp_addextendedproperty_v2] '时间编码','Times','TimeCode'
EXEC [dbo].[sp_addextendedproperty_v2] '时间数据源(1-计算,2-手工)','Times','TimeDataSource'
EXEC [dbo].[sp_addextendedproperty_v2] '时间默认值','Times','TimeDefaultValue'
EXEC [dbo].[sp_addextendedproperty_v2] '时间Id(主键)','Times','TimeId'
EXEC [dbo].[sp_addextendedproperty_v2] '时间类型(1-剩余时间,2-损失时间)','Times','TimeType'
EXEC [dbo].[sp_addextendedproperty_v2] '时间单位(外键)','Times','TimeUnit'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','Times','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','Times','Update_Time'
-- End Table:Times
-- Table:Analysis
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Analysis','分析'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '分析Id','Analysis','AnalysisID'
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','Analysis','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','Analysis','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '描述','Analysis','Description'
EXEC [dbo].[sp_addextendedproperty_v2] '名字','Analysis','Name'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','Analysis','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','Analysis','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','Analysis','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '类型Id(外键)','Analysis','TypeId'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','Analysis','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','Analysis','Update_Time'
-- End Table:Analysis
-- Table:AnalysisTemplate
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'AnalysisTemplate','分析模板'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '分析模板Id','AnalysisTemplate','AnalysisTemplateID'
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','AnalysisTemplate','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','AnalysisTemplate','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '描述','AnalysisTemplate','Description'
EXEC [dbo].[sp_addextendedproperty_v2] '名字','AnalysisTemplate','Name'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','AnalysisTemplate','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','AnalysisTemplate','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','AnalysisTemplate','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '类型Id(外键)','AnalysisTemplate','TypeId'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','AnalysisTemplate','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','AnalysisTemplate','Update_Time'
-- End Table:AnalysisTemplate
-- Table:Expression
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Expression','表达式'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '分析Id(外键)','Expression','AnalysisID'
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','Expression','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','Expression','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '描述','Expression','Description'
EXEC [dbo].[sp_addextendedproperty_v2] '模拟值','Expression','EstimatedValue'
EXEC [dbo].[sp_addextendedproperty_v2] '表达式','Expression','Expression'
EXEC [dbo].[sp_addextendedproperty_v2] '表达式Id(主键)','Expression','ExpressionID'
EXEC [dbo].[sp_addextendedproperty_v2] '名字','Expression','Name'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','Expression','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','Expression','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','Expression','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','Expression','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','Expression','Update_Time'
-- End Table:Expression
-- Table:Version
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Version','版本'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','Version','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','Version','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '有效日期','Version','EffiectiveDt'
EXEC [dbo].[sp_addextendedproperty_v2] '备注','Version','Memo'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','Version','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','Version','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','Version','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','Version','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','Version','Update_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '版本Id(主键)','Version','VersionID'
EXEC [dbo].[sp_addextendedproperty_v2] '版本号','Version','VersionNo'
-- End Table:Version
-- Table:Calendar
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Calendar','日历'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '日历Id','Calendar','CalendarId'
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','Calendar','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','Calendar','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '是否工作日(1-是，0-否)','Calendar','IsWorkDay'
EXEC [dbo].[sp_addextendedproperty_v2] '日历时间','Calendar','PK_Date'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','Calendar','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','Calendar','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','Calendar','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','Calendar','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','Calendar','Update_Time'
-- End Table:Calendar
-- Table:UomConvert
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'UomConvert','单位转化'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '转化值','UomConvert','ConvertValue'
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','UomConvert','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','UomConvert','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','UomConvert','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','UomConvert','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','UomConvert','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '源单位Id(外键)','UomConvert','SrcUomId'
EXEC [dbo].[sp_addextendedproperty_v2] '目标单位Id(外键)','UomConvert','TgtUomId'
EXEC [dbo].[sp_addextendedproperty_v2] '单位转化Id(主键)','UomConvert','UomConvertId'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','UomConvert','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','UomConvert','Update_Time'
-- End Table:UomConvert
-- Table:Uom
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Uom','单位'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','Uom','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','Uom','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','Uom','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','Uom','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','Uom','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '类型Id(外键)','Uom','TypeId'
EXEC [dbo].[sp_addextendedproperty_v2] '单位转化Id(外键)','Uom','UomConvertId'
EXEC [dbo].[sp_addextendedproperty_v2] '单位Id(主键)','Uom','UomId'
EXEC [dbo].[sp_addextendedproperty_v2] '单位名','Uom','UomName'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','Uom','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','Uom','Update_Time'
-- End Table:Uom
-- Table:Type
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Type','类型'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','Type','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','Type','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','Type','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','Type','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','Type','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '类型Id(主键)','Type','TypeId'
EXEC [dbo].[sp_addextendedproperty_v2] '类型名','Type','TypeName'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','Type','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','Type','Update_Time'
-- End Table:Type
-- Table:DataSource
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'DataSource','数据源'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','DataSource','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','DataSource','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '数据源Id','DataSource','DataSourceId'
EXEC [dbo].[sp_addextendedproperty_v2] '数据源名','DataSource','DataSourceName'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','DataSource','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','DataSource','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','DataSource','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','DataSource','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','DataSource','Update_Time'
-- End Table:DataSource
-- Table:StopReasonCode
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'StopReasonCode','停机代码'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','StopReasonCode','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','StopReasonCode','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '部门Id(外键)','StopReasonCode','DepartmentId'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','StopReasonCode','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','StopReasonCode','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','StopReasonCode','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '停机代码Id(主键)','StopReasonCode','StopReasonCodeId'
EXEC [dbo].[sp_addextendedproperty_v2] '一级停机代码','StopReasonCode','StopReasonCodeLevelOne'
EXEC [dbo].[sp_addextendedproperty_v2] '一级停机代码描述','StopReasonCode','StopReasonCodeLevelOneDesc'
EXEC [dbo].[sp_addextendedproperty_v2] '三级停机代码','StopReasonCode','StopReasonCodeLevelThree'
EXEC [dbo].[sp_addextendedproperty_v2] '三级停机代码描述','StopReasonCode','StopReasonCodeLevelThreeDesc'
EXEC [dbo].[sp_addextendedproperty_v2] '二级停机代码','StopReasonCode','StopReasonCodeLevelTwo'
EXEC [dbo].[sp_addextendedproperty_v2] '二级停机代码描述','StopReasonCode','StopReasonCodeLevelTwoDesc'
EXEC [dbo].[sp_addextendedproperty_v2] '停机分类Id','StopReasonCode','SubReasonCodeId'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','StopReasonCode','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','StopReasonCode','Update_Time'
-- End Table:StopReasonCode
-- Table:SubReasonCode
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'SubReasonCode','停机分类'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','SubReasonCode','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','SubReasonCode','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '部门Id(外键)','SubReasonCode','DepartmentId'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','SubReasonCode','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','SubReasonCode','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','SubReasonCode','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '停机分类','SubReasonCode','SubReasonCategory'
EXEC [dbo].[sp_addextendedproperty_v2] '停机分类Id(主键)','SubReasonCode','SubReasonCodeId'
EXEC [dbo].[sp_addextendedproperty_v2] '停机分类描述','SubReasonCode','SubReasonDesc'
EXEC [dbo].[sp_addextendedproperty_v2] '时间Id(外键)','SubReasonCode','TimeId'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','SubReasonCode','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','SubReasonCode','Update_Time'
-- End Table:SubReasonCode
-- Table:NoWorkTimes
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'NoWorkTimes','非工作时间'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建人','NoWorkTimes','Create_By'
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','NoWorkTimes','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '部门Id(外键)','NoWorkTimes','DepartmentId'
EXEC [dbo].[sp_addextendedproperty_v2] '非工作时间原因','NoWorkTimes','NoWorkTimeReason'
EXEC [dbo].[sp_addextendedproperty_v2] '非工作时间Id(主键)','NoWorkTimes','NoWorkTimesId'
EXEC [dbo].[sp_addextendedproperty_v2] '非工作时间单位(外键)','NoWorkTimes','NoWorkTimeUnit'
EXEC [dbo].[sp_addextendedproperty_v2] '非工作时间值','NoWorkTimes','NoWorkTimeValue'
EXEC [dbo].[sp_addextendedproperty_v2] '记录唯一Id','NoWorkTimes','RecordGuid'
EXEC [dbo].[sp_addextendedproperty_v2] '记录最后编辑人','NoWorkTimes','RecordLastEditBy'
EXEC [dbo].[sp_addextendedproperty_v2] '记录状态(1-创建,0-更新,-1-删除)','NoWorkTimes','RecordStatus'
EXEC [dbo].[sp_addextendedproperty_v2] '更新人','NoWorkTimes','Update_By'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','NoWorkTimes','Update_Time'
-- End Table:NoWorkTimes
-- Table:Menu
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Menu','菜单'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '创建时间','Menu','Create_Time'
EXEC [dbo].[sp_addextendedproperty_v2] '是否可见','Menu','IsVisible'
EXEC [dbo].[sp_addextendedproperty_v2] '菜单图标','Menu','Menu_Icon'
EXEC [dbo].[sp_addextendedproperty_v2] '菜单Id(主键)','Menu','Menu_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '菜单名字','Menu','Menu_Name'
EXEC [dbo].[sp_addextendedproperty_v2] '菜单顺序','Menu','Menu_Order'
EXEC [dbo].[sp_addextendedproperty_v2] '父菜单Id','Menu','Menu_ParentID'
EXEC [dbo].[sp_addextendedproperty_v2] '菜单路径','Menu','Menu_Url'
EXEC [dbo].[sp_addextendedproperty_v2] '更新日期','Menu','Update_Time'
-- End Table:Menu
-- Table:Role_Menu
-- Add Table Desc
EXEC [dbo].[sp_addextendedproperty_v3] 'Role_Menu','角色菜单'
-- Add Column Desc
EXEC [dbo].[sp_addextendedproperty_v2] '菜单Id','Role_Menu','Menu_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '角色Id','Role_Menu','Role_ID'
EXEC [dbo].[sp_addextendedproperty_v2] '角色菜单Id','Role_Menu','RoleMenu_ID'
-- End Table:Role_Menu
