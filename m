Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675AACA0EFC
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 11:40:18 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.106])
 by mx.groups.io with SMTP id smtpd.web10.11442.1725018008141475625
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 04:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=A7UAsOuB;
 spf=pass (domain: navimatix.de, ip: 40.107.241.106, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nq1m7g/Cqxk5yuYy28eNpHQ2at7eodjz/KS+PVjpNlk7230pUwAEn7ItzjyZFKv4Qag3Mp+JQSPvOcLZQejlJEIT91jcrSbedAMx86/dYzFbs/NXh4PnDc/tPGqV3ZpiLgObTlSkm0X7lMRrOGJapqF7HpWgA8j1+282ha/nH+XixsajYbU5HfElVMtl0W3wgzQ9xxAdFpjyzFupTBl7QFK0Hz/abXjuA8/snj1+IaZ6Ke1ZXzUUXcVRb0bJV6WwOJAbc+98N97bWXtF+lVLcocMCxTQozo/fYhSh1kmsGmhnmqQ15WlznQ+SdE11EgYlG324+lMvjgbxHo3iAS46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQ3Ktoh/JjPXgJZVF8qG4Bn8X1MczcshoEW/KsOvpIY=;
 b=x8I1O7VPtYKoAmv69iHCEzBGTy52b8pd7ZBu/5VHDAJxAd8+k6bIFl2yzXgA5Kq3oeNpglV8nOjimmAtOqyDc+zxagFXpBTtQTo1YzhTxakuHDNvsiFcSDZ0y24o9TeWOKkLTmcoks0dFhergKUpqOeO9KCfSxkNOGUEqUc2iFhyNzsMoQJI8kUFAWvyfMU0y5LyKWDsaPzo6MslTyi4eg4bAQAihyn2dQrh20Ph9vxIu5jnlGeJoUQZZdodeSm2atYdII4V0czlcxEAQ3jeYf1f8hE6FOYoGisHd3NZoRBuRJJLeJw9jbd7pijfWEXJuq3tCgSvjIpFVhLLL0z01Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQ3Ktoh/JjPXgJZVF8qG4Bn8X1MczcshoEW/KsOvpIY=;
 b=A7UAsOuBMRGm1HUnhcwMxxx50WexT7LgvUCRZbG962hAg6FJaUSMEjkRlk/xQZK1bnD/pZCMA9dCR3yXGX/GhlWgr5Q2QQn+4kYZ9cWz/42c3U47hnvIin8fac6h6c0PVQBf1ZSSmG3e0Mz5KC0cQumyZewHwCtRhV7HNYCNg+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by PAXPR01MB8485.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:224::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Fri, 30 Aug
 2024 11:40:03 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%2]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 11:40:03 +0000
