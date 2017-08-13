using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.Core.Data.Entity.EquEntity
{
    /// <summary>
    /// Oee计算变量
    /// </summary>
    public class OeeVariable : BaseEntity
    {
        /// <summary>
        /// 变量ID
        /// </summary>
        public Guid ID { get; set; }
        /// <summary>
        /// 变量名字
        /// </summary>
        public String Name { get; set; }
        /// <summary>
        /// 变量计算公式
        /// </summary>
        public String Expression { get; set; }
        /// <summary>
        /// 变量关联的Oee时间ID，没有为Null
        /// </summary>
        public Guid OeeTimeId { get; set; }
        /// <summary>
        /// 变量关联的Oee产量ID，没有为Null
        /// </summary>
        public Guid OeeCountId { get; set; }
        /// <summary>
        /// 变量关联的Oee指标ID，没有为Null
        /// </summary>
        public Guid OeeIndexId { get; set; }
        /// <summary>
        /// 返回值
        /// </summary>
        public Double Value { get; }
        /// <summary>
        /// 变量属于的公式ID
        /// </summary>
        public Guid OeeFormulaId { get; set; }
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
