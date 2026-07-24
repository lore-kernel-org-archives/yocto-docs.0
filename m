Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04454C531FA
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 15:32:50 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21863.1784907165790201975
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jul 2026 08:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=mY8k3hvS;
 spf=pass (domain: ericsson.com, ip: 52.101.84.58, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0UcacLpnmlCQKr1F5G7Ll+Y73mSqydrhq2nY+K7pYi98cvXB2QZ8CKe/1w6UGsa6n4hwZ62ptXULpQY+zr3Sxz4BnSXc1/MdVy1LOgCf9caYbfrPO64zTrvfvbU8m7/IM1AscE2nfCHikEJ9tnMOnkxfDW5e2PkWtranVJBXXtktMgW5vCx4i8VsGgESoGoeoBOvhvA9e4BFtCZb8OyBVlBdooJNwt+hRMDLo2G3W2plaUPvzHEfXI96Gp5PauRJWuikL3/hrYHeeVsaW1cK722vqtzdswnvj8UyZAeVpgTyM6yceONKIyw4t67ibG/7U9SAzEyahWqW7A2JLpqYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cs8Uw8As5E6yw1wvHiYTVcMJOIYFOnFBKFQKwVfV9pc=;
 b=Y954JQJDIM55h0+8cwS507hdJtEKGqG01MtUD9/wfFQKKPXGElRjlTlKDka4MmBZKrYGgLLOMnexcqPYqvgVk/ntf0vysxCBJjVs77sEGjPFyVNUKQvLgD9gXrfb5xA2mo1nkiK+OuBAe2b5dJ0WsjXNYxXpHdipGDX7XXOl+Bb+mMk7HzjnmWRHvsBwr8DITQEZ0vmtP2vM5rZoFm0hsyWDYUi8pvYoKd5rhnrQBF4J1J1GjTx/btSSnnWYdk9YuPHLIJQ4j6Zhm4WpZqIiwgUyOT4+5XlPmfibjFohBjs6HU/HEw0RVEgLo6IES00x3xF61ZoYzofAj8yzkuP5wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cs8Uw8As5E6yw1wvHiYTVcMJOIYFOnFBKFQKwVfV9pc=;
 b=mY8k3hvSERVUSLYuPhJm/WUD4J88D/6UVus5wMQMOcMT6uSmylGmYafuxFveGC3zf5cU9IytB9O0TRHSr6iS29UMbMQ1FlwYLBG414bAhrwZYgKTzduqu8JHp2626m9TUenxl9lpDFfFF5wIiERvX7UbFVx47sdYFAPYK99if1kBvrYpmwN+ziLC2lj9/XgyLHOtkOPaAiWkuS8GX3IjL7u1yRU/1EQC/Q8rRd2fM7cu2N+E8NOKs1uYrPJJ+9aVP0AuE6kCz+Y7iAumnZzh1UbKsNnU5KVp2os6T9gbw2A74B7OKYJ2l+J59AzeHTeLGs7Y+hycSS9oZxHv/7eQmQ==
Received: from AM8P251CA0008.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::13)
 by AM7PR07MB6883.eurprd07.prod.outlook.com (2603:10a6:20b:1b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.6; Fri, 24 Jul
 2026 15:32:41 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:20b:21b:cafe::41) by AM8P251CA0008.outlook.office365.com
 (2603:10a6:20b:21b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 15:32:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 15:32:41 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Jul 2026 17:32:40 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 206A84020B40;
	Fri, 24 Jul 2026 17:32:40 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id E5E02700DBB0; Fri, 24 Jul 2026 17:32:39 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <docs@lists.yoctoproject.org>
CC: <richard.purdie@linuxfoundation.org>, <paul@pbarker.dev>,
	<Randy.MacLeod@windriver.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH] ref-manual/release-process: clarifiy upstream criteria for stable
