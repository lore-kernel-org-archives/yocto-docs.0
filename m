Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DADC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 08:46:58 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.130])
 by mx.groups.io with SMTP id smtpd.web10.3514.1646988415838618884
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 00:46:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=cxnMDM4Y;
 spf=pass (domain: arri.de, ip: 40.107.15.130, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZ1JqHaVfpoT4IKMiORTlkAOw1AcmP5dmcXESC4pM78tGsjKrbMeKDnkTESWjy2fnQdzLL4Cy5/wo4pEYkvXYSa5BxIwSb+JtXV5R26myvnPB/3/ReVVRb1p9MKXTCYSak68yJNvBTPVgghKxtDURORyjVxqskwxla9szNCjIoHYUfOiq/ClcwpHpU+UCnNWypGHjxJjpe/UYokuC58DalpWbeFt5Yw0uxpK1axd96DzK/xhCF87ffw+dct44BDX0rey6uFhfVUcsoLVEPgk2jnpcxToMfqk/ilPicgKjgiNikZcOnyGhbnf0hcBCf9KL/Q1SYJL7YzjAQHHE2LNbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hs1aEpsLnv87FwgqdYy10Lx8LY3uR5rwYWxI86iN0Mo=;
 b=nT6TGdHHuKJO3mBE93anaxdyFSt+TsOedCPG8hEDFdG8SysymCmb5DZd0l20vmcOOxn9O9nazLyhi02PV5zkisTuMoSkxkNG4w8j2Sl6milqTaCOjmiwsUcdt1mWTSdixlKPmS8ZVOAo1dXqngRKpwVJjZV5ZParKQZ1LmBnzpECMAFVH3lN16WwGl3mlVCU1O/PAA2jaJFMQLUYOZQ7o9BtfoDJxIy77hAF0tVBfzXB/n3bWpoG2vSo/rPBgSM8Ko2/BNd0NSofRBBxx+YZp9Mnf7W5hYRYsk+T3EAPuKUNV2/U769jy53LKN2rdFqVQrgKBtQULnbF5gjot1vQ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 217.111.95.7) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=arri.de; dmarc=none action=none header.from=arri.de; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hs1aEpsLnv87FwgqdYy10Lx8LY3uR5rwYWxI86iN0Mo=;
 b=cxnMDM4Y+7coboGDuwKbhgRuFIIDDzcfNqejrHCeIOt9q5wPhV1wCdLBvizans374/UHcty/+SElBL4Oc9mNMkC+Uv0DpewaDPnCZNEqMFuRVr/u5Klere1jYf7cxxd0q/sj4p5pzqyS5Kdpvgdwvkvbj+GcqnL5SSls91pLvpQ=
Received: from SV0P279CA0009.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:11::14)
 by HE1PR0701MB2971.eurprd07.prod.outlook.com (2603:10a6:3:4c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.7; Fri, 11 Mar
 2022 08:46:52 +0000
Received: from HE1EUR02FT034.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:f10:11:cafe::33) by SV0P279CA0009.outlook.office365.com
 (2603:10a6:f10:11::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22 via Frontend
 Transport; Fri, 11 Mar 2022 08:46:52 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 217.111.95.7) smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arri.de: DNS Timeout)
Received: from mta.arri.de (217.111.95.7) by
 HE1EUR02FT034.mail.protection.outlook.com (10.152.10.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 08:46:50 +0000
Received: from dhcp-192-168-0-28.wgnetz.xx.de (192.168.55.97) by mta.arri.de
 (10.10.18.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 11 Mar
 2022 09:46:49 +0100
From: Christian Eggers <ceggers@arri.de>
To: <docs@lists.yoctoproject.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH] ref-manual: system-requirements: update supported Linux
 distributions
Date: Fri, 11 Mar 2022 09:46:42 +0100
Message-ID: <20220311084642.22339-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.55.97]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ee66d7e-e10a-4189-5e58-08da033baf39
X-MS-TrafficTypeDiagnostic: HE1PR0701MB2971:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0701MB297131E96826B9DCCB6D4245BF0C9@HE1PR0701MB2971.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xsuQgoda6ye9zU4CuXw/4iqVCGUzuV+aA0b9Qm9qkEJaXGgq7eZ1yAE1/NO/wAEXzj9S3/kg0hL1ngFXUcjmO4oFlvM/VxK3udQHrIOEZq0zWfYuHwLSM3nWOnBmff+i8LrALjevajC6KmUya/KRPIs5Sjpoao8eYHOgbR07eIkin9I0//XqH6rkXqNBgWjIqPNL1KUIXIKcIwcV1sIiAaaTu8ryOhzeQm5+ReY5LSbwUTGtHYSwlvptm+gp2/LFihZXWUs0wOW65silo6ByD7M0qPdDctfVYPrMevTr/DLRBnt+ZXKjnqDRvGpxJrB6/lxAKqkgZPUdyn9ZnsobeoX6kx1AfAeK2LUWy3gSI41M19G+E3gxxqCFCl+M6QY5qyj0pJSLvPjV1ZNeGOeoPEW3oshsfTyoVE03zJfmCkHeCSZeX9z3714xagOOY8ZVFUFLlCsWicsJSAKzy7DHljL2QExL4LjkrN7+xLaHFufLn60Ujo50nSTP+Y/hbbVdy0eDKARXzQZf6M837GQoLTryeysxrllm1dRQjKpI62ZzI5uaCfg/cTbOrpZCRQloM3VwquVDVpPMauWVJaRu5+xmVhnjm01CJ7rx0duH6qfGlJCfIyJCMKuDlZL5IFAKWS05pDqJ/86Ya1yplDWvTnTmh0K+KhSETEXh0NOw7o0DoAM/k+karz7+kJTKf8h/cmXwSM96TO4vNIJcxFznEg==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(6666004)(86362001)(40460700003)(356005)(81166007)(70206006)(8936002)(5660300002)(6916009)(36756003)(70586007)(8676002)(4326008)(508600001)(63350400001)(83380400001)(426003)(47076005)(336012)(36860700001)(2906002)(2616005)(16526019)(186003)(26005)(316002)(82310400004)(1076003)(107886003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 08:46:50.3291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1ee66d7e-e10a-4189-5e58-08da033baf39
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR02FT034.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0701MB2971
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Mar 2022 08:46:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2590

Align with recent changes in meta-poky/conf/distro/poky.conf

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 documentation/ref-manual/system-requirements.rst | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentati=
on/ref-manual/system-requirements.rst
index 30294cb27a3e..b35dc22a39e7 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -37,29 +37,31 @@ Supported Linux Distributions
 Currently, the Yocto Project is supported on the following
 distributions:
=20
+-  Ubuntu 16.04 (LTS)
+
 -  Ubuntu 18.04 (LTS)
=20
 -  Ubuntu 20.04 (LTS)
=20
--  Fedora 33
+-  Ubuntu 21.10
=20
 -  Fedora 34
=20
+-  Fedora 35
+
 -  CentOS 7.x
=20
 -  CentOS 8.x
=20
--  Debian GNU/Linux 8.x (Jessie)
-
 -  Debian GNU/Linux 9.x (Stretch)
=20
 -  Debian GNU/Linux 10.x (Buster)
=20
 -  Debian GNU/Linux 11.x (Bullseye)
=20
--  OpenSUSE Leap 15.1
+-  OpenSUSE Leap 15.3
=20
--  OpenSUSE Leap 15.2
+-  AlmaLinux 8.5
=20
 .. note::
=20
--=20
2.34.1


