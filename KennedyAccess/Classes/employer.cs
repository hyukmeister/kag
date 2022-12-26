using Antlr.Runtime.Misc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KennedyAccess.Classes
{
    public class employer
    {
        private int _employerid;
        private int _franchiseid;
        private int _active;
        private int _recordtypeid;
        private int _userid;
        private string _employername;
        private int _numemployees;
        private int _yearbusiness;
        private string _fein;
        private string _naicscode;
        private bool _alienownership;

        public int EmployerID
        {
            get { return _employerid; }
            set { _employerid = value; }
        }
        public int FranchiseID
        {
            get { return _franchiseid; }
            set { _franchiseid = value; }
        }
        public int Active
        {
            get { return _active; }
            set { _active = value; }
        }
        public int RecordTypeID
        {
            get { return _recordtypeid; }
            set { _recordtypeid = value; }
        }

        public int UserID
        {
            get { return _userid; }
            set { _userid = value; }
        }
        public string EmployerName
        {
            get { return _employername; }
            set { _employername = value; }
        }

        public int NumEmployees
        {
            get { return _numemployees; }
            set { _numemployees = value; }
        }
        public int YearBusiness
        {
            get { return _yearbusiness; }
            set { _yearbusiness = value; }
        }
        public string FEIN
        {
            get { return _fein; }
            set { _fein = value; }
        }
        public string NAICSCode
        {
            get { return _naicscode; }
            set { _naicscode = value; }
        }
        public bool AlienOwnership
        {
            get { return _alienownership; }
            set { _alienownership = value; }
        }
    }
}