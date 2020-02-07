
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization

Partial Class kasir_reports_invoice_penerimaan
  Inherits System.Web.UI.Page

  Private Sub kasir_reports_invoice_penerimaan_Load(sender As Object, e As EventArgs) Handles Me.Load
    If Not (Me.Page.IsPostBack) Then
      If Session("KODE_USER") IsNot Nothing Then
        Me.GET_USERS(Session("KODE_USER").ToString)
        Me.GET_BIND_GRID()
        Me.GET_INVOICE_DETAILS(Me.Page.Request.QueryString("inv"))
      Else
        Response.Redirect("~/account/Login.aspx?next-url=~/kasir/reports/invoice-penerimaan.aspx", True)
      End If
    End If
  End Sub

  Private Sub GET_USERS(KODE_USER As String)
    Try
      Using connect As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString)
        Dim str As String = "SELECT * FROM T_USER WHERE KODE_USER=@KODE_USER"
        Using cmd As New SqlCommand(str, connect)

          With cmd
            .Parameters.Add("@KODE_USER", SqlDbType.VarChar).Value = KODE_USER
            .CommandType = CommandType.Text
            .CommandText = str
            .Connection = connect
            .Connection.Open()
          End With

          Using dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            If dr.HasRows Then
              Me.BTPROFILE.Text = dr("NAMA_USER").ToString
              Me.imgUser.ImageUrl = dr("FOTO_FILEPATH").ToString & dr("FOTO_FILENAME").ToString
            End If
          End Using
        End Using
      End Using
    Catch ex As Exception
      Response.Write(ex.Message)
    End Try
  End Sub

  Private Function GetData(ByVal cmmd As SqlCommand) As DataTable
    Using dt As New DataTable
      Using connect As New SqlConnection(ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString)
        Using Adapter As New SqlDataAdapter
          cmmd.Connection = connect
          connect.Open()
          Adapter.SelectCommand = cmmd
          Adapter.Fill(dt)
          Return dt
        End Using
      End Using
    End Using
  End Function

  Private Sub GET_BIND_GRID()
    Dim strQuery As String = "SELECT * FROM VW_PENERIMAAN WHERE INVOICE_PENERIMAAN = @INVOICE_PENERIMAAN"

    Using cmd As SqlCommand = New SqlCommand(strQuery)
      cmd.Parameters.AddWithValue("@INVOICE_PENERIMAAN", Me.Page.Request.QueryString("inv"))
      Me.GVBARANG.DataSource = Me.GetData(cmd)
      Me.GVBARANG.DataBind()
      'Me.UpdatePanel1.Update()
    End Using
  End Sub

  Private Sub GET_INVOICE_DETAILS(INVOICE As String)
    Try
      Using connect As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString)
        Dim str As String = "SELECT * FROM VW_PENERIMAAN WHERE INVOICE_PENERIMAAN=@INVOICE_PENERIMAAN"
        Using cmd As New SqlCommand(str, connect)

          With cmd
            .Parameters.Add("@INVOICE_PENERIMAAN", SqlDbType.VarChar).Value = INVOICE
            .CommandType = CommandType.Text
            .CommandText = str
            .Connection = connect
            .Connection.Open()
          End With

          Using dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            If dr.HasRows Then
              Dim dt1 As DateTime = dr("TANGGAL_MASUK").ToString
              Dim result1 As String = String.Format("{0:dd/MM/yyyy}", dt1)

              Me.TXTINVOICE.Text = dr("INVOICE_PENERIMAAN").ToString
              Me.TXTKASIR.Text = dr("NAMA_USER").ToString
              Me.TXTSUPPLIER.Text = dr("NAMA_SUPPLIER").ToString
              Me.TXTSUPPLIER2.Text = dr("NAMA_SUPPLIER").ToString
              Me.TXTSUPPLIERALAMAT.Text = dr("ALAMAT_SUPPLIER").ToString
              Me.TXTSUPPLIERTELP.Text = dr("NO_TELP").ToString
              Me.TXTTGL.Text = result1
              Me.TXTTGLMASUK.Text = "Date: " & result1
              'Me.TXTTOTAL.Text = dr("TOTAL_HARGA").ToString
            End If
          End Using
        End Using
      End Using
    Catch ex As Exception
      Response.Write(ex.Message)
    End Try
  End Sub

  Protected Sub BTLOGOUT_Click(sender As Object, e As EventArgs)
    Session.Abandon()
    Session.Clear()
    Response.Redirect("~/account/Login.aspx?next-url=~/Default.aspx", True)
  End Sub

  Private sumFooterValue As Decimal = 0

  Protected Sub GVBARANG_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
    If e.Row.RowType = DataControlRowType.DataRow Then
      Dim cell As TableCell = e.Row.Cells(6)

      'Dim sponsorBonus As String = (CType(e.Row.FindControl("Label2"), Label)).Text
      'Dim pairingBonus As String = (CType(e.Row.FindControl("Label3"), Label)).Text
      'Dim staticBonus As String = (CType(e.Row.FindControl("Label4"), Label)).Text
      'Dim leftBonus As String = (CType(e.Row.FindControl("Label5"), Label)).Text
      'Dim rightBonus As String = (CType(e.Row.FindControl("Label6"), Label)).Text
      Dim totalvalue As Decimal = e.Row.Cells(6).Text ' Convert.ToDecimal(sponsorBonus) + Convert.ToDecimal(pairingBonus) + Convert.ToDecimal(staticBonus) + Convert.ToDecimal(leftBonus) + Convert.ToDecimal(rightBonus)
      'e.Row.Cells(6).Text = totalvalue.ToString()
      sumFooterValue += totalvalue
    End If
    Me.TXTTOTAL.Text = String.Format("{0:C2}", sumFooterValue)
    'If e.Row.RowType = DataControlRowType.Footer Then
    '  'Dim lbl As Label = CType(e.Row.FindControl("lblTotal"), Label)
    '  Me.TXTTOTAL.Text = sumFooterValue.ToString()
    'End If
  End Sub
End Class
