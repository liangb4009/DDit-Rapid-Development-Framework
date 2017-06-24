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
    class StopReasonViewRepository : IStopReasonViewRepository
    {
        public Tuple<int, List<StopReasonView>> GetStopReasonList(StopReasonView model)
        {
            using (var dal = BaseInfo._container.Resolve<UnitOfWork>())
            {
                var stopReasonRepository = dal.GetRepository<StopReasonView>();
                var conditions = ExpandHelper.True<StopReasonView>();
                if (!string.IsNullOrEmpty(model.Full_Code))
                {
                    conditions = conditions.And(a => a.Full_Code.Equals(model.Full_Code));
                }
                var templist = stopReasonRepository.Get(filter: conditions);
                var count = templist.Count();
                if (model.order != null && model.order.Count() > 0)
                {
                    foreach (var item in model.order)
                    {
                        var column = model.columns.ElementAt(int.Parse(item.column));
                        templist = templist.OrderSort(column.data, item.dir);
                    }
                }
                var result = templist.ToList();//.PageBy(model.pageIndex, model.pageSize).ToList();
                return new Tuple<int, List<StopReasonView>>(count, result);

            }
        }
    }
}
