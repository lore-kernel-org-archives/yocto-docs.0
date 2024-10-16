Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18CCD1AD4F
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 11:55:26 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.110])
 by mx.groups.io with SMTP id smtpd.web11.21241.1729079719797648540
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 04:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=MBAorhIz;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.20.110, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DtgKF9L426aAMvnU1TUXrRrXAsE1EbR9AYg+OnhpYeKVMb2YNbFmawAMugsNp2pX9HPnn9tZJcq3JVLTmwrgjW1f369l1OWbG+K+g2j5NsUZiTwgCOz/Q1+9Qft0XvuhD06NEDUJeEQ2HV0C2epFUTgfHDAd95t3tp3AV4xdaHAwjEfdPuZ/4hzq5yzvqrzVkqNIIefAyxh4y/b26haXzVrV+R/Sqghh7oA0L8oQBXg1l4Hi0Cyi+R33k+zL0PINhKaUXBwG05UPoe57cdElDfBG5VDI5rZo5Rmf15smVPzxwCnIvucU8ixNk3xXXFuFahs3R7xJZsd8/MQHfyrgmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5U2h6rd4SKNVnGui6hkqTl47BUcpITP9dKBHMECOYI=;
 b=beTJ7thORAb3E1KNPxwGbMKO1DFpGhBUglAp26oCqJknC/dc2mTNP/fKhHxGtLnQrE/S9iYB/QTvYVk5c1/7GQBhr117rOp/Ud3/bpkDDvPr/J97jDUUaDUOJ8up+yEH2jtRwgGkDiysaOJvGTLmqIhYSHOdhHfmGLwonsvkhz/inbH4sUoCxUIrpG4TLTqv++pV9wKK+izn+fP1kILjPp7PBuGuyY1CcdJ0pTiKfYhvr1yRs5DU+KPJQgqZVqXQZIn9V/hIxgu6lGFe72sfW+bqogHRshmt1d/lGbnuOLHNYoIgZEom8Ha8xcJ2m3IRZpRIZfKn4YpRCU7/nwG/KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5U2h6rd4SKNVnGui6hkqTl47BUcpITP9dKBHMECOYI=;
 b=MBAorhIzWfnq2uZj7ffyaqWJXvZpACXMBauzBxHMY82rEwGeArlzVSvPISz7OnoYI2VuRR3Xq8aoeFHA7VZ3V4iEAF87fu5g5oEeE07+KV/lLzewnDdTMm/AF/9vjg1hgQHaAyDaBhodQW1B2RUQTaRFgKx2pXt2zYMXKrmHv4qICsw+sRh3BK+ZZACCOR3DOGc1nMbeuHYEfNEf7eYeRlhh2vRAjwGnPpMuy8+4dcNXiG5EeRk++ONjEkIfo6D1b2uXRbrQXknrDNQ9feGcsFzquu1Xr9NlI7SoelQAErv3edNrX5cnTXq6MQ4RVbSU+QpbUDisF6f0ZOwKpwfxWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM9PR06MB7955.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 11:55:15 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 11:55:15 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: docs@lists.yoctoproject.org
CC: quentin.schulz@cherry.de,
	antonin.godard@bootlin.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCHv4 1/2] docs: Replace VOLATILE_LOG_DIR with FILESYSTEM_PERMS_TABLES
