Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDB7C531DC
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 17:46:58 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.39])
 by mx.groups.io with SMTP id smtpd.web11.1012.1724176008550274207
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Aug 2024 10:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=KZHoQopE;
 spf=pass (domain: axis.com, ip: 52.101.66.39, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSA9QnUVF5L4v5orEQe8M3O3xH7GT8GFcn2fzZvkiwDmfLAfy6Hecn0mW+V8OPA18auanW5GnbGDd7v0vwTO1wXOSqCxzCa21737hnxr7hPRueffl7IthQsdmTWZdLPB1+YcgyACuX3VVpRxjT5qxVsu1D86PSP40lPqPaK2SnzCDp7PLEE3GoIyEbHS0HfGvwKYdIsd5Xphpv8x0xPY7HxWsuLO+aWUHXIe13EmiMpzepzUxHLOJld7vaYEE6Ym9wBnqBR7JxxrXnHQVD6OwFGwSrynI6H7qxsATMytO3Cs5IEKBu6uGy7GNw5C1+UPY2F0ViEeF2gnt3Hh/0PCYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Gs5qR6DneO1C4KQHdUizMy7f99TgKqr/FQbhEepNvk=;
 b=YRqdgYe1aHgxB8kT2mlquIvLiwdRPdJcF9i9Qjk+nMbU2CjJEnbP8C3Vrpo6BNWRt6fbUUPt/xm9Cd3hx6s8V9oN4NWL+2mKX1EtnfPI76W33CNZrIoJNEPdL6Gsi7TgP4buJSNt/hcpVg89L3U8UslwvfHBlPhqnGZpKQNg8mbio2xvPPXV/Ovh3qWCpLhPjHRePCw+NWh0mokKrV1PhouWf+KJUROUNtn+lUTcCFWJWllcBusYskShd9il398ao542Iz9RdzrUOtcbqvixED1CSLhi3z5sahjVhImAlD8aaib7MftcEe8WVR9zf45mJIcoflZpljAkKDEcs27BaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Gs5qR6DneO1C4KQHdUizMy7f99TgKqr/FQbhEepNvk=;
 b=KZHoQopEwqkD5uIwqDyVOJJKq2mcyk95+EcdjOMXnKMyKUzifhoNPvBgVKAVrqpr02yxDdaP5PO0afM70MXTSlUzBdKBDtfQ/6L8TMWmVD5kNqbn03SCfEOXKrwuTuNX7qGtl7xu+FRoqyfVIZy7QPzsubU2H36mdXS30K7rla0=
Received: from AS9PR05CA0132.eurprd05.prod.outlook.com (2603:10a6:20b:497::19)
 by DB8PR02MB5785.eurprd02.prod.outlook.com (2603:10a6:10:f9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Tue, 20 Aug
 2024 17:46:44 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:20b:497:cafe::cc) by AS9PR05CA0132.outlook.office365.com
 (2603:10a6:20b:497::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25 via Frontend
 Transport; Tue, 20 Aug 2024 17:46:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Tue, 20 Aug 2024 17:46:43 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 19:46:42 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 20 Aug 2024 19:46:42 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 0835F18B
	for <docs@lists.yoctoproject.org>; Tue, 20 Aug 2024 19:46:43 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 47KHkg0J3510489
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <docs@lists.yoctoproject.org>; Tue, 20 Aug 2024 19:46:42 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 47KHkg903510488
	for docs@lists.yoctoproject.org; Tue, 20 Aug 2024 19:46:42 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] test-manual: Add a missing dot
Date: Tue, 20 Aug 2024 19:46:39 +0200
Message-ID: <20240820174639.3510467-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000048:EE_|DB8PR02MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: 796ff20a-e808-4944-e5a2-08dcc1400dd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OxO9HlRaaqOnpDjPK07CVamLLi/HoZwp+WSy/J7Z13dHJPkUuFBTSusPBhaU?=
 =?us-ascii?Q?ZySPWzFLDhiYkCBQ0IfeU4wkMjSuiODVzMMo69pVJfQMnlarZD6TbsmXDA18?=
 =?us-ascii?Q?2IZTnVo6s9PyYLaKkTMPtt2MKg3m2fkVax/pKIx7ClZZMgt+eq+crvdwXzWt?=
 =?us-ascii?Q?BgAX0MQ7TwmEOIXCV+08t5ALRD2CszEil+b9GHEjOgZgKsTzWSjvAQK6Vz3A?=
 =?us-ascii?Q?CraY52PUhUYABeE0D7Sgm0J4II24nyl+6LaTBJk5YxiYXOc3XjnLy146T4LC?=
 =?us-ascii?Q?Yxq6CYYLmwpxnEX9gif7BAtPNXbktFEmef3hmRM/611bCQ2IqBA6cyKfablT?=
 =?us-ascii?Q?uWEbzB0vlUoutZ7esvyuFJPAD8qlLrgBXrOvWJ8HPTxV+NcLRjTKecMRZYvv?=
 =?us-ascii?Q?5j2gheB49CY9CvoVfNQZEB+97ZCjCCZN6wonEp2GUN3DBbiJHrQzZN2MwuJB?=
 =?us-ascii?Q?ME9Qj/mLvWKLHzY/kHjwlcApzOJQ55RRG1RH5sBeqIDzgfV2m0AShtVGLsU0?=
 =?us-ascii?Q?84/2GfhtW3qvTW6f0nhHHTGVlE/Ez5DWjt+m28ob+PK8UtPnoY9MmFaHzha6?=
 =?us-ascii?Q?NpqUitLpqo9thN731Ut/yfiY+kQ0TuZbAXyLk34kDNcICvE8YDLI/IOc31IF?=
 =?us-ascii?Q?y9J4HRj6S+rEfZDTDF/wz59O0w28a2xbY/ZzZbsfAZ1uy0hN2hwCH7Tqlb4j?=
 =?us-ascii?Q?uQm+8XWBAnDzTKOXcJUyxPm4RDCCJxaxWK0OoP8wGjmFxxcxTMLl5bl5mlHp?=
 =?us-ascii?Q?iXK5XclNuYFHxiNSme9jd0njJPxZLjg7kbPA5YcRccD47oNHmn0T4Y0I4nSA?=
 =?us-ascii?Q?MXv6Vndp6aj1GTz0Wr4PXsG4nLulAfcNQG4vvmGKhFf5NT2sYDLIr1CEFV92?=
 =?us-ascii?Q?lTBtjd422hur3WRhpR1XKXCtcRb/z4JJ4EtAW0lwPqrfQOUnKH46gm9D47v+?=
 =?us-ascii?Q?zGQRChfcHW7ufHe2QXmMeLJXXwftXcD5PYzrAxHuBBxWZJ/B98nOijVZG0ln?=
 =?us-ascii?Q?ytBKTeBimz0F4D9z7cvubCZKVjj2DNwO8bhIIe1S6J6Dkp3z8/3ClV8Ot60d?=
 =?us-ascii?Q?3gcRnDZt6k+bXOrHD2flL6PPmBYc0vd0ZToutm7l90pam+5ngxD9V6DT5Eg8?=
 =?us-ascii?Q?FHPQnWQLdJoErkZ2YPV75A3AOABgXN6m2x6wvCSAuAQQ1jZ4ucr48av1Ew1G?=
 =?us-ascii?Q?d4QUP0keZCohlY2Y8DXfwFVhb2bry1umjlGXBbYBUvD9eqVZt5Memzf3Gm/i?=
 =?us-ascii?Q?Bc4B0G68mQDcdSuuwECrZyimwj/kn/GAymQb59BnYcUOG0CoTydh/xKnN78A?=
 =?us-ascii?Q?3K6zh3CgC+q9NpSa8OOI+PbwyE3MxfcRrFEvZJZ7KEtJPfF3ishTcPlPy/5e?=
 =?us-ascii?Q?7tFkaZXdhHy6UiME8NpxzXFO3Y4NyHfQNTmLjb/oW1EmruMbym61AYeA/ro7?=
 =?us-ascii?Q?EyhRe1T0w0GlTtLDk5cb1+jkUR3QZwZL?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 17:46:43.3685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 796ff20a-e808-4944-e5a2-08dcc1400dd8
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5785
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Aug 2024 17:46:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5335

Correct "oeqa.utils.commandsrunCmd()" to "oeqa.utils.commands.runCmd()".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 documentation/test-manual/intro.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/test-manual/intro.rst b/documentation/test-manua=
l/intro.rst
index 7e56217d76..882ca16486 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -380,7 +380,7 @@ with common tasks, including:
 -  *Running a bitbake invocation for a build:* Use
    ``oeqa.utils.commands.bitbake()``
=20
--  *Running a command:* Use ``oeqa.utils.commandsrunCmd()``
+-  *Running a command:* Use ``oeqa.utils.commands.runCmd()``
=20
 There is also a ``oeqa.utils.commands.runqemu()`` function for launching
 the ``runqemu`` command for testing things within a running, virtualized

