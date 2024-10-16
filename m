Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C649D16272
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 14:10:17 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.120])
 by mx.groups.io with SMTP id smtpd.web11.24245.1729087812141743646
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 07:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=B64LcY5x;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.103.120, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOVJN2EBxONgc3+dXQSsu6S/YdF4P2yBWxItK4hEkqQ/7mKBw+Taufs+UN9tPb6tSybfYMSUSKM+p2RM7k4UeonMBi82NY9aXlM0ux9yv/+nmwXNCL6SX9KtY51a6kJ3ZvkfWlKWcxa6tDkGmpTLoDrZCz4xIX0PDyaimCBaT5T4bK/kh13f3RNGmYbun1Z3p0GvxVSHylzJG9i8bzpXx1m6v7dll6GtvCCbT+NJ83tJdP4q9z3j6Xa0Dys17OAKO+wESgISboVa3lgR0DoaPsWi7PGz6iedtugcWqGiJEmBOj3ht8D24Z8IoiR2U47w8CQty+XkCVOtSIZEDw4r+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5ZFzu/O/Mpt7OqoMsVqxVEFWxR592HnW3CoZ+aWnnA=;
 b=H85MwS/lzBr7i+7qGJY/xDte/oR+xHbnriyvS82UHcQpfNE5P1794cq2RGOWZ/VXmnCrOTKIU3PXr1YjcOtJ53NSfWjSotldWWbSaPKkLUZEV8WFhjDKM0MTPXELceFB5K3HKeQIaqNSaiEfU/JjtAzsKD9Rh+pQ0Q6ryi8HlO8dr8gtwSNt905oMSfElUsuy/TAHOxqIawP88VEtAnvIuvTLvH8V5j0EFYKwef5DbQCCOLSAA6yqaqdISkNuM7PgWf4ZbDgAenII/d2Us+pdufga1fOO8MBnGsaFeLsLd8BXfSUn2+E6Mz8xACJRxs0Y/s1tMQoJYQzlOkK9Rzd2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5ZFzu/O/Mpt7OqoMsVqxVEFWxR592HnW3CoZ+aWnnA=;
 b=B64LcY5xIeUCUmI2cHgtygM1QG/jUVK4UXfduQXI7mDEi81sHyP9NstcedvsPIrcMiVNSBDSisnRo4DMrtU+FM4RRDorrUKgR4m/IXN8TH0RzYJVt+xD642jyDJ2SXaobDD/ehrC1Yjnx9I/ebqgRkf1oo73qNTYgW8+BeLFN2ZBERJtIeCoYSqCzuY9pWUj9S0o6yExrZniPxtwS8azqiubca+90Rdnfx/llvvWMv9SglXe9toFkCzmNzptk0AROOpjobSBFRjboM3oxMrQ0383j4UPA1vXyhNEXzcqB/yfODvBI0DwQTmE+xjTrakz++WVbgYLCfdN4wOOdFQung==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9178.eurprd06.prod.outlook.com (2603:10a6:150:1c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 14:10:06 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 14:10:06 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: docs@lists.yoctoproject.org
CC: quentin.schulz@cherry.de,
	antonin.godard@bootlin.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCHv5 2/2] docs: Replace VOLATILE_TMP_DIR with FILESYSTEM_PERMS_TABLES
