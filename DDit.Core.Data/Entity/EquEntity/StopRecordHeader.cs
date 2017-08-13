using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.Core.Data.Entity.EquEntity
{
    /// <summary>
    /// 停机记录
    /// </summary>
    public class StopRecordHeader : BaseEntity
    {
        /// <summary>
        /// 唯一ID
        /// </summary>
        public Guid ID { get; set; }
        /// <summary>
        /// 订单号
        /// </summary>
        public string OrderNumber { get; set; }
        /// <summary>
        /// 订单日期
        /// </summary>
        public DateTime OrderDate { get; set; }
        /// <summary>
        /// 订单班次
        /// </summary>
        public int ShiftCode { get; set; }
        /// <summary>
        /// 停机记录类型，1是生产，0时非生产
        /// </summary>
        public bool IsProduction { get; set; }
        /// <summary>
        /// 工作中心
        /// </summary>
        public string WorkCenterId { get; set; }
        /// <summary>
        /// 机台编码
        /// </summary>
        public string MachineId { get; set; }
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
