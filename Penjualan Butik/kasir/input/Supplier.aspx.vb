
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Services

Partial Class kasir_input_Supplier
  Inherits System.Web.UI.Page

  Private Sub kasir_input_Supplier_Load(sender As Object, e As EventArgs) Handles Me.Load
    If Not (Me.Page.IsPostBack) Then
      If Session("KODE_USER") IsNot Nothing Then
        Me.GET_USERS(Session("KODE_USER").ToString)

        Me.TXTNAMASUPPLIER.Attributes.Add("placeholder", "Masukkan Nama Supplier. Field ini wajib diisi!.")
        Me.TXTALAMAT.Attributes.Add("placeholder", "Masukkan Alamat Supplier. Field ini wajib diisi!.")
        Me.TXTNOTELP.Attributes.Add("placeholder", "Masukkan No Telp Supplier. Field ini wajib diisi!.")
      Else
        Response.Redirect("~/account/Login.aspx?next-url=~/kasir/input/Supplier.aspx", True)
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

  <WebMethod>
  Public Shared Function GET_SUPPLIER(SUPPLIER As String) As String()
    Dim customers As New List(Of String)()

    Using conn As New SqlConnection()
      conn.ConnectionString = ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString
      Using cmd As New SqlCommand()
        cmd.CommandText = "SELECT NAMA_SUPPLIER FROM T_SUPPLIER WHERE NAMA_SUPPLIER = @SearchText"
        cmd.Parameters.AddWithValue("@SearchText", SUPPLIER)
        cmd.Connection = conn
        conn.Open()
        Using sdr As SqlDataReader = cmd.ExecuteReader()
          While sdr.Read()
            customers.Add(sdr("NAMA_SUPPLIER").ToString)
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

  Protected Sub Button1_Click(sender As Object, e As EventArgs)

  End Sub

  Protected Sub BTLOGOUT_Click(sender As Object, e As EventArgs)
    Session.Abandon()
    Session.Clear()
    Response.Redirect("~/account/Login.aspx?next-url=~/Default.aspx", True)
  End Sub

  Private Shared random As Random = New Random()
  Public Shared Function RandomString(ByVal length As Integer) As String
    Const chars As String = "0123456789"
    Return New String(Enumerable.Repeat(chars, length).[Select](Function(s) s(random.[Next](s.Length))).ToArray())
  End Function

  Protected Sub BTSIMPAN_Click(sender As Object, e As EventArgs)
    Dim strQuery As String = "INSERT INTO T_SUPPLIER VALUES(@NAMA_SUPPLIER, @ALAMAT_SUPPLIER, @NO_TELP)"

    Dim constr As String = ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString
    Using con As New SqlConnection(constr)
      Using cmd As New SqlCommand(strQuery)
        cmd.CommandType = CommandType.Text

        cmd.Parameters.AddWithValue("@NAMA_SUPPLIER", Me.TXTNAMASUPPLIER.Text)
        cmd.Parameters.AddWithValue("@ALAMAT_SUPPLIER", Me.TXTALAMAT.Text)
        cmd.Parameters.AddWithValue("@NO_TELP", Me.TXTNOTELP.Text)
        'JIKA BERHASIL SIMPAN, REDIRECT KE success.aspx?PreviousPage=Barang.aspx
        'BIKIN Parameter DI success.aspx BERDASARKAN URL YG DI REQUEST
        cmd.Connection = con
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
        Response.Redirect("~/kasir/message/success.aspx?PreviousPage=Supplier.aspx&supplier=" & Me.TXTNAMASUPPLIER.Text)
      End Using
    End Using
  End Sub
End Class
