using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.Component.Print.Demo
{
    public static class DateTimeHelper
    {
        public static string DateDiff(DateTime begin_time, DateTime end_time)
        {
            string rtn = null;
            TimeSpan ts_begin = new TimeSpan(begin_time.Ticks);
            TimeSpan ts_end = new TimeSpan(end_time.Ticks);
            TimeSpan ts = ts_end.Subtract(ts_begin).Duration();
            rtn = (ts.Days*86400 + ts.Hours * 3600 + ts.Minutes * 60 + ts.Seconds).ToString();
            return rtn;
        }
    }
}
