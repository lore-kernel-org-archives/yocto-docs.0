Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D199AD1D889
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 16:08:19 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.117])
 by mx.groups.io with SMTP id smtpd.web11.685.1729008491090319796
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Oct 2024 09:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=ARWHxby+;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.117, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Enx+R9aSexzz1DSX5t9d3JATrTyKp9CK8fKkW+MJTts4yWKt1L69f9NBPyeOPFug29eLS1T6p7xjmQZf780dzHZqIsCEcCmYIkimSqh0fB8RXB1OtYq0B0/7DHIaT1CQpZ71QSC6gqytAhzolt93SCc7Hbt88VOKSktTLKqwKlAmVhLLjSFtUNjFZNDrTZn1/qKVUUfoJcxKts4nHZcarJhNPbPJVipNXLzydCqJTatyhyyze1fPsFqBXWHpbwP+iOgNZn4E3wKk4hAMTKNA5fU9fA1ZKt2Qk/PIkUIbAkbTmAAle3cw+Qu0XLqaAwEfwnB8ZYVlOyJWdtGKfRHxgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0WU3BCTt6lG929eKMedZv8JVEiNV0xRjPgd7vaFeCk=;
 b=vpHe1BnBk1WF6uOTiUMdljkdEp9zQaIqNBbIiq1JzJlyal49HFNTfjjCVv41trDkemTY1J2It2jWwuTB6Qw9N5QDbip5hqpbSmS7NraVxikfWmro/6fuykgekuP1CKd1sL3i0WZxhTQN36+jXBMxrjpaKFkHF9kZt4VHYGl+OShN1Z6F5tAnR9iS/418i5vDqsKIUttQw2mcCydjORvC/OMiDMcyfend78Fo0ZF11nG45SKxs2QnbEfUiJoPDipQIVzN6vxOpFQe1ByxqO8DsID9VTYdCfoeHYAqVU6vMx//SaBcFG011S0U9Sgoo3otadFhBi1eBAZqhBczD+SARA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0WU3BCTt6lG929eKMedZv8JVEiNV0xRjPgd7vaFeCk=;
 b=ARWHxby+F/ZW6qHsv/IVGS1NZBFs36DAOftOOAF1lPNkc+QNLlHP7PSehlEhreGvyApSJs/QZ0Q3rHXHNA/SvfgEH6aqWEvif4RPQP1NYFKT5vbCWAVOvH9Oe2a8yIXfA3onKg/hHvvvoVZZV86IF6M4ZOLhjrIisdMxVHvPJq+wFGydYOiZPFrCLAojT5ppLVmwWZSc3UpwAVorxHymCBifk2LIisSbETrHyLjqKpzI2/c/uD1x0ce7UxZYaQyRXSHT3s0lBpt0yGZTnrgWEbZDmFsSLgK0+GnqDB3M/eyIZIYodjqd7swjdxG9bQMbOvthncNcH/Rg9JQ1AZtJnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI0PR06MB9207.eurprd06.prod.outlook.com (2603:10a6:800:245::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 16:08:03 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 16:08:03 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: docs@lists.yoctoproject.org
CC: quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCHv2 1/2] docs: Replace VOLATILE_LOG_DIR with FILESYSTEM_PERMS_TABLES
Date: Tue, 15 Oct 2024 16:07:34 +0000
Message-ID: <20241015160735.3066914-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003848.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:6) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI0PR06MB9207:EE_
X-MS-Office365-Filtering-Correlation-Id: 023f9779-a7f0-4862-e635-08dced338c1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DQgLuOfCNdkkCvbxp/I8lxkOFA6baLonbEo9NBM5pDspfRE1wukWJUFP2MeB?=
 =?us-ascii?Q?ahCtV6e89xZ9iRlmI0f5rPLTXSImudKgvmvY8lnLNJS66NsewBaDzkz8q6Bi?=
 =?us-ascii?Q?QgwKlwQH9YtiBj068ycFGxgxzbllMGjpLAG4NhvBbptHOS+pR99RelVbpr+u?=
 =?us-ascii?Q?Iu2jm/s3x9ivskYD3ytFCfLa7Wzh9FXHHxg4jBaHYnx4TAju6Pd0K9gIDdcR?=
 =?us-ascii?Q?/CTy0O/PhBsCiwGc4cmCSeinkg4OHygeNnSTDVMHlfyTB2i62tbszrt5C6Bh?=
 =?us-ascii?Q?NHaIDvCXZmWrOjyuR/4kBrzVcJdw1Mniq46La1QzoyS6tXz5oY6bkI8Ezsk6?=
 =?us-ascii?Q?h2xdxm8IG/cZAPdeBlZ5hsw35n+gsAFji1D8BdzMZDDc7NcPt99epCFFKJuI?=
 =?us-ascii?Q?inaMR/0A//j7DFc1uzenOc5PhIjWsuq3IUMMAsZAI0snXIJpyGAqa/r+zRQy?=
 =?us-ascii?Q?93zJkmVl2/t30MFhrW9YlwgseHNJwtkrwimpAtTwqyTOh0JfWcpWetqnu55K?=
 =?us-ascii?Q?ONxna9ybY4BwDhaFtrmOEC+NUa+eoGexRBmiRBwOEl7dTSn0ikLKVcJTVo24?=
 =?us-ascii?Q?Qn3GxcwMxDWq3boJson230aYVakAoiFCp0jjldrixl83VEJ05t0S/8aV+9i2?=
 =?us-ascii?Q?tcG9xfDDRswv7foSSBRvjj0SLkHza3ft/Dxv1TDCw3WqS9gwIpMMNHpnAiT9?=
 =?us-ascii?Q?L50lqdc1cHb1yZHmBoopAbD4Pc5Cs8Hf2hrQyBm9aFzFBpbvxWTrplN9KN6u?=
 =?us-ascii?Q?QSPAlW/A91KVDOZENpZgbMI0Uu/Hg0YOLbDbQdZMiUBnEaMO6+1XFoN5ZzbO?=
 =?us-ascii?Q?XoWd9a9/JMnxS1Kuq2sZnKP1lQwZBqEwj8MTVaaWhhHRmZlJKwfQR2KqDyPI?=
 =?us-ascii?Q?1+xK4hIq0mrPePFy/UDffB3RULxIfHsOCRYIbR1bg/BFmzkwbFjrImbp9bNY?=
 =?us-ascii?Q?rmtVYZ1r7UmEcns2p2OiZ/ejfv1FsDXjpngWarNQX8oC1Z2qf18VhVEQ/3yr?=
 =?us-ascii?Q?rL0Iuxm2CobMfd6KbCGSLPB8S5egXfDnKeEn251X3x/q8PUauGaqOP7eT3Pf?=
 =?us-ascii?Q?1B5HwlPXJNFa75QXmjJANT8OOX+OzXgrdFWc+LPYpqKhbQUcIttZofPs8e80?=
 =?us-ascii?Q?T/1245cS9RAXC06pzXJ7/KDax4smczH3iEpr8qU1r5GHblK6BL/r9EqdshPA?=
 =?us-ascii?Q?37gwf7PxTRqgkny8YtCgni3Jb9scZMe5d2Yk44z3T0tNOxbgo3XkvHJ2lYzE?=
 =?us-ascii?Q?qPMp6bO4iPqnVIwZGOeiLxi4Etj0gFu19piYmASBzw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Z+uysn0IHFrnu0O7NwgSC89U13c/zUDEhcFALsx1bFKYut9GmAuDlxZ71oGS?=
 =?us-ascii?Q?8eXivnj07l+8VEc8aDdQQ6TRvXTRxaUaRP/pKDUFWYOvVVpf7j+H+DcyIynD?=
 =?us-ascii?Q?rIPURQrbufrQrHESPoD65nISK3abo5f+lO8WOpU/wfEV1AnS8pglB4HcI7MT?=
 =?us-ascii?Q?k8C8LTBn9xRItKvmcL6eRp7Fgr01yfLqpyKeAHTCXX6URfxkRsG1K4sV/xMQ?=
 =?us-ascii?Q?BKx2qYjpuffiZJjNwqJ762xyzevOAhZbGVzXDxT6rXzgNfCb8/x1TSW7ku/m?=
 =?us-ascii?Q?AAOmXhmQXvnIPgv9dIftHW3mjUSn2/J6NlslWa7s9rW9VKNff4VYHWuJ8Uz5?=
 =?us-ascii?Q?p/lKBzoE+mNGXL4qsD0rQQ8xrFN8AEKCs954gSUNY0vmaw0CIPvam3qmxY8L?=
 =?us-ascii?Q?wZg+r68Wa9XTdWD0cuS2cQ9JslzVVp1qxbKA2FoE0fY/eqQxWby2j0AcT80J?=
 =?us-ascii?Q?tjPwYmquP6p3Xw6V45U6+7Spf0qb8QjtGYxKirOQHMLVMd+1FExrPUH4YuBi?=
 =?us-ascii?Q?AJI4ZpK5fDdz8AoNMFcSDk0Qu/GwLRo3K0KSfW3msE4DsEG4pJtNRujbafkb?=
 =?us-ascii?Q?pSeqqs11GhhxPvWe5Qr0s9dBc+16Of4FioXoJcBLimzHkyVDtcjEHQSMgV2u?=
 =?us-ascii?Q?3beYQFPjsnTW4t0+jIKMV1x4fX5I9FbIV9OaxE6bRLK3TZ7JFF45ZKook0xb?=
 =?us-ascii?Q?4YlqDfImO/5pfQ7entRuGpalIf7cED6UFfDcCVYVAxPiOu4m1gaZLfrqn2eZ?=
 =?us-ascii?Q?M1BCnYaEhSwAaVycraiAm8mQ776v5iIUeZY0TULTgckG/Wz2S0+zcXEKs91c?=
 =?us-ascii?Q?wnF9GC7OrsxN/teJzWGwWthj3dL+4s8HvNcWGSIuXgzUcHpTCwCrDrVOulOI?=
 =?us-ascii?Q?ljoRXYDHLcFLCV4zLd3Up7ujSZLC6Yiq9AnM3jOotx3qXYmX+A7YwiJpxX4z?=
 =?us-ascii?Q?xK2ciZSnw80BgFKscRsm8r9yMUiF6Jo6djg3/YvhD9HLV3oXADTpbuYyj8OF?=
 =?us-ascii?Q?m9b3WJ6rzC5MkoniXJzuUupOr+fRWAc+WYSlT54MwM3B6651XW0l2wW2+xBE?=
 =?us-ascii?Q?fFBRx0ICW4M5Re4CnL9pcih8mr/3r3Ptq61St7oL6bwgsR/uUJdyn070MHuq?=
 =?us-ascii?Q?ktqIHGT96uz2Fzo/ofBgY90ySO2xcm3ijSEzLoK/ief0VAn4hbkq8rwcOUQJ?=
 =?us-ascii?Q?fKrt+jLfnuEV4S3wC42yqzIU8wvq9CWLrQ9WZzDzMgnQkjlKczZ96BuKIW9q?=
 =?us-ascii?Q?L2vjPP6nHkPYaowHl2cjKk0xUN/HFGyVrsV1DxMzsjDtlhAS+uObnQq7FnEj?=
 =?us-ascii?Q?SjNx1z7GhXN2mitJUdOpD7WbJr8iLnGxpOmMXG497W/8MRhQ99UsibsoYVbB?=
 =?us-ascii?Q?gilTkkhmQULMhKgfQzLfyaybbt77tgKY3k4JBi4Yu6loHEJqdMuklKWN2fVO?=
 =?us-ascii?Q?2GwQLq7ecckB2l5aVdz8kwehEo5/36wRK4F1FHrlwjYGDQcQvzGp3s19rJfN?=
 =?us-ascii?Q?Mj1GnU2DHSmFXDoFIq0Fw7PJGrWMMnTOLTxr/jKbIZ/ngCp9tL6RnmYFI7b1?=
 =?us-ascii?Q?Z3Cooe3cJjGf0yI3BTO6LyKqVlPiNb2TBEoX+09Eyd5yxbr9GF3l+zkEos6v?=
 =?us-ascii?Q?rQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023f9779-a7f0-4862-e635-08dced338c1d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 16:08:03.0435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eVV+/+lFAuX3b5EP0UCuaPNbV/cqmxnaIw3uv+Grw0lJFCs3uUPLluodK7rZXCdh4pKWTKMrItt+3MhmiRyCpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9207
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Oct 2024 16:08:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5491

