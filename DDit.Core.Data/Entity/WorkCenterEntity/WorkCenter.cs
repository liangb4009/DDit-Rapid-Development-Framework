using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.Core.Data.Entity.WorkCenterEntity
{
    public class WorkCenter : BaseEntity
    {
        public Guid ID { get; set; }
        public String WorkCenterID { get; set; }
        public int RecordStatus { get; set; }
        public DateTime RecordLastEditDt { get; set; }
        public Guid RecordGuid { get; set; }
    }
}
