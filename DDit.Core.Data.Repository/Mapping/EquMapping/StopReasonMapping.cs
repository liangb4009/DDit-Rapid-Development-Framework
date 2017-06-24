using DDit.Core.Data.Entity.EquEntity;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.Core.Data.Repository.Mapping.EquMapping
{
    public class StopReasonMapping : EntityTypeConfiguration<StopReason>
    {
        public StopReasonMapping()
        {
            HasKey(A => A.ID);
            this.ToTable("Stop_Reason", "Equ");
            this.Property(a => a.Code).HasColumnName("Code");
            this.Property(a => a.Reason).HasColumnName("Reason");
            this.Property(a => a.ParentId).HasColumnName("ParentId");
            this.Property(a => a.IsDelete).HasColumnName("IsDelete");
            this.Property(a => a.UnitCode).HasColumnName("UnitCode");
            this.Property(a => a.FullCode).HasColumnName("FullCode");
            this.Property(a => a.RecordStatus).HasColumnName("RecordStatus");
            this.Property(a => a.RecordLastEditDt).HasColumnName("RecordLastEditDt");
            this.Property(a => a.RecordGuid).HasColumnName("RecordGuid");
        }
    }
}
