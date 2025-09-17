Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC3CCAC599
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 14:07:13 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.27])
 by mx.groups.io with SMTP id smtpd.web10.23955.1758118023174680722
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 07:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Y16Hk1Pj;
 spf=pass (domain: axis.com, ip: 40.107.159.27, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPu39hby/DsD1kfINXWN2b3BHZdpUNwLkZQCQRz15/5K9mQ3j2rRJDEB0CMBLFNg9dNHDmMGysvIch/3u/qDrousPOIuyfI3UveCkOB6QBNgIgJUpO10Y7gqOurIvZZa3rYXLOJF9ACNCIEv/ysyATPH5JQDD4wpSJ7EEuBu24sySCk1Al2s5ZzBIsUO+lposWsBlaORz2SXYDpguYbiRUA299/+FBlaXcASXSI2I6O3iCVEBd2E9sUgXFNRb1RsLxJGrNDnM3ac6UCROptydNvjSNRtVA1xBl9ypPs6UfNVk7am/iw0/a2hVDtaXVWZ/82uivpxpJ5Y6sPXTpsVGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTStF6a1p7Vyjdh8TU74uxxLLhLC2ZUlgcZEC3WPGQE=;
 b=dlrxP7/sLdnEVIcAHGPThYL+B6vi7SikOjoLbz+KoGApk277m2VqfWpmhQmOM5C/Xa+/R4RiXPY8X7aj1s4E3GEoZKuCdRk3G/sL1qus7C5o7YAb1nTRIhFipV5RgA1zr122zR0k7B3BfNAFIMwI19+lU14fKcUXt3tmmp83Sx+UlDXJoisJDdXuUJNSKPJam57qxKvrSY0Y9ItXzrBvMsFctr0tKZYxr8ftPLUXqSi3BGbVsm7dkRTxhuqyhtlbCuBhgDQ5TUFGnr8vrDyBTqz1vmOau1Rf5mWSGTR0NVcD795LJEBim9kGLfoyaBfZhb000u/EvkW8imc2AedOvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTStF6a1p7Vyjdh8TU74uxxLLhLC2ZUlgcZEC3WPGQE=;
 b=Y16Hk1PjNLcQb1lQLGO45e3Nm3PirMeRspQZ+fHlQk+huCUVxBYbtf6ImVQT9wntha5Rn6i3kC8nTi5+EjX6/E9i1SXwRhlteOrnDBS3oivrkcM/iu5NLIcKJikqbH4WljRJcanF36xIk6QeXa4zkRqrEpO/GbvDaQ2ux9haAfY=
Received: from PR2P264CA0007.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::19) by
 PAVPR02MB9136.eurprd02.prod.outlook.com (2603:10a6:102:320::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.22; Wed, 17 Sep 2025 14:06:57 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:101:0:cafe::d5) by PR2P264CA0007.outlook.office365.com
 (2603:10a6:101::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Wed,
 17 Sep 2025 14:06:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 14:06:57 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Wed, 17 Sep
 2025 16:06:57 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 17 Sep 2025 16:06:57 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id DF3952A2C
	for <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 16:06:56 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 78667122BA2; Wed, 17 Sep 2025 16:06:56 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH 2/2] migration-5.3.rst: Correct info about the removed libsoup-2.4 recipe
