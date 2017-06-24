using DDit.Core.Data.Entity.EquEntity;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.Core.Data.Repository.Mapping.EquMapping
{
    public class StopReasonViewMapping : EntityTypeConfiguration<StopReasonView>
    {
        public StopReasonViewMapping()
        {
            HasKey(A => A.ReasonCodeID);
            this.ToTable("Stop_Reason_View", "Equ");
            this.Property(a => a.ReasonCodeID).HasColumnName("ID");
            this.Property(a => a.Lv1_Code).HasColumnName("Lv1_Code");
            this.Property(a => a.Lv1_Desc).HasColumnName("Lv1_Desc");
            this.Property(a => a.Lv2_Code).HasColumnName("Lv2_Code");
            this.Property(a => a.Lv2_Desc).HasColumnName("Lv2_Desc");
            this.Property(a => a.Lv3_Code).HasColumnName("Lv3_Code");
            this.Property(a => a.Lv3_Desc).HasColumnName("Lv3_Desc");
            this.Property(a => a.Unit_Code).HasColumnName("Unit_Code");
            this.Property(a => a.Subreason_Code).HasColumnName("Subreason_Code");
            this.Property(a => a.Work_Center).HasColumnName("Work_Center");
            this.Property(a => a.Full_Code).HasColumnName("Full_Code");
        }
    }
}
