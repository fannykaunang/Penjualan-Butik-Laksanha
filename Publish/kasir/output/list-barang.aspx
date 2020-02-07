<%@ Page Language="VB" AutoEventWireup="false" CodeFile="list-barang.aspx.vb" Inherits="kasir_output_list_barang" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Daftar Barang | Penjualan Butik</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    <script src="https://kit.fontawesome.com/352fc529e7.js"></script>

    <link rel="stylesheet" href="../../plugins/alertify/css/alertify.core.css" />
    <link rel="stylesheet" href="../../plugins/alertify/css/alertify.default.css" id="toggleCSS" />

    <style>
        .alertify-log-custom {
            background: #023da4;
        }
    </style>

    <style>
        #loadingImg {
            display: none;
            position: absolute;
            margin: auto;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }
    </style>

    <style>
        .spinners {
            display: inline-block;
            opacity: 0;
            width: 0;
            -webkit-transition: opacity 0.25s, width 0.25s;
            -moz-transition: opacity 0.25s, width 0.25s;
            -o-transition: opacity 0.25s, width 0.25s;
            transition: opacity 0.25s, width 0.25s;
        }

        .has-spinners.active {
            cursor: progress;
        }

            .has-spinners.active .spinners {
                opacity: 1;
                width: auto;
            }

        .has-spinners.btn.active .spinners {
            min-width: 20px;
        }
    </style>