Date: Wed, 16 Oct 2024 11:54:42 +0000
Message-ID: <20241016115443.2751525-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM8P251CA0023.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::28) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM9PR06MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a96e3d1-f7d2-44be-a7ec-08dcedd96608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GvK1JOf/hqwHkpKUrdrwrDaaJ+z58D219HDhQ+ekwYg3hY+MAFXGbFG38Pyy?=
 =?us-ascii?Q?m+2oVxvBUL+Kk1Pj9YKPSJgV9f9pui13kj6AniJuXMmGlW57GOw151pnrZau?=
 =?us-ascii?Q?KmZ96PyToA4z5SW+rMhMWRtqTrsBXWDe1DkQYsUELnJWQNo0tPuOlL37lj4+?=
 =?us-ascii?Q?4KQviOpetKU9HJEKaY76In7T1eZSzeAP2jHdWfe5xpB143uBy96Oc+weTysn?=
 =?us-ascii?Q?FVoCs+ABTLd78nPYIjVXPpKawOaFLbCCRFZpfyi+jpn4lmrWDWnJEvFxkLOX?=
 =?us-ascii?Q?HYLUaMOQes94dCnepn2RT7uJVrmDhSYocVpHq+R4af8ToQXYk6MsCbl0+jht?=
 =?us-ascii?Q?mVyhK/TR76DL26ct/52mCgz/BYDYfHGd/R4iIAaCO9dO0z+/UWoxFmjkdGXU?=
 =?us-ascii?Q?ky2mmQahFVsGX6GXURKQ5jUV34s4M4SikUyAJkp1YM1/DV/GzSS/32VmQ93s?=
 =?us-ascii?Q?tGqsSFcZfIPVD7Zb44aSGy3rcwkhgmKLHdGPN3MdxWu+fuRmBhJ98mchFz9j?=
 =?us-ascii?Q?LeKH3QZk8f15oK7fSOFW8sc1RKpe0IjfIpj/RzQPnivpQIMEWdYIsAWk4C9y?=
 =?us-ascii?Q?HmfCt6KLgHRXI+s/djGEaKTRFfeDBLLnN89cTjShBdWL7OEQUEeM63BErqfi?=
 =?us-ascii?Q?ajxzKLTksJyOL5RyJNuGbW4LT/2VAjIWWSIKq79IJftjVMly3aH22N2Grgam?=
 =?us-ascii?Q?ZWn/61GMJtxzx+/YODj7ybufUqS2iIWUKFPtmwzRe8T8UnJvmeCE6HPDqhHg?=
 =?us-ascii?Q?cErGN0JOYSHQNH8frCmy6yOqEGVrGe8vpybNH3M0q7x0wph+aD7MUwiyPMR0?=
 =?us-ascii?Q?VanDX/4arrjjQomKNLbctGE/kQLMEyxd13pwKJ0ZYOihIqvV9MFiHbq8zxkF?=
 =?us-ascii?Q?M9dryRoKN7YguvIRTJ7O7WfbHjNVGgoUqIrA1SNCpvEzIWSexld7UuuwjAXQ?=
 =?us-ascii?Q?dx9+/RVz9HDK0697+w0XdMp/LHVU2qkiWaArF/xJs/Ze8126iNmq2bwVtCL7?=
 =?us-ascii?Q?lQtdHuUzwZcmHLGwSyRaAOKzjZRU0pnH2GXmRGijPsxogzHnIl2nJtRZ+9Be?=
 =?us-ascii?Q?4N00nkqpZpOiT4CsgmTkg8Kn/oQsp848iipGexmpHGlwuSN3HuMIR5ZmF9qq?=
 =?us-ascii?Q?C0ytX6s+Waf9UkQwaGYx/iA3B9qs3nU6CQSrgW9C7GUJjrgyei5yBghrRLr/?=
 =?us-ascii?Q?ZW6Zdcsb8Ghpo3PM5nm7Ul/lH7DdIg0Dr74XJ2j/TvogKyjyWd6SrirRaDzv?=
 =?us-ascii?Q?vfMPhJuWc6g0Gbhct8FZPhtQWKelJhC7yoRrh6q4gw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kNLmYFER8VSe+/JATJMohJUPM2Zs2YV5qsISuZpHtp7dbhOYuT5Pt+fcblRE?=
 =?us-ascii?Q?4N/DPQmZzO+EY9o7GyCp+cppxara4ynGzMUvYbsTGeZ/ZpDwAL1QudZ0WaMP?=
 =?us-ascii?Q?B6ygGy9f0PR7cpFkFMDbDQOzEBhmcB26KJuiA+XY35IASh9U86YuvYYd1ipK?=
 =?us-ascii?Q?p5LlkQl/cY5QjV3U4sVl4Y0tkFsGijwEWKRJdExjSBwtcQii0W2X3oosjbQD?=
 =?us-ascii?Q?Cv44EuDRgTLdzY1iXu4E0IMdN1F1XhseNZBAjMpwimaF37PwPG01SA8C38TD?=
 =?us-ascii?Q?SWEzAvfR4Re78jtCqbLug4M7VDcCWEThhIfJRaEGVe49mdVl9OMkoQv0yAYW?=
 =?us-ascii?Q?xQ8cS71YfbSns1XsGlaQpCQ6tsJMzZY1xuZL2krbCXJwc9CQzvy0536qcxy5?=
 =?us-ascii?Q?f8Rn1AmF3z9vpd8j5f2GYgF8/aSR/p6squAUTwMUn3tVxTdI/rztTWbuOrpp?=
 =?us-ascii?Q?wOji9779hycT8e4WG4Wsw4vhjNAqbSJnAsSQskXCutA2elpGE8Okh0nmG1J/?=
 =?us-ascii?Q?bj9CliaP9eLXuUQ9SBE39TGd2jo9JJENKoS/ibl6XQsjxx4H8U78ovePWnxw?=
 =?us-ascii?Q?lZ8YBWEcWiBi41L/RM6LAouYwfyDrDfk+F+dEcLy4x2pUYfhZihF5DC0nj6+?=
 =?us-ascii?Q?WLANueoo13G3OAhAzukQsOU1jUoJvF9u+6L9k7+mCtPMBAZeZVfINv+dH6OV?=
 =?us-ascii?Q?sp+E6qwxKnTeCgMpINzo+UEsaDfGQ9iM8NtfDwXmiGcb6aZidr/4y6DLquJi?=
 =?us-ascii?Q?LfyeXbZS6XKjRCEqW/RpVuxZb71CxLxxbWNii/RPgHDGL1R6D8M5I/Z9RjUT?=
 =?us-ascii?Q?S9ceDgDVuECsyArY/8GtA5ohebGLGuCI+zGC22BOnExNPfNF2hblCc25uxBk?=
 =?us-ascii?Q?Zp+JbLCDzBJRy7F2UMoZirNcoKx7Uqp5A1pDvl8EyZbLMqbBCn4wa/+Kz/tZ?=
 =?us-ascii?Q?s6N/fBj9W8ECFIzrUIDcWwtTmr1PoSIWraJ9lF3e/YCpTUyN239FOPvi3ytn?=
 =?us-ascii?Q?pS/q2JOOl8SSxLWNIj7B6UKYwEVbTHW4tPKw+uHGN/bCcAO46ibrGwMunNc7?=
 =?us-ascii?Q?ZRCnxEJv7qHp7++i8/jBcfemeqxXWFeXPnzBKpUM2XIBhQNJ13ClQU/atof3?=
 =?us-ascii?Q?J0+2sUVOk/cyimQx6Yt34qG94TeT40kBYIVPK6jMutsyoDudOXYB2RCVdj6i?=
 =?us-ascii?Q?ag9lpnlQZW3DNoUgBgzcdOW0gmJgt9U1vdy5F/4y57sO/WoyaIrD93CPpo6c?=
 =?us-ascii?Q?fnZeYPvopIL4R0mnLGTR15VBWqrSgurM2P3Rk2PtNLnShOLvHLDiUyZ8H2K4?=
 =?us-ascii?Q?q2ProzscloNGY0qmyzXVbt5jQ2iv/l1auGP6V5tJ7HsppKfLz4libZAOwADb?=
 =?us-ascii?Q?drvhLn2JWyFUa8vqwEiOhtT4gTUlVSuSVovXRfzBi9sxrc3yLISnIE4JcGbL?=
 =?us-ascii?Q?Sz1iLMdcalViRPNJ8uWqa0yRWkNRGTKpRJnOnjImUAG0sZyYdTmDceEFETr4?=
 =?us-ascii?Q?naQyrBkgSbUrFJbAbcuj+3EdxVc+x44dKDKjzaySOvYuCD/s+1k1iAtPvxwE?=
 =?us-ascii?Q?Xfv9OHIu/b//WhjvIM+e7I1lDtLPmKxwKJw/iZdQcX6UBNs7W+0QRJdmmMdB?=
 =?us-ascii?Q?Ww=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a96e3d1-f7d2-44be-a7ec-08dcedd96608
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 11:55:15.6646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZoPIWh9xiKJiLuZJWBJlwkdjuk3tF0/FdMpXgUYvkPuAyR131U7gXaWv/vYRzXpnJm1VZf7ykyf06Fap3kSvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7955
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 11:55:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5502

