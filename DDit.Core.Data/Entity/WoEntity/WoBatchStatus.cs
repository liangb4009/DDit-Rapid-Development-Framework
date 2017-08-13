using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.Core.Data.Entity.WoEntity
{
    public class WoBatchStatus : BaseEntity
    {
        public Guid ID { get; set; }
        public String OrderNumber { get; set; }
        public DateTime OrderDate { get; set; }
        public Char ShiftCode { get; set; }
        public Guid LineId { get; set; }
        public Guid BatchId { get; set; }
        public String OrderType { get; set; }
        public String OrderProductCode { get; set; }
        public String OrderProductDesc { get; set; }
        public DateTime BeginTime { get; set; }
        public DateTime EndTime { get; set; }
        public int BatchQty { get; set; }
        public int BatchQtyUnit { get; set; }
        public int RecordStatus { get; set; }
        public DateTime RecordLastEditDt { get; set; }
        public Guid RecordGuid { get; set; }
    }
}
