Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC06C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 11:38:40 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.49])
 by mx.groups.io with SMTP id smtpd.web10.14647.1704800315406241722
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jan 2024 03:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=n37nz9Gz;
 spf=pass (domain: navimatix.de, ip: 40.107.15.49, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4h7+2+cRU0wWHj6Del4rvgDrBnBT+o9TTOJKZNvGAQaUKd+64iUnAgqe3EZdlaz5WzAcOY0uu4BcpLLDpDqTmlkukVKYvLJJNnzDQmlDE/Hi2bH6uu+gTs7SlTW7Mw4RO9tLmyMUVKp2XqDK25mr+UdEoI66oxIbi42yPVdYNKdfYQ9x+yrhm2+5CYu7x4vHmJBKv3d8rARLSyiNkKZpkf+cH4b121E3pQUV/sd4N/zMd66ue99gJZ2ljE2sEUoixo9zsguYvylhUw4D0Joi+SWpSaxj4L4T3Cdrn8TdIrFqlyHHg88oAx5tPM+ZYidHptGh/luGz6+VTMoayfCww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyf4VhQo0LryvS5pZGi7c9930IzEJnMwAnES/wsp14c=;
 b=UcpUJWV4sDZyVnqJCNb5iGbETHH/DFuXCWlBUIFnaArZoJHyO5W54KqHub99Zys7dSwsWbxXnNXeDyXmOiS/KyA5zFHGEwon8waiis7h1gXv70UQLqZSYuVguc6bS1JZqfkWCLoHknjXxAwNGxM9AX1GRJZ1jPbX920WoVQodDkSBSFoRI+TPlWQuRWNvcIXdKpXf3nx8dNcIYK8ew7bcl2386enmyN8+OfAzpK4KX+x6lNjGGT9l33cCEm+m9nL7/NjionQEcXaXO2l2kNH01RUfdb1fBWT8qp6H8U3Sra26h5Gt/dP7dd88DGK785y1bL60UbYgywZ9iuat46A9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyf4VhQo0LryvS5pZGi7c9930IzEJnMwAnES/wsp14c=;
 b=n37nz9Gz88UEcKSvqDWnt6EwKn4gU/afn+8MtyXjAEjTaqA0p8oCkvuwu4p9IMOEw7VSaoHewiJpH8WkDy+Fy2ZuKmEgCOzApM9UhROpMOaLmTIQJ2/hc3AQJB3G6eOBYxomVbHSdImu+DiJH9SIw4YzcVcLEdehBbY0/55ysHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22) by DBBPR01MB7642.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1e0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 11:38:32 +0000
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f]) by DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f%5]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 11:38:32 +0000
From: joerg.sommer@navimatix.de
To: docs@lists.yoctoproject.org,
	michael.opdenacker@bootlin.com
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH] documentation: Add UBOOT_BINARY, extend UBOOT_CONFIG
Date: Tue,  9 Jan 2024 12:35:37 +0100
Message-ID: <05650416067ed51a60dabc7226a9e200918ff8ae.1704800137.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0381.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::23) To DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8592:EE_|DBBPR01MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ed4073-f8c4-4973-a45b-08dc110781e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MdiWAz0WAf5yyhYCT0J7fXDpasb7yeGobyWquFUv2hAhZH1kRra03fzYzOGbmcc4dAznUYRoWwVohtEbtOFxv5B1MSORFsmYlYs9+DsXapqPaLyEjj0yRSKvuAQNoKEBur8hU3FEIpYJVpiT0keLrBuwYwkiCepmazB52TQx2S7MkRAJ1RIhEkSCzwVv4Awwwb/noyFTeODc09UUQOYO6IGHHg9wY6q08XUpZtvb1FgnfvxulxEpB6LUbIrCabKw5+amZ2x6xx8E5GTgtH2ay8ZCeYBhxkPAVqGluXZaB5gj6hck8ReiS+LOv3tp9LjWl3SZiKJ4ph1o7r6KC6OQXfTRMNEcf6+XwX8G++98r0Gh3cvi4K8QAidReBnW5HepQ8tMpjlO1L1rf7V3Ri54nYjjTrXZ6IAfhxlyvcbqeMQs/X0akIG/gd+4j8DwqysN13oQFyx35fxfQRiJ/skBFGKpikcET+8/gnm1keRAokG96DsdSZaQL06UQymio/Av6LOkKTsUZk9ynjd0rKAGBQ5AiaKy/8sFNNhOazlG/s+q1/WQbcOmfUXUMA+vKG7GdsJrX+Gik6vPrrK4OM8mN+kiUrWvG0HKCptz8Fgz+st58LjDL0ZghGT0tn54oCE1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8592.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39840400004)(376002)(136003)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(26005)(83380400001)(9686003)(6512007)(6506007)(52116002)(2616005)(107886003)(5660300002)(4326008)(41300700001)(2906002)(6486002)(478600001)(66476007)(316002)(8676002)(66556008)(8936002)(66946007)(36756003)(86362001)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aI2xGV/V/pNHO/0IylDFqSjRNvmq6kBemynaRv5pDQbNQdp/O8soyfTKRwY7?=
 =?us-ascii?Q?JnwjGpJuJsnFdOX+cGFSCUIWUuLpBtHm6fhGRzQDcv5CnOXe1Bsb+4o0GX6T?=
 =?us-ascii?Q?dVppWkeDvhoG9nNV+KZ5diqq3QLHErEmBaeWNjB2YP1JxVOH1dErsf7479Oc?=
 =?us-ascii?Q?vxuNBWnsmMka8zCljQEF62KByF30NXcn/w6pog5+x8nWzY67jjm6rMve6wL+?=
 =?us-ascii?Q?mX0tvAp0Z6GQvQQuP4/SrxioqZSmRximd/woWUFAkZ9lx/B/zWosj2Su5NV+?=
 =?us-ascii?Q?TKcUT8AlrhX0FXskdtuMDaqHmVMO8y+iMCJijPA/0Hg8MI3JlXE0ENicrxQS?=
 =?us-ascii?Q?IAmFhh81+E5leeQScsQG1+ufhsL0iSXdqGxuZfclxP8GaKlouJUdydbvkOBO?=
 =?us-ascii?Q?DS22QooiVb9chiBwFCOZ72ORbIcJT1gjPK+gLzNm3vMqvdNcIBZp7d3EufGA?=
 =?us-ascii?Q?B99N2kX8PZdae0hOEyxZLgj64NwVEcFFGNyPG6U/STEWPNPx4ooH4eESBPLz?=
 =?us-ascii?Q?YQspGTopcLZcGRwnNwq5UmmGPfCO7jAsghcN6fNSyeJuCv2/bTzV5kOOOzS6?=
 =?us-ascii?Q?ZGmdL5Jb5i5s65Ey6csvWyAwdwyUmgXrEcWMY6KwVkZ5KSs6HkGvFSOUQr9h?=
 =?us-ascii?Q?pkjdTgmBXQaRLqQ0Hx3xEV3ESgyzNS3Nq8giHNYKCNsN9cmdrLvo5h42fzsq?=
 =?us-ascii?Q?CdD1/BXwVHtGVK8NEWx94tFyxg7Dc6Q/bFKr5WizYPyymvDTnrRTsdb2LJH7?=
 =?us-ascii?Q?dlmUS0hG2aJRStozsgeGK3z/7v0GePwpuhwjUGK/AXJRAaS9b/T+BESwbF0f?=
 =?us-ascii?Q?Um7pH0mT0C/MZ9erJjRMIfSyPZkwAzjOfJgUQaI1XKwufLYZJFJI1S0GSt83?=
 =?us-ascii?Q?qeClI2l9X/yqONezsoKkoy8FKs/kmTRGKSpgp4KaGCN8avNd26d+dDJx2VTk?=
 =?us-ascii?Q?a2KIdm57R07fHT1OhymIEXWeol8AJbtAu1OrVgCMDQquHTZeguNM1O4H8vM8?=
 =?us-ascii?Q?Fep3F1Y5T6MtX9s4B4O3pXC6Fu2VpVICIqBDI+vPYKTocSA6Nufa68zZgEHK?=
 =?us-ascii?Q?RT1UAHXaa3Dtu/MAmA+lpuyLPaKco3u/WhJRHAoW2h6EoeYB6zLmG5XrFaq2?=
 =?us-ascii?Q?WzCuTrB89CR9kDxj6dw4tB36i8z4hDTZOICyt5o7kV+20Mi5OYltinyFNIh4?=
 =?us-ascii?Q?QUqaRjxaaf0O3RYOlUCpT3khLW0YHo3D0XKEfcTSP2WsJjlKOSgMYeG0112N?=
 =?us-ascii?Q?n83GDgkt/NdO0xxbYaH19QOdAaMmbBH6WGXbm0AAKisaROS3g/HRWBlC779A?=
 =?us-ascii?Q?wbtlgowaZSOoD36B5BRqQ/NvqSAKYKbbTiXmD6sHvf9xmM0PGdgup5V+rtPr?=
 =?us-ascii?Q?1g0YHdyj3makA7zoCRUaLP2bnUdHLjXeQEb6Ht8lSCpxKJyGi7ZpIiCSR95F?=
 =?us-ascii?Q?N97ASs5bpLtalmZ4zb2BxW0EE93L1onHtzdkm0algbMyuJQVWy7S37DDhy/F?=
 =?us-ascii?Q?vUzUH2WUT82jIaWb6oGP1wZQpYdtWHNkzWFMHOJDUUvJVy63xbdWm5TIBE8C?=
 =?us-ascii?Q?mn3jo9tjBaNTBN3ROGVtO4zVTtIamY1Ccev/xZYrO7FRZY5/+l7hkEC8SWru?=
 =?us-ascii?Q?VA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ed4073-f8c4-4973-a45b-08dc110781e1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8592.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 11:38:32.2032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdvfqtQuziHhp1xfPTXu7MF9tILcJZ4RuAOOAHUDDGM+2+rDV+CdJ36gW3gApeUKCNjV/Xfp3SwCgZ0ZUhH4wLcYrPH/M60cP0ks317bkXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR01MB7642
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jan 2024 11:38:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4754

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

