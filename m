Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34330D2FEF9
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 22:57:28 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.425.1769554646447013095
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 14:57:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=iV++tO9l;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.12, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0v0bnDybQVu6qKaMzXhVBGM7rmf11KVLolWFdtXAWMlSWwTbe7UJYikbCmiikxbOpIKv0cDhyDmehiwmvuQGRw1+KEsYQuDbdIwkKY2BkzSwNKgSI4jFEecJL7G7eB4fbWJWXHT7oEHwgDtQXJW5iQbsQLXAPXeja5wtYNzSdjMiS9of616eBP55XrtGWghc7uy8l3J8WUd4CQ6nD8gK9C+Jl9tW1z9f2B/ihR25mjY2oaFzNr0UhGuZaxb2JpB+6ll8FnBEOM66N+80gBrRIlmROwNxZE/jcQGCFplVEeyI5FnKUfP3H/6vYeX+X6J674SDae+OZzurGp9Zfv9Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFaoOV9QfVaXFJCY3o7C+vct3thEaUoAwJARHHkZeP4=;
 b=cP8icn6TkBDjTS+GyN6bXLddXnMoilEd7y9XOR9XyB+KL9FwnMLME4ETVa4zwFvH8Cw6oODx3ctaTCHUUbWb+NPIBhn0jRmqp7SNfAv8I7VDqmln08Nj5jBsAW8vYwwr7dcvjW2qc7yAvOZ8KVGa7LIMrQQ/zsgGZSzM6pPHc266NnNVGvMKLEny8dTiOVdiEhs66CxlqW5/+jhebnBKq4pa1qp6Ws+MHOlAD65DweXJr6uiteeGkU84I3HM0JNkj4Xca9fBzpTxGPJ8bWV0AkNpl+/e0t3pQoG9KhDw+ZNU/K8d5umYOThcmcGtqev+kxBZfa1JJYlEq9rJX9AAVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFaoOV9QfVaXFJCY3o7C+vct3thEaUoAwJARHHkZeP4=;
 b=iV++tO9logybf8sWghavFDEWQwED6XCqgJqUvqR1e+/pcngJf8HGHd4/4oBz5gCzl/Lw2gG0ti7Kj8xvs+JfnSkGtWY3Zw4Rn4DxpdNMmHGlEi1/k5Ea9kSEzhTeLssEtbCqkujc8/HoGCpJ+342YbOPqaPABDUliMi0jl3olbg=
Received: from SJ0PR13CA0091.namprd13.prod.outlook.com (2603:10b6:a03:2c5::6)
 by MW4PR10MB6321.namprd10.prod.outlook.com (2603:10b6:303:1e1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 22:57:23 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::3a) by SJ0PR13CA0091.outlook.office365.com
 (2603:10b6:a03:2c5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 22:57:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 22:57:22 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 16:57:06 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 16:57:06 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 27 Jan 2026 16:57:06 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60RMv6Pc1289671
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 16:57:06 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vkrze-000000006Xs-1h4F
	for docs@lists.yoctoproject.org;
	Tue, 27 Jan 2026 16:57:06 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH v2] ref-manual: Document updated UBOOT_CONFIG flow
