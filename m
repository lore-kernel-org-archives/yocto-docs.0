Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.43])
 by mx.groups.io with SMTP id smtpd.web10.5096.1610611650450936044
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 00:07:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=zFP5cWkJ;
 spf=pass (domain: arm.com, ip: 40.107.13.43, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aiygNB7dqf5+LQUq2C207lfYIiJG7I7htBH/IjVvQI=;
 b=zFP5cWkJDOEEoNjtFd3b5XdxdAXj59lHfs1BHQvuValMPqTXepYFCEvpJrYD6bTQq9+y+dnXMHv2dECYMIzQHpObPRtcxsQ0ZfLkqassQD9AuNTujM+t9OyoSbefEtBkw5IpZuGVmLWTqVMZg9+RYUz6S9n3FNpUC48NrjEw+6M=
Received: from AS8PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:20b:310::16)
 by HE1PR0802MB2522.eurprd08.prod.outlook.com (2603:10a6:3:dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 14 Jan
 2021 08:07:27 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::5) by AS8PR04CA0011.outlook.office365.com
 (2603:10a6:20b:310::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Thu, 14 Jan 2021 08:07:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 14 Jan 2021 08:07:27 +0000
Received: ("Tessian outbound 8418c949a3fa:v71"); Thu, 14 Jan 2021 08:07:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e83b020172697b89
X-CR-MTA-TID: 64aa7808
Received: from 30599566ad9b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 98ECE971-AEC3-41BC-AFAB-C5FB5BD10398.1;
	Thu, 14 Jan 2021 08:07:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 30599566ad9b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 14 Jan 2021 08:07:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFr7BfXDh2hjp1FwnVOXq2EwHfOxoBf/DRJVNca9GMololMbt3ykT6HWD0duZ11ByHX3NI0LhB2L+03FxUokYzQ2hE+O/gmGdpSgc0YNOcx70+uOiqXGl5Vb1FB9DrUSo2ERazGUAssPecyTgA/WSu61bhD6r/tw895atwXb87oOETYHZI4DpxLZnSoExYlhf2Szy0hZPYtZwk/tgb/TduCUieREamA1VWCOhySmiTOWGtLQQfsjsdSzohv7JQKUFczOirrKCCTYtMmVDN8Nrwt89jnXs8acqF1LDagJF0eO3mc/4q1FP1XV8RTYVNlElD9iWAYKcSYyA8/SLSGHQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aiygNB7dqf5+LQUq2C207lfYIiJG7I7htBH/IjVvQI=;
 b=ZIoKvK1KMMa/BDTPBxx6PydMQmOuYFa8JgRg1BmSLbpdr28R8tgcmg/8fD8OhHDNy0wdgiGegIW6930176Cez6tAJ+mU1f4iT/4LsIDZ2Ybf/56/nBbaLaG+AN2KWM1C8I4yz0g3LEBu22emzsURbklv66F325CoLTYUQ0db1L9RynEHhLFpOd/bOtgThq3bPrBW0obl8gbh+3rKjBnpztn70FtvMWkfIpUgkNvldds9DC4QyWkI1a6B3QEU28U/UUyiXLLeBLP2SlIUFYp1FcJaN8nJYeRYz48xpddK3q4VjYwxbNzn76zAbq6pGW5oZKRJsPM8sZhxduMQKxkgAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aiygNB7dqf5+LQUq2C207lfYIiJG7I7htBH/IjVvQI=;
 b=zFP5cWkJDOEEoNjtFd3b5XdxdAXj59lHfs1BHQvuValMPqTXepYFCEvpJrYD6bTQq9+y+dnXMHv2dECYMIzQHpObPRtcxsQ0ZfLkqassQD9AuNTujM+t9OyoSbefEtBkw5IpZuGVmLWTqVMZg9+RYUz6S9n3FNpUC48NrjEw+6M=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4803.eurprd08.prod.outlook.com (2603:10a6:20b:c4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 08:07:21 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%4]) with mapi id 15.20.3763.011; Thu, 14 Jan 2021
 08:07:21 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: docs@lists.yoctoproject.org
