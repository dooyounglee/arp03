<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <!-- <script src="http://code.jquery.com/jquery-3.2.1.js">jQuery.noConflict();</script>  -->
    <script src="/${cp }/resources/material-pro/assets/plugins/jquery/jquery.min.js"></script>
    <script data-cfasync="false" src="/arp/resources/material-pro/email-decode.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="/${cp }/resources/material-pro/assets/plugins/popper/popper.min.js"></script>
    <script src="/${cp }/resources/material-pro/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="/${cp }/resources/material-pro/horizontal/js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="/${cp }/resources/material-pro/horizontal/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="/${cp }/resources/material-pro/horizontal/js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="/${cp }/resources/material-pro/assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="/${cp }/resources/material-pro/assets/plugins/sparkline/jquery.sparkline.min.js"></script>
    <!--Custom JavaScript -->
    <script src="/${cp }/resources/material-pro/horizontal/js/custom.min.js"></script>
    <!-- Editable -->
    <script src="/${cp }/resources/material-pro/assets/plugins/jsgrid/db.js"></script>
    <script type="text/javascript" src="/${cp }/resources/material-pro/assets/plugins/jsgrid/jsgrid.min.js"></script>
    <script src="/${cp }/resources/material-pro/horizontal/js/jsgrid-init.js"></script>
    <!-- Editable -->
    <script src="/${cp }/resources/material-pro/assets/plugins/jquery-datatables-editable/jquery.dataTables.js"></script>
    <script src="/${cp }/resources/material-pro/assets/plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="/${cp }/resources/material-pro/assets/plugins/tiny-editable/mindmup-editabletable.js"></script>
    <script src="/${cp }/resources/material-pro/assets/plugins/tiny-editable/numeric-input-example.js"></script>
    <script>
        $('#mainTable').editableTableWidget().numericInputExample().find('td:first').focus();
        $('#editable-datatable').editableTableWidget().numericInputExample().find('td:first').focus();
        $(function () {
            $('#editable-datatable').DataTable();
        });
    </script>
    <!-- ============================================================== -->
    <!-- This page plugins -->
    <!-- ============================================================== -->
    <!-- chartist chart -->
    <script src="/${cp }/resources/material-pro/assets/plugins/chartist-js/dist/chartist.min.js"></script>
    <script src="/${cp }/resources/material-pro/assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.min.js"></script>
    <!--c3 JavaScript -->
    <script src="/${cp }/resources/material-pro/assets/plugins/d3/d3.min.js"></script>
    <script src="/${cp }/resources/material-pro/assets/plugins/c3-master/c3.min.js"></script>
    <!-- Chart JS -->
    <script src="/${cp }/resources/material-pro/horizontal/js/dashboard1.js"></script>
    <!-- icheck -->
    <script src="/${cp }/resources/material-pro/assets/plugins/icheck/icheck.min.js"></script>
    <script src="/${cp }/resources/material-pro/assets/plugins/icheck/icheck.init.js"></script>
    <script src="/${cp }/resources/material-pro/assets/plugins/switchery/dist/switchery.min.js"></script>
    <script src="/${cp }/resources/material-pro/assets/plugins/select2/dist/js/select2.full.min.js" type="text/javascript"></script>
    <script src="/${cp }/resources/material-pro/assets/plugins/bootstrap-select/bootstrap-select.min.js" type="text/javascript"></script>
    <script src="/${cp }/resources/material-pro/assets/plugins/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
    <script src="/${cp }/resources/material-pro/assets/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.js"
        type="text/javascript"></script>
    <script src="/${cp }/resources/material-pro/assets/plugins/dff/dff.js" type="text/javascript"></script>
    <script type="text/javascript" src="/${cp }/resources/material-pro/assets/plugins/multiselect/js/jquery.multi-select.js"></script>
    <!-- <script>
        $(function () {
            // Switchery
            var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
            $('.js-switch').each(function () {
                new Switchery($(this)[0], $(this).data());
            });
            // For select 2
            $(".select2").select2();
            $('.selectpicker').selectpicker();
            //Bootstrap-TouchSpin
            $(".vertical-spin").TouchSpin({
                verticalbuttons: true
            });
            var vspinTrue = $(".vertical-spin").TouchSpin({
                verticalbuttons: true
            });
            if (vspinTrue) {
                $('.vertical-spin').prev('.bootstrap-touchspin-prefix').remove();
            }
            $("input[name='tch1']").TouchSpin({
                min: 0,
                max: 100,
                step: 0.1,
                decimals: 2,
                boostat: 5,
                maxboostedstep: 10,
                postfix: '%'
            });
            $("input[name='tch2']").TouchSpin({
                min: -1000000000,
                max: 1000000000,
                stepinterval: 50,
                maxboostedstep: 10000000,
                prefix: '$'
            });
            $("input[name='tch3']").TouchSpin();
            $("input[name='tch3_22']").TouchSpin({
                initval: 40
            });
            $("input[name='tch5']").TouchSpin({
                prefix: "pre",
                postfix: "post"
            });
            // For multiselect
            $('#pre-selected-options').multiSelect();
            $('#optgroup').multiSelect({
                selectableOptgroup: true
            });
            $('#public-methods').multiSelect();
            $('#select-all').click(function () {
                $('#public-methods').multiSelect('select_all');
                return false;
            });
            $('#deselect-all').click(function () {
                $('#public-methods').multiSelect('deselect_all');
                return false;
            });
            $('#refresh').on('click', function () {
                $('#public-methods').multiSelect('refresh');
                return false;
            });
            $('#add-option').on('click', function () {
                $('#public-methods').multiSelect('addOption', {
                    value: 42,
                    text: 'test 42',
                    index: 0
                });
                return false;
            });
            $(".ajax").select2({
                ajax: {
                    url: "https://api.github.com/search/repositories",
                    dataType: 'json',
                    delay: 250,
                    data: function (params) {
                        return {
                            q: params.term, // search term
                            page: params.page
                        };
                    },
                    processResults: function (data, params) {
                        // parse the results into the format expected by Select2
                        // since we are using custom formatting functions we do not need to
                        // alter the remote JSON data, except to indicate that infinite
                        // scrolling can be used
                        params.page = params.page || 1;
                        return {
                            results: data.items,
                            pagination: {
                                more: (params.page * 30) < data.total_count
                            }
                        };
                    },
                    cache: true
                },
                escapeMarkup: function (markup) {
                    return markup;
                }, // let our custom formatter work
                minimumInputLength: 1,
                //templateResult: formatRepo, // omitted for brevity, see the source of this page
                //templateSelection: formatRepoSelection // omitted for brevity, see the source of this page
            });
        });
    </script> -->
    <!-- ============================================================== -->
    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="/${cp }/resources/material-pro/assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>