Date: Tue, 27 Jan 2026 16:57:06 -0600
Message-ID: <20260127225706.25153-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|MW4PR10MB6321:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f50e05b-0628-4c66-b09d-08de5df76e75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LLGubdnMQ22xQngbhIOR2zRE0NlgBP/wJvHmpX8K0AxC6hq86qEFm2P6X6cq?=
 =?us-ascii?Q?1VkGtMZUyow2ebk35/DbSQhh1EGUiAUInwnJEIpzZc/Xd2DaiadpdciWtOuC?=
 =?us-ascii?Q?ND4tpdAibFf+Vnd07Fwa8qKyqBfAFR11GJtHGuP+srjZJBTxqcmfqr2nNlwL?=
 =?us-ascii?Q?1c10mr4Zb3/ROzVJyIFYGnyCN0TVPhxcjzAl7giG2h0SzjM4Vos1XECTWFVR?=
 =?us-ascii?Q?0oQDz3gYlEJKENSdMk9xNxtWuatttMzIe+DCKupagQLY2FhouQYE9pEjMIt/?=
 =?us-ascii?Q?x4DHDsSHfjccBV2IckmjHM4dIy0DZiFTalurOXWv9+qWPTqQBc3a9mrHm87I?=
 =?us-ascii?Q?xNYVkq4iQmIkt8HcEd/fOrrT+Z/KbpFHzYV8febNzsKH3G0p85SMSXgC4BYl?=
 =?us-ascii?Q?A68JS/bm5NHXLVcOy//LXn6w1KAFDA2YcbVwVTTOpQ7XibfGOV7J/sPUktys?=
 =?us-ascii?Q?+OuM7Fdi55KN2zLvG5bue/m/i007weySRRyUK660lh3Y0C8+uFeiTrDG/NEI?=
 =?us-ascii?Q?Bihxu/28fPLeHsETeYqUL/Cwt296dSDHIe+ucDbe0+8dlErqsGn9WaBIrgN/?=
 =?us-ascii?Q?zkJeoP3UW65Sdb/f/3FHvt/ch2a0zP0pSFXO6DO87aMpE7r1eVfWbK9OhrNZ?=
 =?us-ascii?Q?P6JVI0RjM7gNARyE2CCLskJltYFDHE9u2xIarXtd+xchTTcr0k5CBmJDqFla?=
 =?us-ascii?Q?Qo4/x6lrI3vgR8L+agUVCOyVmMqzzDFhM/VDOivGIlYAqvtMdBpCVzEQtNFQ?=
 =?us-ascii?Q?lv2eVctNVUe3ZKF9bF34aFcI9wwZyv12O7K0+BCg4QHiZ9XUDABSyPVjxnWU?=
 =?us-ascii?Q?x/B5p7B5CEf5Av023Cg++2MkfkTqDklScL19uz04OX0VporhzpXemD97R7AH?=
 =?us-ascii?Q?tFTQqYRoyDM6qfpF4iUVXs8Q1vLt7RkXGF5BAWpDzBHYuGUGre44J1xF90gZ?=
 =?us-ascii?Q?F39Lx7YjK1Yzy213HoY03VggmBQx0SBXuPDwMTDn+1s2jcJuYpg6STpIOE4V?=
 =?us-ascii?Q?Mq6TPBuvttonK6QFg+hrZDtZWMjDrh+kEl+D0ygOXiJWmL6GOW55hjO2qHa/?=
 =?us-ascii?Q?B0+CoMGSG0lZjm0CAWJlbeNiqlbJFzTzxZAb+DGy/kDKjueI0E1nj3MqJKog?=
 =?us-ascii?Q?2c/9nNTZU2i5uhgVgDIqd5zvlwwGsQrJOWMhZ0Pux7iSFnWqYN4W5qPvvth7?=
 =?us-ascii?Q?8ryLay7JIgLu8VHzJ7PG4NeBw0Zi82or4mrNGsv5R6LU3PZacylO9Xvg5yGZ?=
 =?us-ascii?Q?qbiJcS2g9b1f4QyksdQOPDzp70LEjhYwVrhvBOw9tDRcObJ+npzf+7JoUEZc?=
 =?us-ascii?Q?e1TmE7FDVrs0K/kSTUuz95e7+LcRjQSGY2s6RasL1M+o8ccrTOzGmPh2T5Xd?=
 =?us-ascii?Q?r7azDuYmNXqZ/jvVjGhjq2C7V7FWs70SCOtaUPK5vLUlof1KENmp4Hi7RgP5?=
 =?us-ascii?Q?sKVwtAZg6TDZHvsxOz1Q/CbOZj7bXIcg97Grs+OpIiBh9H28wgZrg2ehal0G?=
 =?us-ascii?Q?qrVgsVGuxgHXphCQ55WhspiCaXUnKwzCqaMqGRTZSlDh8xAkOJ5EupuTe2FB?=
 =?us-ascii?Q?LlgGmvEfN/US+50gJ9l29XIjOkCHydGYqWWPwUiDpY+yfVY3xBw7v69jSFAn?=
 =?us-ascii?Q?ZbRe7mkb1NWzjwQORNmpSKJQLtR6bT4PvGXR8xiRgX2JsidiVy4W/ZoU43Qh?=
 =?us-ascii?Q?WkEJJQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 22:57:22.3907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f50e05b-0628-4c66-b09d-08de5df76e75
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6321
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 22:57:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8755

The UBOOT_CONFIG flow was updated in oe-core [1].  Document all of the
new variables and preferred method of specifying the various controls
for each config.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3Dcd9e7304481=
b24b27df61c03ad73496d18e4d47c

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: - Added missing commit URL.
    - Applied feedback from Antonin Godard.

 documentation/ref-manual/classes.rst   | 112 ++++++++++++++++++++++---
 documentation/ref-manual/variables.rst | 109 ++++++++++++++++++++++--
 2 files changed, 201 insertions(+), 20 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manua=
l/classes.rst
index 2e219a59c..0e36c6c0d 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3269,13 +3269,104 @@ variable using the "type" varflag. Here is an exam=
ple::
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
+   other.  For exmaple::
+
+      UBOOT_CONFIG =3D "foo"
+      UBOOT_CONFIG[foo] =3D "config"
+      UBOOT_CONFIG[bar] =3D "config2"
+
+   Each build configuration is associated to a variable flag definition of
+   :term:`UBOOT_CONFIG`, and associated changes for each config as defined
+   in the various UBOOT_CONFIG_* variables.
+
+   -  ``UBOOT_CONFIG[config]``: defconfig file selected for this build con=
figuration.
+      These files are found in the source tree's ``configs`` folder of U-B=
oot.
+
+      *This option is mandatory.*
+
+      See the documentation of :term:`UBOOT_CONFIG` for more information.
+
+   -  ``UBOOT_CONFIG_IMAGE_FSTYPES[config]``: image types to append to the
+      :term:`IMAGE_FSTYPES` variable for image generation for this build
+      configuration.
+
+      This can allow building an extra image format that uses the binary
+      generated by this build configuration.
+
+      This option is not mandatory and can be left unspecified if not need=
ed.
+
+      See the documentation of :term:`UBOOT_CONFIG_IMAGE_FSTYPES` for more=
 information.
