Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C187BD1AD4E
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 11:55:26 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.110])
 by mx.groups.io with SMTP id smtpd.web11.21241.1729079719797648540
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 04:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=kn+L7Fde;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.20.110, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKPr7lf5osg+nIAkQISNOPb12MJCW4xIQ5GOT1tZDzLH4gmE0iYyQFW56PaWaoYv5fIm+YDfc5LpV8+l8k8yv9cs+gT0YspECTBxGFo4BZFUUz7By81A1FdDs1wvm07+VmTlbTmeH0TQ4FgZyLKALKHqk3U2TYmNQTOvRCUszq4zPg1nVc5yOjGwuZJp8SGWiaTaRvQ/PX5FHjQ6jJtoS9tzw9ATV6SJbuNv+8JIg5UOG11VfGHTzviEo/zBlfxmA8Uf8Go29GJcwsIIWfPIZsxpZ57kMTL+UqYwaoy3J0SGQVp0SBi5jL2PMHI1lQCRy/XMtfM+ZUkpNt3N/c0+jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kdz1vvcgzRBBSJKz21Y34+ukwh6wBIgYF5iYRokbXVU=;
 b=j+tyCOOjeZquEHKsKo0L3AqQ7ukUKQUkOR5twt5NhAarFq/L7d4t6Oc6IHYV/Ycx3p3gR0RYQ/t4g3r2mbTLppz9i7oak+BX4KmYr+XqpN/2yd7tnc5+/NAQIdnc+s/FuQQjlDyLz0NTKBLWVYoGHjx2Rt+mjQp7682B/piy8smsCjbfjC5G6O1najEpKNBJTHjeLBoorHOiR5/SpyrjKP+yP0JDp9MxpLCM9EJy2A343kNIAIe53casg9jQDaQQHWSVuQR5uvekAPDITcXNB6/ujnOPFQde9p/B2nB2h7+svurOtBgk2rPVmb/T7tP9LOWsMqhrohx4z/xxIv1lxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kdz1vvcgzRBBSJKz21Y34+ukwh6wBIgYF5iYRokbXVU=;
 b=kn+L7Fde/4DZdJ2XKOzG7HaYvc/3f1f2Gq1OeB9k7CZPQueen3sLGfN8ST5PdJzNfgVOtee4ohfknFY6+ibj565wJKCiwsvyH3SHFnt97MQkq6zrzUINzhGJleURW025oClBd3Cm/0cyOPVVr0cSFCkVmZazphA81nEFnJqIk1k8v8ey/7PlQQst0+lFZRaJ8ARyvxArkZXaR71NSaJShp/KqWR8lkGz0tMfmTiXfFLXj4KdbJWZXQhNZ1ncuWiR8X2udPmwRSeuVuJYPhrxzChHCALmdywx7wKmd8YM05Esz+CU/q/2ZHVcRDT5RcHes26Lply5zGS7cI8cBnpq9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM9PR06MB7955.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 11:55:16 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 11:55:16 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: docs@lists.yoctoproject.org
CC: quentin.schulz@cherry.de,
	antonin.godard@bootlin.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCHv4 2/2] docs: Replace VOLATILE_TMP_DIR with FILESYSTEM_PERMS_TABLES
