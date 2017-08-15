using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.Component.Print.Demo
{
    class Program
    {
        static void Main(string[] args)
        {
            string FileName = "MATBackToWarehouseSheet_temp.xlsx";
            int FileCount = 1;
            string PrinterName = @"Doro PDF Writer";
            DateTime begin_time = DateTime.Now;
            DateTime end_time = DateTime.Now;
            Console.WriteLine(new StringBuilder("Call PrintExcel Begin, DateTime:[").Append(begin_time.ToShortTimeString()).Append("]").ToString());
            PrintHelper.PrintExcel(FileName, FileCount, PrinterName);
            end_time = DateTime.Now;
            Console.WriteLine(new StringBuilder("Call PrintExcel End, DateTime:[").Append(end_time.ToShortTimeString()).Append("], CostTime:[").Append(DateTimeHelper.DateDiff(begin_time, end_time)).Append("] seconds").ToString());


            begin_time = DateTime.Now;
            Console.WriteLine(new StringBuilder("Call PrintExcelWithRawPrint Begin, DateTime:[").Append(begin_time.ToShortTimeString()).Append("]").ToString());
            PrintHelper.ExportExcelToPdf(FileName);
            string PdfFileName = "MATBackToWarehouseSheet_temp.pdf";
            PrintHelper.PrintExcelWithRawPrint(PdfFileName, FileCount, PrinterName);
            end_time = DateTime.Now;
            Console.WriteLine(new StringBuilder("Call PrintExcelWithRawPrint End, DateTime:[").Append(end_time.ToShortTimeString()).Append("], CostTime:[").Append(DateTimeHelper.DateDiff(begin_time, end_time)).Append("] seconds").ToString());

            begin_time = DateTime.Now;
            Console.WriteLine(new StringBuilder("Call PrintExcelWithPrintDocument Begin, DateTime:[").Append(begin_time.ToShortTimeString()).Append("]").ToString());
            PrintHelper.PrintExcelWithPrintDocument(FileName, FileCount, PrinterName);
            end_time = DateTime.Now;
            Console.WriteLine(new StringBuilder("Call PrintExcelWithPrintDocument End, DateTime:[").Append(end_time.ToShortTimeString()).Append("], CostTime:[").Append(DateTimeHelper.DateDiff(begin_time, end_time)).Append("] seconds").ToString());

            Console.Read();
        }

    }
}
