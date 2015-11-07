" Extends Verilog syntax
" Requires $VIMRUNTIME/syntax/verilog.vim to exist

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


" Read in Verilog syntax files
if version < 600
  so syntax/verilog.vim
else
  runtime! syntax/verilog.vim
endif


syn sync lines=1000

"##########################################################
"       SystemVerilog Syntax
"##########################################################

syn keyword verilogStatement   always_comb always_ff always_latch
syn keyword verilogStatement   class endclass
syn keyword verilogStatement   virtual local const protected
syn keyword verilogStatement   package endpackage
syn keyword verilogStatement   rand randc constraint randomize
syn keyword verilogStatement   with inside dist
syn keyword verilogStatement   randcase
syn keyword verilogStatement   sequence endsequence randsequence
syn keyword verilogStatement   get_randstate set_randstate
syn keyword verilogStatement   srandom
syn keyword verilogStatement   logic bit byte time
syn keyword verilogStatement   int longint shortint
syn keyword verilogStatement   struct packed
syn keyword verilogStatement   final
syn keyword verilogStatement   import export
syn keyword verilogStatement   context pure
syn keyword verilogStatement   void shortreal chandle string
syn keyword verilogStatement   clocking endclocking
syn keyword verilogStatement   interface endinterface modport
syn keyword verilogStatement   cover covergroup coverpoint endgroup
syn keyword verilogStatement   property endproperty
syn keyword verilogStatement   program endprogram
syn keyword verilogStatement   bins binsof illegal_bins ignore_bins
syn keyword verilogStatement   alias matches solve static assert
syn keyword verilogStatement   assume super before expect bind
syn keyword verilogStatement   extends null tagged extern this
syn keyword verilogStatement   first_match throughout timeprecision
syn keyword verilogStatement   timeunit priority type union
syn keyword verilogStatement   uwire var cross ref wait_order intersect
syn keyword verilogStatement   wildcard within
syn keyword verilogStatement   triggered
syn keyword verilogStatement   std
syn keyword verilogStatement   new

syn keyword verilogTypeDef     typedef enum

syn keyword verilogConditional iff

syn keyword verilogRepeat      return break continue
syn keyword verilogRepeat      do while foreach

syn keyword verilogLabel       join_any join_none forkjoin

syn keyword verilogStatement   always and assign automatic buf
syn keyword verilogStatement   bufif0 bufif1 cell cmos
syn keyword verilogStatement   config deassign defparam design
syn keyword verilogStatement   disable edge endconfig
syn keyword verilogStatement   endfunction endgenerate endmodule
syn keyword verilogStatement   endprimitive endspecify endtable endtask
syn keyword verilogStatement   force function
syn keyword verilogStatement   generate genvar highz0 highz1 ifnone
syn keyword verilogStatement   incdir include initial inout input ref
syn keyword verilogStatement   instance large liblist
syn keyword verilogStatement   library localparam macromodule medium
syn keyword verilogStatement   module nand negedge nmos nor
syn keyword verilogStatement   noshowcancelled not notif0 notif1 or
syn keyword verilogStatement   output parameter pmos posedge primitive
syn keyword verilogStatement   pull0 pull1 pulldown pullup
syn keyword verilogStatement   pulsestyle_onevent pulsestyle_ondetect
syn keyword verilogStatement   rcmos realtime release
syn keyword verilogStatement   rnmos rpmos rtran rtranif0 rtranif1
syn keyword verilogStatement   scalared showcancelled small
syn keyword verilogStatement   specify specparam strong0 strong1
syn keyword verilogStatement   supply0 supply1 table task tran
syn keyword verilogStatement   tranif0 tranif1 tri tri0 tri1 triand
syn keyword verilogStatement   trior trireg use vectored wait
syn keyword verilogStatement   wand weak0 weak1 wire wor xnor xor
syn keyword verilogLabel       begin end fork join join_none join_any
syn keyword verilogStatement   static automatic const
syn keyword verilogConditional if else case casex casez default endcase
syn keyword verilogRepeat      forever repeat while for

