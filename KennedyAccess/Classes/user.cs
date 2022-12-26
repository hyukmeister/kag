using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KennedyAccess
{
    public class User
    {
        private int _userid;
        private string _firstname;
        private string _lastname;
        private string _email;
        private bool _authenticated;
        private int _franchiseid;
        private string _usertype;
        private string _userroles;
        private string _mobilephone;
        private string _franchisename;
        private int _objectid;
        private bool _profilecompleted;
        private int _appliedjobid; 

        public int UserID
        {
            get { return _userid; }
            set { _userid = value; }
        }
        public int ObjectID
        {
            get { return _objectid; }
            set { _objectid = value; }
        }
        public int FranchiseID
        {
            set { _franchiseid = value; }
            get { return _franchiseid; }
        }
        public string FranchiseName
        {
            set { _franchisename = value; }
            get { return _franchisename; }
        }
        public string FirstName
        {
            get { return _firstname; }
            set { _firstname = value; }
        }
        public string LastName
        {
            get { return _lastname; }
            set { _lastname = value; }
        }
        public string Email
        {
            get { return _email; }
            set { _email = value; }
        }
        public bool Authenticated
        {
            get { return _authenticated; }
            set { _authenticated = value; }
        }
        public string UserType
        {
            get { return _usertype; }
            set { _usertype = value; }
        }
        public string UserRoles
        {
            get { return _userroles; }
            set { _userroles = value; }
        }
        
        public string Mobilephone
        {
            get { return _mobilephone; }
            set { _mobilephone = value; }
        }
        public bool HasRole(string sRole)
        {
            bool hasRole=false;

            if(_userroles!=null && _userroles.Contains(sRole+","))
                hasRole=true;

            return hasRole;
        }

        public bool ProfileCompleted
        {
            get { return _profilecompleted; }
            set { _profilecompleted = value; }
        }
        public int AppliedJobidID
        {
            get { return _appliedjobid; }
            set { _appliedjobid = value; }
        }
    }
}