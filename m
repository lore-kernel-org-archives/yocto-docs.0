Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BA4C46CD4
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 10:30:15 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.69])
 by mx.groups.io with SMTP id smtpd.web11.143684.1703845810251504673
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Dec 2023 02:30:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=4Q2l7tys;
 spf=pass (domain: navimatix.de, ip: 40.107.6.69, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1rkEVtHbeir+FpWYmk8pvNXkUCfpXrhTD2GWXBtzGjNHrM+mtzNu5G4njo+pQXpJiA4juPTgAUMYi9dsb3zsO14AjByc/LzgehOP8BzTxOoraJriVkYm6mBEuOfHRtRYCZid8QwnYi1LR2XayEcoRcxTVH7R63JMknDfnQg90f+tGbC26VbSv2eioN9cTp9mFqzrmA/Unr4xS5UDfSqpOBWIYnZhNfNRRa/O+dnBiE9SoOic9Xfovo2w8pkPuoV8m7vbx38gAHr6+P0KEpwr6KFR3ewrWCWDbkV/vFVaz3xx4jidJvTIF9KoJ2cAxJzK79LER5L7kD9FDQbZnWKmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPUvWFmzKq0krYdgaAJjCYEspva6c5SeH004POSqz60=;
 b=kkTJ3D7nzEg3lV0/2G53lPJtzP42LnGrsTjtP/dHgdsKLVMR5/RSPTjEeQdhpO5h5tZcvakkAfpKx8JSyA+wR5/MSWgxtW8t5mW9TdGf8AethCGRnVey2hajXDZOu85W5spBxdxoQ6itL3Tgk/HkRhaZIfNbKiBzw31m/QSbjQ56+HTmoQbGhtzlxiVmrpv2kMur0kVEi5AIryqHm5NjVIOTN3sKcQn9wLQ/vkktgJYha8aTJO/lgotwA8nKlQyiVlO/US/4SZM+o+4cqi28dc8c2/RnxOx5XcaiUBv1rSN2vzIAXF6CMhFhi7GLj2puVGpfhO1Jkkow2INVfNNvCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPUvWFmzKq0krYdgaAJjCYEspva6c5SeH004POSqz60=;
 b=4Q2l7tysSmXGmYAi/uPccbKtKt6iL0zlzqLSYDVhTfMJf76vKszWqrx5zJ+IcYgsMheVM/2Am/lpt2q63fDZX/8tv6kzDZgfL5mVdE4mis4Gd/B7AU8fCCQpyjqnx2zgzl0BeXdIwdohMdVrpMZAPS5AhPN6nttduRi9ceKFmcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22) by PAXPR01MB8504.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:22a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.21; Fri, 29 Dec
 2023 10:30:06 +0000
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f]) by DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f%4]) with mapi id 15.20.7135.019; Fri, 29 Dec 2023
 10:30:06 +0000
