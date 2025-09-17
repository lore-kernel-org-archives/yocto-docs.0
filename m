Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BECACAC59D
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 14:07:13 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.67])
 by mx.groups.io with SMTP id smtpd.web11.23997.1758118022599955157
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 07:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=jg1AdqN2;
 spf=pass (domain: axis.com, ip: 52.101.69.67, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t45J+nmjef8bbpw5qA9Kx3vdcd5GITCInaCoP5j0efd3A1Iuj7LgVxpnbcOhflEUvQdw8a8+YEiTHAZs4Gbyx0jSaGNS50vkOCNyMPKwH+249CXy8sqeZ3CrRxClgxV7JgOy950C2RPAkLPN5FKEtsjrpoTdUfaBXbMTbTq+SqnPfd00uH8h7eJw6Ro9BacPC8IJmgNOF4FzElbblsjWLfZ87+qVIsyW8VHCx+EJcvfUZaCgR5FVD1L6GheQiHNEperMrrKtRhTdLdm1MbtyRrBdX1niVOgJPRkK+RK2qcSylFvVJVVyB7pr40k886czQQdu9d7Md8PrOc62w2eY+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oENwEvgwSrlu0fu//wrnlOPfh/F/bOc93y4moouJNVc=;
 b=Z3DiKCqQoydrtjOgJJKpQxlbnlPTWTclaiV937bSUZcDWYAHxPrpgV2qBtdB83upEuKWF6FBmpS9J2m2K7nS8+b0z6SKSfkuFS2YC78Q79QujqlpfDWKQS0xbB3O7aVbR4Xt0q8VvawVUdwnXC5HrF0EF5ODUJuNP9pv3UIiCT8P7H35NLMRn4ua4DPzH6T9ri3IZsxf42Zo6+1iMVLnOiwv34IbqR9/WIdfhIIHtfhcAsKpN07dO2VD9ezfV1/jTMBlYI1u+4BSutWTta+n06DgBS2uig7xLzwE79Q8bfIEtB6hjA/mGPKZtfrsPaOVzhhKVDdt7If4IwtnEV5yBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oENwEvgwSrlu0fu//wrnlOPfh/F/bOc93y4moouJNVc=;
 b=jg1AdqN2nEzPY42vmB9cGy7roWsJXs5+BsQzTeFPy0B8WG0MooNXkZnesnKREKi9wtsmp6KDsFeq2NRAxksJtKn+a+6u2uIiBiz5q4VgMfUBSZfT6A5xGgNIA1QrJAUX8cjDamYpKpOl9S7jy/WXiuezTkt4hsmcc9J5YWiYtO4=
Received: from DB9PR05CA0019.eurprd05.prod.outlook.com (2603:10a6:10:1da::24)
 by DU2PR02MB10208.eurprd02.prod.outlook.com (2603:10a6:10:46f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Wed, 17 Sep
 2025 14:06:57 +0000
Received: from DB5PEPF00014B9D.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::9) by DB9PR05CA0019.outlook.office365.com
 (2603:10a6:10:1da::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Wed,
 17 Sep 2025 14:06:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B9D.mail.protection.outlook.com (10.167.8.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 14:06:57 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Wed, 17 Sep
 2025 16:06:57 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 17 Sep 2025 16:06:57 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id DEB172992
	for <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 16:06:56 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 7597F122BAE; Wed, 17 Sep 2025 16:06:56 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH 1/2] migration-5.3.rst: Correct a typo
Date: Wed, 17 Sep 2025 16:06:52 +0200
Message-ID: <20250917140653.314767-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9D:EE_|DU2PR02MB10208:EE_
X-MS-Office365-Filtering-Correlation-Id: d9b32d1d-71e2-42c4-dea9-08ddf5f376ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?k+6I7MMwZontXdrXqzF4v5keVGd1I/Z5qgY6+WX2qTRYYyIkptkdP+2Kk2Wo?=
 =?us-ascii?Q?H80NdFuQVY43FUZksFsJslsVuzJy1FDMG82F5GVMKvjeut+qRPrrR2J3W3M5?=
 =?us-ascii?Q?01Wh/Fws/zwVk//9vyWCzSDGb8NtVfPWIsCovWP6zwQ3K4SnPJ8E3/2xyQ1S?=
 =?us-ascii?Q?35E8mjqAby2R40dcwrabR+v9qYZTZ1Vd+vBYl14X3tKkD6lcedst25V3eF+Y?=
 =?us-ascii?Q?ZOZzpndpvKYiESFOY2ZW8Fceg+4OfmTKhzF9Z3z+OodFaooEd11K7rFb/wLF?=
 =?us-ascii?Q?/ppC4xk91mwDI+bUBnlf/a3t+ST0FcldUvU4Y7+haowGZ72xOWcRslQDRyX6?=
 =?us-ascii?Q?W5bfFY6n8vbxENsbUAagBUsxryYsEPZnu9KsXgnE+0vOhhrKNhlsYBG2BZrv?=
 =?us-ascii?Q?Z5apcOVc5g0F8izhb/wEq2BAzbNZWHo8n5XE1NC4xGAMe2zIjhhXVXCvl/3c?=
 =?us-ascii?Q?WZr5umUBi64/uq1RH9m91lxSilaDAH56Q0oIgfzDWX/HjzjN3T+OcVcI8Yjt?=
 =?us-ascii?Q?HX9mNJIH6b/8EbOR85H2D2BE3Gj6M/bbQLc7jx52JAipi4Gx54nq3gl09e/i?=
 =?us-ascii?Q?8mQ1oWMZp6tvn8ARiVqylCdoJT6fYzifQe6PvcKiu6sLOzZoa7V1uOb0oJEF?=
 =?us-ascii?Q?qLNZZvk/nX8wzE0FJhd8m446bM2XPNfl0cJaKH2BB1tJ+2w7qGZd8oQgr+xr?=
 =?us-ascii?Q?bqAjmD9gQPj1buDsChNetq9iUP5jV1KzQayPpdCVm71ZuLTMRNa2xM1uCqnh?=
 =?us-ascii?Q?SBiakjCB2koeR8kSzWPpZePFsDr+wMbDHppD2trB1LTRVe0eXuj0tl6tib/M?=
 =?us-ascii?Q?tiYI6+msWIRy259c0N50+OEOhxnH5IQXYfVF2FZBhsjlAwVnvorTc9WLWZcK?=
 =?us-ascii?Q?3ZCaBGGyBGYX5BN+zIhKX1xr956Bf1LQtGRTTRUWa/JAN65Pjqbk42UVpUCn?=
 =?us-ascii?Q?BhUS/hjdbkwIjqGLr/DKW6+4POrmVGR7WnjucZ09KSBnfIs1ajUS4DGIvrPA?=
 =?us-ascii?Q?Z3DENmqaaWSC73Seu+/C5otkjo2oXqYjz8+u/2IpAshBHjZnIE64LYCGEJzt?=
 =?us-ascii?Q?RBX+1V5XcGcJIVVbPrvg0qV6f71+n9CYzPfC8rqkYSgex6qvBh93K0p84yvU?=
 =?us-ascii?Q?o0mG9rJew1F7tJSGqsMkVtiJ4mhXWspzbyIF/B76Sfe1r3ofn/915yCDJF7v?=
 =?us-ascii?Q?hlpsgzSOOCfif0lYlO9WDccP63m/vDno3LJmoNMV6dZO/8x9HAnR4eDOFlq3?=
 =?us-ascii?Q?yRSKJD6yWLKSkniWfF3Vt8f7b2+6VKxy9dyCodszNLVag4FjFHnn+diDW2aM?=
 =?us-ascii?Q?JJCkVzT63owz72ez0W+2XkDm2V7pphH9CbU1F3VR/qmmJ5/Gn3V6mMYEIIIF?=
 =?us-ascii?Q?LbVVnQzlkE3eTc6Uv54q9iubfy/oJ3Q5j+VxzpBQNe6NlIbwWrjYKEEBgEGz?=
 =?us-ascii?Q?D0owMdBCzbK+SlbGXCaQlKooXyrJiNf3kEKu8aYJFzHPy+cUx1/Mxv7WyyDG?=
 =?us-ascii?Q?vxdCWtXekVpDHsGnNrBilDwbjnoI44nZn1gi?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 14:06:57.4788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b32d1d-71e2-42c4-dea9-08ddf5f376ca
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR02MB10208
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:07:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7526

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 documentation/migration-guides/migration-5.3.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/migration-5.3.rst b/documentati=
on/migration-guides/migration-5.3.rst
index 748e51bb6..496427f07 100644
--- a/documentation/migration-guides/migration-5.3.rst
+++ b/documentation/migration-guides/migration-5.3.rst
@@ -109,7 +109,7 @@ However, the current WIC code automatically converts da=
shes to underscore for
 any ``--source`` call, so existing WKS files will not break if they use up=
stream
 plugins from :term:`OpenEmbedded-Core (OE-Core)`.
=20
-``fitImage`` no longer supporter for :term:`KERNEL_IMAGETYPE`
+``fitImage`` no longer supported for :term:`KERNEL_IMAGETYPE`
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
 The ``fitImage`` type for :term:`KERNEL_IMAGETYPE` is no longer supported.=
 The
@@ -269,4 +269,4 @@ Miscellaneous changes
 -  ``xserver-xorg``: remove sub-package ``${PN}-xwayland``, as ``xwayland`=
` is
    now its own recipe.
=20
--  The Wic-specific option ``--extra-space`` has been renamed to ``--extra=
-filesystem-space``.
\ No newline at end of file
+-  The Wic-specific option ``--extra-space`` has been renamed to ``--extra=
-filesystem-space``.

