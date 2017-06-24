using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.Core.Data.Entity.EquEntity
{
    public class StopReason : BaseEntity
    {
        public Guid ID { get; set; }
        public string Code { get; set; }
        public string Reason { get; set; }
        public Guid ParentId { get; set; }
        public bool IsDelete { get; set; }
        public string UnitCode { get; set; }
        public string FullCode { get; set; }
        public int RecordStatus { get; set; }
        public DateTime RecordLastEditDt { get; set; }
        public Guid RecordGuid { get; set; }
    }
}
