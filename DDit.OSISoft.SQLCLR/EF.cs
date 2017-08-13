using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.OSISoft.SQLCLR
{
    public class EF
    {
        [SqlFunction(SystemDataAccess = SystemDataAccessKind.Read, DataAccess = DataAccessKind.Read)]
        public static string GetEF(string sql, string Env = "")
        {
            string result = "true";
            string strConnLocal = @"Data Source=CNWSGZISDL917\MESEFORM;Initial Catalog=DDit;User ID=sa;Password=amway123;";
            string strConnDev = "Data Source=xxxx;Initial Catalog=DDit;User ID=sa;Password=amway123;";
            string strConnQA = "Data Source=xxxx;Initial Catalog=DDit;User ID=sa;Password=amway123;";
            string strConnPrd = "Data Source=xxxx;Initial Catalog=DDit;User ID=sa;Password=amway123;";
            try
            {

                string strConn = strConnLocal;
                if (Env.ToUpper() == "Dev".ToUpper()) strConn = strConnDev;
                if (Env.ToUpper() == "QA".ToUpper()) strConn = strConnQA;
                if (Env.ToUpper() == "Prd".ToUpper()) strConn = strConnPrd;
                using (SqlConnection connection = new SqlConnection(strConn))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(sql, connection);
                    command.CommandType = CommandType.Text;
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                result = "false:" + ex.ToString();
            }

            return result;

        }
    }
}
