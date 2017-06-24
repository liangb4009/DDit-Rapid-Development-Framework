using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.Core.Data.Entity.EquEntity
{
    public class StopReasonView : BaseEntity
    {
        public int ReasonCodeID { get; set; }
        public string Lv1_Code { get; set; }
        public string Lv1_Desc { get; set; }
        public string Lv2_Code { get; set; }
        public string Lv2_Desc { get; set; }
        public string Lv3_Code { get; set; }
        public string Lv3_Desc { get; set; }
        public string Unit_Code { get; set; }
        public string Subreason_Code { get; set; }
        public string Work_Center { get; set; }
        public string Full_Code { get; set; }
    }
}