+
+   -  ``UBOOT_CONFIG_BINARY[config]``: binary to select as the one to depl=
oy in
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
+      See the documentation of :term:`UBOOT_CONFIG_BINARY` for more inform=
ation.
+
+   -  ``UBOOT_CONFIG_MAKE_OPTS[config]``: additional options passed to
+      ``make`` when configuring and compiling U-Boot for this configuratio=
n
+      entry. The options in this entry are added before the options in
+      :term:`UBOOT_MAKE_OPTS`.
+
+      This option is not mandatory and adds nothing if not specified.  If
+      you do not have a make option for a given config, you can simply not
+      set the flag for that config.
+
+      See the documentation of :term:`UBOOT_CONFIG_MAKE_OPTS` for more inf=
ormation.
+
+   -  ``UBOOT_CONFIG_FRAGMENTS[config]``: additional config fragment(s)
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
+      See the documentation of :term:`UBOOT_CONFIG_FRAGMENTS` for more inf=
ormation.
+
+-  Or, a legacy method using the :term:`UBOOT_CONFIG` variable by itself.
+   *This method is being deprecated, see note below.*  For example::
=20
       UBOOT_CONFIG ??=3D "foo bar"
-      UBOOT_CONFIG[foo] =3D "config,images,binary,makeopts"
-      UBOOT_CONFIG[bar] =3D "config2,images2,binary2,makeopts2"
+      UBOOT_CONFIG[foo] =3D "config,images,binary"
+      UBOOT_CONFIG[bar] =3D "config2,images2,binary2"
=20
    In this example, all possible configurations are selected (``foo`` and
    ``bar``), but it is also possible to build only ``foo`` or ``bar`` by
@@ -3313,15 +3404,12 @@ There are two ways to configure the recipe for your=
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
+.. note::
=20
-      UBOOT_MACHINE =3D "config"
-      UBOOT_BINARY =3D "u-boot.bin"
+   The legacy flow has been deprecated.  It is recommended to not use this
+   legacy flow as any future extensions to the control knobs will be not a=
dded
+   to this methodology.  This functionality will be removed after the wryn=
ose
+   LTS release.
=20
 Using :term:`UBOOT_MACHINE` and :term:`UBOOT_CONFIG` at the same time is n=
ot
 possible.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 4d8a35473..cdf0111a2 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10669,29 +10669,109 @@ system and gives an overview of their function a=
nd contents.
=20
    :term:`UBOOT_CONFIG`
       Configures one or more U-Boot configurations to build. Each
-      configuration can define the :term:`UBOOT_MACHINE` and optionally th=
e
-      :term:`IMAGE_FSTYPES` and the :term:`UBOOT_BINARY`.
+      configuration must define the :term:`UBOOT_MACHINE` variable.
+      Additional control variables are: :term:`UBOOT_CONFIG_BINARY`,
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
+      It specifies the binary to select as the one to deploy in :term:`DEP=
LOY_DIR_IMAGE`.
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
+      For more information on how the :term:`UBOOT_CONFIG_BINARY` variable=
 is
+      handled, see the :ref:`ref-classes-uboot-config` class.
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
+      to configure the build.  These fragments are located in same=20
+      ``${S}/configs/`` directory as the defconfig.
+
+      This option is not required and you only need to specify it for
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
+      It specifies a list of make command line options that are passed to =
the ``make`` command
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
@@ -10980,6 +11060,19 @@ system and gives an overview of their function and=
 contents.
=20
       See the :ref:`ref-classes-uboot-sign` class for details.
=20
+   :term:`UBOOT_FRAGMENTS`
+      The :term:`UBOOT_FRAGMENTS` variable can be used to pass extra confi=
g
+      fragments from the source tree to ``make`` when U-Boot is configured=
.
+      These fragments are located in same ``${S}/configs/`` directory as t=
he
+      defconfig.
+
+      For example::
+
+          UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
+          UBOOT_FRAGMENTS =3D "am62x_r5_usbdfu.config"
+
+      See the :ref:`ref-classes-uboot-config` class for more information.
+
    :term:`UBOOT_INITIAL_ENV_BINARY`
       This variable enables the generation of the U-Boot initial environme=
nt in
       binary format.
--=20
2.43.0


