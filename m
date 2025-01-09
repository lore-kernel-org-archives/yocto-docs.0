Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9F5E77199
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 08:14:27 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.56])
 by mx.groups.io with SMTP id smtpd.web10.42865.1736410460546709489
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Jan 2025 00:14:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arri.de header.s=selector1 header.b=VPWQZi/J;
 spf=pass (domain: arri.de, ip: 40.107.20.56, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyMrZyiGmAwFLqMpQKmWyjIWraAruF427vLLZ8WD8gWMVDMFUF2RMa7Ce1UZdBZLVxtJGBTrnQhVEfVRvKkzWMgiWy6MngWrmS1qgcxXXTyHBzvNx7dvUnDrThVV7m79XWymdkLLAEsmPRV8krGg5eMlAoxNm1BlqPtgv+z0fVAks3+TrIpyFalycRB+7gc8Uzk6TC7VOwudh06HJMU1r+Je3PCkTFLj7o5TrAFI2+Iip8nJVUb+++3n4BMyNesZmbMZ3PJNYlAAnaDXeF5cR0RLLncPnq3H2Yv40PhdNuA6JVKMrVusGscYPhSceRBK4onw284Zm9Wq/fscU1yDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bUGvV8zlFDYdkYaJCttC7JOVX6FpYJjAlVHskV/EbQ=;
 b=HI7yoWrx86mUnBrMMUHjT3CAFavZyNA1fV19r2vpNfqM7L5z4eiojpLxx+bLaVv5/9hZijNtKVQOkC0cP612GilACNqcYfojVvvzl8jS1bhV/cjqz+kbXbsjElvl4DfX9NyYSfO2kqpRKxUOxKPJrh9wwAf78JmhhJO5luV8RBy3QI1RDw5k8f72DchOmgHyV6bcOcTXISQadMUSvEUQsX+LJoxPSVP43MgN66r14QFsq/ae8uVmrS2EoUpMmW7ZEQeygTla4NOFH7v3SB6Bv+gorDwzmhLWREKYIG03cy4Vu1WN48g6VXnDdkqPQ117TNcaTgwyrrr2ZKxML6bcCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arri.de;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bUGvV8zlFDYdkYaJCttC7JOVX6FpYJjAlVHskV/EbQ=;
 b=VPWQZi/JREaTy1+jbUlvMakEEcjDugxnGOWKtxQ9sfrVto1KK4SAEndE50alTUacxVGM1fBl278DnzlPeRHR8tmltjMPnLdXxoyNmxTIJnQU6eiy4QbEpEL/4faSpoDLv9sRtXuzxOxYjPAyTAKzwxuDcOX3/d3rS6D0FKS6dS0=
Received: from PR1P264CA0129.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2ce::6)
 by AS8PR07MB7174.eurprd07.prod.outlook.com (2603:10a6:20b:25f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 08:14:16 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:102:2ce:cafe::34) by PR1P264CA0129.outlook.office365.com
 (2603:10a6:102:2ce::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.12 via Frontend Transport; Thu,
 9 Jan 2025 08:14:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Thu, 9 Jan 2025 08:14:15 +0000
Received: from n9w6sw14.localnet (10.30.4.249) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.38; Thu, 9 Jan
 2025 09:14:15 +0100
From: Christian Eggers <ceggers@arri.de>
To: <docs@lists.yoctoproject.org>
CC: Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: Re: [docs] Best practices documentation for multiconfigs
Date: Thu, 9 Jan 2025 09:14:15 +0100
Message-ID: <4928529.OV4Wx5bFTl@n9w6sw14>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <39d815da-1f48-4822-a1c2-1d8762ab7989@kernel.crashing.org>
References: <cb8cda4b-4b71-4896-b355-d628336b11a4@kernel.crashing.org>
 <CAJdd5GZY6-QwiJQM1KjQN1=GpSL_po4ay_hahvx4+Miz59vJVg@mail.gmail.com>
 <39d815da-1f48-4822-a1c2-1d8762ab7989@kernel.crashing.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.30.4.249]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA0:EE_|AS8PR07MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a7fdbe3-dcb3-4c84-780f-08dd30859b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PgRfuDoxQwlTW4Fi33ZIHqfaYW1TS3H1Cfs4QFpxYiETCG6PvbyUzcoZ6YTC?=
 =?us-ascii?Q?77gmMyrCMZgzPr6qqY2vzUrHXc16T+Y///BT4F8XC2lES3vYtjOQ42LZ0Je+?=
 =?us-ascii?Q?FYCLCyrr5IHQuc3ChG5qoHIurtG5VapoY4MoNgo4dFrkCWTLoUJn5jdfMEYw?=
 =?us-ascii?Q?HaMf5tPXkpaP9E5HEUOAlwFqqNG6XDjoxgcOXAzPnDpqFjQBUAHeySuY+ftM?=
 =?us-ascii?Q?tK3HuOKYS18Le2ObAmKDEwh6vYTQz4ZZ9pKa/lVsmyCN75vDEVP1E676TNSf?=
 =?us-ascii?Q?cd30DkmPDRSWCrlgpPvs9m7NzCFct2YYs2ZWeIu5Jr/dDcP5hv1s+5O4C42P?=
 =?us-ascii?Q?WxpCOeRZYAxlYL4Rwur5X6vViTUrpN1ylz3fvJJ1sBgIq7iF66zF+hWFQ8kS?=
 =?us-ascii?Q?Cpco3+Eso33CdgRKCr5/f8aAFtI5uM2gYes24ZrjD+P1oczIhoh8OGCDSJi8?=
 =?us-ascii?Q?JgaQrBCIN7Ch6T/te6Dt9MfkQ/OgBs2wfx3Oe2ahc8Ix0mERVbrWvEiUVvej?=
 =?us-ascii?Q?lTIp27JzyeNdxCftTIew8+dKTC6iiFyowoShyExPfkKM5YJA2gvQYhCrrB6P?=
 =?us-ascii?Q?VAQuv6ZggOqBGkEuRKJuNbfA2Z73Ew24+7ApykheP6uPVK/5oEDbUCgbEFQS?=
 =?us-ascii?Q?WUe2gHFMyeTh2wEEGLmy69LDvpLifEG7zZY2HDk5rIMGKmCqgXrNsPSklJcw?=
 =?us-ascii?Q?6240/JpCF3NGNJk4wV88DlaBhiHP5Nf3u7i+7x3kqDGlXTRitAaJfJYhwmu9?=
 =?us-ascii?Q?7f1XW31U/2yQW22HOVddq9KJxFpgo9FaM3cSwqIEoOD+9nkqYY9qPnnirM8W?=
 =?us-ascii?Q?uw9BDRM4TSGsjqsTwYqowH1D/mQc1xo12nQY9OOdUdPSzYLvaL4ym77ajZjQ?=
 =?us-ascii?Q?RCV1MxWz3Tc7Yxo2Uak3G1T3UBtUPmclMzj6kpl/TXeOYOyLjyK3xCSOCD9p?=
 =?us-ascii?Q?rtDVCylOUUDF2Eed/6RJXvNQeMZbOFEC3z2/cjuuhsU6JjbqZiuRw91WBjeI?=
 =?us-ascii?Q?JFqvwjXRaqUd5MKENn5PcjakTrMAahBZxtKUHsvPB/fbLnIE+r2ilPOxj0iU?=
 =?us-ascii?Q?6+AaZdVvBy7cgsaePIOfdQzuxNq1VfuMLFb7niZc7hoPFFwI3nSAmW8NiH82?=
 =?us-ascii?Q?2oAuDJCaOKUS9EYziq2JaHLT/ormgj3VEX3D+DZS7QGNJtpBix/kGcZbaWR8?=
 =?us-ascii?Q?LlHTZLdL41svzTi6SAyo2YMDC67JeJIu7x+6gWQpv1bIXekYXCQgRQ2EdApB?=
 =?us-ascii?Q?b8aqXsY7sd/lLxalvAMsIXi+Qw/2bKgfDVJs08wmKHbIeUOW5yjZXvYKzrns?=
 =?us-ascii?Q?FhsfOL4A4G2n0149MY+fDZM3CU14iZprt1jCqqkSdrnwGVoG8LZFYPuKPbP3?=
 =?us-ascii?Q?bOpcfMfZO8j+XdnMUx/tMYmnSNA/PvEPm3IeAZ+vq00Qjd6bWlLLCDcI8feb?=
 =?us-ascii?Q?N2xiZkrZbOv1Oxq/eqVfN9XXBb/PuvNSsN3GP1hEp29IffDiVzO5BSbxmF1J?=
 =?us-ascii?Q?zCDDw/rXpHzeDxQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 08:14:15.5344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a7fdbe3-dcb3-4c84-780f-08dd30859b97
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7174
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Jan 2025 08:14:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6072

Hi,

due to this thread I got noticed about the "multiconfig" feature for
the first time. I have two additional questions related to this topic:

1. Toolchain
For baremetal targets we currently use the "GNUARM" toolchain. Would it
make sense to build the "secondary" toolchain with Yocto instead? Other
users may prefer staying at an external toolchain. Is there already
documentation about building a secondary toolchain (or using an existing one)?

2. SDK
How can the additional components of a multiconfig (e.g. toolchain, libraries)
be added to the SDK?

regards,
Christian




