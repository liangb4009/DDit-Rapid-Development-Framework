using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.Core.Data.Entity.WoEntity
{
    public class WoMaster : BaseEntity
    {
        public Guid ID { get; set; }
        public String OrderType { get; set; }
        public String OrderDescription { get; set; }
        public String UnitCode { get; set; }
        public String OrderStatus { get; set; }
        public DateTime OrderStartDate { get; set; }
        public DateTime OrderEndDate { get; set; }
        public String OrderProductCode { get; set; }
        public String OrderProductDesc { get; set; }
        public int OrderQuantity { get; set; }
        public String OrderQuantityUnit { get; set; }
        public int RecordStatus { get; set; }
        public DateTime RecordLastEditDt { get; set; }
        public Guid RecordGuid { get; set; }
    }
}
