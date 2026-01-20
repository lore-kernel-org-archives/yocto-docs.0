Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D992D26295
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 19:22:39 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14551.1768936949613510297
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 11:22:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=rFZ1uEfp;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.62, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9vRdJfqBoSGhtAvEiMN0PnyXYVF6RVTTj5yEvRR5pCq2FtajOS2sBzzU9ZfH0yi5IKTBdOhn2rGYNsVe6NEafchzMmGO6nttkoFMqTh71yV+e46ZkOGJ4055vwlWisMLdSoV4y2TYov/CenU98Q3ci5fLTqMnlCX8BVDfBk+PKTEPqkL8VPy5KUB89komw9z2b7wgbnqMcTwIRKZZ2JSl3zMwrK5vgVEIkHaa6jHFfZQDonRtYPUSmimJCdgBWCG0MTNGIh/QnYk67JnsfdTpl3lHmg6x15w+m/L034pzYGixBVPk9oc2JhCfUX63dLroMH1euixTe94nSeRSHFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLuLhvDjQkppp25i+fodoUEM+fZoquDg9FqGK6XwK/0=;
 b=nPN4mb8W9H1diCxlo3KBP1kBbBtqYFo3cD4Gw0IqEHeB2ygFX611nEUbPIIQG5ivO9pZrcObJ4mcnnXbVlZVohFiCsYxwVyeaAV/8HiPABH8tEIa9FUtwaNTg3cu0FMUqk1iVbwlYesMFiUalMgdRuIhTXjwbe2LEounZuzDtQZZgF5XMqTLb/Gt0Yo+zoROn7J6cNFV47eSz3sBJtw53Cg/vNKGKG6EqxNQm4kjk/IK5IRogkRuqiJFBf5p25Bfv+/w7DWmuBO1QRzRn6IO3gh3YcMiOfdtzt7Rz7g2JuSnHyJFqLAcPpTB5wu+YJBfjzqmcRO92yVokYnyBk/Qmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLuLhvDjQkppp25i+fodoUEM+fZoquDg9FqGK6XwK/0=;
 b=rFZ1uEfpPgiTlubqcIn77cDE9DUlAIkZ+MdYM7eU7id3H2eRKkeCehhpuEfRqKJROrLhpGO34TgGAf+tbqo8+zZZIPkcdLKU9QX8VjqQf2+4iDTuCvAYv4iGEVt6kP9dwnE6KlyD0vX2x+tphekXsCRCeXhhkjEXgPvBy+P1gc8=
