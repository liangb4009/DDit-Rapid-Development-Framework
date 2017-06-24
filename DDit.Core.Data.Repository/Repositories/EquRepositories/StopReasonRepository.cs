using DDit.Core.Data.IRepositories.IEquRepositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DDit.Core.Data.Entity.EquEntity;
using DDit.Component.Tools;
using Autofac;

namespace DDit.Core.Data.Repository.Repositories.EquRepositories
{
    class StopReasonRepository : IStopReasonRepository
    {
        public Tuple<int, List<StopReason>> GetStopReasonList(StopReason model)
        {
            throw new NotImplementedException();
        }
    }
}
