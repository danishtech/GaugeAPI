//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GaugeAPI.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Company
    {
        public int CompanyID { get; set; }
        public string Company_Name { get; set; }
        public string Company_Address { get; set; }
        public string Company_P_O_Box_Number { get; set; }
        public string Company_Telephone_Number { get; set; }
        public string Company_Fax_Number { get; set; }
        public string Company_Website { get; set; }
        public string Company_Email { get; set; }
        public string Owner_Name { get; set; }
        public string E_mail_Address { get; set; }
        public string Managing_Director_Name { get; set; }
        public string E_mail_Address_Director { get; set; }
        public string Trade_License_Number { get; set; }
        public Nullable<System.DateTime> Trade_License_Issue_Date { get; set; }
        public Nullable<System.DateTime> Trade_License_Expiry_Date { get; set; }
        public string Trade_License_Copy { get; set; }
        public int CreatedByID { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int ModifiedByID { get; set; }
        public System.DateTime ModifiedDate { get; set; }
    }
}