syn keyword verilogStatement   import class endclass extends virtual local protected
syn keyword verilogStatement   new interface endinterface modport extern forkjoin package
syn keyword verilogStatement   rand constraint typedef randc
syn keyword verilogStatement   assert covergroup endgroup coverpoint

syn keyword verilogType int string enum signed unsigned bit void logic integer reg real time event

syn keyword verilogType analysis_fifo analysis_if avm_transport_imp avm_virtual_class
syn keyword verilogType cdns_hierarchy_only_printer cdns_list_printer cdns_phase_process_watcher
syn keyword verilogType default_report_server ovm_agent ovm_algorithmic_comparator
syn keyword verilogType ovm_analysis_export ovm_analysis_imp ovm_analysis_port ovm_barrier
syn keyword verilogType ovm_barrier_pool ovm_blocking_get_export ovm_blocking_get_imp
syn keyword verilogType ovm_blocking_get_peek_export ovm_blocking_get_peek_imp
syn keyword verilogType ovm_blocking_get_peek_port ovm_blocking_get_port ovm_blocking_master_export
syn keyword verilogType ovm_blocking_master_imp ovm_blocking_master_port ovm_blocking_peek_export
syn keyword verilogType ovm_blocking_peek_imp ovm_blocking_peek_port ovm_blocking_put_export
syn keyword verilogType ovm_blocking_put_imp ovm_blocking_put_port ovm_blocking_slave_export
syn keyword verilogType ovm_blocking_slave_imp ovm_blocking_slave_port ovm_blocking_transport_export
syn keyword verilogType ovm_blocking_transport_imp ovm_blocking_transport_port ovm_built_in_clone
syn keyword verilogType ovm_built_in_comp ovm_built_in_converter ovm_built_in_pair
syn keyword verilogType ovm_class_clone ovm_class_comp ovm_class_converter ovm_class_pair
syn keyword verilogType ovm_comparer ovm_component ovm_component_registry ovm_config_setting
syn keyword verilogType ovm_connector ovm_connector_base ovm_copy_map ovm_driver ovm_env ovm_event
syn keyword verilogType ovm_event_callback ovm_event_pool ovm_factory ovm_factory_override
syn keyword verilogType ovm_get_export ovm_get_imp ovm_get_peek_export ovm_get_peek_imp
syn keyword verilogType ovm_get_peek_port ovm_get_port ovm_hash ovm_hier_printer_knobs
syn keyword verilogType ovm_if_container ovm_in_order_built_in_comparator
syn keyword verilogType ovm_in_order_class_comparator ovm_in_order_comparator
syn keyword verilogType ovm_int_config_setting ovm_line_printer ovm_master_export ovm_master_imp
syn keyword verilogType ovm_master_port ovm_monitor ovm_nonblocking_get_export
syn keyword verilogType ovm_nonblocking_get_imp ovm_nonblocking_get_peek_export
syn keyword verilogType ovm_nonblocking_get_peek_imp ovm_nonblocking_get_peek_port
syn keyword verilogType ovm_nonblocking_get_port ovm_nonblocking_master_export
syn keyword verilogType ovm_nonblocking_master_imp ovm_nonblocking_master_port
syn keyword verilogType ovm_nonblocking_peek_export ovm_nonblocking_peek_imp
syn keyword verilogType ovm_nonblocking_peek_port ovm_nonblocking_put_export
syn keyword verilogType ovm_nonblocking_put_imp ovm_nonblocking_put_port
syn keyword verilogType ovm_nonblocking_slave_export ovm_nonblocking_slave_imp
syn keyword verilogType ovm_nonblocking_slave_port ovm_nonblocking_transport_export
syn keyword verilogType ovm_nonblocking_transport_imp ovm_nonblocking_transport_port
syn keyword verilogType ovm_object ovm_object_config_setting ovm_object_registry ovm_object_wrapper
syn keyword verilogType ovm_options_container ovm_packer ovm_peek_export ovm_peek_imp ovm_peek_port
syn keyword verilogType ovm_port_base ovm_port_base_base ovm_printer ovm_printer_knobs
syn keyword verilogType ovm_put_export ovm_put_imp ovm_put_port ovm_random_stimulus ovm_recorder
syn keyword verilogType ovm_report_global_server ovm_report_handler ovm_report_object
syn keyword verilogType ovm_report_server ovm_reporter ovm_req_rsp_driver ovm_root ovm_scope_stack
syn keyword verilogType ovm_scoreboard ovm_seq_item_prod_if ovm_slave_export ovm_slave_imp
syn keyword verilogType ovm_slave_port ovm_status_container ovm_string_config_setting ovm_subscriber
syn keyword verilogType ovm_table_printer ovm_table_printer_knobs ovm_test ovm_text_recorder
syn keyword verilogType ovm_threaded_component ovm_transaction ovm_transport_export
syn keyword verilogType ovm_transport_imp ovm_transport_port ovm_tree_printer ovm_tree_printer_knobs
syn keyword verilogType ovm_urm_message ovm_urm_message_format ovm_urm_override_operator
syn keyword verilogType ovm_urm_override_request ovm_urm_report_server ovm_void stream_info
syn keyword verilogType tlm_analysis_fifo tlm_b_get_export tlm_b_get_port tlm_b_put_export
syn keyword verilogType tlm_b_put_port tlm_blocking_get_if tlm_blocking_get_peek_if
syn keyword verilogType tlm_blocking_master_if tlm_blocking_peek_if tlm_blocking_put_if
syn keyword verilogType tlm_blocking_slave_if tlm_blocking_transport_if tlm_event tlm_fifo
syn keyword verilogType tlm_fifo_base tlm_get_export tlm_get_if tlm_get_peek_if tlm_get_port
syn keyword verilogType tlm_if_base tlm_master_if tlm_nb_get_export tlm_nb_get_port
syn keyword verilogType tlm_nb_put_export tlm_nb_put_port tlm_nonblocking_get_if
syn keyword verilogType tlm_nonblocking_get_peek_if tlm_nonblocking_master_if
syn keyword verilogType tlm_nonblocking_peek_if tlm_nonblocking_put_if tlm_nonblocking_slave_if
syn keyword verilogType tlm_nonblocking_transport_if tlm_peek_if tlm_put_export tlm_put_if
syn keyword verilogType tlm_put_port tlm_req_rsp_channel tlm_slave_if tlm_transport_channel
syn keyword verilogType tlm_transport_if tx_handle urm_command_line_processor_c urm_fifo
syn keyword verilogType ovm_scenario_base ovm_scenario ovm_scenario_noparam ovm_stimulus_scenario
syn keyword verilogType ovm_scenario_controller_base ovm_scenario_controller
syn keyword verilogType ovm_scenario_driver_base tlm_scenario_fifo tlm_scenario_req_rsp_channel
syn keyword verilogType ovm_scenario_driver ovm_scenario_driver_noparam request_driver
syn keyword verilogType ovm_req_rsp_sequence ovm_sequence ovm_random_sequence
syn keyword verilogType ovm_exhaustive_sequence ovm_simple_sequence ovm_sequence_item
syn keyword verilogType ovm_seq_item_cons_if ovm_sequencer ovm_seq_prod_if ovm_sequencer_base
syn keyword verilogType ovm_seq_cons_if ovm_virtual_sequencer