Date: Wed, 16 Oct 2024 11:54:43 +0000
Message-ID: <20241016115443.2751525-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241016115443.2751525-1-niko.mauno@vaisala.com>
References: <20241016115443.2751525-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM8P251CA0023.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::28) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM9PR06MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 02353df3-a31b-4989-7d42-08dcedd96669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TLTAJufcY6qBM/T22PCj7tNdPa78GoCN5BeeTex8O2WOH2A3RJZ9CLCvvEfJ?=
 =?us-ascii?Q?1BIPLlmZzFDsDtEcZHOALRkS1/h2aHJd14o5+TNLdi/83+yTVzHifuNALf4H?=
 =?us-ascii?Q?QG+vVBurNhyfMdZbhx8rec4uaImYLzBiOg/IDeROGCuwtZNC5UJyfyaEd5Wp?=
 =?us-ascii?Q?+PT641ZcARTHVyNL6+ecgLyYH8SE1jATIcCnfK3lzyl6NmVUAqJrqwgNzXXX?=
 =?us-ascii?Q?vdiVaibc4QkJBsCzrt9LNcc1GdL53LSzn1EXUz5rUBctsWPuwDvtBa15VggR?=
 =?us-ascii?Q?TLn35en9vyk2W2a4GZj4WbnaPQeCxLxcIKSYMs0EExEOhBRBWRRHdG0htXZE?=
 =?us-ascii?Q?zeeMaJAFDTRoa8Wdr8kvFm3eHmLz7cV8aDsS3+4xVQiomeq9dSzNwcnBM/xg?=
 =?us-ascii?Q?is5RiOvnkm2evF5bbQWvCFx9GPwWU+okBSTN7Kka7RiqtUFVtjEVZ2at5/ge?=
 =?us-ascii?Q?2RZ08FULlfHBHCa+AfVJ47CBud+gTf7VsGb+V7zXqM9JyTCMx5R2hrO7a+fK?=
 =?us-ascii?Q?xIp16UNDV9ueWYdmLT/W97EybICOm3Dl+mA1Vl8AiejuEecTm9YaSI49+fNb?=
 =?us-ascii?Q?fCKQ25Xval28vRvJsl+GroWkUoej2jgvVH6sxRtbB7Fa99Jg21orb8niJVDB?=
 =?us-ascii?Q?yAFg1k+fbI8qOvpWO77dsjfvDwmx5jgoGXnAyeAULpq7Gd9DQZMzmDZ10pH4?=
 =?us-ascii?Q?RCggnJson/ERfAh6hqRv4Hvvjn+VQ9ebgIbihjmfgWZu+ThpVlm6k8nc7xkX?=
 =?us-ascii?Q?HQ1CUulLZM3cywZBPdfaSGljveGwwaqHTpuqrKXbHVNeKgY3UJYlchmOz1Xi?=
 =?us-ascii?Q?ekiFfD+XDLlpagFy9HH3U+W8Qn0PAWcIw66jtYOAxCsIZFfmG189SAuu09el?=
 =?us-ascii?Q?QxTxvDmY7OkZWCI+kZRBel6qeOqruOw53MoD6VmIXDbRW8OVwZ1apxI9ESt7?=
 =?us-ascii?Q?AB5MQwXsRfzisRtaIZ/aTOhX2Nt9oeh0wfqLmnSDvqSlCHjYP8ssKzKZn9LV?=
 =?us-ascii?Q?o5Wke2LowazIjFETndv2yUY98VFEXbGYoc4wAwzFwg6Erp5R2R3754sJnn+C?=
 =?us-ascii?Q?FDg3PgFOD9oQ6dBdmWsl7nhiq1zCjRwtmJGZfjGkB0zWhNWcVyIZwTKnaWdH?=
 =?us-ascii?Q?VcV+K/3GKcUxGfMdDiGBYojd5BWd9v5yU70pKqHZEJf7Yfy0VtOaOACrFv5I?=
 =?us-ascii?Q?xeqt346p7m5FdaL7e1HDSV15Jo4K6ayFMe3NaAlrJxdwRmOZNDyGPTIb2zd1?=
 =?us-ascii?Q?mUMBLMMBgap0qa5AkfEeYGlt2YgWDkF3326c4Th1Bw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ebL6m2Q2ZjCIGiOgfR9b63VPMcp1+zIUt4wF3PP1VLDoMN9J51OGbVtlnYHC?=
 =?us-ascii?Q?Fd8s2ADDB2V4vAvZCyvhu1RQ1/caeaakMREUYLYsMBP+LAPjGqjW+dk/b6j9?=
 =?us-ascii?Q?bCjuofACbETt+OG35BDugQQYVy7VSGRrAnzGqN6A+QV6ECNao1MFK8fC3cDv?=
 =?us-ascii?Q?JtetBpb4QZ8isUEpep2pr9j+Qnue0Nm+7P5ewN6mNB2xOgX5vLmhbztI2b9F?=
 =?us-ascii?Q?iIrl2gDxi5sTi1I5XLQZlQPIVsKlnyjG7Fua8Sk1n6YaXHm8MpZi8YEIf5mC?=
 =?us-ascii?Q?e6W5lkCFC5rwsCtLRHSgGZ1ASNxvzi0Vgbj4dvG0oDfae87JB4z/f0qhvsRY?=
 =?us-ascii?Q?KMAAx+ZujOBvUGeYziSTVNYOyWtgVexIpwBmBWnpWEC7RHiGjwbMkY+2ltZ2?=
 =?us-ascii?Q?tQpllfntQq/AIm0lEieuf6xA4y48UBOzYUzqHrNY+RiCQ8sY9C3Cc/NRyNG3?=
 =?us-ascii?Q?B80uU3P/fXz7jcflwp1Wdk9KMKFknCSvzvWI1Je4CG8TbC5NyUL30ayjXhfR?=
 =?us-ascii?Q?/aX+aJlkevkB6sl66A8hZHPXT3CJjj2LDeA87R/R0H/3gzF4bdK/kwxSddJz?=
 =?us-ascii?Q?uPr81eNGEOTeLUhil6T2S96LFzKZ/dy08KgdSJIiD+axDB7doNo0/sYLf+q7?=
 =?us-ascii?Q?zd3q3Z4e7a0NVBNvihRDo6A01O/Q7BZLX+cV5b1yq/8I/08o8sULwoKXzN8S?=
 =?us-ascii?Q?mxdLonsHOB/yvRqOxbXHee+46EMMMLZ4zxnmYw1oieUPZezfo81GU1jaAWxB?=
 =?us-ascii?Q?ZTx64XCZbiHjZwt/dNK8bndiM4wSj7BNILL+NOCB1xN+v/5lq10323apJqDC?=
 =?us-ascii?Q?sispQ/JsBquGHqu0mIupgnIKkNdoC8w24xfz1Q/+z+/f+BTrIeM0WKWOKfx9?=
 =?us-ascii?Q?L6zF4B2eh/W2fCnewAdyi2SVgvHwlV+rPySJvmyYhfEhG4R4kIBIRe9n/MfT?=
 =?us-ascii?Q?lQ+yaD2yRxdx0lMevzmzsUVs1caZmPBLNCpGHpItC1eWit/FlSQDFQb0+1EK?=
 =?us-ascii?Q?IpQxkXP6gJUbC7n7gSZ3/bxouXoV+6Q8huM17M0rxQjcedVgia3EbtUr/eqs?=
 =?us-ascii?Q?/y7NtUhNHA/wApSaMKfkYicD0hdzY4Z807BPEX6j945cCtFJ/ExBwufVcyZn?=
 =?us-ascii?Q?MxFpp5e+pFrLI3ACEmXeKZhWv0aLQri1lhyK6v0YMjwykpxMvyBmoMB6CTt5?=
 =?us-ascii?Q?bBLivZl0c5syZS3jYtoo+nNSBpA1F+qXyqc6B0p/xS3J2G7sjwvR6eOIkywu?=
 =?us-ascii?Q?HI6tZx3LUXZ8lq5Fsi8hPuBdx8XgugASyCnjcmaTgBv6LGuFjORLdQl0A7VJ?=
 =?us-ascii?Q?S80BtsJk31uSfCVGKSamOytWcze40AFZHQsdg9F8nFDBH46lknS0YWs06pBG?=
 =?us-ascii?Q?FjlmzeKTKK6YNgBXbk8z8jrdRIzIBjy2cHpOY7m4shu6FbHRsEhPe6wPOCzt?=
 =?us-ascii?Q?x5KrVb+6Flb4sBLk2qLLdQYxhdl5oeqWPyks5maquWHPRhL6k4tNm66M4B9L?=
 =?us-ascii?Q?7tmijlomE63q29X8PSmnIccXBUuAIp3XwoYbQXFpGROLgi0RSTKF4qdi8M2Q?=
 =?us-ascii?Q?5S2eTvNJdUKNmmoIdIAKdoLkE91I3/WuEpopGR1SuxWnNqOAO59QWLeuuTNj?=
 =?us-ascii?Q?mw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02353df3-a31b-4989-7d42-08dcedd96669
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 11:55:16.2515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cAWNoksB+ukadVN38ALKbJu8N6RJEN5oSZZGbZquMGfDuMCiKdr4Jy6DCl/fUson27XdwygSrEkmJq0Bsi/2lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7955
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 11:55:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5503

