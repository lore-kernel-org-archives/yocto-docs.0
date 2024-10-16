Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB90D1AD35
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 09:24:06 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.106])
 by mx.groups.io with SMTP id smtpd.web11.19104.1729070642643351729
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 02:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=P4QgDpKB;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.249.106, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwO9GB1SLnW6Nvs/UjgrXAX9v3I2GBrWbWguQw99Rl7BB3VNsh38Fez69Rpro83LlUHi0zZgQOWytATlhCnIi5sRC7G6+IBKGRUPuj/eBmAI7YUYjbI7nBm3cBOUFv4Y2rVtFVFrX7TDVO1964LnyggtIF76/HFMU7F4WOdu1YqYU2BkTufX7HpYl7lnHA2CtKTdaVz+PZL5rSRNNslk55h1JTuKtcviNjhoELKGsc+4qKs7c2l5fOIlSrAch44J5Kur/C2ae2P1DxfYeAJxCrAgjhYHEXikg87F7DLxM/9LwwibIjv55wnIMYuY5kYPgHo8HH6VQ1wX+34y7DMvew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OmJ9yHtyZGQqxH0qSyMfRz1MmyLtvbQN7BOoLmNpFc=;
 b=BKhcEDK94iZ4M6udrPttevPt0T4ug/R0a2j2qldBABSHR9eb7fmYMkbtlNS+uilbuYljCAV/58E2Sm0p3oqDlU5/vkrerqh9ojGIlIZhRsWT0nwYxEjTNa8tuz50P8k4yjxr/bAiE7A1zolJLIebR5or1Ne2pbpSIQ77IMb/4bJgPpBnF1JnpDxs5N3qJvuXsMe93ots9s088gep/VPB4BJfXseW+gjFAjYwWTtLoDS+gWGm08TODTjZ3Xeu68Kgm6j9JwE2H3OvolrPm8g9U5Tz1BYGAYEjEsFq5GWclAkRRvG6jwp11qZnTjkULvGRExSkpNUzPVVEAavndJinWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OmJ9yHtyZGQqxH0qSyMfRz1MmyLtvbQN7BOoLmNpFc=;
 b=P4QgDpKBnFcqkS8tdhJ67QeTnwEQ1RRYKZ+IX0fgqqrIYS5lhbo8i9eBTJSHB7ieFVCAqzIN3BB4vnNdAQJjcNVYNwZAzlNbAl8KvGx7bq904fSwolQEBIJfitFLa5Jo6VwN3/FIcQJyO0aB4mUtl0Wnn7CrTuQ4nPg6GuqhsZxTdRw1jUtTyP9Y0omYNNxL4zNJ51lRsXQQsZKkV6I399L4G1iPoxQ6AeXc5J8hjlOlXpY+qcDlubDg4CZfM4iw+OxUOw+OANkLQ39WIFuR+LJI0WUq8HnjvQJLv5WZIxhyrKetG885IFLXjRbVCLHhbz7X5eupwiJ/X0amNoqhxA==
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
Subject: [PATCHv3 1/2] docs: Replace VOLATILE_LOG_DIR with FILESYSTEM_PERMS_TABLES
Date: Wed, 16 Oct 2024 09:23:39 +0000
Message-ID: <20241016092340.262802-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF00011B55.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:8:0:19) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM8PR06MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: e105a2ed-ae3c-4b81-17b0-08dcedc44371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Oz0yfA/7yIr+YRw0+LCxB9v7cdBQLodIKjrXTBFRWS09Rso/unKnqXwkLl2B?=
 =?us-ascii?Q?WHS3LnHbB0fIWMbjNf4tDnKdFSaQ2Evv032BUBqg5qT81aos9pxo2ygobdLo?=
 =?us-ascii?Q?MfijDDDa29uRlS8fAMx6kq2YLtJS5eDApGR2ouXn/xr19o/o31CWsLHa1fqS?=
 =?us-ascii?Q?jR9YqZgSSNmpw6oSRXjZLHDmSZpS9UTQ3RzykFYE4GYmVnX47n7pzsBdNiB4?=
 =?us-ascii?Q?IPbq4tdOrri7ldMX4OW0/VloyUSGMySbzeWWDkKJo9658U4slL5Zmmd7p5gh?=
 =?us-ascii?Q?jUnEtCZrr22BWSfUqTB1V3sfkVcBpA+8AmFUZklcS2mO/SdXi02bB4QfMW3J?=
 =?us-ascii?Q?OGSUvFMGTVgqQj0hs7kwA5LFBAOZ0B9zJ3e1w49zoOwYzSnEbgVcK4tinSc9?=
 =?us-ascii?Q?pcJM1FH0K9BU8JELTqirUb9ETJsYCNwXpj5gktfbKYVT9eR8e0CTddNRga1w?=
 =?us-ascii?Q?okGjkSQfYuZQEPguE2nlH/fPalOstrZNaZirhW9Y0Vg8e6rRXOl0mxrG9+VE?=
 =?us-ascii?Q?sdQPqK3Nqr2XPa5YOqRX2032eNcLh11AaKFxBAFXnVZyAe8kgJ4/iKT013FY?=
 =?us-ascii?Q?j4ddMusfMHf+sVL9Gji8uKIrA5l3DAoTjB8Q6WpC0UBlqChG2BwytHOE0dcm?=
 =?us-ascii?Q?s/Qu7MbOT4VMBqqMqYmu6b5F2YX1RVe6vdccHx65wO3Tp8ps+bjz6Ts9aG+s?=
 =?us-ascii?Q?U7jPTmpJC72l/552Nqz2StBy/K4CzBRvFw/cAQXlimY5jAuFLCVGajJnhVQG?=
 =?us-ascii?Q?PGHPYOITUE+l8ZOsobcQtJ/pTFS/qYHg4oKGDK6RiQkABQw7pgWv0VHt2AuK?=
 =?us-ascii?Q?bEhMeLFR7pAEnySp0emUgDzHyJRLL2feqfvnXEkYkwYzi7LPF/NIEESOzFpc?=
 =?us-ascii?Q?DfTPRuKlS2syhypXVYStK397WCR9C/OUfwaR0VQgDQoYRQVrKLorYet8+ItL?=
 =?us-ascii?Q?f3kZJPotpMkG4BLO0QXhS6Pmjqzg+gG4sfmGskJeDRNhNgCVV2ruvxu8nCPm?=
 =?us-ascii?Q?1ObQh5IN9iROrAJnHsWB3hgcS3GxK/CtvvMNVw/HgJYXKwW3D8nDYSAt164l?=
 =?us-ascii?Q?Ve0BR8TUr/xOmnBZdIej/yCjVWxIxu6IcdJ/d51wlA/kgreD89xmiqvY6dRk?=
 =?us-ascii?Q?JVvONv4qTNp7Z9D/kxfoLkEYRgOKxnu9N7TzxqrOxZ6Oejx3J7+/Ym4gR+ZJ?=
 =?us-ascii?Q?jnslOZ1G9T35dul+5lS/hiiTMz7x7dQsoi9IVRA4d3fdoWdYGHFgy9Grsd9m?=
 =?us-ascii?Q?5if9APiO3UcdtBn+rSHRoa6LFjqgBNNIe/s0knw4wg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fJt1kIejqkrjT3rpwBaQkFWyJ/Y0VGz3crmx1Rc10VARJImyYuUBdnaK5WKM?=
 =?us-ascii?Q?8WspXK2LJh52gj1AZfgNM2PTw87NRLU7KzpP9RrEoC1F3CALNTan/BwatpS6?=
 =?us-ascii?Q?R8tHclSg1lRSUUhjlNc5vjsq7Ty+H13X6jVW4i5EtM5BT/GdyuQsuQGoRJBy?=
 =?us-ascii?Q?2KbTa54AC7F06kOxq/gghvoZY4rUlPkQz59vY8O34IKk84R/bLvyzp0Te7nz?=
 =?us-ascii?Q?omCJm693ia7/FzieuKPWPOWRg8XNZPf7iQ96EMGv508WM0UkxyQPy1X8NTe9?=
 =?us-ascii?Q?buRPyZ+AVmBV+LkzDjhupkFQAI50MdRm/IoVytuKXA24phQEQL5Aq7ThpmvK?=
 =?us-ascii?Q?aBXpuKkt94tLySAdxdxou9BFKiVyhz74LCQeAr0vPT9vH+7VXHfEmiEgKAyj?=
 =?us-ascii?Q?hLRvq6ht1fcJggVUGC/v5izweQJ9f68eGfpqrKxjNxpkSmEkKEJgz1+pbSXM?=
 =?us-ascii?Q?J9hn1/qhiErYo8shvwMcI+sTqqzfejzUNoAeM4Qr0bKIkUAMw3WOCNbDtA3F?=
 =?us-ascii?Q?bO+CSNI3SeqzGSChtsqsTrb/xbOPqsf9aAYka6ypKGTr9TkySUWfLH35/+Sm?=
 =?us-ascii?Q?7SltFHPAsaYmFt6uZ4mOOHc3OYeVdKC/qPR54iAfmoY/HH4DIOyJ+8xxcvh7?=
 =?us-ascii?Q?dmTac2jwrPYibGRp2eIKZ9eerzOispNyBSv6fyf6JQk26+l0j2VmNvTCWcCk?=
 =?us-ascii?Q?Yt2QW+j3ZtLZpw8fbesK1BVo7MXxLznGUL0zcJ5hcSC3zqLariaj3shpxsi1?=
 =?us-ascii?Q?WGGNEDhkwVrd9joGB72H4tTO+YYLkHtl8eCh0RmA5F7ORkSaRAobWmxiI91k?=
 =?us-ascii?Q?qN8JILlKAXmJ1TNWN0Np2FKWS3NCG5fIqSLKfVGiyt+kddXUzXsIuN/rp/iH?=
 =?us-ascii?Q?1t/+cV9F7ExTDyC8QB+ikzoqOVc2ymheJCOMH8RCBCTC/qs3s4zrns+C7ziy?=
 =?us-ascii?Q?arR9ilTK7SFrNwKSwXPFOsKvMUOgZDGCo7Yy9D0k5IKzVLK3c/XzoJccfKkV?=
 =?us-ascii?Q?gTb76vmqJ5AuUvRw3bFi8navqt0AlOvKaYQiQpsFQcax5ab1wwgWg8TTpW7d?=
 =?us-ascii?Q?k6PgXZAN+S3vAry2RNEzvHDUSxiDHAIYJxNsZ8ZDVoTRcF3d5rkELlRouqTf?=
 =?us-ascii?Q?+w+U3x4ZM1cbvTSOHERvg4B08MOAXADom47JaaE0kgSHNOeFzBi4/6w5dSG9?=
 =?us-ascii?Q?ZsT/5kDVNkryNKot3wK0+ugSp/Oo7Vs4nhiqFaLVHWoBiZ/yr8VHcQNGijo7?=
 =?us-ascii?Q?aP/Ypq5lPz6YEKj1NftiUpt11+z4oYcm/4GDGRXHvzD50xxnG+Z0UVCkgC9f?=
 =?us-ascii?Q?AVT1Zng3/mp0S56TZ9RFylK3XP3V6xFKd5f5y0D6yX814GoiIQyA+79uHToY?=
 =?us-ascii?Q?3WRa3WOKWzMyusmz6z9teNHvVr4WoOMm3JqM/dknjyfBLldA5JTWuiLjzdC6?=
 =?us-ascii?Q?ERuVf2tRK7yNLvwAYom4+gEB6IuzKIYWpTo55R3aXdkV8UyKafD5MZCIKZXA?=
 =?us-ascii?Q?IZ3weKM4RAraNiNOnr1TIbmFryDOscXVetnWR6LWZB9/2ckbR+esG1R7Nb5M?=
 =?us-ascii?Q?N7qaeOMiTVY9oEwOf5vzsDlYeTZGS2Vy7ms6wDT3C2JUiILQAPaqv0VgG9Jp?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e105a2ed-ae3c-4b81-17b0-08dcedc44371
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 09:23:58.1995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fbY3YfzTxXAnKkmTND7IlKGi+D+dDjllie6S3gLwocFPHazsj026ihsu39DVe+fej16lwFeoesdKlImrk/6Z5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7410
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 09:24:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5498

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
 documentation/ref-manual/variables.rst        | 41 +++++++++----------
 3 files changed, 25 insertions(+), 27 deletions(-)

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