UBOOT_CONFIG accepts a third parameter for the UBOOT_BINARY that isn't
documented. To show its usage another example from the meta-freescale layer
was picked.

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 documentation/ref-manual/classes.rst   |  2 +-
 documentation/ref-manual/variables.rst | 33 ++++++++++++++++----------
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manua=
l/classes.rst
index a8afe9f2dc..7b68ae1090 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3210,7 +3210,7 @@ The :ref:`ref-classes-uboot-config` class provides su=
pport for U-Boot configurat
 a machine. Specify the machine in your recipe as follows::
=20
    UBOOT_CONFIG ??=3D <default>
-   UBOOT_CONFIG[foo] =3D "config,images"
+   UBOOT_CONFIG[foo] =3D "config,images,binary"
=20
 You can also specify the machine using this method::
=20
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index b394d31099..6f7d6ff01e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9383,23 +9383,30 @@ system and gives an overview of their function and =
contents.
       See the machine include files in the :term:`Source Directory`
       for these features.
=20
+   :term:`UBOOT_BINARY`
+      Specifies the name of the binary build by U-Boot.
+
    :term:`UBOOT_CONFIG`
-      Configures the :term:`UBOOT_MACHINE` and can
-      also define :term:`IMAGE_FSTYPES` for individual
-      cases.
+      Configures one or more U-Boot configurations to build. Each
+      configuration can define the :term:`UBOOT_MACHINE` and optionally th=
e
+      :term:`IMAGE_FSTYPES` and the :term:`UBOOT_BINARY`.
=20
-      Following is an example from the ``meta-fsl-arm`` layer. ::
+      Following is an example from the ``meta-freescale`` layer. ::
=20
-         UBOOT_CONFIG ??=3D "sd"
-         UBOOT_CONFIG[sd] =3D "mx6qsabreauto_config,sdcard"
-         UBOOT_CONFIG[eimnor] =3D "mx6qsabreauto_eimnor_config"
-         UBOOT_CONFIG[nand] =3D "mx6qsabreauto_nand_config,ubifs"
-         UBOOT_CONFIG[spinor] =3D "mx6qsabreauto_spinor_config"
+         UBOOT_CONFIG ??=3D "sdcard-ifc-secure-boot sdcard-ifc sdcard-qspi=
 lpuart qspi secure-boot nor"