From: joerg.sommer@navimatix.de
To: docs@lists.yoctoproject.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH] documentation: Add UBOOT_BINARY, extend UBOOT_CONFIG
Date: Fri, 29 Dec 2023 11:29:17 +0100
Message-ID: <41ed326b9aa4b74ee618378d54a2494f7d035a3f.1703845757.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0226.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::17) To DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8592:EE_|PAXPR01MB8504:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a0e84e7-812e-4e46-ecf2-08dc08591fe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M1Ov+yRHs+GL4/RsX7r8gFpArTub636Qh8MpQ/SIY5YB4Pt4R0NnxjVoLM3MQuH9Sj6V93av1ollhLmmes3z+/tfqCpArSBPcHm9jcd6DXtimOX3TgXehswBCs1kgVQHaNUXPOj07M+4crVtvpua5tyHOW3zsNbi3K73m+v3JBOu+xPVGe4z18E92/Bp4C1ZAJ3RJ/75fR1ujZ8Gie0bzhQ30SLl7bZCxT+oCdzS1871wS6yrDshXYyAacfoKa3IpGNcfnUoEevvxBaj20+M1v+fwSrprDzH+zRKCPcQMKrdmprt54nlY8ab7ME5NwIOqPgZbeQGdQxSxF5uxo60Do5vomPIyoXJ+qy8rCVzEoPL1Jy3zrDOrV9aJlaooveTyj2XlHevsu2CzNMhEr+/UGZNpq1YOEYU3aYOIMqk7ajhvbqhf550k8/DfUsiJWViX5JG+pKefL5I1QvQrE9hcfamfP2hPHNwNO7uVlk5GEnY95kDiTgIJFJ3BG/uDxIYicJcGiw1O2SbnM+t3Ijtg9FCGEShGHS2553wQZZAVSjJVdTBqaYS2zykTJ97k74hWpv7RSCiF07Zctf7LJ1oyUpW6a+DoFdpPIxhAe2KgXCsKpfsc374VuG9qLupx11q
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8592.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39830400003)(136003)(346002)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(66946007)(6486002)(66556008)(66476007)(4326008)(316002)(6916009)(8936002)(8676002)(107886003)(26005)(2616005)(83380400001)(478600001)(6666004)(9686003)(52116002)(6512007)(6506007)(5660300002)(2906002)(41300700001)(38350700005)(36756003)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rPJhg7EHtEAZy54p6vZwT5pTG3GyJ9YifDPPJw/Bfp5Fo/2tKH4Uhv1eUrDq?=
 =?us-ascii?Q?DTe1sOwU43v1OM5GtXs4w5PIKlhT5Rt5L3uv+Sca7svPcL7hPqx4dYgfrZYS?=
 =?us-ascii?Q?VTzGC7rudm96hsVrYaVOv8AsFMqgiXukNg0qEOA0/4/DivKb2lG64uBLXWmm?=
 =?us-ascii?Q?a0DZftAiiK3cE2YCddPISw8wACELILvV5bgacIH0zgmOTGBHeoisde41Wqkk?=
 =?us-ascii?Q?OWi6x8Vq2C2isjpt6Dmfte+Ip84RI73mmyBXesNuCzXnJ5cWCXbKWX2TjWyM?=
 =?us-ascii?Q?PpKEi5A2XmWTxd4LfNAY6MCmJuh62wjSE2662GpU+C+5iY9v68aKySAXi3K8?=
 =?us-ascii?Q?zra11hdoqc/m+uBfCOqSXSYbGGYTil0Q8+l8rx2NrdmC695geQEsP4hn6WtO?=
 =?us-ascii?Q?xTtrtBTGQwBF3NMHiznPs0Sx4J3PBv6kmPZ3Fts0y7WpbDoLPB5evUpbwyyE?=
 =?us-ascii?Q?dEJu0ussQY08caTYpTLOSW8zk+5cJWGuyD+I/GQKzv8M0K2foflaaR3btZvY?=
 =?us-ascii?Q?knv1EDNC1Cz5fFC8mqMYw0c4npOXoJKr6i0PPf7B2kd5JyUPBoUC3iochUqu?=
 =?us-ascii?Q?3xBHnZ0oxseJ4LIggboAaSTPUafoXqPmaomoTlxN5zHSVwt9gvMntGlcqzWt?=
 =?us-ascii?Q?0ljk6oH2BdKIR944r8Jripg5WVOPwBvgzb/t3lnUSbln4mTCa9F6+3EM8pcV?=
 =?us-ascii?Q?ro3ZpMpkvktKusCgqxqtJ0YqbXw+ssfgoHsd9mlqrCCXZ4BNxrR0sBJ5hnz+?=
 =?us-ascii?Q?04iOZkmSPcKPLguZCJS7lkdbMSh8+Uke/WiZOtuS09BEvXlpKqNGOTGoqGf8?=
 =?us-ascii?Q?7M20jVRKnGo3XEo0stYlDZUe2Ycoy68knSZYSdxkW5at4+4Tfv+xa3L6bTp8?=
 =?us-ascii?Q?YQapRwe+ejcGi7p510LLFvyu3U0vhy36n6kI22EoZG+HmRpPl2g15Pyx80Bh?=
 =?us-ascii?Q?arhQPAzwYKNPYlMZgBZ9eSZ7eSGfwSZqegszwFkuv8h0dlXUEUVhn4zSUYmH?=
 =?us-ascii?Q?FPo7xMp1WK1RtjLypujf6YmHvI/7OvGHu/m6WMP/dERWdIPt93JJZtWpjzpa?=
 =?us-ascii?Q?S0eZ/SVzmpwobI5+sXE/bo4/8Cjdj6I+xB/D8ZPxw5nwEHPp/E66UfmBjQgV?=
 =?us-ascii?Q?ryqnmpe18iW3k9grhCZcSPeEepJvqjU3XIDMpYX7cvPcW3qaGpKGh9urhmPv?=
 =?us-ascii?Q?eyblFt0+FbRYTXNNUFhH/9O5cCrLbWenKG8VWmcQR6gpzY1/Y3dJg/kHnKAO?=
 =?us-ascii?Q?5iFHeODTTXvj896nfkXLcz8ZcmS8NOsOVlANEPUo+iwC0erYWhHPFWxZWlFZ?=
 =?us-ascii?Q?1xnPJwTBWYX6CZB7Zja6MKrYA+AtHlqPRgcE1Ac9sT4q+oKL7H3ODsVzEynQ?=
 =?us-ascii?Q?H9e0fzKI0saZpQXD9W2C6Xqy1OaNKpQx2A8Xde/S6mUTHGWTWRvVA3QFWXfM?=
 =?us-ascii?Q?0C/JMvFgCnBcKY6hh9D7/IhbQ5KHhhWYPGMn0e0zYFmy5aA7dJVOnpDV1eWb?=
 =?us-ascii?Q?AIUg+UiRYzZI7pMeQNjOqdU6hNT9X2NeWi0frcDzuzpbd4z+CpsNdMH+9D0e?=
 =?us-ascii?Q?YRPy4BWzg2cm5pZ3ON4+yqgSMsDdFDL9UKNpsiCM0812sZ0gjbNdB+wZ5WNV?=
 =?us-ascii?Q?ng=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0e84e7-812e-4e46-ecf2-08dc08591fe8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8592.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2023 10:30:06.1077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emlYoj17usL1GN3+u7CMSnAxjV1JOy96zFimAq2GyFnkTQKJR27is9pY2fnHI4RMlHhhdlTj2wwuiiFe8681jitkbLeUa9x583wvnObkI2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB8504
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Dec 2023 10:30:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4739

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
index 6074ea0f52..471ac57ca5 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3141,7 +3141,7 @@ The :ref:`ref-classes-uboot-config` class provides su=
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
index fe0b993bd8..ae14c450dd 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8932,23 +8932,30 @@ system and gives an overview of their function and =
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
       :ref:`uboot-config <ref-classes-uboot-config>`
--=20
2.34.1


