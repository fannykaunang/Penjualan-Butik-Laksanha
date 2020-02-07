
Imports System.Data
Imports System.Data.SqlClient

Partial Class kasir_reports_invoice_penjualan
  Inherits System.Web.UI.Page

  Private Sub kasir_reports_invoice_penjualan_Load(sender As Object, e As EventArgs) Handles Me.Load
    If Not (Me.Page.IsPostBack) Then
      If Session("KODE_USER") IsNot Nothing Then
        Me.GET_USERS(Session("KODE_USER").ToString)
        Me.GET_BIND_GRID()
        Me.GET_INVOICE_DETAILS(Me.Page.Request.QueryString("inv"))
      Else
        Response.Redirect("~/account/Login.aspx?next-url=~/kasir/reports/invoice-penjualan.aspx", True)
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
    Dim strQuery As String = "SELECT * FROM VW_PENJUALAN WHERE INVOICE_PENJUALAN = @INVOICE_PENJUALAN"

    Using cmd As SqlCommand = New SqlCommand(strQuery)
      cmd.Parameters.AddWithValue("@INVOICE_PENJUALAN", Me.Page.Request.QueryString("inv"))
      Me.GVBARANG.DataSource = Me.GetData(cmd)
      Me.GVBARANG.DataBind()
      'Me.UpdatePanel1.Update()
    End Using
  End Sub

  Private Sub GET_INVOICE_DETAILS(INVOICE As String)
    Try
      Using connect As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString)
        Dim str As String = "SELECT * FROM VW_PENJUALAN WHERE INVOICE_PENJUALAN=@INVOICE_PENJUALAN"
        Using cmd As New SqlCommand(str, connect)

          With cmd
            .Parameters.Add("@INVOICE_PENJUALAN", SqlDbType.VarChar).Value = INVOICE
            .CommandType = CommandType.Text
            .CommandText = str
            .Connection = connect
            .Connection.Open()
          End With

          Using dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            If dr.HasRows Then
              Dim dt1 As DateTime = dr("TANGGAL_PENJUALAN").ToString
              Dim result1 As String = String.Format("{0:dd/MM/yyyy}", dt1)

              Me.TXTINVOICE.Text = dr("INVOICE_PENJUALAN").ToString
              Me.TXTKASIR.Text = dr("NAMA_USER").ToString
              Me.TXTKONSUMEN.Text = dr("NAMA_KONSUMEN").ToString
              Me.TXTKONSUMENALAMAT.Text = dr("ALAMAT").ToString
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
      Dim totalvalue As Decimal = e.Row.Cells(6).Text ' Convert.ToDecimal(sponsorBonus) + Convert.ToDecimal(pairingBonus) + Convert.ToDecimal(staticBonus) + Convert.ToDecimal(leftBonus) + Convert.ToDecimal(rightBonus)
      sumFooterValue += totalvalue
    End If
    Me.TXTTOTAL.Text = String.Format("{0:C2}", sumFooterValue)
  End Sub

End Class
