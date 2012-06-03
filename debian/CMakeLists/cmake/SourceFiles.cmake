set(OBJ_EMULATE_CC
	emulate/net-ip.cc
	emulate/net.cc
	emulate/tap.cc
	emulate/ether.cc
	emulate/internet.cc
	emulate/ping_responder.cc
	emulate/arp.cc
	emulate/icmp.cc
	emulate/net-pcap.cc
	emulate/nat.cc
	emulate/iptap.cc
	emulate/tcptap.cc
)

set(OBJ_EMULATE_C
	emulate/inet.c
)

set(INCLUDE_SUB_DIR
	${CMAKE_CURRENT_SOURCE_DIR}/tcp
	${CMAKE_CURRENT_SOURCE_DIR}/sctp
	${CMAKE_CURRENT_SOURCE_DIR}/common
	${CMAKE_CURRENT_SOURCE_DIR}/link
	${CMAKE_CURRENT_SOURCE_DIR}/queue
	${CMAKE_CURRENT_SOURCE_DIR}/adc
	${CMAKE_CURRENT_SOURCE_DIR}/apps
	${CMAKE_CURRENT_SOURCE_DIR}/mac
	${CMAKE_CURRENT_SOURCE_DIR}/mobile
	${CMAKE_CURRENT_SOURCE_DIR}/trace
	${CMAKE_CURRENT_SOURCE_DIR}/routing
	${CMAKE_CURRENT_SOURCE_DIR}/tools
	${CMAKE_CURRENT_SOURCE_DIR}/classifier
	${CMAKE_CURRENT_SOURCE_DIR}/mcast
	${CMAKE_CURRENT_SOURCE_DIR}/diffusion3/lib/main
	${CMAKE_CURRENT_SOURCE_DIR}/diffusion3/lib
	${CMAKE_CURRENT_SOURCE_DIR}/diffusion3/lib/nr
	${CMAKE_CURRENT_SOURCE_DIR}/diffusion3/ns
	${CMAKE_CURRENT_SOURCE_DIR}/diffusion3/filter_core
	${CMAKE_CURRENT_SOURCE_DIR}/asim
	${CMAKE_CURRENT_SOURCE_DIR}/qs
	${CMAKE_CURRENT_SOURCE_DIR}/diffserv
	${CMAKE_CURRENT_SOURCE_DIR}/satellite
	${CMAKE_CURRENT_SOURCE_DIR}/wpan
)

set(NS_TCL_LIB_STL
  tcl/lib/ns-diffusion.tcl
  tcl/delaybox/delaybox.tcl
  tcl/packmime/packmime.tcl
  tcl/tmix/tmix.tcl
  tcl/tmix/tmix_delaybox.tcl
)
STRING(REPLACE ";" "	" NS_TCL_LIB_STL "${NS_TCL_LIB_STL}")

add_custom_command(OUTPUT version.c ns_tcl.cc ptypes.cc
  COMMAND ${TCL_TCLSH} ${CMAKE_CURRENT_SOURCE_DIR}/bin/string2c.tcl version_string < ${CMAKE_CURRENT_SOURCE_DIR}/VERSION > version.c
  COMMAND ./ptypes2tcl > ptypes.cc
  COMMAND ${TCL_TCLSH} ${CMAKE_CURRENT_SOURCE_DIR}/bin/tcl-expand.tcl ${CMAKE_CURRENT_SOURCE_DIR}/tcl/lib/ns-lib.tcl ${NS_TCL_LIB_STL} | tcl2c++ et_ns_lib > ns_tcl.cc
  DEPENDS ptypes2tcl
)

set(OBJ_GEN
	version.c
	ns_tcl.cc
	ptypes.cc
)

