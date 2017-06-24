using DDit.Core.Data.Entity.EquEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DDit.Core.Data.IRepositories.IEquRepositories
{
    public interface IStopReasonViewRepository
    {
        Tuple<int, List<StopReasonView>> GetStopReasonList(StopReasonView model);
    }
}
