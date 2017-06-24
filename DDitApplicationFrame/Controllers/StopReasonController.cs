using DDit.Core.Data.Entity;
using DDit.Core.Data.Entity.EquEntity;
using DDitApplicationFrame.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DDitApplicationFrame.Controllers
{
    public class StopReasonController : BaseController
    {
        // GET: StopReason
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult GetStopReasonList(StopReasonView stopReasonModel)
        {
            var jsonresult = this.StopReasonViewService.GetStopReasonList(stopReasonModel);
            return this.JsonResult(jsonresult);
        }
    }
}