set(OBJ_COMPAT
	common/win32.c
)
set(OBJ_STL
	diffusion3/lib/nr/nr.cc diffusion3/lib/dr.cc 
	diffusion3/filters/diffusion/one_phase_pull.cc 
	diffusion3/filters/diffusion/two_phase_pull.cc 
	diffusion3/lib/diffapp.cc 
	diffusion3/ns/diffagent.cc diffusion3/ns/diffrtg.cc 
	diffusion3/ns/difftimer.cc 
	diffusion3/filter_core/filter_core.cc 
	diffusion3/filter_core/iolog.cc 
	diffusion3/filter_core/iostats.cc 
	diffusion3/lib/main/attrs.cc 
	diffusion3/lib/main/events.cc 
	diffusion3/lib/main/iodev.cc 
	diffusion3/lib/main/iohook.cc 
	diffusion3/lib/main/timers.cc 
	diffusion3/lib/main/message.cc 
	diffusion3/lib/main/tools.cc 
	diffusion3/apps/gear_examples/gear_common.cc 
	diffusion3/apps/gear_examples/gear_receiver.cc 
	diffusion3/apps/gear_examples/gear_sender.cc 
	diffusion3/apps/rmst_examples/rmst_sink.cc 
	diffusion3/apps/rmst_examples/rmst_source.cc 
	diffusion3/apps/ping/1pp_ping_sender.cc 
	diffusion3/apps/ping/1pp_ping_receiver.cc 
	diffusion3/apps/ping/2pp_ping_sender.cc 
	diffusion3/apps/ping/2pp_ping_receiver.cc 
	diffusion3/apps/ping/ping_common.cc 
	diffusion3/apps/ping/push_receiver.cc 
	diffusion3/apps/ping/push_sender.cc 
	diffusion3/filters/gear/gear_attr.cc 
	diffusion3/filters/gear/gear.cc 
	diffusion3/filters/gear/gear_tools.cc 
	diffusion3/filters/misc/log.cc 
	diffusion3/filters/misc/srcrt.cc 
	diffusion3/filters/misc/tag.cc 
	diffusion3/filters/rmst/rmst.cc 
	diffusion3/filters/rmst/rmst_filter.cc 
	delaybox/delaybox.cc 
	packmime/packmime_HTTP.cc packmime/packmime_HTTP_rng.cc 
	packmime/packmime_OL.cc packmime/packmime_OL_ranvar.cc
	packmime/packmime_ranvar.cc 
	tmix/tmix.cc tmix/tmixAgent.cc tmix/tmix_delaybox.cc
)

