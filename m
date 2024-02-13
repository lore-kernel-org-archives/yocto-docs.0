Return-Path: <JBezem.extern@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC706C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 12:53:24 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.60])
 by mx.groups.io with SMTP id smtpd.web11.10903.1707828796522341564
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Feb 2024 04:53:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arri.de header.s=selector1 header.b=fKgBoHCy;
 spf=pass (domain: arri.de, ip: 40.107.6.60, mailfrom: jbezem.extern@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BURMidudDcSVYSX8X1SNiGlVT1WuTa0DT7NUETeUNu9QFF5QsAiafDDzktAfrIc0rEExrMXDoA16UDHnlbaamRuxpOLA3SnAMPR3UThaOUI+XOb6uB8QTSRmD/HnWHwtJD0b9jNXk2lbkLRENYNO5mKYobLto0i356C1VP707DAKaL+4/Ome+5MfhQCDp0/B3pnivaSCegVTtsecCM1a0CYkNDl+C8x9qzf9fAHROv88xQxQT8kJfvqbLCYC9ph1zsZ1YGwoXny34bmTBUW53GWtxXj8aTVQFaDYRV1vwXkLswbP9XUKHHX198YJ2AWwmxO9RnrsjkGJaXKxa4YG5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BjXWqwGs8kG5zfiiH3L+pCTsgM5Nked/8qLKbG3psQ=;
 b=agu6p1r9ydGjjID4hONEMdL3CqS5pgCr45e9iR+mYNMoP1z1ogRvxM2/GI/IFDXzXCFIDIySTlNmP1/4u6E3N5A3C3y3rs4/13yuKv5vuONGTVPmuaRu72DCl0EyyIacu0q9G4m9hqbIca/7HUyZ7Oy6fKdxTyVWsunSIKSkevzz0u/C3XT9j7r/+PKXfj0E9fqdY+TYoytMPnZKq5weRJNpNl29nITMFz3FRPG7AbbPy1bJvwncczbgG5rS9EK8lgphvWOJBStwQn3qboXRQsdP9hdXwYrJEtK0dwPzdYPF7t5iV0nK5mt6j1CTtWLd6sAcELTn5EHsI0EcsQR+3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BjXWqwGs8kG5zfiiH3L+pCTsgM5Nked/8qLKbG3psQ=;
 b=fKgBoHCy8GiM3uGSz93Uwdq6ouO0qluMB/vZUSdEOJhR2kPpRE8jkgZmYvlvlaYv1W7NUm5gbhcgnQfwaBBQNRvFPfncPXCFFXlM2Ftu0Zgy9C4yRa0rCp8uFV5vkIddlFgIqSWTzuqG3u0j9gOeAHc247ktEJKe2vGOP6ydpZ0=
Received: from DB7PR02CA0021.eurprd02.prod.outlook.com (2603:10a6:10:52::34)
 by AS2PR07MB9503.eurprd07.prod.outlook.com (2603:10a6:20b:645::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.33; Tue, 13 Feb
 2024 12:53:13 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::58) by DB7PR02CA0021.outlook.office365.com
 (2603:10a6:10:52::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Tue, 13 Feb 2024 12:53:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 12:53:13 +0000
Received: from bd7255119ac3.arri.de (10.10.30.27) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Tue, 13 Feb
 2024 13:53:11 +0100
From: Johan Bezem <jbezem.extern@arri.de>
To: <docs@lists.yoctoproject.org>
CC: "Bezem, Johan" <jbezem.extern@arri.de>
Subject: [PATCH] variables.rst: SDKPATHINSTALL correct installation default path
Date: Tue, 13 Feb 2024 13:52:18 +0100
Message-ID: <20240213125218.5480-1-jbezem.extern@arri.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.10.30.27]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885F:EE_|AS2PR07MB9503:EE_
X-MS-Office365-Filtering-Correlation-Id: 33ed98f1-d3d7-4313-001d-08dc2c92bd54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GapjslHUsUdIOZ2kjgvnoL790uvf94TNbE5KpWEZTKasLGMVw0dovuLLPlnhUeD5PiF8m4b3DycjQTQ3TXwv1Fla5sxB74jJfO8kWylpmzqflvpKZ6sLAVfEh4doWhlpkOjDYyuSNDnsSyj+wgj9ZwYQ28sujcLfmCLpymvmqiUme2UT6Gj5Oo2xbNHxVzNGgevhBG6y67h/1ukvEWBi6uwmnugh61VteAEfIFrIVk3cKHjZJ10BUrKkFBmJVdRtiXT4hOf7Da6RvbcoIsDPV2YsuOzW3sp6aE/F91gV7LiS3wWFYKkV8Bfotq9OrR1siuNZTRbc/xGjaNGWupJ9HAQYTkesMZNJE6MA+ZLgNDvyIpGeI2z4Wrpq8OjDBV1eiJdAI2Pp5AysPMp+20w2MGTJsGFHuCdQ5vVEYAL0povqf+k/S96MlK29OrFuXwSAzGPsBTBafapEZl1FkbMQAmfEgx/0xXbQVfbASKioPfcKUbth8741QnL1+TBG8cWIXyIBdQOEFGa7GgbRzjJRQjbOG+M0Zacw8eXK95Soon1Sllqk83OZN44Wahf6NTlCIgoiUGAXnRM0S/htlR8Pd7Fto99S5RWUCg2yEOVKtq0=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(376002)(346002)(230922051799003)(64100799003)(451199024)(82310400011)(186009)(1800799012)(46966006)(36840700001)(41300700001)(478600001)(5660300002)(7696005)(2906002)(70206006)(70586007)(336012)(16526019)(83380400001)(26005)(426003)(2616005)(1076003)(107886003)(36756003)(66899024)(82740400003)(86362001)(356005)(81166007)(316002)(4326008)(8936002)(6916009)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 12:53:13.2389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ed98f1-d3d7-4313-001d-08dc2c92bd54
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR07MB9503
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Feb 2024 12:53:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4835

From: "Bezem, Johan" <jbezem.extern@arri.de>

The SDKPATH variable seems mistakenly identified as the
default path where the SDK will be installed by the generated
installation script, unless option '-d' or a manual input
overrides this default.

From what I understood from the various sources, the intended
variable is SDKPATHINSTALL.

I have tried overriding both SDKPATH and SDKPATHINSTALL
(separately), and only overriding the latter had the intended
effect and was successful.

Signed-off-by: Johan Bezem <jbezem.extern@arri.de>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 6f7d6ff01..f292b8dad 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7611,7 +7611,7 @@ system and gives an overview of their function and co=
ntents.
          variable in your distribution configuration file. If you do, the
          configuration will not take effect.
=20
-   :term:`SDKPATH`
+   :term:`SDKPATHINSTALL`
       Defines the path offered to the user for installation of the SDK tha=
t
       is generated by the OpenEmbedded build system. The path appears as
       the default location for installing the SDK when you run the SDK's
--=20
2.30.2


