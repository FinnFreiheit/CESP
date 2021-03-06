#
#  ██████╗███████╗███████╗██████╗     ██╗     ███████╗ ██████╗████████╗██╗   ██╗██████╗ ███████╗
# ██╔════╝██╔════╝██╔════╝██╔══██╗    ██║     ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗██╔════╝
# ██║     █████╗  ███████╗██████╔╝    ██║     █████╗  ██║        ██║   ██║   ██║██████╔╝█████╗
# ██║     ██╔══╝  ╚════██║██╔═══╝     ██║     ██╔══╝  ██║        ██║   ██║   ██║██╔══██╗██╔══╝
#  ██████╗███████╗███████║██║         ███████╗███████╗╚██████╗   ██║   ╚██████╔╝██║  ██║███████╗
#  ╚═════╝╚══════╝╚══════╝╚═╝         ╚══════╝╚══════╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝
#
# Copyright 2020 Michael J. Klaiber


###############################
#  CESP Programming Project   #
###############################

.sin_lookup:
.word 0x00000000 # sin(0.000000)=cos(90.000000)=0.000000
.word 0x3c8ef859 # sin(1.000000)=cos(89.000000)=0.017452
.word 0x3d0ef2c6 # sin(2.000000)=cos(88.000000)=0.034899
.word 0x3d565e3a # sin(3.000000)=cos(87.000000)=0.052336
.word 0x3d8edc7b # sin(4.000000)=cos(86.000000)=0.069756
.word 0x3db27eb6 # sin(5.000000)=cos(85.000000)=0.087156
.word 0x3dd61305 # sin(6.000000)=cos(84.000000)=0.104528
.word 0x3df996a2 # sin(7.000000)=cos(83.000000)=0.121869
.word 0x3e0e8365 # sin(8.000000)=cos(82.000000)=0.139173
.word 0x3e20305b # sin(9.000000)=cos(81.000000)=0.156434
.word 0x3e31d0d4 # sin(10.000000)=cos(80.000000)=0.173648
.word 0x3e43636f # sin(11.000000)=cos(79.000000)=0.190809
.word 0x3e54e6cd # sin(12.000000)=cos(78.000000)=0.207912
.word 0x3e665992 # sin(13.000000)=cos(77.000000)=0.224951
.word 0x3e77ba60 # sin(14.000000)=cos(76.000000)=0.241922
.word 0x3e8483ee # sin(15.000000)=cos(75.000000)=0.258819
.word 0x3e8d2057 # sin(16.000000)=cos(74.000000)=0.275637
.word 0x3e95b1be # sin(17.000000)=cos(73.000000)=0.292372
.word 0x3e9e377a # sin(18.000000)=cos(72.000000)=0.309017
.word 0x3ea6b0df # sin(19.000000)=cos(71.000000)=0.325568
.word 0x3eaf1d44 # sin(20.000000)=cos(70.000000)=0.342020
.word 0x3eb77c01 # sin(21.000000)=cos(69.000000)=0.358368
.word 0x3ebfcc6f # sin(22.000000)=cos(68.000000)=0.374607
.word 0x3ec80de9 # sin(23.000000)=cos(67.000000)=0.390731
.word 0x3ed03fc9 # sin(24.000000)=cos(66.000000)=0.406737
.word 0x3ed8616c # sin(25.000000)=cos(65.000000)=0.422618
.word 0x3ee0722f # sin(26.000000)=cos(64.000000)=0.438371
.word 0x3ee87171 # sin(27.000000)=cos(63.000000)=0.453990
.word 0x3ef05e94 # sin(28.000000)=cos(62.000000)=0.469472
.word 0x3ef838f7 # sin(29.000000)=cos(61.000000)=0.484810
.word 0x3f000000 # sin(30.000000)=cos(60.000000)=0.500000
.word 0x3f03d989 # sin(31.000000)=cos(59.000000)=0.515038
.word 0x3f07a8ca # sin(32.000000)=cos(58.000000)=0.529919
.word 0x3f0b6d77 # sin(33.000000)=cos(57.000000)=0.544639
.word 0x3f0f2744 # sin(34.000000)=cos(56.000000)=0.559193
.word 0x3f12d5e8 # sin(35.000000)=cos(55.000000)=0.573576
.word 0x3f167918 # sin(36.000000)=cos(54.000000)=0.587785
.word 0x3f1a108d # sin(37.000000)=cos(53.000000)=0.601815
.word 0x3f1d9bfe # sin(38.000000)=cos(52.000000)=0.615661
.word 0x3f211b24 # sin(39.000000)=cos(51.000000)=0.629320
.word 0x3f248dbb # sin(40.000000)=cos(50.000000)=0.642788
.word 0x3f27f37c # sin(41.000000)=cos(49.000000)=0.656059
.word 0x3f2b4c25 # sin(42.000000)=cos(48.000000)=0.669131
.word 0x3f2e9772 # sin(43.000000)=cos(47.000000)=0.681998
.word 0x3f31d522 # sin(44.000000)=cos(46.000000)=0.694658
.word 0x3f3504f3 # sin(45.000000)=cos(45.000000)=0.707107
.word 0x3f3826a7 # sin(46.000000)=cos(44.000000)=0.719340
.word 0x3f3b39ff # sin(47.000000)=cos(43.000000)=0.731354
.word 0x3f3e3ebd # sin(48.000000)=cos(42.000000)=0.743145
.word 0x3f4134a6 # sin(49.000000)=cos(41.000000)=0.754710
.word 0x3f441b7d # sin(50.000000)=cos(40.000000)=0.766044
.word 0x3f46f30a # sin(51.000000)=cos(39.000000)=0.777146
.word 0x3f49bb13 # sin(52.000000)=cos(38.000000)=0.788011
.word 0x3f4c7360 # sin(53.000000)=cos(37.000000)=0.798636
.word 0x3f4f1bbd # sin(54.000000)=cos(36.000000)=0.809017
.word 0x3f51b3f3 # sin(55.000000)=cos(35.000000)=0.819152
.word 0x3f543bce # sin(56.000000)=cos(34.000000)=0.829038
.word 0x3f56b31d # sin(57.000000)=cos(33.000000)=0.838671
.word 0x3f5919ae # sin(58.000000)=cos(32.000000)=0.848048
.word 0x3f5b6f51 # sin(59.000000)=cos(31.000000)=0.857167
.word 0x3f5db3d7 # sin(60.000000)=cos(30.000000)=0.866025
.word 0x3f5fe714 # sin(61.000000)=cos(29.000000)=0.874620
.word 0x3f6208da # sin(62.000000)=cos(28.000000)=0.882948
.word 0x3f641901 # sin(63.000000)=cos(27.000000)=0.891007
.word 0x3f66175e # sin(64.000000)=cos(26.000000)=0.898794
.word 0x3f6803ca # sin(65.000000)=cos(25.000000)=0.906308
.word 0x3f69de1d # sin(66.000000)=cos(24.000000)=0.913545
.word 0x3f6ba635 # sin(67.000000)=cos(23.000000)=0.920505
.word 0x3f6d5bec # sin(68.000000)=cos(22.000000)=0.927184
.word 0x3f6eff20 # sin(69.000000)=cos(21.000000)=0.933580
.word 0x3f708fb2 # sin(70.000000)=cos(20.000000)=0.939693
.word 0x3f720d81 # sin(71.000000)=cos(19.000000)=0.945519
.word 0x3f737871 # sin(72.000000)=cos(18.000000)=0.951057
.word 0x3f74d063 # sin(73.000000)=cos(17.000000)=0.956305
.word 0x3f76153f # sin(74.000000)=cos(16.000000)=0.961262
.word 0x3f7746ea # sin(75.000000)=cos(15.000000)=0.965926
.word 0x3f78654d # sin(76.000000)=cos(14.000000)=0.970296
.word 0x3f797051 # sin(77.000000)=cos(13.000000)=0.974370
.word 0x3f7a67e2 # sin(78.000000)=cos(12.000000)=0.978148
.word 0x3f7b4beb # sin(79.000000)=cos(11.000000)=0.981627
.word 0x3f7c1c5c # sin(80.000000)=cos(10.000000)=0.984808
.word 0x3f7cd925 # sin(81.000000)=cos(9.000000)=0.987688
.word 0x3f7d8235 # sin(82.000000)=cos(8.000000)=0.990268
.word 0x3f7e1781 # sin(83.000000)=cos(7.000000)=0.992546
.word 0x3f7e98fd # sin(84.000000)=cos(6.000000)=0.994522
.word 0x3f7f069e # sin(85.000000)=cos(5.000000)=0.996195
.word 0x3f7f605c # sin(86.000000)=cos(4.000000)=0.997564
.word 0x3f7fa62f # sin(87.000000)=cos(3.000000)=0.998630
.word 0x3f7fd814 # sin(88.000000)=cos(2.000000)=0.999391
.word 0x3f7ff605 # sin(89.000000)=cos(1.000000)=0.999848
.word 0x3f800000 # sin(90.000000)=cos(0.000000)=1.000000
