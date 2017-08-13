using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.Core.Data.Entity.LineEntity
{
    public class Line : BaseEntity
    {
        public Guid ID { get; set; }
        public String FullName { get; set; }
        public String ShortName { get; set; }
        public Guid UnitId { get; set; }
        public int RecordStatus { get; set; }
        public DateTime RecordLastEditDt { get; set; }
        public Guid RecordGuid { get; set; }
    }
}
