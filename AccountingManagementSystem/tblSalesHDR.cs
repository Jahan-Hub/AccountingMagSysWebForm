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
    
    public partial class tblSalesHDR
    {
        public int SalesId { get; set; }
        public Nullable<System.DateTime> SalesDate { get; set; }
        public Nullable<int> ChallanNo { get; set; }
        public Nullable<System.DateTime> AmendmentDate { get; set; }
        public Nullable<int> BillNo { get; set; }
        public string PONo { get; set; }
        public Nullable<System.DateTime> PODate { get; set; }
        public string LotNumber { get; set; }
        public Nullable<int> VoucherNo { get; set; }
        public Nullable<int> CustId { get; set; }
        public Nullable<int> ShipTo { get; set; }
        public string Remarks { get; set; }
        public string Reference { get; set; }
        public Nullable<decimal> TaxVAT { get; set; }
        public Nullable<decimal> VAT { get; set; }
        public Nullable<decimal> Discount { get; set; }
        public Nullable<decimal> LabourCost { get; set; }
        public Nullable<decimal> OtherCost { get; set; }
        public Nullable<decimal> NetAmount { get; set; }
        public Nullable<decimal> Paid { get; set; }
        public Nullable<decimal> Due { get; set; }
        public string PayMode { get; set; }
        public string ChequeNo { get; set; }
        public Nullable<System.DateTime> ChequeDt { get; set; }
        public string DepositBank { get; set; }
        public string BankName { get; set; }
        public string ChequeDetails { get; set; }
        public string UserId { get; set; }
        public Nullable<System.DateTime> Lmdt { get; set; }
    }
}