set(OBJ_CC
  tools/random.cc tools/rng.cc tools/ranvar.cc common/misc.cc common/timer-handler.cc
  common/scheduler.cc common/object.cc common/packet.cc common/ip.cc routing/route.cc 
  common/connector.cc common/ttl.cc trace/trace.cc trace/trace-ip.cc
  classifier/classifier.cc classifier/classifier-addr.cc classifier/classifier-hash.cc
  classifier/classifier-virtual.cc classifier/classifier-mcast.cc
  classifier/classifier-bst.cc classifier/classifier-mpath.cc mcast/replicator.cc
  classifier/classifier-mac.cc classifier/classifier-qs.cc 
  classifier/classifier-port.cc src_rtg/classifier-sr.cc
  src_rtg/sragent.cc src_rtg/hdr_src.cc adc/ump.cc
  qs/qsagent.cc qs/hdr_qs.cc apps/app.cc apps/telnet.cc tcp/tcplib-telnet.cc
  tools/trafgen.cc trace/traffictrace.cc tools/pareto.cc tools/expoo.cc 
  tools/cbr_traffic.cc adc/tbf.cc adc/resv.cc adc/sa.cc tcp/saack.cc
  tools/measuremod.cc adc/estimator.cc adc/adc.cc adc/ms-adc.cc
  adc/timewindow-est.cc adc/acto-adc.cc adc/pointsample-est.cc adc/salink.cc adc/actp-adc.cc
  adc/hb-adc.cc adc/expavg-est.cc adc/param-adc.cc adc/null-estimator.cc
  adc/adaptive-receiver.cc apps/vatrcvr.cc adc/consrcvr.cc
  common/agent.cc common/message.cc apps/udp.cc
  common/session-rtp.cc apps/rtp.cc tcp/rtcp.cc
  common/ivs.cc	common/messpass.cc common/tp.cc common/tpm.cc apps/worm.cc
  tcp/tcp.cc tcp/tcp-sink.cc tcp/tcp-reno.cc tcp/tcp-newreno.cc
  tcp/tcp-vegas.cc tcp/tcp-rbp.cc tcp/tcp-full.cc tcp/rq.cc
  baytcp/tcp-full-bay.cc baytcp/ftpc.cc baytcp/ftps.cc
  tcp/scoreboard.cc tcp/scoreboard-rq.cc tcp/tcp-sack1.cc tcp/tcp-fack.cc
  tcp/scoreboard1.cc tcp/tcp-linux.cc tcp/linux/ns-linux-util.cc
  tcp/tcp-asym.cc tcp/tcp-asym-sink.cc tcp/tcp-fs.cc tcp/tcp-asym-fs.cc
  tcp/tcp-int.cc tcp/chost.cc tcp/tcp-session.cc tcp/nilist.cc
  sctp/sctp.cc apps/sctp_app1.cc
  sctp/sctp-timestamp.cc sctp/sctp-hbAfterRto.cc
  sctp/sctp-multipleFastRtx.cc sctp/sctp-mfrHbAfterRto.cc
  sctp/sctp-mfrTimestamp.cc	sctp/sctp-cmt.cc sctp/sctpDebug.cc
  dccp/dccp_sb.cc dccp/dccp_opt.cc dccp/dccp_ackv.cc dccp/dccp_packets.cc
  dccp/dccp.cc dccp/dccp_tcplike.cc dccp/dccp_tfrc.cc
  tools/integrator.cc tools/queue-monitor.cc tools/flowmon.cc tools/loss-monitor.cc
  queue/queue.cc queue/drop-tail.cc
  adc/simple-intserv-sched.cc queue/red.cc
  queue/semantic-packetqueue.cc queue/semantic-red.cc
  tcp/ack-recons.cc
  queue/sfq.cc queue/fq.cc queue/drr.cc queue/srr.cc queue/cbq.cc
  queue/jobs.cc queue/marker.cc queue/demarker.cc
  link/hackloss.cc queue/errmodel.cc queue/fec.cc
  link/delay.cc tcp/snoop.cc gaf/gaf.cc
  link/dynalink.cc routing/rtProtoDV.cc common/net-interface.cc
  mcast/ctrMcast.cc mcast/mcast_ctrl.cc mcast/srm.cc
  common/sessionhelper.cc queue/delaymodel.cc
  mcast/srm-ssm.cc mcast/srm-topo.cc
  routing/alloc-address.cc routing/address.cc
  lib/int.Vec.cc lib/int.RVec.cc lib/dmalloc_support.cc
  webcache/http.cc webcache/tcp-simple.cc webcache/pagepool.cc
  webcache/inval-agent.cc webcache/tcpapp.cc webcache/http-aux.cc
  webcache/mcache.cc webcache/webtraf.cc webcache/webserver.cc webcache/logweb.cc
  empweb/empweb.cc empweb/empftp.cc
  realaudio/realaudio.cc mac/lanRouter.cc classifier/filter.cc
  common/pkt-counter.cc	common/Decapsulator.cc common/Encapsulator.cc
  common/encap.cc
  mac/channel.cc mac/mac.cc mac/ll.cc mac/mac-802_11.cc
  mac/mac-802_11Ext.cc
  mac/mac-802_3.cc mac/mac-tdma.cc mac/smac.cc
  mobile/mip.cc mobile/mip-reg.cc mobile/gridkeeper.cc
  mobile/propagation.cc mobile/tworayground.cc mobile/nakagami.cc
  mobile/antenna.cc mobile/omni-antenna.cc
  mobile/shadowing.cc mobile/shadowing-vis.cc mobile/dumb-agent.cc
  common/bi-connector.cc common/node.cc	common/mobilenode.cc
  mac/arp.cc mobile/god.cc mobile/dem.cc
  mobile/topography.cc mobile/modulation.cc
  queue/priqueue.cc queue/dsr-priqueue.cc
  mac/phy.cc mac/wired-phy.cc mac/wireless-phy.cc
  mac/wireless-phyExt.cc mac/mac-timers.cc trace/cmu-trace.cc mac/varp.cc
  mac/mac-simple.cc satellite/sat-hdlc.cc
  dsdv/dsdv.cc dsdv/rtable.cc queue/rtqueue.cc
  routing/rttable.cc
  imep/imep.cc imep/dest_queue.cc imep/imep_api.cc 
  imep/imep_rt.cc imep/rxmit_queue.cc imep/imep_timers.cc 
  imep/imep_util.cc imep/imep_io.cc 
  tora/tora.cc tora/tora_api.cc tora/tora_dest.cc 
  tora/tora_io.cc tora/tora_logs.cc tora/tora_neighbor.cc 
  dsr/dsragent.cc dsr/hdr_sr.cc dsr/mobicache.cc dsr/path.cc 
  dsr/requesttable.cc dsr/routecache.cc dsr/add_sr.cc 
  dsr/dsr_proto.cc dsr/flowstruct.cc dsr/linkcache.cc 
  dsr/simplecache.cc dsr/sr_forwarder.cc 
  aodv/aodv_logs.cc aodv/aodv.cc 
  aodv/aodv_rtable.cc aodv/aodv_rqueue.cc 
  aomdv/aomdv_logs.cc aomdv/aomdv.cc 
  aomdv/aomdv_rtable.cc aomdv/aomdv_rqueue.cc 
  puma/puma.cc 
  mdart/mdart_adp.cc mdart/mdart_dht.cc mdart/mdart_ndp.cc 
  mdart/mdart_neighbor.cc mdart/mdart_queue.cc mdart/mdart_table.cc 
  mdart/mdart.cc 
  common/ns-process.cc 
  satellite/satgeometry.cc satellite/sathandoff.cc 
  satellite/satlink.cc satellite/satnode.cc 
  satellite/satposition.cc satellite/satroute.cc 
  satellite/sattrace.cc 
  rap/raplist.cc rap/rap.cc rap/media-app.cc rap/utilities.cc 
  common/fsm.cc tcp/tcp-abs.cc 
  diffusion/diffusion.cc diffusion/diff_rate.cc diffusion/diff_prob.cc 
  diffusion/diff_sink.cc diffusion/flooding.cc diffusion/omni_mcast.cc 
  diffusion/hash_table.cc diffusion/routing_table.cc diffusion/iflist.cc 
  tcp/tfrc.cc tcp/tfrc-sink.cc mobile/energy-model.cc apps/ping.cc tcp/tcp-rfc793edu.cc 
  queue/rio.cc queue/semantic-rio.cc tcp/tcp-sack-rh.cc tcp/scoreboard-rh.cc 
  plm/loss-monitor-plm.cc plm/cbr-traffic-PP.cc 
  linkstate/hdr-ls.cc 
  mpls/classifier-addr-mpls.cc mpls/ldp.cc mpls/mpls-module.cc 
  routing/rtmodule.cc classifier/classifier-hier.cc 
  routing/addr-params.cc 
  nix/hdr_nv.cc nix/classifier-nix.cc 
  nix/nixnode.cc 
  routealgo/rnode.cc 
  routealgo/bfs.cc 
  routealgo/rbitmap.cc 
  routealgo/rlookup.cc 
  routealgo/routealgo.cc 
  nix/nixvec.cc 
  nix/nixroute.cc 
  diffserv/dsred.cc diffserv/dsredq.cc 
  diffserv/dsEdge.cc diffserv/dsCore.cc 
  diffserv/dsPolicy.cc diffserv/ew.cc diffserv/dewp.cc 
  queue/red-pd.cc queue/pi.cc queue/vq.cc queue/rem.cc 
  queue/gk.cc 
  pushback/rate-limit.cc pushback/rate-limit-strategy.cc 
  pushback/ident-tree.cc pushback/agg-spec.cc 
  pushback/logging-data-struct.cc 
  pushback/rate-estimator.cc 
  pushback/pushback-queue.cc pushback/pushback.cc 
  common/parentnode.cc trace/basetrace.cc 
  common/simulator.cc asim/asim.cc 
  common/scheduler-map.cc common/splay-scheduler.cc 
  linkstate/ls.cc linkstate/rtProtoLS.cc 
  pgm/classifier-pgm.cc pgm/pgm-agent.cc pgm/pgm-sender.cc 
  pgm/pgm-receiver.cc mcast/rcvbuf.cc 
  mcast/classifier-lms.cc mcast/lms-agent.cc mcast/lms-receiver.cc 
  mcast/lms-sender.cc 
  queue/delayer.cc 
  xcp/xcpq.cc xcp/xcp.cc xcp/xcp-end-sys.cc 
  wpan/p802_15_4csmaca.cc wpan/p802_15_4fail.cc 
  wpan/p802_15_4hlist.cc wpan/p802_15_4mac.cc 
  wpan/p802_15_4nam.cc wpan/p802_15_4phy.cc 
  wpan/p802_15_4sscs.cc wpan/p802_15_4timer.cc 
  wpan/p802_15_4trace.cc wpan/p802_15_4transac.cc 
  apps/pbc.cc 
  ${OBJ_STL}
)
set(OBJ_C
   tcp/linux/tcp_naivereno.c
   tcp/linux/src/tcp_cong.c
   tcp/linux/src/tcp_highspeed.c
   tcp/linux/src/tcp_bic.c 
   tcp/linux/src/tcp_htcp.c 
   tcp/linux/src/tcp_scalable.c 
   tcp/linux/src/tcp_cubic.c
   tcp/linux/src/tcp_westwood.c 
   tcp/linux/src/tcp_vegas.c 
   tcp/linux/src/tcp_hybla.c
   tcp/linux/src/tcp_illinois.c 
   tcp/linux/src/tcp_yeah.c
   tcp/linux/src/tcp_veno.c 
   tcp/linux/src/tcp_compound.c 
   tcp/linux/src/tcp_lp.c
   tcp/linux/ns-linux-c.c 
   tcp/linux/ns-linux-param.c
)

set(OBJ 
   ${OBJ_C} 
   ${OBJ_CC} 
   ${OBJ_GEN} 
   ${OBJ_COMPAT}
)