The VOLATILE_TMP_DIR variable was removed and it's functionality
replaced with a FILESYSTEM_PERMS_TABLES entry in
https://git.yoctoproject.org/poky/commit/?id=3D2f46b6f27dfa3a9d5ad177900fce=
cfe64c3536f1
("bitbake.conf: drop VOLATILE_TMP_DIR, use FILESYSTEM_PERMS_TABLES instead"=
)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../migration-guides/migration-5.1.rst        |  6 ++++
 .../migration-guides/release-notes-4.2.rst    |  2 +-
 documentation/ref-manual/variables.rst        | 28 ++++++-------------
 3 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/documentation/migration-guides/migration-5.1.rst b/documentati=
on/migration-guides/migration-5.1.rst
index f58de3156d..b2e2ccb5c6 100644
--- a/documentation/migration-guides/migration-5.1.rst
+++ b/documentation/migration-guides/migration-5.1.rst
@@ -123,6 +123,12 @@ The following variables have been removed:
    enabled. Users can disable the volatile log by removing the value
    ``files/fs-perms-volatile-log.txt`` from ``FILESYSTEM_PERMS_TABLES``.
=20
+-  ``VOLATILE_TMP_DIR``: :term:`FILESYSTEM_PERMS_TABLES` is now used inste=
ad.
+   By default, ``FILESYSTEM_PERMS_TABLES`` now contains the value
+   ``files/fs-perms-volatile-tmp.txt``, which means that volatile tmp is
+   enabled. Users can disable the volatile tmp by removing the value
+   ``files/fs-perms-volatile-tmp.txt`` from ``FILESYSTEM_PERMS_TABLES``.
+
 .. _migration-5.1-removed-recipes:
