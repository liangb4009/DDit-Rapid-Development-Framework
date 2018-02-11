﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.Core.Data.Entity.EquEntity
{
    /// <summary>
    /// 停机原因
    /// </summary>
    public class StopReason : BaseEntity
    {
        /// <summary>
        /// 唯一ID
        /// </summary>
        public Guid ID { get; set; }
        /// <summary>
        /// 停机原因代码
        /// </summary>
        public string Code { get; set; }
        /// <summary>
        /// 停机原因描述
        /// </summary>
        public string Reason { get; set; }
        /// <summary>
        /// 上一级停机原因ID
        /// </summary>
        public Guid ParentId { get; set; }
        /// <summary>
        /// 停机原因完整编码
        /// </summary>
        public string FullCode { get; set; }
        /// <summary>
        /// 关联停机类别ID
        /// </summary>
        public Guid StopReasonCategoryId { get; set; }
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