</head>
<body class="hold-transition sidebar-mini">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <!-- Site wrapper -->
        <div class="wrapper">
            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-white navbar-light border-bottom">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="../../Default.aspx" class="nav-link">Home</a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <asp:LinkButton ID="BTLIST" runat="server" CssClass="btn btn-primary" PostBackUrl="~/kasir/input/Barang.aspx"><i class="fas fa-plus-circle"></i>&nbsp;Tambah Barang</asp:LinkButton>
                    </li>
                </ul>
            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <!-- Brand Logo -->
                <a href="../../Default.aspx" class="brand-link">
                    <img src="../../dist/img/credit/boutique-logo.jpg"
                        alt="Logo Butik"
                        class="brand-image">
                    <span class="brand-text font-weight-light">Penjualan Butik</span>
                </a>

                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Sidebar user (optional) -->
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="image">
                            <asp:Image ID="imgUser" runat="server" CssClass="img-circle elevation-2" AlternateText="User Image" />
                        </div>
                        <div class="info">
                            <asp:LinkButton ID="BTPROFILE" runat="server" CssClass="d-block" PostBackUrl="~/account/User-Profile.aspx"></asp:LinkButton>
                        </div>
                    </div>

                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <li class="nav-item">
                                <a href="../../Default.aspx" class="nav-link">
                                    <i class="nav-icon fas fa-tachometer-alt"></i>
                                    <p>Dashboard</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-book-open"></i>
                                    <p>
                                        Master
                                    <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="../input/Barang.aspx" class="nav-link">
                                            <i class="fas fa-cube nav-icon"></i>
                                            <p>Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../input/Kategori_Barang.aspx" class="nav-link">
                                            <i class="fas fa-align-center nav-icon"></i>
                                            <p>Kategori Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../input/Supplier.aspx" class="nav-link">
                                            <i class="fas fa-shuttle-van nav-icon"></i>
                                            <p>Supplier</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../input/Konsumen.aspx" class="nav-link">
                                            <i class="fas fa-chalkboard-teacher nav-icon"></i>
                                            <p>Konsumen</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../input/Pengguna.aspx" class="nav-link">
                                            <i class="fas fa-user-plus nav-icon"></i>
                                            <p>Pengguna</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item has-treeview">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-columns"></i>
                                    <p>
                                        Detail
                                    <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="../input/Penerimaan.aspx" class="nav-link">
                                            <i class="fas fa-cloud-download-alt nav-icon"></i>
                                            <p>Transaksi Penerimaan</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../input/Penjualan.aspx" class="nav-link">
                                            <i class="fas fa-cloud-upload-alt nav-icon"></i>
                                            <p>Transaksi Penjualan</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-header">PELAPORAN</li>
                            <li class="nav-item has-treeview">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon far fa-clone"></i>
                                    <p>
                                        Laporan
                                    <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="list-barang.aspx" class="nav-link">
                                            <i class="far fa-clipboard nav-icon"></i>
                                            <p>Daftar Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="kartu-stok-barang.aspx" class="nav-link">
                                            <i class="fas fa-poll-h nav-icon"></i>
                                            <p>Stok Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="list-penerimaan.aspx" class="nav-link">
                                            <i class="fas fa-file-download nav-icon"></i>
                                            <p>Transaksi Penerimaan</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="list-penjualan.aspx" class="nav-link">
                                            <i class="fas fa-file-upload nav-icon"></i>
                                            <p>Transaksi Penjualan</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="list-pengguna.aspx" class="nav-link">
                                            <i class="fas fa-address-card nav-icon"></i>
                                            <p>Daftar Pengguna</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-header">AKUN</li>
                            <li class="nav-item">
                                <a href="../../account/User-Profile.aspx" class="nav-link">
                                    <i class="nav-icon fas fa-user-alt"></i>
                                    <p>Pengguna</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="BTLOGOUT" runat="server" OnClick="BTLOGOUT_Click" CssClass="nav-link"><i class="nav-icon fas fa-sign-out-alt"></i>&nbsp;Logout</asp:LinkButton>
                            </li>
                        </ul>
                    </nav>
                </div>
            </aside>

            <div class="content-wrapper">
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Barang</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="../../Default.aspx">Laporan</a></li>
                                    <li class="breadcrumb-item active">Daftar Barang</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Main content -->
                <section class="content">
                    <!-- Default box -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Laporan Daftar Barang</h3>
                            <div class="card-tools">
                                <asp:LinkButton ID="BTREFRESH" runat="server" ToolTip="Muat Ulang" CssClass="btn btn-tool" OnClick="BTREFRESH_Click"><i class="fas fa-sync"></i></asp:LinkButton>
                                <button type="button" class="btn btn-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="validate table-responsive">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="table-responsive" id="ContentToPrint">
                                            <div class="col-lg-12 text-center" id="DIVKOP" runat="server">
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td style="width: 10%; text-align: left">
                                                            <img src="../../dist/img/credit/boutique-logo.jpg" style="width: 60px"></td>
                                                        <td style="width: 90%; text-align: center">
                                                            <asp:Label ID="LBJUDULKOP" runat="server" Font-Size="X-Large" Font-Bold="true" Text="Laksanha Boutique"></asp:Label><br />
                                                            <asp:Label ID="LBJUDULLAPKOP" runat="server" Font-Size="Medium" Text="Laporan Daftar Barang"></asp:Label><br />
                                                            <asp:Label ID="LBALAMATKOP" runat="server" Font-Size="Small" Text="Alamat: Jalan"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <hr style="border: 3px solid black; border-radius: 5px;" />
                                            </div>
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:GridView ID="GVBARANG" runat="server" CssClass="table table-bordered table-striped table-hover js-basic-example dataTable"
                                                        AutoGenerateColumns="false" EnableSortingAndPagingCallbacks="false" RowStyle-Wrap="false" role="grid" RowStyle-CssClass="myRow"
                                                        DataKeyNames="KODE_BARANG" OnRowDataBound="GVBARANG_RowDataBound" Font-Size="X-Small" GridLines="Both">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="NO.">
                                                                <ItemTemplate>
                                                                    <%# Container.DataItemIndex + 1 %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-CssClass="myRow" HeaderStyle-CssClass="myRow">
                                                                <HeaderTemplate>
                                                                    <asp:CheckBox ID="chkAllSelect" runat="server" />
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkSelect" runat="server" />
                                                                    <asp:HiddenField ID="hfKODE_BARANG" runat="server" Value='<%# Eval("KODE_BARANG")%>' />
                                                                    <asp:HiddenField ID="HFIDBARANG" runat="server" Value='<%# Eval("KODE_BARANG")%>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ShowHeader="true" HeaderText="OPSI" ItemStyle-CssClass="myRow" HeaderStyle-CssClass="myRow">
                                                                <ItemTemplate>
                                                                    <asp:HiddenField ID="HF_ID_BARANG" runat="server" Value='<%# Eval("ID_BARANG")%>' />
                                                                    <asp:HiddenField ID="HF_KODE_KATEGORI" runat="server" Value='<%# Eval("KODE_KATEGORI")%>' />
                                                                    <asp:HiddenField ID="HF_FILEPATH" runat="server" Value='<%# Eval("GAMBAR_FILEPATH") & Eval("GAMBAR_FILENAME")%>' />
                                                                    <asp:LinkButton ID="EditButton" runat="server" CssClass="btn btn-sm btn-success" CommandName="Edit" data-toggle="tooltip" data-placement="left" title="Edit" CommandArgument='<%# Container.DataItemIndex %>'><i class="fa fa-edit"></i></asp:LinkButton>
                                                                    <asp:LinkButton ID="DeleteButton" runat="server" CssClass="btn btn-sm btn-danger has-spinners" CommandName="Delete" data-toggle="tooltip" data-placement="right" title="Hapus" CommandArgument='<%# Container.DataItemIndex %>'><i class="fa fa-trash"></i></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>GAMBAR</HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Image ID="LbFilePath" runat="server" ImageUrl='<%# Eval("GAMBAR_FILEPATH") & Eval("GAMBAR_FILENAME")%>' Height="50px" Width="40px"></asp:Image>
                                                                    <asp:Image ID="LbFilePath2" runat="server" Visible="false" ImageUrl="~/dist/img/No_Image-128.png" Height="50px" Width="40px"></asp:Image>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="NAMA_BARANG" HeaderText="NAMA_BARANG" ReadOnly="True" />
                                                            <asp:BoundField DataField="KATEGORI_BARANG" HeaderText="KATEGORI_BARANG" ReadOnly="true" />
                                                            <asp:BoundField DataField="HARGA_BELI" HeaderText="HARGA_BELI" ReadOnly="true" />
                                                            <asp:BoundField DataField="HARGA_JUAL" HeaderText="HARGA_JUAL" ReadOnly="true" />
                                                            <asp:BoundField DataField="UKURAN" HeaderText="UKURAN" ReadOnly="true" />
                                                            <asp:BoundField DataField="STOK" HeaderText="STOK" ReadOnly="true" />
                                                        </Columns>
                                                    </asp:GridView>
                                                    <asp:Image ID="loadingImg" runat="server" ImageUrl="~/dist/img/loading.gif" />
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="BTREFRESH" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="GVBARANG" EventName="PageIndexChanging" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="card-footer">
                            <asp:LinkButton ID="BTPRINTALL" runat="server" CssClass="btn btn-success" OnClientClick="return PrintDiv('ContentToPrint');"><i class="fas fa-print"></i>&nbsp;Print Semua</asp:LinkButton>
                            <asp:LinkButton ID="BTPRINTSELECTED" runat="server" CssClass="btn btn-primary"><i class="fa fa-check-circle"></i>&nbsp;Print dipilih</asp:LinkButton>
                        </div>
                    </div>
                </section>
            </div>

            <div class="modal fade" id="modal-warning">
                <div class="modal-dialog">
                    <div class="modal-content bg-warning">
                        <div class="modal-header">
                            <h4 class="modal-title">Informasi</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <p id="modal-text-info">&hellip;</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Keluar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>

            <div class="modal fade" id="modal-edit-barang">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Edit Data</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-4 col-xs-12">
                                    <div class="white-box">
                                        <div class="user-bg text-center">
                                            <div class="overlay-box">
                                                <div class="user-content">
                                                    <a class="myA" href="#"></a>
                                                    <div class="box">
                                                        <img id="imgBarang" class="thumb-lg img-circle" src="../../dist/img/No_Image-128.png" style="width: 50%;">
                                                        <div class="mask">
                                                            <span style="font-size: x-small">Biarkan kosong jika tidak ada perubahan gambar</span><br />
                                                            <asp:Button ID="BTBROWSEGAMBAREDIT" CssClass="btn btn-success" runat="server" Text="Browse Gambar" />
                                                            <asp:FileUpload ID="FUUPLOAD" CssClass="btn btn-success" Style="visibility: hidden" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="white-box">
                                        <div class="form-horizontal">
                                            <div class="form-group row">
                                                <label for="TXTKDBARANG" class="col-sm-4 control-label">Kode Barang</label>
                                                <div class="col-sm-8">
                                                    <asp:HiddenField ID="HFIDBARANG" runat="server" />
                                                    <asp:TextBox ID="TXTKDBARANG" runat="server" CssClass="form-control" placeholder="Masukkan Kode Barang"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="TXTNAMABARANG" class="col-sm-4 control-label">Nama Barang</label>
                                                <div class="col-sm-8">
                                                    <asp:TextBox ID="TXTNAMABARANG" runat="server" CssClass="form-control" placeholder="Masukkan Nama Barang"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <asp:HiddenField ID="HFIDKATEGORI" runat="server" />
                                                <label for="TXTKATEGORI" class="col-sm-4 control-label">Kategori</label>
                                                <div class="col-sm-8">
                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" EnableViewState="false">
                                                        <ContentTemplate>
                                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                                ConnectionString="<%$ ConnectionStrings:DB_Penjualan_Butik_ConnectionString %>"
                                                                SelectCommand="SELECT DISTINCT KATEGORI_BARANG FROM T_KATEGORI"></asp:SqlDataSource>
                                                            <asp:DropDownList ID="TXTKATEGORI" AppendDataBoundItems="true" CssClass="form-control select2"
                                                                Style="width: 100%;" runat="server" DataSourceID="SqlDataSource1" DataTextField="KATEGORI_BARANG"
                                                                OnSelectedIndexChanged="TXTKATEGORI_SelectedIndexChanged" AutoPostBack="true" EnableViewState="false">
                                                                <asp:ListItem>--Pilih--</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:HiddenField ID="TXTIDKATEGORI" runat="server" />
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="TXTKATEGORI" EventName="SelectedIndexChanged" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="TXTHARGAJUAL" class="col-sm-4 control-label">Harga Jual</label>
                                                <div class="col-sm-8">
                                                    <asp:TextBox ID="TXTHARGAJUAL" runat="server" CssClass="form-control" placeholder="Masukkan Harga Jual Barang"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="TXTHARGAJUAL" class="col-sm-4 control-label">Ukuran</label>
                                                <div class="col-sm-8">
                                                    <asp:DropDownList ID="TXTUKURAN" CssClass="form-control select2"
                                                        Style="width: 100%;" runat="server">
                                                        <asp:ListItem>--Pilih--</asp:ListItem>
                                                        <asp:ListItem>Small</asp:ListItem>
                                                        <asp:ListItem>Medium</asp:ListItem>
                                                        <asp:ListItem>Large</asp:ListItem>
                                                        <asp:ListItem>Extra Large</asp:ListItem>
                                                        <asp:ListItem>Double Extra Large</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card card-info">
                                <div class="form-horizontal">
                                    <div class="card-body">
                                    </div>
                                    <!-- /.card-body -->
                                    <div class="card-footer">
                                        <asp:LinkButton ID="BTSIMPAN" runat="server" OnClick="BTSIMPAN_Click" CssClass="btn btn-primary has-spinners"><i class="fa fa-download"></i> Ubah</asp:LinkButton>
                                        <button type="submit" class="btn btn-default float-right" data-dismiss="modal">Cancel</button>
                                    </div>
                                    <!-- /.card-footer -->
                                </div>
                            </div>
                        </div>
                        <%--  <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Keluar</button>
                        </div>--%>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>

            <footer class="main-footer">
                <div class="float-right d-none d-sm-block">
                    <b>Version</b> 1.0.0
   
                </div>
                <strong>Copyright &copy; 2019 <a href="https://web.facebook.com/fanny.kaunang.7">FannyKaunang</a>.</strong> All rights
    reserved.
 
            </footer>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- /.control-sidebar -->
        </div>
        <!-- ./wrapper -->

        <!-- jQuery -->
        <script src="../../plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- FastClick -->
        <script src="../../plugins/fastclick/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="../../dist/js/adminlte.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="../../dist/js/demo.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
        <script src="../../plugins/alertify/js/alertify.js"></script>
        <script src="../../plugins/alertify/js/alertify.min.js"></script>

        <script>
            function Comma(Num) {      //function to insert comma for two textboxes
                Num += '';
                Num = Num.replace(',', ''); Num = Num.replace(',', ''); Num = Num.replace(',', '');
                Num = Num.replace(',', ''); Num = Num.replace(',', ''); Num = Num.replace(',', '');
                x = Num.split('.');
                x1 = x[0];
                x2 = x.length > 1 ? '.' + x[1] : '';
                var rgx = /(\d+)(\d{3})/;
                while (rgx.test(x1))
                    x1 = x1.replace(rgx, '$1' + '.' + '$2');
                return x1 + x2;
            }
        </script>

        <script type="text/javascript">
            function PrintDiv(printpage) {
                var popupWin = window.open('', '_blank', 'status=0,toolbar=0,scrollbars=1,width=700,height=400,location=no,left=200px');
                popupWin.document.write('<html><head><link href="../../dist/css/adminlte.min.css" rel="stylesheet"><link href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" rel="stylesheet"/><link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" /><link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet" /></head > <body onload="window.print()">' + document.all.item(printpage).innerHTML + '</body></html > ');
                popupWin.document.close();
                popupWin.focus();
                return false;
            }
        </script>

        <script type="text/javascript">
            function PrintGridViewSelectedRows() {
                $("[id*=GVBARANG] input[type=checkbox]:checked").each(function () {
                    if ($(this).is(":checked")) {
                        $(this).closest('tr').removeClass('myRow');
                        $(this).closest('tr').addClass('printRow');
                        return false;
                    } else {
                        $(".myRow").remove();
                        return false;
                    }
                });
                $('#GVBARANG').find('.myRow').hide();
                PrintDiv('ContentToPrint');
            }
        </script>

        <script type="text/javascript">
            $(function () {
                //$("#TXTTGLPENERIMAAN").datepicker();
                $("#TXTTGLPENERIMAAN").datepicker({
                    onSelect: function () {
                        $("[id*=LbTGLPENERIMAAN]").text(null);
                        $("#TXTTGLPENERIMAAN").datepicker("option", "dateFormat", "dd/mm/yy");
                        return false;
                    }
                });

                $("#<%=UpdatePanel1.ClientID %>").on("click", "[id*=GVBARANG] [id*=DeleteButton]", function (e) {
                    if (confirm("Yakin ingin menghapus data yang terpilih?? Anda tidak dapat memulihkannya kembali!!!")) {
                        var row = $(this).closest("tr");
                        var btn = $(this);
                        var hfKODE_BARANG = row.find("[id*=hfKODE_BARANG]").val();

                        $.ajax({
                            type: "POST",
                            url: '<%=ResolveUrl("~/kasir/output/list-barang.aspx/GET_DELETE_BARANG")%>',
                            data: JSON.stringify({ "KODE_BARANG": hfKODE_BARANG }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            error: OnErrorOrFailure,
                            failure: OnErrorOrFailure,
                            beforeSend: function (r) {
                                setTimeout(function () {
                                    $.ajax($.extend(options, { beforeSend: $.noop }));
                                }, 5000);
                                $(btn).buttonLoader('start');
                            },
                            success: function (r) {
                                if (r.d) {
                                    $(btn).buttonLoader('stop');
                                    $(row).fadeOut(1600);
                                    alertify.custom = alertify.extend("custom");
                                    alertify.custom('<strong> Informasi!</strong> </br>Data berhasil di-Hapus!');
                                    if ($("[id*=GVBARANG] td").length == 0) {
                                        $("[id*=GVBARANG] tbody").append("<tr><td colspan = '4' align = 'center'>No records found.</td></tr>")
                                    }
                                }
                            },
                        });
                        function OnErrorOrFailure(response) {
                            alert(response.responseText);
                            $(btn).buttonLoader('stop');
                        }
                    }
                    return false;
                });

                $("#<%=UpdatePanel1.ClientID %>").on("click", "[id*=GVBARANG] [id*=EditButton]", function (e) {
                    var row = $(this).closest("tr");
                    var hfKODE_BARANG = row.find("[id*=hfKODE_BARANG]").val();
                    var HF_ID_BARANG = row.find("[id*=HF_ID_BARANG]").val();
                    var namabarang = row.find("td:eq(4)").text();
                    var HF_ID_KATEGORI = row.find("[id*=HF_KODE_KATEGORI]").val();
                    var kategoribarang = row.find("td:eq(5)").text();
                    var hargajual = row.find("td:eq(7)").text();
                    var ukuran = row.find("td:eq(8)").text();
                    var LbFilePath = row.find("[id*=LbFilePath]");

                    $("#HFIDBARANG").val(HF_ID_BARANG);
                    $("#TXTIDKATEGORI").val(HF_ID_KATEGORI);
                    $("#TXTKDBARANG").val(hfKODE_BARANG);
                    $("#TXTNAMABARANG").val(namabarang);
                    $("#TXTKATEGORI").val(kategoribarang);
                    $("#TXTHARGAJUAL").val(hargajual);
                    $("#TXTUKURAN").val(ukuran);
                    $("#imgBarang").attr("src", $(LbFilePath).attr('src'));
                    $("#imgBarang").css("width", "30%");

                    $('#modal-edit-barang').modal('show');
                    return false;
                });

                $('body').on('click', '[id*=BTSIMPAN]', function () {
                    $(this).buttonLoader('start');
                    return true;

                    //alert($("#FUUPLOAD").val());
                    //return false;
                });

                $('#FUUPLOAD').change(function () {
                    var file = this.files[0];
                    var reader = new FileReader();
                    reader.onloadend = function () {
                        $('#imgBarang').attr('src', reader.result);
                    }
                    if (file) {
                        reader.readAsDataURL(file);
                    } else {
                    }
                });

                $("#TXTTGLPENERIMAAN").on("change", function () {
                    $("#TXTTGLPENERIMAAN").datepicker("option", "dateFormat", "dd/mm/yy");
                });

                function Loading() {
                    $("#loadingImg").fadeIn().delay(3000);
                }

                $("#BTREFRESH").on("click", function () {
                    $("#loadingImg").css("display", "block");
                    Loading();
                    //$("#loadingImg").fadeIn("slow");
                    //setTimeout(function () {
                    //    Complete();
                    //}, 6000);
                });

                $("input:checkbox").change(function () {
                    if ($(this).is(":checked")) {
                        $(this).closest('tr').addClass('printRow');
                        $(this).closest('tr').removeClass('myRow');
                    } else {
                        $(this).closest('tr').removeClass('printRow');
                        $(this).closest('tr').addClass('myRow');
                    }
                });

                $("[id$=GVBARANG] input[type=checkbox][id*=chkAllSelect]").change(function () {
                    $('input:checkbox').prop('checked', this.checked);
                    var tr = $(this).closest("table").find('tr');

                    if ($(this).is(":checked")) {
                        $(tr).addClass('printRow');
                        $(tr).removeClass('myRow');
                    } else {
                        $(tr).removeClass('printRow');
                        $(tr).addClass('myRow');
                    }
                });

                $("body").on("click", "[id*=BTPRINTSELECTED]", function () {
                    var GridViewContent = "";
                    $("#loadingImg").css("display", "none");
                    $(':input:checked').closest('tr').each(function (i, item) {
                        GridViewContent += "<tr>" + $(item)[0].innerHTML + "</tr>";
                    });

                    if (GridViewContent == "") {
                        alert("Anda harus memilih satu atau beberapa item untuk di-Print !");
                        return false;
                    } else {
                        PrintGridViewSelectedRows();
                        return false;
                    }
                    //return false;
                });

                $("#TXTKONSUMEN").change(function () {
                    $("#LBINFOKONSUMEN").text("");
                });

                var inputfaktur = false;
                $("#TXTFAKTUR").keyup(function () {
                    var faktur = $(this);
                    $.ajax({
                        type: "POST",
                        url: '<%=ResolveUrl("~/kasir/input/Penjualan.aspx/GET_FAKTUR")%>',
                        data: JSON.stringify({ "INVOICE_PENERIMAAN": faktur.val() }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        async: false,
                        success: function (result) {
                            if (result.d.length > 0) {
                                alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>No Faktur/Invoice yang Anda masukkan sudah ada, Anda tidak dapat menyimpan nomor Faktur/Invoice yang sama!');
                                $("[id*=LBINFOFAKTUR]").text("Nomor Faktur/Invoice sudah terdaftar!");
                                inputfaktur = true;
                            } else {
                                $("[id*=LBINFOFAKTUR]").text(null);
                                inputfaktur = false;
                            }
                        },
                        error: function (err, result) { alert(err.responseText); }
                    });
                });

                $("body").on("click", "[id*=Gridview1] [id*=LBDETAILQTY]", function () {
                    var stokBaru = $(this).closest("td").find("[id*=TXTQTY]").val();
                    var kalkulasiStok = parseFloat(stokBaru) + parseFloat(stokLama);

                    $('#TXTDETAILSPAREPART').text(namaSparepart);
                    $('#TXTDETAILSTOKLAMA').text(stokLama);
                    $('#TXTDETAILSTOKTAMBAH').text(stokBaru);
                    $('#TXTDETAILSTOKTOTAL').text(kalkulasiStok);
                    $('#TXTDETAILBELISTD').text(beliSTD);
                    $('#TXTDETAILBELIGOLD').text(beliGold);
                    $('#TXTDETAILBELIGOLDHD').text(beliGoldHD);

                    $('#TXTDETAILJUALSTD').text(jualSTD);
                    $('#TXTDETAILJUALGOLD').text(jualGold);
                    $('#TXTDETAILJUALGOLDHD').text(jualGoldHD);

                    $('#myModal').modal('show');
                    return false;
                });

                $("body").on("click", "[id*=Gridview1] [id*=LNKNAMABARANG]", function () {
                    var kodebrg = $(this).closest("tr").find("[id*=TXTKDBARANG]").text();
                    var brg = $(this).text();

                    $.ajax({
                        type: "POST",
                        url: "Penjualan.aspx/GET_DETAIL_BARANG",
                        data: '{KDBARANG: "' + kodebrg + '" }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        error: OnErrorOrFailure,
                        failure: OnErrorOrFailure,
                        success: function (data) {
                            if (data.d.length > 0) {

                                $('#modal-info-barang').modal('show');

                                if (!$.trim(data.d[0].split('-')[11])) {
                                    $('#modal-img-barang').attr('src', '../../dist/img/No_Image-128.png');
                                }
                                else {
                                    $('#modal-img-barang').attr('src', data.d[0].split('-')[11]);
                                }

                                $('#modal-nama-barang').text(data.d[0].split('-')[3] + ' (' + data.d[0].split('-')[2] + ')');
                                //$('#modal-kode-barang').text(data.d[0].split('-')[2]);
                                $('#modal-stokakhir-barang').text(data.d[0].split('-')[4]);
                                $('#modal-hargabeli-barang').text('Rp.' + data.d[0].split('-')[5]);
                                $('#modal-hargajual-barang').text('Rp.' + data.d[0].split('-')[10]);
                                $('#modal-kategori-barang').text(data.d[0].split('-')[6]);
                                $('#modal-supplier-barang').text(data.d[0].split('-')[7]);
                                $('#modal-kasir-barang').text(data.d[0].split('-')[8]);
                                $('#modal-tgl-barang').text(data.d[0].split('-')[9]);

                            } else {
                                $('#modal-warning').modal('show');
                                $('#modal-text-info').text(brg + " belum dimasukkan dalam daftar penerimaan barang")
                                //alert(brg + " belum dimasukkan dalam daftar penerimaan barang");
                            }
                        }
                    });
                    function OnErrorOrFailure(response) {
                        alert(response.responseText);
                    }
                    return false;
                });

                $('body').on('click', '.clsdeleteSparepart', function () {
                    alert($(this).attr('id'));
                });

                $('body').on('click', '.clsshowSparepart', function () {
                    //alert($(this).closest("tr").find('td').eq(0).text());
                    $('#HFIDXSPAREPART').val(parseInt($(this).closest("tr").find('td').eq(0).text()));
                });

                $('body').on('click', '[id*=BTBROWSEGAMBAREDIT]', function () {
                    $("#FUUPLOAD")[0].click();
                    return false;
                });

                $('body').on('click', '[id*=Button1]', function () {
                    var arrInputKdBarang = [];

                    $("#Gridview1").find("[id*=HF_ID_BARANG]").each(function () {
                        arrInputKdBarang.push($(this).val());
                    });
                    var explodedKdBarang = $.map(arrInputKdBarang, function (KdBarangName, KdBarangIndex) {
                        return ([KdBarangName]);
                    });

                    var arrInputStokAkhir = [];
                    $("#Gridview1").find(".StokAkhir").each(function () {
                        arrInputStokAkhir.push($(this).text());
                    });
                    var explodedStokAkhir = $.map(arrInputStokAkhir, function (StokAkhirName, StokAkhirIndex) {
                        return ([StokAkhirName]);
                    });

                    var arrInputJUMBELI = [];
                    $("#Gridview1").find(".InputJUMBELI").each(function () {
                        arrInputJUMBELI.push($(this).val());
                    });
                    var explodedJUMBELI = $.map(arrInputJUMBELI, function (JUMBELIName, JUMBELIIndex) {
                        return ([JUMBELIName]);
                    });
                    //alert(explodedJUMBELI)

                    var arrInputHARGABELI = [];
                    $("#Gridview1").find(".InputHARGABELI").each(function () {
                        arrInputHARGABELI.push($(this).val());
                    });
                    var explodedHARGABELI = $.map(arrInputHARGABELI, function (HARGABELIName, HARGABELIIndex) {
                        return ([HARGABELIName]);
                    });

                    getInsertFromAjax();

                    function getInsertFromAjax() {
                        var TXTFAKTUR = $("[id*=TXTFAKTUR]");
                        var TXTTGLPENERIMAAN = $("[id*=TXTTGLPENERIMAAN]");
                        var TXTTOTALHARGABELI = $("[id*=TXTTOTALHARGABELI]");
                        var TXTIDKONSUMEN = $("[id*=TXTIDKONSUMEN]");
                        var TXTKETERANGAN = $("[id*=TXTKETERANGAN]");

                        var x = $('#Gridview1 tbody .count');
                        var i;
                        var cnt = 0 - 1;
                        var alerted = false;
                        for (i = 0; i < parseInt(x.length); i++) {
                            (function (index) {
                                cnt++;
                                //alert(explodedKdBarang[cnt]);
                                $.ajax({
                                    type: "POST",
                                    url: "Penjualan.aspx/GET_INSERT_DATA",
                                    data: '{KODE_PENERIMAAN: "' + explodedKdBarang[cnt] +
                                        '", INVOICE_PENJUALAN: "' + TXTFAKTUR.val() +
                                        '", KODE_KONSUMEN: "' + TXTIDKONSUMEN.val() +
                                        '", TANGGAL_PENJUALAN: "' + TXTTGLPENERIMAAN.val() +
                                        '", JUMLAH_BELI: "' + explodedJUMBELI[cnt] +
                                        '", TOTAL_BAYAR: "' + TXTTOTALHARGABELI.text() +
                                        '", KETERANGAN: "' + TXTKETERANGAN.val() + '" }',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    error: OnErrorOrFailure,
                                    failure: OnErrorOrFailure,
                                    beforeSend: function (jqXHR, options) {
                                        setTimeout(function () {
                                            $.ajax($.extend(options, { beforeSend: $.noop }));
                                        }, 5000);
                                        //$(".modals").fadeIn("slow");
                                        $("[id*=BTSIMPAN]").buttonLoader('start');
                                        return false;
                                    },
                                    success: function (response) {
                                        //$(".modals").fadeOut("slow");
                                        $("[id*=BTSIMPAN]").buttonLoader('stop');
                                        if (!alerted) {
                                            alerted = true;
                                            alertify.set({ delay: 30000 });
                                            alertify.success('<img id="Image2" src="../../dist/img/accept-icon.png" style="height:30px;width:30px;" /><strong> Informasi!</strong> </br>Data berhasil diupdate.');
                                        }

                                        $('html, body').animate({
                                            scrollTop: parseInt($("#BTINSERTDATATABLE").offset().top)
                                        }, 1000);
                                        return false;
                                    }
                                });
                                function OnErrorOrFailure(response) {
                                    alert(response.responseText);
                                    $("[id*=BTSIMPAN]").buttonLoader('stop');
                                }
                                function OnBeforeSend(response) {
                                    $(".modals").fadeIn("slow");
                                }
                                return false;
                            })(i);
                        }
                    }
                    return false;
                });

                $("body").on("click", "[id*=ButtonAdd]", function (e) {
                    var row = $(this).closest("tr");
                    var validateCountDefault = row.find(".has-error");
                    var spanSparepart = row.find(".InputSparepart");
                    var thisInput = row.find("input[type=text]");
                    var thisFormGroup; //= row.find(".form-group");
                    var thisSpan; //= row.find(".help-block");
                    if (validateCountDefault.length > 0) {
                        alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>Masih ada ' + validateCountDefault.length + ' lagi yang masih kosong, harap diisi!!!.');
                        if ($(thisInput).val() === '') {
                            row.find(".has-error").each(function () {
                                thisFormGroup = $(this);
                                $(thisFormGroup).removeClass('form-group');
                                $(thisFormGroup).addClass('form-group has-error');
                                thisFormGroup.find(".spanDefault").each(function () {
                                    thisSpan = $(this);
                                    $(thisSpan).text('Field masih kosong!!!');

                                    $('#Panel1').fadeOut(2000);
                                    //return false;
                                });
                            });
                        }
                    } else if (validateCountDefault.length == 0) {
                        //var gridview1 = '[id*=Gridview1]';
                        e.preventDefault();
                        var rowCount = $('#Gridview1 tbody .count').length;
                        var contactdiv = '<tr class="data-class_' + rowCount + '">' +
                            '<td class="count">' + parseInt(rowCount + 1) + '</td>' +
                            '<td><a href="#" id="Gridview1_BTSHOWSPAREPART_' + rowCount + '" style="font-size: x-large" data-toggle="modal" data-target="#divBarang"><i class="fa fa-plus-circle" aria-hidden="true"></i></a>&nbsp;<a href="#" id="Gridview1_BTDELETESPAREPART_' + rowCount + '" style="font-size: x-large"><i class="fa fa-times-circle" aria-hidden="true"></i></a></td>' +
                            '<td><div id="Gridview1_valKdBarang_' + rowCount + '" class="form-group default has-error"><div class="col-sm-10"><span id="Gridview1_TXTKDBARANG_' + rowCount + '" class="InputKdBarang" style="font-size:Small;"></span><span id="LBINFOKDBARANG" style="font-size: x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '<td id="tdvalNamaBarang"><div id="Gridview1_valNamaBarang_' + rowCount + '" class="form-group default has-error"><div class="col-sm-10"><a id="Gridview1_LNKNAMABARANG_' + rowCount + '" class="InputBarang" href="javascript:__doPostBack("Gridview1$ctl0' + rowCount + '$LNKNAMABARANG","")" style="font-size:Small;"></a><span id="Gridview1_TXTNAMABARANG_0" style="font-size:Small;"></span><span id="LBINFONAMABARANG' + rowCount + '" style="font-size:x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '<td><div id="Gridview1_valQty_' + rowCount + '" class="form-group default has-error"><div class="col-sm-10"><span id="Gridview1_TXTSTOKAKHIR_' + rowCount + '" class="StokAkhir" style="font-size:Small;"></span><span id="LBINFOQty" style="font-size:x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '<td><div id="Gridview1_valJumBeli_' + rowCount + '" class="form-group default has-error"><div class="col-sm-10"><input name="Gridview1$ctl02$TXTJUMBELI' + rowCount + '" type="text" id="Gridview1_TXTJUMBELI_' + rowCount + '" class="form-control InputJUMBELI" style="font-size:Small;" /><span id="LBINFOJUMBELI" style="font-size:x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '<td><div id="Gridview1_valHargaBeli_' + rowCount + '" class="form-group default has-error"><div class="col-sm-10"><input name="Gridview1$ctl02$TXTHARGABELI' + rowCount + '" type="text" id="Gridview1_TXTHARGABELI_' + rowCount + '" class="form-control InputHARGABELI" style="font-size:Small;" /><span id="LBINFOHARGABELI" style="font-size:x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '</tr>';
                        $('#Gridview1').append(contactdiv);
                        $('#HFIDXSPAREPART').val(parseInt(rowCount));
                        return false;
                    }
                });

                $("body").on("click", "[id*=BTINSERTDATATABLE]", function (e) {
                    var validateCountDefault = $(".validate").find(".default");
                    var validateCountDanger = $(".validate").find(".has-error");

                    var thisFormGroup;
                    var thisSpan;
                    if (validateCountDanger.length > 0) {

                        alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>Masih ada ' + validateCountDanger.length + ' lagi yang masih kosong, harap diisi!!!.');
                        $(".validate").find(".has-error").each(function () {
                            thisFormGroup = $(this);
                            $(thisFormGroup).removeClass('form-group');
                            $(thisFormGroup).addClass('form-group has-error');
                            $(".validate").find(".has-error").find(".spanDefault").each(function () {
                                thisSpan = $(this);
                                $(thisSpan).text('Field masih kosong!!!');

                                $('#Panel1').fadeOut(2000);
                                //return false;
                            });
                        });

                        return false;
                    } else if (validateCountDanger.length == 0) {
                        var totals = 0;
                        $("#Gridview1 tr").each(function () {
                            var hrgbeli = $(this).find(".InputSubTotal").text();
                            if (hrgbeli != '') {
                                totals += parseFloat(hrgbeli);
                                return;
                            }
                        });
                        $("[id*=TXTTOTALHARGABELI]").text("Rp." + Comma(totals));
                        $("#Gridview1").find("input").attr("disabled", "disabled");
                        e.preventDefault();
                        $("#Gridview1").find("[id*=BTSHOWSPAREPART]").css("pointer-events", "none").css('cursor', 'default');
                        $("#Gridview1").find("[id*=BTDELETESPAREPART]").css("pointer-events", "none").css('cursor', 'default');

                        $('#Panel1').fadeIn(2000);
                        $('#TXTFAKTUR').focus();
                        $('html, body').animate({
                            scrollTop: parseInt($("#Panel1").offset().top)
                        }, 2000);
                        return false;
                    }
                    return false;
                });

                $("body").on("change", "[id*=Gridview1] .InputSparepart", function () {
                    alert('calculated value');
                });

                var kdbarang = [];
                var namabarang = [];
                var idbarang = [];
                $("body").on("click", "[id*=btCheck]", function () {
                    var message = "";
                    var HFKODE_SPAREPART = "";
                    var HFIDBARANG = "";
                    var countchecked = $("[id*=GVBARANG] input[type=checkbox]:checked").length;

                    kdbarang.length = 0;
                    namabarang.length = 0;
                    idbarang.length = 0;

                    $("[id*=GVBARANG] input[type=checkbox]:checked").each(function () {
                        var row = $(this).closest("tr")[0];
                        var rowChecked = $(this).closest("tr");
                        HFKODE_SPAREPART = rowChecked.find("[id*=hfKODE_BARANG]").val();
                        HFIDBARANG = rowChecked.find("[id*=HFIDBARANG]").val();
                        message += row.cells[4].innerHTML;
                        message += "\n";

                        if ($(this).is(':checked')) {
                            kdbarang.push(HFKODE_SPAREPART);
                            namabarang.push(row.cells[3].innerHTML);
                            idbarang.push(HFIDBARANG);
                        }
                    });

                    var totals = 0;

                    for (var rowCount = 0; rowCount < countchecked; rowCount++) {                             //var rowCount = countchecked;
                        var contactdiv = '<tr class="data-class_' + rowCount + '">' +
                            '<td class="count">' + parseInt(rowCount + 1) + '</td>' +
                            '<td><a href="#" id="Gridview1_BTSHOWSPAREPART_' + rowCount + '" style="font-size: x-large" data-toggle="modal" data-target="#divBarang"><i class="fa fa-plus-circle" aria-hidden="true"></i></a>&nbsp;<a href="#" id="Gridview1_BTDELETESPAREPART_' + rowCount + '" style="font-size: x-large"><i class="fa fa-times-circle" aria-hidden="true"></i></a></td>' +
                            '<td><div id="Gridview1_valKdBarang_' + rowCount + '" class="form-group default has-success"><div class="col-sm-10"><span id="Gridview1_TXTKDBARANG_' + rowCount + '" class="InputKdBarang" style="font-size:Small;">' + kdbarang[rowCount] + '</span><input name="Gridview1$ctl02$HF_ID_BARANG' + rowCount + '" type="hidden" id="Gridview1_HF_ID_BARANG_' + rowCount + '" value="' + idbarang[rowCount] + '" class="inputIDBarang" /><span id="LBINFOKDBARANG" style="font-size: x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '<td id="tdvalNamaBarang"><div id="Gridview1_valNamaBarang_' + rowCount + '" class="form-group default has-success"><div class="col-sm-10"><a id="Gridview1_LNKNAMABARANG_' + rowCount + '" class="InputBarang" href="javascript:__doPostBack("Gridview1$ctl0' + rowCount + '$LNKNAMABARANG","")" style="font-size:Small;">' + namabarang[rowCount] + '</a><span id="Gridview1_TXTNAMABARANG_0" style="font-size:Small;"></span><span id="LBINFONAMABARANG' + rowCount + '" style="font-size:x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '<td><div id="Gridview1_valQty_' + rowCount + '" class="form-group default has-success"><div class="col-sm-10"><span id="Gridview1_TXTSTOKAKHIR_' + rowCount + '" class="StokAkhir" style="font-size:Small;">' + GET_STOK_BARANG(kdbarang[rowCount]) + '</span><span id="LBINFOQty" style="font-size:x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '<td><div id="Gridview1_valJumBeli_' + rowCount + '" class="form-group default has-error"><div class="col-sm-10"><input name="Gridview1$ctl02$TXTJUMBELI' + rowCount + '" type="text" id="Gridview1_TXTJUMBELI_' + rowCount + '" class="form-control InputJUMBELI" style="font-size:Small;" /><span id="LBINFOJUMBELI" style="font-size:x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '<td><div id="Gridview1_valHargaBeli_' + rowCount + '" class="form-group default has-success"><div class="col-sm-10"><input name="Gridview1$ctl02$TXTHARGABELI' + rowCount + '" type="text" id="Gridview1_TXTHARGABELI_' + rowCount + '" class="form-control InputHARGABELI" value="' + GET_HARGA_JUAL(kdbarang[rowCount]) + '" style="font-size:Small;" /><span id="LBINFOHARGABELI" style="font-size:x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '<td><div id="Gridview1_valSubTotal_' + rowCount + '" class="form-group default has-success"><div class="col-sm-10"><span id="Gridview1_TXTSUBTOTAL_' + rowCount + '" class="InputSubTotal" style="font-size:Small;"></span><span id="LBINFOSUBTOTAL" style="font-size: x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '</tr>';
                        $('#Gridview1').append(contactdiv);
                        $('#HFIDXSPAREPART').val(parseInt(rowCount));

                        $('#divBarang').modal('toggle');
                        $("[id*=LBINFONAMABARANG]").text('');
                        $("[id*=LBINFOKDBARANG]").text('');
                        $("[id*=LBINFOQty]").text('');

                        totals += parseFloat(GET_HARGA_JUAL(kdbarang[rowCount]));
                        $("[id*=TXTTOTALHARGABELI]").text('Rp. ' + Comma(totals));
                        $("[id*=ButtonCancel]").css("visibility", "visible");
                    }

                    $("#Gridview1 tr td").each(function () {
                        var rowChecked = $(this).closest("tr");
                        if (rowChecked.find("[id*=TXTKDBARANG]").text() == "") {
                            $(this).remove();
                        }
                    });

                    var seen = {};
                    $('#Gridview1 .InputKdBarang').each(function () {
                        var txt = $(this).text(); //$("td:first-child", $(this)).text();
                        if (seen[txt]) $(this).parents("tr").remove();
                        else seen[txt] = true;
                    });

                    return false;
                });

                function uniqueArray(list) {
                    var result = [];
                    $.each(list, function (i, e) {
                        if ($.inArray(e, result) == -1) result.push(e);
                    });
                    return result;
                }
            });
        </script>

        <script>
            $(function () {
                (function ($) {
                    $('.has-spinners').attr("disabled", false);
                    $.fn.buttonLoader = function (action) {
                        var self = $(this);
                        if (action == 'start') {
                            if ($(self).attr("disabled") == "disabled") {
                                return false;
                            }
                            $('.has-spinners').attr("disabled", true);
                            $(self).attr('data-btn-text', $(self).html());
                            var text = 'Loading';
                            console.log($(self).attr('data-load-text'));
                            if ($(self).attr('data-load-text') != undefined && $(self).attr('data-load-text') != "") {
                                var text = $(self).attr('data-load-text');
                            }
                            $(self).html('<span class="spinners"><i class="fa fa-spinner fa-spin" title="button-loader"></i></span> ' + text);
                            $(self).addClass('active');
                        }
                        if (action == 'stop') {
                            $(self).html($(self).attr('data-btn-text'));
                            $(self).removeClass('active');
                            $('.has-spinners').attr("disabled", false);
                        }
                    }
                })(jQuery);

                !function (t) {
                    t(".has-spinners").attr("disabled", !1), t.fn.buttonLoader = function (a) {
                        var s = t(this);
                        if ("start" == a) {
                            if ("disabled" == t(s).attr("disabled"))
                                return !1; t(".has-spinners").attr("disabled", !0), t(s).attr("data-btn-text", t(s).text());
                            var e = "Loading";
                            if (console.log(t(s).attr("data-load-text")), void 0 != t(s).attr("data-load-text") && "" != t(s).attr("data-load-text"))
                                var e = t(s).attr("data-load-text"); t(s).html('<span class="spinners"><i class="fa fa-spinner fa-spin" title="button-loader"></i></span> ' + e), t(s).addClass("active")
                        } "stop" == a && (t(s).html(t(s).attr("data-btn-text")), t(s).removeClass("active"), t(".has-spinners").attr("disabled", !1))
                    }
                }(jQuery);

                $("body").on("click", "[id*=BTSUBMIT]", function () {
                    var btn = $(this);
                    $("#LBINFO").text('');
                    if ($("#TXTUSERNAME").val() == '' && $("#TXTPASSWORD").val() == '') {
                        $(".inputUser").removeClass('form-group');
                        $(".inputUser").addClass('form-group has-error');
                        $("#LBINFO").text('Field masih kosong. Wajib diisi!!!');
                        $(".inputPassword").removeClass('form-group');
                        $(".inputPassword").addClass('form-group has-error');
                        return false;
                    } else if ($("#TXTUSERNAME").val() == '') {
                        $(".inputUser").removeClass('form-group');
                        $(".inputUser").addClass('form-group has-error');
                        $("#LBINFO").text('Field masih kosong. Wajib diisi!!!');
                        return false;
                    } else if ($("#TXTPASSWORD").val() == '') {
                        $(".inputPassword").removeClass('form-group');
                        $(".inputPassword").addClass('form-group has-error');
                        $("#LBINFO").text('Field masih kosong. Wajib diisi!!!');
                        return false;
                    } else {
                        $(btn).buttonLoader('start');
                        return true;
                    }
                    return false;
                });

                (function ($) {
                    $('.has-spinners').attr("disabled", false);
                    $.fn.buttonLoader = function (action) {
                        var self = $(this);
                        if (action == 'start') {
                            if ($(self).attr("disabled") == "disabled") {
                                return false;
                            }
                            $('.has-spinners').attr("disabled", true);
                            $(self).attr('data-btn-text', $(self).html());
                            var text = 'Loading';
                            console.log($(self).attr('data-load-text'));
                            if ($(self).attr('data-load-text') != undefined && $(self).attr('data-load-text') != "") {
                                var text = $(self).attr('data-load-text');
                            }
                            $(self).html('<span class="spinners"><i class="fa fa-spinner fa-spin" title="button-loader"></i></span> ' + text);
                            $(self).addClass('active');
                        }
                        if (action == 'stop') {
                            $(self).html($(self).attr('data-btn-text'));
                            $(self).removeClass('active');
                            $('.has-spinners').attr("disabled", false);
                        }
                    }
                })(jQuery);

                !function (t) {
                    t(".has-spinners").attr("disabled", !1), t.fn.buttonLoader = function (a) {
                        var s = t(this);
                        if ("start" == a) {
                            if ("disabled" == t(s).attr("disabled"))
                                return !1; t(".has-spinners").attr("disabled", !0), t(s).attr("data-btn-text", t(s).text());
                            var e = "Loading";
                            if (console.log(t(s).attr("data-load-text")), void 0 != t(s).attr("data-load-text") && "" != t(s).attr("data-load-text"))
                                var e = t(s).attr("data-load-text"); t(s).html('<span class="spinners"><i class="fa fa-spinner fa-spin" title="button-loader"></i></span> ' + e), t(s).addClass("active")
                        } "stop" == a && (t(s).html(t(s).attr("data-btn-text")), t(s).removeClass("active"), t(".has-spinners").attr("disabled", !1))
                    }
                }(jQuery);
            });
        </script>
    </form>
</body>
</html>