syn match   verilogGlobal      "`begin_\w\+"
syn match   verilogGlobal      "`end_\w\+"
syn match   verilogGlobal      "`remove_\w\+"
syn match   verilogGlobal      "`restore_\w\+"

syn match   verilogGlobal      "`[a-zA-Z0-9_]\+\>"

syn match   verilogNumber      "\<[0-9][0-9_\.]\=\([fpnum]\|\)s\>"
syn match   verilogNumber      "\<[0-9][0-9_\.]\=step\>"

syn match  verilogMethod       "\.atobin"
syn match  verilogMethod       "\.atohex\>"
syn match  verilogMethod       "\.atoi\>"
syn match  verilogMethod       "\.atooct\>"
syn match  verilogMethod       "\.atoreal\>"
syn match  verilogMethod       "\.bintoa\>"
syn match  verilogMethod       "\.hextoa\>"
syn match  verilogMethod       "\.itoa\>"
syn match  verilogMethod       "\.octtoa\>"
syn match  verilogMethod       "\.realtoa\>"
syn match  verilogMethod       "\.len\>"
syn match  verilogMethod       "\.getc\>"
syn match  verilogMethod       "\.putc\>"
syn match  verilogMethod       "\.toupper\>"
syn match  verilogMethod       "\.tolower\>"
syn match  verilogMethod       "\.compare\>"
syn match  verilogMethod       "\.icompare\>"
syn match  verilogMethod       "\.substr\>"
syn match  verilogMethod       "\.num\>"
syn match  verilogMethod       "\.exists\>"
syn match  verilogMethod       "\.first\>"
syn match  verilogMethod       "\.last\>"
syn match  verilogMethod       "\.name\>"
syn match  verilogMethod       "\.index\>"
syn match  verilogMethod       "\.find\>"
syn match  verilogMethod       "\.find_first\>"
syn match  verilogMethod       "\.find_last\>"
syn match  verilogMethod       "\.find_index\>"
syn match  verilogMethod       "\.find_first_index\>"
syn match  verilogMethod       "\.find_last_index\>"
syn match  verilogMethod       "\.min\>"
syn match  verilogMethod       "\.max\>"
syn match  verilogMethod       "\.unique\>"
syn match  verilogMethod       "\.unique_index\>"
syn match  verilogMethod       "\.sort\>"
syn match  verilogMethod       "\.rsort\>"
syn match  verilogMethod       "\.shuffle\>"
syn match  verilogMethod       "\.reverse\>"
syn match  verilogMethod       "\.sum\>"
syn match  verilogMethod       "\.product\>"
syn match  verilogMethod       "\.xor\>"
syn match  verilogMethod       "\.status\>"
syn match  verilogMethod       "\.kill\>"
syn match  verilogMethod       "\.self\>"
syn match  verilogMethod       "\.await\>"
syn match  verilogMethod       "\.suspend\>"
syn match  verilogMethod       "\.resume\>"
syn match  verilogMethod       "\.get\>"
syn match  verilogMethod       "\.put\>"
syn match  verilogMethod       "\.peek\>"
syn match  verilogMethod       "\.try_get\>"
syn match  verilogMethod       "\.try_peek\>"
syn match  verilogMethod       "\.try_put\>"
syn match  verilogMethod       "\.data\>"
syn match  verilogMethod       "\.eq\>"
syn match  verilogMethod       "\.neq\>"
syn match  verilogMethod       "\.next\>"
syn match  verilogMethod       "\.prev\>"
syn match  verilogMethod       "\.new\>"
syn match  verilogMethod       "\.size\>"
syn match  verilogMethod       "\.delete\>"
syn match  verilogMethod       "\.empty\>"
syn match  verilogMethod       "\.pop_front\>"
syn match  verilogMethod       "\.pop_back\>"
syn match  verilogMethod       "\.push_front\>"
syn match  verilogMethod       "\.push_back\>"
syn match  verilogMethod       "\.front\>"
syn match  verilogMethod       "\.back\>"
syn match  verilogMethod       "\.insert\>"
syn match  verilogMethod       "\.insert_range\>"
syn match  verilogMethod       "\.erase\>"
syn match  verilogMethod       "\.erase_range\>"
syn match  verilogMethod       "\.set\>"
syn match  verilogMethod       "\.swap\>"
syn match  verilogMethod       "\.clear\>"
syn match  verilogMethod       "\.purge\>"
syn match  verilogMethod       "\.start\>"
syn match  verilogMethod       "\.finish\>"

