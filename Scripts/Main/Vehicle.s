Vehicle_ <- array(1000)

class vehicles {
  Health = 1000;
  OldHealth = 1000;
  Used = false;
  angle = 0
}

function LoadVehicles() {
  AddVehicle(93, 899.685, -982.687, 5.63034, 91.0025);
  AddVehicle(93, 899.924, -1001.27, 5.63009, 90.491);
  AddVehicle(111, 853.539, -993.613, 4.90574, 181.398);
  AddVehicle(111, 863.288, -993.456, 4.90608, 180.524);
  AddVehicle(91, 856.557, -993.474, 4.85414, 180.498);
  AddVehicle(90, 911.221, -895.586, 15.1866, 180.898);
  AddVehicle(100, 917.336, -895.729, 14.8541, 182.085);
  AddVehicle(109, 1007.03, -838.403, 14.7681, 269.78);
  AddVehicle(111, 1007.02, -853.449, 14.8093, 270.861);
  AddVehicle(112, 1027.55, -869.316, 15.0228, 89.1336);
  AddVehicle(95, 1009.68, -882.468, 14.7846, 0.293655);
  AddVehicle(91, 999.329, -868.305, 14.7557, 269.255);
  AddVehicle(90, 1119.08, -770.656, 14.8893, 0.536764);
  AddVehicle(112, 1118.94, -752.36, 14.8927, 180.079);
  AddVehicle(118, 1031.82, -685.774, 15.0547, 89.9529);
  AddVehicle(108, 1118.96, -761.724, 14.8437, 180.66);
  AddVehicle(116, 1138.76, -639.757, 14.7566, 178.415);
  AddVehicle(116, 1140.16, -689.655, 14.7571, 1.06602);
  AddVehicle(117, 1172.87, -649.192, 18.9339, 181.086);
  AddVehicle(116, 1150, -690.764, 14.7673, 358.986);
  AddVehicle(106, 1139.64, -630.7, 15.0297, 90.9901);
  AddVehicle(106, 1163.07, -547.159, 21.8105, 91.7582);
  AddVehicle(111, 1426.34, -795.462, 11.6787, 271.332);
  AddVehicle(104, 1425.93, -786.821, 11.8912, 91.4784);
  AddVehicle(129, 1407.44, -791.025, 11.7027, 269.907);
  AddVehicle(129, 1407.71, -799.661, 11.7029, 270.031);
  AddVehicle(146, 1599.39, -635.689, 11.9597, 92.0581);
  AddVehicle(145, 1593.62, -682.871, 12.2271, 92.1901);
  AddVehicle(130, 1562.55, -732.559, 11.8995, 0.800919);
  AddVehicle(103, 1582.23, -733.002, 11.9741, 359.049);
  AddVehicle(146, 1544.29, -845.95, 11.9598, 87.1079);
  AddVehicle(146, 1544.13, -854.118, 11.9598, 90.1951);
  AddVehicle(138, 1533.32, -897.856, 11.92, 44.1245);
  AddVehicle(138, 1521.87, -898.125, 11.9198, 323.417);
  AddVehicle(93, 1393.15, -1022.85, 12.4744, 91.4872);
  AddVehicle(93, 1392.56, -997.523, 12.4812, 91.1518);
  AddVehicle(103, 1299.85, -797.72, 15.1799, 226.72);
  AddVehicle(104, 1298.42, -785.641, 15.0909, 225.281);
  AddVehicle(96, 1328.25, -642.237, 12.4507, 179.729);
  AddVehicle(96, 1315.72, -642.23, 12.4506, 179.953);
  AddVehicle(100, 1281.87, -619.864, 11.9419, 179.099);
  AddVehicle(91, 1269.73, -620.282, 12.007, 178.635);
  AddVehicle(102, 1223.35, -325.588, 26.1288, 179.241);
  AddVehicle(129, 1304.16, -319.001, 41.9247, 89.354);
  AddVehicle(129, 1303.64, -308.303, 41.8522, 87.4168);
  AddVehicle(134, 1406.8, -176.779, 50.2045, 123.621);
  AddVehicle(134, 1403.72, -169.844, 50.7083, 89.1932);
  AddVehicle(99, 1407.67, -159.139, 52.4502, 228.065);
  AddVehicle(95, 1339.13, -258.722, 49.4834, 267.937);
  AddVehicle(95, 1338.85, -251.638, 49.4711, 266.668);
  AddVehicle(119, 1234.11, -127.502, 14.6431, 38.9752);
  AddVehicle(119, 1213.23, -135.675, 14.6426, 358.12);
  AddVehicle(105, 1227.49, -135.748, 14.6873, 359.346);
  AddVehicle(92, 1220.38, -135.43, 14.7162, 358.447);
  AddVehicle(112, 1217.24, -64.4248, 10.609, 174.605);
  AddVehicle(97, 1107.08, -37.1971, 7.68918, 269.2);
  AddVehicle(97, 1107.46, -47.5659, 7.69056, 270.235);
  AddVehicle(97, 1107.86, -58.0229, 7.68996, 270.509);
  AddVehicle(111, 1138.97, -95.7376, 7.32499, 0.599858);
  AddVehicle(94, 1144.6, -95.232, 7.20667, 0.294929);
  AddVehicle(95, 1168.53, -149.804, 14.8066, 1.76754);
  AddVehicle(95, 1162.69, -149.648, 14.809, 1.71794);
  AddVehicle(108, 1102.08, -150.151, 9.92166, 359.003);
  AddVehicle(129, 1091.27, -150.341, 9.77637, 359.532);
  AddVehicle(90, 1084.2, -150.638, 9.95131, 357.58);
  AddVehicle(130, 1103.11, 44.5207, -0.462722, 270.541);
  AddVehicle(130, 1160.88, 71.533, -0.491825, 182.201);
  AddVehicle(148, 933.311, -62.0148, 8.29878, 89.6053);
  AddVehicle(148, 933.008, -56.3675, 8.19534, 89.2397);
  AddVehicle(129, 983.707, -65.9232, 7.19919, 1.95012);
  AddVehicle(111, 972.734, -65.7542, 7.23481, 2.38692);
  AddVehicle(91, 982.592, -35.55, 7.14275, 90.047);
  AddVehicle(98, 1296.33, -104.488, 15.6347, 0.702096);
  AddVehicle(98, 1296.72, -63.7419, 15.0653, 176.443);
  AddVehicle(94, 1275.9, -80.5347, 14.8352, 265.6);
  AddVehicle(130, 1259.25, -109.664, 15.0111, 269.23);
  AddVehicle(100, 866.674, -993.222, 4.7881, 179.945);
  AddVehicle(133, 862.507, -783.176, 15.0805, 1.03022);
  AddVehicle(129, 929.503, -793.507, 15.06, 89.5526);
  AddVehicle(132, 982.433, -753.024, 15.0702, 179.869);
  AddVehicle(94, 1009.45, -756.242, 14.7052, 88.4647);
  AddVehicle(133, 915.41, -676.669, 15.0805, 90.2388);
  AddVehicle(133, 905.782, -543.134, 15.0805, 181.061);
  AddVehicle(132, 860.764, -543.134, 15.0703, 180.419);
  AddVehicle(129, 963.201, -592.432, 14.8499, 46.5929);
  AddVehicle(144, 1029.15, -415.964, 15.077, 180.779);
  AddVehicle(144, 1020.08, -416.706, 15.0902, 181.386);
  AddVehicle(95, 972.894, -412.571, 14.819, 180.691);
  AddVehicle(94, 973.077, -429.892, 14.7506, 0.086815);
  AddVehicle(134, 882.589, -425.913, 14.5947, 271.375);
  AddVehicle(137, 938.152, -134.496, 4.77443, 90.5235);
  AddVehicle(137, 988.581, -117.934, 4.80475, 356.604);
  AddVehicle(137, 1009.5, -141.094, 4.75291, 179.443);
  AddVehicle(137, 970.97, -279.593, 4.74558, 315.949);
  AddVehicle(94, 924.238, -271.731, 4.7015, 2.98915);
  AddVehicle(112, 862.344, -192.622, 3.62784, 179.677);
  AddVehicle(111, 863.021, -228.221, 4.60687, 0.324889);
  AddVehicle(95, 887.141, -312.845, 8.55651, 89.7248);
  AddVehicle(111, 850.888, -378.878, 13.1835, 90.3511);
  AddVehicle(129, 1344, -449.09, 49.6764, 180.142);
  AddVehicle(95, 1336.2, -458.11, 49.5832, 270.897);
  AddVehicle(91, 1349.77, -448.824, 49.6424, 180.105);
  AddVehicle(100, 1335.68, -452.116, 49.481, 270.229);
  AddVehicle(110, 1255.56, -741.23, 14.9186, 132.649);
  AddVehicle(128, 1219.64, -733.64, 15.1162, 226.282);
  AddVehicle(128, 1247.14, -761.391, 15.1163, 46.2049);
  AddVehicle(110, 1249.34, -708.794, 14.9189, 134.617);
  AddVehicle(104, 1188.11, -797.247, 14.7045, 315.601);
  AddVehicle(104, 1250.01, -803.347, 14.8588, 46.0489);
  AddVehicle(111, 1238.71, -896.509, 14.951, 315.767);
  AddVehicle(91, 1234.96, -893.055, 14.9011, 313.788);
  AddVehicle(110, 1219.97, -877.943, 14.9147, 0);
  AddVehicle(100, 1223.5, -881.461, 14.8331, 315.242);
  AddVehicle(109, 1227, -891.819, 14.9148, 359.389);
  AddVehicle(114, 1180.27, -854.728, 15.0512, 222.996);
  AddVehicle(127, 1259.85, -999.273, 14.9648, 225.236);
  AddVehicle(127, 1280.7, -978.083, 14.9689, 225.956);
  AddVehicle(129, 1114.36, -1112.54, 11.7371, 359.741);
  AddVehicle(103, 1101.9, -969.981, 15.0974, 89.12);
  AddVehicle(130, 1101.68, -989.922, 14.9924, 88.8044);
  AddVehicle(108, 1041.11, -1014.86, 14.9895, 179.33);
  AddVehicle(90, 1035.31, -1014.58, 15.0352, 178.987);
  AddVehicle(102, 1029.44, -1015.03, 14.9073, 177.543);
  AddVehicle(98, 964.61, -1117.63, 13.7574, 91.8156);
  AddVehicle(132, 948.66, -1142.48, 13.2707, 1.56525);
  AddVehicle(132, 1011.94, -1083.44, 13.2706, 179.588);
  AddVehicle(129, 979.525, -1101.95, 13.0499, 89.6468);
  AddVehicle(113, 1231.42, -1116.51, 11.8663, 89.0363);
  AddVehicle(113, 1231.14, -1142.88, 11.8666, 89.5658);
  AddVehicle(120, 837.978, -1114.37, -0.30352, 139.57);
  AddVehicle(106, 198.187, -41.0338, 16.4287, 0.536481);
  AddVehicle(106, 189.408, -41.0172, 16.4287, 359.06);
  AddVehicle(111, 192.83, -7.80371, 16.4286, 0);
  AddVehicle(106, 216.609, -41.0998, 16.4287, 0.798101);
  AddVehicle(106, 225.275, -41.1159, 16.4285, 359.93);
  AddVehicle(91, 240.182, -42.3022, 16.0172, 0.380768);
  AddVehicle(108, 249.051, -42.5411, 16.2375, 0.76373);
  AddVehicle(112, 257.736, -42.3834, 16.2862, 358.054);
  AddVehicle(111, 266.696, -42.4786, 16.0692, 359.992);
  AddVehicle(129, 280.392, -35.3927, 16.0937, 327.294);
  AddVehicle(102, 293.526, -35.3413, 16.1556, 327.099);
  AddVehicle(100, 306.563, -35.5242, 15.9514, 326.376);
  AddVehicle(95, 319.837, -35.453, 16.0457, 328.495);
  AddVehicle(94, 359.274, -13.6509, 15.9507, 89.43);
  AddVehicle(109, 359.325, -4.96945, 16.0244, 88.9487);
  AddVehicle(112, 359.534, 3.62286, 16.2865, 88.2941);
  AddVehicle(130, 359.162, 12.5238, 16.2907, 89.4744);
  AddVehicle(90, 347.341, 16.9979, 16.2831, 269.104);
  AddVehicle(92, 347.361, 8.17123, 15.8764, 270.41);
  AddVehicle(102, 347.655, -0.73409, 16.1553, 269.666);
  AddVehicle(100, 347.654, -9.59757, 15.9509, 271.534);
  AddVehicle(95, 340, -13.5914, 16.0459, 90.4047);
  AddVehicle(91, 339.916, 3.64754, 16.0168, 88.5713);
  AddVehicle(96, 340.049, -5.05455, 16.4602, 90.4382);
  AddVehicle(101, 340.233, 12.6231, 15.8725, 89.4575);
  AddVehicle(119, 276.204, -19.1099, 15.8029, 329.869);
  AddVehicle(109, 284.95, -19.1392, 16.0252, 327.781);
  AddVehicle(94, 293.727, -19.226, 15.9505, 328.322);
  AddVehicle(102, 302.461, -19.0859, 16.1553, 327.484);
  AddVehicle(100, 311.052, -19.4315, 15.9512, 327.521);
  AddVehicle(95, 320.072, -18.8849, 16.0454, 328.37);
  AddVehicle(91, 280.893, -7.33403, 16.0174, 213.749);
  AddVehicle(108, 289.138, -6.63881, 16.2362, 212.499);
  AddVehicle(112, 298.36, -7.00092, 16.2868, 212.322);
  AddVehicle(129, 307.103, -7.21733, 16.0935, 211.495);
  AddVehicle(105, 315.579, -6.91369, 15.8476, 213.899);
  AddVehicle(110, 276.073, -0.255837, 15.9646, 328.057);
  AddVehicle(100, 284.884, -0.58043, 15.9511, 329.128);
  AddVehicle(101, 293.668, -0.400611, 15.8724, 329.807);
  AddVehicle(95, 302.533, -0.35091, 16.0469, 328.741);
  AddVehicle(108, 311.138, -0.565037, 16.2373, 328.557);
  AddVehicle(119, 319.763, -0.46609, 15.8034, 329.388);
  AddVehicle(111, 280.77, 11.9256, 16.0692, 211.062);
  AddVehicle(108, 289.242, 12.1685, 16.2374, 213.363);
  AddVehicle(90, 298.07, 12.2702, 16.283, 213.683);
  AddVehicle(103, 306.955, 11.9812, 16.3654, 213.579);
  AddVehicle(96, 315.768, 11.7724, 16.4609, 213.459);
  AddVehicle(96, 230.177, -996.569, 22.9997, 91.2413);
  AddVehicle(117, 391.051, -1124.32, 16.0333, 89.6105);
  AddVehicle(117, 391.089, -1145.41, 15.9161, 91.5873);
  AddVehicle(107, 386.703, -1185.94, 15.8558, 89.451);
  AddVehicle(107, 386.184, -1174.55, 15.8548, 89.3118);
  AddVehicle(107, 386.027, -1163.71, 15.7796, 90.8767);
  AddVehicle(116, 344.966, -1173.96, 22.7641, 1.88331);
  AddVehicle(116, 354.681, -1173.53, 22.7646, 1.07543);
  AddVehicle(116, 363.459, -1173.37, 22.7656, 359.761);
  AddVehicle(136, 442.233, -1464.87, 18.3154, 180.018);
  AddVehicle(136, 455.499, -1465.37, 18.3296, 178.676);
  AddVehicle(136, 468.987, -1465.75, 18.3443, 178.334);
  AddVehicle(119, 476.69, -1495, 18.2783, 90.0178);
  AddVehicle(129, 423.504, -1512.58, 18.5138, 13.9586);
  AddVehicle(111, 434.562, -1509.68, 18.501, 13.0333);
  AddVehicle(105, 444.998, -1506.89, 18.2901, 12.3582);
  AddVehicle(101, 453.717, -1504.16, 18.3241, 14.0191);
  AddVehicle(105, 204.196, -1236.24, 20.0909, 0.33504);
  AddVehicle(101, 229.546, -1236.27, 20.1019, 1.55786);
  AddVehicle(111, 233.152, -1236.19, 20.297, 0.011989);
  AddVehicle(90, 259.516, -1228.04, 20.5254, 90.9827);
  AddVehicle(91, 259.384, -1217.59, 20.2606, 89.7507);
  AddVehicle(96, 259.309, -1207.29, 20.7039, 93.0556);
  AddVehicle(102, 259.132, -1196.75, 20.3993, 90.1381);
  AddVehicle(112, 258.938, -1186.6, 20.531, 90.8545);
  AddVehicle(92, 259.105, -1178.12, 20.1205, 89.6852);
  AddVehicle(109, 247.507, -1172.46, 20.2686, 179.443);
  AddVehicle(100, 230.926, -1171.79, 20.1955, 180.077);
  AddVehicle(119, 214.251, -1172, 20.0475, 180.747);
  AddVehicle(119, 217.247, -1172.03, 20.0472, 179.653);
  AddVehicle(118, 88.2539, -1563.96, 23.967, 87.7533);
  AddVehicle(128, 169.729, -1581.33, 26.1101, 178.797);
  AddVehicle(128, 162.075, -1581.1, 26.1126, 358.9);
  AddVehicle(110, 134.709, -1586.35, 25.9167, 1.06801);
  AddVehicle(110, 127.009, -1586.64, 25.9166, 179.888);
  AddVehicle(92, -39.8551, -367.132, 15.8277, 90.262);
  AddVehicle(112, -40.2559, -361.319, 16.2362, 89.331);
  AddVehicle(119, -40.1867, -355.455, 15.7541, 89.2701);
  AddVehicle(136, 527.882, -660.497, 15.7885, 359.364);
  AddVehicle(129, 490.469, -614.964, 15.9934, 91.3179);
  AddVehicle(119, 476.51, -734.985, 15.7254, 269.718);
  AddVehicle(122, 131.272, 173.62, 11.7292, 359.277);
  AddVehicle(122, 143.707, 174.306, 11.7292, 359.919);
  AddVehicle(123, 182.046, 220.582, 11.9284, 92.6668);
  AddVehicle(112, 147.597, 239.965, 11.6022, 270.039);
  AddVehicle(94, 185.775, 59.7634, 15.9401, 90.6175);
  AddVehicle(95, 185.675, 65.9381, 16.0343, 89.9957);
  AddVehicle(120, 535.237, -1059.32, -0.561891, 181.842);
  AddVehicle(142, 535.606, -1033.74, -0.690743, 355.837);
  AddVehicle(143, 510.37, -1034.1, -0.691109, 0.203791);
  AddVehicle(142, 508.424, -1060.88, -0.751072, 182.481);
  AddVehicle(143, 540.414, -765.195, -0.173762, 357.189);
  AddVehicle(120, 555.687, -790.594, -0.426718, 180.566);
  AddVehicle(142, 593.181, -768.271, -0.933142, 359.953);
  AddVehicle(143, 555.954, -688.585, -0.659236, 178.393);
  AddVehicle(95, 292.704, -669.143, 25.997, 90.3655);
  AddVehicle(95, 292.731, -642.691, 25.9978, 88.8206);
  AddVehicle(95, -896.209, -417.359, 10.9469, 270.452);
  AddVehicle(119, -896.64, -398.236, 10.7045, 270.304);
  AddVehicle(126, -1268.21, -513.988, 11.6769, 175.805);
  AddVehicle(126, -1527.31, -896.466, 11.6636, 249.18);
  AddVehicle(126, -1528.07, -904.746, 11.6701, 250.724);
  AddVehicle(126, -1528.53, -912.677, 11.6634, 249.514);
  AddVehicle(126, -1528.93, -920.281, 11.67, 249.308);
  AddVehicle(126, -845.904, -750.265, 11.3223, 150.165);
  AddVehicle(126, -877.941, -758.678, 11.4287, 220.696);
  AddVehicle(126, -1142.29, -784.704, 11.6771, 179.286);
  AddVehicle(126, -1554.4, -935.005, 11.6648, 88.3801);
} 
// Called from a timed loop. ignore one second delay [update: Call from client version "onVehicleHealthChanges"]
function onVehicleHealthChanges(player) {
  local i = 0;
  while(FindVehicle( i ) != null) {
 
    local vehicle = FindVehicle(i);
	  
   if (Vehicle_[i].Health != vehicle.Health) {

	 Vehicle_[i].OldHealth = Vehicle_[i].Health;
     Vehicle_[i].Health = vehicle.Health;
	 if (Vehicle_[i].Used == false) {
       // fail anyone in that vehicle
	   if (player) {
	     if (vehicle.ID == i) MadPlayer[player.ID].GetInCarTime = 1;
	    }
		else vehicle.Respawn()
	 }
	 
	 Vehicle_[i].Used = true;
	 print(vehicle + " health changed")

	 // Mission check

	}
   i++;
  }
}

function onVehicleRespawn( vehicle ) {
  vehicle.Locked = false;
  Vehicle_[vehicle.ID].Used = false;
  
  Vehicle_[vehicle.ID].OldHealth = 1000;
  Vehicle_[vehicle.ID].Health = 1000;
  vehicle.Angle = Vehicle_[vehicle.ID].angle
  return 1;
}

//-----------------------------------------

// utils
 
function GetVehcleCount() { 
 local i = 0;
 while(FindVehicle( i ) != null) { 
  i++;
 }
 return i;
}

function AddVehicle(Model, x, y, z, angle) {
  local v = CreateVehicle(Model, Vector(x, y, z), -1, -1)
  v.Angle = angle;
  print(v.ID)
  
  Vehicle_[v.ID] = vehicles();
  Vehicle_[v.ID].Health = v.Health;
  Vehicle_[v.ID].Used = false;
  Vehicle_[v.ID].angle = angle
}