Date: Wed, 16 Oct 2024 14:09:40 +0000
Message-ID: <20241016140940.3166992-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241016140940.3166992-1-niko.mauno@vaisala.com>
References: <20241016140940.3166992-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0054.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::24) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB9178:EE_
X-MS-Office365-Filtering-Correlation-Id: f50dd12a-554b-4a37-c64b-08dcedec3c30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tgRgzz1bslqQTWVzka/jBEqMytAZegQq1h8PhxPeeLG5uLJrtlVd6aaMK5Qj?=
 =?us-ascii?Q?/aj3nly74KY4QE+Ql82QNgFGiE6VsSNi5YpdcP6jk4rfHO8hdGFAI43mbvfO?=
 =?us-ascii?Q?ypjFK8lPGPGh7YLyAxh2nKN5VJR9k0Z3Vy5osb2bFUO6DJwkFDTSzdrK9rmV?=
 =?us-ascii?Q?joxK1LVUsoknkXshqcUWhaAtrqSMYemwVCk+dgbN6vJmFHLWXZsnHwDNQhjr?=
 =?us-ascii?Q?yKhRPkCdjQ7P4bWHGTFQBbo0ynwMSwKtXCGrZU5kkqxjRldoz3h+77pjD8pM?=
 =?us-ascii?Q?MTHkDS1IJ8a2oEVGJaK/vT4fe97V73WIXKUQKEEwz5t9WqP27lWtazxfHQin?=
 =?us-ascii?Q?cFHSr+jaq3X61bGQ7G6bDiJMZ2zflLdAkvjiUZ0/u9y/W3L0Lit9WDLllQ4u?=
 =?us-ascii?Q?oDPWz5sFCdcH4bBMV+7BZr4AiJSeV23/VMA1L4hMzsIF1+fcbjdyI4Mi1BaC?=
 =?us-ascii?Q?fD+vz/Ngh3SJ9gIN5xOhSGu9rHKhItVWM+Hy/1iko0mghQaJQOBM3igNCGso?=
 =?us-ascii?Q?RWW0rCD6/qxvn8HWg5uKQekFiHjNx2OhkQVkxkaPKbwVz/vOvjemdxFJMFBl?=
 =?us-ascii?Q?cn79X0JFxR3jPGiHlkyy7G9SupQhn+lsDg/ba64hHiLDFG7ggWMoxILTGVJa?=
 =?us-ascii?Q?lyv/RBW4NAJJhvO/E8p0KgefRhLX7b7flW4lJwBP1jq/f9XjuXxGcP0pZuxv?=
 =?us-ascii?Q?BGQvt3AzIh5c6DCVPvzzp24sf8QhGgOdXNEPB8WkKLqlfAlk/NlqyiKMlVhJ?=
 =?us-ascii?Q?qljXNOPdnVoHt0T+raNVEXB5ZOpVHqm2aRtSyhKnWXAhzcwemgqaZBQcDIGM?=
 =?us-ascii?Q?0ukqstB+GWIRDnDCuLTr1FLEKstJFJjjQUYbSHHzWY8+3nAFxPSEWekkKP0c?=
 =?us-ascii?Q?9okWXEXuFLPayVfMCfPRq17kjG+72EyflXHen+QKIeyFRhtOCmrNVip2gUtf?=
 =?us-ascii?Q?11zIXuYqlfE3js9DNi9+7WaFmUBTeJssHFIrt0Pr461LZLEYOu93OVCWwdY3?=
 =?us-ascii?Q?PeTwiXp5sOPjIsNuUG/Bwc+mM+3tuSiFz2a8bdVZHb0444Q/3AVlLvj0k20X?=
 =?us-ascii?Q?aKhFJhRuu18XGbXLt5lPLiL6nedC7eU/OxG7UIR2LAGkXQ35SzdsVtRksG8z?=
 =?us-ascii?Q?TStJZ1RdrBwhWENL9WE8J5Ygaj7X5wdO+y4JLIMiDI0QbUfT8RZW9E03I6Jh?=
 =?us-ascii?Q?rSh8cHWsi6nOKxsrFdwRUjXtEUIGnfsh5K3ttkZQ7Q+uqLKiULXLhlm+/HYI?=
 =?us-ascii?Q?adT4z3z81Juy6u07yuSZ2GCZgJVW90z3xrKdjKhaEA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SZ6pdHvxoYfXzymxmsdFSm5o/zxRfICSHBsv3BIFgEDen2F+JTroOH7sg2So?=
 =?us-ascii?Q?XJ8wE1oQZ0ZDsieBXyvYzfgTnVwakRj/3O1xkTDPlPgL1fZOzhC0F3ikFwMA?=
 =?us-ascii?Q?AYUYqPAgwKziX8lhIWl+FtydBlLaFNTAb5Jfrc257BtunSgLRFZ20KqAJrh8?=
 =?us-ascii?Q?LzqP/cbLI1Nz2vBIdY7MBHq6KP7KWApYgptNonuBIRwJvECbgYdQF91C74Y5?=
 =?us-ascii?Q?kRalf/kBm88bytEPoiOGVhSRMaJtI5QzwGoirexhGl42IT6pSEhN8d99puQ5?=
 =?us-ascii?Q?mhOeVYWhp/ivYC5J2iL3Bsi4iorTKuclDWA4tYLi0FD1Lf00K64Vm/LQ/UyC?=
 =?us-ascii?Q?hLO0Hb6Cd2UoshC/SgXcAd7ZPLnG8BCxC78Dewm6D/blnlfdo4Op5nNI/1JK?=
 =?us-ascii?Q?t30lThdTauVk2TReHfvNRUQgEd04QEry5xAcrlImRW8FmfZZu73xN0h70QHd?=
 =?us-ascii?Q?61avSTHZER1rkUB4XFJPZfv+KA2bjsMZ4Lq+EQWj/dtw0//eLmTFG6iBBxSP?=
 =?us-ascii?Q?sZ+2+qQrZWxFz5yejhKLhQ8atldB2kFoQ047KVlvTZEtrwVEfcFJ+WPyrk4Q?=
 =?us-ascii?Q?yEDDzmBAKCQ9CuQYkpYd0x5h0UOoEyPq3SZieFeBVK6laV8Gqv8ByhbIzSuG?=
 =?us-ascii?Q?1wSZ9Z9czv4nCHB2QSqRa8K0NJtk5gbrYX7/0/yvB/seHA3zmlY7lFz0dwOP?=
 =?us-ascii?Q?d16IrFfKwG89XczMVxgvyPWUiWzI9QOe19jOqmD25zcqyg001rcKnl1p49WG?=
 =?us-ascii?Q?q58DRwx0YHzUOTYfwemEZycaERbitm5Uijor0CwxosJ0cIgwcy+DBEkLSY1i?=
 =?us-ascii?Q?NCAOikDrk+P3oNjA9015+MdE6a8S1b0lbalrqjAR7Jy7h0scRSTdF46BtqOi?=
 =?us-ascii?Q?B2MmVvQDhv95S9Vyf40iu9J8xxsVj2YOxVknVKLvGY5E6wfT58/cmyWE/p6J?=
 =?us-ascii?Q?/UdGX2dC++Wy9XC/I4IdlYMA8u1qLnMrz/b55Sk/2Kv37YmAqbc3kmGtl+d5?=
 =?us-ascii?Q?or1jKuNDhXVgEumkoyT0Ea5d0XMCdmsGaZS5tIFEBY+vKEcGIrAHPxAh97lP?=
 =?us-ascii?Q?dvUDljR//yvs8F+labVSZjC95qpeshrX20cQquLQUInfjmGXd1+J2aZhKhVl?=
 =?us-ascii?Q?GaRdrNGsyM//EsYBIuQSE04Kr+eMdvADftJaRnzFlLr84Bamq+qwkXwyqZsZ?=
 =?us-ascii?Q?k+ha8OLMbV78rrEi1Wy7FA2gaPt4iWOpLoWzuiRXQ829iPHY53VAl1xcuzW1?=
 =?us-ascii?Q?GLcuLhQGKB3EeGgjN+OJ2lEzeoBWxv1bR7PYWILyhD+w515pTlR6cKAu1T0D?=
 =?us-ascii?Q?KC8etrJwCT6vdBZx8JeTKk5Ampk06mR/KYMPGMvFMTGhcY9vsoewBVFlzGzT?=
 =?us-ascii?Q?l6bMP1VgvDH8QYdkhFPh4e+s1Q6fJQKoavW8xUxJdHf0/5nPWrMTY7ogWK1O?=
 =?us-ascii?Q?6Faw5TVBBlZ97Qud2wQVgGN5ZPQsbpib1UpsHlISU0HpQsNyXsUn08QVMiJP?=
 =?us-ascii?Q?/Cw9jDWOTXmp6WdMciFgFMtV6kx6US6Iou2wXgSz4eJAwIFBZd6oKVPi1ByP?=
 =?us-ascii?Q?+PjvxljcPvxomT6/GV4VGYuPWpxdiArdzKsd7PghIvKVyKSpyay/1b5Rdu5s?=
 =?us-ascii?Q?hg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f50dd12a-554b-4a37-c64b-08dcedec3c30
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 14:10:05.8544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NrHLtKziEV7BIFGmiWtDJNvHZxN0snzBRf/FMwxNvWndSBah2VyLNRR68n/75ux9ZcafV52aSPA02Nftw8NsKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9178
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 14:10:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5514

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
index 2b945f8165..7d6c976cd8 100644
--- a/documentation/migration-guides/migration-5.1.rst
+++ b/documentation/migration-guides/migration-5.1.rst
@@ -123,6 +123,12 @@ The following variables have been removed:
    enabled. Users can disable the volatile log by removing the value
    ``files/fs-perms-volatile-log.txt`` from :term:`FILESYSTEM_PERMS_TABLES=
`.
=20
+-  ``VOLATILE_TMP_DIR``: :term:`FILESYSTEM_PERMS_TABLES` is now used inste=
ad.
+   By default, :term:`FILESYSTEM_PERMS_TABLES` now contains the value
+   ``files/fs-perms-volatile-tmp.txt``, which means that volatile tmp is
+   enabled. Users can disable the volatile tmp by removing the value
+   ``files/fs-perms-volatile-tmp.txt`` from :term:`FILESYSTEM_PERMS_TABLES=
`.
+
 .. _migration-5.1-removed-recipes:
=20
 Removed recipes
diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documen=
tation/migration-guides/release-notes-4.2.rst
index 30049b89f6..ee81d8367a 100644
--- a/documentation/migration-guides/release-notes-4.2.rst
+++ b/documentation/migration-guides/release-notes-4.2.rst
@@ -38,7 +38,7 @@ New Features / Enhancements in 4.2
=20
 -  New variables:
=20
-   -  :term:`VOLATILE_TMP_DIR` allows to specify
+   -  ``VOLATILE_TMP_DIR`` allows to specify
       whether ``/tmp`` should be on persistent storage
       or in RAM.
=20
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index c27a0ad7d6..f66c1bb497 100644
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
       in your distribution configuration file to point to your custom
@@ -3007,11 +3008,12 @@ system and gives an overview of their function and =
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
@@ -9987,18 +9989,6 @@ system and gives an overview of their function and c=
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


