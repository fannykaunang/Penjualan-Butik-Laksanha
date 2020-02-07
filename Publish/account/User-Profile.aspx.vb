
Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Services

Partial Class account_User_Profile
  Inherits System.Web.UI.Page

  Private Sub account_User_Profile_Load(sender As Object, e As EventArgs) Handles Me.Load
    If Not (Me.Page.IsPostBack) Then
      If Session("KODE_USER") IsNot Nothing Then
        Me.GET_USERS(Session("KODE_USER").ToString)

        If Request.QueryString("UserID") = String.Empty Then
          Me.GET_DETAIL_USER(Session("KODE_USER"))
        Else
          Me.GET_DETAIL_USER(Request.QueryString("UserID"))
        End If
      Else
        Response.Redirect("~/account/Login.aspx?next-url=~/account/User-Profile.aspx", True)
      End If
    End If
  End Sub

  Private Sub GET_DETAIL_USER(KODE_USER As Integer)
    Try
      Using connect As New SqlConnection(ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString)
        Dim str As String = "SELECT * FROM T_USER WHERE KODE_USER=@KODE_USER"
        Using cmd As New SqlCommand(str, connect)

          With cmd
            .Parameters.Add("@KODE_USER", SqlDbType.Int).Value = KODE_USER
            .CommandType = CommandType.Text
            .CommandText = str
            .Connection = connect
            .Connection.Open()
          End With

          Using dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            If dr.HasRows Then
              Me.HFIDUSER.Value = dr("KODE_USER").ToString
              Me.TXTNAMAPENGGUNA.Text = dr("NAMA_USER").ToString
              Me.TXTEMAIL.Text = dr("EMAIL").ToString
              Me.TXTPASSWORD.Text = dr("SANDI").ToString
              Me.LBUSERTYPE.Text = dr("LEVEL_USER").ToString
              Me.imgBarang.ImageUrl = dr("FOTO_FILEPATH").ToString & dr("FOTO_FILENAME").ToString
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

  Protected Sub LinkButton1_Click(sender As Object, e As EventArgs)
    Response.Redirect("~/kasir/input/Penerimaan.aspx")
    'SendNotification("eu52podTnZo:APA91bEGXiYoyrlIZH5Qe67I_RG8e4CoS3cU-AV2XFFofc-RUvHB8n9UUp64tuVYFssXKwJIA737yo5vD7a2vj27mAlu57uVsGGhSyR6hKe4sbtl1ujOwGMO--P2GJ86splYGBR_4DeD", "Penjualan Butik", "Jumlah penerimaan barang hari ini ")
  End Sub

  Protected Sub BTBATAL_Click(sender As Object, e As EventArgs)
    Me.Response.Redirect(Me.Request.Url.AbsoluteUri)
    'SendNotification("eu52podTnZo:APA91bEGXiYoyrlIZH5Qe67I_RG8e4CoS3cU-AV2XFFofc-RUvHB8n9UUp64tuVYFssXKwJIA737yo5vD7a2vj27mAlu57uVsGGhSyR6hKe4sbtl1ujOwGMO--P2GJ86splYGBR_4DeD", "Penjualan Butik", "Jumlah penerimaan barang hari ini ")
  End Sub

  Protected Sub Button1_Click(sender As Object, e As EventArgs)

  End Sub

  Protected Sub BTLOGOUT_Click(sender As Object, e As EventArgs)
    Session.Abandon()
    Session.Clear()
    Response.Redirect("~/account/Login.aspx?next-url=~/Default.aspx", True)
  End Sub
  Protected Sub BTBARCODE_Click(sender As Object, e As EventArgs)
    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Pop", "animateBarcode();", True)
  End Sub

  Private Shared random As Random = New Random()
  Public Shared Function RandomString(ByVal length As Integer) As String
    Const chars As String = "0123456789"
    Return New String(Enumerable.Repeat(chars, length).[Select](Function(s) s(random.[Next](s.Length))).ToArray())
  End Function

  Protected Sub BTSIMPAN_Click(sender As Object, e As EventArgs)
    If FUUPLOAD.HasFile = True Then
      Dim strQuery As String = "UPDATE [T_USER] SET NAMA_USER = @NAMA_USER, EMAIL = @EMAIL, SANDI = @SANDI, " &
                    "FOTO_FILENAME = @FOTO_FILENAME, FOTO_FILEPATH = @FOTO_FILEPATH WHERE KODE_USER = @KODE_USER"

      Dim constr As String = ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString
      Using con As New SqlConnection(constr)
        Using cmd As New SqlCommand(strQuery)
          cmd.CommandType = CommandType.Text
          cmd.Parameters.AddWithValue("@KODE_USER", Me.HFIDUSER.Value)
          cmd.Parameters.AddWithValue("@NAMA_USER", Me.TXTNAMAPENGGUNA.Text)
          cmd.Parameters.AddWithValue("@EMAIL", Me.TXTEMAIL.Text)
          cmd.Parameters.AddWithValue("@SANDI", Me.TXTPASSWORD.Text)
          cmd.Parameters.AddWithValue("@FOTO_FILENAME", Me.FUUPLOAD.FileName.Replace("-", "_"))
          cmd.Parameters.AddWithValue("@FOTO_FILEPATH", "~/build/imgUpload/")
          Threading.Thread.Sleep(1000)
          cmd.Connection = con
          con.Open()
          cmd.ExecuteNonQuery()
          con.Close()
          Me.FUUPLOAD.SaveAs(Server.MapPath("~/build/imgUpload/" & Me.FUUPLOAD.FileName.Replace("-", "_")))
          Response.Redirect("~/kasir/message/success.aspx?PreviousPage=User-Profile.aspx&nama_user=" & Me.TXTNAMAPENGGUNA.Text)
        End Using
      End Using
    Else
      Dim strQuery As String = "UPDATE [T_USER] SET NAMA_USER = @NAMA_USER, EMAIL = @EMAIL, SANDI = @SANDI WHERE KODE_USER = @KODE_USER"

      Dim constr As String = ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString
      Using con As New SqlConnection(constr)
        Using cmd As New SqlCommand(strQuery)
          cmd.CommandType = CommandType.Text
          cmd.Parameters.AddWithValue("@KODE_USER", Me.HFIDUSER.Value)
          cmd.Parameters.AddWithValue("@NAMA_USER", Me.TXTNAMAPENGGUNA.Text)
          cmd.Parameters.AddWithValue("@EMAIL", Me.TXTEMAIL.Text)
          cmd.Parameters.AddWithValue("@SANDI", Me.TXTPASSWORD.Text)
          cmd.Connection = con
          Threading.Thread.Sleep(1000)
          con.Open()
          cmd.ExecuteNonQuery()
          con.Close()
          Response.Redirect("~/kasir/message/success.aspx?PreviousPage=User-Profile.aspx&nama_user=" & Me.TXTNAMAPENGGUNA.Text)
        End Using
      End Using
    End If
  End Sub

End Class
