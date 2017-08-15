using Spire.Xls;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing.Printing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RawPrint;
using NPOI.SS.UserModel;
using NPOI.HSSF.UserModel;
using NPOI.XSSF.UserModel;
using System.Text.RegularExpressions;
using System.Runtime.InteropServices;

namespace DDit.Component.Print.Demo
{
    public static class PrintHelper
    {
        public static void PrintExcelWithPrintDocument(string FileName, int FileCount, string PrinterName)
        {
            string prnFile = new StringBuilder(ConfigurationManager.AppSettings["printfilepath"]).Append("\\").Append(FileName).ToString();
            string errmsg = string.Empty;

            try
            {
                Workbook workbook = new Workbook();
                workbook.LoadFromFile(prnFile);
                Worksheet worksheet = workbook.ActiveSheet;
                worksheet.PageSetup.PaperSize = PaperSizeType.PaperA4;
                worksheet.PageSetup.PrintQuality = FileCount;
                worksheet.PageSetup.Orientation = PageOrientationType.Portrait;
                PrintDocument pd = workbook.PrintDocument;
                pd.DocumentName = FileName;
                pd.PrinterSettings.PrinterName = PrinterName;
                pd.Print();
            }
            catch (Exception ex)
            {
                errmsg = ex.Message;
                Console.WriteLine(new StringBuilder("PrintExcelWithSpire Exception:[").Append(errmsg).Append("]").ToString());
            }
        }
        public static void PrintExcelWithRawPrint(string FileName, int FileCount, string PrinterName)
        {
            string prnFile = new StringBuilder(ConfigurationManager.AppSettings["printfilepath"]).Append("\\").Append(FileName).ToString();
            string errmsg = string.Empty;
            try
            {
                using (FileStream fs = new FileStream(prnFile, FileMode.Open, FileAccess.Read))
                {
                    IPrinter printer = new Printer();
                    printer.PrintRawStream(PrinterName, fs, FileName, false);
                }
            }
            catch (Exception ex)
            {
                errmsg = ex.Message;
                Console.WriteLine(new StringBuilder("PrintExcelWithRawPrint Exception:[").Append(errmsg).Append("]").ToString());
            }
        }
        public static void PrintExcel(string FileName, int FileCount, string PrinterName)
        {
            string prnFile = new StringBuilder(ConfigurationManager.AppSettings["printfilepath"]).Append("\\").Append(FileName).ToString();
            Microsoft.Office.Interop.Excel.Application application = null;
            Microsoft.Office.Interop.Excel.Workbook workbook = null;
            Microsoft.Office.Interop.Excel._Worksheet worksheet = null;
            string errmsg = string.Empty;
            try
            {
                application = new Microsoft.Office.Interop.Excel.Application();
                application.Visible = false;
                application.DisplayAlerts = false;
                application.AlertBeforeOverwriting = true;
                workbook = application.Workbooks.Open(prnFile);
                worksheet = workbook.ActiveSheet;
                worksheet.Activate();
                worksheet.PrintOutEx(Type.Missing, Type.Missing, FileCount, Type.Missing, PrinterName, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
                workbook.Save();
            }
            catch (Exception ex)
            {
                errmsg = ex.Message;
                Console.WriteLine(new StringBuilder("PrintExcel Exception:[").Append(errmsg).Append("]").ToString());
            }
            finally
            {
                if (worksheet != null)
                {
                    System.Runtime.InteropServices.Marshal.ReleaseComObject(worksheet);
                }
                if (workbook != null)
                {
                    workbook.Close();
                    System.Runtime.InteropServices.Marshal.ReleaseComObject(workbook);
                }
                if (application != null)
                {
                    application.Quit();
                    System.Runtime.InteropServices.Marshal.ReleaseComObject(application);
                }
            }
        }
        public static void ExportExcelToPdf(string FileName)
        {
            string prnFile = new StringBuilder(ConfigurationManager.AppSettings["printfilepath"]).Append("\\").Append(FileName).ToString();
            string outFile = new StringBuilder(ConfigurationManager.AppSettings["printfilepath"]).Append("\\").Append(FileName.Replace(".xlsx",".pdf")).ToString();
            Microsoft.Office.Interop.Excel.Application application = null;
            Microsoft.Office.Interop.Excel.Workbook workbook = null;
            Microsoft.Office.Interop.Excel._Worksheet worksheet = null;
            string errmsg = string.Empty;
            try
            {
                application = new Microsoft.Office.Interop.Excel.Application();
                application.Visible = false;
                application.DisplayAlerts = false;
                application.AlertBeforeOverwriting = true;
                workbook = application.Workbooks.Open(prnFile);
                worksheet = workbook.ActiveSheet;
                worksheet.Activate();
                worksheet.ExportAsFixedFormat(Microsoft.Office.Interop.Excel.XlFixedFormatType.xlTypePDF, outFile);
                workbook.Save();
            }
            catch (Exception ex)
            {
                errmsg = ex.Message;
                Console.WriteLine(new StringBuilder("PrintExcel Exception:[").Append(errmsg).Append("]").ToString());
            }
            finally
            {
                if (worksheet != null)
                {
                    System.Runtime.InteropServices.Marshal.ReleaseComObject(worksheet);
                }
                if (workbook != null)
                {
                    workbook.Close();
                    System.Runtime.InteropServices.Marshal.ReleaseComObject(workbook);
                }
                if (application != null)
                {
                    application.Quit();
                    System.Runtime.InteropServices.Marshal.ReleaseComObject(application);
                }
            }
        }
    }
    internal static class PrintConvert
    {
        [DllImport("user32.dll", SetLastError = true)]
        static extern int GetWindowThreadProcessId(IntPtr hWnd, out int IpdwProcessId);
    }
}
