Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93BCAC531FA
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 07:38:44 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14537.1784878719532552406
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jul 2026 00:38:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=N1FiCxgT;
 spf=pass (domain: ericsson.com, ip: 52.101.83.24, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1RLkDVW3Pi5UmOaAKMZYTWxqKmHt7Dq0YIAlr+KXZ1rj4h76smh5TGb1PogdwixN9Qq8/vSCP2UmVwfsOp8EsbnGFgtgg4yzEtoXVvinW18WcxoZfn7ANiFFZiiJ61B0h7pS6K2J6MaF7CT/eWyMavy1QnLRSbC29traqr3DU5X0L1ABN7OqLuO6WINkTe51IBoIuk2JJRwOltjn7S3Gf6zhkz9U0snX+GPbS4DgjHuhj58U35Tbv3BC8jpwa2Afa46i1wo5zwR1stjoigEoFB7O9n1zXVoGDJg6HZCoxI0H6tlmPf9rmZe8iSsXymigqzOPrmLuT7Q8khxe+rRbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Xq/ZzO7ltV+BnlhNaBhvCmSb53BkcEQOMLrsEJ7CHE=;
 b=vLnmcT3FhDoDkZE9s+0Jhw2oCAuNNyPTbvHNLCdGUIcUbUvr2eIp8KPzqNhmEKz/RbYN0RJCjJxMdf5yEekZVyufN9CJR/pyz8ikwLlQoHkj9wS6IM2RoviIqrwXFRLwePf+8RtMKOfSvOmYhhUqC0vo3gp8vf5g4D8R3pWNOdxYF7g6SnpaAsUlSTiSsvfN9a/rDAGgnNn4zdesuc8MBpmSgwx2iapzED/QqGjhoFdfvIkwvGu3m1BemyrPlH8OYcXKTJ9owQ++bBDXmIIvlsKzDgPtBi6ZzXfE9RsBYODiCr+OQtuzUFV6tfzfZ14VOi9gBqHwOWYQYTJL4zug1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Xq/ZzO7ltV+BnlhNaBhvCmSb53BkcEQOMLrsEJ7CHE=;
 b=N1FiCxgTPVDyN8uCvNHZvnng6KTu0SWinBs5L7gKWIKlI57EQM9j2PKMhEjbBEYCMgvK5cOgqJN4C/Q0dHUUsJWPcqqN08Vm6HJeEyASZvEcpiITCSqmjjchTFWol3EV76u0aTFwGPbniMllpjs2zPcEsTSxDB9raS3jFDRyAUjZCdqQPNp6FA7azFSJFw8OHFwSmMwVyli75J91LPShUYIHNPwYzad4sE+vOtGF1ZJcLLITs7yxBazNFNB6FyFJmBEoRX6Bsob5QdbcGx0Wa33q+rNeYEv4GCQm6S1zOGFlfQJ/pUKW0s2T16wNxuMnsr/HmzX8IG5zLjUPeDYSlA==
Received: from AM8P191CA0006.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::11)
 by PA4PR07MB7230.eurprd07.prod.outlook.com (2603:10a6:102:d7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.6; Fri, 24 Jul
 2026 07:38:32 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:20b:21a:cafe::6f) by AM8P191CA0006.outlook.office365.com
 (2603:10a6:20b:21a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 07:38:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 07:38:31 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Jul 2026 09:38:31 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 7BF024020AB1;
	Fri, 24 Jul 2026 09:38:17 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id B4C1B700DBB0; Fri, 24 Jul 2026 09:38:13 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <docs@lists.yoctoproject.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH] ref-manual/release-process.rst: update LTS supported versions
Date: Fri, 24 Jul 2026 09:38:03 +0200
Message-ID: <20260724073803.1260044-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78E:EE_|PA4PR07MB7230:EE_
X-MS-Office365-Filtering-Correlation-Id: bd13c119-8b9f-46a6-f210-08dee9568fa7
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	XOJFARw68zTruPOP6PX2Oc5ttdM8w93Yqgjxyb2EcDA/XRoLZvlpUWtc/X5WzvOFhH/bCCCTMM+e8czmAqvJ7kPqLIkr0WkYuWJMMHXCH+8AXszeY/1dgGcYc6Mk6Zi6f1YBrjHgPjfB6c3xOT88jHH1ZE+OqbR0+V9t9htPcRw2ClIitKQhvtRXDCsaCPnvA44YuXMew1EgxAgVoJWJRxnNKx+6++cHOwn8Vg/ike0IvR5UHPE7Zk/k04PA7tseRMdjh9dMPtLaJiWiuyByf0l1QFwA2nqhPfkC5y9LA15jRdZsNKhHpQfJMfbp/kwjpE/9ph0hdofyb3rzfcw2GPmFrpwqv1ObU3/348Q2WbB9aYsem8m2vKfrEgLeU8PMzSExlccO7oFQlFVRqpJ/VlRuabPFbgiB0UI0QMNrDweKB6xPEtmFOwmlRYJtfmoUTYQSIu5X35DL6qJ1Pb8mTDnyOSqyHEuCQX+LrAd5uAWBDEssXTdL3AIhTEQl98G//0hUmNrJojbbkiCRC1QYfuTFbbWEQtfjEyjiTWRJNYCN/fZK6/GIthM/xln2w1XgA6Nqlj5YXsQMwOgeuGUjKtSQj4IS157vEmYpErJgtu0XGSM7BRd5U4KnieRc1dNgPhIWqjDShc1va656R9cH5UsSycXON3BY6YxeNgxSLfe8V9RFvcNSOZgsUNDhb6o7N7chSCNh0JqDeElkFSL5qw==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	a04Fa1aKs8bpT2xck3GwrJ60DxgspN7zyo/IZssmoEEnIlmAtLyYBQKrwGb23O6pTAGY91AJFZwhSQmQe26ilpnG0o0GTZZB0Slp8Vg52XMJ0Fszi5oe1bPQEaWZxIkYzn1B/iUBRK49bwsNNNbmZ87wjYg9YWE6vRnIzVL9nZumqSaNe0L0nBaxQ49YIALs1EfmKTGRksrEgdoaSwo2PYGD1eGNIVIVXWhIk91aqFhXsP+xrTtDUaGSzMpZBloOAHUuaSXZjXNMwv+3RhGdkeVK5usEyLd5aQsi/E2vbxw6UWiK5uFFpWwJ0YeZ8ASOXJ8AONeYcaw7Zp5jiDLASswDXk8SACaMgV6HquWGkM2RdM4HXXFgjKcN0U2kUKwscYttNQB6q07/4fINdHfMM0LkiTzaJSGt1FFDpvcaNj7Dwp6UGEy91WNr1BOed6vy
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 07:38:31.9211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd13c119-8b9f-46a6-f210-08dee9568fa7
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7230
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 07:38:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10124

From: Daniel Turull <daniel.turull@ericsson.com>

Add Wrynose and remove Kirkstone as supported versions.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 documentation/ref-manual/release-process.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/r=
ef-manual/release-process.rst
index a7abb2fd6..0959e5fc7 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -271,8 +271,8 @@ upgrade to the following :term:`LTS` release.
=20
 The currently supported :term:`LTS` releases are:
=20
+-  Version 6.0 ("Wyrnose"), released in May 2026 and supported until April=
 2030.
 -  Version 5.0 ("Scarthgap"), released in April 2024 and supported until A=
pril 2028.
--  Version 4.0 ("Kirkstone"), released in May 2022 and supported until May=
 2026.
=20
 See :yocto_wiki:`/Stable_Release_and_LTS` for details about the management
 of stable and :term:`LTS` releases.
--=20
2.43.0


