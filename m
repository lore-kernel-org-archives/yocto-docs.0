Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25758C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 15:52:06 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (NAM02-DM3-obe.outbound.protection.outlook.com [40.107.95.105])
 by mx.groups.io with SMTP id smtpd.web10.426.1692287519218758591
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 08:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=Wd9bBgnT;
 spf=pass (domain: ni.com, ip: 40.107.95.105, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScaWwLrCHhlipkiQ/6M688iwJ8xSPvDcsxJxxSm1u3w9uEQS5awOKXg7ea/7obnPmFPiGetQQRR4Qhomz7nMzSO5GRSiRg+aQ40PvZMk6ZPeEna6tpEjmaYivRroyhTBiUCW7JqekW8YtWOVP7FeKERxRjvTkDAf5Xpy389VpqgtNF69fxR+LO5CGcTdb1nq93gk/R+zLtZpl9Z5E+Wwv8Yos+IyfnfuzzVa5YY8A1QYAp3wi2VQAopHHn9q3jXYnICf/lNKQFKs76hbqJLCrEy4t5sy/K0/yzYmvgMRTUAyfDf9mj1X6jk+A+3XFpd0CM1gJUcEWZUk0MnBYFmSeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIyaIb52YRsb0SH9Sjw3tNzvFD5oVPdny1Aq9fKerso=;
 b=mZ4bQo1+eGN+yI1GsPX+VW8zzb8uOZw90gCyGCzGqnjvhU8dWnlISsHXStag1UGre+x9TeAFZgbKTtkWrZ72gmT4OQ0BrRXoCSkKJEFoRWUpSrzvPXHC6NAnsRNYXEbsnLUgeun0u1bo/lziBJALJH1/Vvse1Oo/nPyR18futV9i2RSbAQ6GuCk1EwnoR9sPvDWWWMRZmcf8PYuvHeR4ayO8OUHXO9GUvbDaY6tZ8V7hmi4jQjP06FlBDpxJ0YAhbrmPWPRrzUn/SoWKrO37Oslirleu2+iEVrOY8thatKoMZ8UfmtbhbiJ+sSgaosb+iHBKLLqExCmqTnYXyYuQNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIyaIb52YRsb0SH9Sjw3tNzvFD5oVPdny1Aq9fKerso=;
 b=Wd9bBgnTx/UzsqGJq6mA21D0QyxSwHG1gMANYTRfdpFxsVgNnUNB3gvPhIOCGyQW6wbmvZriwlIcywQGHZHmyjJhmNILA9/GjxDmOkyCS5j60R2eVxER1ANJYaq/qr9ruOiwFrjAroGadKFYdo1Xipr0nfcA2iTaYW/uXemwCzM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by SJ0PR04MB7693.namprd04.prod.outlook.com (2603:10b6:a03:32b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 15:51:55 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 15:51:55 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: docs@lists.yoctoproject.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [PATCH 3/5] ref-manual: Describe new package feed directories.
Date: Thu, 17 Aug 2023 10:50:42 -0500
Message-ID: <20230817155143.2578874-4-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817155143.2578874-1-charlie.johnston@ni.com>
References: <20230817155143.2578874-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DM6PR06CA0096.namprd06.prod.outlook.com
 (2603:10b6:5:336::29) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|SJ0PR04MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: bf8a9b96-26a3-4234-9d1d-08db9f39e201
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kAqCsDdcYGiDbxAT5c3+SCuqUtN/OGDYPUBGX5KkViK8ypXOSLn028w9hNTA/1IYahcrojnxJ97C0r8KTLKhyFu2TfU05QqFwMyzMDQd0kX4sjMX00wRu6fbEfTnj0rvdRmF72CrsRRfW54NjDScC32vFctaxafBp/ft1IIIaK4SYkBFIhduC7SqD8KjjtuGpbqovf4vVMB30sF+Qji05h2/VbBbL1MNjVsp+oAp+Ca30+eqt6e8Fdn5WCzabku51Y8DmnYX5BsO2l7YRaSj0zq2aKIhiiHhZzv37ycEeHocyvL6IPFuNJlyNI38VVKGcTPwoJz9+bdP/t1QYlRrPAEJ7c2f7OzoQwicVDhzDxrNBrIpo3ZT7mz2EAz0TqMX7X6aJ03cLFHGIttdHhLix1GmOKir+kBqnZx1iunqZ4yOUB4KNqvbp8AN+w3kiimnpphuD+2IywQA5iOPw3evPrOM9LPh+fy1/9WFm6OcunL0PwahxIFwVKJVE1FEaw9EeLcWTIvV8kMy17leA3QF9fbvxeO5jtQvDvLyKRlNvSoCeeeLiF5wKjh2PwiikbLf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(39860400002)(346002)(376002)(1800799009)(186009)(451199024)(66946007)(2906002)(66556008)(66476007)(6506007)(6486002)(6916009)(316002)(6666004)(478600001)(5660300002)(44832011)(2616005)(1076003)(26005)(41300700001)(6512007)(8676002)(4326008)(8936002)(36756003)(86362001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RE8xXLqvPwUtN+/K8OtL+1bftrrqgxHtZp38kTcazjNK4A511OnipksGcP3q?=
 =?us-ascii?Q?CzzZ3B7JPLcwzJWl+ltEUp644mu2KpSntB04KnDoLcbOXDrCGyoqITplSv1h?=
 =?us-ascii?Q?NNC1B/4UmzdF+Jpx8KlZZN/spLYHQcMSZ8mo/odAkkKDrV9VTAfIostDHO/F?=
 =?us-ascii?Q?0TlGpO2kLFDU/vIal/yA+CC8gV2GvD/lmGXLBIUKZSe3dNfdxL18RWgEZ037?=
 =?us-ascii?Q?2/ABL3omE5P8I7WSbwEyH1SNzwWMCf/z9hx+kn2W/qjzsdisgDZuWb4QQ4If?=
 =?us-ascii?Q?xMbpIMNcvuzjlNu5LnPznLcl1jPS37LPg9id4XxlCY6Zwa9+t/YQHXLzDjzF?=
 =?us-ascii?Q?FGSa+TNRLPWl4GmHnx7SvdHtkZPJXfYHp/VOc7ajChOvTdW+OIqR7s7G/3v2?=
 =?us-ascii?Q?Jzv/F8B0NA92Yqmp2JrHSPsgNi/cCdc74oLMKar/a6a/1uXanWlMrs/Nu8jZ?=
 =?us-ascii?Q?C5RJ9hYz2i4gnabwUDU1eHuExMtQxN1pbuejChNEFbbiHhnlBHRwyPSeVLDH?=
 =?us-ascii?Q?EgUmEd5zZGDAGKehn0YsJ+5gBfunoDvcJbBTXXeHW/fA81+2YjygPB1CWypV?=
 =?us-ascii?Q?kizk41EKeRTvxbVi86IFDh8neY88f73E4hk10jke6Gb0aEj26SmeJSbtU5te?=
 =?us-ascii?Q?R+fMTzoQrmlQKtNO0RcM2+zEB57JibG8swYkanhYRlxWhhq0/EwhvvihYaLJ?=
 =?us-ascii?Q?gDNIBv2ljG2VMdQtiWWboAwcIs5XcQ7eDP/R1IbDaIq7cm/9dlfC2G0VWkEW?=
 =?us-ascii?Q?Wd9SrZS+2t1JhchPErcXDTf5cycBup8HOCV/GobVpfwUwBr6cF81Ey/q8d/A?=
 =?us-ascii?Q?XH/+jGS5kfkUXgdjLvT4N4+yndvORRk8sHzjQRKAtLdIIapbBjjwq7A0Q/UR?=
 =?us-ascii?Q?WKr0OOtZnLUtlH12NaVxr4DTSFdL8083apdduMAXCWgWQEIOYclfVZue1zai?=
 =?us-ascii?Q?iHA+wVz0No6HoyOPXBVXDtYoUKZTzlHPWnL8qWJXVQEeKgCSPx0gM5FBiMTZ?=
 =?us-ascii?Q?G2wUwjTwbDU0QegzNfN498X4QMFJiHxc36bW6OqZwcKcX5QpJL9zoSTMmhAb?=
 =?us-ascii?Q?eTI6ppdLMvfmGcreNyiUlh1pzjv+joDYGrGWulwDjO+bdBGY+0d/4b/L+Q1n?=
 =?us-ascii?Q?QusvItlvoxzX9iPQs2BW69msf1gaQx6+KwtFGnf14fUep5DvEOl7LKAYT32F?=
 =?us-ascii?Q?WaCKXKYxkI4mNXgTf6/GLWTN78w8ogaaWXb2fIGBG6EXb9c8/oXuFgf9Giv9?=
 =?us-ascii?Q?0q9s4FgMq1qpjPBOFRNh0PS2qnz+LagzX5iFtqN0IPV17FQVLguLewrGc/iX?=
 =?us-ascii?Q?Li/vHZun0dYy8V9EfSH9KQps4mR3sJ8FiRTmXf8xUbxkd7eYuvunnjeF12i9?=
 =?us-ascii?Q?oE7UlA6+MLyhfcxXKHSDRk2+Te0IIC2m3kvHsbY/He9CUOMSP23yqTTxwQ/K?=
 =?us-ascii?Q?urTtgXdgTe38gU+wBhP7VUgN8rquqmNrC9zppMe9EjxEHp4fgWkB88AQtMPW?=
 =?us-ascii?Q?NFBkErPmZN1T4Pblw8o5Fj2zZbZZ2g7ZUsvmy/APNmynHLoao3E55vUJmqZe?=
 =?us-ascii?Q?pg69yK+1fTWHmnm6IRalEPW9C6CHPsYmwUiIPjdOPBoQ2z/KR7cgO88Yi3rP?=
 =?us-ascii?Q?2w=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf8a9b96-26a3-4234-9d1d-08db9f39e201
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 15:51:55.8038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvxW3/CjHkkheXGmjtHnrO8bVNI4u+UoXhY3V7/HltzXAPAxsscjKUrLLdHipg/pGln1vl/H8KoDWGSom3OZAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7693
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Aug 2023 15:52:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4159

The addition of the packagefeed class adds several new
directories to the build directory structure. This change
adds documentation for the ${DEPLOY_DIR_FEED} directory
and its subdirectories.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 documentation/ref-manual/structure.rst | 36 ++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-man=
ual/structure.rst
index f1b11ad69..9e0a20441 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -431,6 +431,42 @@ types.
=20
 This directory receives ``.ipk`` packages produced by the build process.
=20
+.. _structure-build-tmp-deploy-feeds:
+
+``build/tmp/deploy/feeds/``
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+This directory contains any "end result" feeds which are deploy-ready from
+the OpenEmbedded build process. The :term:`DEPLOY_DIR_FEED` variable point=
s
+to this directory. There are subdirectories for each supported package cla=
ss.
+
+.. _structure-build-tmp-deploy-feeds-deb:
+
+``build/tmp/deploy/feeds/deb/``
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+This directory receives any ``.deb`` package feeds that are produced by th=
e
+build process. Feeds are placed in a containing directory including with t=
he
+name of the feed.
+
+.. _structure-build-tmp-deploy-feeds-rpm:
+
+``build/tmp/deploy/feeds/rpm/``
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+This directory receives any ``.rpm`` package feeds that are produced by th=
e
+build process. Feeds are placed in a containing directory including with t=
he
+name of the feed.
+
+.. _structure-build-tmp-deploy-feeds-ipk:
+
+``build/tmp/deploy/feeds/ipk/``
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+This directory receives any ``.ipk`` package feeds that are produced by th=
e
+build process. Feeds are placed in a containing directory including with t=
he
+name of the feed.
+
 .. _structure-build-tmp-deploy-licenses:
=20
 ``build/tmp/deploy/licenses/``
--=20
2.41.0


