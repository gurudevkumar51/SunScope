﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunScopeBOL.Entities
{
    public class Login
    {
        public string LoginID { get; set; }
        public string Password { get; set; }
        public Boolean RememberMe { get; set; }
    }
}
