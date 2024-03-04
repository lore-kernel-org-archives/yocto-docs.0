Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9B0C48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 16:01:00 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.79])
 by mx.groups.io with SMTP id smtpd.web10.102906.1709568052127854751
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Mar 2024 08:00:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=h6sSxSX7;
 spf=pass (domain: axis.com, ip: 40.107.105.79, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOo6YTNT56QbsvMSpFgE9BIVEbu0g9K+LdHv7giw4818hzwSP3fIU4upiIgO4xFaIT0bbx/4KBqsdiVBCT8x4ikbVPbSymAT1YtI9P59O4yxNHVIOf/8rsxBZnQ1xVvdQDFPtuO+UHSWfbOXIyyiloiFxBBE8K4Lqw8VqtYyo/3vV6STEj6WjnJ9qyp3xElETCyyTtrp0SUkk7juHHVKZy4MYbNBlC8Z6atvemMSuPU9TReOANrm4m7NYJLkcYhSTYq/97WQC38TAA/fSlAYoF5H6nPCvYrkp+4TWvKjwlN/uDP+utb7Je6UdvPvZDsKCYvLeQBienh+pZn9jnLLhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDRmOOtXwEaievi9/3wTNXTRx8+J0bHG0HJOH1P3moI=;
 b=JymJ/0wekv5mniceLQNSPEaKabdkCNUJcEaJe2rWA7zoQxTO/z2TsfOi03baTODkrNt7v9TAptzFOXHzVPMKMDBwosU+OP+xSHV5GfSShsMlTjYaUcnIA7l3IFxsLSGOfUjmoHN9aRkKupvsdYeMSyoSGjlY4mmVF/Hk+Wpkcr9hvUdRLSgXc5foUZD+KdJqqp383kxbBk9NOW2QxCbRM5uwHUQ/HKkSbfm53i1Cwno45L5yyZlf/nntOVezeqT4TGfyU8A0ol7miczrlIhNgvwV5HFM8ZbQ6L5/3ohNNxk9jVAbyAY5GfOZ18MvurmjXM0ztBAC3cjLtAeU2b/6Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDRmOOtXwEaievi9/3wTNXTRx8+J0bHG0HJOH1P3moI=;
 b=h6sSxSX7HhIN/Sj1VIVMlUeL9KujJNGczJYMtq7w5HhpkT11ecQefPoyqlGIHx+z2oVzG+2HjLhdTQ6bDFATgNctQNHZGe5b6kmeKRVD/VG7+JB1TAr98fLzIP2Wyuti8aq69jvi/SoQscYwyQIAX9PuE0G889AKVgaegHPfwcA=
Received: from AS4P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::19)
 by DB3PR0202MB9304.eurprd02.prod.outlook.com (2603:10a6:10:429::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 16:00:48 +0000
Received: from AMS0EPF000001B4.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::e9) by AS4P191CA0008.outlook.office365.com
 (2603:10a6:20b:5d5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Mon, 4 Mar 2024 16:00:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001B4.mail.protection.outlook.com (10.167.16.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Mon, 4 Mar 2024 16:00:48 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 4 Mar
 2024 17:00:47 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 4 Mar
 2024 17:00:47 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 4 Mar 2024 17:00:47 +0100
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id BF4471598A
	for <docs@lists.yoctoproject.org>; Mon,  4 Mar 2024 17:00:47 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 424G0lJv2326997
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <docs@lists.yoctoproject.org>; Mon, 4 Mar 2024 17:00:47 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 424G0lQg2326879
	for docs@lists.yoctoproject.org; Mon, 4 Mar 2024 17:00:47 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: classes: Add the kernel-module-dirs class
Date: Mon, 4 Mar 2024 17:00:44 +0100
Message-ID: <20240304160044.2325620-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B4:EE_|DB3PR0202MB9304:EE_
X-MS-Office365-Filtering-Correlation-Id: 9380f470-2a1b-4db5-6098-08dc3c644212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/MZaUh+agopZfrSvXS9AQRyDUNpAWyB21EohIJHCuq1qazOIhcSCHtyO5WWLlDG4Aa6ZI6B8SpvDAbbLR1C9YCzpUC6Die/rPfJzqYvfiPPmj1sQXo1OJHWNGKIXEr8MEXSwLHlrN8HcGpbeugghbWHnEo2DFTvV7d8mayPQRbJF8CC3xJeH2XbOJu1kaHhCbHR859PQBDBR5VIRhSrDTkJa1mowZMDK7IXSKOa0KjouBkn9P6yRWDY40qdU3ZE+2eUf1481V2ISzVxkdlCni+2T+SvaCMnTGVFLR/1dO9IIQnqh42Jpn6dQEDzvrqE7mn1AcRZ0Gj36khsP7IH/Aufg8yTmcaGSidgn0XUdwu9Zl3y7OC8B32htwQLBw8z6NGWpA8Z+FWovlOKQpELIYM/xHmJP300EwKjckhHBvq+MyBwuDUQ6Vs/Q2nq61vCyqA4dSVUey1+aZi3TXONhEgu1nBO9vdYK6gdpsZfIPWTHjV89Fsmmch1lG0f5OtTG+KlCmfYYRG/qGoWWuJDs81I8zo7yr917LZ+6564z8wCzsr8MDLB/OnGEOHXKSwpfitTWLeZKPfswlyKIL7EuKeqsjlyuY8e3oNXEbSr0/spKKV99w09H9LHBSCkvP9wq/2WTn7e4pkH/VKe8vczAUnAtESr9THj9NqQUYcDGY1FSTgqwEL7nuxyyhzL3uKBVE35V2UFJxOgmE0WatFmcHaNSSdMyn7DfJWK7OvkGU8K/4IFvcfgXPAMAqcpPxxcX
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 16:00:48.2195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9380f470-2a1b-4db5-6098-08dc3c644212
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB9304
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Mar 2024 16:01:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4927

---

This is of course pending the actual addition of the new bbclass to
OE-Core.

 documentation/ref-manual/classes.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manua=
l/classes.rst
index 7300020ef1..d61be8e4bc 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1705,6 +1705,14 @@ The :ref:`ref-classes-kernel-grub` class updates the=
 boot area and the boot menu
 the kernel as the priority boot mechanism while installing a RPM to
 update the kernel on a deployed target.
=20
+.. _ref-classes-kernel-module-dirs:
+
+``kernel-module-dirs``
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The :ref:`ref-classes-kernel-module-dirs` class provides path variables re=
lated
+to kernel modules.
+
 .. _ref-classes-kernel-module-split:
=20
 ``kernel-module-split``

