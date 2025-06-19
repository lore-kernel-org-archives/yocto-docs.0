Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE77C7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 08:52:33 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.33])
 by mx.groups.io with SMTP id smtpd.web10.10381.1750323149595375291
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Jun 2025 01:52:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=ltcE7cxt;
 spf=pass (domain: ericsson.com, ip: 40.107.162.33, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNUEpg8kpwrR4mf65ZQc9wXXFODaUQnhb8xgpgFgFmB6up56L8ZUN+LWbWPncWOx/A/P6P/GvTPOj5l1PHsX6csjLZls7IdnATShvlLDvhdk71BK+loOkRnHnpuDehT/nyGmfqUkaZELlPKHCNJOhLxwEqynJ+gfoUGyB9E+PzFIyTRf0hUhDobxmCA3ZWag4ylPPjgrNBock+SbCbWnBtO/LqdrNr8cGzMceCDe5ZkfwER4cZwkf6y3iymj2+JDw/Ve1WgBDfSrprPaVQZdlV3jEA8UoaWxZt/vKueXMVhDtY2x38NJdZYjYHGRVbABFgmmDRpskzbxNisxUDHhuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jaHCxeaSgEZ/Z1LTIHSy6y6FzlLI6OqVTKbVm1IyPw8=;
 b=AgwI8FhNxFYagw1l4NV5Mh6g7sPGtYUmIeGLXagEVPbNRzQv70X4uIv7v1r1rPXSm7cwZwhKpmQvzx4z5OBtcbs6tXc377h9zSa1nTbcGabcqIMqU52pQ+s3TO1lp3PEvneYRmjmGOrN45dRJSreKDALN1Tld6BoMgIGNgDlEc9EB18JTJGiTk0oLpZXvuM/zd0rgqY1FTKwttWoABmFjDXVr1U/PK6IEpzbeV2pbgcl9xFTJsBad+2ymuDJ9dmTsKgiZ2uXZyyYVReOWif2A38Us5S0KHK8CAYIDQviW/ouGpXK/xfT212e8FgyWuv9nnuHnoWTj3+BDbEcgZ+6Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jaHCxeaSgEZ/Z1LTIHSy6y6FzlLI6OqVTKbVm1IyPw8=;
 b=ltcE7cxt7bqYCycVNgCGRnrzmG4XH52yKSR8JGXpDaOfpzRtv4PzGzC7EfBMzNa9/F0bnQ0IXoh6KDZ5pN+NM6SxdY5NYBJP5OiNKPNp9r2p+E6AHzfNMzTPFg+me5F3rsxg8oWbPK/My1nclSTYmJ8iE3ZbxXFfAjmWcLczdWOKamwPtLGO9sqpdrwFLWJqDYsgPj25rxLQHTSf1wp2pu9WhGvsPKWhFEAMdBTIhgmncRlxLn+9/NwxOIJy+V3+JlG9LB9dyd1OOOiTuweJAHoNMifp781+ALoGaxe/S0GD4xVjjuHWd71nIFnN3vKM/tLsOcyd60ljr1qJL3zmmQ==
Received: from AM0PR04CA0086.eurprd04.prod.outlook.com (2603:10a6:208:be::27)
 by AS4PR07MB8825.eurprd07.prod.outlook.com (2603:10a6:20b:4f3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 19 Jun
 2025 08:52:26 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:10a6:208:be:cafe::61) by AM0PR04CA0086.outlook.office365.com
 (2603:10a6:208:be::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.34 via Frontend Transport; Thu,
 19 Jun 2025 08:52:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 08:52:26 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 19 Jun 2025 10:52:25 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 9E62E9582F;
	Thu, 19 Jun 2025 10:52:25 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 86BD87083F54; Thu, 19 Jun 2025 10:52:25 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <docs@lists.yoctoproject.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH] Add SPDX_INCLUDE_COMPILED_SOURCES documentation
Date: Thu, 19 Jun 2025 10:52:15 +0200
Message-ID: <20250619085215.1942667-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79B:EE_|AS4PR07MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: ce023526-d996-4c93-8765-08ddaf0e9d73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ShnaEWrY9tHkboMl3G39c5coDc+cwoWVlKFBVkebIGp1OazJFwHPhF1Iqo4n?=
 =?us-ascii?Q?3iVJbYDZKtuBnMMkZBx/Xr4/tXR9X/M9Ou9p6SZ6eoSAKLv5WoLW7nySugfW?=
 =?us-ascii?Q?ADDd6xg4IEBmqsi38Ad7kp8t1LEnBQ6FnBIRhzW730UARAiZGB/cBYGOSDOR?=
 =?us-ascii?Q?0gjmLa9VzTn0hNCxchMf6Cka9IOWggU4dYB3evMaAlsL0y1Ie49i6U1fbFJp?=
 =?us-ascii?Q?m8qBIciE62rCABqq1+IgZEnSxie+3z9pndlLAZxVpPktCdKNjbCd/fhiK0Er?=
 =?us-ascii?Q?5WAs6UhXPKbvErO3Lztlkg5ucE7PqnYh1z9S7vdBKVtDfDf61JTQ/YvwbTcy?=
 =?us-ascii?Q?tuTzoKc0HmaR/j1paRXXMq+5o3aczCKqcH0HjvBKBYBOWbnP7CwS8aF139Op?=
 =?us-ascii?Q?a8LnWtzECX/JCcp23Kaae6HmRY5G1RYIDNFsyJ2TEWf4X+An9I7ca4gYMzwP?=
 =?us-ascii?Q?EHILAgnHIG7NYIsDLzTA99FBPEIe0KMqa62sssR9kX/yFmVJAUKQdrRsM+0S?=
 =?us-ascii?Q?91aL8SmsSsbx9bXkTLsIULt9/tKOT0o53R4sqduGDQCIcOFMTX8q5A10fnJE?=
 =?us-ascii?Q?W+enuO1bsQYtVRs2Lmu40PdZP46vYvmPVV2qi/H60eAJAW9VIT4WE90Vyjnl?=
 =?us-ascii?Q?w3v9fc4ZrZQh7kba41noTfLo2jxpkUqgNiJyrr5nc1SGpHbDlq7V00r1avwO?=
 =?us-ascii?Q?KsmiJ3IoHh4hoqTa+kA8smTu1PBMS8FhqwCtdTf2ksqWz7M4XFF1WJCuUYsk?=
 =?us-ascii?Q?xYdEF/xN4R04diujb6gOXd/k8URbQHTvJJe7uQiVZ1ey67hD/KIjli+Kjwrn?=
 =?us-ascii?Q?gl3/+06b3t6BVYoD1pT4xs2ows5oPIWQk4AA2mKNSh+d+WfVegOxmqgkehfl?=
 =?us-ascii?Q?l6RWXmMt47KVPfwLLwUw1LiVyMPAphM2QgQLtk312M9nBwBjVtF6NWD/ROYR?=
 =?us-ascii?Q?/BBIR+ZExilKweCyl8/wvXd9rqt7vPu9oh3YwLE0bo4PqnutHkEXDbqtrAoG?=
 =?us-ascii?Q?5kV/KtT0rZSHfRZKJQjPP3TTidY7wbk2tGn7g5iksvs24GlhTXoEQ12sT0CQ?=
 =?us-ascii?Q?eTrpqZtR/ONAXGSYKp9xnDav8dNGjuGXtgUOJbgCj4Z6IWZGMLEE+MK4ohr5?=
 =?us-ascii?Q?UNwfk8b5/RyWecbF/Yn/q5oegYrYZ5ybcV4xYb6+NuDIIu4klLh9meP19nVG?=
 =?us-ascii?Q?og9yX1WKfeme8D9vZbIfvl8JyzoAg5F2sJ7a9C9qaH1azEa/iYamHVxnYLt7?=
 =?us-ascii?Q?ZtiFqRa2PylAt7AMl3EcFDoBHgj1VpizfTa7lzv9CcJ77eBKySecknO9r9K4?=
 =?us-ascii?Q?eQsiH8wCEXs2gJqN4prcNN7mFQReqYrtnmfq83X2nNzIJycV1kG+J5AHGTgK?=
 =?us-ascii?Q?vcAHadHNvoG0asuiX1YnewB4G2QfUVFR+xY0mZ2CUWVOSsob35pJZaGkmkEA?=
 =?us-ascii?Q?rhnBZuXB7jIkrtiKh1pcNMCDC2oMEdiGAzb9HZDvZKd4BqN/3BCshtZBgZ5s?=
 =?us-ascii?Q?0SlW1HdF2GYOMe66BWh3s0/O986rmzkjqovi?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 08:52:26.1902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce023526-d996-4c93-8765-08ddaf0e9d73
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR07MB8825
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Jun 2025 08:52:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7107

From: Daniel Turull <daniel.turull@ericsson.com>

Adding documentation for the new feature to store in SPDX
only the compiled sources.

Merged in Oe-core: c6a2f1fca76fae4c3ea471a0c63d0b453beea968
 - spdx: add option to include only compiled sources

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 documentation/dev-manual/sbom.rst      |  3 +++
 documentation/ref-manual/variables.rst | 13 +++++++++++++
 2 files changed, 16 insertions(+)

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
index 5c18b852d..39a134a09 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8764,6 +8764,19 @@ system and gives an overview of their function and c=
ontents.
       image), compared to just using the :ref:`ref-classes-create-spdx` cl=
ass
       with no option.
=20
+   :term:`SPDX_INCLUDE_COMPILED_SOURCES`
+      This option allows the same as :term:`SPDX_INCLUDE_SOURCES` but incl=
uding
+      only the sources used to compiled the host tools and the target pack=
ages.
+
+      Enable this option as follows::
+
+         SPDX_INCLUDE_COMPILED_SOURCES =3D "1"
+
+      According to our tests on release master, building
+      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
+      this option compated with the :term:`SPDX_INCLUDE_SOURCES` reduces t=
he size
+      of the  ``tmp/deploy/spdx`` directory from 2GB to 1.6GB.
+
    :term:`SPDX_NAMESPACE_PREFIX`
       This option could be used in order to change the prefix of ``spdxDoc=
ument``
       and the prefix of ``documentNamespace``. It is set by default to
--=20
2.34.1


