using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.Core.Data.Entity.LineEntity
{
    public class LineStation : BaseEntity
    {
        public Guid ID { get; set; }
        public Guid LineId { get; set; }
        public Guid StationId { get; set; }
        public int RecordStatus { get; set; }
        public DateTime RecordLastEditDt { get; set; }
        public Guid RecordGuid { get; set; }
    }
}
