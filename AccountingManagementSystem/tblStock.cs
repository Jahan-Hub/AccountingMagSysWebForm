//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AccountingManagementSystem
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblStock
    {
        public string LotNumber { get; set; }
        public string ItemCode { get; set; }
        public Nullable<int> ItemSize { get; set; }
        public Nullable<decimal> StockQty { get; set; }
        public Nullable<int> MinQty { get; set; }
        public Nullable<int> MaxQty { get; set; }
        public Nullable<System.DateTime> Lmdt { get; set; }
    }
}
