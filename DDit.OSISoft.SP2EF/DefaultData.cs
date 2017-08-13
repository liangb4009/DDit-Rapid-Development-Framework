using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.OSISoft.SP2EF
{
    public static class DefaultData
    {
        public static class HandleStatus
        {
            /// <summary>
            /// 新建
            /// </summary>
            public const int New = 0;
            /// <summary>
            /// 处理中
            /// </summary>
            public const int InProcess = 1;
            /// <summary>
            /// 已完成
            /// </summary>
            public const int Complete = 2;
            /// <summary>
            /// 错误
            /// </summary>
            public const int MarkDown = 9;
        }
    }
}
