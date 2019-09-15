<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Konsumen.aspx.vb" Inherits="kasir_input_Konsumen" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Input Supplier | Penjualan Butik</title>
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
                                        <a href="Barang.aspx" class="nav-link">
                                            <i class="fas fa-cube nav-icon"></i>
                                            <p>Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="Kategori_Barang.aspx" class="nav-link">
                                            <i class="fas fa-align-center nav-icon"></i>
                                            <p>Kategori Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="Supplier.aspx" class="nav-link">
                                            <i class="fas fa-shuttle-van nav-icon"></i>
                                            <p>Supplier</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="Konsumen.aspx" class="nav-link">
                                            <i class="fas fa-chalkboard-teacher nav-icon"></i>
                                            <p>Konsumen</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="Pengguna.aspx" class="nav-link">
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
                                        <a href="Penerimaan.aspx" class="nav-link">
                                            <i class="fas fa-cloud-download-alt nav-icon"></i>
                                            <p>Transaksi Penerimaan</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="Penjualan.aspx" class="nav-link">
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
                                        <a href="../output/list-barang.aspx" class="nav-link">
                                            <i class="far fa-clipboard nav-icon"></i>
                                            <p>Daftar Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../output/kartu-stok-barang.aspx" class="nav-link">
                                            <i class="fas fa-poll-h nav-icon"></i>
                                            <p>Stok Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../output/list-penerimaan.aspx" class="nav-link">
                                            <i class="fas fa-file-download nav-icon"></i>
                                            <p>Transaksi Penerimaan</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../output/list-penjualan.aspx" class="nav-link">
                                            <i class="fas fa-file-upload nav-icon"></i>
                                            <p>Transaksi Penjualan</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../output/list-pengguna.aspx" class="nav-link">
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
                                <h1>Data Konsumen</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="../../Default.aspx">Home</a></li>
                                    <li class="breadcrumb-item active">Konsumen</li>
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
                            <h3 class="card-title">Input Konsumen</h3>
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
                                        <label for="TXTNAMAKONSUMEN">Nama Konsumen</label>
                                        <asp:TextBox ID="TXTNAMAKONSUMEN" runat="server" CssClass="form-control" placeholder="Masukkan Nama Konsumen"></asp:TextBox>
                                        <span id="LBINFOKONSUMEN" class="help-block" style="color: #dc3545"></span>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="TXTALAMAT">Alamat</label>
                                        <asp:TextBox ID="TXTALAMAT" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Masukkan Alamat Konsumen"></asp:TextBox>
                                        <span id="LBINFOALAMAT" class="help-block" style="color: #dc3545"></span>
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
                if ($('#TXTNAMAKONSUMEN').val() == '') {
                    isValid = false;
                    $("[id*=TXTNAMAKONSUMEN]").focus();
                    $("[id*=LBINFOKONSUMEN]").text("Nama Konsumen jangan dibiarkan kosong!");
                    alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>Nama Konsumen jangan dibiarkan kosong!');
                    return false;
                } else if ($('#TXTALAMAT').val() == '') {
                    isValid = false;
                    $("[id*=TXTALAMAT]").focus();
                    $("[id*=LBINFOALAMAT]").text("Silahkan masukkan Alamat terlebih dahulu!");
                    alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>Silahkan masukkan Alamat terlebih dahulu!');
                    return false;
                } else {
                    isValid = true;
                    $("[id*=LBINFOKONSUMEN]").text("");
                    $("[id*=LBINFOALAMAT]").text("");
                    $('#Button1').click();
                    return true;
                }
            };
        </script>

        <script type="text/javascript">
            $(function () {
                $("#TXTKATEGORI").change(function () {
                    $("#LBINFOKATEGORI").text("");
                });

                $("body").on("click", "[id*=BTSIMPAN]", function (e) {
                    $(this).buttonLoader('start');
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
            });
        </script>
    </form>
</body>
</html>