Date: Fri, 24 Jul 2026 17:32:31 +0200
Message-ID: <20260724153231.48828-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000197:EE_|AM7PR07MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: 847e2368-8f2f-47d9-ed8f-08dee998ccd9
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|10067099003|56012099006|11063799006|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Ns/W5TEbi7Mlh9nvzI3kdHEC0sOzJDzMshBORTdYBJIqqyjv7nVxWgx1lMMwu0+5/l8vCO+C8tSMtGO7EmZKFXx1RT8pBN9ZNcBpg2hUuk1iQ6IE+B7mDuKFl1IP3F6yxeFr/XrknWFYStkkkiUDnYFlRXEvILICB9Yf1p11nx2nkQSnZHzWAja2cerV4uY7ViYhrKthp0t7dW7WvW6TVBO/o4Ltr3ITyUW5RIj8u5qPzC2lbGhwc5pC8PT4UtnokzKFOueCCXz9XX5x8KQfJs03of1cNDoCjyoiZ4EWGUqWHv/kQsTIAypPV6Z1elgmsPt+4ab0y1ZP864cPRW+V7JZ9U2ZMFlFxMzMx40GYmsR/y4KEaY5i42Cl+WYjU5I+Ocy0qotqy63IYHYS4oqvRNAFIPD4FHWkwhT+oqpU609AgXVunSQSgxf5/sNyYNzEwc5l9zqRtMBMBoRYgn1vNP6jX3VEdxr4yki1s6etK+XBQpfLaItnwvlD2CGjoEjHzTKHUH2x3Y79ZspJ6nUhIAHmax4TVhLo13aLgQOtyFZ0ar1bb9m6I8MksIGVa0gzPpL6t8n8ijV3RpH07nT4gwDOAYtEL/46NhlLFl8V6lo4v/v2mRXUPVclkp2o0/NrIac3oA3rvU9KpPMBvAqhw==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(10067099003)(56012099006)(11063799006)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ujZW2kph23vZKBzzGClU5YQ5H8geDsc+SWAGutL4FPaszbbaTTRnEhlzQ+dF6fKW5e8uIZPuaH/15D4gJGq8gR0vCsbU2X1PqMKqmWNadrCvOT/rH2Jy/sEYoW1+Y5Fi+NgphBFbSj0hAqwRTuo54Dcz5Ds8fypJO6BkfXM6BQFD55V/NAa0mCnWqQuOo7EtoPJfevIKvmxgjaL1PnKetpSCJlZme0/YHpQDgI3lrZcBs/j1qCIAvwvxEx//4UPFcnfpswp/y38uAs4aOJrs7AbY1EROhnymSXMmoB5++t7ueEVbVMgUiIX1K2kpXiRiBir/lbUc65ZGfZwa4VWk2Izz5zkCx8LBY3FYrUEr+vEo8iP8OK0UL8HsM7Uvaod8RsMr6JC1wFf5bDwa1tlN9EMXgp3ZMLoECX8ncczwcxNuy1kC+kFadNeXbpox+0us
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 15:32:41.3732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 847e2368-8f2f-47d9-ed8f-08dee998ccd9
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6883
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 15:32:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10140

From: Daniel Turull <daniel.turull@ericsson.com>

Make explicit that we either Upstream maintainer confirmation or
Clear historical or common-sense evidence.

See discussion in:
https://lore.kernel.org/all/a5d35ab2c3edde68e4edf81ecf48ce5edeb8fb37.camel@=
ericsson.com/

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 documentation/ref-manual/release-process.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/r=
ef-manual/release-process.rst
index 0959e5fc7..128be6b33 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -210,6 +210,8 @@ following criteria:
    third part (e.g. ``2.41.3`` to ``2.41.4``) are stable point releases.
    Similarly, systemd maintains ``stable/v259-stable``.
=20
+And at least one of the following:
+
 2. **Upstream maintainer confirmation** --- the upstream project's maintai=
ner
    explicitly confirms that a bump in a certain part of the version is
    bug-fix only.
--=20
2.43.0


