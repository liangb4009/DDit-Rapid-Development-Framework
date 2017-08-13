using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OSIsoft.AF;
using OSIsoft.AF.Asset;
using OSIsoft.AF.EventFrame;
using OSIsoft.AF.Analysis;
using System.Configuration;
using System.Data.SqlClient;

namespace DDit.OSISoft.SP2EF
{
    public static class Sp2Ef
    {
        public static void Entry()
        {

            string strConn = System.Configuration.ConfigurationManager.ConnectionStrings["ef"].ConnectionString;
            try
            {
                using (SqlConnection connection = new SqlConnection(strConn))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(new StringBuilder("select * from A_EF where ParentId is null and HandleStatus=").Append(DefaultData.HandleStatus.New.ToString()).ToString(), connection);
                    SqlDataReader result = command.ExecuteReader();
                    Object[] dataRow = new Object[result.FieldCount];
                    int rowcount = 0;
                    while (result.Read() == true)
                    {
                        result.GetValues(dataRow);
                        var name = "";
                        var parentid = "";
                        var traceid = "";
                        for (int i = 0; i < result.FieldCount; i++)
                        {

                            if (result.GetName(i).ToUpper() == "Name".ToUpper())
                            {
                                name = dataRow[i].ToString().Trim();
                            }
                            if (result.GetName(i).ToUpper() == "ParentId".ToUpper())
                            {
                                parentid = dataRow[i].ToString().Trim();
                            }
                            if (result.GetName(i).ToUpper() == "ID".ToUpper())
                            {
                                traceid = dataRow[i].ToString().Trim();
                            }
                        }
                        Guid parentidnull;
                        if (!Guid.TryParse(parentid, out parentidnull))
                        {
                            string rtn = GetEFs(strConn, traceid).ToUpper();
                            if (rtn == "")
                                LogHelper.WriteLog(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType, new StringBuilder("Main Success, GetEFs:[").Append(name).Append("]").Append("Success").ToString());
                            else
                                LogHelper.WriteLog(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType, new StringBuilder("Main False, GetEFs:[").Append(name).Append("]").Append("Fail").Append("Reason:[").Append(rtn).Append("]").ToString());
                        }
                        rowcount = rowcount + 1;
                    }
                    if (rowcount == 0)
                        LogHelper.WriteLog(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType, new StringBuilder("Main False, RowCount is Zero!").ToString());
                    result.Close();
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                LogHelper.WriteLog(ex.GetType(), new StringBuilder("Main False, Message:[").Append(ex.Message.ToString()).Append("]").ToString());
            }
        }
        public static string UpdateEFStatus(string connStr, string id, int handlestatus)
        {
            string rtn = "";
            try
            {
                using (SqlConnection connection = new SqlConnection(connStr))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(new StringBuilder("update A_EF set HandleStatus =").Append(handlestatus.ToString()).Append(" where id='").Append(id).Append("'").ToString(), connection);
                    command.CommandType = System.Data.CommandType.Text;
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                rtn = new StringBuilder("UpdateEFStatus False, Message:[").Append(ex.Message.ToString()).Append("]").ToString();
            }
            return rtn;
        }
        public static string LockEF(string connStr, string id)
        {
            string rtn = "";
            try
            {
                using (SqlConnection connection = new SqlConnection(connStr))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(new StringBuilder("select * from A_EF where ParentId = '").Append(id).Append("'").ToString(), connection);
                    SqlDataReader result = command.ExecuteReader();
                    Object[] dataRow = new Object[result.FieldCount];
                    while (result.Read() == true)
                    {
                        result.GetValues(dataRow);
                        var childid = "";
                        for (int i = 0; i < result.FieldCount; i++)
                        {
                            if (result.GetName(i).ToUpper() == "ID".ToUpper())
                            {
                                childid = dataRow[i].ToString().Trim();
                            }
                        }
                        rtn = UpdateEFStatus(connStr, childid, DefaultData.HandleStatus.InProcess);

                    }
                    rtn = UpdateEFStatus(connStr, id, DefaultData.HandleStatus.InProcess);
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                rtn = new StringBuilder("LockEF False, Message:[").Append(ex.Message.ToString()).Append("]").ToString();
            }
            return rtn;
        }
        public static string CompleteEF(string connStr, string id)
        {
            string rtn = "";
            try
            {
                using (SqlConnection connection = new SqlConnection(connStr))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(new StringBuilder("select * from A_EF where ParentId = '").Append(id).Append("'").ToString(), connection);
                    SqlDataReader result = command.ExecuteReader();
                    Object[] dataRow = new Object[result.FieldCount];
                    while (result.Read() == true)
                    {
                        result.GetValues(dataRow);
                        var childid = "";
                        for (int i = 0; i < result.FieldCount; i++)
                        {
                            if (result.GetName(i).ToUpper() == "ID".ToUpper())
                            {
                                childid = dataRow[i].ToString().Trim();
                            }
                        }
                        rtn = UpdateEFStatus(connStr, childid, DefaultData.HandleStatus.Complete);

                    }
                    rtn = UpdateEFStatus(connStr, id, DefaultData.HandleStatus.Complete);
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                rtn = new StringBuilder("CompleteEF False, Message:[").Append(ex.Message.ToString()).Append("]").ToString();
            }
            return rtn;
        }
        public static string MarkDownEF(string connStr, string id)
        {
            string rtn = "";
            try
            {
                using (SqlConnection connection = new SqlConnection(connStr))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(new StringBuilder("select * from A_EF where ParentId = '").Append(id).Append("'").ToString(), connection);
                    SqlDataReader result = command.ExecuteReader();
                    Object[] dataRow = new Object[result.FieldCount];
                    while (result.Read() == true)
                    {
                        result.GetValues(dataRow);
                        var childid = "";
                        for (int i = 0; i < result.FieldCount; i++)
                        {
                            if (result.GetName(i).ToUpper() == "ID".ToUpper())
                            {
                                childid = dataRow[i].ToString().Trim();
                            }
                        }
                        rtn = UpdateEFStatus(connStr, childid, DefaultData.HandleStatus.MarkDown);

                    }
                    rtn = UpdateEFStatus(connStr, id, DefaultData.HandleStatus.MarkDown);
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                rtn = new StringBuilder("MarkDownEF False, Message:[").Append(ex.Message.ToString()).Append("]").ToString();
            }
            return rtn;
        }
        public static string GetEFs(string connStr, string traceid)
        {
            string rtn = "GetEFs False";
            List<AFEventFrame> childEfs = null;
            AFEventFrame parentEf = null;
            string pisystem = System.Configuration.ConfigurationManager.AppSettings["pisystem"];
            string pidatabase = System.Configuration.ConfigurationManager.AppSettings["pidatabase"];
            string pidatabaseusername = System.Configuration.ConfigurationManager.AppSettings["pidatabaseusername"];
            string pidatabasepassword = System.Configuration.ConfigurationManager.AppSettings["pidatabasepassword"];
            try
            {
                rtn = LockEF(connStr, traceid);
                if (rtn == "")
                    LogHelper.WriteLog(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType, new StringBuilder("GetEFs, LockEF parentid:[").Append(traceid).Append("] Success").ToString());
                else
                    LogHelper.WriteLog(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType, new StringBuilder("GetEFs, LockEF parentid:[").Append(traceid).Append("] False, Reason:[").Append(rtn).Append("]").ToString());

                using (SqlConnection connection = new SqlConnection(connStr))
                {
                    connection.Open();
                    var piSystem = (new PISystems())[pisystem];
                    piSystem.Connect(new System.Net.NetworkCredential(pidatabaseusername, pidatabasepassword));
                    AFDatabase AFDatabase = piSystem.Databases[pidatabase];
                    SqlCommand command = new SqlCommand(new StringBuilder("select * from A_EF where ID = '").Append(traceid).Append("'").ToString(), connection);
                    SqlDataReader result = command.ExecuteReader();
                    Object[] dataRow = new Object[result.FieldCount];
                    while (result.Read() == true)
                    {
                        result.GetValues(dataRow);
                        var name = "";
                        var id = "";
                        for (int i = 0; i < result.FieldCount; i++)
                        {
                            if (result.GetName(i).ToUpper() == "ID".ToUpper())
                            {
                                id = dataRow[i].ToString().Trim();
                            }
                            if (result.GetName(i).ToUpper() == "Name".ToUpper())
                            {
                                name = dataRow[i].ToString().Trim();
                            }
                        }
                        rtn = GetEF(AFDatabase, connStr, out parentEf, id).ToUpper();
                        if (rtn == "")
                        {
                            LogHelper.WriteLog(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType, new StringBuilder("GetEFs, GetEF name:[").Append(name).Append("]").Append("id:[").Append(id).Append("]").Append(" Success").ToString());
                            rtn = GetChildEFs(AFDatabase, connStr, out childEfs, traceid);
                            if (rtn == "")
                            {
                                LogHelper.WriteLog(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType, new StringBuilder("GetEFs, ParentEF name:[").Append(parentEf.Name).Append("],id:[").Append(parentEf.ID.ToString()).Append("], GetChildEFs").Append(" Success").ToString());
                            }
                            else
                            {
                                LogHelper.WriteLog(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType, new StringBuilder("GetEFs, ParentEF name:[").Append(parentEf.Name).Append("],id:[").Append(parentEf.ID.ToString()).Append("], GetChildEFs").Append(" Fail").ToString());
                            }
                            if (parentEf != null && childEfs != null && childEfs.Count > 0)
                            {
                                foreach (AFEventFrame item in childEfs)
                                {
                                    parentEf.EventFrames.Add(item, AFDatabase.ReferenceTypes.Add(item.Name, item.Name, parentEf.Name));
                                    LogHelper.WriteLog(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType, new StringBuilder("GetEFs, ParentEF name:[").Append(parentEf.Name).Append("],id:[").Append(parentEf.ID.ToString()).Append("] Add ChildEF name:[").Append(item.Name).Append("],id:[").Append(item.ID.ToString()).Append("]").Append(" Success").ToString());
                                }
                                AFDatabase.CheckIn();
                            }
                        }
                        else
                        {
                            LogHelper.WriteLog(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType, new StringBuilder("GetEFs, GetEF name:[").Append(name).Append("]").Append("id:[").Append(id).Append("]").Append(" Fail").ToString());
                        }

                    }
                    result.Close();
                    connection.Close();
                }
                rtn = CompleteEF(connStr, traceid);
                if (rtn == "")
                    LogHelper.WriteLog(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType, new StringBuilder("GetEFs, Complete EF parentid:[").Append(traceid).Append("]").Append(" Success").ToString());
                else
                    LogHelper.WriteLog(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType, new StringBuilder("GetEFs, Complete EF parentid:[").Append(traceid).Append("]").Append(" Fail,").Append(rtn).Append("").ToString());

            }
            catch (Exception ex)
            {
                rtn = new StringBuilder(rtn).Append(",Message:[").Append(ex.Message.ToString()).Append("]").ToString();
                rtn = new StringBuilder(rtn).Append(",Markdown traceid:[").Append(traceid).Append("],result:[").Append(MarkDownEF(connStr, traceid)).Append("]").ToString();
            }
            return rtn;
        }
        public static string GetChildEFs(AFDatabase AFDatabase, String connStr, out List<AFEventFrame> efs, string traceid = "")
        {
            string rtn = "GetChildEFs Fail";
            efs = new List<AFEventFrame>();
            try
            {
                using (SqlConnection connection = new SqlConnection(connStr))
                {
                    int row = 0;
                    connection.Open();
                    SqlCommand command = new SqlCommand(new StringBuilder("select * from A_EF where ParentId = '").Append(traceid).Append("'").ToString(), connection);
                    SqlDataReader result = command.ExecuteReader();
                    Object[] dataRow = new Object[result.FieldCount];
                    AFEventFrame ef = null;
                    while (result.Read() == true)
                    {
                        result.GetValues(dataRow);
                        var name = "";
                        var id = "";
                        for (int i = 0; i < result.FieldCount; i++)
                        {
                            if (result.GetName(i).ToUpper() == "ID".ToUpper())
                            {
                                id = dataRow[i].ToString().Trim();
                            }
                            if (result.GetName(i).ToUpper() == "Name".ToUpper())
                            {
                                name = dataRow[i].ToString().Trim();
                            }
                        }
                        rtn = GetEF(AFDatabase, connStr, out ef, id).ToUpper();
                        efs.Add(ef);
                        if (rtn == "")
                        {
                            LogHelper.WriteLog(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType, new StringBuilder("GetChildEFs, name:[").Append(name).Append("],id:[").Append(id).Append("]").Append(" Success").ToString());
                        }
                        else
                        {
                            LogHelper.WriteLog(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType, new StringBuilder("GetChildEFs, name:[").Append(name).Append("],id:[").Append(id).Append("]").Append(" Fail").ToString());
                        }
                        row = row + 1;
                    }
                    if (row == 0) rtn = "";
                    result.Close();
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                rtn = ex.InnerException.ToString();
            }
            return rtn;
        }
        public static string GetEF(AFDatabase AFDatabase, String strConn, out AFEventFrame rtnEf, string id = "")
        {
            string rtn = "GetEF Fail";
            Guid outGuid = new Guid();
            rtnEf = null;
            if (id != "" && !Guid.TryParse(id, out outGuid))
            {
                return new StringBuilder("GetEF, Input Parameter id:[").Append(id).Append("] is invalid Guid").ToString();
            }
            try
            {
                var name = "";
                var parameters = "";
                var parentid = "";
                var hostaddress = "";
                var employeenumber = "";
                using (SqlConnection connection = new SqlConnection(strConn))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(new StringBuilder("select * from A_EF where ID ='").Append(id).Append("'").ToString(), connection);
                    SqlDataReader result = command.ExecuteReader();
                    Object[] dataRow = new Object[result.FieldCount];
                    while (result.Read() == true)
                    {
                        result.GetValues(dataRow);
                        for (int i = 0; i < result.FieldCount; i++)
                        {
                            if (result.GetName(i).ToUpper() == "Name".ToUpper())
                            {
                                name = dataRow[i].ToString().Trim();
                            }
                            if (result.GetName(i).ToUpper() == "Params".ToUpper())
                            {
                                parameters = dataRow[i].ToString().Trim();
                            }
                            if (result.GetName(i).ToUpper() == "ParentId".ToUpper())
                            {
                                parentid = dataRow[i].ToString().Trim();
                            }
                            if (result.GetName(i).ToUpper() == "HostAddress".ToUpper())
                            {
                                hostaddress = dataRow[i].ToString().Trim();
                            }
                            if (result.GetName(i).ToUpper() == "EmployeeNumber".ToUpper())
                            {
                                employeenumber = dataRow[i].ToString().Trim();
                            }
                        }
                    }
                }
                rtnEf = new AFEventFrame(AFDatabase);
                AFElementTemplate ETemplate = AFDatabase.ElementTemplates[name];
                if (ETemplate != null)
                {
                    if (String.IsNullOrEmpty(employeenumber)) employeenumber = "system";
                    if (String.IsNullOrEmpty(hostaddress)) hostaddress = "127.0.0.1";
                    AFEventFrame ef = new AFEventFrame(AFDatabase, new StringBuilder(name).Append("_").Append(employeenumber).Append("_").Append(hostaddress).Append("_").Append(DateTime.Now.ToLongTimeString()).ToString(), ETemplate);
                    DateTime dt = DateTime.Now;
                    ef.SetStartTime(dt);
                    ef.SetEndTime(dt.Add(new TimeSpan(0, 1, 0)));
                    var rtnNameValue = new List<NameValue>();
                    if (parameters != "")
                    {
                        var temp = parameters.Replace("{", "").Replace("}", "").Replace("\"", "");
                        foreach (string item in temp.Split(','))
                        {
                            rtnNameValue.Add(new NameValue { Name = item.Substring(0, item.IndexOf(':')), Value = item.Substring(item.IndexOf(':') + 1) });
                        }
                    }
                    if (ef.Attributes.Contains("ID")) { ef.Attributes["ID"].SetValue(new AFValue(id)); }
                    if (ef.Attributes.Contains("ParentId")) { ef.Attributes["ParentId"].SetValue(new AFValue(parentid)); }
                    if (rtnNameValue.Count > 0)
                    {
                        foreach (NameValue item in rtnNameValue)
                        {
                            if (ef.Attributes.Contains(item.Name))
                            {
                                ef.Attributes[item.Name].SetValue(new AFValue(item.Value));
                            }
                        }
                    }
                    ef.CheckIn();
                    rtnEf = ef;
                    rtn = "";
                }
                else
                {
                    rtn = new StringBuilder("GetEF name:[").Append(name).Append("]").Append("id:[").Append(id).Append("] Fail, Miss Element Template").ToString();
                }
            }
            catch (Exception ex)
            {
                rtn = new StringBuilder("GetEF Fail, Message:[").Append(ex.Message).Append("]").ToString();
            }

            return rtn;
        }
    }
}