The VOLATILE_LOG_DIR variable was removed and it's functionality
replaced with a FILESYSTEM_PERMS_TABLES entry in
https://git.yoctoproject.org/poky/commit/?id=3D2f8806deb7655b37d6f8d12ff546=
80d6acf7a298
("bitbake.conf: drop VOLATILE_LOG_DIR, use FILESYSTEM_PERMS_TABLES instead"=
)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../migration-guides/migration-5.1.rst        |  6 +++
 documentation/ref-manual/features.rst         |  5 ++-
 documentation/ref-manual/variables.rst        | 41 +++++++++----------
 3 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/documentation/migration-guides/migration-5.1.rst b/documentati=
on/migration-guides/migration-5.1.rst
index 298ff3e250..f58de3156d 100644
--- a/documentation/migration-guides/migration-5.1.rst
+++ b/documentation/migration-guides/migration-5.1.rst
@@ -117,6 +117,12 @@ Removed variables
=20
 The following variables have been removed:
=20
+-  ``VOLATILE_LOG_DIR``: :term:`FILESYSTEM_PERMS_TABLES` is now used inste=
ad.
+   By default, ``FILESYSTEM_PERMS_TABLES`` now contains the value
+   ``files/fs-perms-volatile-log.txt``, which means that volatile log is
+   enabled. Users can disable the volatile log by removing the value
+   ``files/fs-perms-volatile-log.txt`` from ``FILESYSTEM_PERMS_TABLES``.
+
 .. _migration-5.1-removed-recipes:
