Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.71])
 by mx.groups.io with SMTP id smtpd.web10.31511.1627313406006239642
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Jul 2021 08:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=dssLGoZT;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.71, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXMZdQCAo7kTpZHd8PgFm22ztrox+Vx3yZhxYZQTUoA52/4d/oAkhMtS/7opYdG44ExJRMqSEBJoY/lfcWEEV/hWjxnvR51fCaxgJ8gZ+r9Hi13bmiWPDTR8jiUMKzya8+PBjcBYZbS3H89p0WEw/LNbKG2UfC6m0aJEWQMekIWXvgdXtRhFhiEPPhUFU52zGb+UhbQrMRyBsPnP6ujBxoc/9r85QHhZoeKEq3upW5l1dhlquxWwr2n/Mqnyxps+UfEt5DNROE2mvc4mI3KQchVF6Wqbtxx8cDTit8JxwztyEM5H5utEeJP+WdrnBXZPKdG2hKBYJR+H9JQgsy2CTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0DR5zbSn0lnuLHczc8O9nMcfygpDuIvwzmTMZEBX/w=;
 b=NQB9D+oYvdHaYasv1JVO3KQ3FDBM3gBnIGvFOc8kt+c0qTPVpLbeFsV9QgR18Dw3AfODxdJbuOdOFx5JaB9BequcHYs9xG0OVVrghT6h1BFLD0G+XJYzdtmW0l0pzqbVUYqQkErrMRb5e61jqVVwCzfZuC/WFYHUkjh7THyiPG1mxOZouMWiEEwpO9W5qLYD6MWNfZzzHXPQUz0xaUn8G6ko1m+hfaqjCUbbozoAUGtW+/VsOyW/4rCQibA3eI+aqX2OO3fxqetEvcIDC6xq9yPpnY5dPBRB8veC2pA6Z7lRbswyHiicsMD+YgEU95mAWXr7OOkNEVkVIpbYkIcOuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0DR5zbSn0lnuLHczc8O9nMcfygpDuIvwzmTMZEBX/w=;
 b=dssLGoZT+pKLrPX+dS7wAc/rc/tzS1wCenbF87OwC3gyVXbXobkeTtnsZEFQkCa9d6qaTjL6iehuY/UWI3EoPNs12bmn5vro9KHNCg8oY/lohZ9N3YRaGNd9GHQ/0QC8cNUEab1hFwRtilrjxyUelsPDEXymFPY+Nj+930owaTQ=
