using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace Reservation_System
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            // call a Function to Fill the comboBox3 with Hotel ID
            combobox3_hotel_id();

            // call a Function to Fill the comboBox1 with Reservation_titles
            combobox1_reservation_title();

            // Fill the comboBox2 with values
            comboBox2.Items.Add("Positive");
            comboBox2.Items.Add("Negative");

        }
        //Function to fill the comboBox3 with Hotel ID
        void combobox3_hotel_id()
        {
            SqlConnection con = new SqlConnection("Data Source=FCIS;Initial Catalog=Reservation_System;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("select Hotel_ID from Hotel",con);
            cmd.CommandType = CommandType.Text;
            SqlDataReader rdr = cmd.ExecuteReader();
            while(rdr.Read())
            {
                comboBox3.Items.Add(rdr["Hotel_ID"]);
            }
            rdr.Close();
            con.Close();
        }
        //Function to Fill the comboBox1 with Reservation_titles
        void combobox1_reservation_title()
        {
            SqlConnection con = new SqlConnection("Data Source=FCIS;Initial Catalog=Reservation_System;Integrated Security=True");
            // Open the connection
            con.Open();
            // prepare command strings
            string ComStr = "select Reservation_Title from Reservation";
            // Instantiate a new command
            SqlCommand cmd = new SqlCommand(ComStr, con);
            cmd.CommandType = CommandType.Text;
            // Call Execute reader to get query results
            SqlDataReader reader = cmd.ExecuteReader();

            // Fill the comboBox with values
            while (reader.Read())
            {
                comboBox1.Items.Add(reader["Reservation_Title"]);
            }
            // Close the reder
            reader.Close();
            // Close the connection
            con.Close();
        }

        //Button to delete a reservation
        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=FCIS;Initial Catalog=Reservation_System;Integrated Security=True");
            // Open the connection
            con.Open();
            // prepare command strings
            string deleteString = "delete from Reservation where Reservation_Title = @ResTit";
            // Instantiate a new command
            SqlCommand cmd = new SqlCommand();
            // Set the CommandText property
            cmd.CommandText = deleteString;
            // Set the Connection property
            cmd.Connection = con;
            // Declare parameters
            SqlParameter paramResTit = new SqlParameter("@ResTit", comboBox1.SelectedItem);
            cmd.Parameters.Add(paramResTit);
            // Call ExecuteNonQuery to send command
            cmd.ExecuteNonQuery();
            // Close the connection
            con.Close();
            MessageBox.Show("The Reservation is Deleted.");

        }

        //Button to search for hotels
        private void button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=FCIS;Initial Catalog=Reservation_System;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("search1", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter s = new SqlParameter("@s", textBox2.Text);
            cmd.Parameters.Add(s);
            SqlDataReader reader = cmd.ExecuteReader();
            DataTable tbl_reservation = new DataTable();
            tbl_reservation.Columns.Add("ID");
            tbl_reservation.Columns.Add("Hotel_Name");
            tbl_reservation.Columns.Add("rating");
            tbl_reservation.Columns.Add("Contact_Email");
            tbl_reservation.Columns.Add("Contact_phones");

            DataRow row;

            while (reader.Read())
            {
                row = tbl_reservation.NewRow();
                for (int i = 0; i < 5; i++)
                {
                    row[i] = reader[i];
                }
                tbl_reservation.Rows.Add(row);

            }
            reader.Close();
            con.Close();
            dataGridView1.DataSource = tbl_reservation;
        }

        //Button to update check-in-date,check-out-date and duration of stay
        private void button3_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=FCIS;Initial Catalog=Reservation_System;Integrated Security=True");
            con.Open();
            string updatestr1 = @"update Reservation set Check_in_date=@vardate1 where ID =@varid";
            SqlCommand cmd = new SqlCommand(updatestr1, con);
            SqlParameter pt1 = new SqlParameter(@"vardate1", textBox4.Text);
            cmd.Parameters.Add(pt1);
            SqlParameter pt4 = new SqlParameter(@"varid", textBox3.Text);
            cmd.Parameters.Add(pt4);
            cmd.ExecuteNonQuery();
            //----------------------
            string updatestr2 = @"update Reservation set Check_out_date=@vardate2 where ID =@varid";
            SqlCommand cmd1 = new SqlCommand(updatestr2, con);
            SqlParameter pt2 = new SqlParameter(@"vardate2", textBox5.Text);
            cmd1.Parameters.Add(pt2);
            pt4 = new SqlParameter(@"varid", textBox3.Text);
            cmd1.Parameters.Add(pt4);
            cmd1.ExecuteNonQuery();
            //-----------------------
            string updatestr3 = @"update Reservation set Duration_of_stay=@vardur where ID =@varid";
            SqlCommand cmd2 = new SqlCommand(updatestr3, con);
            SqlParameter pt3 = new SqlParameter(@"vardur", textBox6.Text);
            cmd2.Parameters.Add(pt3);
            pt4 = new SqlParameter(@"varid", textBox3.Text);
            cmd2.Parameters.Add(pt4);
            cmd2.ExecuteNonQuery();
            con.Close();
            MessageBox.Show("Updated");
        }

        //Button to insert a review
        private void button4_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=FCIS;Initial Catalog=Reservation_System;Integrated Security=True");
            con.Open();
            string insert = @"insert into Review values(@type,@name,@syntax,@date,@id)";
            SqlCommand cmd = new SqlCommand(insert, con);
            SqlParameter parameter1 = new SqlParameter("@type", comboBox2.SelectedItem);
            cmd.Parameters.Add(parameter1);
            SqlParameter parameter2 = new SqlParameter("@name", textBox7.Text);
            cmd.Parameters.Add(parameter2);
            SqlParameter parameter3 = new SqlParameter("@syntax", textBox8.Text);
            cmd.Parameters.Add(parameter3);
            SqlParameter parameter4 = new SqlParameter("@date", textBox9.Text);
            cmd.Parameters.Add(parameter4);
            SqlParameter parameter5 = new SqlParameter("@id", comboBox3.SelectedItem);
            cmd.Parameters.Add(parameter5);
            cmd.ExecuteNonQuery();
            con.Close();
            MessageBox.Show("Reviewing was done successfully.");
        }

        //Button to display the bill details
        private void button5_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=FCIS;Initial Catalog=Reservation_System;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("details",con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter parameter1 = new SqlParameter("@bill_id", textBox1.Text);
            cmd.Parameters.Add(parameter1);
            SqlParameter parameter2 = new SqlParameter("@@bill_details", SqlDbType.NVarChar, 200);
             parameter2.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(parameter2);
            cmd.ExecuteNonQuery();
            string detail =parameter2.Value.ToString();
            con.Close();
            MessageBox.Show("Your Bill Details is: " + detail);
        }

        //Button to display the hotel brances
        private void button6_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=FCIS;Initial Catalog=Reservation_System;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("branch", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter s = new SqlParameter("@hotel_name", textBox10.Text);
            cmd.Parameters.Add(s);
            SqlDataReader reader = cmd.ExecuteReader();
            DataTable tbl_reservation = new DataTable();
            tbl_reservation.Columns.Add("branches");
            DataRow row;
            while (reader.Read())
            {
                row = tbl_reservation.NewRow();
                row[0] = reader[0];
                tbl_reservation.Rows.Add(row);
            }
            reader.Close();
            con.Close();
            dataGridView2.DataSource = tbl_reservation;
        }
    }
}
