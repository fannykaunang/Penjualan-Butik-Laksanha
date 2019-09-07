<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Barang.aspx.vb" Inherits="kasir_input_Barang" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Input Barang | Penjualan Butik</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
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

    <script type="text/javascript">
        function RefreshUpdatePanel() {
            __doPostBack('<%= Me.TXTSEARCH.ClientID %>', '');
        };
    </script>
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
                        <asp:LinkButton ID="BTLIST" runat="server" CssClass="btn btn-primary" PostBackUrl="~/kasir/output/list-barang.aspx"><i class="fas fa-list"></i>&nbsp;List Barang</asp:LinkButton>
                    </li>
                </ul>
            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <!-- Brand Logo -->
                <a href="../../index3.html" class="brand-link">
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
                            <asp:LinkButton ID="BTPROFILE" runat="server" CssClass="d-block"></asp:LinkButton>
                        </div>
                    </div>

                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                            <li class="nav-item">
                                <a href="../../Default.aspx" class="nav-link">
                                    <i class="nav-icon fas fa-tachometer-alt"></i>
                                    <p>Dashboard</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../widgets.html" class="nav-link">
                                    <i class="nav-icon fas fa-book-open"></i>
                                    <p>
                                        Master
                                    <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="Barang.aspx" class="nav-link">
                                            <i class="fas fa-cube nav-icon"></i>
                                            <p>Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../../index2.html" class="nav-link">
                                            <i class="fas fa-align-center nav-icon"></i>
                                            <p>Kategori Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../../index3.html" class="nav-link">
                                            <i class="fas fa-shuttle-van nav-icon"></i>
                                            <p>Supplier</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../../index3.html" class="nav-link">
                                            <i class="fas fa-chalkboard-teacher nav-icon"></i>
                                            <p>Konsumen</p>
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
                                        <a href="../charts/chartjs.html" class="nav-link">
                                            <i class="fas fa-cloud-download-alt nav-icon"></i>
                                            <p>Transaksi Penerimaan</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../charts/flot.html" class="nav-link">
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
                                        <a href="../charts/chartjs.html" class="nav-link">
                                            <i class="far fa-clipboard nav-icon"></i>
                                            <p>Daftar Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../charts/flot.html" class="nav-link">
                                            <i class="fas fa-poll-h nav-icon"></i>
                                            <p>Stok Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../charts/flot.html" class="nav-link">
                                            <i class="fas fa-file-download nav-icon"></i>
                                            <p>Transaksi Penerimaan</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../charts/flot.html" class="nav-link">
                                            <i class="fas fa-file-upload nav-icon"></i>
                                            <p>Transaksi Penjualan</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-header">AKUN</li>
                            <li class="nav-item">
                                <a href="../../Default.aspx" class="nav-link">
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
                                <h1>Data Barang</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="../../Default.aspx">Home</a></li>
                                    <li class="breadcrumb-item active">Barang</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content">
                    <!-- Default box -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Input Barang</h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="TXTKDBARANG">Kode Barang</label>
                                        <asp:TextBox ID="TXTKDBARANG" runat="server" CssClass="form-control" placeholder="Masukkan Kode Barang"></asp:TextBox>
                                        <span id="LBINFOKDBARANG" class="help-block" style="color: #dc3545"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="TXTNAMABARANG">Nama Barang</label>
                                        <asp:TextBox ID="TXTNAMABARANG" runat="server" CssClass="form-control" placeholder="Masukkan Nama Barang"></asp:TextBox>
                                        <span id="LBINFONAMABARANG" class="help-block" style="color: #dc3545"></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Kategori</label>
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
                                        <asp:Label ID="LBINFOKATEGORI" runat="server" Style="color: #dc3545"></asp:Label>


                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="TXTHARGAJUAL">Harga Jual</label>
                                        <asp:TextBox ID="TXTHARGAJUAL" runat="server" CssClass="form-control" placeholder="Masukkan Harga Jual Barang"></asp:TextBox>
                                        <span id="LBINFOHARGAJUAL" class="help-block" style="color: #dc3545"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="TXTUKURAN">Ukuran</label>
                                        <asp:DropDownList ID="TXTUKURAN" CssClass="form-control select2"
                                            Style="width: 100%;" runat="server">
                                            <asp:ListItem>--Pilih--</asp:ListItem>
                                            <asp:ListItem>S (Small)</asp:ListItem>
                                            <asp:ListItem>M (Medium)</asp:ListItem>
                                            <asp:ListItem>L (Large)</asp:ListItem>
                                            <asp:ListItem>XL (Extra Large)</asp:ListItem>
                                            <asp:ListItem>XXL (Double Extra Large)</asp:ListItem>
                                        </asp:DropDownList>
                                        <span id="LBINFOUKURAN" class="help-block" style="color: #dc3545"></span>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="FUUPLOAD">Upload Gambar</label>
                                        <div class="col-md-12">
                                            <!-- Profile Image -->
                                            <div class="card card-primary card-outline">
                                                <div class="card-body box-profile">
                                                    <div class="text-center">
                                                        <asp:Image ID="imgBarang" runat="server" CssClass="profile-user-img img-fluid img-circle" />
                                                    </div>
                                                    <h3 class="profile-username text-center">
                                                        <span id="LBINFOGAMBAR" class="help-block" style="color: #dc3545"></span>
                                                    </h3>
                                                    <asp:FileUpload ID="FUUPLOAD" CssClass="btn btn-primary btn-block" runat="server" />
                                                    <%--<asp:LinkButton ID="LinkButton1" runat="server" OnClick="BTBARCODE_Click" CssClass="btn btn-primary btn-block">Generate New Barcode</asp:LinkButton>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="plBarCode">Barcode</label>
                                        <div class="col-md-12">
                                            <!-- Profile Image -->
                                            <div class="card card-primary card-outline">
                                                <div class="card-body box-profile">
                                                    <div class="text-center">
                                                        <asp:PlaceHolder ID="plBarCode" runat="server" />
                                                    </div>
                                                    <h3 class="profile-username text-center">
                                                        <asp:Label ID="LBBARCODE" runat="server"></asp:Label>
                                                        <span id="LBINFOBARCODE" class="help-block" style="color: #dc3545"></span>
                                                    </h3>
                                                    <%--<asp:LinkButton ID="BTBARCODE" runat="server" OnClick="BTBARCODE_Click" CssClass="btn btn-primary btn-block">Generate New Barcode</asp:LinkButton>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <asp:LinkButton ID="BTSIMPAN" runat="server" CssClass="btn btn-primary has-spinners" OnClientClick="return getCalculationGrid(this);" OnClick="BTSIMPAN_Click"><i class="fa fa-download"></i> Simpan</asp:LinkButton>
                            <asp:LinkButton ID="BTBATAL" runat="server" CssClass="btn btn-danger"><i class="fa fa-minus-circle"></i> Batal</asp:LinkButton>
                        </div>
                    </div>
                </section>

                <asp:Panel ID="Panel1" runat="server" Style="display: none">
                    <section class="content">
                        <div class="container-fluid">
                            <div class="card card-default">
                                <div class="card-header">
                                    <h3 class="card-title">Detail Penerimaan</h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>No. Invoice/Faktur</label>
                                                <asp:TextBox ID="TXTFAKTUR" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:Image ID="imgLoadingFaktur" runat="server" ImageUrl="~/images/loader.gif" Height="20" Width="20" Style="display: none" />
                                                <span id="LBINFOFAKTUR" class="help-block" style="color: #dc3545"></span>
                                            </div>
                                            <!-- /.form-group -->
                                            <div class="form-group">
                                                <label>Tanggal</label>
                                                <asp:TextBox ID="TXTTGLPENERIMAAN" runat="server" CssClass="form-control"></asp:TextBox>
                                                <span id="LbTGLPENERIMAAN" class="help-block" style="color: #dc3545"></span>
                                            </div>
                                            <!-- /.form-group -->
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Total Harga Beli</label>
                                                <asp:Label ID="TXTTOTALHARGABELI" runat="server" Text="0" CssClass="form-control"></asp:Label>
                                                <asp:TextBox ID="TXTTOTALBAYAR" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
                                                <span id="LBTOTALBAYAR" class="help"></span>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Keterangan</label>
                                                <asp:TextBox ID="TXTKETERANGAN" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!-- /.col -->
                                    </div>
                                    <!-- /.row -->
                                </div>
                                <!-- /.card-body -->
                                <div class="card-footer">
                                    <asp:Label ID="lblText" runat="server"></asp:Label>

                                    <asp:HiddenField ID="TXTID" runat="server" />
                                    <asp:HiddenField ID="TXTIDFAKTUR" runat="server" />
                                </div>
                            </div>
                        </div>
                    </section>
                </asp:Panel>
            </div>

            <div class="modal fade" id="divBarang" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="H2">Pilih Barang</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <div class="col-lg-12">
                                    <div style="display: inline-block; width: 400px; max-width: 90%;">
                                        <asp:TextBox ID="TXTSEARCH" runat="server" CssClass="form-control" onkeyup="RefreshUpdatePanel();" AutoPostBack="true" OnTextChanged="TXTSEARCH_TextChanged"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="table-responsive">
                                                <asp:GridView ID="GVBARANG" runat="server" CssClass="table table-bordered table-striped table-hover js-basic-example dataTable" AutoGenerateColumns="False" EnableSortingAndPagingCallbacks="false"
                                                    DataKeyNames="KODE_BARANG" Font-Size="X-Small" GridLines="Both" AllowPaging="True" OnPageIndexChanging="GVBARANG_PageIndexChanging" PageSize="5" PagerStyle-CssClass="pagination-ys">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="NO.">
                                                            <ItemTemplate>
                                                                <%# Container.DataItemIndex + 1 %>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-CssClass="myRow" HeaderStyle-CssClass="myRow">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkSelect" runat="server" />
                                                                <asp:HiddenField ID="hfKODE_BARANG" runat="server" Value='<%# Eval("KODE_BARANG")%>' />
                                                                <asp:HiddenField ID="HFIDBARANG" runat="server" Value='<%# Eval("ID_BARANG")%>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>GAMBAR</HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Image ID="LbFilePath" runat="server" ImageUrl='<%# Eval("GAMBAR_FILEPATH")%>' Height="50px" Width="40px"></asp:Image>
                                                                <asp:Image ID="LbFilePath2" runat="server" Visible="false" ImageUrl="~/dist/img/No_Image-128.png" Height="50px" Width="40px"></asp:Image>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="NAMA_BARANG" HeaderText="NAMA_BARANG" ReadOnly="True" />
                                                        <asp:BoundField DataField="KATEGORI_BARANG" HeaderText="KATEGORI_BARANG" ReadOnly="true" />
                                                        <asp:BoundField DataField="BARCODE_ID" HeaderText="BARCODE_ID" ReadOnly="true" />
                                                        <asp:BoundField DataField="HARGA_JUAL" HeaderText="HARGA_JUAL" ReadOnly="true" />
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="GVBARANG" EventName="PageIndexChanging" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="TXTSEARCH" EventName="TextChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="pull-left">
                                <asp:Label ID="TXTTOTALSPAREPART" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="btCheck" class="btn btn-success">Masukkan</button>
                            <button type="button" id="btDismissSparepart" class="btn btn-default" data-dismiss="modal">KELUAR</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="modal-info-barang">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <%--    <div class="overlay d-flex justify-content-center align-items-center">
                            <i class="fas fa-2x fa-sync fa-spin"></i>
                        </div>--%>
                        <div class="modal-header">
                            <h4 class="modal-title">Informasi Barang</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="card card-primary card-outline">
                                <div class="card-body box-profile text-black-50">
                                    <div class="text-center">
                                        <img class="profile-user-img img-fluid img-circle" id="modal-img-barang" src="../../dist/img/credit/boutique-logo.jpg" alt="Logo Barang">
                                    </div>

                                    <h3 class="profile-username text-center" id="modal-nama-barang"></h3>

                                    <%--<p class="text-muted text-center">Software Engineer</p>--%>

                                    <ul class="list-group list-group-unbordered mb-3 text-black-50">
                                        <%--                                        <li class="list-group-item text-black-50">
                                            <b>Kode Barang</b> <a class="float-right text-black-50" id="modal-kode-barang"></a>
                                        </li>--%>
                                        <li class="list-group-item">
                                            <b>Stok Akhir</b> <a class="float-right text-black-50" id="modal-stokakhir-barang"></a>
                                        </li>
                                        <li class="list-group-item">
                                            <b>Harga Beli</b> <a class="float-right text-black-50" id="modal-hargabeli-barang"></a>
                                        </li>
                                        <li class="list-group-item">
                                            <b>Harga Jual</b> <a class="float-right text-black-50" id="modal-hargajual-barang"></a>
                                        </li>
                                        <li class="list-group-item">
                                            <b>Kategori</b> <a class="float-right text-black-50" id="modal-kategori-barang"></a>
                                        </li>
                                        <li class="list-group-item">
                                            <b>Supplier</b> <a class="float-right text-black-50" id="modal-supplier-barang"></a>
                                        </li>
                                        <li class="list-group-item">
                                            <b>Kasir</b> <a class="float-right text-black-50" id="modal-kasir-barang"></a>
                                        </li>
                                        <li class="list-group-item">
                                            <b>Tanggal Masuk</b> <a class="float-right text-black-50" id="modal-tgl-barang"></a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Keluar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
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

        <script type="text/javascript">
            function animateBarcode() {
                $('html, body').animate({
                    scrollTop: parseInt($("#FUUPLOAD").offset().top)
                }, 2000);
            }
        </script>

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

        <script>
            function getCalculationGrid(button) {
                var btn = $(button);
                var isValid = true;
                if ($('#TXTKDBARANG').val() == '') {
                    isValid = false;
                    $("[id*=TXTKDBARANG]").focus();
                    $("[id*=LBINFOKDBARANG]").text("Kode Barang jangan dibiarkan kosong!");
                    alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>Kode Barang jangan dibiarkan kosong!');
                    return false;
                } else if ($('#TXTNAMABARANG').val() == '') {
                    isValid = false;
                    $("[id*=TXTNAMABARANG]").focus();
                    $("[id*=LBINFONAMABARANG]").text("Silahkan masukkan Nama Barang terlebih dahulu!");
                    alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>Silahkan masukkan Nama Barang terlebih dahulu!');
                    return false;
                } else if ($('#TXTHARGAJUAL').val() == '') {
                    isValid = false;
                    $("[id*=TXTHARGAJUAL]").focus();
                    $("[id*=LBINFOHARGAJUAL]").text("Silahkan masukkan Harga Jual terlebih dahulu!");
                    alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>Silahkan masukkan Harga Jual terlebih dahulu!');
                    return false;
                } else if ($('#TXTKATEGORI').val() == '--Pilih--') {
                    isValid = false;
                    $("[id*=TXTKATEGORI]").focus();
                    $("[id*=LBINFOKATEGORI]").text("Silahkan pilih Kategori!");
                    alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>Silahkan pilih Kategori!');
                    return false;
                } else if ($("[id*=FUUPLOAD]").val() == '') {
                    isValid = false;
                    $("[id*=FUUPLOAD]").focus();
                    $("[id*=LBINFOGAMBAR]").text("Silahkan masukkan Gambar barang!");
                    alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>Silahkan masukkan Gambar barang!');
                    return false;
                } else {
                    isValid = true;
                    $("[id*=LBINFOKDBARANG]").text("");
                    $("[id*=LBINFONAMABARANG]").text("");
                    $("[id*=LBINFOHARGAJUAL]").text("");
                    $("[id*=LBINFOKATEGORI]").text("");
                    $("[id*=LBINFOGAMBAR]").text("");
                    $('#Button1').click();
                    return true;
                }
            };
        </script>

        <script type="text/javascript">
            $(function () {
                $('#FUUPLOAD').change(function () {
                    var file = this.files[0];
                    var reader = new FileReader();

                    var fileUpload = $("#FUUPLOAD").get(0);
                    var files = fileUpload.files;

                    reader.onloadend = function () {
                        $('#imgBarang').attr('src', reader.result);
                    }
                    if (file) {
                        reader.readAsDataURL(file);

                        var data = new FormData();
                        for (var i = 0; i < files.length; i++) {
                            data.append(files[i].name, files[i]);
                        }
                    }
                });

                $("#TXTKATEGORI").change(function () {
                    $("#LBINFOKATEGORI").text("");
                });

                var inputfaktur = false;
                $("#TXTKDBARANG").keyup(function () {
                    var kdbarang = $(this);
                    $.ajax({
                        type: "POST",
                        url: '<%=ResolveUrl("~/kasir/input/Barang.aspx/GET_KDBARANG")%>',
                        data: JSON.stringify({ "KDBARANG": kdbarang.val() }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        async: false,
                        success: function (result) {
                            if (result.d.length > 0) {
                                alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>Kode Barang sudah terdaftar.Tidak dapat menyimpan kode yang sama');
                                $("[id*=LBINFOKDBARANG]").text("Kode Barang sudah terdaftar!");
                                inputfaktur = true;
                            } else {
                                $("[id*=LBINFOKDBARANG]").text(null);
                                inputfaktur = false;
                            }
                        },
                        error: function (err, result) { alert(err.responseText); }
                    });
                });

                $('#TXTHARGAJUAL').on('keydown', function (e) {
                    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                        (e.keyCode == 65 && e.ctrlKey === true) ||
                        (e.keyCode >= 35 && e.keyCode <= 39)) {
                        return;
                    }

                    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                        e.preventDefault();
                        $("[id*=LBINFOHARGAJUAL]").text('Harap diisi dengan angka!!!');
                    } else {
                        $("[id*=LBINFOHARGAJUAL]").text('');
                    }
                });
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
