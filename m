Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 828F9E7718B
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 14:14:49 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.127])
 by mx.groups.io with SMTP id smtpd.web10.8820.1735827275194191679
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Jan 2025 06:14:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=LWgGN7rh;
 spf=pass (domain: navimatix.de, ip: 40.107.249.127, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyIgUrz5OjO/yWoXelSD08bFHPgw6/jr8tJtRpfgwPh7LpUZgKDfuMlNSDBWlmnAFjE62EhHhOSHoQIM4M/KJ/yLzOUkt7eaJKJoRdcQA3XXzguU0wDZUhnNWxBk3OspGC4KQCLLC6gImHenWyuwD3IIR+hExxDTLVl56u9pquPf9z9loW+04G7uv0S+1rXv5DE2QCilWIw8Gf3RFugQpIoIUtFdvyZMIT61Rmb4BFbquq/sd6sqHKC/0tzT076910FscjfoB2JUrsAoZari8EKShfP2FrH8ruDpZKxmTy58KqOx1k4+vTQNvQ9T72c2ieIxgGxExuwDdhM4q7Zz+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tde/p4vNAQGKrB6TsGUrHCgFMfSSyuV/BrqBgAVj3TI=;
 b=urFMhpvxEVSmU4Mym95z+PtzRw6+qzVZlHMb0SUQ1NcGW77pTAQjcQRfLyL0l9sBVCWK5oOG/f/NnPfmUjXbJyRSKqJRDcijp7O3j+HksucLMCyc09ZT/4WOksWKH/PG02VkSDiX7/OWsjRw8QctHMDHmWCQ0HJJ3BAcQy4AzkSpRIpR9jIQPC69FjIQD3xSPVsj12tEJJ/mEq69DNcle+DNB+4q3Sqtx3MXGRMPQYdhc8ppTY6nvmvkeSA7eP8YBmcgFkSGsY1wNysaA7d700zKxWWJue4yjuVElXrXQbTTlQO2fJ4wdCTXTXQZMOpQ6E2p1CXaJl+2Pgzi0vjhrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tde/p4vNAQGKrB6TsGUrHCgFMfSSyuV/BrqBgAVj3TI=;
 b=LWgGN7rh/jT1OSRHyaWcG/A1cwbJsdQLeEkzeh9/xv+viNG7MC7yAAmGS9ih69j0DReixs79xTxlueML/MwAkiD8f6NrUEiOyJRODq0ThJIcv0GBC0re1ofI4oMtl2UtRyvBlYXypQoaoHmCCgLPHQ9r88WldY0WPJGeD28+mUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DB9PR01MB8192.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2c5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Thu, 2 Jan
 2025 14:14:27 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.8314.013; Thu, 2 Jan 2025
 14:14:27 +0000
Date: Thu, 2 Jan 2025 15:14:23 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: docs@lists.yoctoproject.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 1/2] bitbake/doc/logging: small clean-up and name environment
Message-ID: <9423e2349e9c4f8e5b3a9490e4539156db533e02.1735826398.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0222.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::15) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DB9PR01MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: acd1658e-509f-45c3-bad6-08dd2b37c405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?a88gt+XSVgXqAlGn87iz9MlkOSfnzchNchzD2r7dYuU6XJmjiSdPTjxE8Ivt?=
 =?us-ascii?Q?Jug6GBIJko6+FYpiE5F3UqS2p5tr/K+YRtj9iUkdRxSVzNjmy6BU8Szy6Q+A?=
 =?us-ascii?Q?qDR/LO5k/kNNDORdkxALRA6o4w1rsW6trvmpvPiF9/ts8z5E6gtskrflrkV+?=
 =?us-ascii?Q?TFow9kr79P65GtzqsUA65kuLLU58hCc8aGw3nEp6IY6wKvjcyMH4KJmStkib?=
 =?us-ascii?Q?wKTsW1K9UZHn419oluFf7dGU1M8megumlzY/zkit51C2bBUCVHNOBUyHkM4b?=
 =?us-ascii?Q?B7Cd+ZIt9nl+eg5slMhP3f8jvKpC/hBmkhP3+dUmV/xUL0viqTN4CCq3kxZb?=
 =?us-ascii?Q?P88XVmV3s0bWXwDe+vkzH+YHBxaosv8APeTwsuEeTYY7Eyc1FqD/XMQaTizG?=
 =?us-ascii?Q?QV9/HEwIP5rJFsfZL8cgV7bPlq4pxrwfNb92R277qku4AD8zx2b4FZUtKkUg?=
 =?us-ascii?Q?lDSMRlqMzPO74NjITWymWKrqSpzGpYGgXTTawkjVo0H3SQ+b/VGHNHSaLvni?=
 =?us-ascii?Q?zY5OyVCmqbAubbb5+afTL1BifP1Ip3htMjO2dFyZs0uc4QVYZBF4I2yFIpL7?=
 =?us-ascii?Q?CBWe1jBjw8tQwGvL9OhdZrX0ABq/gYsabyi/2yTu1TcdxP1d90xj/VTBnPWq?=
 =?us-ascii?Q?azPv5rnMm/DSevpTcI9m2mbkMq5zVs1/p9O1X1xNcJusCVWkLOGHZh8coFio?=
 =?us-ascii?Q?Z80iQMrw6dmxNBmhXlGSuktYiwgC5QxEX6EFT5UzqM1YjCskv6mZj3gVuNVx?=
 =?us-ascii?Q?RC02b9QLvYUu+LLWhhp2NGmxMINGcufV4FqrvYCoPw3R5EGy9pBO2+T5eso4?=
 =?us-ascii?Q?3RVFJ1UoSn6bV29TkQCQS7fpaX5UdU/BZ7j9nm9YP+1b5xg5X19Fu0SKKKhg?=
 =?us-ascii?Q?YH07R0nc7RWAJ58O6g3x5DNEqeVwCeahqzOzuPB1UM3HjF8xR/bVMmyHMZk/?=
 =?us-ascii?Q?H0L38Kfk4wX5Fm5IcPRFviskq8mGJNx4pA6rzR0cocMEJBQeI5P+EhGJ0qoj?=
 =?us-ascii?Q?OX5JNCvvVY7Pg/LlhZoo16UP2daOfOCmN7zrjoBfJZKPAslkRrRHuMOEWOCI?=
 =?us-ascii?Q?dbJZ9Xot+iL1RK54NJ77wzyvcz2QdK7oNfSXyKMDgUVHZ1ED6MXHZFBpSZ3n?=
 =?us-ascii?Q?M7CsySVUMcNoURwYnXXX7jZGpdnsKUyqXuuj5ypQNUHmfuZ6aOqG0PhMDBJG?=
 =?us-ascii?Q?ddei0Ig8HKk6rYEdhbWyvIYPFRdFa6p3rdxLOMhAdK7Psn5yMMh0sb/tF539?=
 =?us-ascii?Q?FjHrEz970HykfpJpetY8aJsn0lXPF98WOUF4VHGOLSfjlu5Kt0ViBPBtjRN8?=
 =?us-ascii?Q?w6g3mPvJrQ5d9JNCjPXEGB9OTUC/YV2gJXUIpQkVNUs/8HdH8/1uy9CAbdSU?=
 =?us-ascii?Q?ESdEzst5Mxf6+YcBV6PfgW86P5XZ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n+3IvNIV9sWQHX8jg01IPh+aoXCt+oW1iMSkrsHhzs/QLuXJRsOlh2Ra0OVq?=
 =?us-ascii?Q?cDzaZm5WeKiKWMiziH4GLOPa4EmfqtjxURuc0PBvnSVtz84f8gRKLcsNOdeA?=
 =?us-ascii?Q?6T52y/dxeITNDGwtHcljr9xFTY8i4fS5eisht1xhnOr7CMsOEr08vP/fUuU2?=
 =?us-ascii?Q?/vS0dlHkol3d11uAsZmj6W9LI38IUf5UvCbhczQntcgYrmhW1R5qwgR0ZE4q?=
 =?us-ascii?Q?GueaA3M6Q1vufbje7jBgKwRcGEZ/ehuYwpuV5BApQ+ihJkRH8n+E8Uv/GDDR?=
 =?us-ascii?Q?IGEm6AZTCMAmGSL0DvRdTwB7T8Rv5tBuKnowgFaVB1LPhQnrYlpVHQWVPeZi?=
 =?us-ascii?Q?Y7TEuHpXTpPmZFZZqJKioSE1IMVbp3zS+Yxg8s4VKaXan4hDBCUQNmaXLz1G?=
 =?us-ascii?Q?Kb5VUNXp7+kKtbZsnoJcisG6Gh9X/G0glak2l9fKRgh8tCtWx8heFZkk9Vj1?=
 =?us-ascii?Q?cS8907zj8PL+o9ryanf7+KOnm5D75iDmdmvIB8l3y4d5XpYsaGjku6U3x5VF?=
 =?us-ascii?Q?D8b0TLKHd2AS0u5ZAsBRztmO+Lf2Zawc68Kc10BWOv1C00yNjmBQ5MIoe8Cf?=
 =?us-ascii?Q?Wo/x0Vy2D8YygIB4YDmrfW1ItuN0Uk+iRINddlUH7PiKHa0rCjbHPPsYMkSh?=
 =?us-ascii?Q?F7tSvp1mAp/dpykHeo0/oDaQrgYTlljWxbaxyMV3gq5XphnQvZ4r/r9cfSW2?=
 =?us-ascii?Q?4fLxYo00kjxqGSYKA+WhOhFeHZmy0wCeDI2hOFJzi65HgMElpKFxBXWsfTk6?=
 =?us-ascii?Q?+6vkeXum+yjfOBlyK1dln95h9nNccPHnldJ32Vlw2dV38AZcuzoNUn73sthx?=
 =?us-ascii?Q?E/KlO02CuvJLZpwqgm9FJ36X2vimNvT8wnjgDm4qlQ9M9+2hdWP/6C48HHfi?=
 =?us-ascii?Q?XK2pt5MHVVAeNyb0+H2vkO9fjjO2GLzOa0SXzcFcsYbqcdYhwUdskNIgRb6N?=
 =?us-ascii?Q?sgrOhJBaBCpp0U1kaZiBV+TJPjozVIw+9P5n4JgUTJTOgP14cTipkJpNS+yO?=
 =?us-ascii?Q?LtgRBWHJYuWkkz17LJLaO92EFNqXTwrgFUW1jEAqvi5cHXM3dyzt6XuPtvOd?=
 =?us-ascii?Q?rY88KJqCB5MPofJ61QdkbZ7HNHcMY3nlDiriu5jTcEuzRBBlivlh4wBxrCGn?=
 =?us-ascii?Q?J/7ECzeZoevYT5DM9sb2zVzH24mhSRUvvprvU1Gi3vriMzGEMC+BXissRD35?=
 =?us-ascii?Q?+ohVlnON5q6wCq9DDrKggFHYWyz34MXL0EBs8+kaEVM7tWRwIo7RaBgKyuIz?=
 =?us-ascii?Q?jOjLYoHX7kPWClY/CpnLRsqoodIyr+Dkqwfo2zV8sBHBwLCGmR864n12t2nh?=
 =?us-ascii?Q?BEiy+PzqpRx8pACGtGrWphR2G5uZ0peJlo0Q2ZwuhRI7/q1BnxfYnWegjOlx?=
 =?us-ascii?Q?jJnoHjQLYTOpIUwIiArF68PXAKAX0tk3vKtQqPh+Zyaet/ZDB0GqaJq65zlg?=
 =?us-ascii?Q?oX15PfsPAh6h/Aafk064loGWoOXk1n3xfelIuFQgEgaevvfenCgsH7lojbLd?=
 =?us-ascii?Q?NB/zGdguwM3rB/blk+cbebSabuBvcaQONebRay+BAkHzl81rn1ISBo7DBpWP?=
 =?us-ascii?Q?lK3gVEYTrhVR9LVsdxzdD2BHdbcfy61oi5NtViDO/Q6Wx8Q+m2Immey/PyCu?=
 =?us-ascii?Q?+Q=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: acd1658e-509f-45c3-bad6-08dd2b37c405
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 14:14:27.0012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2spssEm9ujZPy6iY5daCGN53KIcjVup1EXVrSalOjsv83vhstOpORroVNfyif56gSOUnWr3iu6LgHziM/3ctMpFe1RAdJH/UfiB6xPkMM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB8192
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Jan 2025 14:14:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6054

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

