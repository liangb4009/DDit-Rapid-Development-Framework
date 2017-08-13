using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.Core.Data.Entity.EquEntity
{
    /// <summary>
    /// 停机明细
    /// </summary>
    public class StopRecordDetail : BaseEntity
    {
        /// <summary>
        /// 记录ID
        /// </summary>
        public Guid ID { get; set; }
        /// <summary>
        /// 停机记录ID
        /// </summary>
        public Guid StopRecordHeaderId { get; set; }
        /// <summary>
        /// 开始时间
        /// </summary>
        public DateTime StartTime { get; set; }
        /// <summary>
        /// 结束时间
        /// </summary>
        public DateTime EndTime { get; set; }
        /// <summary>
        /// 持续时间
        /// </summary>
        public int Duration { get; set; }
        /// <summary>
        /// 停机代码
        /// </summary>
        public String StopReasonCode { get; set; }
        /// <summary>
        /// 停机原因类别ID
        /// </summary>
        public Guid StopReasonCategoryId { get; set; }
        /// <summary>
        /// 停机原因描述
        /// </summary>
        public String StopReasonDesc { get; set; }
        /// <summary>
        /// 人数
        /// </summary>
        public int Crew { get; set; }
        /// <summary>
        /// 人工工时
        /// </summary>
        public int Labor { get; set; }
        /// <summary>
        /// 维修人员，0是无，1是车间维修，2是工程部维修
        /// </summary>
        public int RepairMan { get; set; }
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