Received: from SA1P222CA0120.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::16)
 by BLAPR10MB4865.namprd10.prod.outlook.com (2603:10b6:208:334::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Tue, 20 Jan
 2026 19:22:26 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:3c5:cafe::2a) by SA1P222CA0120.outlook.office365.com
 (2603:10b6:806:3c5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Tue,
 20 Jan 2026 19:22:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 19:22:25 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 13:22:00 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 13:21:59 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 13:21:59 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60KJLxuQ1584832
	for <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 13:21:59 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1viHId-00000009L9d-3HLE
	for docs@lists.yoctoproject.org;
	Tue, 20 Jan 2026 13:21:59 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: Document updated UBOOT_CONFIG flow
Date: Tue, 20 Jan 2026 13:21:59 -0600
Message-ID: <20260120192159.2226262-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|BLAPR10MB4865:EE_
X-MS-Office365-Filtering-Correlation-Id: 6caec4ca-3c12-4df2-f947-08de58593e3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HHT5oxDNI3yduSAqmohvpbcqcWFQesgGDfgrbKKL8fdzz2jrNkJwQ+JGW69Q?=
 =?us-ascii?Q?nvWV8uxkRm/Pc/oQbKvJ/CrZjWEt6NxbXRqFWlR0MlLM92Cm/DPVsHYNR+kd?=
 =?us-ascii?Q?SSLKEIrIW7Jo1Qy8C0rrNjyEF+j8nqKrbylNOBzzcEwJqgKFYM5mi5BMOQzD?=
 =?us-ascii?Q?GkmvhEr33z0aT7sBEqlQl/JHwLgh4EV5D7ToQ1lntvX4d/xi9qOhhgb9MGqd?=
 =?us-ascii?Q?AVzkSDT2sYu0P52mFb6uTn/OyiDHQYa9CSgPC8LUDevxnlZtwrKwzG712Lzv?=
 =?us-ascii?Q?JZ3M59Ex5ZQlS7YVRZ7e8umV/oHg6VLEmy58c8lZ71Mvf77Iui+QgoUC6I6T?=
 =?us-ascii?Q?5eKTE3GlmRtCQNBVCjoEJ8p4DcTlQaldX0CdPK/d8ZUSWop7pMUCzVqbAGG8?=
 =?us-ascii?Q?b4EDfgPjk5cPd1R0QxGN0t0CUBr3JlcpaCN1///3OixtU9JqA2YfAXQa2JlG?=
 =?us-ascii?Q?hcN0X0NX0BIAY0P5f8vQC5e69FFVaXEziDB/kfkk/e5tDcn6qpMoxSZENVUF?=
 =?us-ascii?Q?WmwMXpzUhAoAMu3sq1C7JWHsqV+mACV3qHAPgTYD5q4/myvw52+F31kcDqgv?=
 =?us-ascii?Q?npwE8IKnh3UarbuGi3Nsf7Lb8a7WU06jxlCRv/RrCOozRY1DCZpcmECF8UFv?=
 =?us-ascii?Q?vlYq3Re0+vOZIntls+ci6TH7ZIQpsKuJCl8qCfvKKUibiKYgSPtYTXo2+Kom?=
 =?us-ascii?Q?IxRwjukyZtbtm9pfLafLJ5LqgnH7pd6zl9JQoPc/L+TKncI2L53k3mwiFpSg?=
 =?us-ascii?Q?Gs5KuIZYNeXyHzkMnT4ij9stVf+mRR8oNBaj4y1URYQGQRDuBvdmTGVGZPTl?=
 =?us-ascii?Q?754pzxuhEPS19UwOI2x+AJGEajgsDLeZPaIkGer4M7P03aoYkvks1Ck0x7Zz?=
 =?us-ascii?Q?+cyGZs6z3z/MmYyXJjoHJZ7EU8cFz8VPH8BY1rgM9hh1UNamXEbOJc4RLgSD?=
 =?us-ascii?Q?DkdnwlHSdaQ5WkUPYJ6C+zAKQOVZsRDRqflMHyHeGcskKWfCMOcHzzJTR9cD?=
 =?us-ascii?Q?tpXqkhKCsEtwC7gB8qK4LzJlSEwxjzKZtj+k/T2HLgeIH7UH5I9ll85Ym66n?=
 =?us-ascii?Q?IuMpd8tHxJZlpi/FOWUHO5wI16J5o+bGInZB9PBsSR7rYPd/VL3VvooepfcA?=
 =?us-ascii?Q?HT33YRK5HxdvmPJ2l5jy6RjKMn14ox7mW4ZmYGe4M3vSyXCCs549eLnNiI9X?=
 =?us-ascii?Q?5XV9r7pvliEZ9POVZgbLnYHrYBM+0Jar+KhSs3pCb8TQZG+Jz+nmPA15PPzQ?=
 =?us-ascii?Q?hgeWfjOHGCZDThHmaFpmksYTVrPRdCOGBovQmu4pKFds5jCWY9lkPDK2MsPy?=
 =?us-ascii?Q?HvPc/vtrE/iktdTzBTki84T/Wk1qa+RLohAwrgQ0WI5/rqIU8K6Lr31Y1LVq?=
 =?us-ascii?Q?aMD4e3vvgzVvH4OLBX+YOK0qgnfQWl84pB7KzCuqRv/QKJ5B7Cqk5mv+IN1b?=
 =?us-ascii?Q?I2g5trJsqJgfH4QjNZf/lHBWyMmWAaS3sOkrRWbp+3aAj3je+KSs/k6y+L9A?=
 =?us-ascii?Q?lDT/i3kcltlfquWcezW4+0Lt2DTY1wX+lGBTGJVrAWTe5U65HDqocVVLTq6C?=
 =?us-ascii?Q?nJbt/UpWpFPNqYzS3onhTrEiti2l4jYnDulHGnw1J89koVBHPPt1+du4y4tY?=
 =?us-ascii?Q?WaDrzXm7YekfAeC3/NtONRhgBPvTGM300IlMgG6anH3QW+c54ezi4nBbLtnY?=
 =?us-ascii?Q?jjKOJg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 19:22:25.1892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6caec4ca-3c12-4df2-f947-08de58593e3b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4865
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 19:22:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8609

The UBOOT_CONFIG flow was updated in oe-core [1].  Document all of the
new variables and preferred method of specifying the various controls
for each config.

[1] xxx

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 documentation/ref-manual/classes.rst   |  96 +++++++++++++++++++----
 documentation/ref-manual/variables.rst | 101 +++++++++++++++++++++++--
 2 files changed, 176 insertions(+), 21 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manua=
l/classes.rst
index 2e219a59c..4eb811387 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3269,13 +3269,89 @@ variable using the "type" varflag. Here is an examp=
le::
 The :ref:`ref-classes-uboot-config` class provides support for configuring=
 one
 or more U-Boot build configurations.
=20
-There are two ways to configure the recipe for your machine:
+There are three ways to configure the recipe for your machine:
=20
--  Using :term:`UBOOT_CONFIG` variable. For example::
+-  Using the :term:`UBOOT_MACHINE` variable (and its companion variable
+   :term:`UBOOT_BINARY`). For example::
+
+      UBOOT_MACHINE =3D "config"
+      UBOOT_BINARY =3D "u-boot.bin"
+
+-  Using :term:`UBOOT_CONFIG` variables. For example::
+
+      UBOOT_CONFIG ??=3D "foo bar"
+      UBOOT_CONFIG[foo] =3D "config"
+      UBOOT_CONFIG[bar] =3D "config2"
+
+      UBOOT_CONFIG_IMAGE_FSTYPES[bar] =3D "fstype"
+
+      UBOOT_CONFIG_BINARY[foo] =3D "binary"
+
+      UBOOT_CONFIG_MAKE_OPTS[foo] =3D "FOO=3D1"
+      UBOOT_CONFIG_MAKE_OPTS[bar] =3D "BAR=3D1"
+
+      UBOOT_CONFIG_FRAGMENTS[foo] =3D "foo.fragment"
+
+   In this example, all possible configurations are selected (``foo`` and
+   ``bar``), but it is also possible to build only ``foo`` or ``bar`` by
+   changing the value of :term:`UBOOT_CONFIG` to include either one or the
+   other.
+
+   Each build configuration is associated to a variable flag definition of
+   :term:`UBOOT_CONFIG`, and associated changes for each config as defined
+   in the various UBOOT_CONFIG_* variables.
+
+   -  UBOOT_CONFIG[config]: defconfig file selected for this build configu=
ration.
+      These files are found in the source tree's ``configs`` folder of U-B=
oot.
+
+      *This option is mandatory.*
+
+   -  :term:`UBOOT_CONFIG_IMAGE_FSTYPES` [config]: image types to append t=
o the
+      :term:`IMAGE_FSTYPES` variable for image generation for this build
+      configuration.
+
+      This can allow building an extra image format that uses the binary
+      generated by this build configuration.
+
+      This option is not mandatory and can be left unspecified if not need=
ed.
+
+   -  :term:`UBOOT_CONFIG_BINARY` [config]: binary to select as the one to=
 deploy in
+      :term:`DEPLOY_DIR_IMAGE`. The output of a U-Boot build may be more t=
han
+      one binary, for example::
+
+         u-boot.bin
+         u-boot-with-spl.bin
+
+      Setting the ``binary`` value to ``u-boot-with-spl.bin`` will make th=
is
+      binary the one deployed in :term:`DEPLOY_DIR_IMAGE`. It is renamed t=
o
+      include the build configuration name in the process (``foo`` or ``ba=
r`` in
+      the above example).
+
+      This option defaults to :term:`UBOOT_BINARY` if not specified.
+
+   -  :term:`UBOOT_CONFIG_MAKE_OPTS` [config]: additional options passed t=
o
+      ``make`` when configuring and compiling U-Boot for this configuratio=
n
+      entry. The options in this entry are added before the options in
+      :term:`UBOOT_MAKE_OPTS`.
+
+      This option is not mandatory and adds nothing if not specified.  If
+      you do not have a make option for a given config, you can simply not
+      set the flag for that config.
+
+   -  :term:`UBOOT_CONFIG_FRAGMENTS` [config]: additional config fragment(=
s)
+      from the source tree that is used during ``do_configure()`` to setup=
 the
+      build.  The options in this entry are added before the fragments in
+      :term:`UBOOT_FRAGMENTS`.
+
+      This option is not mandatory and adds nothing if not specified.  If
+      you do not have a fragment a given config, you can simply not set th=
e
+      flag for that config.
+
+-  Or, a legacy method using the :term:`UBOOT_CONFIG` variable by itself. =
For example::
=20
       UBOOT_CONFIG ??=3D "foo bar"
-      UBOOT_CONFIG[foo] =3D "config,images,binary,makeopts"
-      UBOOT_CONFIG[bar] =3D "config2,images2,binary2,makeopts2"
+      UBOOT_CONFIG[foo] =3D "config,images,binary"
+      UBOOT_CONFIG[bar] =3D "config2,images2,binary2"
=20
    In this example, all possible configurations are selected (``foo`` and
    ``bar``), but it is also possible to build only ``foo`` or ``bar`` by
@@ -3313,15 +3389,9 @@ There are two ways to configure the recipe for your =
machine:
=20
       This option defaults to :term:`UBOOT_BINARY` if unset.
=20
-   -  ``makeopts``: the additional options passed to ``make`` when configu=
ring
-      and compiling U-Boot for this configuration entry. The options in th=
is
-      entry are added before the options in :term:`UBOOT_MAKE_OPTS`.
-
--  Or, using the :term:`UBOOT_MACHINE` variable (and its companion variabl=
e
-   :term:`UBOOT_BINARY`). For example::
-
-      UBOOT_MACHINE =3D "config"
-      UBOOT_BINARY =3D "u-boot.bin"
+.. note::
+   It is recommended to not use this legacy flow as any future extensions
+   to the control knobs will be not added to this methodology.
=20
 Using :term:`UBOOT_MACHINE` and :term:`UBOOT_CONFIG` at the same time is n=
ot
 possible.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 4d8a35473..dec260a3f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10669,29 +10669,108 @@ system and gives an overview of their function a=
nd contents.
=20
    :term:`UBOOT_CONFIG`
       Configures one or more U-Boot configurations to build. Each
-      configuration can define the :term:`UBOOT_MACHINE` and optionally th=
e
-      :term:`IMAGE_FSTYPES` and the :term:`UBOOT_BINARY`.
+      configuration must define the :term:`UBOOT_MACHINE`.  Additional con=
trol
+      variables can found at: :term:`UBOOT_CONFIG_BINARY`,
+      :term:`UBOOT_CONFIG_FRAGMENTS`, :term:`UBOOT_CONFIG_IMAGE_FSTYPES`, =
and
+      :term:`UBOOT_CONFIG_MAKE_OPTS`.=20
=20
-      Here is an example from the ``meta-freescale`` layer. ::
+      Here is an updated example from the ``meta-freescale`` layer. ::
=20
          UBOOT_CONFIG ??=3D "sdcard-ifc-secure-boot sdcard-ifc sdcard-qspi=
 lpuart qspi secure-boot nor"
+
          UBOOT_CONFIG[nor] =3D "ls1021atwr_nor_defconfig"
-         UBOOT_CONFIG[sdcard-ifc] =3D "ls1021atwr_sdcard_ifc_defconfig,,u-=
boot-with-spl-pbl.bin"
-         UBOOT_CONFIG[sdcard-qspi] =3D "ls1021atwr_sdcard_qspi_defconfig,,=
u-boot-with-spl-pbl.bin"
+         UBOOT_CONFIG[sdcard-ifc] =3D "ls1021atwr_sdcard_ifc_defconfig"
+         UBOOT_CONFIG[sdcard-qspi] =3D "ls1021atwr_sdcard_qspi_defconfig"
          UBOOT_CONFIG[lpuart] =3D "ls1021atwr_nor_lpuart_defconfig"
          UBOOT_CONFIG[qspi] =3D "ls1021atwr_qspi_defconfig"
          UBOOT_CONFIG[secure-boot] =3D "ls1021atwr_nor_SECURE_BOOT_defconf=
ig"
-         UBOOT_CONFIG[sdcard-ifc-secure-boot] =3D "ls1021atwr_sdcard_ifc_S=
ECURE_BOOT_defconfig,,u-boot-with-spl-pbl.bin"
+         UBOOT_CONFIG[sdcard-ifc-secure-boot] =3D "ls1021atwr_sdcard_ifc_S=
ECURE_BOOT_defconfig"
+
+         UBOOT_CONFIG_BINARY[sdcard-ifc] =3D "u-boot-with-spl-pbl.bin"
+         UBOOT_CONFIG_BINARY[sdcard-qspi] =3D "u-boot-with-spl-pbl.bin"
+         UBOOT_CONFIG_BINARY[sdcard-ifc-secure-boot] =3D "u-boot-with-spl-=
pbl.bin"
=20
       In this example, all possible seven configurations are selected. Eac=
h
       configuration specifies "..._defconfig" as :term:`UBOOT_MACHINE`, an=
d
       the "sd..." configurations define an individual name for
-      :term:`UBOOT_BINARY`. No configuration defines a second parameter fo=
r
-      :term:`IMAGE_FSTYPES` to use for the U-Boot image.
+      :term:`UBOOT_CONFIG_BINARY`.
=20
       For more information on how the :term:`UBOOT_CONFIG` is handled, see=
 the
       :ref:`ref-classes-uboot-config` class.
=20
+   :term:`UBOOT_CONFIG_BINARY`
+      This variable cannot be set to a value in a config, it is a placehol=
der
+      for configuring the :term:`UBOOT_CONFIG` flow via flags::
+
+         UBOOT_CONFIG_BINARY[foo] =3D "binary1"
+         UBOOT_CONFIG_BINARY[bar] =3D "binary2"
+
+      Specify the binary to select as the one to deploy in :term:`DEPLOY_D=
IR_IMAGE`.
+      The output of a U-Boot build may be more than one binary, for exampl=
e::
+
+         u-boot.bin
+         u-boot-with-spl.bin
+
+      Setting the ``binary`` value to ``u-boot-with-spl.bin`` will make th=
is
+      binary the one deployed in :term:`DEPLOY_DIR_IMAGE`. It is renamed t=
o
+      include the build configuration name in the process (``foo`` or ``ba=
r`` in
+      the above example).
+
+      This option defaults to :term:`UBOOT_BINARY` if not specified.
+
+      For more information on how the :term:`UBOOT_CONFIG_BINARY` is handl=
ed, see the
+      :ref:`ref-classes-uboot-config` class.
+
+   :term:`UBOOT_CONFIG_FRAGMENTS`
+      This variable cannot be set to a value in a config, it is a placehol=
der
+      for configuring the :term:`UBOOT_CONFIG` flow via flags::
+
+         UBOOT_CONFIG_FRAGMENTS[foo] =3D "frag1 frag2"
+         UBOOT_CONFIG_FRAGMENTS[bar] =3D "frag3"
+
+      Specify a list of fragments from the source tree that should be comb=
ined
+      with the defconfig from :term:`UBOOT_CONFIG` that are used during ``=
do_configure()``
+      to configure the build.
+
+      This option is not required and you only need to specify flag settin=
gs for
+      configs that need them.
+
+      For more information on how the :term:`UBOOT_CONFIG_FRAGMENTS` is ha=
ndled, see the
+      :ref:`ref-classes-uboot-config` class.
+
+   :term:`UBOOT_CONFIG_IMAGE_FSTYPES`
+      This variable cannot be set to a value in a config, it is a placehol=
der
+      for configuring the :term:`UBOOT_CONFIG` flow via flags::
+
+         UBOOT_CONFIG_IMAGE_FSTYPES[foo] =3D "fstype1"
+         UBOOT_CONFIG_IMAGE_FSTYPES[bar] =3D "fstype2"
+
+      Append additional image types to the :term:`IMAGE_FSTYPES` variable =
for
+      image generation for this build configuration.  This can allow build=
ing an
+      extra image format that uses the binary generated by this build conf=
iguration.
+
+      This option is not required and you only need to specify flag settin=
gs for
+      configs that need them.
+
+      For more information on how the :term:`UBOOT_CONFIG_IMAGE_FSTYPES` i=
s handled, see the
+      :ref:`ref-classes-uboot-config` class.
+
+   :term:`UBOOT_CONFIG_MAKE_OPTS`
+      This variable cannot be set to a value in a config, it is a placehol=
der
+      for configuring the :term:`UBOOT_CONFIG` flow via flags::
+
+         UBOOT_CONFIG_MAKE_OPTS[foo] =3D "OPT1=3Dfoo OPT2=3D2"
+         UBOOT_CONFIG_MAKE_OPTS[bar] =3D "OPT1=3Dbar"
+
+      Specify a list of make command line options that are passed to the `=
`make`` command
+      during ``do_compile()``.
+
+      This option is not required and you only need to specify flag settin=
gs for
+      configs that need them.
+
+      For more information on how the :term:`UBOOT_CONFIG_MAKE_OPTS` is ha=
ndled, see the
+      :ref:`ref-classes-uboot-config` class.
+
    :term:`UBOOT_DTB_LOADADDRESS`
       Specifies the load address for the dtb image used by U-Boot. During =
FIT
       image creation, the :term:`UBOOT_DTB_LOADADDRESS` variable is used i=
n
@@ -10980,6 +11059,12 @@ system and gives an overview of their function and=
 contents.
=20
       See the :ref:`ref-classes-uboot-sign` class for details.
=20
+   :term:`UBOOT_FRAGMENTS`
+      The :term:`UBOOT_FRAGMENTS` variable can be used to pass extra confi=
g
+      fragments from the source tree to ``make`` when U-Boot is configured=
.
+
+      See the :ref:`ref-classes-uboot-config` class for more information.
+
    :term:`UBOOT_INITIAL_ENV_BINARY`
       This variable enables the generation of the U-Boot initial environme=
nt in
       binary format.
--=20
2.43.0


