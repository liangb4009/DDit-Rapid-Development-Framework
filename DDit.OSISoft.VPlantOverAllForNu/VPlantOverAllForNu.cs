using OSIsoft.AF.Asset;
using OSIsoft.AF.Time;
using System;
using System.ComponentModel;
using System.Runtime.InteropServices;
using OSIsoft.AF.Data;
using System.Collections.Generic;
using OSIsoft.AF.UnitsOfMeasure;
using System.Text;
using OSIsoft.AF;

namespace DDit.OSISoft.VPlantOverAllForNu
{
    [Description("VPlantOverAllForNu")]
    [Guid("0F3D253B-20BC-4393-8A2E-CFAF8B99E107")]
    [Serializable]
    public class VPlantOverAllForNu: AFDataReference
    {
        public override Type EditorType
        {
            get
            {
                return typeof(ConfigForm);
            }
        }

        private string configString = String.Empty;
        public override string ConfigString
        {
            get
            {
                return this.configString;
            }

            set
            {
                if (this.configString != value)
                {
                    this.configString = value;
                    base.SaveConfigChanges();
                }
            }
        }

        public override AFDataReferenceMethod SupportedMethods
        {
            get
            {
                return AFDataReferenceMethod.GetValue | AFDataReferenceMethod.SetValue;
            }
        }

        public override AFDataReferenceContext SupportedContexts
        {
            get
            {
                return AFDataReferenceContext.Time;
            }
        }

        public override AFValue GetValue(object context, object timeContext, AFAttributeList inputAttributes, AFValues inputValues)
        {
            var time = timeContext is AFTime ? ((AFTime)timeContext).LocalTime : DateTime.Now;
            int TPRunningLinesNum = 0;
            int TPLinesAllNum = 0;
            int SGRunningLinesNum = 0;
            int SGLinesAllNum = 0;
            int PLRunningLinesNum = 0;
            int PLLinesAllNum = 0;
            int SPRunningLinesNum = 0;
            int SPLinesAllNum = 0;
            int PPRunningLinesNum = 0;
            int PPLinesAllNum = 0;
            GetTPLineStatus(out TPRunningLinesNum, out TPLinesAllNum);
            GetSGLineStatus(out SGRunningLinesNum, out SGLinesAllNum);
            GetPLLineStatus(out PLRunningLinesNum, out PLLinesAllNum);
            GetSPLineStatus(out SPRunningLinesNum, out SPLinesAllNum);
            GetPPLineStatus(out PPRunningLinesNum, out PPLinesAllNum);
            var rtn = new StringBuilder("{")
                .Append("\"").Append("TPRunningLinesNum").Append("\"").Append(":").Append("\"").Append(TPRunningLinesNum.ToString()).Append("\"").Append(",")
                .Append("\"").Append("TPLinesAllNum").Append("\"").Append(":").Append("\"").Append(TPLinesAllNum.ToString()).Append("\"").Append(",")
                .Append("\"").Append("SGRunningLinesNum").Append("\"").Append(":").Append("\"").Append(SGRunningLinesNum.ToString()).Append("\"").Append(",")
                .Append("\"").Append("SGLinesAllNum").Append("\"").Append(":").Append("\"").Append(SGLinesAllNum.ToString()).Append("\"").Append(",")
                .Append("\"").Append("PLRunningLinesNum").Append("\"").Append(":").Append("\"").Append(PLRunningLinesNum.ToString()).Append("\"").Append(",")
                .Append("\"").Append("PLLinesAllNum").Append("\"").Append(":").Append("\"").Append(PLLinesAllNum.ToString()).Append("\"").Append(",")
                .Append("\"").Append("SPRunningLinesNum").Append("\"").Append(":").Append("\"").Append(SPRunningLinesNum.ToString()).Append("\"").Append(",")
                .Append("\"").Append("SPLinesAllNum").Append("\"").Append(":").Append("\"").Append(SPLinesAllNum.ToString()).Append("\"").Append(",")
                .Append("\"").Append("PPRunningLinesNum").Append("\"").Append(":").Append("\"").Append(PPRunningLinesNum.ToString()).Append("\"").Append(",")
                .Append("\"").Append("PPLinesAllNum").Append("\"").Append(":").Append("\"").Append(PPLinesAllNum.ToString()).Append("\"")
                .Append("}").ToString();
            return new AFValue(rtn, time);
        }
        public void GetTPLineStatus(out int runlinesnumber, out int alllinenumber)
        {
            int j = 0;
            int k = 0;
            var piSystem = (new PISystems())["CNTWSC0117"];
            string TPDeviceList = "KIKUSUI1,KIKUSUI2,KIKUSUI3,KIKUSUI4,KIKUSUI5,KIKUSUI6,KIKUSUI7,KORSCH1,KORSCH2,STOKE1,STOKE2,STOKE3";
            string[] list = TPDeviceList.Split(',');
            for (int i = 0; i <= list.GetUpperBound(0); i++)
            {
                AFValue valueForMachineStarved = null;
                AFAttribute machinestarved = AFAttribute.FindAttribute(new StringBuilder("\\\\CNTWSC0117\\MI1_extend_MI2\\ACCL_MFG\\Nutrilite\\Nut\\TP-Mix\\TP-Mix\\Tablet\\").Append(list[i]).Append("|MachineStarved").ToString(), piSystem);
                if (machinestarved != null) valueForMachineStarved = machinestarved.GetValue();
                if (valueForMachineStarved != null && valueForMachineStarved.ToString() == "Running") j = j + 1;
                k = k + 1;
            }
            runlinesnumber = j;
            alllinenumber = k;
        }
        public void GetSGLineStatus(out int runlinesnumber, out int alllinenumber)
        {
            runlinesnumber = 1;
            alllinenumber = 5;
        }
        public void GetPLLineStatus(out int runlinesnumber, out int alllinenumber)
        {
            runlinesnumber = 4;
            alllinenumber = 9;
        }
        public void GetSPLineStatus(out int runlinesnumber, out int alllinenumber)
        {
            runlinesnumber = 2;
            alllinenumber = 2;
        }
        public void GetPPLineStatus(out int runlinesnumber, out int alllinenumber)
        {
            runlinesnumber = 2;
            alllinenumber = 5;
        }
        public override void SetValue(object context, AFValue newValue)
        {
            //base.SetValue(context, newValue);
            return;
        }

        #region AFData related

        public override AFDataMethods SupportedDataMethods
        {
            get
            {
                return AFDataMethods.InterpolatedValue | AFDataMethods.RecordedValue;
            }
        }

        public override AFValue InterpolatedValue(AFTime time, AFAttributeList inputAttributes, AFValues inputValues)
        {
            return this.GetValue(null, time, null, null);
        }

        public override AFValue RecordedValue(AFTime time, AFRetrievalMode mode, AFAttributeList inputAttributes, AFValues inputValues)
        {
            return this.GetValue(null, time, null, null);
        }

        #endregion
    }
}
