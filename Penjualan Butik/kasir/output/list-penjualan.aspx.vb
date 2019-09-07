
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Services

Partial Class kasir_output_list_penjualan
  Inherits System.Web.UI.Page

  Private Sub kasir_output_list_penjualan_Load(sender As Object, e As EventArgs) Handles Me.Load
    If Not (Me.Page.IsPostBack) Then
      If Session("KODE_USER") IsNot Nothing Then
        Me.GET_USERS(Session("KODE_USER").ToString)

        Me.GET_BIND_GRID_SPAREPART()

      Else
        Response.Redirect("~/account/Login.aspx?next-url=~/kasir/output/list-penjualan.aspx", True)
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
    Dim strQuery As String = "SELECT * FROM VW_PENJUALAN"

    Using cmd As SqlCommand = New SqlCommand(strQuery)
      Me.GVBARANG.DataSource = Me.GetData(cmd)
      Me.GVBARANG.DataBind()
      'Me.UpdatePanel1.Update()
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

  Protected Sub BTREFRESH_Click(sender As Object, e As EventArgs)
    Dim dt As DataTable = TryCast(ViewState("CurrentTable"), DataTable)
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
  Protected Sub TXTPERIODE_SelectedIndexChanged(sender As Object, e As EventArgs)
    Dim strQuery As String = "SELECT * " +
        "FROM VW_PENJUALAN WHERE PERIODE = @PERIODE"

    Using cmd As SqlCommand = New SqlCommand(strQuery)
      cmd.Parameters.Add("@PERIODE", SqlDbType.VarChar).Value = Me.TXTPERIODE.Text
      Me.GVBARANG.DataSource = Me.GetData(cmd)
      Me.GVBARANG.DataBind()
      ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Pop", "animatePrint();", True)
    End Using
  End Sub

  Protected Sub BTCARITGL_Click(sender As Object, e As EventArgs)
    Dim strQuery As String = "SELECT * " +
                "FROM VW_PENJUALAN WHERE TANGGAL_PENJUALAN >= Convert(DateTime, @TANGGAL1) AND TANGGAL_PENJUALAN < Convert(DateTime, @TANGGAL2) + 1"

    Using cmd As SqlCommand = New SqlCommand(strQuery)
      cmd.Parameters.Add("@TANGGAL1", SqlDbType.DateTime).Value = String.Format(Me.TXTTGLDARI.Text, "dd/MM/yy")
      cmd.Parameters.Add("@TANGGAL2", SqlDbType.DateTime).Value = String.Format(Me.TXTTGLSAMPAI.Text, "dd/MM/yy")
      Me.GVBARANG.DataSource = Me.GetData(cmd)
      Me.GVBARANG.DataBind()
      ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Pop", "animatePrint();", True)
    End Using
  End Sub
  Protected Sub TXTTAHUN_SelectedIndexChanged(sender As Object, e As EventArgs)
    Dim strQuery As String = "SELECT * " +
            "FROM VW_PENJUALAN WHERE YEAR(TANGGAL_PENJUALAN) = @TANGGAL_PENJUALAN"

    Using cmd As SqlCommand = New SqlCommand(strQuery)
      cmd.Parameters.Add("@TANGGAL_PENJUALAN", SqlDbType.VarChar).Value = Me.TXTTAHUN.Text
      Me.GVBARANG.DataSource = Me.GetData(cmd)
      Me.GVBARANG.DataBind()
      ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Pop", "animatePrint();", True)
    End Using
  End Sub

  Private Sub GET_SEARCH_SUPPLIER(search As String)
    Dim strQuery As String = "SELECT * FROM [VW_PENJUALAN] WHERE NAMA_SUPPLIER LIKE @p1 ORDER BY NAMA_SUPPLIER"

    Using cmd As SqlCommand = New SqlCommand(strQuery)
      cmd.Parameters.AddWithValue("@p1", "%" & search & "%")
      Me.GVBARANG.DataSource = GetData(cmd)
      Me.GVBARANG.DataBind()
      Me.GVBARANG.PageSize = 10
    End Using
  End Sub

  Protected Sub TXTNAMAKONSUMEN_TextChanged(sender As Object, e As EventArgs)
    Me.GET_SEARCH_SUPPLIER(Me.TXTNAMAKONSUMEN.Text)
  End Sub

  <WebMethod>
  Public Shared Function GET_DELETE_PENJUALAN(KODE_PENJUALAN As String) As Boolean
    Dim conString As String = ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString
    Using con As New SqlConnection(conString)
      Using cmd As New SqlCommand("DELETE FROM T_PENJUALAN WHERE KODE_PENJUALAN = @KODE_PENJUALAN")
        cmd.Connection = con
        cmd.Parameters.AddWithValue("@KODE_PENJUALAN", KODE_PENJUALAN)
        con.Open()
        Dim rowsAffected As Integer = cmd.ExecuteNonQuery()
        con.Close()
        Return rowsAffected > 0
      End Using
    End Using
  End Function

End Class
