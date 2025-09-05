<template>
  <div class="home">
    <div class="description">
      <h1>Welcome to AGSTCT</h1>
      <hr />
      <p>
        The Particle Swarm Optimization algorithm is an optimization technique based on swarm intell
        igence that simulates the social behavior of bird flocks or fish schools to find the best so
        lution to a problem. In software testing
      </p>
      <p>
        the term “particle swarm counter” metaphorically refers to a system that uses the PSO algori
        thm to evaluate software performance, such as identifying the combinations of input paramete
        rs that lead to software failures.
        <br />
        By simulating the movement of particles in the search space, the a lgorithm can efficiently
        pinpoint potential software defects, thereby enhancing the reliability and stability of the
        software.
      </p>
      <p class="hide">
        Note the css tricks for the Saturn rings (box-shadow) and reverse animation to compensate
        the orbit.
      </p>
      <hr />
    </div>
    <div class="solar-syst">
      <div class="sun"></div>
      <div class="sun"></div>
      <div class="sun"></div>
      <div class="mercury"></div>
      <div class="venus"></div>
      <div class="earth"></div>
      <div class="mars"></div>
      <div class="jupiter"></div>
      <div class="saturn"></div>
      <div class="uranus"></div>
      <div class="neptune"></div>
      <div class="asteroids-belt"></div>
      <div class="asteroids-belt"></div>
    </div>
  </div>
</template>

