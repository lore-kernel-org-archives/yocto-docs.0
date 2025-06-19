Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7CCC7115A
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 13:23:14 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.6])
 by mx.groups.io with SMTP id smtpd.web11.14745.1750339392846612370
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Jun 2025 06:23:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=psOmVDN+;
 spf=pass (domain: ericsson.com, ip: 52.101.71.6, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNnBF5ZeVSbgUfjmPjP/xw8Tl6g0eVG4nJ+ss9aYbJuxspr49rAciiqG5ZTsoYpQCRMOnMmAJAzYbODrYT2mryLAh4Iv0ve/UoBtrNWw1+97SJ/APky/hU/sm2pcEoKDU7Pwp0mps+w8yESBXrASO0EGl352KZ0vaG8Hu+Hccb5NMuMLMX0OEWhF+PqM9yXqbEQbyJnCEGR2r4XeBpaQbydzyOY2nbj0aK0nUeV4yMBtPUm5DJ2oAKOz11nk09B+SSHqDyCO0FNCb6HMblvlnnzLPfLtlSJOIyDCdIazZ5ZRYyMdnrUeaaBNNuenuC2dp8oPP9yrMDAxcDASpPoh2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Op9/Zt6r2MzrPpoFvgshDMoMKnUO/026UwUB96fnXLQ=;
 b=l/HtTj36cFYZ5uVxlKaoXe1cTKSJRMCLreObHrPpC8byfq7bNC28ZFhcnUbcvR0pdl8F98eHWMTzJcFiVDgDAfTmJcupzyEsLPgZtgRI2iLenfIJsC54jVgqR5C4ZXnaWyF0pYVtO0L9EzBMPcLtXaZuEFJO26UjUufVn9VHZfzw42IyZnIESw6Rb8S3U9JCQE/1GIw7wnJ6JHiBtmovSy05BgX7+tb/i5YqSMQ8i2L9stYY1Uw6nUaO4GtpsjWde76rcO6AFey+6sSzA0tlsmMkeeYXqba/jnRU79Yco6kW/TqxOhvQcj5rJEt6ru7YTwJ6YF70+DYpc4eEVO1y8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Op9/Zt6r2MzrPpoFvgshDMoMKnUO/026UwUB96fnXLQ=;
 b=psOmVDN+gQLWI/c6v3mqH2c5Ec4RRjQh0xWcqF8nF3tdDSXuQfXZrfCuL7Ot+973FpBt04EVA6dNBe3TM0+QSl5yRIkcOPXA27gN83zzA6EJaLC+R9xlVeC9HUWtZK52rglEj9ynHL/xwSUYbFq2sN/izEQKvF/QKnFmH/rcIv258obcaSeo6J2utNYX4wE9bqZoue5B0W/qYdysWxvyS0FD3IgZn/F1l/UH6zrRHw3sEdBXM8vFmufnKH8Iw2p3sP8hIJKBBVTx9NWTrz5o7rm/XAA86P8CuyMHjFvovLG2iht51jzIzocIBtBLc5y8g1wNt10tyZ1aiT0lqBLTVQ==
Received: from DB8PR06CA0032.eurprd06.prod.outlook.com (2603:10a6:10:100::45)
 by AM7PR07MB6341.eurprd07.prod.outlook.com (2603:10a6:20b:139::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Thu, 19 Jun
 2025 13:23:09 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:10:100:cafe::51) by DB8PR06CA0032.outlook.office365.com
 (2603:10a6:10:100::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.35 via Frontend Transport; Thu,
 19 Jun 2025 13:23:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF00028D0A.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 13:23:09 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 19 Jun 2025 15:23:08 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id EFDED4020F0B;
	Thu, 19 Jun 2025 15:23:06 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id D35EA7083F54; Thu, 19 Jun 2025 15:23:06 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <docs@lists.yoctoproject.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Antonin Godard
	<antonin.godard@bootlin.com>
Subject: [PATCH v2] Add SPDX_INCLUDE_COMPILED_SOURCES documentation
Date: Thu, 19 Jun 2025 15:22:57 +0200
Message-ID: <20250619132257.2050864-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0A:EE_|AM7PR07MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dcaa76c-dbff-43a8-d14e-08ddaf346ef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6AOG9tFLqS1BF6LciEmkLM4U0wg8f+NChtmhwNLLpeCqtjDXgt5rZFjQCk2p?=
 =?us-ascii?Q?rzWwFBKXQtXSw2lVagxKI30+kVnQGXcIdxS1ABLQJum9oKSXs1Jz6O0peDPs?=
 =?us-ascii?Q?CvzICu405XQJ4R6TgUsn8G23+Of9KjXusfnUfRl3hn15SgMLNtb3H6/QmNl+?=
 =?us-ascii?Q?G58BlzmScMcz2+d/SHK36LzY0TAVpxCvz7L50tokNe1ZTSX4fRntpHh+4tzx?=
 =?us-ascii?Q?jEFRJXPKrr2HN9v6z9MaqjG5rklOVAZuXcUoGTvh1u7UgS20UNBDI8aogIY4?=
 =?us-ascii?Q?rUZ9F3LTuxNavYWpu4bfMQ/FPZiwOrztHWRrC9V+TDUCy1dtrX7aeHM49nJy?=
 =?us-ascii?Q?qJzXk4ket4/YzW2fx9D+cvApqQg2Hye33uxTIGdF+8o6+2bn7vxuX1oeWwkB?=
 =?us-ascii?Q?CYZtOZaS06yQyJvk0XpmtRQD8gbecFhsALrnX/ZYS38GdiDUQ3lCtWoug8i7?=
 =?us-ascii?Q?2ql3ApgHzW3+z1IuQhaODzy1KCDa+7cURDhkep7G0teIOlDAPEZg9afJ/co0?=
 =?us-ascii?Q?leYHGS6NroyrOKtUJ6Ly77fTnKxUmOuvCGB2qWQOHTI5j/VqxCIK3y/9c2QA?=
 =?us-ascii?Q?vxT8/iZkd73KqKAA8qhyIcBsCrHA+X3EhyidRfvzE1piupiRX2a2TepA4ixJ?=
 =?us-ascii?Q?RBwf9f7rZA/jHuai9Wz7mXqykkCLJ+guHCEpoBWxh/c8mf71tZtcUmnZEBYJ?=
 =?us-ascii?Q?+AiJInEJILLCE0nAVcV5vA8GdAWjHnFc5PbI3OuagkN9ZQDcP4PRL1Guy3x0?=
 =?us-ascii?Q?W0b6BZckNvHITtUCl4vEpsm1y14h3I4Mq1gmO6I+ObHbYg7l+3XDHsGRj1N4?=
 =?us-ascii?Q?lUQmPUST1m65ihVp99eVfi29fJ1FJ3gh4gAIUFb53iHxgm8GhjS51FAd2cRB?=
 =?us-ascii?Q?aOjoPPa8SIVsw0csUhGXU5iEH5B6dPFefy1uK0x9gLZtYj+lB5WYSwFWdj/w?=
 =?us-ascii?Q?G6biXehInhRW+7KJR2wotJjZNb5wrR+zUON50wCqjEjtPaFWSSWhqYUHouq4?=
 =?us-ascii?Q?CW5NeuilxOAJ3tuJ+GPyC2ZaIWNXOS7TUTmrGOKn0vwksER9hoo/9OWtaeQZ?=
 =?us-ascii?Q?ac7lA3VEy6DTs3oqonxSH+jJsHBj2WT5mQTPYJ4O4BIf3UcL8d6u8o7xxkDE?=
 =?us-ascii?Q?irpO9ZlZyL2OhL6GCuGAX+q7dapg6ZbagGqQRU0GcQ+FHcjxvcAwDwLM5X4M?=
 =?us-ascii?Q?ISKdp30Z5R8moCcSz1bNBbBzcTuI28Qnvw3ookI083bRIS39SWAOY7jmXXp4?=
 =?us-ascii?Q?Vrjqm5hjTbsPzwWgtVhyp3vA7aL4OLthAVIMX6UAkJoDRXmaQdfKZtU3H9Ef?=
 =?us-ascii?Q?mNH9v8VmfUVWAk5X5vutISrntNViDNzGLpJ42cYqOZXjxixIhFC7vcDNfG3/?=
 =?us-ascii?Q?3e/4bAAMdm3EHi1FBy94tVEVsWBfUbk/esB0dIPK6qGBYr8lgXKyycsv7V1x?=
 =?us-ascii?Q?uvJLZkZi3Xifs6fgww4paLZbeCFt0J/tqvE25GuszAvNYLESJVrb9z6xxyp2?=
 =?us-ascii?Q?7L1SbWVdSdCym0IoMicKSHStCoPJxEgrACRE?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:23:09.0600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dcaa76c-dbff-43a8-d14e-08ddaf346ef6
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6341
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Jun 2025 13:23:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7110

From: Daniel Turull <daniel.turull@ericsson.com>

Adding documentation for the new feature to store in SPDX
only the compiled sources.

Merged in oe-core: c6a2f1fca76fae4c3ea471a0c63d0b453beea968
 - spdx: add option to include only compiled sources

CC: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 documentation/dev-manual/sbom.rst      |  3 +++
 documentation/ref-manual/variables.rst | 22 ++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual/s=
bom.rst
index e6806ce92..ca0fc8b9d 100644
--- a/documentation/dev-manual/sbom.rst
+++ b/documentation/dev-manual/sbom.rst
@@ -60,6 +60,9 @@ more information in the output :term:`SPDX` data:
 -  Add a description of the source files used to generate host tools and t=
arget
    packages (:term:`SPDX_INCLUDE_SOURCES`)
=20
+-  Add a description of the **compiled** source files used to generate hos=
t tools
+   and target packages (:term:`SPDX_INCLUDE_COMPILED_SOURCES`)
+
 -  Add archives of these source files themselves (:term:`SPDX_ARCHIVE_SOUR=
CES`).
=20
 Though the toplevel :term:`SPDX` output is available in
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 5c18b852d..7f26bfb8e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8764,6 +8764,28 @@ system and gives an overview of their function and c=
ontents.
       image), compared to just using the :ref:`ref-classes-create-spdx` cl=
ass
       with no option.
=20
+   :term:`SPDX_INCLUDE_COMPILED_SOURCES`
+      This option allows the same as :term:`SPDX_INCLUDE_SOURCES` but incl=
uding
+      only the sources used to compile the host tools and the target packa=
ges.
+      While :term:`SPDX_INCLUDE_SOURCES` includes all files in the source
+      directory as source file descriptions, :term:`SPDX_INCLUDE_COMPILED_=
SOURCES`
+      includes only the sources that are used to produce the binaries deli=
vered
+      as packages. The source files that are not used during compilation a=
re not
+      included in the SBOM. It uses debugsource information generated duri=
ng
+      ``do_package`` to filter out source files.
+
+      This enables an external tool to use the SPDX information to disrega=
rd
+      vulnerabilities that are not compiled in the packages.
+
+      Enable this option as follows::
+
+         SPDX_INCLUDE_COMPILED_SOURCES =3D "1"
+
+      According to our tests, building ``core-image-minimal`` for the
+      ``qemux86-64`` machine, enabling this option compared with the
+      :term:`SPDX_INCLUDE_SOURCES` reduces the size of the  ``tmp/deploy/s=
pdx``
+      directory from 2GB to 1.6GB.
+
    :term:`SPDX_NAMESPACE_PREFIX`
       This option could be used in order to change the prefix of ``spdxDoc=
ument``
       and the prefix of ``documentNamespace``. It is set by default to
--=20
2.34.1


