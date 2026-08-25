Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681E7C61DBD
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 18:17:13 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28528.1787681823340154724
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 11:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=lhZTXshm;
 spf=pass (domain: axis.com, ip: 52.101.84.13, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLXQZL8P0ItnjnURJguHDMqoIk885ULkYTWMVRkeB94u6sDfEsWQZT/xWPXGj43vDwxV6xGTyS2jg+xh4Ee3wE1pikFTTm//Kc1TYtd3l4dR97mngrkAHoejsFM2aitS5r7M4KURKoNHOOdGmRPzDkEc3IGUHImE5n/Q8KLRmW47DCC32LPigyv6Zz5rdBpnTpJ4dtVXmOSuC5MRUTsXGWvS9mSt5kOdUlxCdhcurJqGsOnrjR6XvEXCooEkwSsh7GU5p1PtZH/Zz3vHqhJPFZsbhft/iuYL4kNvIchgnGtVZO1Vu9Kv5Cd9D4SpVYvI3f3bN4YV45xAEBOMVvBfXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4tdD3IRV2SYcx6x3wokouFgHudtb+h0VTXSe6dm6/E=;
 b=AmXtKHXj8gZzLFnat+7j8orpI0k79ZwHQVy4AbvujqaG6yNO3NaxGlyLXSZ3UG9h5tuu2DiZTCKYmeNAh7pod1JDAbJcTo1Zjg6OwgQPAYZHaapv4hcFAOutfC9TNseFsUX8Dm/NDS+A6tROY3G7Aq6ZALq0oMpxU1dhsITJEEKJv4F4fAnH273646voUY7kJ38KULW4dxYuYEWQX4chxa0GSDTXIWGdNJTr+R7w+/m9pKlwZlB9+Igq9LSrL0g3R3qeSV40JGAIYqfjzXlyEpXEcjxTRC5P/DXZ3Pn/vnrP1ggLw1AEqwxlo7fdfrImJE82Qmvx34gXQFplEtuCQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4tdD3IRV2SYcx6x3wokouFgHudtb+h0VTXSe6dm6/E=;
 b=lhZTXshmmGOrffHp0430furhQESkxa7vDNujY7XpnW4MfZ53/M/2cYnd7ZEGb09r6VbBHowYc7o3gebaeI/d9DLiJkZXRRevWhlfYOR1l2m99+kwryAm0mVQEKhh4XmCuD2lc1tev+uqSwdZ3OvK8Ngo1ToawR00fpE+lcae/hk=
Received: from DUZPR01CA0342.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::26) by AMBPR02MB11846.eurprd02.prod.outlook.com
 (2603:10a6:20b:72e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 18:16:59 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::83) by DUZPR01CA0342.outlook.office365.com
 (2603:10a6:10:4b8::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Tue, 25
 Aug 2026 18:16:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 25 Aug 2026 18:16:54 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 25 Aug
 2026 20:16:54 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 25 Aug 2026 20:16:54 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 4AB8A1276
	for <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 20:16:54 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 40C4412B4CE; Tue, 25 Aug 2026 20:16:54 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: Remove the documentation of the GROUPMEMS_PARAM variable
Date: Tue, 25 Aug 2026 20:16:52 +0200
Message-ID: <20260825181652.2993460-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D10:EE_|AMBPR02MB11846:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e68b4b1-99e9-464c-79ef-08df02d50b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|23010399003|1800799024|36860700016|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	Rw3b8Y2hZ2+GztDRUfGRqzlbS5Z3ZlsjGhtkwgCl3oawBOTQ5xIFL1c4ve+dwbLscxydDCGWZxVlAVfXn5zkz6jVRkbmU3c1aLGz9/WZqqiUTOoVYzcn5yF+4osqwxfdo47KAfbl1YdpiN1W05DO8SBuZatHUgb9aSs0d4xD4aSm8ADzmsbqWHD58yTJTOoG/Jzewy+jUNWWYTuTc28zbRh9AOoT2G/igWifiDt+wTGBeR3ZE8ElXJ2LTisRgr0QNmyqD3WUuyCpDmc/imDoSyy31QWHZGrE2NwLIDZ3iEBPqZNn3kTr4SbDrJnND7Bj1nYb1XvDfOGsbpRdb8WGz6YwiPEaUcfPjJNFm/T9OpDwL38NcvUPsheTC6zH/zMkqK2Fov9VRffvz4rKXELYYG84OtFnK5+PZUAAclK8IZ/jtyzVGe3YSJuWd/Gggi2KwwKn9oxi0zAp46dvVkDh5vQv05xufoN/JykcenufPOUImtgD+3gbKhuEFe6znSbrxBoGmsCSpN1jBGtb68IqnfdOXdZXlLAf91EY5tJIeMfpTc0ex0c4irmXCpSrCIsqBkp/PE3V4/IWwHkctBjNOeXwMXcXNy/HY9CSOjFN/d7gNpjJ712xaXIC5ofwqPo0ytc3OcE4Hq4vFnzKUo0baa2sMwaGmMNzGefEtNPEDm7NklWT8s+Icw4qRQFOjWTeGR2RlA0wosnlhlurGiOJVg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(1800799024)(36860700016)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CSEwYeyJuL/TU1ekH6KMk0JpgKL+D6n4AsGI4OVNhYr2+pjwMkWvpQofIOFpk9OFhiWZqoNenAIpETJnZwcdipUoY6pc+Xv/8rh8RVeUZnlnYQwCufdnJVE5587FNa5nvGwAJpTV7WemoP/YfJKASTU0u5yhOzYRPlTexLPvnXYIW4xUGuFEutT5NN6Xo2oAlKg/OSBLLgS6Tc5VrHBApCJZCRnZSjbpxyezvKQh2UwaHgyB5m3coKyHPuvxSEszdYHY3i5n14vgP5r/ygvgyKrxowkwSBK8sQ0kvC/m3LgeOFfe6tESYO8AJIL5XCCcUODf26psleXpUBe17SRRETLYggTd+++0hM7WMwcQ5CJpW5+Gy4YwfeUbzmifjvu2kTbgwJJYQg14dLDhGjqChoskHYW/NKMX7KS/H9qD1cOxWATYEUnKmkhlXf2qIJ8u
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 18:16:54.6718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e68b4b1-99e9-464c-79ef-08df02d50b16
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR02MB11846
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 18:17:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10342

It has been removed from OE-Core.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

This is obviously only true once my corresponding patches for OE-Core
have been integrated. ;)

 documentation/ref-manual/classes.rst   | 2 +-
 documentation/ref-manual/variables.rst | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manua=
