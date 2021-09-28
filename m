Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC783C433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 16:22:26 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.83])
 by mx.groups.io with SMTP id smtpd.web11.1908.1632846144140074354
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Sep 2021 09:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=RphnTOUf;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.83,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KI5r8msAqjZLNEiFOPaloGdIa+dsLsdsnwkr/kqnCtSm1sWwpuvtiNpZLXuvon8EA/MGYWd2qbfxF6eu6/9cCSv+z8L95p+9gZXSsLaRuwP7Ad8Y8iQ/wxloNJH2qOey1jfXF2/bFbPRiO2nGv0U30XHj6NjkQEdf/KqmjNtXNyUeWHFUReS1hrSCMIi5MuTwelLLdEGBnt81DxTL2e1szROAOy1dF8jo8QUVkW2S0n17aiFus+Id7+OKIw/wWa/bhpRh7eOhclhEBGbGriP4w8GG0ZzS/VKdpTFJCgvrOYi/fDc+qpnDeHqtrdrR+g0y8PPJhsAN7eAixpsMNypwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=WWypnxyn90GoI/3jvxnJylSuqPIqh9KtRf9PXqmjdeE=;
 b=VuBNZevKZ48qT1GmCFwjoe0ziSHdukSXBv25HJYRsAWSziga1tHFMshw66zmFts6C/b11UhAMpw0VY3QUagDFAtYTAd56MU+DsDgKoInobLSPf8RDj+vFC9whH9Lxi4eXTAqwbs+Zt8kGe2PTolvsfXh/OlkJeZPMbg1+oOchUSZVpMJoQHzqKZMdwzNI7D2axACEwcpQNrWuuUd60eHImETK0ZAFc9JtM8FIRsocca1LOfNbTZJW3eESU+V408mZVPyLOpJqUDLnzyg7hLt46OFvLvFAuOLKWIVyXMtfw7vUUknj6zk9dXlVy5EH/oJj7+87jUDIdW0nwHD5OZ/JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWypnxyn90GoI/3jvxnJylSuqPIqh9KtRf9PXqmjdeE=;
 b=RphnTOUfJX7Y8nTPJy8wX2CbvhBF7SiigiVs9yscKCJHMdci6UsNButdW0v6S4GhJjjWOnMuCYDVV0SGuJzlCculPax8MnycnEgKjbaGtT+18RDQmqwqgW9NeVzr+hrONF1cAQnhKHX+NrWZzCaq4RcElbOq6wWJjbFeUQWmq40=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB4978.eurprd04.prod.outlook.com
 (2603:10a6:208:cc::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Tue, 28 Sep
 2021 16:22:21 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::1d01:cb7d:b647:46a4]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::1d01:cb7d:b647:46a4%3]) with mapi id 15.20.4544.021; Tue, 28 Sep 2021
 16:22:21 +0000
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: 
CC: docs@lists.yoctoproject.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 1/4] docs: sphinx-static: switchers.js: add release name to
 dropdown menu
Date: Tue, 28 Sep 2021 18:21:59 +0200
Message-ID: <20210928162202.749990-1-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PR3P189CA0061.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::6) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from localhost.localdomain (92.42.140.82) by
 PR3P189CA0061.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::6) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Tue, 28 Sep 2021 16:22:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9422ad79-2d96-430d-5aa3-08d9829c25ba
