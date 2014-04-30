using System;
using System.Data;

namespace ContactListDemo
{
	public class Schema : DataTable
	{
		public Schema()
		{
			TableName = "contacts";

			Columns.Add( "first_name", typeof( string ) );
			Columns.Add( "last_name", typeof( string ) );
			Columns.Add( "email", typeof( string ) );
			Columns.Add( "created_at", typeof( DateTime ) ).AllowDBNull = false;
			Columns.Add( "updated_at", typeof( DateTime ) ).AllowDBNull = false;
			Columns.Add( "home_phone", typeof( string ) );
			Columns.Add( "work_phone", typeof( string ) );
			Columns.Add( "cell_phone", typeof( string ) );
		}
	}

	public class Contacts : Schema
	{
		// http://en.wikipedia.org/wiki/List_of_most_popular_given_names
		private string[ ] _FirstNames = { "James", "John", "Robert", "Michael", "William", "David", "Richard", "Charles", "Joseph", "Thomas" };

		// http://names.mongabay.com/most_common_surnames.htm
		private string[ ] _LastNames = { "SMITH", "JOHNSON", "WILLIAMS", "JONES", "BROWN", "DAVIS", "MILLER", "WILSON", "MOORE", "TAYLOR", "ANDERSON", "THOMAS", "JACKSON", "WHITE", "HARRIS", "MARTIN", "THOMPSON", "GARCIA", "MARTINEZ", "ROBINSON" };

		public Contacts ( )
		{
			Random oRnd = new Random( );

			for ( int i = 0; i < 200; i++ )
			{
				string szFName = _FirstNames[ oRnd.Next( _FirstNames.Length ) ].ToUpper( );
				string szLName = _LastNames[ oRnd.Next( _LastNames.Length ) ].ToUpper( );
				string szEmail = string.Format( "{0}.{1}@mail.com", szFName, szLName );
				string szHome = string.Format( "{0}-{1}-{2}", oRnd.Next( 10, 9999 ), oRnd.Next( 10, 9999 ), oRnd.Next( 10, 99999 ) );
				string szWork = string.Format( "{0}-{1}-{2}", oRnd.Next( 10, 9999 ), oRnd.Next( 10, 9999 ), oRnd.Next( 10, 99999 ) );
				string szCell = string.Format( "{0}-{1}-{2}", oRnd.Next( 10, 9999 ), oRnd.Next( 10, 9999 ), oRnd.Next( 10, 99999 ) );

				Rows.Add( szFName, szLName, szEmail, DateTime.Today, DateTime.Today, szHome, szWork, szCell );
			}
		}
	}
}