Cc: richard.purdie@linuxfoundation.org,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] ref-manual: Add intermediate-deploy.bbclass documentation
Date: Thu, 14 Jan 2021 08:07:10 +0000
Message-Id: <f9adb84fe3f80421a3e021234c7316836cb5cd93.1610611154.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <830757c5aad2db5f7524e7a99f3b97e309592517.1610611154.git.diego.sueiro@arm.com>
References: <830757c5aad2db5f7524e7a99f3b97e309592517.1610611154.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.51]
X-ClientProxiedBy: LNXP265CA0092.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::32) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.51) by LNXP265CA0092.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:76::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 08:07:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 18f0e22a-8139-48b8-210f-08d8b8636ef1
X-MS-TrafficTypeDiagnostic: AM6PR08MB4803:|HE1PR0802MB2522:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB25227B971FEF96F9E324ED0092A80@HE1PR0802MB2522.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Iiuyvn05Bo1c5cNmfDe5kpx7RJ5CnLhilp6iM3zU57LzZE7H1+KjgcRm3yif0wkcHOdR3lz22puswFwSzfFksiibHp8ESIH4QYOFoe9UOJharTJXqjl8yhRze/BisNjCRmHkV6JEcbtc5a39zWPBGzCE7PTvr+o5dRxGO21N1NPAili6UuqOM2wvWLVWGhSMdAyYoug9ymluic8OuUDZxGwCBcw717vPqK/d2tUBrogefvAD0qJsdCntYaJLcxmY4XEyx/n3CGzURx2u8vC6NKRa5DxCw34+QT4B0Xq49k1LwvIjOtrl3P76k8hCwzIE41UVdkKmFNnCYlU2F16qlzOdsuMvBxuWuQwHymqXBQj1yQZvRYNQvnJRW2AFcDdHkgaffkQX/qdSiaPajmvdhQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(366004)(39850400004)(346002)(2906002)(6486002)(83380400001)(6916009)(26005)(316002)(8676002)(86362001)(16526019)(4326008)(44832011)(66476007)(66556008)(6666004)(66946007)(36756003)(52116002)(8936002)(956004)(5660300002)(2616005)(186003)(7696005)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?mmvAWP6LQhduCfJ6nIAXP8czk0h4b2f6O48Q8HEZdCEjJied0YKt0aBAYheC?=
 =?us-ascii?Q?KWob0n5gSA2A5AsFKDRWtvPtXheCZROUKLR5zDkD5aQHQ16wxTZG33oYFYEt?=
 =?us-ascii?Q?tByMITSruOkjpa7erDH2pC2mGz0Ljv+yVTjk7ukPm9E48HyItNuScuX8JgkH?=
 =?us-ascii?Q?RvaSUvgkWpwK9nkf3gZ8ok/eZfJo/Hnu80ETAykH0ghLJZJ6ci56OCDVWW0u?=
 =?us-ascii?Q?NxUQzLguWaW3Qofpjb/OuqFjkW/qto1Fh+anf1y3gQRQpNZ/O7m5dxo1coBt?=
 =?us-ascii?Q?rkDfDzap33jY6P5CgIubbQImuULurpPzeEn/Ky9Ol6/6JuiDUP+MXiemMCC0?=
 =?us-ascii?Q?Igoee14h5vnPdzz4ayJrZv7AvxQuPL8VETTCITxzY0VyALcUb0ipqmaoz9gR?=
 =?us-ascii?Q?XjvopNPKaEULA7tamcrwvcuBicj8PHYMe+vL+z1HZLdhmkoaz+U5NeO8udg6?=
 =?us-ascii?Q?9HgulO9xPbiR1rKYI4i155V6jTNxO93xDLhUT3b+DjJTXKBUiLa7y7eljPET?=
 =?us-ascii?Q?RITwHmNHLy5AVQKSxXb4JGMAHVVa1jo4rtHFfnyBfErg4hCBA/NyeLTMdNlv?=
 =?us-ascii?Q?6POZqYdnp7Q224+GxtLeRZNjKWwa7DL9Pgl0kr2kYZWg/ZsouQmaU5MbJc07?=
 =?us-ascii?Q?ClJIjdFolZiipQS6Qlf5icMPOJX8AtikoQx5jSZp8kHbsDWlLR2nabe3TJu8?=
 =?us-ascii?Q?krkeYZamQCZkLyShTPaAVl5a6HKY57sJxS48dPAI/wDTQ1+dxgPPYlbwiQkI?=
 =?us-ascii?Q?0eGsqHIaLfZZW79kiWvFHc3i3CJm8JvebqQlnx7fXVllSP2k8puEyVfR/E+B?=
 =?us-ascii?Q?cDb8ifXqcNbUfqb4o4Q6KGg3lAByUlED8OSz6UN0mclQ7Fk/Uy/oO+egES29?=
 =?us-ascii?Q?JC9xDJWnm6kK0+cVkispm0RgW5VnokwCCsyzcjicttrhL4v3qbh158eTB0GD?=
 =?us-ascii?Q?d7p6uF9MnxHyjH+FJg8J77K8cVjDhE17HZUXHdEi9so1gOYuoc4Ixn0YSlgJ?=
 =?us-ascii?Q?rAyJ?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4803
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fbfae6dd-efc4-4752-b86a-08d8b8636b0e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VwdwAP6a1GBhtR5Ol1ZSOBxHsdGv8QHnj9CMwiTiGS9P/cKouNiS4fDpq6EXnfjRIr3iq1+SfDaSTI8HdSTH7kDlpsGawH7h0x67M43DlbKfbmAV0WwZkB/rs+H0jbKTeZyUDIm9SN5oAy8RdJ2j8SWglLHn869ydsm11gEWwT7rCm28CP6XBQmz8Xbuo4gZset9ZF3hcTMs94/NtnKvyr2hoDhNGh1xOfLfhDX4wdmnepH+OZQJhKq7AhDFsssyL+UQcatRg3BqfsuVnlOcYOnmsgpQ4HjqP0az8Z/LVUqlICFQSms7pHuUUNWs9CBiv87b5jpJTJcX0tBdl4EHZm8R1OUDSIxfbzgmvS2GBfD2jcRTHb0jd2nim5P+VFVm/scEQ8LoetEj5mGdYpymqqM2+FgpM4tCbbz7vmJug5iSBr07569E8qawjTKBfysL+CdVe0+7BS0nXSrRk44aSXxxcXHAM7vuOsmYEMjqNUQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(46966006)(47076005)(6486002)(6666004)(4326008)(83380400001)(34020700004)(70206006)(16526019)(186003)(26005)(86362001)(2616005)(44832011)(8936002)(336012)(82740400003)(36756003)(70586007)(5660300002)(6916009)(7696005)(478600001)(8676002)(356005)(81166007)(82310400003)(2906002)(316002)(956004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 08:07:27.4904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f0e22a-8139-48b8-210f-08d8b8636ef1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2522
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 documentation/ref-manual/classes.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manua=
l/classes.rst
index a152dcac77..e0834a275c 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1325,6 +1325,17 @@ of symbolic links in ``/etc/rc?.d/`` within an image=
 based on
 dependencies specified by LSB headers in the ``init.d`` scripts
 themselves.

+.. _ref-classes-intermediate-deploy:
+
+``intermediate-deploy.bbclass``
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+
+The ``intermediate-deploy`` class is to be inherited by recipes that
+install intermediate artifacts which are not present in the filesystem
+to be further processed by other recipes. The INTERMEDIATE_DEPLOY_DIRS
+variable is a space separated list of dirnames from ${D} which include
+the intermediate artifacts.
+
 .. _ref-classes-kernel:

 ``kernel.bbclass``
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