<style scoped>
*,
*:before,
*:after {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
.home {
  margin-left: -20px;
}
body {
  font:
    normal 1em/1.45em 'Helvetica Neue',
    Helvetica,
    Arial,
    sans-serif;
  -webkit-font-smoothing: antialiased;
  color: #fff;
  background: radial-gradient(ellipse at bottom, #1c2837 0%, #050608 100%);
  background-attachment: fixed;
}

h1 {
  font-weight: 300;
  font-size: 2.5em;
  text-transform: uppercase;
  font-family: Lato;
  line-height: 1.6em;
  letter-spacing: 0.1em;
}

a,
a:visited {
  text-decoration: none;
  color: white;
  opacity: 0.7;
}
a:hover,
a:visited:hover {
  opacity: 1;
}
a.icon,
a:visited.icon {
  margin-right: 2px;
  padding: 3px;
}

.description {
  padding: 30px;
  position: absolute;
  width: 25%;
  z-index: 999;
}
.description p {
  font-size: 0.9em;
}
.description p + p {
  margin-top: 20px;
}
.description p.author {
  font-size: 0.7em;
}
.description p.author .fa-heart {
  color: #860014;
}

hr {
  margin: 26px 0;
  border: 0;
  border-top: 1px solid white;
  background: transparent;
  width: 25%;
  opacity: 0.1;
}

code {
  color: #ae94c0;
  font-family: Menlo, Monaco, Consolas, 'Courier New', monospace;
  font-size: 0.9em;
}

.solar-syst {
  position: absolute;
  margin: -36px auto;
  margin-left: 50px;
  width: 100%;
  height: 100%;
}
.solar-syst:after {
  content: '';
  position: absolute;
  height: 2px;
  width: 2px;
  top: -2px;
  background: white;
  box-shadow:
    259px 606px 0 0px rgba(255, 255, 255, 0.063),
    1442px 483px 0 0px rgba(255, 255, 255, 0.714),
    1379px 928px 0 0px rgba(255, 255, 255, 0.706),
    1393px 38px 0 0px rgba(255, 255, 255, 0.163),
    1776px 1775px 0 0px rgba(255, 255, 255, 0.404),
    919px 272px 0 0px rgba(255, 255, 255, 0.288),
    609px 405px 0 0px rgba(255, 255, 255, 0.143),
    612px 1186px 0 0px rgba(255, 255, 255, 0.209),
    292px 1595px 0 0px rgba(255, 255, 255, 0.831),
    1232px 1368px 0 0px rgba(255, 255, 255, 0.324),
    1272px 966px 0 0px rgba(255, 255, 255, 0.765),
    1276px 172px 0 0px rgba(255, 255, 255, 0.466),
    1800px 447px 0 0px rgba(255, 255, 255, 0.988),
    1724px 1283px 0 0px rgba(255, 255, 255, 0.448),
    384px 1363px 0 0px rgba(255, 255, 255, 0.119),
    1633px 965px 0 0px rgba(255, 255, 255, 0.429),
    530px 366px 0 0px rgba(255, 255, 255, 0.643),
    817px 442px 0 0px rgba(255, 255, 255, 0.472),
    77px 1715px 0 0px rgba(255, 255, 255, 0.227),
    413px 1446px 0 0px rgba(255, 255, 255, 0.268),
    782px 956px 0 0px rgba(255, 255, 255, 0.224),
    530px 350px 0 0px rgba(255, 255, 255, 0.597),
    944px 641px 0 0px rgba(255, 255, 255, 0.821),
    1053px 452px 0 0px rgba(255, 255, 255, 0.97),
    1127px 968px 0 0px rgba(255, 255, 255, 0.849),
    927px 1180px 0 0px rgba(255, 255, 255, 0.968),
    469px 693px 0 0px rgba(255, 255, 255, 0.667),
    1183px 891px 0 0px rgba(255, 255, 255, 0.402),
    1146px 929px 0 0px rgba(255, 255, 255, 0.343),
    49px 444px 0 0px rgba(255, 255, 255, 0.975),
    330px 180px 0 0px rgba(255, 255, 255, 0.033),
    598px 762px 0 0px rgba(255, 255, 255, 0.539),
    131px 1233px 0 0px rgba(255, 255, 255, 0.289),
    1536px 476px 0 0px rgba(255, 255, 255, 0.372),
    18px 1028px 0 0px rgba(255, 255, 255, 0.793),
    1556px 806px 0 0px rgba(255, 255, 255, 0.901),
    621px 1734px 0 0px rgba(255, 255, 255, 0.779),
    995px 1442px 0 0px rgba(255, 255, 255, 0.407),
    1217px 45px 0 0px rgba(255, 255, 255, 0.785),
    289px 1176px 0 0px rgba(255, 255, 255, 0.251),
    1103px 983px 0 0px rgba(255, 255, 255, 0.991),
    980px 869px 0 0px rgba(255, 255, 255, 0.856),
    741px 794px 0 0px rgba(255, 255, 255, 0.209),
    1589px 805px 0 0px rgba(255, 255, 255, 0.154),
    203px 468px 0 0px rgba(255, 255, 255, 0.792),
    168px 637px 0 0px rgba(255, 255, 255, 0.407),
    228px 1238px 0 0px rgba(255, 255, 255, 0.335),
    586px 457px 0 0px rgba(255, 255, 255, 0.834),
    325px 1389px 0 0px rgba(255, 255, 255, 0.72),
    1168px 1438px 0 0px rgba(255, 255, 255, 0.172),
    104px 1018px 0 0px rgba(255, 255, 255, 0.22),
    1394px 1077px 0 0px rgba(255, 255, 255, 0.016),
    1756px 1437px 0 0px rgba(255, 255, 255, 0.746),
    430px 132px 0 0px rgba(255, 255, 255, 0.873),
    1581px 848px 0 0px rgba(255, 255, 255, 0.796),
    389px 995px 0 0px rgba(255, 255, 255, 0.384),
    424px 217px 0 0px rgba(255, 255, 255, 0.618),
    403px 1314px 0 0px rgba(255, 255, 255, 0.693),
    1309px 213px 0 0px rgba(255, 255, 255, 0.061),
    1779px 517px 0 0px rgba(255, 255, 255, 0.702),
    1302px 958px 0 0px rgba(255, 255, 255, 0.206),
    924px 272px 0 0px rgba(255, 255, 255, 0.509),
    142px 738px 0 0px rgba(255, 255, 255, 0.022),
    873px 4px 0 0px rgba(255, 255, 255, 0.948),
    358px 933px 0 0px rgba(255, 255, 255, 0.92),
    798px 1240px 0 0px rgba(255, 255, 255, 0.593),
    927px 1158px 0 0px rgba(255, 255, 255, 0.205),
    75px 1494px 0 0px rgba(255, 255, 255, 0.267),
    20px 487px 0 0px rgba(255, 255, 255, 0.956),
    1383px 75px 0 0px rgba(255, 255, 255, 0.414),
    998px 270px 0 0px rgba(255, 255, 255, 0.239),
    1388px 1531px 0 0px rgba(255, 255, 255, 0.531),
    1411px 1342px 0 0px rgba(255, 255, 255, 0.103),
    97px 1603px 0 0px rgba(255, 255, 255, 0.597),
    1027px 1782px 0 0px rgba(255, 255, 255, 0.728),
    157px 1604px 0 0px rgba(255, 255, 255, 0.168),
    408px 181px 0 0px rgba(255, 255, 255, 0.087),
    1312px 616px 0 0px rgba(255, 255, 255, 0.066),
    848px 1591px 0 0px rgba(255, 255, 255, 0.127),
    1289px 790px 0 0px rgba(255, 255, 255, 0.045),
    881px 40px 0 0px rgba(255, 255, 255, 0.564),
    1422px 935px 0 0px rgba(255, 255, 255, 0.591),
    667px 944px 0 0px rgba(255, 255, 255, 0.7),
    507px 388px 0 0px rgba(255, 255, 255, 0.346),
    746px 1785px 0 0px rgba(255, 255, 255, 0.439),
    33px 446px 0 0px rgba(255, 255, 255, 0.496),
    1349px 1409px 0 0px rgba(255, 255, 255, 0.317),
    463px 1659px 0 0px rgba(255, 255, 255, 0.543),
    1525px 617px 0 0px rgba(255, 255, 255, 0.799),
    1171px 1679px 0 0px rgba(255, 255, 255, 0.247),
    601px 976px 0 0px rgba(255, 255, 255, 0.898),
    497px 251px 0 0px rgba(255, 255, 255, 0.288),
    1090px 1520px 0 0px rgba(255, 255, 255, 0.361),
    225px 708px 0 0px rgba(255, 255, 255, 0.083),
    1785px 329px 0 0px rgba(255, 255, 255, 0.462),
    86px 756px 0 0px rgba(255, 255, 255, 0.263),
    781px 453px 0 0px rgba(255, 255, 255, 0.1),
    598px 379px 0 0px rgba(255, 255, 255, 0.761),
    1458px 1181px 0 0px rgba(255, 255, 255, 0.768),
    954px 57px 0 0px rgba(255, 255, 255, 0.291),
    571px 625px 0 0px rgba(255, 255, 255, 0.306),
    1243px 396px 0 0px rgba(255, 255, 255, 0.944),
    1038px 1415px 0 0px rgba(255, 255, 255, 0.241),
    184px 904px 0 0px rgba(255, 255, 255, 0.181),
    728px 70px 0 0px rgba(255, 255, 255, 0.171),
    205px 1108px 0 0px rgba(255, 255, 255, 0.652),
    687px 1354px 0 0px rgba(255, 255, 255, 0.178),
    1016px 1755px 0 0px rgba(255, 255, 255, 0.564),
    1501px 696px 0 0px rgba(255, 255, 255, 0.937),
    621px 275px 0 0px rgba(255, 255, 255, 0.948),
    397px 1643px 0 0px rgba(255, 255, 255, 0.358),
    1384px 1354px 0 0px rgba(255, 255, 255, 0.941),
    1107px 475px 0 0px rgba(255, 255, 255, 0.575),
    1753px 1240px 0 0px rgba(255, 255, 255, 0.102),
    1339px 474px 0 0px rgba(255, 255, 255, 0.799),
    263px 1769px 0 0px rgba(255, 255, 255, 0.233),
    999px 11px 0 0px rgba(255, 255, 255, 0.076),
    123px 570px 0 0px rgba(255, 255, 255, 0.144),
    1507px 934px 0 0px rgba(255, 255, 255, 0.089),
    1455px 864px 0 0px rgba(255, 255, 255, 0.195),
    1784px 1078px 0 0px rgba(255, 255, 255, 0.06),
    94px 114px 0 0px rgba(255, 255, 255, 0.955),
    958px 411px 0 0px rgba(255, 255, 255, 0.708),
    189px 1763px 0 0px rgba(255, 255, 255, 0.266),
    306px 991px 0 0px rgba(255, 255, 255, 0.026),
    515px 1662px 0 0px rgba(255, 255, 255, 0.116),
    677px 205px 0 0px rgba(255, 255, 255, 0.383),
    290px 1358px 0 0px rgba(255, 255, 255, 0.12),
    1151px 8px 0 0px rgba(255, 255, 255, 0.29),
    956px 772px 0 0px rgba(255, 255, 255, 0.537),
    1745px 1165px 0 0px rgba(255, 255, 255, 0.837),
    1291px 427px 0 0px rgba(255, 255, 255, 0.014),
    640px 102px 0 0px rgba(255, 255, 255, 0.812),
    689px 1712px 0 0px rgba(255, 255, 255, 0.13),
    833px 1472px 0 0px rgba(255, 255, 255, 0.375),
    946px 654px 0 0px rgba(255, 255, 255, 0.565),
    651px 1283px 0 0px rgba(255, 255, 255, 0.879),
    32px 526px 0 0px rgba(255, 255, 255, 0.258),
    140px 1453px 0 0px rgba(255, 255, 255, 0.836),
    917px 1692px 0 0px rgba(255, 255, 255, 0.319),
    427px 5px 0 0px rgba(255, 255, 255, 0.229),
    346px 1478px 0 0px rgba(255, 255, 255, 0.862),
    1324px 1444px 0 0px rgba(255, 255, 255, 0.175),
    54px 1799px 0 0px rgba(255, 255, 255, 0.008),
    829px 103px 0 0px rgba(255, 255, 255, 0.556),
    283px 730px 0 0px rgba(255, 255, 255, 0.664),
    1338px 620px 0 0px rgba(255, 255, 255, 0.652),
    269px 1650px 0 0px rgba(255, 255, 255, 0.148),
    1556px 446px 0 0px rgba(255, 255, 255, 0.085),
    1116px 555px 0 0px rgba(255, 255, 255, 0.085),
    889px 1789px 0 0px rgba(255, 255, 255, 0.855),
    826px 1752px 0 0px rgba(255, 255, 255, 0.065),
    355px 1280px 0 0px rgba(255, 255, 255, 0.108),
    1213px 661px 0 0px rgba(255, 255, 255, 0.093),
    1385px 530px 0 0px rgba(255, 255, 255, 0.258),
    830px 923px 0 0px rgba(255, 255, 255, 0.477),
    1595px 1305px 0 0px rgba(255, 255, 255, 0.102),
    899px 431px 0 0px rgba(255, 255, 255, 0.977),
    449px 84px 0 0px rgba(255, 255, 255, 0.303),
    964px 103px 0 0px rgba(255, 255, 255, 0.913),
    556px 1367px 0 0px rgba(255, 255, 255, 0.402),
    90px 792px 0 0px rgba(255, 255, 255, 0.208),
    617px 793px 0 0px rgba(255, 255, 255, 0.402),
    1569px 913px 0 0px rgba(255, 255, 255, 0.942),
    1341px 358px 0 0px rgba(255, 255, 255, 0.935),
    513px 455px 0 0px rgba(255, 255, 255, 0.253),
    87px 804px 0 0px rgba(255, 255, 255, 0.555),
    346px 646px 0 0px rgba(255, 255, 255, 0.721),
    713px 770px 0 0px rgba(255, 255, 255, 0.444),
    1501px 1242px 0 0px rgba(255, 255, 255, 0.983),
    351px 148px 0 0px rgba(255, 255, 255, 0.348),
    1040px 494px 0 0px rgba(255, 255, 255, 0.751),
    544px 603px 0 0px rgba(255, 255, 255, 0.146),
    1397px 1112px 0 0px rgba(255, 255, 255, 0.438),
    386px 1579px 0 0px rgba(255, 255, 255, 0.113),
    262px 36px 0 0px rgba(255, 255, 255, 0.247),
    593px 906px 0 0px rgba(255, 255, 255, 0.231),
    1788px 1058px 0 0px rgba(255, 255, 255, 0.862),
    1393px 723px 0 0px rgba(255, 255, 255, 0.304),
    511px 1499px 0 0px rgba(255, 255, 255, 0.308),
    1179px 612px 0 0px rgba(255, 255, 255, 0.693),
    880px 1456px 0 0px rgba(255, 255, 255, 0.428),
    1254px 206px 0 0px rgba(255, 255, 255, 0.721),
    1751px 608px 0 0px rgba(255, 255, 255, 0.91),
    733px 1677px 0 0px rgba(255, 255, 255, 0.572),
    1635px 556px 0 0px rgba(255, 255, 255, 0.017),
    75px 184px 0 0px rgba(255, 255, 255, 0.664),
    298px 322px 0 0px rgba(255, 255, 255, 0.284),
    1360px 874px 0 0px rgba(255, 255, 255, 0.843),
    1314px 633px 0 0px rgba(255, 255, 255, 0.679),
    457px 1584px 0 0px rgba(255, 255, 255, 0.944),
    1026px 1747px 0 0px rgba(255, 255, 255, 0.025),
    650px 87px 0 0px rgba(255, 255, 255, 0.27),
    557px 1129px 0 0px rgba(255, 255, 255, 0.186),
    214px 1002px 0 0px rgba(255, 255, 255, 0.448),
    156px 1084px 0 0px rgba(255, 255, 255, 0.948),
    1218px 1107px 0 0px rgba(255, 255, 255, 0.065),
    1447px 347px 0 0px rgba(255, 255, 255, 0.579),
    681px 625px 0 0px rgba(255, 255, 255, 0.993),
    775px 1054px 0 0px rgba(255, 255, 255, 0.279),
    1571px 1035px 0 0px rgba(255, 255, 255, 0.54),
    1661px 322px 0 0px rgba(255, 255, 255, 0.221),
    1492px 577px 0 0px rgba(255, 255, 255, 0.076),
    1420px 366px 0 0px rgba(255, 255, 255, 0.778),
    1358px 906px 0 0px rgba(255, 255, 255, 0.619),
    764px 1061px 0 0px rgba(255, 255, 255, 0.851),
    376px 1687px 0 0px rgba(255, 255, 255, 0.983),
    1304px 1593px 0 0px rgba(255, 255, 255, 0.426),
    441px 1547px 0 0px rgba(255, 255, 255, 0.24),
    400px 1795px 0 0px rgba(255, 255, 255, 0.513),
    1445px 169px 0 0px rgba(255, 255, 255, 0.798),
    208px 703px 0 0px rgba(255, 255, 255, 0.104),
    1537px 792px 0 0px rgba(255, 255, 255, 0.248),
    203px 958px 0 0px rgba(255, 255, 255, 0.778),
    869px 958px 0 0px rgba(255, 255, 255, 0.427),
    1535px 1178px 0 0px rgba(255, 255, 255, 0.174),
    1765px 864px 0 0px rgba(255, 255, 255, 0.298),
    933px 1726px 0 0px rgba(255, 255, 255, 0.623),
    446px 1466px 0 0px rgba(255, 255, 255, 0.718),
    1222px 1292px 0 0px rgba(255, 255, 255, 0.763),
    1216px 495px 0 0px rgba(255, 255, 255, 0.3),
    1421px 1650px 0 0px rgba(255, 255, 255, 0.055),
    106px 52px 0 0px rgba(255, 255, 255, 0.592),
    328px 657px 0 0px rgba(255, 255, 255, 0.639),
    1087px 993px 0 0px rgba(255, 255, 255, 0.003),
    1561px 1363px 0 0px rgba(255, 255, 255, 0.665),
    637px 1564px 0 0px rgba(255, 255, 255, 0.614),
    341px 1577px 0 0px rgba(255, 255, 255, 0.606),
    1542px 608px 0 0px rgba(255, 255, 255, 0.79),
    1585px 1783px 0 0px rgba(255, 255, 255, 0.003),
    568px 1463px 0 0px rgba(255, 255, 255, 0.032),
    1452px 1534px 0 0px rgba(255, 255, 255, 0.662),
    980px 1461px 0 0px rgba(255, 255, 255, 0.868),
    597px 1661px 0 0px rgba(255, 255, 255, 0.075),
    1481px 470px 0 0px rgba(255, 255, 255, 0.395),
    1191px 468px 0 0px rgba(255, 255, 255, 0.762),
    447px 1101px 0 0px rgba(255, 255, 255, 0.858),
    1409px 613px 0 0px rgba(255, 255, 255, 0.021),
    657px 1280px 0 0px rgba(255, 255, 255, 0.732),
    1764px 723px 0 0px rgba(255, 255, 255, 0.44),
    468px 165px 0 0px rgba(255, 255, 255, 0.444),
    1281px 1277px 0 0px rgba(255, 255, 255, 0.232),
    1703px 1674px 0 0px rgba(255, 255, 255, 0.079),
    1300px 1061px 0 0px rgba(255, 255, 255, 0.025),
    1617px 177px 0 0px rgba(255, 255, 255, 0.413),
    852px 678px 0 0px rgba(255, 255, 255, 0.366),
    1081px 1003px 0 0px rgba(255, 255, 255, 0.707),
    1101px 1702px 0 0px rgba(255, 255, 255, 0.694),
    793px 365px 0 0px rgba(255, 255, 255, 0.674),
    1402px 1105px 0 0px rgba(255, 255, 255, 0.964),
    808px 426px 0 0px rgba(255, 255, 255, 0.249),
    782px 1462px 0 0px rgba(255, 255, 255, 0.337),
    602px 1733px 0 0px rgba(255, 255, 255, 0.366),
    582px 1798px 0 0px rgba(255, 255, 255, 0.755),
    328px 952px 0 0px rgba(255, 255, 255, 0.957),
    110px 1000px 0 0px rgba(255, 255, 255, 0.112),
    1076px 1124px 0 0px rgba(255, 255, 255, 0.974),
    972px 1409px 0 0px rgba(255, 255, 255, 0.392),
    703px 438px 0 0px rgba(255, 255, 255, 0.537),
    179px 971px 0 0px rgba(255, 255, 255, 0.132),
    1729px 1267px 0 0px rgba(255, 255, 255, 0.6),
    774px 220px 0 0px rgba(255, 255, 255, 0.148),
    907px 972px 0 0px rgba(255, 255, 255, 0.383),
    1167px 207px 0 0px rgba(255, 255, 255, 0.02),
    1651px 820px 0 0px rgba(255, 255, 255, 0.54),
    1530px 1576px 0 0px rgba(255, 255, 255, 0.461),
    47px 197px 0 0px rgba(255, 255, 255, 0.747),
    1744px 1116px 0 0px rgba(255, 255, 255, 0.933),
    1576px 1463px 0 0px rgba(255, 255, 255, 0.426),
    1218px 5px 0 0px rgba(255, 255, 255, 0.625),
    805px 237px 0 0px rgba(255, 255, 255, 0.803),
    995px 711px 0 0px rgba(255, 255, 255, 0.14),
    496px 1080px 0 0px rgba(255, 255, 255, 0.134),
    929px 225px 0 0px rgba(255, 255, 255, 0.259),
    493px 50px 0 0px rgba(255, 255, 255, 0.827),
    1501px 1668px 0 0px rgba(255, 255, 255, 0.043),
    1370px 975px 0 0px rgba(255, 255, 255, 0.174),
    305px 1146px 0 0px rgba(255, 255, 255, 0.565),
    94px 769px 0 0px rgba(255, 255, 255, 0.664),
    1199px 1520px 0 0px rgba(255, 255, 255, 0.515),
    1216px 1186px 0 0px rgba(255, 255, 255, 0.563),
    890px 456px 0 0px rgba(255, 255, 255, 0.469),
    1140px 499px 0 0px rgba(255, 255, 255, 0.317),
    654px 86px 0 0px rgba(255, 255, 255, 0.242),
    81px 252px 0 0px rgba(255, 255, 255, 0.765),
    1230px 907px 0 0px rgba(255, 255, 255, 0.671),
    1583px 151px 0 0px rgba(255, 255, 255, 0.549),
    1055px 961px 0 0px rgba(255, 255, 255, 0.913),
    1800px 69px 0 0px rgba(255, 255, 255, 0.479),
    500px 1590px 0 0px rgba(255, 255, 255, 0.019),
    955px 1434px 0 0px rgba(255, 255, 255, 0.834),
    340px 1305px 0 0px rgba(255, 255, 255, 0.636),
    1521px 126px 0 0px rgba(255, 255, 255, 0.119),
    681px 78px 0 0px rgba(255, 255, 255, 0.74),
    1775px 779px 0 0px rgba(255, 255, 255, 0.144),
    1346px 880px 0 0px rgba(255, 255, 255, 0.58),
    1351px 1223px 0 0px rgba(255, 255, 255, 0.822),
    1548px 104px 0 0px rgba(255, 255, 255, 0.675),
    124px 1722px 0 0px rgba(255, 255, 255, 0.079),
    309px 562px 0 0px rgba(255, 255, 255, 0.287),
    149px 253px 0 0px rgba(255, 255, 255, 0.132),
    396px 647px 0 0px rgba(255, 255, 255, 0.87),
    752px 291px 0 0px rgba(255, 255, 255, 0.047),
    467px 1015px 0 0px rgba(255, 255, 255, 0.662),
    249px 53px 0 0px rgba(255, 255, 255, 0.239),
    190px 1398px 0 0px rgba(255, 255, 255, 0.466),
    84px 73px 0 0px rgba(255, 255, 255, 0.773),
    1774px 40px 0 0px rgba(255, 255, 255, 0.428),
    1293px 1201px 0 0px rgba(255, 255, 255, 0.27),
    912px 903px 0 0px rgba(255, 255, 255, 0.821),
    136px 1660px 0 0px rgba(255, 255, 255, 0.816),
    1758px 319px 0 0px rgba(255, 255, 255, 0.258),
    1112px 1376px 0 0px rgba(255, 255, 255, 0.62),
    583px 588px 0 0px rgba(255, 255, 255, 0.345),
    484px 105px 0 0px rgba(255, 255, 255, 0.101),
    124px 458px 0 0px rgba(255, 255, 255, 0.131),
    609px 1099px 0 0px rgba(255, 255, 255, 0.121),
    223px 1008px 0 0px rgba(255, 255, 255, 0.504),
    671px 1119px 0 0px rgba(255, 255, 255, 0.321),
    361px 1040px 0 0px rgba(255, 255, 255, 0.32),
    1693px 659px 0 0px rgba(255, 255, 255, 0.274),
    1217px 205px 0 0px rgba(255, 255, 255, 0.367),
    585px 419px 0 0px rgba(255, 255, 255, 0.893),
    878px 133px 0 0px rgba(255, 255, 255, 0.779),
    661px 1339px 0 0px rgba(255, 255, 255, 0.843),
    1384px 758px 0 0px rgba(255, 255, 255, 0.981),
    1052px 1189px 0 0px rgba(255, 255, 255, 0.508),
    1700px 525px 0 0px rgba(255, 255, 255, 0.503),
    1169px 243px 0 0px rgba(255, 255, 255, 0.471),
    1471px 1666px 0 0px rgba(255, 255, 255, 0.666),
    972px 1298px 0 0px rgba(255, 255, 255, 0.473),
    21px 1351px 0 0px rgba(255, 255, 255, 0.784),
    529px 1690px 0 0px rgba(255, 255, 255, 0.48),
    674px 440px 0 0px rgba(255, 255, 255, 0.585),
    1263px 1742px 0 0px rgba(255, 255, 255, 0.869),
    500px 760px 0 0px rgba(255, 255, 255, 0.141),
    284px 1597px 0 0px rgba(255, 255, 255, 0.52),
    1463px 1333px 0 0px rgba(255, 255, 255, 0.821),
    614px 365px 0 0px rgba(255, 255, 255, 0.742),
    942px 542px 0 0px rgba(255, 255, 255, 0.641),
    661px 1207px 0 0px rgba(255, 255, 255, 0.577),
    1724px 1498px 0 0px rgba(255, 255, 255, 0.823),
    1492px 1577px 0 0px rgba(255, 255, 255, 0.956),
    452px 1005px 0 0px rgba(255, 255, 255, 0.146),
    725px 1498px 0 0px rgba(255, 255, 255, 0.998),
    1048px 10px 0 0px rgba(255, 255, 255, 0.463),
    1477px 1007px 0 0px rgba(255, 255, 255, 0.241),
    871px 922px 0 0px rgba(255, 255, 255, 0.116),
    993px 1627px 0 0px rgba(255, 255, 255, 0.196),
    924px 531px 0 0px rgba(255, 255, 255, 0.842),
    1202px 1301px 0 0px rgba(255, 255, 255, 0.81),
    273px 1266px 0 0px rgba(255, 255, 255, 0.34),
    443px 357px 0 0px rgba(255, 255, 255, 0.647),
    311px 645px 0 0px rgba(255, 255, 255, 0.674),
    1326px 478px 0 0px rgba(255, 255, 255, 0.873),
    1795px 1309px 0 0px rgba(255, 255, 255, 0.788),
    319px 1701px 0 0px rgba(255, 255, 255, 0.152),
    1551px 1714px 0 0px rgba(255, 255, 255, 0.217),
    327px 1507px 0 0px rgba(255, 255, 255, 0.06),
    470px 1492px 0 0px rgba(255, 255, 255, 0.095),
    117px 1790px 0 0px rgba(255, 255, 255, 0.351),
    1612px 1424px 0 0px rgba(255, 255, 255, 0.958),
    588px 773px 0 0px rgba(255, 255, 255, 0.599),
    883px 417px 0 0px rgba(255, 255, 255, 0.801),
    835px 1257px 0 0px rgba(255, 255, 255, 0.542),
    506px 806px 0 0px rgba(255, 255, 255, 0.006),
    640px 398px 0 0px rgba(255, 255, 255, 0.296),
    1082px 326px 0 0px rgba(255, 255, 255, 0.108),
    175px 187px 0 0px rgba(255, 255, 255, 0.734),
    368px 1371px 0 0px rgba(255, 255, 255, 0.026),
    1566px 1708px 0 0px rgba(255, 255, 255, 0.3),
    38px 135px 0 0px rgba(255, 255, 255, 0.094),
    944px 1778px 0 0px rgba(255, 255, 255, 0.792),
    1227px 214px 0 0px rgba(255, 255, 255, 0.258),
    1497px 1467px 0 0px rgba(255, 255, 255, 0.152),
    801px 1136px 0 0px rgba(255, 255, 255, 0.799),
    1083px 775px 0 0px rgba(255, 255, 255, 0.208),
    1331px 1499px 0 0px rgba(255, 255, 255, 0.719),
    119px 291px 0 0px rgba(255, 255, 255, 0.249),
    391px 117px 0 0px rgba(255, 255, 255, 0.016),
    1571px 1254px 0 0px rgba(255, 255, 255, 0.981),
    1242px 27px 0 0px rgba(255, 255, 255, 0.733),
    547px 777px 0 0px rgba(255, 255, 255, 0.163),
    1798px 805px 0 0px rgba(255, 255, 255, 0.747),
    769px 1615px 0 0px rgba(255, 255, 255, 0.619),
    1028px 250px 0 0px rgba(255, 255, 255, 0.69),
    1712px 851px 0 0px rgba(255, 255, 255, 0.046),
    1130px 1440px 0 0px rgba(255, 255, 255, 0.287),
    390px 282px 0 0px rgba(255, 255, 255, 0.89),
    800px 985px 0 0px rgba(255, 255, 255, 0.277),
    1474px 428px 0 0px rgba(255, 255, 255, 0.555),
    1418px 1482px 0 0px rgba(255, 255, 255, 0.939),
    1508px 334px 0 0px rgba(255, 255, 255, 0.686),
    1187px 1401px 0 0px rgba(255, 255, 255, 0.308),
    1638px 458px 0 0px rgba(255, 255, 255, 0.993),
    1063px 1064px 0 0px rgba(255, 255, 255, 0.069),
    233px 698px 0 0px rgba(255, 255, 255, 0.148),
    1370px 1651px 0 0px rgba(255, 255, 255, 0.62),
    904px 536px 0 0px rgba(255, 255, 255, 0.463),
    946px 516px 0 0px rgba(255, 255, 255, 0.579),
    1093px 1745px 0 0px rgba(255, 255, 255, 0.48),
    1144px 948px 0 0px rgba(255, 255, 255, 0.584),
    982px 1479px 0 0px rgba(255, 255, 255, 0.299),
    1500px 677px 0 0px rgba(255, 255, 255, 0.753),
    51px 819px 0 0px rgba(255, 255, 255, 0.951),
    1590px 1048px 0 0px rgba(255, 255, 255, 0.44),
    1316px 1458px 0 0px rgba(255, 255, 255, 0.016),
    63px 690px 0 0px rgba(255, 255, 255, 0.462),
    964px 1244px 0 0px rgba(255, 255, 255, 0.995),
    1240px 1405px 0 0px rgba(255, 255, 255, 0.867),
    1444px 747px 0 0px rgba(255, 255, 255, 0.155),
    489px 338px 0 0px rgba(255, 255, 255, 0.73),
    392px 963px 0 0px rgba(255, 255, 255, 0.648),
    1150px 1314px 0 0px rgba(255, 255, 255, 0.707),
    704px 56px 0 0px rgba(255, 255, 255, 0.114),
    854px 584px 0 0px rgba(255, 255, 255, 0.151),
    1371px 918px 0 0px rgba(255, 255, 255, 0.971),
    1254px 301px 0 0px rgba(255, 255, 255, 0.076),
    4px 150px 0 0px rgba(255, 255, 255, 0.287),
    1372px 1707px 0 0px rgba(255, 255, 255, 0.036),
    1068px 1307px 0 0px rgba(255, 255, 255, 0.528),
    806px 407px 0 0px rgba(255, 255, 255, 0.948),
    645px 1039px 0 0px rgba(255, 255, 255, 0.51),
    1426px 226px 0 0px rgba(255, 255, 255, 0.231),
    1505px 1022px 0 0px rgba(255, 255, 255, 0.501),
    1613px 371px 0 0px rgba(255, 255, 255, 0.96),
    841px 1143px 0 0px rgba(255, 255, 255, 0.504),
    604px 1413px 0 0px rgba(255, 255, 255, 0.893),
    1067px 522px 0 0px rgba(255, 255, 255, 0.817),
    23px 448px 0 0px rgba(255, 255, 255, 0.064),
    1176px 153px 0 0px rgba(255, 255, 255, 0.617),
    1747px 540px 0 0px rgba(255, 255, 255, 0.884),
    1254px 562px 0 0px rgba(255, 255, 255, 0.242),
    12px 212px 0 0px rgba(255, 255, 255, 0.764),
    1029px 1088px 0 0px rgba(255, 255, 255, 0.414),
    1708px 831px 0 0px rgba(255, 255, 255, 0.956),
    873px 1191px 0 0px rgba(255, 255, 255, 0.046),
    354px 1447px 0 0px rgba(255, 255, 255, 0.093),
    1350px 1757px 0 0px rgba(255, 255, 255, 0.479),
    920px 1115px 0 0px rgba(255, 255, 255, 0.3),
    1238px 831px 0 0px rgba(255, 255, 255, 0.687),
    1757px 656px 0 0px rgba(255, 255, 255, 0.133),
    95px 1245px 0 0px rgba(255, 255, 255, 0.538),
    937px 355px 0 0px rgba(255, 255, 255, 0.042),
    1159px 578px 0 0px rgba(255, 255, 255, 0.236),
    450px 1044px 0 0px rgba(255, 255, 255, 0.881),
    744px 884px 0 0px rgba(255, 255, 255, 0.402),
    1686px 778px 0 0px rgba(255, 255, 255, 0.723),
    1652px 850px 0 0px rgba(255, 255, 255, 0.997),
    1610px 1761px 0 0px rgba(255, 255, 255, 0.488),
    1069px 1681px 0 0px rgba(255, 255, 255, 0.192),
    220px 366px 0 0px rgba(255, 255, 255, 0.07),
    383px 343px 0 0px rgba(255, 255, 255, 0.092),
    1360px 1624px 0 0px rgba(255, 255, 255, 0.811),
    419px 613px 0 0px rgba(255, 255, 255, 0.349),
    1406px 466px 0 0px rgba(255, 255, 255, 0.737),
    1012px 1351px 0 0px rgba(255, 255, 255, 0.746),
    1043px 914px 0 0px rgba(255, 255, 255, 0.103),
    63px 1658px 0 0px rgba(255, 255, 255, 0.942),
    207px 642px 0 0px rgba(255, 255, 255, 0.579),
    1471px 1176px 0 0px rgba(255, 255, 255, 0.676),
    1246px 1145px 0 0px rgba(255, 255, 255, 0.165),
    569px 913px 0 0px rgba(255, 255, 255, 0.377),
    1414px 818px 0 0px rgba(255, 255, 255, 0.829),
    467px 1776px 0 0px rgba(255, 255, 255, 0.821),
    1716px 858px 0 0px rgba(255, 255, 255, 0.797),
    811px 1544px 0 0px rgba(255, 255, 255, 0.015),
    834px 263px 0 0px rgba(255, 255, 255, 0.456),
    1071px 884px 0 0px rgba(255, 255, 255, 0.098),
    258px 1529px 0 0px rgba(255, 255, 255, 0.603),
    662px 1278px 0 0px rgba(255, 255, 255, 0.388),
    1731px 1736px 0 0px rgba(255, 255, 255, 0.206),
    218px 1507px 0 0px rgba(255, 255, 255, 0.961),
    1432px 938px 0 0px rgba(255, 255, 255, 0.734),
    916px 1652px 0 0px rgba(255, 255, 255, 0.807),
    1592px 621px 0 0px rgba(255, 255, 255, 0.072),
    1016px 1546px 0 0px rgba(255, 255, 255, 0.356),
    1742px 1721px 0 0px rgba(255, 255, 255, 0.53),
    824px 36px 0 0px rgba(255, 255, 255, 0.294),
    1320px 1439px 0 0px rgba(255, 255, 255, 0.352),
    1788px 344px 0 0px rgba(255, 255, 255, 0.251),
    323px 1705px 0 0px rgba(255, 255, 255, 0.992),
    68px 1090px 0 0px rgba(255, 255, 255, 0.783),
    1715px 1041px 0 0px rgba(255, 255, 255, 0.962),
    348px 1017px 0 0px rgba(255, 255, 255, 0.665),
    1666px 321px 0 0px rgba(255, 255, 255, 0.184),
    1086px 437px 0 0px rgba(255, 255, 255, 0.801),
    396px 906px 0 0px rgba(255, 255, 255, 0.916),
    1672px 448px 0 0px rgba(255, 255, 255, 0.973),
    875px 591px 0 0px rgba(255, 255, 255, 0.384),
    266px 1209px 0 0px rgba(255, 255, 255, 0.606),
    1056px 1237px 0 0px rgba(255, 255, 255, 0.702),
    1238px 708px 0 0px rgba(255, 255, 255, 0.771),
    537px 1259px 0 0px rgba(255, 255, 255, 0.175),
    756px 1323px 0 0px rgba(255, 255, 255, 0.891),
    1727px 1784px 0 0px rgba(255, 255, 255, 0.088),
    511px 843px 0 0px rgba(255, 255, 255, 0.01),
    89px 448px 0 0px rgba(255, 255, 255, 0.072),
    783px 483px 0 0px rgba(255, 255, 255, 0.266),
    1674px 978px 0 0px rgba(255, 255, 255, 0.413);
  border-radius: 100px;
}
.solar-syst div {
  border-radius: 1000px;
  top: 50%;
  left: 50%;
  position: absolute;
  z-index: 999;
}
.solar-syst div:not(.sun) {
  border: 1px solid rgba(102, 166, 229, 0.12);
}
.solar-syst div:not(.sun):before {
  left: 50%;
  border-radius: 100px;
  content: '';
  position: absolute;
}
.solar-syst div:not(.asteroids-belt):before {
  box-shadow: inset 0 6px 0 -2px rgba(0, 0, 0, 0.25);
}

.sun {
  background: radial-gradient(
    ellipse at center,
    #ffd000 1%,
    #f9b700 39%,
    #f9b700 39%,
    #e06317 100%
  );
  height: 40px;
  width: 40px;
  margin-top: -20px;
  margin-left: -20px;
  background-clip: padding-box;
  border: 0 !important;
  background-position: -28px -103px;
  background-size: 175%;
  box-shadow:
    0 0 10px 2px rgba(255, 107, 0, 0.4),
    0 0 22px 11px rgba(255, 203, 0, 0.13);
}

.mercury {
  height: 70px;
  width: 70px;
  margin-top: -35px;
  margin-left: -35px;
  animation: orb 7.1867343561s linear infinite;
}
.mercury:before {
  height: 4px;
  width: 4px;
  background: #9f5e26;
  margin-top: -2px;
  margin-left: -2px;
}

.venus {
  height: 100px;
  width: 100px;
  margin-top: -50px;
  margin-left: -50px;
  animation: orb 18.4555338265s linear infinite;
}
.venus:before {
  height: 8px;
  width: 8px;
  background: #beb768;
  margin-top: -4px;
  margin-left: -4px;
}

.earth {
  height: 145px;
  width: 145px;
  margin-top: -72.5px;
  margin-left: -72.5px;
  animation: orb 30s linear infinite;
}
.earth:before {
  height: 6px;
  width: 6px;
  background: #11abe9;
  margin-top: -3px;
  margin-left: -3px;
}
.earth:after {
  position: absolute;
  content: '';
  height: 18px;
  width: 18px;
  left: 50%;
  top: 0px;
  margin-left: -9px;
  margin-top: -9px;
  border-radius: 100px;
  box-shadow: 0 -10px 0 -8px grey;
  animation: orb 2.2440352158s linear infinite;
}

.mars {
  height: 190px;
  width: 190px;
  margin-top: -95px;
  margin-left: -95px;
  animation: orb 56.4261314589s linear infinite;
}
.mars:before {
  height: 6px;
  width: 6px;
  background: #cf3921;
  margin-top: -3px;
  margin-left: -3px;
}

.jupiter {
  height: 340px;
  width: 340px;
  margin-top: -170px;
  margin-left: -170px;
  animation: orb 355.7228171013s linear infinite;
}
.jupiter:before {
  height: 18px;
  width: 18px;
  background: #c76e2a;
  margin-top: -9px;
  margin-left: -9px;
}

.saturn {
  height: 440px;
  width: 440px;
  margin-top: -220px;
  margin-left: -220px;
  animation: orb 882.6952471456s linear infinite;
}
.saturn:before {
  height: 12px;
  width: 12px;
  background: #e7c194;
  margin-top: -6px;
  margin-left: -6px;
}
.saturn:after {
  position: absolute;
  content: '';
  height: 2.34%;
  width: 4.676%;
  left: 50%;
  top: 0px;
  transform: rotateZ(-52deg);
  margin-left: -2.3%;
  margin-top: -1.2%;
  border-radius: 50% 50% 50% 50%;
  box-shadow:
    0 1px 0 1px #987641,
    3px 1px 0 #987641,
    -3px 1px 0 #987641;
  animation: orb 882.6952471456s linear infinite;
  animation-direction: reverse;
  transform-origin: 52% 60%;
}

.uranus {
  height: 520px;
  width: 520px;
  margin-top: -260px;
  margin-left: -260px;
  animation: orb 2512.4001967933s linear infinite;
}
.uranus:before {
  height: 10px;
  width: 10px;
  background: #b5e3e3;
  margin-top: -5px;
  margin-left: -5px;
}

.neptune {
  height: 630px;
  width: 630px;
  margin-top: -315px;
  margin-left: -315px;
  animation: orb 4911.7838624549s linear infinite;
}
.neptune:before {
  height: 10px;
  width: 10px;
  background: #175e9e;
  margin-top: -5px;
  margin-left: -5px;
}

.asteroids-belt {
  opacity: 0.7;
  border-color: transparent !important;
  height: 300px;
  width: 300px;
  margin-top: -150px;
  margin-left: -150px;
  animation: orb 179.9558282773s linear infinite;
  overflow: hidden;
}
.asteroids-belt:before {
  top: 50%;
  height: 210px;
  width: 210px;
  margin-left: -105px;
  margin-top: -105px;
  background: transparent;
  border-radius: 140px !important;
  box-shadow:
    129px -48px 0 -104px rgba(255, 255, 255, 0.164),
    -57px 48px 0 -104px rgba(255, 255, 255, 0.892),
    -65px -32px 0 -104px rgba(255, 255, 255, 0.64),
    8px 102px 0 -104px rgba(255, 255, 255, 0.705),
    138px 12px 0 -104px rgba(255, 255, 255, 0.381),
    -69px -118px 0 -104px rgba(255, 255, 255, 0.139),
    8px 88px 0 -104px rgba(255, 255, 255, 0.3),
    -118px 83px 0 -104px rgba(255, 255, 255, 0.147),
    -82px -142px 0 -104px rgba(255, 255, 255, 0.219),
    74px -109px 0 -104px rgba(255, 255, 255, 0.226),
    -1px -10px 0 -104px rgba(255, 255, 255, 0.96),
    126px 145px 0 -104px rgba(255, 255, 255, 0.66),
    39px 60px 0 -104px rgba(255, 255, 255, 0.262),
    105px -23px 0 -104px rgba(255, 255, 255, 0.197),
    -60px 77px 0 -104px rgba(255, 255, 255, 0.804),
    -40px -91px 0 -104px rgba(255, 255, 255, 0.658),
    68px -88px 0 -104px rgba(255, 255, 255, 0.946),
    71px 11px 0 -104px rgba(255, 255, 255, 0.998),
    -63px -35px 0 -104px rgba(255, 255, 255, 0.905),
    7px -23px 0 -104px rgba(255, 255, 255, 0.947),
    136px 56px 0 -104px rgba(255, 255, 255, 0.564),
    -89px 24px 0 -104px rgba(255, 255, 255, 0.307),
    137px 51px 0 -104px rgba(255, 255, 255, 0.869),
    99px -10px 0 -104px rgba(255, 255, 255, 0.912),
    49px 10px 0 -104px rgba(255, 255, 255, 0.214),
    24px -37px 0 -104px rgba(255, 255, 255, 0.865),
    48px -30px 0 -104px rgba(255, 255, 255, 0.315),
    -18px 109px 0 -104px rgba(255, 255, 255, 0.079),
    68px 55px 0 -104px rgba(255, 255, 255, 0.773),
    69px -123px 0 -104px rgba(255, 255, 255, 0.615),
    98px 85px 0 -104px rgba(255, 255, 255, 0.443),
    -46px -2px 0 -104px rgba(255, 255, 255, 0.382),
    -101px 38px 0 -104px rgba(255, 255, 255, 0.146),
    61px -80px 0 -104px rgba(255, 255, 255, 0.144),
    -123px -62px 0 -104px rgba(255, 255, 255, 0.302),
    103px -122px 0 -104px rgba(255, 255, 255, 0.4),
    -97px -11px 0 -104px rgba(255, 255, 255, 0.441),
    8px -139px 0 -104px rgba(255, 255, 255, 0.831),
    -89px -62px 0 -104px rgba(255, 255, 255, 0.911),
    -99px 139px 0 -104px rgba(255, 255, 255, 0.771),
    135px -131px 0 -104px rgba(255, 255, 255, 0.967),
    -87px -128px 0 -104px rgba(255, 255, 255, 0.718),
    122px 64px 0 -104px rgba(255, 255, 255, 0.849),
    -25px 43px 0 -104px rgba(255, 255, 255, 0.705),
    -137px -6px 0 -104px rgba(255, 255, 255, 0.754),
    13px 102px 0 -104px rgba(255, 255, 255, 0.925),
    -87px -99px 0 -104px rgba(255, 255, 255, 0.937),
    -117px -98px 0 -104px rgba(255, 255, 255, 0.051),
    -55px 84px 0 -104px rgba(255, 255, 255, 0.511),
    130px 44px 0 -104px rgba(255, 255, 255, 0.449),
    -76px 58px 0 -104px rgba(255, 255, 255, 0.8),
    -15px 69px 0 -104px rgba(255, 255, 255, 0.028),
    141px 136px 0 -104px rgba(255, 255, 255, 0.41),
    36px 118px 0 -104px rgba(255, 255, 255, 0.541),
    -22px 136px 0 -104px rgba(255, 255, 255, 0.441),
    -21px -42px 0 -104px rgba(255, 255, 255, 0.285),
    47px -109px 0 -104px rgba(255, 255, 255, 0.238),
    -10px -77px 0 -104px rgba(255, 255, 255, 0.057),
    72px 20px 0 -104px rgba(255, 255, 255, 0.6),
    -130px 31px 0 -104px rgba(255, 255, 255, 0.218),
    28px -9px 0 -104px rgba(255, 255, 255, 0.888),
    11px 144px 0 -104px rgba(255, 255, 255, 0.019),
    1px -131px 0 -104px rgba(255, 255, 255, 0.513),
    30px 42px 0 -104px rgba(255, 255, 255, 0.454),
    126px -51px 0 -104px rgba(255, 255, 255, 0.173),
    26px -54px 0 -104px rgba(255, 255, 255, 0.334),
    -71px 112px 0 -104px rgba(255, 255, 255, 0.056),
    43px 97px 0 -104px rgba(255, 255, 255, 0.367),
    -56px 133px 0 -104px rgba(255, 255, 255, 0.464),
    131px -111px 0 -104px rgba(255, 255, 255, 0.127),
    -132px 3px 0 -104px rgba(255, 255, 255, 0.787),
    122px -80px 0 -104px rgba(255, 255, 255, 0.341),
    80px -72px 0 -104px rgba(255, 255, 255, 0.522),
    76px -21px 0 -104px rgba(255, 255, 255, 0.728),
    69px 96px 0 -104px rgba(255, 255, 255, 0.027),
    -50px 49px 0 -104px rgba(255, 255, 255, 0.698),
    -110px 0px 0 -104px rgba(255, 255, 255, 0.012),
    115px 13px 0 -104px rgba(255, 255, 255, 0.831),
    -123px -35px 0 -104px rgba(255, 255, 255, 0.493),
    117px 112px 0 -104px rgba(255, 255, 255, 0.897),
    69px -14px 0 -104px rgba(255, 255, 255, 0.871),
    30px 58px 0 -104px rgba(255, 255, 255, 0.934),
    -22px -52px 0 -104px rgba(255, 255, 255, 0.044),
    49px 136px 0 -104px rgba(255, 255, 255, 0.097),
    -29px -74px 0 -104px rgba(255, 255, 255, 0.547),
    16px -28px 0 -104px rgba(255, 255, 255, 0.41),
    43px 17px 0 -104px rgba(255, 255, 255, 0.284),
    -4px -16px 0 -104px rgba(255, 255, 255, 0.669),
    99px 132px 0 -104px rgba(255, 255, 255, 0.351),
    -64px -40px 0 -104px rgba(255, 255, 255, 0.405),
    -96px 66px 0 -104px rgba(255, 255, 255, 0.463),
    138px -80px 0 -104px rgba(255, 255, 255, 0.62),
    -126px 19px 0 -104px rgba(255, 255, 255, 0.039),
    -52px 143px 0 -104px rgba(255, 255, 255, 0.967),
    -137px -34px 0 -104px rgba(255, 255, 255, 0.651),
    82px -65px 0 -104px rgba(255, 255, 255, 0.192),
    -24px 26px 0 -104px rgba(255, 255, 255, 0.306),
    8px -18px 0 -104px rgba(255, 255, 255, 0.668),
    -48px -91px 0 -104px rgba(255, 255, 255, 0.396),
    29px -101px 0 -104px rgba(255, 255, 255, 0.726),
    -15px -124px 0 -104px rgba(255, 255, 255, 0.099),
    11px 53px 0 -104px rgba(255, 255, 255, 0.81),
    -18px -139px 0 -104px rgba(255, 255, 255, 0.113),
    -117px -12px 0 -104px rgba(255, 255, 255, 0.88),
    -24px 13px 0 -104px rgba(255, 255, 255, 0.171),
    88px 84px 0 -104px rgba(255, 255, 255, 0.355),
    -50px -90px 0 -104px rgba(255, 255, 255, 0.153),
    -79px -59px 0 -104px rgba(255, 255, 255, 0.085),
    10px 91px 0 -104px rgba(255, 255, 255, 0.466),
    79px 69px 0 -104px rgba(255, 255, 255, 0.72),
    -95px -118px 0 -104px rgba(255, 255, 255, 0.294),
    125px -135px 0 -104px rgba(255, 255, 255, 0.866),
    15px 118px 0 -104px rgba(255, 255, 255, 0.575),
    44px -81px 0 -104px rgba(255, 255, 255, 0.175),
    23px -46px 0 -104px rgba(255, 255, 255, 0.856),
    -93px 72px 0 -104px rgba(255, 255, 255, 0.152),
    97px 103px 0 -104px rgba(255, 255, 255, 0.048),
    72px -59px 0 -104px rgba(255, 255, 255, 0.962),
    -32px 31px 0 -104px rgba(255, 255, 255, 0.806),
    -52px -117px 0 -104px rgba(255, 255, 255, 0.527),
    73px -127px 0 -104px rgba(255, 255, 255, 0.96),
    -114px 23px 0 -104px rgba(255, 255, 255, 0.44),
    -70px 86px 0 -104px rgba(255, 255, 255, 0.74),
    -101px 34px 0 -104px rgba(255, 255, 255, 0.808),
    54px -32px 0 -104px rgba(255, 255, 255, 0.385),
    110px -98px 0 -104px rgba(255, 255, 255, 0.118),
    -139px 49px 0 -104px rgba(255, 255, 255, 0.273),
    105px -140px 0 -104px rgba(255, 255, 255, 0.774),
    -48px -84px 0 -104px rgba(255, 255, 255, 0.786),
    -77px 109px 0 -104px rgba(255, 255, 255, 0.978),
    -46px -105px 0 -104px rgba(255, 255, 255, 0.665),
    12px 67px 0 -104px rgba(255, 255, 255, 0.927),
    -103px 130px 0 -104px rgba(255, 255, 255, 0.869),
    -106px -78px 0 -104px rgba(255, 255, 255, 0.957),
    -51px -117px 0 -104px rgba(255, 255, 255, 0.737),
    -118px -89px 0 -104px rgba(255, 255, 255, 0.515),
    28px 75px 0 -104px rgba(255, 255, 255, 0.973),
    141px 111px 0 -104px rgba(255, 255, 255, 0.632),
    145px -111px 0 -104px rgba(255, 255, 255, 0.323),
    118px -73px 0 -104px rgba(255, 255, 255, 0.633),
    65px 68px 0 -104px rgba(255, 255, 255, 0.8),
    -64px 73px 0 -104px rgba(255, 255, 255, 0.678),
    34px -23px 0 -104px rgba(255, 255, 255, 0.289),
    133px 32px 0 -104px rgba(255, 255, 255, 0.026),
    -58px 0px 0 -104px rgba(255, 255, 255, 0.436),
    -61px -137px 0 -104px rgba(255, 255, 255, 0.224),
    -22px -137px 0 -104px rgba(255, 255, 255, 0.816),
    35px 108px 0 -104px rgba(255, 255, 255, 0.351),
    58px 78px 0 -104px rgba(255, 255, 255, 0.3),
    -98px 145px 0 -104px rgba(255, 255, 255, 0.936),
    103px -86px 0 -104px rgba(255, 255, 255, 0.373),
    -129px -114px 0 -104px rgba(255, 255, 255, 0.156),
    21px -12px 0 -104px rgba(255, 255, 255, 0.435),
    -52px 56px 0 -104px rgba(255, 255, 255, 0.16),
    133px 79px 0 -104px rgba(255, 255, 255, 0.071),
    90px -105px 0 -104px rgba(255, 255, 255, 0.097),
    -42px -98px 0 -104px rgba(255, 255, 255, 0.34),
    -132px -3px 0 -104px rgba(255, 255, 255, 0.099),
    -56px -121px 0 -104px rgba(255, 255, 255, 0.722),
    47px -97px 0 -104px rgba(255, 255, 255, 0.002),
    -62px -120px 0 -104px rgba(255, 255, 255, 0.472),
    124px 112px 0 -104px rgba(255, 255, 255, 0.101),
    -97px -127px 0 -104px rgba(255, 255, 255, 0.148),
    137px -17px 0 -104px rgba(255, 255, 255, 0.028),
    -77px 118px 0 -104px rgba(255, 255, 255, 0.733),
    129px -77px 0 -104px rgba(255, 255, 255, 0.066),
    -17px 93px 0 -104px rgba(255, 255, 255, 0.41),
    2px -85px 0 -104px rgba(255, 255, 255, 0.239),
    -111px 30px 0 -104px rgba(255, 255, 255, 0.704),
    87px 57px 0 -104px rgba(255, 255, 255, 0.053),
    -112px 27px 0 -104px rgba(255, 255, 255, 0.169),
    102px 104px 0 -104px rgba(255, 255, 255, 0.965),
    133px -49px 0 -104px rgba(255, 255, 255, 0.44),
    71px 81px 0 -104px rgba(255, 255, 255, 0.518),
    -140px -18px 0 -104px rgba(255, 255, 255, 0.48),
    62px -31px 0 -104px rgba(255, 255, 255, 0.503),
    -80px 15px 0 -104px rgba(255, 255, 255, 0.637),
    -24px 11px 0 -104px rgba(255, 255, 255, 0.959),
    -107px 47px 0 -104px rgba(255, 255, 255, 0.957),
    19px 102px 0 -104px rgba(255, 255, 255, 0.271),
    -114px 93px 0 -104px rgba(255, 255, 255, 0.83),
    -53px -45px 0 -104px rgba(255, 255, 255, 0.657),
    -51px -103px 0 -104px rgba(255, 255, 255, 0.264),
    -19px 65px 0 -104px rgba(255, 255, 255, 0.211),
    -75px 126px 0 -104px rgba(255, 255, 255, 0.027),
    -141px 96px 0 -104px rgba(255, 255, 255, 0.479),
    -27px -142px 0 -104px rgba(255, 255, 255, 0.731),
    109px 26px 0 -104px rgba(255, 255, 255, 0.751),
    -118px 145px 0 -104px rgba(255, 255, 255, 0.087),
    -80px -14px 0 -104px rgba(255, 255, 255, 0.789),
    96px 96px 0 -104px rgba(255, 255, 255, 0.773),
    -104px -133px 0 -104px rgba(255, 255, 255, 0.197),
    -11px 128px 0 -104px rgba(255, 255, 255, 0.108),
    -129px -43px 0 -104px rgba(255, 255, 255, 0.937),
    83px -133px 0 -104px rgba(255, 255, 255, 0.65),
    -27px -129px 0 -104px rgba(255, 255, 255, 0.053),
    -9px 40px 0 -104px rgba(255, 255, 255, 0.847),
    -96px -59px 0 -104px rgba(255, 255, 255, 0.454),
    110px 0px 0 -104px rgba(255, 255, 255, 0.194),
    -5px 1px 0 -104px rgba(255, 255, 255, 0.441),
    19px 123px 0 -104px rgba(255, 255, 255, 0.21),
    -137px 143px 0 -104px rgba(255, 255, 255, 0.52),
    26px -46px 0 -104px rgba(255, 255, 255, 0.535),
    -49px 25px 0 -104px rgba(255, 255, 255, 0.657),
    -73px -56px 0 -104px rgba(255, 255, 255, 0.025),
    102px -108px 0 -104px rgba(255, 255, 255, 0.704),
    81px 104px 0 -104px rgba(255, 255, 255, 0.401),
    77px -26px 0 -104px rgba(255, 255, 255, 0.771),
    75px 7px 0 -104px rgba(255, 255, 255, 0.166),
    73px -68px 0 -104px rgba(255, 255, 255, 0.763),
    122px -140px 0 -104px rgba(255, 255, 255, 0.455),
    132px 116px 0 -104px rgba(255, 255, 255, 0.073),
    -68px 86px 0 -104px rgba(255, 255, 255, 0.447),
    -30px 110px 0 -104px rgba(255, 255, 255, 0.444),
    -24px 87px 0 -104px rgba(255, 255, 255, 0.296),
    -44px -136px 0 -104px rgba(255, 255, 255, 0.41),
    -63px 128px 0 -104px rgba(255, 255, 255, 0.388),
    -49px 17px 0 -104px rgba(255, 255, 255, 0.188),
    57px 114px 0 -104px rgba(255, 255, 255, 0.196),
    74px -141px 0 -104px rgba(255, 255, 255, 0.175),
    -94px 36px 0 -104px rgba(255, 255, 255, 0.32),
    -78px 3px 0 -104px rgba(255, 255, 255, 0.534),
    -56px -131px 0 -104px rgba(255, 255, 255, 0.491),
    -125px 56px 0 -104px rgba(255, 255, 255, 0.319),
    -106px -25px 0 -104px rgba(255, 255, 255, 0.95),
    38px -5px 0 -104px rgba(255, 255, 255, 0.248),
    -34px -6px 0 -104px rgba(255, 255, 255, 0.817),
    42px 36px 0 -104px rgba(255, 255, 255, 0.164),
    38px -122px 0 -104px rgba(255, 255, 255, 0.368),
    -57px -88px 0 -104px rgba(255, 255, 255, 0.227),
    14px 43px 0 -104px rgba(255, 255, 255, 0.751),
    85px -114px 0 -104px rgba(255, 255, 255, 0.457),
    109px 116px 0 -104px rgba(255, 255, 255, 0.152),
    103px 72px 0 -104px rgba(255, 255, 255, 0.239),
    -140px 133px 0 -104px rgba(255, 255, 255, 0.247),
    10px -81px 0 -104px rgba(255, 255, 255, 0.045),
    45px 82px 0 -104px rgba(255, 255, 255, 0.335),
    -135px -35px 0 -104px rgba(255, 255, 255, 0.024),
    83px -11px 0 -104px rgba(255, 255, 255, 0.814),
    41px 133px 0 -104px rgba(255, 255, 255, 0.93),
    -31px 8px 0 -104px rgba(255, 255, 255, 0.757),
    -140px 38px 0 -104px rgba(255, 255, 255, 0.061),
    44px 60px 0 -104px rgba(255, 255, 255, 0.306),
    143px 45px 0 -104px rgba(255, 255, 255, 0.091),
    139px -74px 0 -104px rgba(255, 255, 255, 0.08),
    85px 55px 0 -104px rgba(255, 255, 255, 0.261),
    -52px 21px 0 -104px rgba(255, 255, 255, 0.181),
    -57px -107px 0 -104px rgba(255, 255, 255, 0.851),
    53px -72px 0 -104px rgba(255, 255, 255, 0.297),
    8px 69px 0 -104px rgba(255, 255, 255, 0.236),
    44px -5px 0 -104px rgba(255, 255, 255, 0.49),
    -105px 41px 0 -104px rgba(255, 255, 255, 0.464),
    101px 78px 0 -104px rgba(255, 255, 255, 0.783),
    28px 129px 0 -104px rgba(255, 255, 255, 0.49),
    -110px 39px 0 -104px rgba(255, 255, 255, 0.583),
    -79px 110px 0 -104px rgba(255, 255, 255, 0.13),
    71px 106px 0 -104px rgba(255, 255, 255, 0.381),
    116px 43px 0 -104px rgba(255, 255, 255, 0.868),
    -112px 51px 0 -104px rgba(255, 255, 255, 0.011),
    21px 41px 0 -104px rgba(255, 255, 255, 0.842),
    114px -19px 0 -104px rgba(255, 255, 255, 0.766),
    88px 122px 0 -104px rgba(255, 255, 255, 0.324),
    58px -83px 0 -104px rgba(255, 255, 255, 0.623),
    52px -65px 0 -104px rgba(255, 255, 255, 0.208),
    137px 77px 0 -104px rgba(255, 255, 255, 0.579),
    -119px 12px 0 -104px rgba(255, 255, 255, 0.676),
    -142px -82px 0 -104px rgba(255, 255, 255, 0.273),
    -87px 67px 0 -104px rgba(255, 255, 255, 0.426),
    -84px -32px 0 -104px rgba(255, 255, 255, 0.611),
    -142px -126px 0 -104px rgba(255, 255, 255, 0.823),
    135px 93px 0 -104px rgba(255, 255, 255, 0.842),
    -118px 117px 0 -104px rgba(255, 255, 255, 0.498),
    -76px -90px 0 -104px rgba(255, 255, 255, 0.282),
    108px 25px 0 -104px rgba(255, 255, 255, 0.25),
    40px 115px 0 -104px rgba(255, 255, 255, 0.487),
    -109px -129px 0 -104px rgba(255, 255, 255, 0.115),
    -45px -9px 0 -104px rgba(255, 255, 255, 0.467),
    -136px 106px 0 -104px rgba(255, 255, 255, 0.293),
    -112px 68px 0 -104px rgba(255, 255, 255, 0.098),
    55px -21px 0 -104px rgba(255, 255, 255, 0.992),
    53px 143px 0 -104px rgba(255, 255, 255, 0.911),
    -40px -19px 0 -104px rgba(255, 255, 255, 0.254),
    -93px -76px 0 -104px rgba(255, 255, 255, 0.061),
    103px 91px 0 -104px rgba(255, 255, 255, 0.521),
    -104px -27px 0 -104px rgba(255, 255, 255, 0.08),
    -135px -59px 0 -104px rgba(255, 255, 255, 0.893),
    -46px -78px 0 -104px rgba(255, 255, 255, 0.835),
    23px 130px 0 -104px rgba(255, 255, 255, 0.573),
    57px 9px 0 -104px rgba(255, 255, 255, 0.927),
    2px -128px 0 -104px rgba(255, 255, 255, 0.269),
    -16px 82px 0 -104px rgba(255, 255, 255, 0.108),
    -54px -49px 0 -104px rgba(255, 255, 255, 0.368),
    61px 114px 0 -104px rgba(255, 255, 255, 0.009),
    -111px -105px 0 -104px rgba(255, 255, 255, 0.227),
    -45px 41px 0 -104px rgba(255, 255, 255, 0.332),
    -71px -50px 0 -104px rgba(255, 255, 255, 0.66),
    -119px 52px 0 -104px rgba(255, 255, 255, 0.371),
    -50px -87px 0 -104px rgba(255, 255, 255, 0.752),
    -127px -25px 0 -104px rgba(255, 255, 255, 0.718),
    80px -108px 0 -104px rgba(255, 255, 255, 0.172),
    67px -119px 0 -104px rgba(255, 255, 255, 0.692),
    -93px -102px 0 -104px rgba(255, 255, 255, 0.826),
    -30px 111px 0 -104px rgba(255, 255, 255, 0.226),
    7px -93px 0 -104px rgba(255, 255, 255, 0.747),
    111px 119px 0 -104px rgba(255, 255, 255, 0.655),
    103px 20px 0 -104px rgba(255, 255, 255, 0.052),
    144px -51px 0 -104px rgba(255, 255, 255, 0.535),
    -98px 71px 0 -104px rgba(255, 255, 255, 0.278),
    -57px 109px 0 -104px rgba(255, 255, 255, 0.325),
    59px -116px 0 -104px rgba(255, 255, 255, 0.724),
    135px 100px 0 -104px rgba(255, 255, 255, 0.568),
    -32px 75px 0 -104px rgba(255, 255, 255, 0.292),
    49px 103px 0 -104px rgba(255, 255, 255, 0.141),
    77px 16px 0 -104px rgba(255, 255, 255, 0.022),
    -17px -49px 0 -104px rgba(255, 255, 255, 0.219),
    129px -11px 0 -104px rgba(255, 255, 255, 0.877),
    -52px 96px 0 -104px rgba(255, 255, 255, 0.274),
    -92px -142px 0 -104px rgba(255, 255, 255, 0.006),
    14px 33px 0 -104px rgba(255, 255, 255, 0.192),
    7px 89px 0 -104px rgba(255, 255, 255, 0.578),
    -21px 44px 0 -104px rgba(255, 255, 255, 0.51),
    123px -105px 0 -104px rgba(255, 255, 255, 0.914),
    -63px -57px 0 -104px rgba(255, 255, 255, 0.145),
    -9px 32px 0 -104px rgba(255, 255, 255, 0.886),
    112px -12px 0 -104px rgba(255, 255, 255, 0.525),
    30px -44px 0 -104px rgba(255, 255, 255, 0.823),
    -125px 72px 0 -104px rgba(255, 255, 255, 0.872),
    111px 79px 0 -104px rgba(255, 255, 255, 0.091),
    68px 41px 0 -104px rgba(255, 255, 255, 0.829),
    -108px -85px 0 -104px rgba(255, 255, 255, 0.894),
    -112px 100px 0 -104px rgba(255, 255, 255, 0.187),
    145px -57px 0 -104px rgba(255, 255, 255, 0.278),
    -17px 139px 0 -104px rgba(255, 255, 255, 0.74),
    -127px 54px 0 -104px rgba(255, 255, 255, 0.141),
    -144px -12px 0 -104px rgba(255, 255, 255, 0.157),
    -119px -138px 0 -104px rgba(255, 255, 255, 0.151),
    23px 13px 0 -104px rgba(255, 255, 255, 0.548),
    -100px -89px 0 -104px rgba(255, 255, 255, 0.039),
    10px -51px 0 -104px rgba(255, 255, 255, 0.204),
    78px 142px 0 -104px rgba(255, 255, 255, 0.821),
    -115px -77px 0 -104px rgba(255, 255, 255, 0.839),
    -99px 98px 0 -104px rgba(255, 255, 255, 0.475),
    -56px 140px 0 -104px rgba(255, 255, 255, 0.831),
    134px -105px 0 -104px rgba(255, 255, 255, 0.613),
    -138px -14px 0 -104px rgba(255, 255, 255, 0.898),
    29px -109px 0 -104px rgba(255, 255, 255, 0.616),
    -79px -39px 0 -104px rgba(255, 255, 255, 0.424),
    -57px -15px 0 -104px rgba(255, 255, 255, 0.506),
    56px -56px 0 -104px rgba(255, 255, 255, 0.89),
    114px -124px 0 -104px rgba(255, 255, 255, 0.44),
    -15px -82px 0 -104px rgba(255, 255, 255, 0.393),
    131px 74px 0 -104px rgba(255, 255, 255, 0.001),
    -20px -41px 0 -104px rgba(255, 255, 255, 0.467),
    -64px -106px 0 -104px rgba(255, 255, 255, 0.96),
    3px 102px 0 -104px rgba(255, 255, 255, 0.861),
    -65px 145px 0 -104px rgba(255, 255, 255, 0.195),
    -44px -72px 0 -104px rgba(255, 255, 255, 0.225),
    -57px 84px 0 -104px rgba(255, 255, 255, 0.1),
    101px 40px 0 -104px rgba(255, 255, 255, 0.23),
    19px 144px 0 -104px rgba(255, 255, 255, 0.983),
    -101px 21px 0 -104px rgba(255, 255, 255, 0.91),
    50px -91px 0 -104px rgba(255, 255, 255, 0.948),
    -70px 21px 0 -104px rgba(255, 255, 255, 0.367),
    -45px -116px 0 -104px rgba(255, 255, 255, 0.229),
    120px 2px 0 -104px rgba(255, 255, 255, 0.143),
    40px -32px 0 -104px rgba(255, 255, 255, 0.053),
    -38px -103px 0 -104px rgba(255, 255, 255, 0.348),
    -64px -45px 0 -104px rgba(255, 255, 255, 0.157),
    144px 41px 0 -104px rgba(255, 255, 255, 0.486),
    -3px 32px 0 -104px rgba(255, 255, 255, 0.386),
    -11px -60px 0 -104px rgba(255, 255, 255, 0.816),
    52px 122px 0 -104px rgba(255, 255, 255, 0.354),
    66px -93px 0 -104px rgba(255, 255, 255, 0.982),
    -30px 67px 0 -104px rgba(255, 255, 255, 0.865),
    105px 66px 0 -104px rgba(255, 255, 255, 0.389),
    -31px 26px 0 -104px rgba(255, 255, 255, 0.982),
    -3px -54px 0 -104px rgba(255, 255, 255, 0.715),
    -29px -111px 0 -104px rgba(255, 255, 255, 0.548),
    145px 46px 0 -104px rgba(255, 255, 255, 0.65),
    115px -94px 0 -104px rgba(255, 255, 255, 0.39),
    -94px 74px 0 -104px rgba(255, 255, 255, 0.621),
    -37px -17px 0 -104px rgba(255, 255, 255, 0.415),
    -55px 46px 0 -104px rgba(255, 255, 255, 0.146),
    -92px -40px 0 -104px rgba(255, 255, 255, 0.647),
    14px -29px 0 -104px rgba(255, 255, 255, 0.572),
    -121px -92px 0 -104px rgba(255, 255, 255, 0.185),
    -75px -51px 0 -104px rgba(255, 255, 255, 0.692),
    62px 1px 0 -104px rgba(255, 255, 255, 0.526),
    -94px 121px 0 -104px rgba(255, 255, 255, 0.535),
    120px 79px 0 -104px rgba(255, 255, 255, 0.263);
}
.pluto {
  height: 780px;
  width: 780px;
  margin-top: -450px;
  margin-left: -320px;
  animation: orb 7439.7074054575s linear infinite;
}
.pluto:before {
  height: 3px;
  width: 3px;
  background: #fff;
  margin-top: -1.5px;
  margin-left: -1.5px;
}
.hide {
  display: none;
}

.links {
  margin-top: 5px !important;
  font-size: 1em !important;
}

@keyframes orb {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(-360deg);
  }
}
</style>