syn match   verilogAssertion   "\<\w\+\>\s*:\s*\<assert\>\_.\{-});"

syn match   vmmType     "vmm_[a-zA-Z0-9_]\+\>"
" syn match   tlmType     "tlm_[a-zA-Z0-9_]\+\>"
" syn match   urmType     "urm_[a-zA-Z0-9_]\+\>"
" syn match   ovmType     "ovm_[a-zA-Z0-9_]\+\>"
syn match   uvcType     "uvc_[a-zA-Z0-9_]\+\>"
syn match   verilogType "\[$\]\>"

syn keyword verilogTodo contained TODO

syn match   verilogOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

syn region  verilogComment start="/\*" end="\*/" contains=verilogTodo
syn match   verilogComment "//.*" contains=verilogTodo

syn match verilogGlobal "`[a-zA-Z0-9_]\+\>"
syn match verilogGlobal "`celldefine"
syn match verilogGlobal "`default_nettype"
syn match verilogGlobal "`define"
syn match verilogGlobal "`else"
syn match verilogGlobal "`elsif"
syn match verilogGlobal "`endcelldefine"
syn match verilogGlobal "`endif"
syn match verilogGlobal "`ifdef"
syn match verilogGlobal "`ifndef"
syn match verilogGlobal "`include"
syn match verilogGlobal "`line"
syn match verilogGlobal "`nounconnected_drive"
syn match verilogGlobal "`resetall"
syn match verilogGlobal "`timescale"
syn match verilogGlobal "`unconnected_drive"
syn match verilogGlobal "`undef"
syn match   verilogGlobal "$[a-zA-Z0-9_]\*\>"