+         UBOOT_CONFIG[nor] =3D "ls1021atwr_nor_defconfig"
+         UBOOT_CONFIG[sdcard-ifc] =3D "ls1021atwr_sdcard_ifc_defconfig,,u-=
boot-with-spl-pbl.bin"
+         UBOOT_CONFIG[sdcard-qspi] =3D "ls1021atwr_sdcard_qspi_defconfig,,=
u-boot-with-spl-pbl.bin"
+         UBOOT_CONFIG[lpuart] =3D "ls1021atwr_nor_lpuart_defconfig"
+         UBOOT_CONFIG[qspi] =3D "ls1021atwr_qspi_defconfig"
+         UBOOT_CONFIG[secure-boot] =3D "ls1021atwr_nor_SECURE_BOOT_defconf=
ig"
+         UBOOT_CONFIG[sdcard-ifc-secure-boot] =3D "ls1021atwr_sdcard_ifc_S=
ECURE_BOOT_defconfig,,u-boot-with-spl-pbl.bin"
=20
-      In this example, "sd" is selected as the configuration of the possib=
le four for the
-      :term:`UBOOT_MACHINE`. The "sd" configuration defines
-      "mx6qsabreauto_config" as the value for :term:`UBOOT_MACHINE`, while=
 the
-      "sdcard" specifies the :term:`IMAGE_FSTYPES` to use for the U-Boot i=
mage.
+      In this example, all possible seven configurations are selected. Eac=
h
+      configuration specifies "..._defconfig" as :term:`UBOOT_MACHINE`, an=
d
+      the "sd..." configurations define an individual name for
+      :term:`UBOOT_BINARY`. No configuration defines a second parameter fo=
r
+      :term:`IMAGE_FSTYPES` to use for the U-Boot image.
=20
       For more information on how the :term:`UBOOT_CONFIG` is handled, see=
 the
       :ref:`ref-classes-uboot-config` class.
--=20
2.34.1


