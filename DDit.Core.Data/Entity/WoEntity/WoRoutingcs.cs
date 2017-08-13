using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.Core.Data.Entity.WoEntity
{
    public class WoRoutingcs : BaseEntity
    {
        public Guid ID { get; set; }
        public Guid WoMasterId { get; set; }
        public Guid WorkCenterId { get; set; }
        public int SeqNumber { get; set; }
        public string SeqDesc { get; set; }
        public DateTime SeqStartTime { get; set; }
        public DateTime SeqEndTime { get; set; }
        public int Crew { get; set; }
        public double SeqStdMachineHrs { get; set; }
        public double SeqStdLaborHrs { get; set; }
        public double SeqStdSetupHrs { get; set; }
        public int RecordStatus { get; set; }
        public DateTime RecordLastEditDt { get; set; }
        public Guid RecordGuid { get; set; }
    }
}