=20
 Removed recipes
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manu=
al/features.rst
index b2ba731bb2..6e52dfce17 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -327,8 +327,9 @@ The image features available for all images are:
=20
    .. note::
=20
-      To make the ``/var/log`` directory on the target persistent, use the
-      :term:`VOLATILE_LOG_DIR` variable by setting it to "no".
+      To make the ``/var/log`` directory on the target persistent, remove =
the
+      ``files/fs-perms-volatile-log.txt`` value from
+      :term:`FILESYSTEM_PERMS_TABLES`.
=20
 -  *ptest-pkgs:* Installs ptest packages for all ptest-enabled recipes.
=20
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 32c9e7407d..37007aa202 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -13,7 +13,7 @@ system and gives an overview of their function and conten=
ts.
 :term:`K <KARCH>` :term:`L <LABELS>` :term:`M <MACHINE>`
 :term:`N <NATIVELSBSTRING>` :term:`O <OBJCOPY>` :term:`P`
 :term:`R <RANLIB>` :term:`S` :term:`T`
-:term:`U <UBOOT_CONFIG>` :term:`V <VOLATILE_LOG_DIR>`
+:term:`U <UBOOT_CONFIG>` :term:`V <VIRTUAL-RUNTIME>`
 :term:`W <WARN_QA>` :term:`X <XSERVER>`
=20
 .. glossary::
@@ -2988,26 +2988,31 @@ system and gives an overview of their function and =
contents.
       :ref:`ref-tasks-patch` task as well.
=20
    :term:`FILESYSTEM_PERMS_TABLES`
-      Allows you to define your own file permissions settings table as par=
t
+      Allows you to define your own file permissions settings tables as pa=
rt
       of your configuration for the packaging process. For example, suppos=
e
       you need a consistent set of custom permissions for a set of groups
       and users across an entire work project. It is best to do this in th=
e
       packages themselves but this is not always possible.
=20
-      By default, the OpenEmbedded build system uses the ``fs-perms.txt``,
-      which is located in the ``meta/files`` folder in the :term:`Source D=
irectory`.
-      If you create your own file
-      permissions setting table, you should place it in your layer or the
-      distro's layer.
+      By default, the OpenEmbedded build system uses the ``fs-perms.txt`` =
and
+      ``fs-perms-volatile-log.txt`` which are located in the ``meta/files`=
`
+      folder in the :term:`Source Directory`. If you create your own permi=
ssion
+      setting table files, you should place those in your layer.
=20
-      You define the :term:`FILESYSTEM_PERMS_TABLES` variable in the
-      ``conf/local.conf`` file, which is found in the :term:`Build Directo=
ry`,
-      to point to your custom ``fs-perms.txt``. You can specify more than =
a
-      single file permissions setting table. The paths you specify to thes=
e
-      files must be defined within the :term:`BBPATH` variable.
+      You can override the value of :term:`FILESYSTEM_PERMS_TABLES` variab=
le
+      in the ``conf/local.conf`` file, which is found in the
+      :term:`Build Directory`, to point to your custom permission table fi=
les.
+      You can specify one or more file permissions setting tables. The pat=
hs
+      that you specify to these files must be defined within the :term:`BB=
PATH`
+      variable.
+
+      In order to disable the volatile log, which is enabled by default, o=
ne
+      can remove the ``files/fs-perms-volatile-log.txt`` value from
+      ``FILESYSTEM_PERMS_TABLES``.
=20
-      For guidance on how to create your own file permissions settings
-      table file, examine the existing ``fs-perms.txt``.
+      For guidance on how to define your own file permissions settings
+      tables, examine the existing ``fs-perms.txt`` and
+      ``fs-perms-volatile-log.txt`` files.
=20
    :term:`FIT_ADDRESS_CELLS`
       Specifies the value of the ``#address-cells`` value for the
@@ -9983,14 +9988,6 @@ system and gives an overview of their function and c=
ontents.
=20
          PACKAGE_INSTALL =3D "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-=
utils} base-passwd"
=20
-   :term:`VOLATILE_LOG_DIR`
-      Specifies the persistence of the target's ``/var/log`` directory,
-      which is used to house postinstall target log files.
-
-      By default, :term:`VOLATILE_LOG_DIR` is set to "yes", which means th=
e
-      file is not persistent. You can override this setting by setting the
-      variable to "no" to make the log directory persistent.
-
    :term:`VOLATILE_TMP_DIR`
       Specifies the persistence of the target's ``/tmp`` directory.
=20
--=20
2.39.2


