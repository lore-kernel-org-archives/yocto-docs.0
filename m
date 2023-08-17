Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41444C3DA49
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 15:51:56 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.120])
 by mx.groups.io with SMTP id smtpd.web10.422.1692287513220106221
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 08:51:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=TYTyrEGd;
 spf=pass (domain: ni.com, ip: 40.107.237.120, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhc0fUghbVsbwtbHqQQoHmg1U/5+revFo8IjF5a+VVcKchVzuy7h2cjyBybN66JRC09hB6dmBPVHPduTb68Z2/Ty6eTBR1CGsK17Xb4fi89ojfMXyAIggCiJa0xHtIew6APWDEvy/QSOulXg8EIjauaka/oniOHW1fUClTv7c0MCBEyqEt1eXeBcmlu+qs59LBqzIS1xoXdNH+VdsZw3oiGxART8xWZrLmabAZky3FN675VXL7W9O51yo4e1Jd694XNYLyDKQk6dtkRBrBtyuT20gl9/4r5jtIDF0CBBqOpCt0WpM76AgymY4ISifUQ62m1n7VdR+ZWtQPHTMi6hSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iMc5QU/pfYi8byndSH4mbNhe4ZoOfXQYPGRGbOVP2g=;
 b=QJRpOVjm5rQP2d4z6Z2sHuiPq53xOVGa1/Q4AMxgyoeLHXIZTDNv/KdEvG0xmqY1MKbkWgECVWYzTGL9WCb+AUpgeeGaChMJemlo/cGZTZN+noQWuzleT/RzHMJr89y4VF35ZJ0ewBQo6gEudrtiWT5vRzzJzDCxMefz9inN50CsnUTkntdqKkplLkyToA5G+VUDZickNlKQVLDGF7inku80HiFFmvaV106/s8p4nJlgIWIOeu4C43+CRwwfs3pdzHmwvikRu8jhRwbmcLpB73G4Cw5D9SlElLDQ6BOwrDZ3H9z4RnQ44MgLMfxG30BMVQ61xQ9GGxv0xDAZxLHs9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iMc5QU/pfYi8byndSH4mbNhe4ZoOfXQYPGRGbOVP2g=;
 b=TYTyrEGdLeEzOc+F50tCLNKfGZmG+LfUC8qcwfOsd8UJy+/kRou/CNXtJiHGKihICMaWIdBxWeE2SoWQ5BNqICYPEuEZH+1p7xBklro/mgyJAdGfAKXb0bQnOoZhnIef18Hr7kOL77dqCL0zppJYeZThe43pUaW3xQZejBdOicE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by MN2PR04MB6877.namprd04.prod.outlook.com (2603:10b6:208:1ea::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 15:51:50 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 15:51:50 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: docs@lists.yoctoproject.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [PATCH 1/5] manuals: Add documentation for new packagefeed class.
Date: Thu, 17 Aug 2023 10:50:40 -0500
Message-ID: <20230817155143.2578874-2-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817155143.2578874-1-charlie.johnston@ni.com>
References: <20230817155143.2578874-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DM6PR17CA0029.namprd17.prod.outlook.com
 (2603:10b6:5:1b3::42) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|MN2PR04MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: afd753a4-b30f-4ec5-8204-08db9f39deec
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j3gFXQBTIz7xOP+PbUBDJVNjrx8D2AT1C93SkCGv8+GnhoSY8PtkCwKqAQv77LxxjXaGGF60Lotq7GeqEAPMXXiRP6cGxvZB43fCXLByKPsB0bVQJke7ZFZcwlrmRnd58maVXT5dQ7VE3KZiBoEI6hR5p39936OP6nbvl4hEbRXEmt7ck5dvQsk4/GGf7VFdQCQSpwddWf3uoVauR7nXkYLyzBrG1QC0Wk5XBf4zofNeiPAkWr4ciBl6H+v6blqxpstajT2+SoCtixrEsx/hGnXdqTCsdaenSJULgicMgok/rnkup9Nxt8k0LEZRRMJH8oIPv5HIBUOQ95SRk9aOoSP2rOhGK4cFYWCtx5y7BmkiPv7ZLzK/MY05ZbSy7fVT/tPEjdmXb7Nm7BIhVUsFV6+3Nln83aGfRx051GeGnDGvFmB8Ixr8LOYbAG0LlS/vleyflx11cbXOM+/i8kc3Momx9GzENeGkNfO0XigboSk+yo5cbrAh2hPgWzRCRBOmkl4G1lFYNq3XM9P0WR0p1Y0sygolU5fEHfvJPquoS6tBb03aot8mNqcnfqeM9eHz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39860400002)(346002)(136003)(366004)(186009)(1800799009)(451199024)(83380400001)(2906002)(66946007)(66476007)(6486002)(6506007)(66556008)(6916009)(316002)(26005)(6666004)(478600001)(5660300002)(44832011)(2616005)(4326008)(6512007)(41300700001)(8936002)(8676002)(1076003)(86362001)(36756003)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZHQJupXsUNx9nBZAz0HkW7K6zbC+8NDBFBgh79ScwjSF55l24cBMuz9vm/yf?=
 =?us-ascii?Q?3+dP6iHFh18Se3z1NNhanMk5Yu+MzDtdrBC4yHCUaMmP+PpAJySjjRLz5+BW?=
 =?us-ascii?Q?DTNoU+HKwXEIijo/EXZwWy7/5YmDe27k5diaSH0IRDRRHZX6cI4NUTRXURu9?=
 =?us-ascii?Q?Fo61RIZ+0H+37Y4QMczo/dXYLUBH5Hc66Z4poU32/Ig2sP/F7lYO+xSsuWkt?=
 =?us-ascii?Q?bBDDPCkSChwFvS2tLR4cUu896kl2V1rOKoF8/5koDbCZlnlsuBU6b1T5Wfxr?=
 =?us-ascii?Q?SVieZ24hMOjPCT85J+JiUQwlhRv1Bq7akxgn+2YCyQHwbI+QJ03MOqaZxip/?=
 =?us-ascii?Q?Ke3GIijRWXmmn7P6yqDhMIUcvjfmSc3VXqc12l2zWZ21JpjvpB82/7BEZqFu?=
 =?us-ascii?Q?nar6qsQL8fFA8C0MyaE8NZXdPdDBf5v+SARyCtJ0Yxnj96Dl2GKsbY9mbMEV?=
 =?us-ascii?Q?fEYXq0ENb0X0KL9ESX5CN8X14RKFLs3WTTd1aa8TUkFdefsHQC6ZE4c88QXV?=
 =?us-ascii?Q?nbUDIGOuoTyOiC/0fPTi58NfOqOw464WFY08WA5grIGm2+sJSDxEYfAY93i/?=
 =?us-ascii?Q?6KbBzNVzoXapq6Z4WhuVWket8nlQXb8yHhInlJtqRc6o1R1ePLmZ8v2KJlnM?=
 =?us-ascii?Q?2lz0F8Qq1dpO10Uf6aK5nTc9Xbcif0hoz3Q+r4J0zJRWggXl5w8Tjqrk5U8S?=
 =?us-ascii?Q?OY6T0bLd2RKv9HDzvpZf14aiCe702S3tJB47Lr7L6mMOWMtPmf+0Y85dfFc9?=
 =?us-ascii?Q?wxcdP7+fkjUJENLjJIDpcToeL/oB0x5VeQmzQCxHWw8kSNtSAEQRuYFF5w7q?=
 =?us-ascii?Q?nMPavm5ccDxEMqg8jGjAZaLWBW6Z+0JyxoXa9q0bI2jYLgZ7uQM2pnmgUaNh?=
 =?us-ascii?Q?Y8xBd2+0dkLPjjf5JL4c9Pxx5awo+NWRm8u2D6zHAVONb58+yCnvB8FikMqO?=
 =?us-ascii?Q?qj7zk9517yAN0/LlPAdIe/jNSMwU3DvPMNgBDcilOQZUD1GB6PZOzbKmcTZE?=
 =?us-ascii?Q?4MNmsHJ6MyRPhyqI9atcIknzXRoztFTGbfH0l/JGaidzVmNSwWsjQVEjwgNy?=
 =?us-ascii?Q?1DY4rblN3UBAVaf7yDifaGulNRdDQ6IIWg0Ys3fi7YSYri8wAJuEFy0lMvxv?=
 =?us-ascii?Q?Ua9BE4MZYAqS51i+0Ne0m4JHEBboTcoxp1OvW3mQ1rC0E//lbZqLnLxGd1cG?=
 =?us-ascii?Q?08ABAYaZ1ncFJ3ZJBR799qwfCjzJbNHbbgrRjOuMegpCiYBpBlH0iMxD+rMe?=
 =?us-ascii?Q?3DMIJq2DGB4zdJ+0gEkXItF8wvlMbWNefEhNO43I0D6dTFDOUHqlE+Rcst75?=
 =?us-ascii?Q?UEnM0CJtKdTiED7MXA15rI5LznMsi5YXRiqt6kd9NM46Go1qY/sh4SbD2nTI?=
 =?us-ascii?Q?/e/4yXyDaV3m2+wstjrREzOfKjhNToO95PtH1tuhKSVgHtdyZrIi/beM+rAY?=
 =?us-ascii?Q?fK/POQ1sRcPWIGk0XE+7UO48kFt8vDrfqEPk8ybXVWQFYB9P3adCiC4TCNb8?=
 =?us-ascii?Q?Zu3VFo1KnYv0Ql4UQmr+wNfMNTaVzkrxqG3nh9+U/89h2WMxWI0T34DRnmCz?=
 =?us-ascii?Q?khoOewJk55+uLczNFa1k51YADaq9FV4gB89Q3jzF0rc3FvBLt7ztANoI8F+U?=
 =?us-ascii?Q?zg=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afd753a4-b30f-4ec5-8204-08db9f39deec
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 15:51:50.6349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qARZ1hOMb/Va0CFMI9W6qcZs4sdRjaEZyVJ4gr6Y3mPzmzSs5wa/uP409gyynyKlQ+VcukjcpP7d2ie2VX4PrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6877
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Aug 2023 15:51:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4157

Adds the initial documentation for packagefeed.bbclass
and the related task do_packagefeed. Includes new material
in the variables, tasks, and classes manuals to cover the
new class and related plumbing.

Documents:
- packagefeed task
- packagefeed_* bbclasses
- DEPLOY_DIR_FEED* variables

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 documentation/ref-manual/classes.rst   | 33 +++++++++++++
 documentation/ref-manual/tasks.rst     | 17 +++++++
 documentation/ref-manual/variables.rst | 65 ++++++++++++++++++++++++++
 3 files changed, 115 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manua=
l/classes.rst
index a7819d5b6..c632d1670 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2243,6 +2243,39 @@ OpenEmbedded build system.
 This class is enabled by default because it is inherited by the
 :ref:`ref-classes-package` class.
=20
+.. _ref-classes-packagefeed*:
+
+``packagefeed*``
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The :ref:`ref-classes-packagefeed*` classes create a packagefeed (or repo)=
 for a
+specific set of packages including the generation of package indexes. The =
classes
+included are:
+
+-  The :ref:`packagefeed <ref-classes-packagefeed*>` class, which is the t=
op-level
+   class to inherit in a packagefeed recipe. It handles creating the feeds=
 and any
+   index files needed.
+
+-  The :ref:`packagefeed_deb <ref-classes-packagefeed*>` class, which supp=
orts feed=20
+   creation for ``.deb`` packages. ``.deb`` package feeds are created in t=
he
+   directory specified by the ``${``\ :term:`DEPLOY_DIR_FEED_DEB`\ ``}`` v=
ariable.
+
+-  The :ref:`packagefeed_ipk <ref-classes-packagefeed*>` class, which supp=
orts feed=20
+   creation for ``.ipk``` packages. ``.ipk`` package feeds are created in =
the
+   directory specified by the ``${``\ :term:`DEPLOY_DIR_FEED_IPK`\ ``}`` v=
ariable.
+
+-  The :ref:`packagefeed_rpm <ref-classes-packagefeed*>` class, which supp=
orts feed=20
+   creation for ``.rpm`` packages. ``.rpm`` package feeds are created in t=
he
+   directory specified by the ``${``\ :term:`DEPLOY_DIR_FEED_RPM`\ ``}`` v=
ariable.
+
+A package feed with indexes is created for each package type included in t=
he
+:term:`PACKAGE_CLASSES` variable. Packages are hard linked or copied direc=
tly from
+the deploy directory for the package type.
+
+For information on package feeds and how they are created, see the
+":ref:`overview-manual/concepts:package feeds`" section in the Yocto Proje=
ct
+Overview and Concepts Manual.
+
 .. _ref-classes-packagegroup:
=20
 ``packagegroup``
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/=
tasks.rst
index 0db960b22..649d19fd7 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -779,3 +779,20 @@ sure that the machine and metadata branches as specifi=
ed by the
 :term:`SRCREV` variables actually exist on the specified
 branches. Otherwise, if :term:`AUTOREV` is not being used, the
 :ref:`ref-tasks-validate_branches` task fails during the build.
+
+Feed-Related Tasks
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+
+The following tasks are applicable to package feed recipes when creating
+custom feeds or repos.
+
+.. _ref-tasks-packagefeed:
+
+``do_packagefeed``
+------------------
+
+Creates custom package feeds in the ``${``\ :term:`DEPLOY_DIR_FEED`\ ``}``
+directory for use outside of the build system. A feed is created for each
+package type specified in the :term:`PACKAGE_CLASSES` variable. For more
+information, see the ":ref:`overview-manual/concepts:package feeds`"
+section in the Yocto Project Overview and Concepts Manual.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 44e2dd08a..dba215acb 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1955,6 +1955,71 @@ system and gives an overview of their function and c=
ontents.
       ":ref:`overview-manual/concepts:package feeds`" section
       in the Yocto Project Overview and Concepts Manual.
=20
+   :term:`DEPLOY_DIR_FEED`
+      Points to the area that the OpenEmbedded build system uses to place
+      custom feeds.:term:`DEPLOY_DIR`. The BitBake configuration file init=
ially
+      defines this variable as a subdirectory of the :term:`DEPLOY_DIR`::
+
+         DEPLOY_DIR_FEED =3D "${DEPLOY_DIR}/feeds"
+
+      This variable is used to construct the default locations of feeds
+      for each package class. See :term:`DEPLOY_DIR_FEED_DEB`,
+      :term:`DEPLOY_DIR_FEED_IPK`, and :term:`DEPLOY_DIR_FEED_RPM` for
+      those definitions. For more information on package feeds, see the
+      ":ref:`overview-manual/concepts:package feeds`" in the Yocto Project
+      Overview and Concepts Manual.
+
+   :term:`DEPLOY_DIR_FEED_DEB`
+      Points to the area that the OpenEmbedded build system places feeds
+      of Debian packages that are ready for deployment outside of the
+      build system. This variable applies only when :term:`PACKAGE_CLASSES=
`
+      contains ":ref:`ref-classes-package_deb`".
+
+      The BitBake configuration file initially defines this variable as a
+      subdirectory of the :term:`DEPLOY_DIR_FEED` with the feed name::
+
+         DEPLOY_DIR_FEED_DEB =3D "${DEPLOY_DIR_FEED}/deb/${PN}"
+
+      This variable is used by the :ref:`ref-classes-packagefeed*` class
+      when constructing feeds for Debian packages during the
+      :ref:`ref-tasks-packagefeed` task. For more information on package f=
eeds,
+      see the ":ref:`overview-manual/concepts:package feeds`" in the Yocto
+      Project Overview and Concepts Manual.
+
+   :term:`DEPLOY_DIR_FEED_IPK`
+      Points to the area that the OpenEmbedded build system places feeds
+      of IPK packages that are ready for deployment outside of the
+      build system. This variable applies only when :term:`PACKAGE_CLASSES=
`
+      contains ":ref:`ref-classes-package_ipk`".
+
+      The BitBake configuration file initially defines this variable as a
+      subdirectory of the :term:`DEPLOY_DIR_FEED` with the feed name::
+
+         DEPLOY_DIR_FEED_IPK =3D "${DEPLOY_DIR_FEED}/ipk/${PN}"
+
+      This variable is used by the :ref:`ref-classes-packagefeed*` class
+      when constructing feeds for IPK packages during the
+      :ref:`ref-tasks-packagefeed` task. For more information on package f=
eeds,
+      see the ":ref:`overview-manual/concepts:package feeds`" in the Yocto
+      Project Overview and Concepts Manual.
+
+   :term:`DEPLOY_DIR_FEED_RPM`
+      Points to the area that the OpenEmbedded build system places feeds
+      of RPM packages that are ready for deployment outside of the
+      build system. This variable applies only when :term:`PACKAGE_CLASSES=
`
+      contains ":ref:`ref-classes-package_rpm`".
+
+      The BitBake configuration file initially defines this variable as a
+      subdirectory of the :term:`DEPLOY_DIR_FEED` with the feed name::
+
+         DEPLOY_DIR_FEED_RPM =3D "${DEPLOY_DIR_FEED}/rpm/${PN}"
+
+      This variable is used by the :ref:`ref-classes-packagefeed*` class
+      when constructing feeds for RPM packages during the
+      :ref:`ref-tasks-packagefeed` task. For more information on package f=
eeds,
+      see the ":ref:`overview-manual/concepts:package feeds`" in the Yocto
+      Project Overview and Concepts Manual.
+
    :term:`DEPLOY_DIR_IMAGE`
       Points to the area that the OpenEmbedded build system uses to place
       images and other associated output files that are ready to be
--=20
2.41.0


