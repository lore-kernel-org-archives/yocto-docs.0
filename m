Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56102C5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 14:31:13 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20481.1786631464834496978
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Aug 2026 07:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=biS2tONt;
 spf=pass (domain: axis.com, ip: 52.101.69.4, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZo6UDwvIHRQdbpn7s1lAr4mFdFLxvgviH+sYl7XmPVtop1STr/YMG9b8j2w5n6JwB5rRYwO0uJPKLPAP760ISYeROw26+VFrXsXp56MIPBViYMcz3CjdzbitsXOnmhnPyDhZlvLeRgg+0wyAerWD70Bnt7P8FlKbj4FBzxqSgxmQ7GqpTfj3QMsK3GraYxfYeIBW5ctU0vb8zmnI3aLlMmP5gqQEiL9AlawERafdlYjWMx7mwSdz9+OYGIipAWkQPe3M1zJs+G5aO7FHTGQaHauD0TQdgJkuL6JKaFTzLEUg/jxpFQpvu9qxx8H0mlzasnM0QrDx68Y0nqSCJ1uRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwupJ5eX5jXXeEwoVuvYhe6BbOTLVnUVKzkJPj5jTRU=;
 b=K6P7lA/szzIwy/FOKSCkWAzLIV4hfrm46Hp/V5091imh2iqYwhLx32l0Kp62zk06tyiPum+1yUfm6D6Se0mOLVNK9wyEuoXgmOTGkF0Fk0YkD+Rzvz2E4JvvoKbj8DxpaFM2HyAbYfeR1cZuygZOVDhF/7EIUXDMov9wt4xAIjTYHGKiP7x8ZK51Usm02hmElyq95y/eApMn6+gN/KU3WLEWjh+F6FZ3TdauwdqI9x/jtjgK8epDJ7HEQVKtmjNElZ/HVchmXJ5r0NvtpLbG2g3R25FJDYYH7Xwb9yiY5sgpg8/eL1wAzFxq3Twb5ehBU5opU2cwUmQELdP48OMi9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwupJ5eX5jXXeEwoVuvYhe6BbOTLVnUVKzkJPj5jTRU=;
 b=biS2tONtGAXDhGnbAPBNs8Z+W3ApybVfHNn85XWICEPXn+vuqnf3/gbaCUVPV8zYzzsqBWSZ5AbOiwH/HzLk+BLFNxaQ23VsHjpUIkP6cHEwXL9QwVROevTwWNSyDuZJWoC5DYn2/4YQGKXkmQToRnm+/YoYDLIgl0eAa9oW/LU=
Received: from DU7P189CA0023.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::16)
 by AMVPR02MB12504.eurprd02.prod.outlook.com (2603:10a6:20b:774::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 14:31:00 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:552:cafe::27) by DU7P189CA0023.outlook.office365.com
 (2603:10a6:10:552::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.14 via Frontend Transport; Thu,
 13 Aug 2026 14:31:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 14:30:59 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Thu, 13 Aug
 2026 16:30:59 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Thu, 13 Aug 2026 16:30:59 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 7C2822023
	for <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 16:30:59 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 7627912909A; Thu, 13 Aug 2026 16:30:59 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual/variables.rst: Correct the default value of FILESPATH
Date: Thu, 13 Aug 2026 16:30:54 +0200
Message-ID: <20260813143054.666806-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B97:EE_|AMVPR02MB12504:EE_
X-MS-Office365-Filtering-Correlation-Id: bdbe6cb2-9b77-424f-706a-08def9477edb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	/7VLJjDSWHrUnJRzYsjEvW6+8sKigtWOW3jkROrFnpA2BoVNghAtjB4v+8/rpiIw07qhFILiLpYKhm0si4hRaFv+Gtup3jfm7nh6+FdbNHOrM+HJnu4WPow7KdVTYPIu/D7JtJhBVAKS3qtMSTSqOZVG4Pzfhd/6YCHC0SQ4YzGsZr6J/rciC1RlaoPz6W/dcje1fMMShleLx5aGu/NwDu2QXgLXAFA2WRTejx6hdqk2xzmdYpk7Ry6BhFC0BMLGUUk9NHEwT8hvjRRyNvwxCjVHeL6bD4jLfRjYxJrAOQLxDXrgioZAkoQQQjsmyD7y68Vt0A/tiV1cyp161d5ejwqCxEVuPc5wnFhBRI+sAA+cMz1BCmc+pYkaC7k90wyatB5trbEjNgcun7+eXumObBdo0ZfqfGzzWk6r1kjtUGThlHdD+oiX6bONZj2eicvgK1bOcYhTGfSbQwHoqGY2LOgw7klSujluy8ombabvPXjwZ50nmKvcrLhfvk9Reuv+CkZg6o/xPaWNkHvtUFmIsEmBHA+2Mn2p1S0yRImTpXuQHTZoQlDROsuHQMax5LN2U+/f20hwkRU8aGDzgx7Ua6AlXeX/Z9yQd2K/qYkbOQmfhhZJS4wq6PJFPrMAszx5izq1uCBcL+fdWY60o2Uikufmr8fUrXFwHEiEWKKq2w2Ko0nNK3jgASS7ipHmqqyu
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9T/DbywfMHaALfy7/+ucxlbVHc8ET7xnWUpQeS3Q3Q80ueYZyChV+2xOrlxTJ9C3/koRNdrX0KOBeDinDpGjgKBcXWJmjQsvJPvJkoP1KRKEpE+DDrkqcfczPLbtUo6EViP6hn7AQRJKlkwmVphkTEKYr4NB/FhCH7CHViwlviTIMpL6VnrCBmdvyUjs5ZebulEI2Y5zAXB4mg4iBhs0xsmZfBNwJ9Sl9QIX0YTIh/bXymlKcMq7uDXdTOZNEgOK6Pmje4j/YUJ4UN/C/luYRculSsSux7P5LizXkMKwK8FM7TOvTLXeSVOpsjDESvOH4iGAda+1zgkTSToVIfEJ54LbkHkfF17TiRQys0DPZA91KFRrILzV7VlGHKfW5aW8FiVxhFal2iBP/XkRQYyBqvvE4MTgIoqMkLCJ5ecKcNcynLQazMZeEtE3uStZTCtL
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 14:30:59.9005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdbe6cb2-9b77-424f-706a-08def9477edb
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMVPR02MB12504
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 14:31:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10288

It was recently changed to use oe.utils.base_set_filespath() instead of
base_set_filespath().

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index fa0dfdfb8..a6d36be52 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3285,7 +3285,7 @@ system and gives an overview of their function and co=
ntents.
       :ref:`ref-classes-base` class found in ``meta/classes-global`` in
       :term:`OpenEmbedded-Core (OE-Core)`::
=20
-         FILESPATH =3D "${@base_set_filespath(["${FILE_DIRNAME}/${BP}", \
+         FILESPATH =3D "${@oe.utils.base_set_filespath(["${FILE_DIRNAME}/$=
{BP}", \
              "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
=20
       The

