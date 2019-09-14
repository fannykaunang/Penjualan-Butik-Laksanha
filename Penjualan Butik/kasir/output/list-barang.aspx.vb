
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Services

Partial Class kasir_output_list_barang
  Inherits System.Web.UI.Page

  Private Sub kasir_output_list_barang_Load(sender As Object, e As EventArgs) Handles Me.Load
    If Not (Me.Page.IsPostBack) Then
      If Session("KODE_USER") IsNot Nothing Then
        Me.GET_USERS(Session("KODE_USER").ToString)

        Me.GET_BIND_GRID()

      Else
        Response.Redirect("~/account/Login.aspx?next-url=~/kasir/output/list-barang.aspx", True)
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
    Dim strQuery As String = "SELECT * FROM VW_PENERIMAAN"

    Using cmd As SqlCommand = New SqlCommand(strQuery)
      Me.GVBARANG.DataSource = Me.GetData(cmd)
      Me.GVBARANG.DataBind()
      'Me.loadingImg.Style.Add("display", "none")
      'Me.UpdatePanel1.Update()
    End Using
  End Sub

  Protected Sub GVBARANG_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
    Me.GVBARANG.PageIndex = e.NewPageIndex
    Me.GET_BIND_GRID()
    Me.GVBARANG.DataBind()
    Me.UpdatePanel1.UpdateMode = UpdatePanelUpdateMode.Always
    Me.UpdatePanel1.ChildrenAsTriggers = True
    'Me.UpdatePanel1.Update()
  End Sub

  Protected Sub LinkButton1_Click(sender As Object, e As EventArgs)
    Response.Redirect("~/kasir/input/Penerimaan.aspx")
    'SendNotification("eu52podTnZo:APA91bEGXiYoyrlIZH5Qe67I_RG8e4CoS3cU-AV2XFFofc-RUvHB8n9UUp64tuVYFssXKwJIA737yo5vD7a2vj27mAlu57uVsGGhSyR6hKe4sbtl1ujOwGMO--P2GJ86splYGBR_4DeD", "Penjualan Butik", "Jumlah penerimaan barang hari ini ")
  End Sub

  Protected Sub BTBATAL_Click(sender As Object, e As EventArgs)
    Me.Response.Redirect(Me.Request.Url.AbsoluteUri)
    'SendNotification("eu52podTnZo:APA91bEGXiYoyrlIZH5Qe67I_RG8e4CoS3cU-AV2XFFofc-RUvHB8n9UUp64tuVYFssXKwJIA737yo5vD7a2vj27mAlu57uVsGGhSyR6hKe4sbtl1ujOwGMO--P2GJ86splYGBR_4DeD", "Penjualan Butik", "Jumlah penerimaan barang hari ini ")
  End Sub

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

  Protected Sub BTLOGOUT_Click(sender As Object, e As EventArgs)
    Session.Abandon()
    Session.Clear()
    Response.Redirect("~/account/Login.aspx?next-url=~/Default.aspx", True)
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
            End If
          End Using
        End Using
      End Using
    Catch ex As Exception
      Response.Write(ex.Message)
    End Try
  End Sub
  Protected Sub BTSIMPAN_Click(sender As Object, e As EventArgs)
    Dim initialString As String = Me.TXTHARGAJUAL.Text
    Dim nonNumericCharacters As New Regex("\D")
    Dim numericOnlyString As String = nonNumericCharacters.Replace(initialString, String.Empty)

    If FUUPLOAD.HasFile = True Then
      Dim strQuery As String = "UPDATE [T_BARANG] SET KODE_BARANG = @KODE_BARANG, NAMA_BARANG = @NAMA_BARANG, HARGA_JUAL = @HARGA_JUAL, " &
                    "UKURAN = @UKURAN, KODE_KATEGORI = @KODE_KATEGORI, GAMBAR_FILENAME = @GAMBAR_FILENAME, GAMBAR_FILEPATH = @GAMBAR_FILEPATH WHERE ID_BARANG = @ID_BARANG"

      Dim constr As String = ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString
      Using con As New SqlConnection(constr)
        Using cmd As New SqlCommand(strQuery)
          cmd.CommandType = CommandType.Text
          cmd.Parameters.AddWithValue("@ID_BARANG", Me.HFIDBARANG.Value)
          cmd.Parameters.AddWithValue("@KODE_BARANG", Me.TXTKDBARANG.Text)
          cmd.Parameters.AddWithValue("@NAMA_BARANG", Me.TXTNAMABARANG.Text)
          cmd.Parameters.AddWithValue("@HARGA_JUAL", numericOnlyString.ToString)
          cmd.Parameters.AddWithValue("@UKURAN", Me.TXTUKURAN.Text)
          cmd.Parameters.AddWithValue("@KODE_KATEGORI", Me.TXTIDKATEGORI.Value) ' HttpContext.Current.Session(""))
          cmd.Parameters.AddWithValue("@GAMBAR_FILENAME", Me.FUUPLOAD.FileName.Replace("-", "_"))
          cmd.Parameters.AddWithValue("@GAMBAR_FILEPATH", "~/build/imgUpload/")

          cmd.Connection = con
          con.Open()
          cmd.ExecuteNonQuery()
          con.Close()
          Me.FUUPLOAD.SaveAs(Server.MapPath("~/build/imgUpload/" & Me.FUUPLOAD.FileName.Replace("-", "_")))
          Response.Redirect("~/kasir/message/success.aspx?PreviousPage=Barang.aspx&nama_barang=" & Me.TXTNAMABARANG.Text)
        End Using
      End Using
    Else
      Dim strQuery As String = "UPDATE [T_BARANG] SET KODE_BARANG = @KODE_BARANG, NAMA_BARANG = @NAMA_BARANG, HARGA_JUAL = @HARGA_JUAL, " &
                    "UKURAN = @UKURAN, KODE_KATEGORI = @KODE_KATEGORI WHERE ID_BARANG = @ID_BARANG"

      Dim constr As String = ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString
      Using con As New SqlConnection(constr)
        Using cmd As New SqlCommand(strQuery)
          cmd.CommandType = CommandType.Text
          cmd.Parameters.AddWithValue("@ID_BARANG", Me.HFIDBARANG.Value)
          cmd.Parameters.AddWithValue("@KODE_BARANG", Me.TXTKDBARANG.Text)
          cmd.Parameters.AddWithValue("@NAMA_BARANG", Me.TXTNAMABARANG.Text)
          cmd.Parameters.AddWithValue("@HARGA_JUAL", numericOnlyString.ToString)
          cmd.Parameters.AddWithValue("@UKURAN", Me.TXTUKURAN.Text)
          cmd.Parameters.AddWithValue("@KODE_KATEGORI", Me.TXTIDKATEGORI.Value) ' HttpContext.Current.Session(""))
          'JIKA BERHASIL SIMPAN, REDIRECT KE success.aspx?PreviousPage=Barang.aspx
          'BIKIN Parameter DI success.aspx BERDASARKAN URL YG DI REQUEST
          cmd.Connection = con
          con.Open()
          cmd.ExecuteNonQuery()
          con.Close()
          Response.Redirect("~/kasir/message/success.aspx?PreviousPage=list-barang.aspx&nama_barang_edit=" & Me.TXTNAMABARANG.Text)
        End Using
      End Using
    End If
  End Sub

  <WebMethod>
  Public Shared Function GET_DELETE_BARANG(KODE_BARANG As String) As Boolean
    Dim conString As String = ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString
    Using con As New SqlConnection(conString)
      Using cmd As New SqlCommand("DELETE FROM T_BARANG WHERE KODE_BARANG = @KODE_BARANG")
        cmd.Connection = con
        cmd.Parameters.AddWithValue("@KODE_BARANG", KODE_BARANG)
        con.Open()
        Dim rowsAffected As Integer = cmd.ExecuteNonQuery()
        con.Close()
        Return rowsAffected > 0
      End Using
    End Using
  End Function

  Protected Sub BTREFRESH_Click(sender As Object, e As EventArgs)
    Threading.Thread.Sleep(1000)
    GET_BIND_GRID()
  End Sub
End Class
