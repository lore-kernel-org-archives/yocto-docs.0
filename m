Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0883D1D887
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 16:08:19 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.117])
 by mx.groups.io with SMTP id smtpd.web11.685.1729008491090319796
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Oct 2024 09:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=FSMtacs2;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.117, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBike9A9nk0V9Hw8AEaF7h3j28VFvgDvH2IkeME/64rmFPwkhcl5PM8KnpCBWv3WKYDDaMKWD+oJrWvTjZkPQ5Ld5O69OgjC2XWHXmk/5JpeaKdVGdGhTZgDeat1Q13wGPX/tezZpmTZKe2jr2+jITbUo/sB9+2unExZJ77q2TkLvR7hti5ZfH+WdvTyEARBnLoZ4Dj1EgcwlhCWnZWA6laZOIkXGqKVf3hc/iRWZtmEbP30to4oKBE/yEo4sdaC0klxwHsoDzLP3j3H62CE9dhHAQMTZHDH8weRIaBcmWEMruueMxxa1Nje9lfZUAVvc0/T6GGLef+rk+h/EvE7Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzQ6eP46SuHzqHlH/1HHKFaJq3gePTrIKI+BZp51GTc=;
 b=KiaiQ8g1VZbv7MWjRUWLX24daN9msxJc3fijnRhoS9D1yCijWJmrhzDa6cb0Csd433peun5oDwhn+Hs4nHtr+A3JeHfUbMF67Svf0DDIMNtwPmrxvYAe/C8RDnpghT1sgzUTivWxHsskSV8JsrMi2ws0U/kD75STJKXsGVdO3oUvptJGAtDCpQF64ndFIQt3Lt6aGyfjTNNo7wHfXb6quFdr+XIBDL4povZ/H7dUSJmPRcu/jbmLqNR/RK7HUroihu+aH0bEAv/9SXBYuzxuSR4ptorrZIs16DV7U0OIlP0kVD+akIKrH4SmONBDd4Otq2aWZrGqhGcM3t64gKuLFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzQ6eP46SuHzqHlH/1HHKFaJq3gePTrIKI+BZp51GTc=;
 b=FSMtacs2ksF/Pu48JWQsE08pujGl5AQQnSEBDg2PAajpHLZOqR2Vs5Dh9Edjbv7gKgFMGa0X9ivtVhUMNL1Y68ZhFKl/cAvNhvX6krtT3N9SD9YP16l1nIz8BPHOujf1iSvarx74IQbKVM5MfIx4rKj7RyjEsMHXTpqe0x18ywKX3zO8i08HCarfdRvNantbQxZzLmmwtbKUZ5P1qxnDF1CVCsygQ2mj6C/TRd+Wg+Jm0tHdk0XtYfjpZBdF5H2Wf9+Dqe9HuKprmoYna97q5wKNidSdkyhDXuTBKtMednn4q6RK/9hIRA5gDfnh9bDu94yYw16bEYbCtMQD+ZLJew==
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
Subject: [PATCHv2 2/2] docs: Replace VOLATILE_TMP_DIR with FILESYSTEM_PERMS_TABLES
Date: Tue, 15 Oct 2024 16:07:35 +0000
Message-ID: <20241015160735.3066914-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241015160735.3066914-1-niko.mauno@vaisala.com>
References: <20241015160735.3066914-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003848.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:6) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI0PR06MB9207:EE_
X-MS-Office365-Filtering-Correlation-Id: db47a8a0-72f2-488d-3340-08dced338c54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?D6X8xCWWZnLnGOUUY5/py/3Kx/ggB99UFfhkGPDu3TFC3TucKiGb2/kQFJ4N?=
 =?us-ascii?Q?U2wt5LB4NM8Kk7uSksXt3r9Mkcqh2AP2NsOPUmhFDGs5HInGItooPtte1aw3?=
 =?us-ascii?Q?G7qgtg1g+DkQ7KvGfxOl2Ug7/YecLm46Gdv5eMLkFoI7ejKhXyKMmX5Y4z74?=
 =?us-ascii?Q?Qh4uATBbvlCU5r78hSjcheN+bkZbpnUUObrUhW3DtASrfacZbrCjT2DmBBjX?=
 =?us-ascii?Q?+8zmt91T2IA9o0Jau1coXWKKxFlnW5UFKfjoeGVBKxClZhRLFXKsvZ3Uzbfk?=
 =?us-ascii?Q?Z/YGElVwDKTcNYn81TTdSzRMopKovsQSlpEEt/SL4+M6D3aSok4dOJQCTeDu?=
 =?us-ascii?Q?aszHPb+AvLXAA+bZJFMMRwITFCy/OGrBgTY/C2wSlYv3aPB8Gxegu5EXMeKH?=
 =?us-ascii?Q?UnLoDo1e9LhMg2GvdaAsnxe7Es08aDWuqdUexIQ2/KaHZiZnvqE1mi+eDXsA?=
 =?us-ascii?Q?joqb9DDiRfZJRyu0f0oi+TeFetqOmh3MY18cX6TZppwbgxO7NRPV3SfIEMRE?=
 =?us-ascii?Q?INSHuFse3Dl6QkF+RsZMMfLda2Na10pVCW02ZI9lp3oMzYFesVgH83vD9olW?=
 =?us-ascii?Q?B/krJp4e4T3XA3LaVyjvlKvTOwBRvP7TBoQZMS279xeoLi4l+/lQuU0oDK7P?=
 =?us-ascii?Q?89W5jtVvoYJ9bhLZsOtx6reE45hGbhf9C0XeEcBCMmRWBMQHsVHKCnQ66rqT?=
 =?us-ascii?Q?5m6HDJdiev2iXG0PvcR56l7CM1u8/SZwL+GuQlmyFttFlAlduytYSM7n1UfR?=
 =?us-ascii?Q?mkoyBZfxoV4YLPgUOPoU46mEvmN9bYC44pnlAB8GvcUJEZJ+9XqEyvQLhYPr?=
 =?us-ascii?Q?BJWAXnxLviRKYL3+9wIJSfi7QxsccgdxkUaBoxGCyM5UhGTB++guftYBc/iQ?=
 =?us-ascii?Q?VUyCTDmFRqbck+PzfbTfAvDh57UnGdaWAhVU6NEYfNCfg3MSgcgy59GgH0lS?=
 =?us-ascii?Q?x2+V7x11D+ikYjUSy7QdMATmvWhTMa6TRGso13kgXQH9DBOcQe61XQ5e/AhX?=
 =?us-ascii?Q?n9JZyhdhfa+T6zGUEo0k7NZ29og6tzJla5MZ2kd1PVMHN2ccJyc03WRK23V4?=
 =?us-ascii?Q?nSR5lCP5L4ZNFWwX0wI9lBItWr9CWDILKonpzA2pMhpRsC4XQkV9ANY7TrTe?=
 =?us-ascii?Q?P0wGJqMdKWAmn0EVby5hbvcAY6jIY8E1GzxzcltCbXGpb4wSCvpYPR7+79Bh?=
 =?us-ascii?Q?3ZrkQBLwNFo1zUpQNPMqafS2eiqVPukwjflJe7fTiAQvslDs0A11o4+hY+mp?=
 =?us-ascii?Q?s4FI4uN53fuGp3JXvmdi2vAbUw1pOhwHTwKytVzPIg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9BSUirezmlRABn5/v+HrdNYstLLNCeUnFV3RUB2m5+OIt65Vp0h0nL8PfMb+?=
 =?us-ascii?Q?6RTrF6OortFNdZQpjsLfxsoqJQTC1YcKSiGZ+wgfmqhJGSTJmFWJNWnAfBSQ?=
 =?us-ascii?Q?WCnhnsV5+HWuabW3VLN4wNefB0y8pupLPH0tg4z3D2cXOlL3+Sf+BzFviRyL?=
 =?us-ascii?Q?a2gwrfbVW5CqRHN0d25Gm8N3QsVhouZyWVWFPFVMvJxZRBtDLjx/nAiJ7GkL?=
 =?us-ascii?Q?bJYj96SG5FXK8rPPXWvMuQ5RBSqGUf5zhyVRjgQvOTBZlGfpA7+A6lpjmoEN?=
 =?us-ascii?Q?WiBQMIcwkdBxUPkMcyaDTuvppgMdcGm/sj5Czrv2WyphLuXA/6aEAheeIdBd?=
 =?us-ascii?Q?cl1kkB3utddOQW/Tla7z5ec/PyvGa937FSQ+oFHMZa6yuFwI5cJSOqiYUsue?=
 =?us-ascii?Q?mQ7gVJkZIoSLFD66B2Tv4E849Ra/eQg1yPgaXQyBwlrnD/Z/syEnVDQCD8VA?=
 =?us-ascii?Q?nGCI0Ev/q/ajyTrQ5qOSWsoRP2iDYO0WCl4t1ondHZ0OBBqoultePQO6LFwu?=
 =?us-ascii?Q?jH6lPWgmnPyJHFIny4DmGf4+d9+z3Tis9jDIA+Zgij6CTbXf3oKveId+Hsjq?=
 =?us-ascii?Q?KJSGeY7pizH4Y0beerf5kMcWgXnsU7sYDLxV0OGEhUrpf1afXbPA1rbNe9K1?=
 =?us-ascii?Q?/ThBlG25pkLhGqA7Y8IpZUp56vKv1xKOma17yPShOanCl2h6mlq/yB28cRVO?=
 =?us-ascii?Q?1bJDdqJPJ3pdNGAZba7Cmfy8KsgXYcIWJvvzgpak6m0G5TRiiqP6WGE0qiPk?=
 =?us-ascii?Q?OSJV3PmIh+AeGn5sZpAhV8GUbrJpDWz4wKDCn/DSFVe5HsJPUIPGmxK6WiBD?=
 =?us-ascii?Q?IdxU0kZqepJomqKahRtvPDkGAiTkgvxLsBRnJ6aMPcOoMkCcib9HZkYj/wPG?=
 =?us-ascii?Q?F74WEWlojLZKMHe/HyO7Pmt3AlH4oNBs33Nbm3gGVV0Ja2vDZ6os3z4q4CxK?=
 =?us-ascii?Q?P2+5ZPGaBzZCiynIQsn6Qp4f57bXA98LG472IpGFOJkF9mLcQkCwoxrdSbj+?=
 =?us-ascii?Q?nF3sVnxRGMGaA5p8F1UE9V0YG6D7OtoaEgKEuGUiWc0v/6tWjmz0HbK1FirV?=
 =?us-ascii?Q?hy27v2XunjER6QW45jYEMrGFG16EzFUj1MweuEYJy5rZhonCeIImnErrxDt2?=
 =?us-ascii?Q?/kbms3gynPR6YJCegakbWkfBvivPgQq1yu6oIDD9VO5nxdr9ZYlfWbH47ed8?=
 =?us-ascii?Q?qUljMecEXe2eCxYNB1eq+CfuRQT9+u6JsMMSp31gR+eyob11I30MtqCHW8IW?=
 =?us-ascii?Q?i3PdgbXVkIMJX0rLv35Fd4UgZokrw/1GerzjBe//0irOVLAfryIp+TEWrOFt?=
 =?us-ascii?Q?apoBdZEik4/McSE57ihw7Bqq2yEh7s3p5ic00TYvnVx8yjewvqmj8p68enqg?=
 =?us-ascii?Q?xRi/EY01KF23idevJ4UJn+oERHa/U5mSb6EWaJ/sq0Xz+PhHdeqiwVAEGqHQ?=
 =?us-ascii?Q?/3K2EV8qgZxBy4r0KPDxpyoGNtj0ZIIsICoW87x0Q1sflvT5Vt9830RDgZaz?=
 =?us-ascii?Q?V7CFYyWVmlvZOOkeBmrH6tbKn+ikgjVQaD91zSCGzXgTehRcKlIsb+x3Ir/D?=
 =?us-ascii?Q?fWB6Or9Jqvth5S3NjgrL/m5SYWVtkT2cECidIHGBlxRvWPBi5Wr0AOXGIhsL?=
 =?us-ascii?Q?Ug=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db47a8a0-72f2-488d-3340-08dced338c54
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 16:08:03.4154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SGfEjcUynj7X0prxDJ+IX/4Gnr9wHxczz//ViaLkHEvXwZZ14EEirlRUsmy4E83nIakSLwC37Su/Kcm4wYdDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9207
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Oct 2024 16:08:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5490

