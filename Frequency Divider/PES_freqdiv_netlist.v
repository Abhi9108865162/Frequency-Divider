/* Generated by Yosys 0.9 (git sha1 1979e0b) */

module PES_freqdiv(en, clkin, n, clkout);
  wire [3:0] _000_;
  wire [3:0] _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  wire _121_;
  wire _122_;
  wire _123_;
  wire _124_;
  wire _125_;
  wire _126_;
  wire _127_;
  wire _128_;
  wire _129_;
  wire _130_;
  wire _131_;
  wire _132_;
  wire _133_;
  wire _134_;
  wire _135_;
  wire _136_;
  wire _137_;
  wire _138_;
  wire _139_;
  wire _140_;
  wire _141_;
  wire _142_;
  wire _143_;
  wire _144_;
  wire _145_;
  wire _146_;
  wire _147_;
  wire _148_;
  wire _149_;
  wire _150_;
  wire _151_;
  wire _152_;
  wire _153_;
  wire _154_;
  wire _155_;
  wire _156_;
  wire _157_;
  wire _158_;
  wire _159_;
  wire _160_;
  wire _161_;
  wire _162_;
  wire _163_;
  wire _164_;
  wire _165_;
  wire _166_;
  wire _167_;
  wire _168_;
  wire _169_;
  wire _170_;
  wire _171_;
  wire _172_;
  wire _173_;
  wire _174_;
  wire _175_;
  wire _176_;
  wire _177_;
  wire _178_;
  wire _179_;
  wire _180_;
  input clkin;
  output clkout;
  input en;
  input [3:0] n;
  wire [3:0] nc;
  wire [3:0] pc;
  sky130_fd_sc_hd__clkinv_1 _181_ (
    .A(_126_),
    .Y(_131_)
  );
  sky130_fd_sc_hd__clkinv_1 _182_ (
    .A(_125_),
    .Y(_132_)
  );
  sky130_fd_sc_hd__clkinv_1 _183_ (
    .A(_128_),
    .Y(_133_)
  );
  sky130_fd_sc_hd__clkinv_1 _184_ (
    .A(_120_),
    .Y(_116_)
  );
  sky130_fd_sc_hd__nor2_1 _185_ (
    .A(_131_),
    .B(_129_),
    .Y(_134_)
  );
  sky130_fd_sc_hd__nand2b_1 _186_ (
    .A_N(_124_),
    .B(_127_),
    .Y(_135_)
  );
  sky130_fd_sc_hd__maj3_1 _187_ (
    .A(_125_),
    .B(_133_),
    .C(_135_),
    .X(_136_)
  );
  sky130_fd_sc_hd__a21oi_1 _188_ (
    .A1(_131_),
    .A2(_129_),
    .B1(_130_),
    .Y(_137_)
  );
  sky130_fd_sc_hd__o21ai_0 _189_ (
    .A1(_134_),
    .A2(_136_),
    .B1(_137_),
    .Y(_138_)
  );
  sky130_fd_sc_hd__nor2_1 _190_ (
    .A(_124_),
    .B(_123_),
    .Y(_139_)
  );
  sky130_fd_sc_hd__a21boi_0 _191_ (
    .A1(_124_),
    .A2(_123_),
    .B1_N(_173_),
    .Y(_140_)
  );
  sky130_fd_sc_hd__a211oi_1 _192_ (
    .A1(_132_),
    .A2(_174_),
    .B1(_139_),
    .C1(_140_),
    .Y(_141_)
  );
  sky130_fd_sc_hd__o22ai_1 _193_ (
    .A1(_131_),
    .A2(_175_),
    .B1(_132_),
    .B2(_174_),
    .Y(_142_)
  );
  sky130_fd_sc_hd__o2bb2ai_1 _194_ (
    .A1_N(_131_),
    .A2_N(_175_),
    .B1(_141_),
    .B2(_142_),
    .Y(_143_)
  );
  sky130_fd_sc_hd__a211oi_1 _195_ (
    .A1(_123_),
    .A2(_138_),
    .B1(_143_),
    .C1(_176_),
    .Y(_121_)
  );
  sky130_fd_sc_hd__or3_1 _196_ (
    .A(_125_),
    .B(_124_),
    .C(_123_),
    .X(_144_)
  );
  sky130_fd_sc_hd__or4_1 _197_ (
    .A(_126_),
    .B(_125_),
    .C(_124_),
    .D(_123_),
    .X(_145_)
  );
  sky130_fd_sc_hd__o31ai_1 _198_ (
    .A1(_125_),
    .A2(_124_),
    .A3(_123_),
    .B1(_126_),
    .Y(_146_)
  );
  sky130_fd_sc_hd__nand3_1 _199_ (
    .A(_130_),
    .B(_145_),
    .C(_146_),
    .Y(_147_)
  );
  sky130_fd_sc_hd__nand2_1 _200_ (
    .A(_122_),
    .B(_147_),
    .Y(_148_)
  );
  sky130_fd_sc_hd__o21ai_0 _201_ (
    .A1(_124_),
    .A2(_123_),
    .B1(_125_),
    .Y(_149_)
  );
  sky130_fd_sc_hd__nand3_1 _202_ (
    .A(_129_),
    .B(_144_),
    .C(_149_),
    .Y(_150_)
  );
  sky130_fd_sc_hd__xor2_1 _203_ (
    .A(_124_),
    .B(_123_),
    .X(_151_)
  );
  sky130_fd_sc_hd__a211o_1 _204_ (
    .A1(_124_),
    .A2(_128_),
    .B1(_127_),
    .C1(_123_),
    .X(_152_)
  );
  sky130_fd_sc_hd__o21ai_0 _205_ (
    .A1(_128_),
    .A2(_151_),
    .B1(_152_),
    .Y(_153_)
  );
  sky130_fd_sc_hd__a21oi_1 _206_ (
    .A1(_145_),
    .A2(_146_),
    .B1(_130_),
    .Y(_154_)
  );
  sky130_fd_sc_hd__a22oi_1 _207_ (
    .A1(_129_),
    .A2(_145_),
    .B1(_149_),
    .B2(_144_),
    .Y(_155_)
  );
  sky130_fd_sc_hd__a211oi_1 _208_ (
    .A1(_150_),
    .A2(_153_),
    .B1(_154_),
    .C1(_155_),
    .Y(_156_)
  );
  sky130_fd_sc_hd__nor3_1 _209_ (
    .A(_127_),
    .B(_148_),
    .C(_156_),
    .Y(_108_)
  );
  sky130_fd_sc_hd__xnor2_1 _210_ (
    .A(_128_),
    .B(_127_),
    .Y(_157_)
  );
  sky130_fd_sc_hd__nor3_1 _211_ (
    .A(_148_),
    .B(_156_),
    .C(_157_),
    .Y(_109_)
  );
  sky130_fd_sc_hd__a21oi_1 _212_ (
    .A1(_128_),
    .A2(_127_),
    .B1(_129_),
    .Y(_158_)
  );
  sky130_fd_sc_hd__and3_1 _213_ (
    .A(_129_),
    .B(_128_),
    .C(_127_),
    .X(_159_)
  );
  sky130_fd_sc_hd__nor4_1 _214_ (
    .A(_148_),
    .B(_156_),
    .C(_158_),
    .D(_159_),
    .Y(_110_)
  );
  sky130_fd_sc_hd__xnor2_1 _215_ (
    .A(_130_),
    .B(_159_),
    .Y(_160_)
  );
  sky130_fd_sc_hd__nor3_1 _216_ (
    .A(_148_),
    .B(_156_),
    .C(_160_),
    .Y(_111_)
  );
  sky130_fd_sc_hd__nand3_1 _217_ (
    .A(_176_),
    .B(_145_),
    .C(_146_),
    .Y(_161_)
  );
  sky130_fd_sc_hd__nand2_1 _218_ (
    .A(_122_),
    .B(_161_),
    .Y(_162_)
  );
  sky130_fd_sc_hd__nand3_1 _219_ (
    .A(_175_),
    .B(_144_),
    .C(_149_),
    .Y(_163_)
  );
  sky130_fd_sc_hd__a211o_1 _220_ (
    .A1(_174_),
    .A2(_124_),
    .B1(_123_),
    .C1(_173_),
    .X(_164_)
  );
  sky130_fd_sc_hd__o21ai_0 _221_ (
    .A1(_174_),
    .A2(_151_),
    .B1(_164_),
    .Y(_165_)
  );
  sky130_fd_sc_hd__a21oi_1 _222_ (
    .A1(_145_),
    .A2(_146_),
    .B1(_176_),
    .Y(_166_)
  );
  sky130_fd_sc_hd__a22oi_1 _223_ (
    .A1(_175_),
    .A2(_145_),
    .B1(_149_),
    .B2(_144_),
    .Y(_167_)
  );
  sky130_fd_sc_hd__a211oi_1 _224_ (
    .A1(_163_),
    .A2(_165_),
    .B1(_166_),
    .C1(_167_),
    .Y(_168_)
  );
  sky130_fd_sc_hd__nor3_1 _225_ (
    .A(_173_),
    .B(_162_),
    .C(_168_),
    .Y(_112_)
  );
  sky130_fd_sc_hd__xnor2_1 _226_ (
    .A(_174_),
    .B(_173_),
    .Y(_169_)
  );
  sky130_fd_sc_hd__nor3_1 _227_ (
    .A(_162_),
    .B(_168_),
    .C(_169_),
    .Y(_113_)
  );
  sky130_fd_sc_hd__a21oi_1 _228_ (
    .A1(_174_),
    .A2(_173_),
    .B1(_175_),
    .Y(_170_)
  );
  sky130_fd_sc_hd__and3_1 _229_ (
    .A(_175_),
    .B(_174_),
    .C(_173_),
    .X(_171_)
  );
  sky130_fd_sc_hd__nor4_1 _230_ (
    .A(_162_),
    .B(_168_),
    .C(_170_),
    .D(_171_),
    .Y(_114_)
  );
  sky130_fd_sc_hd__xnor2_1 _231_ (
    .A(_176_),
    .B(_171_),
    .Y(_172_)
  );
  sky130_fd_sc_hd__nor3_1 _232_ (
    .A(_162_),
    .B(_168_),
    .C(_172_),
    .Y(_115_)
  );
  sky130_fd_sc_hd__clkinv_1 _233_ (
    .A(_120_),
    .Y(_117_)
  );
  sky130_fd_sc_hd__clkinv_1 _234_ (
    .A(_120_),
    .Y(_118_)
  );
  sky130_fd_sc_hd__clkinv_1 _235_ (
    .A(_120_),
    .Y(_119_)
  );
  sky130_fd_sc_hd__dfxtp_1 _236_ (
    .CLK(_177_),
    .D(_000_[0]),
    .Q(nc[0])
  );
  sky130_fd_sc_hd__dfxtp_1 _237_ (
    .CLK(_178_),
    .D(_000_[1]),
    .Q(nc[1])
  );
  sky130_fd_sc_hd__dfxtp_1 _238_ (
    .CLK(_179_),
    .D(_000_[2]),
    .Q(nc[2])
  );
  sky130_fd_sc_hd__dfxtp_1 _239_ (
    .CLK(_180_),
    .D(_000_[3]),
    .Q(nc[3])
  );
  sky130_fd_sc_hd__dfxtp_1 _240_ (
    .CLK(clkin),
    .D(_001_[0]),
    .Q(pc[0])
  );
  sky130_fd_sc_hd__dfxtp_1 _241_ (
    .CLK(clkin),
    .D(_001_[1]),
    .Q(pc[1])
  );
  sky130_fd_sc_hd__dfxtp_1 _242_ (
    .CLK(clkin),
    .D(_001_[2]),
    .Q(pc[2])
  );
  sky130_fd_sc_hd__dfxtp_1 _243_ (
    .CLK(clkin),
    .D(_001_[3]),
    .Q(pc[3])
  );
  assign _126_ = n[3];
  assign _175_ = pc[2];
  assign _125_ = n[2];
  assign _174_ = pc[1];
  assign _173_ = pc[0];
  assign _124_ = n[1];
  assign _130_ = nc[3];
  assign _129_ = nc[2];
  assign _128_ = nc[1];
  assign _127_ = nc[0];
  assign _123_ = n[0];
  assign clkout = _121_;
  assign _122_ = en;
  assign _000_[0] = _108_;
  assign _000_[1] = _109_;
  assign _000_[2] = _110_;
  assign _000_[3] = _111_;
  assign _001_[0] = _112_;
  assign _001_[1] = _113_;
  assign _001_[2] = _114_;
  assign _176_ = pc[3];
  assign _001_[3] = _115_;
  assign _120_ = clkin;
  assign _177_ = _116_;
  assign _178_ = _117_;
  assign _179_ = _118_;
  assign _180_ = _119_;
endmodule