syn match   verilogConstant "\<[A-Z][A-Z0-9_]\*\>"

syn match   verilogNumber "\(\<\d\+\|\)'[bB]\s*[0-1_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[oO]\s*[0-7_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[dD]\s*[0-9_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   verilogNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

syn region  verilogString start=+"+ skip=+\\"+ end=+"+ contains=verilogEscape
syn match   verilogEscape +\\[nt"\\]+ contained
syn match   verilogEscape "\\\o\o\=\o\=" contained

" Directives
syn match   verilogDirective   "//\s*synopsys\>.*$"
syn region  verilogDirective   start="/\*\s*synopsys\>" end="\*/"
syn region  verilogDirective   start="//\s*synopsys dc_script_begin\>" end="//\s*synopsys dc_script_end\>"

syn match   verilogDirective   "//\s*\$s\>.*$"
syn region  verilogDirective   start="/\*\s*\$s\>" end="\*/"
syn region  verilogDirective   start="//\s*\$s dc_script_begin\>" end="//\s*\$s dc_script_end\>"

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync lines=50
" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_verilog_syn_inits")
  if version < 508
     let did_verilog_syn_inits = 1
     command -nargs=+ HiLink hi link <args>
  else
     command -nargs=+ HiLink hi def link <args>
  endif

  " The default highlighting.
  HiLink verilogMethod          Function
  HiLink verilogTypeDef         TypeDef
  HiLink verilogAssertion       Include
  HiLink verilogCharacter       Character
  HiLink verilogConditional     Conditional
  HiLink verilogRepeat          Repeat
  HiLink verilogString          String
  HiLink verilogTodo            Todo
  HiLink verilogComment         Comment
  HiLink verilogConstant        Constant
  HiLink verilogLabel           Label
  HiLink verilogNumber          Number
  HiLink verilogOperator        Special
  HiLink verilogStatement       Type
  HiLink verilogGlobal          Define
  HiLink verilogDirective       SpecialComment
  HiLink verilogEscape          Special
  HiLink verilogType            Statement
  " HiLink tlmType              Library
  " HiLink urmType              Library
  " HiLink ovmType              Library
  HiLink uvcType                Library
  HiLink vmmType                Library

  delcommand HiLink
endif

let b:current_syntax = "verilog_systemverilog"

" vim: ts=8
