<%@ Page Language="VB" AutoEventWireup="false" CodeFile="User-Profile.aspx.vb" Inherits="account_User_Profile" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>User Profile | Penjualan Butik</title>
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
                                        <a href="../kasir/input/Barang.aspx" class="nav-link">
                                            <i class="fas fa-cube nav-icon"></i>
                                            <p>Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../kasir/input/Kategori_Barang.aspx" class="nav-link">
                                            <i class="fas fa-align-center nav-icon"></i>
                                            <p>Kategori Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../kasir/input/Supplier.aspx" class="nav-link">
                                            <i class="fas fa-shuttle-van nav-icon"></i>
                                            <p>Supplier</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../kasir/input/Konsumen.aspx" class="nav-link">
                                            <i class="fas fa-chalkboard-teacher nav-icon"></i>
                                            <p>Konsumen</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../kasir/input/Pengguna.aspx" class="nav-link">
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
                                        <a href="../kasir/input/Penerimaan.aspx" class="nav-link">
                                            <i class="fas fa-cloud-download-alt nav-icon"></i>
                                            <p>Transaksi Penerimaan</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../kasir/input/Penjualan.aspx" class="nav-link">
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
                                        <a href="../kasir/output/list-barang.aspx" class="nav-link">
                                            <i class="far fa-clipboard nav-icon"></i>
                                            <p>Daftar Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../kasir/output/kartu-stok-barang.aspx" class="nav-link">
                                            <i class="fas fa-poll-h nav-icon"></i>
                                            <p>Stok Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../kasir/output/list-penerimaan.aspx" class="nav-link">
                                            <i class="fas fa-file-download nav-icon"></i>
                                            <p>Transaksi Penerimaan</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../kasir/output/list-penjualan.aspx" class="nav-link">
                                            <i class="fas fa-file-upload nav-icon"></i>
                                            <p>Transaksi Penjualan</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../kasir/output/list-pengguna.aspx" class="nav-link">
                                            <i class="fas fa-address-card nav-icon"></i>
                                            <p>Daftar Pengguna</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-header">AKUN</li>
                            <li class="nav-item">
                                <a href="User-Profile.aspx" class="nav-link">
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
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Profile</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">User Profile</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-3">
                                <!-- Profile Image -->
                                <div class="card card-primary card-outline">
                                    <div class="card-body box-profile">
                                        <div class="text-center">
                                            <div class="overlay-box">
                                                <div class="user-content">
                                                    <a class="myA" href="#"></a>
                                                    <div class="box">
                                                        <asp:Image ID="imgBarang" runat="server" AlternateText="User profile picture" CssClass="profile-user-img" ImageUrl="~/dist/img/No_Image-128.png" Style="width: 50%;" />
                                                        <div class="mask">
                                                            <span style="font-size: x-small">Biarkan kosong jika tidak ada perubahan gambar</span><br />
                                                            <asp:Button ID="BTBROWSEGAMBAREDIT" CssClass="btn btn-success" runat="server" Text="Browse Gambar" />
                                                            <asp:FileUpload ID="FUUPLOAD" CssClass="btn btn-success" Style="visibility: hidden" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <h3 class="profile-username text-center">
                                            <asp:Label ID="LBNAMAUSER" runat="server"></asp:Label></h3>

                                        <p class="text-muted text-center">
                                            <asp:Label ID="LBEMAIL" runat="server"></asp:Label>
                                        </p>

                                        <ul class="list-group list-group-unbordered mb-3">
                                            <li class="list-group-item">
                                                <b>Type</b> <a class="float-right">
                                                    <asp:Label ID="LBUSERTYPE" runat="server"></asp:Label></a>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                            </div>
                            <!-- /.col -->
                            <div class="col-md-9">
                                <div class="card">
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label for="TXTNAMAPENGGUNA" class="col-sm-4 control-label">Nama Pengguna</label>
                                                <div class="col-sm-12">
                                                    <asp:TextBox ID="TXTNAMAPENGGUNA" runat="server" CssClass="form-control" placeholder="Nama Pengguna"></asp:TextBox>
                                                    <asp:HiddenField ID="HFIDUSER" runat="server" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="TXTEMAIL" class="col-sm-4 control-label">Email</label>
                                                <div class="col-sm-12">
                                                    <asp:TextBox ID="TXTEMAIL" runat="server" CssClass="form-control" TextMode="Email" placeholder="Email"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputName2" class="col-sm-4 control-label">Password</label>
                                                <div class="col-sm-12">
                                                    <asp:TextBox ID="TXTPASSWORD" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputExperience" class="col-sm-4 control-label">Ulangi Password</label>
                                                <div class="col-sm-12">
                                                    <asp:TextBox ID="TXTPASSWORDULANG" runat="server" CssClass="form-control" TextMode="Password" placeholder="Ulangi Password"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-10">
                                                    <asp:LinkButton ID="BTSIMPAN" runat="server" CssClass="btn btn-danger" OnClientClick="return getVerificationBeforeSave(this);" OnClick="BTSIMPAN_Click">Simpan</asp:LinkButton>
                                                </div>
                                            </div>
                                            <asp:Image ID="loadingImg" runat="server" ImageUrl="~/dist/img/loading.gif" />
                                        </div>
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                                <!-- /.nav-tabs-custom -->
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </section>
                <!-- /.content -->
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
            function getVerificationBeforeSave(button) {
                var btn = $(button);
                if ($('#TXTPASSWORD').val() == '') {
                    $("#modal-warning").modal('show');
                    $('#modal-text-info').text('Password harus diisi!');
                    return false;
                } else if ($('#TXTPASSWORDULANG').val() == '') {
                    $("#modal-warning").modal('show');
                    $('#modal-text-info').text('Ulangi Password harus diisi!');
                    return false;
                } else if ($('#TXTPASSWORD').val() != $('#TXTPASSWORDULANG').val()) {
                    $("#modal-warning").modal('show');
                    $('#modal-text-info').text('Ulangi Password harus sama!');
                    return false;
                } else {
                    $(btn).buttonLoader('start');
                    $("#loadingImg").css("display", "block");
                    Loading();
                    return true;
                }
            };
        </script>

        <script type="text/javascript">
            $(function () {
                function Loading() {
                    $("#loadingImg").fadeIn().delay(3000);
                }

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

                $('body').on('click', '[id*=BTBROWSEGAMBAREDIT]', function () {
                    $("#FUUPLOAD")[0].click();
                    return false;
                });

                //$("body").on("click", "[id*=BTSIMPAN]", function () {
                //    if ($('#TXTPASSWORD').val() == '') {
                //        $('#modal-text-info').text('Password harus diisi!');
                //    } else if ($('#TXTPASSWORDULANG').val() == '') {
                //        $('#modal-text-info').text('Ulangi Password harus diisi!');
                //    } else {
                //        $(this).buttonLoader('start');
                //        $("#loadingImg").css("display", "block");
                //        Loading();
                //    }
                //});
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

