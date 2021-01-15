Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.77])
 by mx.groups.io with SMTP id smtpd.web11.3479.1610726456597789244
 for <docs@lists.yoctoproject.org>;
 Fri, 15 Jan 2021 08:00:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=vF1LkZjP;
 spf=pass (domain: arm.com, ip: 40.107.8.77, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQkU/PnCpGJRg0xGoQDshhzrsCwQjp1WHoxHkXaO7+E=;
 b=vF1LkZjP65suoe25iRSa/eg6bIhGShfWg6Hfo67BzdNq/WJItf2loIeVMe/G9cdbozyrQemO2Wt4KQvtw1axfePWlRkQCH9qaI+oww2weccwpYJvXIZkaGTiefjeFqQBdxO5OEF+wXbummM/6yUqVUcDPX8293MIY86V1WH2bps=
Received: from DB6PR07CA0002.eurprd07.prod.outlook.com (2603:10a6:6:2d::12) by
 DB6PR0801MB2006.eurprd08.prod.outlook.com (2603:10a6:4:79::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.11; Fri, 15 Jan 2021 16:00:53 +0000
Received: from DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::f3) by DB6PR07CA0002.outlook.office365.com
 (2603:10a6:6:2d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.4 via Frontend
 Transport; Fri, 15 Jan 2021 16:00:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT061.mail.protection.outlook.com (10.152.21.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.12 via Frontend Transport; Fri, 15 Jan 2021 16:00:53 +0000
Received: ("Tessian outbound e989e14f9207:v71"); Fri, 15 Jan 2021 16:00:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9f9bfea9ff379ded
X-CR-MTA-TID: 64aa7808
Received: from 91190c50a670.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8977EDFC-39BB-4B2A-9488-40C7BAA632D8.1;
	Fri, 15 Jan 2021 16:00:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 91190c50a670.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 15 Jan 2021 16:00:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFYNNvhyreLVxCNkarnsg17+3erhb5bDXbOwO+8oUXY6uHF5JibjPlUtGNsf3q3hHVdsCY8fGfoerxA3D6Y2/NqaHojJZQ+ihilwGE6GuoBrjWvEk/AyyjM+S2mq0dcFo/N3qz/XfV6Mo7ai/M/ETQpDit0k/ZHUP1ZEMjNj+5JrXN3zTsSrEwg3X2kwD2NEW0pd1MZ/IQ284G4xNZJA3D0VxiQJv4LABqnKoZl0I0p9fIq1l1C4J6RBntYPXrjS+y0i8cVqL0nmxssUE/NTlgPwPtPHx5IU5YRnhRS7k9Y3hu0hSR2lhxAwOSN2dfXHR8bHp2sWuNV5ZJSOQWY+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQkU/PnCpGJRg0xGoQDshhzrsCwQjp1WHoxHkXaO7+E=;
 b=kvXr8JCmfa1/FiDzTn6gFd1M9qyPg+g4m9Edv5HxRrufBkOrozqtjwDMa6DH5C9zzfjIAKk8K4xa21A4hWa/da/hIBQFTK2PyJmFn6M1xm8PswlHDt2BR/V3q4BzVaOkEKKWJIdcqQZATuFa3icZGCaHfLPSCgvrxAc1aorkWkedfxXEILAGtupImFvMwN2lQ3IWRb+FHpNzpFZUnBgwy55SEoJVa95yCWfv2vZut8wA5uVUmWI3ZdgyNw3GBSjorL3gI6nn5/gy5/dHHPBwR3K7fQsvLNioEOYpGzYLgs3p/sj3fOsgfmxhicRaXzjb+bYxZbCCCYPCrFmlfBoyiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQkU/PnCpGJRg0xGoQDshhzrsCwQjp1WHoxHkXaO7+E=;
 b=vF1LkZjP65suoe25iRSa/eg6bIhGShfWg6Hfo67BzdNq/WJItf2loIeVMe/G9cdbozyrQemO2Wt4KQvtw1axfePWlRkQCH9qaI+oww2weccwpYJvXIZkaGTiefjeFqQBdxO5OEF+wXbummM/6yUqVUcDPX8293MIY86V1WH2bps=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB2998.eurprd08.prod.outlook.com (2603:10a6:209:4e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 15 Jan
 2021 16:00:45 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%4]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 16:00:45 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: docs@lists.yoctoproject.org
Cc: richard.purdie@linuxfoundation.org,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] dev-manual: Add usage of /sysroot-only in SYSROOT_DIRS
Date: Fri, 15 Jan 2021 16:00:37 +0000
Message-Id: <69205bd753cb4d227383cbda083fb0bd52e09092.1610726301.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <178308dd6334208c4604f3a14b95c0b1f8e71347.1610726301.git.diego.sueiro@arm.com>
References: <178308dd6334208c4604f3a14b95c0b1f8e71347.1610726301.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.53]
X-ClientProxiedBy: LO4P123CA0286.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::21) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.53) by LO4P123CA0286.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:195::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Fri, 15 Jan 2021 16:00:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3b591263-4363-4915-9e1e-08d8b96ebcbd
X-MS-TrafficTypeDiagnostic: AM6PR08MB2998:|DB6PR0801MB2006:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB200600EE6739AE1D79C3907F92A70@DB6PR0801MB2006.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 85RwuCdIn7arL8LDaxcyhanuO79ycqsICe+zlcXZ/Mbb7UdMTmHpFjMEqPV2xWYqbrYfwsBc2cUihlBmvr1+1FeAV3F+dyaqOXYSUnUofX71jFWNM5J+jFzLFss9Y+ONXVGozgX6hd56JEXU4i0c+DpAi2KNGDB1VDk6r4yFtp736gjU4QY2AXezcSFAM5LvARYWeDokgeUiRvHwfmjC0rSoS08wh2L727HFCieIy7mmZaCp+ypvx8QZybP5Iv1bnTHm20Lp/pE0cCy3UqyR58MYA7FMz+4izejf38lXJu197aGlAQYgziYlv2XFuwxuQttbtQT5Q+M9du7+pQml9aZofaswtpSw4D6n/fDVQR7Pk2W4xgbZcFVl82eP+w95t8x3ipSsekx3VZolcnhC9Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(346002)(136003)(376002)(8676002)(66476007)(6486002)(66556008)(66946007)(5660300002)(16526019)(956004)(316002)(6666004)(2616005)(478600001)(186003)(52116002)(86362001)(36756003)(44832011)(7696005)(26005)(4326008)(8936002)(6916009)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?tG6D6cqrlABggPGUpSaEo7X+3wU5mCyn9rb6n0jhFdKUBDHaRotJHIK2pA8f?=
 =?us-ascii?Q?ckJuULq7ZqW7mt6Tupd8zsTQU/utqhg69GheoaG/oaNDDbiCfsVHRUjD87QF?=
 =?us-ascii?Q?eFzIH0c+uDvV6MqrW+WiY8O+hpOI6qq9BzY+M7XHZixBucSbcmn4PCTdqLlA?=
 =?us-ascii?Q?NjUhE9f8CfRvjzvt6/c8dvMBowyE3ulYvhHKXF/vCkjes9v2P9jRQlSRVWuT?=
 =?us-ascii?Q?uv+PFTAKQ5+n72lHVFPxNWle8ng9wHVB0BDMnQMwtSNieLitBsJSGWv2vB8A?=
 =?us-ascii?Q?Ip/dIFFrgq0OOAIvraalnBdy8es3aCg7g98772X3F8Mh8sKttmhEK7II8RDu?=
 =?us-ascii?Q?967EUKag/XxCWcjvFsGSPEG0E8ZeYy7Gbezdt92/8n5mpHk1E8+mOZQTb0w/?=
 =?us-ascii?Q?XjtZwz3DFMHH94hgxf8hYAT4IHZMbjifyvwj5XgR+49NSDfOiamrEm5aPlOm?=
 =?us-ascii?Q?7cp5qMCjXDYW79gw8fPgeZ7fukW+qgI0RmSOhNOfkwvDtt6owFRXM18kkWJk?=
 =?us-ascii?Q?KAwKZbHy5VjBR7QnrJtLStPNYMPFFnnPrRHABJ7Xa7pxnyjVstY53YTmfK4R?=
 =?us-ascii?Q?U5LzEneU5JfXBe61hPeroRN+vBC6nMbVqBbLS368PzFLXqMT3w7S+Y0uMZA8?=
 =?us-ascii?Q?PMUVi7853CqmJxKlQeuTIA4b9bpp3bK7ANOcrFvqZc38C85vOQmbPA5aQZEV?=
 =?us-ascii?Q?kEOUSASIPZmkox3jSZQQC2Gcub9Qc2XMSo1YA6ErUH0uOi83OfwmyZ+uQhJh?=
 =?us-ascii?Q?Ng2iWhmj7n13GExCeeAn05yj7oK9VwaUTfBKsk50saroKsPWHwSdl37Up0h3?=
 =?us-ascii?Q?hsfq5Ha5d+o+/fW0e9WJhIxp6TIUyIhia5ZUjoUjCErao3lQeHzuwNSfzh40?=
 =?us-ascii?Q?haz4IKzXObSR5fDG1uiXOk+9tdS1aj5EFreb0c0Y2tf1S54gjc1OilNkIiy9?=
 =?us-ascii?Q?PCSISZrsgEAebishARb2kyIo42MHpsxP5YTM/+FbgyP6G2LGZ4PobzC8uKMd?=
 =?us-ascii?Q?VixI?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2998
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8630bd95-c52b-4f8b-b7fa-08d8b96eb7b7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KIq9jyqQhAOqzl1OniQIZ95VDfNBo1BWtqrJtl3j2Z3290T39lmLxsOjEeopPmJ/rh0dNr3rLy2rJBGoJdgCagdEBR2dKZziBxplCmlrJfjRZPPa2j7tYMuxg9cU2vqGTqG8Yfpo8WMRQ1ZJv9rIjPK5Jz+YsY910Zj/LLrYpNW1RnN5GzqurhJcjjcH8hnsu8sth9GB3zHBpCULSIObaf243qe29APPrKRbgj5967sIOqrbFc/MuMwoxIc8G4vcD19ER85pagwDeXHXRDabcsj9eZxWinGGCxunsUMXi0alHdIX/0OqKk+JIuyrZDIW9lf9YTXZ5Bmks7nuEd2D3KXiCH+J754xIsRN+8ZtzWTWHtL+qGMjHlGJ2L0BoFyTLQ5VO13aGRYEsXlCmjp1r1GE5SshvKGObHQ0ZzdPCzQL+qGjmUBgWDrfM+OxWMoLlQzdkzWRboEA+G4oGif5zSdWqJi7//tdY/h+3SPUDeoeYDb+but7nYLMZRPGwLGr
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966006)(82310400003)(34020700004)(356005)(4326008)(5660300002)(6486002)(478600001)(70206006)(316002)(8676002)(44832011)(81166007)(82740400003)(2906002)(2616005)(6916009)(70586007)(186003)(26005)(83380400001)(47076005)(956004)(6666004)(336012)(36756003)(16526019)(7696005)(86362001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 16:00:53.5310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b591263-4363-4915-9e1e-08d8b96ebcbd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2006
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 documentation/dev-manual/common-tasks.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-=
manual/common-tasks.rst
index e1dee8ecdd..2157b6fbc5 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2075,6 +2075,12 @@ recipe:

    SYSROOT_DIRS +=3D "/opt"

+.. note::
+
+   The `/sysroot-only` is to be used by recipes that generate artifacts
+   that are not included in the target filesystem, allowing them to share
+   these artifacts without needing to use the ``DEPLOY_DIR``.
+
 For a more complete description of the
 :ref:`ref-tasks-populate_sysroot`
 task and its associated functions, see the
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