Date: Wed, 17 Sep 2025 16:06:53 +0200
Message-ID: <20250917140653.314767-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917140653.314767-1-pkj@axis.com>
References: <20250917140653.314767-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A6:EE_|PAVPR02MB9136:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b42111-2d95-41b2-1d20-08ddf5f376c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Dj/oscehxR7xSvCCRXPu/8MgWfiyCerH+zgnZMClY7O/m/r6wrg59Ppzt+WA?=
 =?us-ascii?Q?EzuRk6FEmxemCPUM1QJgOJm8yH2bbvp5oPXrNax7PPxu0at9ywXf15e/AySl?=
 =?us-ascii?Q?JgEdwhZnFGwDdW2gsXnhTvSX0Acd9fj3VwRDTcV7YUhG3iO2F9IE/5tv+Xqe?=
 =?us-ascii?Q?mPQLwUspIuDAtuZ9WhMas56WYikyKhN/S0MUzpc0X3woP9T+CyxaMZfNZ9jh?=
 =?us-ascii?Q?cJuShTtROnlpBu2IVJYsaD9nioIGN+TSU13GnaD2swnQpopJDi7pPbNj+gzj?=
 =?us-ascii?Q?UtPGunvMpNZYZTTj87pPgsuPiFxeBtr0qLYAA7gDi2QetHpjJ3mb3tojGbPY?=
 =?us-ascii?Q?TAiFOkVEe3ZWIkYbv0uRrIPBskmrl/WdFxPWfXOg/HPviMLkbDiuhVpY+nvT?=
 =?us-ascii?Q?UyV4OoY9l9TUHbRHFafWFY2amhVe5TKKGFldOk8sRmguKhL4ZNfB1il6ryMd?=
 =?us-ascii?Q?2EsONUX6GGz6m0yxG50NwFIga9iMyJftEmARX83PL+PqExOcf71bu9dS/We9?=
 =?us-ascii?Q?sleNAWP0gjkxBfM04hFB3cBpBosGEDwbQdYVD1EAeKqHgrx7gLJ+Y99mzF1P?=
 =?us-ascii?Q?+LMkH3SuCV+utNG3iEzk1sUKTzt7nbzdUH2EEtd2ki3qZcuJdIy/l/08Cgrn?=
 =?us-ascii?Q?KFz/b2s+1msF+oWInMwDK9bTStFg+VBNgMwtDh4yog9BxD+zkPRq8LskaX+G?=
 =?us-ascii?Q?xqKBJ5gCXYntiUZI6ePAd3ZjtWM9OEmaeccBUhM6//pugBZWvhT9wYER/WgS?=
 =?us-ascii?Q?opQTUrTI6NhDZ88PchNSj307HQ9z+aUXlZPQD6QeKF74tjxyzQlpeOPSyWcb?=
 =?us-ascii?Q?zR4El63P5CpYaZn+rjHpZr8FGGplJ2BGpoQpWRJONQTGlNBLJh0R5VJij/xv?=
 =?us-ascii?Q?sl6y4wvqCrYq5G5ETYqogbPXOA4ocaQTuCwivIDaItYxwls8NBFhvjoKLePC?=
 =?us-ascii?Q?LV7qLAFMFzlzlPQcCe+rnyK33M8+hp0UAqIIAlHtJDsyItUPu6izf7HklHyN?=
 =?us-ascii?Q?9+fKs8pY4hk8e+B2W6fHfuhnqye+cabmF4dWDhFcOPXqJcp3iF53pexBOgVp?=
 =?us-ascii?Q?Rurh0+sI1qe2Xpjd8ZjSD7jXF8gom/fOHbc0Omk9aDPxMUksNEghwRBlyoT+?=
 =?us-ascii?Q?h9ISADuQa60W+FUmlkAR2O4YS7Y5M30ujXM8T1c3QUz9GzAPC/hTlZVULEn1?=
 =?us-ascii?Q?Ns7duGGvbV2JYbcSgq3p5XKlyq5ro89Gyi42udzbGo+kziJn0HmAC14jr1rc?=
 =?us-ascii?Q?QAQUUO8A/Gm75IRyNnGr5Sjrjw5tV5nsSVbjYyGz3ml9prmskwY5NEUCwh8S?=
 =?us-ascii?Q?RezE7fxd18LpiKKw4Sw2mxrnjbnF8XhKZu/t1k/mKriigODiHW5yXuj+rdGS?=
 =?us-ascii?Q?ynt7RsWdXM3fn9K6AuRQ5ctbA2tSWh7gip0OCjoDrzTI7Pc6xS07U9e/fVpR?=
 =?us-ascii?Q?69m1cy9CzzvJhTLx+6V8OUoqASc9MzY3U6rwQPhfmgJPd+dUrROVso4qNffx?=
 =?us-ascii?Q?TWF6zJGwOMy3diZH9wPxNiHS/Wu6kIY+CJaI?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 14:06:57.4341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b42111-2d95-41b2-1d20-08ddf5f376c2
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9136
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:07:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7527

It is the libsoup-2.4 recipe that has been removed, not libsoup.

Also add that it has been moved to meta-oe.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 documentation/migration-guides/migration-5.3.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/migration-5.3.rst b/documentati=
on/migration-guides/migration-5.3.rst
index 496427f07..39b9824ba 100644
--- a/documentation/migration-guides/migration-5.3.rst
+++ b/documentation/migration-guides/migration-5.3.rst
@@ -179,9 +179,9 @@ Removed recipes
=20
 The following recipes have been removed in this release:
=20
--  ``libsoup``: The last user in :term:`OpenEmbedded-Core (OE-Core)` was
-   ``gst-examples``, which has been upgraded with its ``libsoup`` dependen=
cy
-   dropped.
+-  ``libsoup-2.4``: The last user in :term:`OpenEmbedded-Core (OE-Core)` w=
as
+   ``gst-examples``, which has been upgraded with its ``libsoup-2.4`` depe=
ndency
+   dropped. The recipe has been moved to ``meta-oe``.
=20
 -  ``glibc-y2038-tests``: removed as the recipe only provides tests which =
are
    now provided by ``glibc-testsuite``.

