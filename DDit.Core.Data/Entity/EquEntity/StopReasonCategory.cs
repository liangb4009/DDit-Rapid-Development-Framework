﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.Core.Data.Entity.EquEntity
{
    /// <summary>
    /// 停机原因类别
    /// </summary>
    public class StopReasonCategory : BaseEntity
    {
        /// <summary>
        /// 唯一ID
        /// </summary>
        public Guid ID { get; set; }
        /// <summary>
        /// 名字
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 编码
        /// </summary>
        public int Code { get; set; }
        /// <summary>
        /// 记录状态，1是创建，0是更新，-1 是删除
        /// </summary>
        public int RecordStatus { get; set; }
        /// <summary>
        /// 记录最后更新时间
        /// </summary>
        public DateTime RecordLastEditDt { get; set; }
        /// <summary>
        /// 唯一ID，用于数据同步
        /// </summary>
        public Guid RecordGuid { get; set; }
    }
}