The variable *BB_LOGCONFIG* is part of *BB_ENV_PASSTHROUGH_ADDITIONS* in
/scripts/oe-buildenv-internal and can therefore be passed as environment
variable.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../bitbake-user-manual-execution.rst                 | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-execution.=
rst b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-execution.rst
index d58fbb32ea..a1267400ab 100644
--- a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-execution.rst
+++ b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-execution.rst
@@ -671,7 +671,7 @@ logging configuration is merged using the following rul=
es:
=20
 -  Any keys defined in the ``handlers``, ``formatters``, or ``filters``,
    will be merged into the same section in the default configuration,
-   with the user specified keys taking replacing a default one if there
+   with the user specified keys replacing a default one if there
    is a conflict. In practice, this means that if both the default
    configuration and user configuration specify a handler named
    ``myhandler``, the user defined one will replace the default. To
@@ -707,9 +707,9 @@ or higher priority to a file called ``hashequiv.log``::
            }
        },
        "formatters": {
-               "logfileFormatter": {
-                   "format": "%(name)s: %(levelname)s: %(message)s"
-               }
+           "logfileFormatter": {
+               "format": "%(name)s: %(levelname)s: %(message)s"
+           }
        },
        "loggers": {
            "BitBake.SigGen.HashEquiv": {
@@ -723,7 +723,8 @@ or higher priority to a file called ``hashequiv.log``::
        }
    }
=20
-Then set the :term:`BB_LOGCONFIG` variable in ``conf/local.conf``::
+Then set the :term:`BB_LOGCONFIG` variable in the process environment when
+calling bitbake, or set it in ``conf/local.conf``::
=20
    BB_LOGCONFIG =3D "hashequiv.json"
=20
--=20
2.45.2