Authentication-Results: theobroma-systems.com; dkim=none (message not signed)
 header.d=none;theobroma-systems.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB5620.eurprd04.prod.outlook.com
 (2603:10a6:208:134::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Mon, 26 Jul
 2021 15:30:03 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 15:30:03 +0000
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: 
CC: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	docs@lists.yoctoproject.org,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 1/2] documentation: ref-manual: order alphabetically the glossary sources
Date: Mon, 26 Jul 2021 17:29:46 +0200
Message-ID: <20210726152947.2501390-1-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: AM0PR02CA0202.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::9) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (92.42.140.82) by AM0PR02CA0202.eurprd02.prod.outlook.com (2603:10a6:20b:28f::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend Transport; Mon, 26 Jul 2021 15:30:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7056ba34-d72d-4a31-641e-08d9504a3ce6
X-MS-TrafficTypeDiagnostic: AM0PR04MB5620:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB56206EF81DD42BFEB7CE254CC2E89@AM0PR04MB5620.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZuLYM6PckdwSKa4Tqhjg/F6sPqSqFC/YCo+0LgwgZR72J1NMp2ZIiDgjdKWE3pJYCJpvyW9FQIbuDd5KuZ77yrypjVq3RvuVlYdfBC25LnPGmYST6AUCNtyWYIl0QOHpQNVtDnmuXhkyY8hfkZAlpmRIiuEELiGzTzj5D8PTF5P6GlWwko2fgxYfPfcJt/IxD0rc3H8dNTTHRCDyWeEpoZ8x/TS7Xl5jJjzmCX/D5CcBiY0KmGj5kJsiBZZJRsc6+XpdF5eIXGmXva76ZZDP0s/da8ONON/DHpDJiX6WV9AK3es4V6ljxa+ZuObyCs3kryVuan6mFjCYZNYXGcb9iHso/I7gcWqN4HZY0F2IYcN1oz4mQgkywQMTpc8ziixnOc9QrlJMn7G9TFYS57qLZ4xd/Zm1tQTJ10RAMjGhEj6Q7CNiySn60nRoSY18FI9uNUawIbdTdXXaSMUj1FMsS7m8XivZ3dbODrFaOmZ3TZyoNhRVE1SsHLdIZ9b2oxPS/DPDXC/lYP8gSm5qXUqGI+t30MAg4EqB3g4vEy8UZBNhBRuYDAxlt1WMppcAiRVwk2j7TfujDzF9n7H3Sv1SnD6rPFV6XDFlK9wKNISUWJRMl6Fr9irIXQZY84j0DCNYpxg2+ebCWrZQQwUXBbbrs0dgPVtisKNi+A7shSmCqp/rqmKrv2XUL41hLL6CzSS36lpghAs01Z4IPCT6BX5yheU+UsPQwfKQguedCkGIWOiSXUciBtsSo0WN2RTRp1pSGpb18iUyim2Cv82oVqtgoUOyLhQ9B+RTZeZQtJVu7S5ae562hRbfA3Y3E8uOEPEz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6512007)(5660300002)(86362001)(8936002)(6486002)(316002)(26005)(30864003)(66476007)(66946007)(8676002)(6506007)(186003)(54906003)(109986005)(52116002)(6666004)(4326008)(36756003)(508600001)(2906002)(83380400001)(38100700002)(66556008)(1076003)(44832011)(2616005)(38350700002)(956004)(266003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2xMmhEc5Eo2BBCU2Re725g4IljKgnLtm262pSqGwkzjODmTg4lgkmWcmtB8y?=
 =?us-ascii?Q?LtQR44LTJTCl861tHAGmY/ivSietiqhB19026ICgpDXXK0o3956vA/+6FPwQ?=
 =?us-ascii?Q?eugOjobCE533bHwkB+JdWMj4MDqEUFRauTceWy1M/poN3KpMw647KUjB93mP?=
 =?us-ascii?Q?ejT58MdiJ9G71HPrB/qt1efduFWqykGqoqcaUZxqWRrgfm4wqxzx8he/Mpyv?=
 =?us-ascii?Q?pvCB7ofJfexhcqZDC+v7VCEGcl+Ewrpd6NT0ayKy//DLCZ4CqT5soUlQuQkl?=
 =?us-ascii?Q?sbHPJn5S7GCkOXwLC0faiEIn0LYjpVI3eekr33pqTZucyoFG7J7XmoauDjno?=
 =?us-ascii?Q?jluSi8qKLgX7ltb+cSseMJoW68dal3l4LxVW/z8UtJlL+SMkQ+zMETf3q9OJ?=
 =?us-ascii?Q?xm96fzkQrCqjlLvtWYEHpNPAUehBzKyz2pJ/kGPZ2fdrOamPLeV7/q6Q2QAu?=
 =?us-ascii?Q?VxyCdCIALVzwcm2KA5QMJmRX0zPEKpLNltomooS759Pd6mwoap+UuPSMiHAN?=
 =?us-ascii?Q?MC+PoEBrGwbPd12wFA2qvk/NyHosJHFIdN/nb/CVvVMVvV2RL0UVKCOGpKWM?=
 =?us-ascii?Q?NU8tjJmuMzfFR4dUI8Iw8MmwHoudoo1eUQ5UbH3Zi5EdB96uR1NV5btGPoBw?=
 =?us-ascii?Q?SBAq+ThKnOqIgAD7GdCUs3n34TRFT/x/GrfnOd+PFiPT6UzQ8Xq7U2oI1C/F?=
 =?us-ascii?Q?gfHWsnovwpy/4PmJLiSJ6KoMwBNunmCcqPeQLJtRIdKcx6PXdlBX+4B01p2X?=
 =?us-ascii?Q?HhScG/m+uD/JGT4Ms3amoWjZpYNuEyjkQf+RcNEpmm4yX3/10yaocsjMwFyi?=
 =?us-ascii?Q?Hvnw0XPq8fAr0EwpYcoKyj4bcndNqkMaCg1x3slNMpvADFuDznmPYx8IwoDg?=
 =?us-ascii?Q?bftPU/xtXrt9YXPyrEKTASM+ciR4vg7YkiQSih6q1WAdINGSyVX2lqsmzK54?=
 =?us-ascii?Q?owmLzDVk8zy0ObRG2EILuo874f2ilzXr9JQ1wgvLsqosWzkWjYntKxGPTwH0?=
 =?us-ascii?Q?5cOQtf6udBAsiDl5XJo5AMSXYS3AkpLBJNiWSVp5zO892hmDekI7ertX6FK6?=
 =?us-ascii?Q?pSPRSJso10FJXscyuG1B/Mv2pR2P1NJuBZGV88RS8sHm7K3bFBWe79hGvD+D?=
 =?us-ascii?Q?TsjfVvoaAhrhjIH0X3jxVoN2Pv14wrmBYawvuu56A/zLjhwtzhK4UhN4LZtT?=
 =?us-ascii?Q?FcbR8k0GC8+iNRsUEKa2o4tKqfwb+pq+x9cJtJnIMk8aOZpFWrai9em2o1W/?=
 =?us-ascii?Q?bKhnh/pRb/GJXp7V8ZzxeLqDI2G54S5SB3Ofqm1IxzvH7Eii5yr3FQJs/m3k?=
 =?us-ascii?Q?Qf1QBRxCGqGGOJxKRQX8874T?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7056ba34-d72d-4a31-641e-08d9504a3ce6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 15:30:03.0319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k30q6m/CN2LEC2rdS6hYGNmQwm+deEMQOweKPvvNKuv6o8j/rA1IcJ5LnJKQ/GH0HKqNqY7TKMaLOOOGSNimAPnX5eH4em77BBb+5ZrPBKweaZEz3DhMqnft5bXrO8qS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5620
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This reorders a few entry so that they are alphabetically sorted.

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/ref-manual/terms.rst     |  26 ++--
 documentation/ref-manual/variables.rst | 196 ++++++++++++-------------
 2 files changed, 111 insertions(+), 111 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/=
terms.rst
index 54469e507..545100efa 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -213,19 +213,6 @@ universal, the list includes them just in case:
       :yocto_git:`yocto-kernel-cache </yocto-kernel-cache>`
       Git repository.
=20
-   :term:`OpenEmbedded-Core (OE-Core)`
-      OE-Core is metadata comprised of
-      foundational recipes, classes, and associated files that are meant t=
o
-      be common among many different OpenEmbedded-derived systems,
-      including the Yocto Project. OE-Core is a curated subset of an
-      original repository developed by the OpenEmbedded community that has
-      been pared down into a smaller, core set of continuously validated
-      recipes. The result is a tightly controlled and an quality-assured
-      core set of recipes.
-
-      You can see the Metadata in the ``meta`` directory of the Yocto
-      Project :yocto_git:`Source Repositories </poky>`.
-
    :term:`OpenEmbedded Build System`
       The build system specific to the Yocto
       Project. The OpenEmbedded build system is based on another project
@@ -240,6 +227,19 @@ universal, the list includes them just in case:
=20
          For some historical information about Poky, see the :term:`Poky` =
term.
=20
+   :term:`OpenEmbedded-Core (OE-Core)`
+      OE-Core is metadata comprised of
+      foundational recipes, classes, and associated files that are meant t=
o
+      be common among many different OpenEmbedded-derived systems,
+      including the Yocto Project. OE-Core is a curated subset of an
+      original repository developed by the OpenEmbedded community that has
+      been pared down into a smaller, core set of continuously validated
+      recipes. The result is a tightly controlled and an quality-assured
+      core set of recipes.
+
+      You can see the Metadata in the ``meta`` directory of the Yocto
+      Project :yocto_git:`Source Repositories </poky>`.
+
    :term:`Package`
       In the context of the Yocto Project, this term refers to a
       recipe's packaged output produced by BitBake (i.e. a "baked recipe")=
.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 3de37a1ab..e5525e922 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1306,6 +1306,40 @@ system and gives an overview of their function and c=
ontents.
       the recipe will be skipped, and if the build system attempts to buil=
d
       the recipe then an error will be triggered.
=20
+   :term:`COPY_LIC_DIRS`
+      If set to "1" along with the
+      :term:`COPY_LIC_MANIFEST` variable, the
+      OpenEmbedded build system copies into the image the license files,
+      which are located in ``/usr/share/common-licenses``, for each
+      package. The license files are placed in directories within the imag=
e
+      itself during build time.
+
+      .. note::
+
+         The :term:`COPY_LIC_DIRS` does not offer a path for adding licens=
es for
+         newly installed packages to an image, which might be most suitabl=
e for
+         read-only filesystems that cannot be upgraded. See the
+         :term:`LICENSE_CREATE_PACKAGE` variable for additional informatio=
n.
+         You can also reference the ":ref:`dev-manual/common-tasks:providi=
ng license text`"
+         section in the Yocto Project Development Tasks Manual for
+         information on providing license text.
+
+   :term:`COPY_LIC_MANIFEST`
+      If set to "1", the OpenEmbedded build system copies the license
+      manifest for the image to
+      ``/usr/share/common-licenses/license.manifest`` within the image
+      itself during build time.
+
+      .. note::
+
+         The :term:`COPY_LIC_MANIFEST` does not offer a path for adding li=
censes for
+         newly installed packages to an image, which might be most suitabl=
e for
+         read-only filesystems that cannot be upgraded. See the
+         :term:`LICENSE_CREATE_PACKAGE` variable for additional informatio=
n.
+         You can also reference the ":ref:`dev-manual/common-tasks:providi=
ng license text`"
+         section in the Yocto Project Development Tasks Manual for
+         information on providing license text.
+
    :term:`COPYLEFT_LICENSE_EXCLUDE`
       A space-separated list of licenses to exclude from the source
       archived by the :ref:`archiver <ref-classes-archiver>` class. In
@@ -1374,40 +1408,6 @@ system and gives an overview of their function and c=
ontents.
       is set by the :ref:`copyleft_filter <ref-classes-copyleft_filter>`
       class, which is inherited by the ``archiver`` class.
=20
-   :term:`COPY_LIC_DIRS`
-      If set to "1" along with the
-      :term:`COPY_LIC_MANIFEST` variable, the
-      OpenEmbedded build system copies into the image the license files,
-      which are located in ``/usr/share/common-licenses``, for each
-      package. The license files are placed in directories within the imag=
e
-      itself during build time.
-
-      .. note::
-
-         The :term:`COPY_LIC_DIRS` does not offer a path for adding licens=
es for
-         newly installed packages to an image, which might be most suitabl=
e for
-         read-only filesystems that cannot be upgraded. See the
-         :term:`LICENSE_CREATE_PACKAGE` variable for additional informatio=
n.
-         You can also reference the ":ref:`dev-manual/common-tasks:providi=
ng license text`"
-         section in the Yocto Project Development Tasks Manual for
-         information on providing license text.
-
-   :term:`COPY_LIC_MANIFEST`
-      If set to "1", the OpenEmbedded build system copies the license
-      manifest for the image to
-      ``/usr/share/common-licenses/license.manifest`` within the image
-      itself during build time.
-
-      .. note::
-
-         The :term:`COPY_LIC_MANIFEST` does not offer a path for adding li=
censes for
-         newly installed packages to an image, which might be most suitabl=
e for
-         read-only filesystems that cannot be upgraded. See the
-         :term:`LICENSE_CREATE_PACKAGE` variable for additional informatio=
n.
-         You can also reference the ":ref:`dev-manual/common-tasks:providi=
ng license text`"
-         section in the Yocto Project Development Tasks Manual for
-         information on providing license text.
-
    :term:`CORE_IMAGE_EXTRA_INSTALL`
       Specifies the list of packages to be added to the image. You should
       only set this variable in the ``local.conf`` configuration file foun=
d
@@ -2209,16 +2209,6 @@ system and gives an overview of their function and c=
ontents.
          To add packages to the root filesystem, see the various
          :term:`RDEPENDS` and :term:`RRECOMMENDS` variables.
=20
-   :term:`EXTRANATIVEPATH`
-      A list of subdirectories of
-      ``${``\ :term:`STAGING_BINDIR_NATIVE`\ ``}``
-      added to the beginning of the environment variable ``PATH``. As an
-      example, the following prepends
-      "${STAGING_BINDIR_NATIVE}/foo:${STAGING_BINDIR_NATIVE}/bar:" to
-      ``PATH``::
-
-         EXTRANATIVEPATH =3D "foo bar"
-
    :term:`EXTRA_OECMAKE`
       Additional `CMake <https://cmake.org/overview/>`__ options. See the
       :ref:`cmake <ref-classes-cmake>` class for additional information.
@@ -2275,6 +2265,16 @@ system and gives an overview of their function and c=
ontents.
          At present, ``passwd-expire`` may only work for remote logins whe=
n
          using OpenSSH and not dropbear as an SSH server.
=20
+   :term:`EXTRANATIVEPATH`
+      A list of subdirectories of
+      ``${``\ :term:`STAGING_BINDIR_NATIVE`\ ``}``
+      added to the beginning of the environment variable ``PATH``. As an
+      example, the following prepends
+      "${STAGING_BINDIR_NATIVE}/foo:${STAGING_BINDIR_NATIVE}/bar:" to
+      ``PATH``::
+
+         EXTRANATIVEPATH =3D "foo bar"
+
    :term:`FEATURE_PACKAGES`
       Defines one or more packages to include in an image when a specific
       item is included in :term:`IMAGE_FEATURES`.
@@ -2568,10 +2568,6 @@ system and gives an overview of their function and c=
ontents.
       Specifies the signature algorithm used in creating the FIT Image.
       For e.g. rsa2048.
=20
-   :term:`FIT_SIGN_NUMBITS`
-      Size of private key in number of bits used in fitImage. The default
-      value is "2048".
-
    :term:`FIT_SIGN_INDIVIDUAL`
       If set to "1", then the :ref:`kernel-fitimage <ref-classes-kernel-fi=
timage>`
       class will sign the kernel, dtb and ramdisk images individually in a=
ddition
@@ -2579,6 +2575,10 @@ system and gives an overview of their function and c=
ontents.
       intending to verify signatures in another context than booting via
       U-Boot.
=20
+   :term:`FIT_SIGN_NUMBITS`
+      Size of private key in number of bits used in fitImage. The default
+      value is "2048".
+
    :term:`FONT_EXTRA_RDEPENDS`
       When inheriting the :ref:`fontcache <ref-classes-fontcache>` class,
       this variable specifies the runtime dependencies for font packages.
@@ -2768,6 +2768,10 @@ system and gives an overview of their function and c=
ontents.
       -  Given a recipe being built for a little-endian MIPS target runnin=
g
          Linux, the value might be "mipsel-linux".
=20
+   :term:`HOST_VENDOR`
+      Specifies the name of the vendor. :term:`HOST_VENDOR` is normally th=
e
+      same as :term:`TARGET_VENDOR`.
+
    :term:`HOSTTOOLS`
       A space-separated list (filter) of tools on the build host that
       should be allowed to be called from within build tasks. Using this
@@ -2788,10 +2792,6 @@ system and gives an overview of their function and c=
ontents.
       :term:`HOSTTOOLS_NONFATAL` is not found on the build host. Thus, you=
 can
       use :term:`HOSTTOOLS_NONFATAL` to filter optional host tools.
=20
-   :term:`HOST_VENDOR`
-      Specifies the name of the vendor. :term:`HOST_VENDOR` is normally th=
e
-      same as :term:`TARGET_VENDOR`.
-
    :term:`ICECC_DISABLED`
       Disables or enables the ``icecc`` (Icecream) function. For more
       information on this function and best practices for using this
@@ -2879,40 +2879,6 @@ system and gives an overview of their function and c=
ontents.
       The base name of image output files. This variable defaults to the
       recipe name (``${``\ :term:`PN`\ ``}``).
=20
-   :term:`IMAGE_EFI_BOOT_FILES`
-      A space-separated list of files installed into the boot partition
-      when preparing an image using the Wic tool with the
-      ``bootimg-efi`` source plugin. By default,
-      the files are
-      installed under the same name as the source files. To change the
-      installed name, separate it from the original name with a semi-colon
-      (;). Source files need to be located in
-      :term:`DEPLOY_DIR_IMAGE`. Here are two
-      examples::
-
-         IMAGE_EFI_BOOT_FILES =3D "${KERNEL_IMAGETYPE};bz2"
-         IMAGE_EFI_BOOT_FILES =3D "${KERNEL_IMAGETYPE} microcode.cpio"
-=20
-      Alternatively, source files can be picked up using a glob pattern. I=
n
-      this case, the destination file must have the same name as the base
-      name of the source file path. To install files into a directory
-      within the target location, pass its name after a semi-colon (;).
-      Here are two examples::
-
-         IMAGE_EFI_BOOT_FILES =3D "boot/loader/*"
-         IMAGE_EFI_BOOT_FILES =3D "boot/loader/*;boot/"
-
-      The first example
-      installs all files from ``${DEPLOY_DIR_IMAGE}/boot/loader/``
-      into the root of the target partition. The second example installs
-      the same files into a ``boot`` directory within the target partition=
.
-
-      You can find information on how to use the Wic tool in the
-      ":ref:`dev-manual/common-tasks:creating partitioned images using wic=
`"
-      section of the Yocto Project Development Tasks Manual. Reference
-      material for Wic is located in the
-      ":doc:`/ref-manual/kickstart`" chapter.
-
    :term:`IMAGE_BOOT_FILES`
       A space-separated list of files installed into the boot partition
       when preparing an image using the Wic tool with the
@@ -2985,6 +2951,40 @@ system and gives an overview of their function and c=
ontents.
       device table files, see ``meta/files/device_table-minimal.txt`` as a=
n
       example.
=20
+   :term:`IMAGE_EFI_BOOT_FILES`
+      A space-separated list of files installed into the boot partition
+      when preparing an image using the Wic tool with the
+      ``bootimg-efi`` source plugin. By default,
+      the files are
+      installed under the same name as the source files. To change the
+      installed name, separate it from the original name with a semi-colon
+      (;). Source files need to be located in
+      :term:`DEPLOY_DIR_IMAGE`. Here are two
+      examples::
+
+         IMAGE_EFI_BOOT_FILES =3D "${KERNEL_IMAGETYPE};bz2"
+         IMAGE_EFI_BOOT_FILES =3D "${KERNEL_IMAGETYPE} microcode.cpio"
+=20
+      Alternatively, source files can be picked up using a glob pattern. I=
n
+      this case, the destination file must have the same name as the base
+      name of the source file path. To install files into a directory
+      within the target location, pass its name after a semi-colon (;).
+      Here are two examples::
+
+         IMAGE_EFI_BOOT_FILES =3D "boot/loader/*"
+         IMAGE_EFI_BOOT_FILES =3D "boot/loader/*;boot/"
+
+      The first example
+      installs all files from ``${DEPLOY_DIR_IMAGE}/boot/loader/``
+      into the root of the target partition. The second example installs
+      the same files into a ``boot`` directory within the target partition=
.
+
+      You can find information on how to use the Wic tool in the
+      ":ref:`dev-manual/common-tasks:creating partitioned images using wic=
`"
+      section of the Yocto Project Development Tasks Manual. Reference
+      material for Wic is located in the
+      ":doc:`/ref-manual/kickstart`" chapter.
+
    :term:`IMAGE_FEATURES`
       The primary list of features to include in an image. Typically, you
       configure this variable in an image recipe. Although you can use thi=
s
@@ -5074,18 +5074,6 @@ system and gives an overview of their function and c=
ontents.
       ":ref:`dev-manual/common-tasks:debugging with the gnu project debugg=
er (gdb) remotely`" section
       in the Yocto Project Development Tasks Manual.
=20
-   :term:`PACKAGE_EXCLUDE_COMPLEMENTARY`
-      Prevents specific packages from being installed when you are
-      installing complementary packages.
-
-      You might find that you want to prevent installing certain packages
-      when you are installing complementary packages. For example, if you
-      are using :term:`IMAGE_FEATURES` to install
-      ``dev-pkgs``, you might not want to install all packages from a
-      particular multilib. If you find yourself in this situation, you can
-      use the :term:`PACKAGE_EXCLUDE_COMPLEMENTARY` variable to specify re=
gular
-      expressions to match the packages you want to exclude.
-
    :term:`PACKAGE_EXCLUDE`
       Lists packages that should not be installed into an image. For
       example::
@@ -5113,6 +5101,18 @@ system and gives an overview of their function and c=
ontents.
       :term:`BAD_RECOMMENDATIONS` variables for
       related information.
=20
+   :term:`PACKAGE_EXCLUDE_COMPLEMENTARY`
+      Prevents specific packages from being installed when you are
+      installing complementary packages.
+
+      You might find that you want to prevent installing certain packages
+      when you are installing complementary packages. For example, if you
+      are using :term:`IMAGE_FEATURES` to install
+      ``dev-pkgs``, you might not want to install all packages from a
+      particular multilib. If you find yourself in this situation, you can
+      use the :term:`PACKAGE_EXCLUDE_COMPLEMENTARY` variable to specify re=
gular
+      expressions to match the packages you want to exclude.
+
    :term:`PACKAGE_EXTRA_ARCHS`
       Specifies the list of architectures compatible with the device CPU.
       This variable is useful when you build for several different devices
--=20
2.31.1