The VOLATILE_LOG_DIR variable was removed and it's functionality
replaced with a FILESYSTEM_PERMS_TABLES entry in
https://git.yoctoproject.org/poky/commit/?id=3D2f8806deb7655b37d6f8d12ff546=
80d6acf7a298
("bitbake.conf: drop VOLATILE_LOG_DIR, use FILESYSTEM_PERMS_TABLES instead"=
)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../migration-guides/migration-5.1.rst        |  6 +++
 documentation/ref-manual/features.rst         |  5 ---
 documentation/ref-manual/variables.rst        | 38 +++++++++----------
 3 files changed, 24 insertions(+), 25 deletions(-)

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
index b2ba731bb2..84ebfa81ae 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -325,11 +325,6 @@ The image features available for all images are:
    the ``/var/log/postinstall.log`` file on first boot of the image on
    the target system.
=20
-   .. note::
-
-      To make the ``/var/log`` directory on the target persistent, use the
-      :term:`VOLATILE_LOG_DIR` variable by setting it to "no".
-
 -  *ptest-pkgs:* Installs ptest packages for all ptest-enabled recipes.
=20
 -  *read-only-rootfs:* Creates an image whose root filesystem is
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 32c9e7407d..62a225ed1b 100644
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
@@ -2988,26 +2988,32 @@ system and gives an overview of their function and =
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
+      By default, the OpenEmbedded build system uses the ``fs-perms.txt`` =
and
+      ``fs-perms-volatile-log.txt`` which are located in the ``meta/files`=
`
+      folder in the :term:`Source Directory`. If you create your own file
+      permission setting tables, you should place those in your layer or t=
he
       distro's layer.
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
       For guidance on how to create your own file permissions settings
-      table file, examine the existing ``fs-perms.txt``.
+      table files, examine the existing ``fs-perms.txt`` and
+      ``fs-perms-volatile-log.txt``.
=20
    :term:`FIT_ADDRESS_CELLS`
       Specifies the value of the ``#address-cells`` value for the
@@ -9983,14 +9989,6 @@ system and gives an overview of their function and c=
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


