
Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Globalization
Imports System.IO
Imports System.Web.Services
Imports QRCoder

Partial Class kasir_input_Barang
  Inherits System.Web.UI.Page

  Private Sub kasir_input_Barang_Load(sender As Object, e As EventArgs) Handles Me.Load
    If Not (Me.Page.IsPostBack) Then
      If Session("KODE_USER") IsNot Nothing Then
        Me.GET_USERS(Session("KODE_USER").ToString)

        If Request.QueryString("KODE_BARANG") = String.Empty Then

          Me.GET_BIND_GRID_SPAREPART()
          GenerateBarcode()
          Me.TXTFAKTUR.Attributes.Add("placeholder", "Masukkan Nomor Faktur. Field ini wajib diisi!.")
          Me.TXTTGLPENERIMAAN.Attributes.Add("placeholder", "Masukkan Tanggal Penerimaan. Field ini wajib diisi!.")
          Me.TXTTOTALBAYAR.Attributes.Add("placeholder", "Masukkan Total Pembayaran. Field ini wajib diisi!.")
          Me.TXTSEARCH.Attributes.Add("placeholder", "Masukkan Nama Barang disini.")
        Else
          'Me.GET_BIND_GRID()
          'Me.GET_PICTURE_USER(Session("ID_USER").ToString)
          'Me.HFKODE_BERITA.Value = Page.Request.QueryString("KODE_BERITA")
          Me.GET_BARANG(Page.Request.QueryString("KODE_BARANG"))
          'Me.BTSIMPAN.Attributes.Add("type", "submit")
          'Me.LBCOUNTBERITA.Text = Me.GetAllData("SELECT * FROM T_BERITA WHERE PUBLISH=0").Rows.Count & " berita"
          'Me.LBCOUNTGALERI.Text = Me.GetAllData("SELECT * FROM T_GALERI WHERE PUBLISH=0").Rows.Count & " galeri"
          'Me.BuildDDDL()
        End If

        'Me.GET_USERS(Session("KODE_USER").ToString)

        'Me.GET_BIND_GRID_SPAREPART()
        'GenerateBarcode()
        'Me.TXTFAKTUR.Attributes.Add("placeholder", "Masukkan Nomor Faktur. Field ini wajib diisi!.")
        'Me.TXTTGLPENERIMAAN.Attributes.Add("placeholder", "Masukkan Tanggal Penerimaan. Field ini wajib diisi!.")
        'Me.TXTTOTALBAYAR.Attributes.Add("placeholder", "Masukkan Total Pembayaran. Field ini wajib diisi!.")
        'Me.TXTSEARCH.Attributes.Add("placeholder", "Masukkan Nama Barang disini.")
      Else
        Response.Redirect("~/account/Login.aspx?next-url=~/kasir/input/Barang.aspx", True)
      End If
    End If
  End Sub

  Private Sub GET_BARANG(KODE_BARANG As String)
    Try
      Using connect As New SqlConnection(ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString)
        Dim str As String = "SELECT * FROM VW_BARANG WHERE KODE_BARANG=@KODE_BARANG"
        Using cmd As New SqlCommand(str, connect)

          With cmd
            .Parameters.Add("@KODE_BARANG", SqlDbType.VarChar).Value = KODE_BARANG
            .CommandType = CommandType.Text
            .CommandText = str
            .Connection = connect
            .Connection.Open()
          End With

          Using dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            If dr.HasRows Then
              'Dim dt As DateTime = dr("TANGGAL").ToString
              'dt.ToString("MM/dd/yyyy", CultureInfo.InvariantCulture)
              Me.TXTKDBARANG.Text = dr("KODE_BARANG").ToString
              Me.TXTNAMABARANG.Text = dr("NAMA_BARANG").ToString
              Me.TXTHARGAJUAL.Text = dr("HARGA_JUAL").ToString
              Me.TXTUKURAN.SelectedValue = dr("UKURAN").ToString
              Me.TXTKATEGORI.SelectedValue = dr("KATEGORI_BARANG").ToString
              'Me.TXTGAMBARFILEPATH.Text = dr("GAMBAR_FILEPATH_BERITA").ToString
              'Me.CHKPUBLISH.Checked = Convert.ToBoolean(dr("PUBLISH"))
            End If
          End Using
        End Using
      End Using
    Catch ex As Exception
      Response.Write(ex.Message)
    End Try
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
        cmd.CommandText = "SELECT KODE_PENERIMAAN, KODE_BARANG, NAMA_BARANG, STOK, HARGA_BELI, KATEGORI_BARANG, NAMA_SUPPLIER, NAMA_USER, TANGGAL_MASUK, HARGA_JUAL, GAMBAR_FILEPATH FROM VW_PENERIMAAN WHERE KODE_BARANG = @SearchText"
        cmd.Parameters.AddWithValue("@SearchText", KDBARANG)
        cmd.Connection = conn
        conn.Open()
        Using sdr As SqlDataReader = cmd.ExecuteReader()
          While sdr.Read()
            customers.Add(String.Format("{0}-{1}-{2}-{3}-{4}-{5}-{6}-{7}-{8}-{9}-{10}", sdr("KODE_PENERIMAAN"), sdr("KODE_BARANG"), sdr("NAMA_BARANG"), sdr("STOK"),
                                        sdr("HARGA_BELI"), sdr("KATEGORI_BARANG"), sdr("NAMA_SUPPLIER"), sdr("NAMA_USER"), sdr("TANGGAL_MASUK"),
                                        sdr("HARGA_JUAL"), sdr("GAMBAR_FILEPATH")))
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
  Public Shared Function GET_KDBARANG(KDBARANG As String) As String()
    Dim customers As New List(Of String)()

    Using conn As New SqlConnection()
      conn.ConnectionString = ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString
      Using cmd As New SqlCommand()
        cmd.CommandText = "SELECT KODE_BARANG FROM VW_BARANG WHERE KODE_BARANG = @SearchText"
        cmd.Parameters.AddWithValue("@SearchText", KDBARANG)
        cmd.Connection = conn
        conn.Open()
        Using sdr As SqlDataReader = cmd.ExecuteReader()
          While sdr.Read()
            customers.Add(sdr("KODE_BARANG").ToString)
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
  Protected Sub TXTKATEGORI_SelectedIndexChanged(sender As Object, e As EventArgs)
    Try
      Me.TXTKATEGORI.EnableViewState = False
      Using connect As New SqlConnection(ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString)
        Dim str As String = "SELECT * FROM T_KATEGORI WHERE KATEGORI_BARANG = @KATEGORI_BARANG"
        Using cmd As New SqlCommand(str, connect)

          With cmd
            .Parameters.Add("@KATEGORI_BARANG", SqlDbType.VarChar).Value = Me.TXTKATEGORI.SelectedValue
            .CommandType = CommandType.Text
            .CommandText = str
            .Connection = connect
            .Connection.Open()
          End With

          Using dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            If dr.HasRows Then
              Me.TXTIDKATEGORI.Value = dr("KODE_KATEGORI").ToString
              Me.LBINFOKATEGORI.Text = String.Empty
            End If
          End Using
        End Using
      End Using
    Catch ex As Exception
      Response.Write(ex.Message)
    End Try
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
        cmd.Parameters.AddWithValue("@KODE_USER", 1) ' HttpContext.Current.Session(""))
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
  Protected Sub BTBARCODE_Click(sender As Object, e As EventArgs)
    Me.GenerateBarcode()
    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Pop", "animateBarcode();", True)
  End Sub

  Private Shared random As Random = New Random()
  Public Shared Function RandomString(ByVal length As Integer) As String
    Const chars As String = "0123456789"
    Return New String(Enumerable.Repeat(chars, length).[Select](Function(s) s(random.[Next](s.Length))).ToArray())
  End Function

  Private Sub GenerateBarcode()
    Dim code As String = RandomString(12)
    Dim qrGenerator As New QRCodeGenerator()
    Dim qrCode As QRCodeGenerator.QRCode = qrGenerator.CreateQrCode(code, QRCodeGenerator.ECCLevel.Q)
    Dim imgBarCode As New WebControls.Image With {
      .Height = 150,
      .Width = 150
    }
    Using bitMap As Bitmap = qrCode.GetGraphic(20)
      Using ms As New MemoryStream()
        bitMap.Save(ms, ImageFormat.Png)
        Dim byteImage As Byte() = ms.ToArray()
        imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage)

        Dim img As Image = Image.FromStream(ms)
        Dim folderPath As String = Server.MapPath("~/build/barcode/")
        Dim fileName As String = code & ".png"
        Dim imagePath As String = folderPath & fileName
        img.Save(imagePath, ImageFormat.Png)

        Me.LBBARCODE.Text = code
      End Using
      plBarCode.Controls.Add(imgBarCode)
    End Using
  End Sub

  Protected Sub BTSIMPAN_Click(sender As Object, e As EventArgs)
    Dim initialString As String = Me.TXTHARGAJUAL.Text
    Dim nonNumericCharacters As New Regex("\D")
    Dim numericOnlyString As String = nonNumericCharacters.Replace(initialString, String.Empty)

    Dim strQuery As String = "INSERT INTO T_BARANG " &