X-MS-TrafficTypeDiagnostic: AM0PR04MB4978:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB4978ADDC90364DB0AAA170A1C2A89@AM0PR04MB4978.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H6tJ75rsLP2B89nywACHBaW8e3J7Gk9/DbFN6fTZ4PD7oRrCRKo3t+M3Bnl8mUy7aPrbx1bqtAXi6b7sxajgAGjD20Fu/GOXT6EsORgKWTRmEdR1Q4PqBrVEyFJPvqZjjOCX0PdQYbOHcdzbYYbiplRQBi/zTRXfFAVrGAbZl4raxe+m05SvAEwRbeh04W3rSjs4MlpaFuntNe9IN4DSDH6o/DaQc04Ev88djGaFxGk1JEwVXvAaWGXPS3h3/d+WaPemofUjZRaKlx26xokLBBz/Ro2GLc4osbgWnw6XEoUKF5ld89/XkgwaGw5AQ4gG60UT/f9jXY7AqDcq+lWgdXFMyhsgR7oWv7jv+EQ/8w+e1csZLHp75nznyHtZwS1VvId7YmrboIQyBRG6saFVQ388pKGzDZkWgg8jqgYjhEcG3UdEkI3A5u1oHrZVbcn9dSZuZnafh7AoZ6hlf+7fX3qAr/HOXE+XNrj+hjBEhLeJvpkZ1SgnbQvmd1C2W3koHMAFjbCqK+0jDCA0dSfMz1Oj1D/pAfDnBA8vhzIYeoYp1inoAFHs7ItV5d6wRpbpUJYu/jsJfiPweqtRdhXIm+sHwa3ieEoXgxnZDFXPUKKOKdvh12hQOVEKLnMmSEJ2yMevqPjvvZ4lS3Im/H1g7XgKGNPDjOv7jIcUs9fR+KZO03L/UhHtYV3C8XP2jP2kmLm+2/uxqcXKhDk4r0MEy2YGqm3PJbWP2p3dVmphS1U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(38350700002)(109986005)(5660300002)(52116002)(44832011)(83380400001)(8936002)(26005)(8676002)(6666004)(1076003)(6506007)(508600001)(86362001)(66556008)(6486002)(66476007)(186003)(316002)(2616005)(36756003)(2906002)(956004)(66946007)(6512007)(4326008)(4744005)(54906003)(266003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?G6PL1kywExLjhkOL3ZXgZXz+TlAqp1Ts3BG4QmXGKhZ8LOgifFyYw/v2YFvN?=
 =?us-ascii?Q?RhEsCURVaJfeoPB0uSV5IFQLpsKpxCplDtp48BrOtsL3pf5INOqNVX4Vm16n?=
 =?us-ascii?Q?HsAHikiCtkW9wbN3FRGz2ZtQ5WOc93NAipOC7vcVr6jkrmo1snsp9wGtPEnV?=
 =?us-ascii?Q?AM4Totj2ej+ntB3fyWLAJEBqZqnfA2ueGgpc7HizFN+WJPeREKaM/4ipgsbB?=
 =?us-ascii?Q?DoCJPPvpEcDBSMSByfSVGJH4tIxwQycBte1oL/G5gsGNX6H35zre/CdSvSPD?=
 =?us-ascii?Q?gQNCkzTucciUjdFL8vyD71F9+bMEJm9FncuOppcd07CIetAa5UFxhIFGFeLa?=
 =?us-ascii?Q?93eCm1bYx36E3pDMqvTiN7jTI8REpKBFXKMCr6AaRTOXZ76vmABqIQHtKfoM?=
 =?us-ascii?Q?tjCrf8c6t8sx+0PHKMuIE1fs025gnGIrDrSHybuxJ9V6sKFThyU/NbxBK10L?=
 =?us-ascii?Q?ZmbjYnNszQuKuEnvWQ/PaxfsCgpg5gI/5TZ9qsjox/3vyYBiLr0pvHV7MY6B?=
 =?us-ascii?Q?ULA/VJUrWQ9SHQJ5rSDvIInKDlMnTiDpR2rJehJ1Yy54kv1rYT7imLDy93/7?=
 =?us-ascii?Q?eKK1Oi/5dzPP2pQbS5crBdkX0lghMp6yKvLcPpw0DzwvesP5yxAkuR3yLM/i?=
 =?us-ascii?Q?UhETtQ2eYgN7onwb2Uvc27HHcWM5i3InvJjdr6mme4ba1CjSsw57d0HXFjEx?=
 =?us-ascii?Q?kSt+laLY6KLFXEeqUeYDJNulD/JD0yqDKIxAgbi3wzp5qu6xmqBQUFRl1WZL?=
 =?us-ascii?Q?lEiE8wbEGglvKg2TPDzBkEGW11Ea+pJQHCrIdQ740Urs/lTIKDVIi/JncevR?=
 =?us-ascii?Q?dKOBqL2GsNP4f3fv6ogGesw8TLQf4J6s5wKYfJM0Da89SlkVUR4bQzrA4/2Y?=
 =?us-ascii?Q?2RIZtAwEPLfOZcMXgSaO9lLanUQ/APr/5xkBPO1TKTF5aNvAgJmH1CcnHsFh?=
 =?us-ascii?Q?K+WZ1UjN5waJBfG0GpnCq1STkokN1k1D8R1nmwJFdsNhLGxXuxa04o0c+Fzj?=
 =?us-ascii?Q?xDEdFeYaiz9DeLaTOZNI6hD+eHKdqej6vXWUmDfJWaPQx/VbZgsk2veCyx/3?=
 =?us-ascii?Q?5H3XaY3xdgz4NMfxcw6g5gAvG0eP0MMhfTICRxpIsN6FRHwEjBQG7qOBt9bb?=
 =?us-ascii?Q?wE5yCey3VZ1TenBtoz1nqbugIBr2RDjTqCHdfsg1i//4nY4DoNuXOVwlLd2D?=
 =?us-ascii?Q?5am3rXOkQAr7kEIP8Rj/gxjgAUYnhhDS7kQyTtZBiqY/mhJQu/nnMugSIYhS?=
 =?us-ascii?Q?bGKb7dYPGoQ9jSqYzH0anYcBbEE08Lj/iSaO+sdBo8on77x/0sq0czFOAI2O?=
 =?us-ascii?Q?nw8KaKxcKvTs5+QJjsfxfQ4O?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9422ad79-2d96-430d-5aa3-08d9829c25ba
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 16:22:21.0643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pzENkZN5tKqYHVGQeDNSdUAAPUakFuXkpLUzfBygfo43LpuH98K/bxPwJVO+pdykv3kihDqGeC6F+pPxPKnSdBXvnN+EzVI2HdzWbdQkwmDD7vTGyhQ8cmTfcpM6Q+Xz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4978
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Sep 2021 16:22:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1899

Cc: Quentin Schulz <foss@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/sphinx-static/switchers.js | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphin=
x-static/switchers.js
index 1e37b625a..cb55e35c8 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -3,11 +3,11 @@
=20
   var all_versions =3D {
     'dev': 'dev (3.4)',
-    '3.3.3': '3.3.3',
-    '3.2.4': '3.2.4',
-    '3.1.11': '3.1.11',
-    '3.0.4': '3.0.4',
-    '2.7.4': '2.7.4',
+    '3.3.3': 'hardknott (3.3.3)',
+    '3.2.4': 'gatesgarth (3.2.4)',
+    '3.1.11': 'dunfell (3.1.11)',
+    '3.0.4': 'zeus (3.0.4)',
+    '2.7.4': 'warrior (2.7.4)',
   };
=20
   var all_doctypes =3D {
--=20
2.31.1


