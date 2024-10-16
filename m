Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100BBD1AD33
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 09:24:06 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.106])
 by mx.groups.io with SMTP id smtpd.web11.19104.1729070642643351729
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 02:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=etVk/9G5;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.249.106, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywmagfnUOeMEwgHD2O3f1yKmahmxwLPf2AqzeZ8JueTgQgXn+HaJZr+07jQUhkFgZCTkclhZnBME4rhd1hSVizsPc5z5rDS+MJTSoZq3OVdxjHhzJRyC0bJEba2OMEYcm3cDl5Y4TPwX5qyeM7Yu4FskTfUVVDQG8MD9dccD3E5B6nSH+7NNHYQtCA0FJF5sPll8K4VbbIut5rWe9yILfw41+Abq0q+PSz8Tp1TvR9TB3TTNOseFdJhcADgNTRfsbEUce5ZJ9/GjkYMe1wn/OjGtb485VT31HpML45bksqzF3oDDxoZTcA9oGAuEbsGgkLdW+byL5k165EF5+Ci03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kdz1vvcgzRBBSJKz21Y34+ukwh6wBIgYF5iYRokbXVU=;
 b=E1O9tAW9i8lndJ1mif6TL5IJqNzuqcweC3LJyWY2mXnBdBD2U+xB4Uy8IGGRR38fNgTLCgkh0Zj5eHSi5xk4eb24iElTR20HdIO7B2HPin0Dja+ShziE4V4fZjzAlzde5EDfIaTk4UR8lHHX4LyOdY4G5LtyU9M8Im7zQXrTzPeNHkiOBOwXi4ySjDoKJ3HBIe7ni/0dzvqAPEcXOba2y4jCwvSWehbi3245Jtwz5+Z4QYQ/r1THWG6GpR84hEp1EB8lMDFSU3riOqliwB0gyDivbJqCZbMSx/O19/Qf7CE8/HSsc86tdkY+8i55oPnUO0JFd6+a+lfeMNCVZO6Lmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kdz1vvcgzRBBSJKz21Y34+ukwh6wBIgYF5iYRokbXVU=;
 b=etVk/9G5w0CE06dr+cojHrRChBfA/dspLMoRm2pLIEuFptHxrKuTFDofA72EgdmI0Jp4JPtwrpDZQVQXOgabR5hFuxdvWDglRdgMCjatqBqHUy0klcVa/OWLzPh9N6wEmaDagZN5qflkf9g1STkhbdGPsdaxXgHc/smXgJSXmGa7b3f3R87XaDPkOT4EIedKuRj6MVsbJSeBqZxao6uLGJYrJ95hyRTV9zGaPqSBmwZRxrtEA22R+nKHIjbdxOKAuaLseQWuhRa5TQ0ToBYXdYv/WwNGOrRFgtj7hBaU6sKQN+d49G3BDxSbTrKMJ0wPwOMKfB7tzQg3qQehuUgrGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM8PR06MB7410.eurprd06.prod.outlook.com (2603:10a6:20b:365::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 09:23:58 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 09:23:58 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: docs@lists.yoctoproject.org
CC: quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCHv3 2/2] docs: Replace VOLATILE_TMP_DIR with FILESYSTEM_PERMS_TABLES
Date: Wed, 16 Oct 2024 09:23:40 +0000
Message-ID: <20241016092340.262802-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241016092340.262802-1-niko.mauno@vaisala.com>
References: <20241016092340.262802-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF00011B55.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:8:0:19) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM8PR06MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b0a878c-bbf3-4e12-2f98-08dcedc443b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WCoLVIERNjREP7kjgRhHt51bltPLkpIs3KuwjKFVF5tWjaWu8BDtz5I/mYtM?=
 =?us-ascii?Q?Ju6FVQV67FjEwMSWBsbjqMEwJ6thzWU4+aoMDptM2CIU/vdkRLeLDxPHww5I?=
 =?us-ascii?Q?E43VOInXKC0x7fSIJNkk9eWxm0suvNbwLTlcz3qJiGz+hJTwHhkzl1BPE+hE?=
 =?us-ascii?Q?80FykEv6f3d/HxN1EkwXtIeaUT7BYGAoSQT+yuw6IuEXEsuwjmcfzq2FkZbk?=
 =?us-ascii?Q?VAdLlCCrLkYI4cr70S1AoMsfvKJ8xAqwTx2qTBDbnC/+mOG+pikgEvoYDyZp?=
 =?us-ascii?Q?1K8qMTcKkxpc/O0R+bEComi4Vu/9KlBbc2xcGhNGBbbMoZuUvTfJl7zCVks3?=
 =?us-ascii?Q?4nlZ9LfeEpH/Bz5a/oXS+OGxE2XYmPjBBbagr0bpB98jJ4qRUHO3gOsP3H1z?=
 =?us-ascii?Q?p4kvklfRL6rMyMk1ENKlXL68Pxi0q0JazDkLySvftkEMCXCEapuuVNaLgqcU?=
 =?us-ascii?Q?tkuUoWbDzyZwaPpEgK7Z3zWrPswq8B7AJ8i3AL3+ui+639LVvQ/KllOyrwYk?=
 =?us-ascii?Q?rZ+TC2Sqsu6cNTd5e2eRV9y6rd4n2zILPZoSM+cjbgXdkHIoryDGzcRFCKEl?=
 =?us-ascii?Q?TWVefzuhEO7n4O+EcbieURb1fsdI/FVqL6j2ZbiVXFIwlnHGOzqxdzIxGgbY?=
 =?us-ascii?Q?7TiKpvNcprojJ9wqEFQRXZAjYR8CT9/9ma0P0fDRz8V2KP/93pwB6hYVGCRi?=
 =?us-ascii?Q?7cL+UMthcQ/NuhWEgLOAnKgfQR2waBSBZx35KpAEF1JjQ2O0t71lhTpzDQVN?=
 =?us-ascii?Q?IUcEbo6A77DB7gDBQDU+p/PHMVEjy6lLj+VBlCqsT/rNdRI8ttWs2VRlTicL?=
 =?us-ascii?Q?bVTNegjf+SIxLEpZYNmhtE5GVpzsGbo9A8EMfFWDfBnKDgSUIyNQL7SM1k8G?=
 =?us-ascii?Q?bqi9FKak/E5YH8OopiSeBSD+YAl5MeyZYHH+JrBltjE7RNEgvo6g4gPS40Ps?=
 =?us-ascii?Q?EmanW96x9CNh7lCaKCP2eTjKqldf1U2EkYvzmg45hfXA4FVKxmIqRHuS325b?=
 =?us-ascii?Q?YD0WiOZREO/ulhb3zgnjXE/ZLi8WKWO3b+OTO1qhu4yI4PXAh8r5DLq4L/Fl?=
 =?us-ascii?Q?fpemd9MoSil8GEv2KMOhd2kIkuac7bJRY8VLlR0KBOfSWgbykPUnmCD+ToLC?=
 =?us-ascii?Q?6kon6eZI+70Ifah5bMcqN/k+gVdmLJ2IoQoY3+UCtPLgMNecsuvWqILFb7Ku?=
 =?us-ascii?Q?Y1YlUYHHyvd5ouxPLEAFSEDIK5Mriq53qhGRbdZzR8CvseCnl1NPV7oCib2V?=
 =?us-ascii?Q?gtRJYWU+JlT2fFZfu7aChcmgItsrTidaXmsXoBjPPg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gqPgO5zQFXEpTVZqtsZtE3sDytTibhEdkysT24H8KinZ4kubzz/odx0McNHc?=
 =?us-ascii?Q?1SgDntqo2L6e2XLH/PpPRL6mNR7XYkzt2p9TJFFVcOF0D2fN+gCoJWhPw+q8?=
 =?us-ascii?Q?TJuYF+BDS6/S32B8CrpUZHW03MI+cFJiEi2LRB/NQwtp7QdqYrQNrmJfUhBk?=
 =?us-ascii?Q?cF49qSwPbNhXTFGDp6ONcvuWVqb570ImB3Dq/xz7sMGQrp3bDnySq2Z+H2JD?=
 =?us-ascii?Q?zPQwDmEn7nqMzO10vmdbHFxY+T02ZO3E8oNIlfHwSlgadrhg2iRioIOo/XSS?=
 =?us-ascii?Q?XnY1WYAACpUuoQgbYvEYKQa1L9tflGzOVUso633imdyTC48OBTw5CFIYHh+x?=
 =?us-ascii?Q?cLvODsJYZutQFU13I/Uo/MzqnuRS3huFAPMzYMdXOzdjIsHy485KguE6Tm4Q?=
 =?us-ascii?Q?emb9WEl58O1b5Hn3FtGSYegeAMykd2RsLF9/4W4l7XLRTAHGHpXPkuyJyvuX?=
 =?us-ascii?Q?kSmIZmxxYGNlu1hk9UttM7+bjqKDkKHSmmwYDzpFjcAva04owePfkAscqpbW?=
 =?us-ascii?Q?X30A4SSFPwLwHLTsY8jaQvEgG+WZW0nwQc5OGpbTBrv2eT10KYJy3zvKKWaE?=
 =?us-ascii?Q?MieFqPPYMlT2dACHZWfxv+CYQ8+6vC+VW6H9MoDmteRMknPdFkgF4mr3Wq3G?=
 =?us-ascii?Q?p8SBwjKn0xhJ2tDUsLI/WivaWxDDTLtfxvFIdK7QQvVwCM7mYyWsAfiKHxtv?=
 =?us-ascii?Q?KtrZWBChWQpwmEntjGzzMF1rZ3JZafOPVrYb7cSBLfMhU3q1BqV9E8aBVodO?=
 =?us-ascii?Q?9B/OMHOBNSfsDgi/Az3YfXZLFFIPTaxumOrep7u4FpuX0WHu4Qmr8l2gdToZ?=
 =?us-ascii?Q?2lU2hPBQXgvle2g42R+JWr1M/YRw/fvI2pkawuu060ud3S1ude4xTcduKqHW?=
 =?us-ascii?Q?GzmajLbf8ICYfbcNQ7kvfhZwMuyC1+JMpsXtXGYyCC7XxJ/4gD7eioQuTm7B?=
 =?us-ascii?Q?aK8gjLO7Khr3yRv8ri9s62OAdudeEuxWuWM91p+0DyedVvaSofWK9Htxr7uf?=
 =?us-ascii?Q?K1MjfkzWDIxPxarDMlLfYJXbCVavAlSuGRaSAExwrTjPH5frDexad59k7JdT?=
 =?us-ascii?Q?h2q636Bt9bIx2bxe+Y8qVg1TcBYOAERT7nS6wkYSbDU5Cjps3syD9Gd1Wk7q?=
 =?us-ascii?Q?J3XjImorIJtQ1ubvsUoMfjdOA/Sc16nDdue9uASBym3kBEfuNTqh+iOPh84z?=
 =?us-ascii?Q?mMKDiKTmbn7zuEUFItaAzdwBYTctGbuSdXsGMC+Z569wT2L0kKqm1POp7b9c?=
 =?us-ascii?Q?CbNgaqqCvMSkAGDHpBDBjDxBDgpVREfEMkhqr2jcK13uY64TPZwfxieRalX+?=
 =?us-ascii?Q?/YyC3n1fRg3W3nhOT4fn0ibNteonunzKir2NudmmQyp+cyPv7GQpSBK8uXNq?=
 =?us-ascii?Q?lcMNlc9bYX7Q2wW6KLHm3v6yVa6fye48uFtdfzFgJGP6fs+Caa2Kr97jiBHi?=
 =?us-ascii?Q?1isFuoaDVjzY5BSvMNE32ifwmE2/iRZcxcDZg1An1aZ/yvnJ4oZ2Q2LI0m3V?=
 =?us-ascii?Q?dEiB4pdFKZrqdITaBeYxC6viXc/XKUq/hODEpH/QqGzpVcB8Vbv65H2dFWik?=
 =?us-ascii?Q?OOjFAVXFGFbwV7OTHCNBBr8XnwgLXHYBuTR8T0d0nLYCTyAAA99L/B/muunU?=
 =?us-ascii?Q?wA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0a878c-bbf3-4e12-2f98-08dcedc443b4
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 09:23:58.6462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cm3RdR4QD8P1lKYUlF4+zD/bkSBTi6rurLnxMsPUEwebFndjmU03Qw9tmMp1nBTgASu0GUcTYOMrCUqTTgMCsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7410
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 09:24:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5499

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