"VALUES(@KODE_BARANG, @NAMA_BARANG, @HARGA_JUAL, @UKURAN, @KODE_KATEGORI, @BARCODE_ID, @BARCODE_FILEPATH, @GAMBAR_FILENAME, @GAMBAR_FILEPATH)"

    Dim constr As String = ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString
    Using con As New SqlConnection(constr)
      Using cmd As New SqlCommand(strQuery)
        cmd.CommandType = CommandType.Text

        cmd.Parameters.AddWithValue("@KODE_BARANG", Me.TXTKDBARANG.Text.Replace("-", String.Empty))
        cmd.Parameters.AddWithValue("@NAMA_BARANG", Me.TXTNAMABARANG.Text.Replace("-", String.Empty))
        cmd.Parameters.AddWithValue("@HARGA_JUAL", numericOnlyString.ToString)
        cmd.Parameters.AddWithValue("@UKURAN", Me.TXTUKURAN.Text)
        cmd.Parameters.AddWithValue("@KODE_KATEGORI", Me.TXTIDKATEGORI.Value) ' HttpContext.Current.Session(""))
        cmd.Parameters.AddWithValue("@BARCODE_ID", Me.LBBARCODE.Text)
        cmd.Parameters.AddWithValue("@BARCODE_FILEPATH", "~/build/barcode/")
        cmd.Parameters.AddWithValue("@GAMBAR_FILENAME", Me.FUUPLOAD.FileName.Replace("-", "_"))
        cmd.Parameters.AddWithValue("@GAMBAR_FILEPATH", "~/build/imgUpload/")
        'JIKA BERHASIL SIMPAN, REDIRECT KE success.aspx?PreviousPage=Barang.aspx
        'BIKIN Parameter DI success.aspx BERDASARKAN URL YG DI REQUEST
        cmd.Connection = con
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
        Me.FUUPLOAD.SaveAs(Server.MapPath("~/build/imgUpload/" & Me.FUUPLOAD.FileName))
        Response.Redirect("~/kasir/message/success.aspx?PreviousPage=Barang.aspx&nama_barang=" & Me.TXTNAMABARANG.Text)
      End Using
    End Using
  End Sub
End Class