=20
 Removed recipes
diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documen=
tation/migration-guides/release-notes-4.2.rst
index 30049b89f6..ac3bb9cebe 100644
--- a/documentation/migration-guides/release-notes-4.2.rst
+++ b/documentation/migration-guides/release-notes-4.2.rst
@@ -38,7 +38,7 @@ New Features / Enhancements in 4.2
=20
 -  New variables:
=20
-   -  :term:`VOLATILE_TMP_DIR` allows to specify
+   -  VOLATILE_TMP_DIR allows to specify
       whether ``/tmp`` should be on persistent storage
       or in RAM.
=20
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 37007aa202..65d5fb86fc 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2994,10 +2994,11 @@ system and gives an overview of their function and =
contents.
       and users across an entire work project. It is best to do this in th=
e
       packages themselves but this is not always possible.
=20
-      By default, the OpenEmbedded build system uses the ``fs-perms.txt`` =
and
-      ``fs-perms-volatile-log.txt`` which are located in the ``meta/files`=
`
-      folder in the :term:`Source Directory`. If you create your own permi=
ssion
-      setting table files, you should place those in your layer.
+      By default, the OpenEmbedded build system uses the ``fs-perms.txt``,
+      ``fs-perms-volatile-log.txt`` and ``fs-perms-volatile-tmp.txt`` whic=
h are
+      located in the ``meta/files`` folder in the :term:`Source Directory`=
. If
+      you create your own permission setting table files, you should place
+      those in your layer.
=20
       You can override the value of :term:`FILESYSTEM_PERMS_TABLES` variab=
le
       in the ``conf/local.conf`` file, which is found in the
@@ -3008,11 +3009,12 @@ system and gives an overview of their function and =
contents.
=20
       In order to disable the volatile log, which is enabled by default, o=
ne
       can remove the ``files/fs-perms-volatile-log.txt`` value from
-      ``FILESYSTEM_PERMS_TABLES``.
+      ``FILESYSTEM_PERMS_TABLES``. Similarly, in order to disable the vola=
tile
+      tmp, one can remove the ``files/fs-perms-volatile-tmp.txt`` value.
=20
       For guidance on how to define your own file permissions settings
-      tables, examine the existing ``fs-perms.txt`` and
-      ``fs-perms-volatile-log.txt`` files.
+      tables, examine the existing ``fs-perms.txt``,
+      ``fs-perms-volatile-log.txt`` and ``fs-perms-volatile-tmp.txt`` file=
s.
=20
    :term:`FIT_ADDRESS_CELLS`
       Specifies the value of the ``#address-cells`` value for the
@@ -9988,18 +9990,6 @@ system and gives an overview of their function and c=
ontents.
=20
          PACKAGE_INSTALL =3D "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-=
utils} base-passwd"
=20
-   :term:`VOLATILE_TMP_DIR`
-      Specifies the persistence of the target's ``/tmp`` directory.
-
-      By default, :term:`VOLATILE_TMP_DIR` is set to "yes", in which case
-      ``/tmp`` links to a directory which resides in RAM in a ``tmpfs``
-      filesystem.
-
-      If instead, you want the ``/tmp`` directory to be persistent, set th=
e
-      variable to "no" to make it a regular directory in the root filesyst=
em.
-
-      This supports both sysvinit and systemd based systems.
-
    :term:`WARN_QA`
       Specifies the quality assurance checks whose failures are reported a=
s
       warnings by the OpenEmbedded build system. You set this variable in
--=20
2.39.2


