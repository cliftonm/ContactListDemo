﻿using System.Web.UI;

namespace ContactListDemo
{
	public partial class Build2 : Page
	{
		private Contacts _Contacts = new Contacts( );

		public Contacts Contacts
		{
			get
			{
				return ( _Contacts );
			}
		}
	}
}