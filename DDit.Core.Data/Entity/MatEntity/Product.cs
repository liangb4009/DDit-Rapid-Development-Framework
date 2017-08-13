using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.Core.Data.Entity.MatEntity
{
    public class Product : BaseEntity
    {
        public Guid ID { get; set; }
        public Guid ItemId { get; set; }
        public String Code { get; set; }
        public String Name { get; set; }
        public int RecordStatus { get; set; }
        public DateTime RecordLastEditDt { get; set; }
        public Guid RecordGuid { get; set; }
    }
}
