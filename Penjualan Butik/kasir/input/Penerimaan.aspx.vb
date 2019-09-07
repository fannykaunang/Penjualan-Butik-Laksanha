Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Services
Imports System.Globalization
Imports System.Net
Imports System.Web.Script.Serialization
Imports System.IO

Partial Class kasir_input_Penerimaan
  Inherits System.Web.UI.Page

  Private Sub kasir_input_Penerimaan_Load(sender As Object, e As EventArgs) Handles Me.Load
    If Not (Me.Page.IsPostBack) Then
      If Session("KODE_USER") IsNot Nothing Then
        Me.GET_USERS(Session("KODE_USER"))

        Me.SetInitialRow()
        NOMOR_OTOMATIS()
        'Me.TXTIDFAKTUR.Value = Me.NOMOR_OTOMATIS_FAKTUR
        Me.GET_BIND_GRID_SPAREPART()

        Me.TXTFAKTUR.Attributes.Add("placeholder", "Masukkan Nomor Faktur. Field ini wajib diisi!.")
        Me.TXTTGLPENERIMAAN.Attributes.Add("placeholder", "Masukkan Tanggal Penerimaan Sparepart. Field ini wajib diisi!.")
        Me.TXTTOTALBAYAR.Attributes.Add("placeholder", "Masukkan Total Pembayaran. Field ini wajib diisi!.")
        Me.TXTSEARCH.Attributes.Add("placeholder", "Masukkan Nama Barang disini.")
      Else
        Response.Redirect("~/account/Login.aspx?next-url=~/kasir/input/Penerimaan.aspx", True)
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
              Me.imgUser.ImageUrl = dr("FOTO_FILEPATH").ToString
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

  Private Sub GET_BIND_GRID_SPAREPART()
    Dim strQuery As String = "SELECT * FROM VW_BARANG"

    Using cmd As SqlCommand = New SqlCommand(strQuery)
      Me.GVBARANG.DataSource = Me.GetData(cmd)
      Me.GVBARANG.DataBind()
      'Me.UpdatePanel1.Update()
      Me.TXTTOTALSPAREPART.Text = "JUMLAH DATA = " & Me.GetData(cmd).Rows.Count
    End Using
  End Sub

  Protected Sub GVBARANG_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
    Me.GVBARANG.PageIndex = e.NewPageIndex
    Me.GET_BIND_GRID_SPAREPART()
    Me.GVBARANG.DataBind()
    Me.UpdatePanel1.UpdateMode = UpdatePanelUpdateMode.Always
    Me.UpdatePanel1.ChildrenAsTriggers = True
    'Me.UpdatePanel1.Update()
  End Sub

  Private Shared Function NOMOR_OTOMATIS() As String
    Using connect As New SqlConnection(ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString)
      Dim str As String = "DECLARE @NEWID VARCHAR ='0'; WITH CTE AS(SELECT (ABS(CHECKSUM(NEWID()))) AS RowCounts) SELECT 'PN/' + CAST(DATEPART(DAY,GETDATE()) AS VARCHAR(2)) + '/' + RIGHT ('00' + CAST(MONTH(GETDATE()) AS VARCHAR),(2)) + '/' + CAST(YEAR(GETDATE()) AS VARCHAR(4)) + '/' + CAST((SELECT MAX((RowCounts)) FROM CTE) AS VARCHAR)"
      Using cmd As New SqlCommand(str, connect)

        With cmd
          .CommandType = CommandType.Text
          .CommandText = str
          .Connection = connect
          .Connection.Open()
        End With

        Using dr As SqlDataReader = cmd.ExecuteReader
          dr.Read()
          If dr.HasRows Then
            Return dr.GetValue(0)
          End If
          Return String.Empty
        End Using
      End Using
    End Using
  End Function

  Private Sub SetInitialRow()
    Dim dt As New DataTable()
    Dim dr As DataRow = Nothing
    dt = New DataTable()
    dt.Columns.Add(New DataColumn("RowNumber", GetType(String)))
    dt.Columns.Add(New DataColumn("Column1", GetType(String)))
    dt.Columns.Add(New DataColumn("Column2", GetType(String)))
    dt.Columns.Add(New DataColumn("Column3", GetType(String)))
    dt.Columns.Add(New DataColumn("Column4", GetType(String)))
    dt.Columns.Add(New DataColumn("Column5", GetType(String)))
    dt.Columns.Add(New DataColumn("Column6", GetType(String)))
    dt.Columns.Add(New DataColumn("Column7", GetType(String)))
    dt.Columns.Add(New DataColumn("Column8", GetType(String)))

    dr = dt.NewRow()

    dr("RowNumber") = 1
    dr("Column1") = 0
    dr("Column2") = 0
    dr("Column3") = 0
    dr("Column4") = 0
    dr("Column5") = 0
    dr("Column6") = 0
    dr("Column7") = 0
    dr("Column8") = 0

    dt.Rows.Add(dr)

    Me.ViewState("CurrentTable") = dt

    Me.Gridview1.DataSource = dt
    Me.Gridview1.DataBind()
    'Me.SetBindGrid()
    Me.HFIDXSPAREPART.Value = dt.Rows.Count - 1
    Dim rowIndex As Integer = 0
    'For i As Integer = 1 To dt.Rows.Count
    '  Dim BTDELETE As LinkButton = DirectCast(Me.Gridview1.Rows(rowIndex).Cells(1).FindControl("BTDELETE"), LinkButton)
    '  BTDELETE.Visible = dt.Rows.Count - 1
    'Next
  End Sub

  Private Sub AddNewRowToGrid()
    Dim rowIndex As Integer = 0

    If Me.ViewState("CurrentTable") IsNot Nothing Then
      Dim dtCurrentTable As DataTable = DirectCast(ViewState("CurrentTable"), DataTable)
      Dim drCurrentRow As DataRow = Nothing
      If dtCurrentTable.Rows.Count > 0 Then
        For i As Integer = 1 To dtCurrentTable.Rows.Count
          'extract the TextBox values
          Dim box1 As Label = DirectCast(Me.Gridview1.Rows(rowIndex).Cells(2).FindControl("TXTINFOSPAREPART"), Label)
          Dim box2 As TextBox = DirectCast(Me.Gridview1.Rows(rowIndex).Cells(3).FindControl("TextBox2"), TextBox)
          Dim box3 As TextBox = DirectCast(Me.Gridview1.Rows(rowIndex).Cells(4).FindControl("TextBox3"), TextBox)
          Dim box4 As TextBox = DirectCast(Me.Gridview1.Rows(rowIndex).Cells(5).FindControl("TextBox4"), TextBox)
          Dim box5 As TextBox = DirectCast(Me.Gridview1.Rows(rowIndex).Cells(6).FindControl("TextBox5"), TextBox)
          Dim box6 As TextBox = DirectCast(Me.Gridview1.Rows(rowIndex).Cells(7).FindControl("TextBox6"), TextBox)
          Dim box7 As TextBox = DirectCast(Me.Gridview1.Rows(rowIndex).Cells(8).FindControl("TextBox7"), TextBox)
          Dim box8 As TextBox = DirectCast(Me.Gridview1.Rows(rowIndex).Cells(9).FindControl("TextBox8"), TextBox)

          drCurrentRow = dtCurrentTable.NewRow()
          drCurrentRow("RowNumber") = i + 1

          dtCurrentTable.Rows(i - 1)("Column1") = box1.Text
          dtCurrentTable.Rows(i - 1)("Column2") = box2.Text
          dtCurrentTable.Rows(i - 1)("Column3") = box3.Text
          dtCurrentTable.Rows(i - 1)("Column4") = box4.Text
          dtCurrentTable.Rows(i - 1)("Column5") = box5.Text
          dtCurrentTable.Rows(i - 1)("Column6") = box6.Text
          dtCurrentTable.Rows(i - 1)("Column7") = box7.Text
          dtCurrentTable.Rows(i - 1)("Column8") = box8.Text

          rowIndex += 1
        Next
        dtCurrentTable.Rows.Add(drCurrentRow)
        ViewState("CurrentTable") = dtCurrentTable

        Me.Gridview1.DataSource = dtCurrentTable
        Me.Gridview1.DataBind()

      End If
    Else
      Me.Label5.Text = ("ViewState is null")
    End If

    'Set Previous Data on Postbacks
    Me.SetPreviousData()
  End Sub

  Private Sub SetPreviousData()
    Dim rowIndex As Integer = 0
    If ViewState("CurrentTable") IsNot Nothing Then
      Dim dt As DataTable = DirectCast(ViewState("CurrentTable"), DataTable)
      If dt.Rows.Count > 0 Then
        For i As Integer = 0 To dt.Rows.Count - 1
          Dim box1 As Label = DirectCast(Me.Gridview1.Rows(rowIndex).Cells(2).FindControl("TXTINFOSPAREPART"), Label)
          Dim box2 As TextBox = DirectCast(Me.Gridview1.Rows(rowIndex).Cells(3).FindControl("TextBox2"), TextBox)
          Dim box3 As TextBox = DirectCast(Me.Gridview1.Rows(rowIndex).Cells(4).FindControl("TextBox3"), TextBox)
          Dim box4 As TextBox = DirectCast(Me.Gridview1.Rows(rowIndex).Cells(5).FindControl("TextBox4"), TextBox)
          Dim box5 As TextBox = DirectCast(Me.Gridview1.Rows(rowIndex).Cells(6).FindControl("TextBox5"), TextBox)
          Dim box6 As TextBox = DirectCast(Me.Gridview1.Rows(rowIndex).Cells(7).FindControl("TextBox6"), TextBox)
          Dim box7 As TextBox = DirectCast(Me.Gridview1.Rows(rowIndex).Cells(8).FindControl("TextBox7"), TextBox)
          Dim box8 As TextBox = DirectCast(Me.Gridview1.Rows(rowIndex).Cells(9).FindControl("TextBox8"), TextBox)

          box1.Text = dt.Rows(i)("Column1").ToString()
          box2.Text = dt.Rows(i)("Column2").ToString()
          box3.Text = dt.Rows(i)("Column3").ToString()
          box4.Text = dt.Rows(i)("Column4").ToString()
          box5.Text = dt.Rows(i)("Column5").ToString()
          box6.Text = dt.Rows(i)("Column6").ToString()
          box7.Text = dt.Rows(i)("Column7").ToString()
          box8.Text = dt.Rows(i)("Column8").ToString()

          rowIndex += 1
        Next
      End If
    End If
  End Sub

  Protected Sub Gridview1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
    Dim index As Integer = Convert.ToInt32(e.RowIndex)
    Dim dt As DataTable = TryCast(ViewState("CurrentTable"), DataTable)

    dt.Rows(index).Delete()

    dt.AcceptChanges()
    ViewState("CurrentTable") = dt

    Me.Gridview1.DataSource = TryCast(ViewState("CurrentTable"), DataTable)
    Me.Gridview1.DataBind()
    'Me.SetBindGrid()

    Me.SetPreviousData()

    If dt.Rows.Count = 0 Then
      Me.BTREFRESH.Visible = True
      Me.BTINSERTDATATABLE.Visible = Not Me.BTREFRESH.Visible
    End If
  End Sub

  Protected Sub BTREFRESH_Click(sender As Object, e As EventArgs)
    Dim dt As DataTable = TryCast(ViewState("CurrentTable"), DataTable)

    Me.SetInitialRow()

    Me.BTREFRESH.Visible = Not dt.Rows.Count - 1
  End Sub

  Protected Sub LinkButton1_Click(sender As Object, e As EventArgs)
    Response.Redirect("~/kasir/input/Penerimaan.aspx")
    'SendNotification("eu52podTnZo:APA91bEGXiYoyrlIZH5Qe67I_RG8e4CoS3cU-AV2XFFofc-RUvHB8n9UUp64tuVYFssXKwJIA737yo5vD7a2vj27mAlu57uVsGGhSyR6hKe4sbtl1ujOwGMO--P2GJ86splYGBR_4DeD", "Penjualan Butik", "Jumlah penerimaan barang hari ini ")
  End Sub

  <WebMethod()>
  Public Shared Function GET_STOK_BARANG(KDBARANG As String) As String()
    Dim customers As New List(Of String)()
    Using conn As New SqlConnection()
      conn.ConnectionString = ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString
      Using cmd As New SqlCommand()
        cmd.CommandText = "SELECT KODE_PENERIMAAN, KODE_BARANG, NAMA_BARANG, STOK, HARGA_BELI FROM VW_PENERIMAAN WHERE KODE_BARANG = @SearchText"
        cmd.Parameters.AddWithValue("@SearchText", KDBARANG)
        cmd.Connection = conn
        conn.Open()
        Using sdr As SqlDataReader = cmd.ExecuteReader()
          While sdr.Read()
            customers.Add(String.Format("{0}-{1}-{2}-{3}-{4}", sdr("KODE_PENERIMAAN"), sdr("KODE_BARANG"), sdr("NAMA_BARANG"), sdr("STOK"), sdr("HARGA_BELI")))
          End While
        End Using
        conn.Close()
      End Using
    End Using
    Return customers.ToArray()
  End Function

  <WebMethod()>
  Public Shared Function GET_DETAIL_BARANG(KDBARANG As String) As String()
    Dim customers As New List(Of String)()
    Using conn As New SqlConnection()
      conn.ConnectionString = ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString
      Using cmd As New SqlCommand()
        cmd.CommandText = "SELECT KODE_PENERIMAAN, KODE_BARANG, NAMA_BARANG, STOK, HARGA_BELI, KATEGORI_BARANG, NAMA_SUPPLIER, NAMA_USER, TANGGAL_MASUK, HARGA_JUAL, GAMBAR_FILENAME, GAMBAR_FILEPATH FROM VW_PENERIMAAN WHERE ID_BARANG = @SearchText"
        cmd.Parameters.AddWithValue("@SearchText", KDBARANG)
        cmd.Connection = conn
        conn.Open()
        Using sdr As SqlDataReader = cmd.ExecuteReader()
          While sdr.Read()
            customers.Add(String.Format("{0}-{1}-{2}-{3}-{4}-{5}-{6}-{7}-{8}-{9}-{10}-{11}", sdr("KODE_PENERIMAAN"), sdr("KODE_BARANG"), sdr("NAMA_BARANG"), sdr("STOK"),
                                        sdr("HARGA_BELI"), sdr("KATEGORI_BARANG"), sdr("NAMA_SUPPLIER"), sdr("NAMA_USER"), sdr("TANGGAL_MASUK"),
                                        sdr("HARGA_JUAL"), sdr("GAMBAR_FILENAME"), sdr("GAMBAR_FILEPATH")))
          End While
        End Using
        conn.Close()
      End Using
    End Using
    Return customers.ToArray()
  End Function

  <WebMethod>
  Public Shared Function GET_STOCK(KDBARANG As String) As String()
    Dim customers As New List(Of String)()

    Using conn As New SqlConnection()
      conn.ConnectionString = ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString
      Using cmd As New SqlCommand()
        cmd.CommandText = "SELECT STOK FROM VW_PENERIMAAN WHERE KODE_BARANG = @SearchText"
        cmd.Parameters.AddWithValue("@SearchText", KDBARANG)
        cmd.Connection = conn
        conn.Open()
        Using sdr As SqlDataReader = cmd.ExecuteReader()
          While sdr.Read()
            customers.Add(sdr("STOK").ToString)
          End While
        End Using
        conn.Close()
      End Using
    End Using
    Return customers.ToArray()
  End Function

  <WebMethod>
  Public Shared Function GET_HARGA_BELI(KDBARANG As String) As String()
    Dim customers As New List(Of String)()

    Using conn As New SqlConnection()
      conn.ConnectionString = ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString
      Using cmd As New SqlCommand()
        cmd.CommandText = "SELECT HARGA_BELI FROM VW_PENERIMAAN WHERE KODE_BARANG = @SearchText"
        cmd.Parameters.AddWithValue("@SearchText", KDBARANG)
        cmd.Connection = conn
        conn.Open()
        Using sdr As SqlDataReader = cmd.ExecuteReader()
          While sdr.Read()
            customers.Add(sdr("HARGA_BELI").ToString)
          End While
        End Using
        conn.Close()
      End Using
    End Using
    Return customers.ToArray()
  End Function

  <WebMethod>
  Public Shared Function GET_FAKTUR(INVOICE_PENERIMAAN As String) As String()
    Dim customers As New List(Of String)()

    Using conn As New SqlConnection()
      conn.ConnectionString = ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString
      Using cmd As New SqlCommand()
        cmd.CommandText = "SELECT INVOICE_PENERIMAAN FROM VW_PENERIMAAN WHERE INVOICE_PENERIMAAN = @SearchText"
        cmd.Parameters.AddWithValue("@SearchText", INVOICE_PENERIMAAN)
        cmd.Connection = conn
        conn.Open()
        Using sdr As SqlDataReader = cmd.ExecuteReader()
          While sdr.Read()
            customers.Add(sdr("INVOICE_PENERIMAAN").ToString)
          End While
        End Using
        conn.Close()
      End Using
    End Using
    Return customers.ToArray()
  End Function

  Protected Sub BTBATAL_Click(sender As Object, e As EventArgs)
    Me.Response.Redirect(Me.Request.Url.AbsoluteUri)
    'SendNotification("eu52podTnZo:APA91bEGXiYoyrlIZH5Qe67I_RG8e4CoS3cU-AV2XFFofc-RUvHB8n9UUp64tuVYFssXKwJIA737yo5vD7a2vj27mAlu57uVsGGhSyR6hKe4sbtl1ujOwGMO--P2GJ86splYGBR_4DeD", "Penjualan Butik", "Jumlah penerimaan barang hari ini ")
  End Sub
  Protected Sub TXTSUPPLIER_SelectedIndexChanged(sender As Object, e As EventArgs)
    Try
      Me.TXTSUPPLIER.EnableViewState = False
      Using connect As New SqlConnection(ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString)
        Dim str As String = "SELECT * FROM T_SUPPLIER WHERE NAMA_SUPPLIER = @NAMA_SUPPLIER"
        Using cmd As New SqlCommand(str, connect)

          With cmd
            .Parameters.Add("@NAMA_SUPPLIER", SqlDbType.VarChar).Value = Me.TXTSUPPLIER.SelectedValue
            .CommandType = CommandType.Text
            .CommandText = str
            .Connection = connect
            .Connection.Open()
          End With

          Using dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            If dr.HasRows Then
              Me.TXTIDSUPPLIER.Value = dr("KODE_SUPPLIER").ToString
              Me.LBINFOSUPPLIER.Text = String.Empty
            End If
          End Using
        End Using
      End Using
    Catch ex As Exception
      Response.Write(ex.Message)
    End Try
  End Sub

  'Private Sub SurroundingSub()
  '  imageUrl = _Product.IconUrl
  '  profileImage.Attributes("onerror") = "this.src='http://www.cs.uofs.edu/~olivetoj2/blah.jpg';"
  '  Dim tmp As String = imageUrl
  '  tmp = tmp.Substring(2, tmp.Length - 2)
  '  tmp = tmp.Replace("/", """);", String, CSharpImpl.__Assign(filePath, HttpRuntime.AppDomainAppPath + imageUrl))
  '  If Not File.Exists(filePath) Then imageUrl = "http://www.safetekusa.com/shopping/images/redx.gif"
  'End Sub

  Protected Sub GVBARANG_RowDataBound(sender As Object, e As GridViewRowEventArgs)
    If e.Row.RowType = DataControlRowType.DataRow Then
      Dim img1 As Image = DirectCast(e.Row.FindControl("LbFilePath"), Image)
      Dim img2 As Image = DirectCast(e.Row.FindControl("LbFilePath2"), Image)
      img1.Attributes("onerror") = "this.src='../../dist/img/No_Image-128.png';"
      'Dim imgFilePath As String = img1.ImageUrl


      If System.IO.File.Exists(img1.ImageUrl) = True Then
        'If img1.ImageUrl = String.Empty Then
        img1.Visible = False
        img2.Visible = True
      Else
        img2.Visible = False
        img1.Visible = True
      End If
      'End If
    End If
  End Sub

  <WebMethod()>
  Public Shared Function GET_INSERT_DATA(INVOICE_PENERIMAAN As String, ID_BARANG As Integer, KODE_SUPPLIER As Integer, TANGGAL_MASUK As String,
                                                          JUMLAH_MASUK As Integer, STOK As Integer, HARGA_BELI As Double, TOTAL_HARGA As String,
                                                          KETERANGAN As String) As Integer

    Dim timeString As String = TANGGAL_MASUK
    Dim culture As IFormatProvider = New CultureInfo("id-ID", True)
    Dim dateVal As Date = Date.ParseExact(timeString, "dd/mm/yyyy", culture)

    Dim initialString As String = TOTAL_HARGA
    Dim nonNumericCharacters As New System.Text.RegularExpressions.Regex("\D")
    Dim numericOnlyString As String = nonNumericCharacters.Replace(initialString, String.Empty)

    Dim strQuery As String = "[dbo].[SP_UPDATE_STOK_PENERIMAAN]"

    Dim constr As String = ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString
    Using con As New SqlConnection(constr)
      Using cmd As New SqlCommand(strQuery)
        cmd.CommandType = CommandType.StoredProcedure

        cmd.Parameters.AddWithValue("@ID_BARANG", ID_BARANG)
        cmd.Parameters.AddWithValue("@INVOICE_PENERIMAAN", INVOICE_PENERIMAAN)
        cmd.Parameters.AddWithValue("@KODE_SUPPLIER", KODE_SUPPLIER)
        cmd.Parameters.AddWithValue("@KODE_USER", HttpContext.Current.Session("KODE_USER"))
        cmd.Parameters.AddWithValue("@TANGGAL_MASUK", dateVal)
        cmd.Parameters.AddWithValue("@JUMLAH_MASUK", JUMLAH_MASUK)
        cmd.Parameters.AddWithValue("@STOK", STOK)
        cmd.Parameters.AddWithValue("@HARGA_BELI", HARGA_BELI)
        cmd.Parameters.AddWithValue("@TOTAL_HARGA", numericOnlyString.ToString)
        cmd.Parameters.AddWithValue("@PERIODE", DateTime.Now.ToString("MMMM") & ", " & Date.Now.Year)
        cmd.Parameters.AddWithValue("@KETERANGAN", KETERANGAN)

        cmd.Connection = con
        con.Open()
        Dim customerId As Integer = Convert.ToInt32(cmd.ExecuteNonQuery())
        con.Close()
        Return customerId

      End Using
    End Using
  End Function

  Protected Sub Button1_Click(sender As Object, e As EventArgs)

  End Sub

  Protected Sub TXTSEARCH_TextChanged(sender As Object, e As EventArgs)
    Me.GET_SEARCH(Me.TXTSEARCH.Text)
  End Sub

  Private Sub GET_SEARCH(search As String)
    Dim strQuery As String = "SELECT * FROM [VW_BARANG] WHERE NAMA_BARANG LIKE @p1 ORDER BY NAMA_BARANG"

    Using cmd As SqlCommand = New SqlCommand(strQuery)
      cmd.Parameters.AddWithValue("@p1", "%" & search & "%")
      Me.GVBARANG.DataSource = GetData(cmd)
      Me.GVBARANG.DataBind()
      Me.GVBARANG.PageSize = 10
    End Using
  End Sub

  Protected Sub BTLOGOUT_Click(sender As Object, e As EventArgs)
    Session.Abandon()
    Session.Clear()
    Response.Redirect("~/account/Login.aspx?next-url=~/Default.aspx", True)
  End Sub

End Class