The VOLATILE_TMP_DIR variable was removed and it's functionality
replaced with a FILESYSTEM_PERMS_TABLES entry in
https://git.yoctoproject.org/poky/commit/?id=3D2f46b6f27dfa3a9d5ad177900fce=
cfe64c3536f1
("bitbake.conf: drop VOLATILE_TMP_DIR, use FILESYSTEM_PERMS_TABLES instead"=
)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../migration-guides/migration-5.1.rst        |  5 ++++
 .../migration-guides/release-notes-4.2.rst    |  2 +-
 documentation/ref-manual/variables.rst        | 29 ++++++-------------
 3 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/documentation/migration-guides/migration-5.1.rst b/documentati=
on/migration-guides/migration-5.1.rst
index f58de3156d..64944b99cd 100644
--- a/documentation/migration-guides/migration-5.1.rst
+++ b/documentation/migration-guides/migration-5.1.rst
@@ -122,6 +122,11 @@ The following variables have been removed:
    ``files/fs-perms-volatile-log.txt``, which means that volatile log is
    enabled. Users can disable the volatile log by removing the value
    ``files/fs-perms-volatile-log.txt`` from ``FILESYSTEM_PERMS_TABLES``.
+-  ``VOLATILE_TMP_DIR``: :term:`FILESYSTEM_PERMS_TABLES` is now used inste=
ad.
+   By default, ``FILESYSTEM_PERMS_TABLES`` now contains the value
+   ``files/fs-perms-volatile-tmp.txt``, which means that volatile tmp is
+   enabled. Users can disable the volatile tmp by removing the value
+   ``files/fs-perms-volatile-tmp.txt`` from ``FILESYSTEM_PERMS_TABLES``.
=20
 .. _migration-5.1-removed-recipes:
=20
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
index 62a225ed1b..59ecfaf016 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2994,11 +2994,11 @@ system and gives an overview of their function and =
contents.
       and users across an entire work project. It is best to do this in th=
e
       packages themselves but this is not always possible.
=20
-      By default, the OpenEmbedded build system uses the ``fs-perms.txt`` =
and
-      ``fs-perms-volatile-log.txt`` which are located in the ``meta/files`=
`
-      folder in the :term:`Source Directory`. If you create your own file
-      permission setting tables, you should place those in your layer or t=
he
-      distro's layer.
+      By default, the OpenEmbedded build system uses the ``fs-perms.txt``,
+      ``fs-perms-volatile-log.txt`` and ``fs-perms-volatile-tmp.txt`` whic=
h are
+      located in the ``meta/files`` folder in the :term:`Source Directory`=
. If
+      you create your own file permission setting tables, you should place
+      those in your layer or the distro's layer.
=20
       You can override the value of :term:`FILESYSTEM_PERMS_TABLES` variab=
le
       in the ``conf/local.conf`` file, which is found in the
@@ -3009,11 +3009,12 @@ system and gives an overview of their function and =
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
       For guidance on how to create your own file permissions settings
-      table files, examine the existing ``fs-perms.txt`` and
-      ``fs-perms-volatile-log.txt``.
+      table files, examine the existing ``fs-perms.txt``,
+      ``fs-perms-volatile-log.txt`` and ``fs-perms-volatile-tmp.txt``.
=20
    :term:`FIT_ADDRESS_CELLS`
       Specifies the value of the ``#address-cells`` value for the
@@ -9989,18 +9990,6 @@ system and gives an overview of their function and c=
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


