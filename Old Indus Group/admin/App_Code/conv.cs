using System;
using System.Data;
using System.Web;

namespace tahrep03
{
    /// <summary>
    /// Class to convert a dataset to an html stream which can be used to display the dataset
    /// in MS Excel
    /// The Convert method is overloaded three times as follows
    ///  1) Default to first table in dataset
    ///  2) Pass an index to tell us which table in the dataset to use
    ///  3) Pass a table name to tell us which table in the dataset to use
    ///  65536 excel row limit handled - 16.06.2006
    /// </summary>
    public class DataSetToExcel
    {
        public void Convert(DataSet ds, HttpResponse response, string xlsFileName)
        {
            response.Clear();
            response.AddHeader("content-disposition", "attachment;filename=" + xlsFileName);
            response.Charset = "";
            response.ContentType = "application/vnd.ms-excel";

            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite = new System.Web.UI.HtmlTextWriter(stringWrite);
            System.Web.UI.WebControls.DataGrid dg = new System.Web.UI.WebControls.DataGrid();

            dg.DataSource = FitDataTableToExcel(ds.Tables[0]);
            dg.DataBind();
            dg.RenderControl(htmlWrite);

            response.Write(stringWrite.ToString());
            response.End();
        }
        public void Convert(DataSet ds, int TableIndex, HttpResponse response, string xlsFileName)
        {
            // lets make sure a table actually exists at the passed in value
            // if it is not call the base method
            if (TableIndex > ds.Tables.Count - 1)
            {
                Convert(ds, response, xlsFileName);
            }
            // we've got a good table so
            // let's clean up the response.object
            response.Clear();
            response.AddHeader("content-disposition", "attachment;filename=" + xlsFileName);
            response.Charset = "";
            // set the response mime type for excel
            response.ContentType = "application/vnd.ms-excel";
            // create a string writer
            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            // create an htmltextwriter which uses the stringwriter
            System.Web.UI.HtmlTextWriter htmlWrite = new System.Web.UI.HtmlTextWriter(stringWrite);
            // instantiate a datagrid
            System.Web.UI.WebControls.DataGrid dg = new System.Web.UI.WebControls.DataGrid();
            // set the datagrid datasource to the dataset passed in
            dg.DataSource = FitDataTableToExcel(ds.Tables[TableIndex]);
            // bind the datagrid
            dg.DataBind();
            // tell the datagrid to render itself to our htmltextwriter
            dg.RenderControl(htmlWrite);
            // all that's left is to output the html
            response.Write(stringWrite.ToString());
            response.End();
        }
        public void Convert(DataSet ds, string TableName, HttpResponse response, string xlsFileName)
        {
            // let's make sure the table name exists
            // if it does not then call the default method
            if (ds.Tables[TableName] == null)
            {
                Convert(ds, response, xlsFileName);
            }
            // we've got a good table so
            // let's clean up the response.object
            response.Clear();
            response.AddHeader("content-disposition", "attachment;filename=" + xlsFileName);
            response.Charset = "";
            // set the response mime type for excel
            response.ContentType = "application/vnd.ms-excel";
            // create a string writer
            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            // create an htmltextwriter which uses the stringwriter
            System.Web.UI.HtmlTextWriter htmlWrite = new System.Web.UI.HtmlTextWriter(stringWrite);
            //instantiate a datagrid
            System.Web.UI.WebControls.DataGrid dg = new System.Web.UI.WebControls.DataGrid();
            // set the datagrid datasource to the dataset passed in
            dg.DataSource = this.FitDataTableToExcel(ds.Tables[TableName]);
            // bind the datagrid
            dg.DataBind();
            // tell the datagrid to render itself to our htmltextwriter
            dg.RenderControl(htmlWrite);
            // all that's left is to output the html
            response.Write(stringWrite.ToString());
            response.End();
        }
        private DataTable FitDataTableToExcel(DataTable dt)
        {
            int ExcelRowLimit = 65534;
            int TotTableRowCounter = 0;
            int TotExcelRowCounter = 0;
            int TempExcelRowCounter = 0;
            int TableCounter = 0;
            DataRow dr;
            DataTable ExcelTempTable = new DataTable();
            DataTable ExcelTable = new DataTable();
            do
            {
                ExcelTempTable = dt.Clone();
                TableCounter += 1;
                // Create Excel Temporary Table
                TempExcelRowCounter = 0;
                do
                {
                    TotTableRowCounter += 1;
                    TempExcelRowCounter += 1;
                    dr = dt.Rows[TotTableRowCounter - 1];
                    ExcelTempTable.NewRow();
                    ExcelTempTable.ImportRow(dr);
                } while (TotTableRowCounter < dt.Rows.Count & TempExcelRowCounter < ExcelRowLimit);
                // Join Excel Temporary Table to Excel Table as columns
                // Create columns of Excel Table
                // Line No column
                ExcelTable.Columns.Add(new DataColumn("No [" + TableCounter.ToString() + "]", typeof(Int32)));
                for (int i = 0; i <= ExcelTempTable.Columns.Count - 1; i++)
                {
                    ExcelTable.Columns.Add(new DataColumn(ExcelTempTable.Columns[i].ColumnName + " [" + TableCounter.ToString() + "]",
                        ExcelTempTable.Columns[i].DataType));
                }
                // Table seperator column
                ExcelTable.Columns.Add(new DataColumn("[*" + TableCounter.ToString() + "*]", typeof(String)));
                // Fill data into Excel Table from Excel Temporary Table
                int ExcelTableRow, ExcelTableCol = 0;
                for (ExcelTableRow = 0; ExcelTableRow <= ExcelTempTable.Rows.Count - 1; ExcelTableRow++)
                {
                    try
                    {
                        ExcelTable.Rows[ExcelTableRow].BeginEdit();
                    }
                    catch
                    {
                        dr = ExcelTable.NewRow();
                        ExcelTable.Rows.Add(dr);
                        ExcelTable.Rows[ExcelTableRow].BeginEdit();
                    }
                    // Row Number value
                    TotExcelRowCounter += 1;
                    ExcelTable.Rows[ExcelTableRow][(TableCounter - 1) + ((TableCounter - 1) * (ExcelTempTable.Columns.Count + 1))] = TotExcelRowCounter;
                    // Data column's value
                    for (ExcelTableCol = 0; ExcelTableCol <= ExcelTempTable.Columns.Count - 1; ExcelTableCol++)
                    {
                        int CurrenColPositon = (ExcelTableCol + 1) + ((TableCounter - 1) * (ExcelTempTable.Columns.Count + 2));
                        ExcelTable.Rows[ExcelTableRow][CurrenColPositon] =
                            ExcelTempTable.Rows[ExcelTableRow].ItemArray[ExcelTableCol];
                    }
                    // Seperator column's value
                    ExcelTable.Rows[ExcelTableRow][(TableCounter - 1) + (((TableCounter - 1) * (ExcelTempTable.Columns.Count + 1)) + ExcelTempTable.Columns.Count + 1)] = " ";

                    ExcelTable.Rows[ExcelTableRow].EndEdit();
                    ExcelTable.Rows[ExcelTableRow].AcceptChanges();
                }
            } while (TotTableRowCounter < dt.Rows.Count);
            return ExcelTable;
        }
    }
}