Date: Fri, 30 Aug 2024 13:40:01 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: docs@lists.yoctoproject.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 1/2] doc/features: describe distribution feature pni-name
Message-ID: <9288e40f901792887ac98417ae8c89fcc2f23a0d.1725018000.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0282.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::6) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|PAXPR01MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: 42076ddc-6917-497a-1a96-08dcc8e87c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JZ0XdAt6DKD5Hqf99euaBbeOsRw4Jeo3R5q0Wd+j20L6E4fCpKMTz2pqwL7u?=
 =?us-ascii?Q?2kMvmilirhnXmhqi0ubRVoat4vb7/q1A4YiDXJv3F+Ks3ogRICRfyuMTZNW9?=
 =?us-ascii?Q?3xBtbRRaUWzfSHBdw/hUsVB53zelLdo5sEsVWozqoJRDKTKW5w2UifTT58V/?=
 =?us-ascii?Q?ZvPuKB/l8WRD47ybDkDlUVjUCGx09KoaxhsOmASXOSeBXvHEl7nhptxS+Dvl?=
 =?us-ascii?Q?dCBYxOX8VObDy6JrV+XP1i6nG0Vm1DiPSvsB8sbXv4rmWJxRx1D9CwKAC7x4?=
 =?us-ascii?Q?KRe1o/SiIw8hj12jR4nQuYwTqyZ5GpDlK8wwak3f2B9y70QHRk61D6GUVdxG?=
 =?us-ascii?Q?Ch8gn0Rr4wY4nhxS6wodMAab7umTlu0G/89RHIwiJjjkISkOG/3IczWyyu+k?=
 =?us-ascii?Q?pxyOl6eKZdypYSFyyTAamzgBzOVnv4kQZAqd5uPQGTdur8HC7Eo16JjXKRe/?=
 =?us-ascii?Q?U7aAFZ/FkKoP9jzYjAxSZ4s8M7Ub7qYXBb6U1F6baJVyLffg6jom9d4hjkem?=
 =?us-ascii?Q?It8XsIQxmEiNpZ2/QR94Ewl9tVMivTw02cqTFJXwd+q26ef920H+BuBCIMl7?=
 =?us-ascii?Q?L9gnoDZR0bmKHDJErbwsQeHvKqsEVuCPGmQv4r4F++AgYrnfsTV1lhw30iv0?=
 =?us-ascii?Q?jMfTpHdnH7Z82rqc02HnYFHccM5dGlffZAsJsbx3gng4DsX9gPsnFHIJB5Ho?=
 =?us-ascii?Q?03rfDLU/hBZfAYQ5Q8MJUhdlVgzzDAqaPlH6z5QoRGyZMyNVn4AFq/zDZ9XN?=
 =?us-ascii?Q?qmDa5vw3zM38ZmN3kuARiTunqFtpKb1zbsTrRCcK27voS+lsHyWAEMMP82Pc?=
 =?us-ascii?Q?5K9V0t/EYjiP7aqipBT4q53G0IK1ph/6w+HdBLf6JkZrkOUKJ4HncGL8UGUK?=
 =?us-ascii?Q?QeYwUUIQfARjDElEiX0NIIUkWCLrTIjj34F5yFamdX7xJSaSje+WP2JTo/dN?=
 =?us-ascii?Q?UCuSU/lfNxrEpvdqsyPhsNMd2SfRFCkqKHc/Ed0DUqqKqbighLMG+7cfAzAY?=
 =?us-ascii?Q?rsDosxp83QNZWPoIADw0jr/STrdVh3IzbYNloZ+w1gzjcGvOBl0ZAc2sNY0Y?=
 =?us-ascii?Q?boEWmSyzS+N0aOM37jouDWrt/VjYDtmCIzlNp/doG6BMgdruZpqi+89efdYa?=
 =?us-ascii?Q?rA2tY5gDNI4R+cKndFQm6HjVTLXnfo8KWvTWOgiBBmKL9of8CAb1V/eaMO4C?=
 =?us-ascii?Q?CVgqSreDvo8JamUFXrrCu7lwxHhv8bnQe0hXRJwPDwFK2CLqVBEVKGUcWC46?=
 =?us-ascii?Q?LAOA3GpoVY5yWs1Pp6uxJ//XnYnszXD0OrlRruKCjjfWKHCqSkvhCc2JQE04?=
 =?us-ascii?Q?lKhw9Vcy7B6SguZkbAwA3e2P0Z1OeQQpHEOblojxuAqYvA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hsId/yqtQAcu6RFUdEcyAns3NyiH8NAYDptsb5+/PQIhEIQ6l7YQzIfDj/gf?=
 =?us-ascii?Q?rX8qIkzIFCa3G4lxxoS9YKf3yBsue9ekUUu80mNDWbFZp0FtQNt61C6woDzM?=
 =?us-ascii?Q?PuY1K1bRkKYBypBLjNH8fJBadM2idXXIXHT+jUjFvxfzHFfFExU0AO8LojpR?=
 =?us-ascii?Q?UBSHl3W3L99SuSYuE70ied6lYcOUwAUGaaGarpGd/5SUAHF7ZFgio9Ddlh3y?=
 =?us-ascii?Q?opMtJOzJ2sZcyhGDkKazCNW0HdLnHWyyyx5WxwyLjlE7RdGbX5w1czkcXevN?=
 =?us-ascii?Q?7M7Xk1L6SqrX2Xxy+S4n68TqWUKn0RazbD5S/oOVgFvAtatjIX7dzEGb+S1n?=
 =?us-ascii?Q?rdnXS8YXzgM1SyuCRVZLCpSP0KMu7RA8nx/3REuAZtD7RhYhpK9pfI7XRztM?=
 =?us-ascii?Q?ztT5E2a1nv1wuFnkNNJOqDIMZUp1xwdmpqKO4PxD3/lIawblt+r7POs4kt+S?=
 =?us-ascii?Q?eD759ELrv/4hR6zciVhCz4q4EXnQM4cqdUKxX4hkDz7qaAp9IeLAWVAIc5ed?=
 =?us-ascii?Q?hD7FN39n6Ynv+m4iFyor7aGQ9p2ac2D+4f+P5nsBPkUinPeTWFT33ohUNBzu?=
 =?us-ascii?Q?wKd6BlwFvCiGX6L21Lh6ld2kCX24Hl39Vygb3iUqzr9ExbN+SUbduoMCKs9S?=
 =?us-ascii?Q?m4pG3Xmla04bQBlWvT4ssFou6KVfEoAHXkI8Kyge6FS16rS96TDY0TBW6iAF?=
 =?us-ascii?Q?WQaW1tVizKGlefXJcbil6JfoN3r1HG6cxvSUiTskBb1Ki2oT52pTfQfeHaWc?=
 =?us-ascii?Q?JWyjQUFiMIc9Arrc5o1EIIJxYUhvjtPHeGUz6hyedgOS4lxjS/RhIfjwrKzz?=
 =?us-ascii?Q?hFY6QURGQGtGijA7fJIqHHRoN/BSeLXjqCtvMdS82bW4caLlrW/t+rL5quTW?=
 =?us-ascii?Q?AZGXnWzF07Ome+4DvI9hBnoXIalaZjuZ7ON/8jb5RRQI6/jk47Q3MHGSzVVO?=
 =?us-ascii?Q?kO2QC3oejaJmE7VEkf4m/b8XC/xxOe0jvYYfAh4V1bIj3zEtoGpZa6SwEfKK?=
 =?us-ascii?Q?D1QqQPaopRZBxzu3D5Vmbm8izNb7vHFrLUlwgweThY0h3FcBTKNeplbXO1Yn?=
 =?us-ascii?Q?1zuttIkhYum+O6oTyMPP4HKuyCCU2qNjYOydca5I/POk6Mq7oDDRiJGsx/15?=
 =?us-ascii?Q?y1icYCS55OzcASJa/k5Hr9dI/UCJdvxzhOgyDZ+ApuvRfxwiAR4bajdRxJ7T?=
 =?us-ascii?Q?S6bnEQH0iO/j9HmoqNqbB5ay/+0vkE9LB+6zG5EZFxO2Gnhxp7Cb7ymh/LU1?=
 =?us-ascii?Q?rWBpPFnk8PIDdPnx8HMfoZdw491Jy0dd/Pz7HQq0PP82LvhmgLmZyO5TXuig?=
 =?us-ascii?Q?6kjOcgoTf2G5VlDv/i3+7fr64Id2RPO4T8JRv+8QWf7wo+yb9iWnnG+vBXFa?=
 =?us-ascii?Q?2guefqqFC9MB0vtCxkr5LVZVBynJEVrpguVsLU6BhQIAGH8zZ3eJh8Tm9yC+?=
 =?us-ascii?Q?UYTqAAngN4qqPLJxEJ0/500CeQRxWMco39334j9rKbbsc4/Wj9SqbO+xVAEQ?=
 =?us-ascii?Q?bOZEIkQ5c5FUPfzR7k4u9XUfOWGUnWW6Oh/fteptdGmHpqaBuhTR3FXODEk7?=
 =?us-ascii?Q?ltxK7UUardSvJ7n2bQWB13gbj2wBFNlAxOrlKbQ/jAqBcezzorVLDrBIcc9s?=
 =?us-ascii?Q?5Q=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 42076ddc-6917-497a-1a96-08dcc8e87c91
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 11:40:03.0066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kLkl8UmPbvrnBNb0GQJOVukRPlPocZYM1LZQsK23GIuPSQh8pSmGYF1t6wu3nGLI0iFt68kg5DxbS6aTI42qaexjjkmZ1tu4tKRV23loi40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB8485
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 30 Aug 2024 11:40:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5341

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 documentation/ref-manual/features.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manu=
al/features.rst
index 2ea946b31d..81f09f59d8 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -197,6 +197,10 @@ metadata, as extra layers can define their own:
=20
 -  *pcmcia:* Include PCMCIA/CompactFlash support.
=20
+-  *pni-names:* Enable generation of persistent network interface names,
+   i.e. it's tried hard to get the same but unique names for the network
+   interfaces even after a reinstall.
+
 -  *polkit:* Include :wikipedia:`Polkit <Polkit>` support.
=20
 -  *ppp:* Include PPP dialup support.
--=20
2.34.1