l/classes.rst
index 3e74bb884..631091f03 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3780,7 +3780,7 @@ The :ref:`useradd* <ref-classes-useradd>` classes sup=
port the
 :term:`USERADD_PACKAGES`,
 :term:`USERADD_PARAM`,
 :term:`GROUPADD_PARAM`, and
-:term:`GROUPMEMS_PARAM` variables.
+:term:`USERMOD_PARAM` variables.
=20
 The :ref:`useradd-staticids <ref-classes-useradd>` class supports the addi=
tion of users or groups
 that have static user identification (``uid``) and group identification
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index ae9cbfddf..5cc01cf45 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3955,10 +3955,6 @@ system and gives an overview of their function and c=
ontents.
       For information on the standard Linux shell command
       ``groupadd``, see :manpage:`groupadd(8)`.
=20
-   :term:`GROUPMEMS_PARAM`
-      Deprecated in favor of :term:`USERMOD_PARAMS`. See
-      :ref:`ref-migration-6-1-groupmems` for more information.
-
    :term:`GRUB_GFXSERIAL`
       Configures the GNU GRand Unified Bootloader (GRUB) to have graphics
       and serial in the boot menu. Set this variable to "1" in your
@@ -12542,7 +12538,7 @@ system and gives an overview of their function and =
contents.
=20
          It follows that if you are going to use the :term:`USERADD_PACKAG=
ES`
          variable, you need to set one or more of the :term:`USERADD_PARAM=
`,
-         :term:`GROUPADD_PARAM`, or :term:`GROUPMEMS_PARAM` variables.
+         :term:`GROUPADD_PARAM`, or :term:`USERMOD_PARAM` variables.
=20
    :term:`USERADD_PARAM`
       When inheriting the :ref:`ref-classes-useradd` class,

