using DDit.Core.Data.Entity.EquEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.Core.Data.IRepositories.IEquRepositories
{
    public interface IStopReasonRepository
    {
        Tuple<int, List<StopReason>> GetStopReasonList(StopReason model);
    }
}
