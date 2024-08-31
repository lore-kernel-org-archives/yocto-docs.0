Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38452CD1293
	for <webhook@archiver.kernel.org>; Sat, 31 Aug 2024 07:14:56 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.96])
 by mx.groups.io with SMTP id smtpd.web10.1602.1725088486876889044
 for <docs@lists.yoctoproject.org>;
 Sat, 31 Aug 2024 00:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=MAN1noz7;
 spf=pass (domain: navimatix.de, ip: 40.107.21.96, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdIMjlPQeAMRBXy8VACMxIwJdGhTnHzs4XlBxH/HPb6YiE2DUuzKuYcR5biBZhT0mFGBnbkd991gqjUxe73hp9ZQPy90ceVCa8fLyIFk8jHbS1iLGZWhJmAJuxFxQ2RgUQx/nKtYmiSd6mqH4wUT8d7FsP8/dI/GaMW/oXfAmR+EqJjxExoP/vIXZxUpOfLFwkX7soRoCRlYKqHxQb7Q/nIQn1zLJ+Mq1Bm1x9wPJqMDFnlWJYvZoxXzqq8aRUflxBwKKipj6BGmGCy+R+EunwqF/xqBZ5sr+fMCky3lGmyiDYFTK/Nihq6A4GgNF23z9F5GXhBHBszjERIIcQHrAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zsz/3qJL+ziC29i6ZIMc19UI7xdiqeVNWPBaNNEV0hk=;
 b=Na8ivvbSEFAQJ2sEIfoaigLOOwdGvIcLSXRwhC/uBPpeA0udFJG+3hzR5DaR6Mt6G9714u7lLFWn5QjFq7iYwW4aXsc7Bec6VPfOJ9TyoX2xUAfqF0BTvEpocZ+zS5Yu1CYJRsN3KbnUaArcuK/JF3fzCdbMCK2dxtzGLCAzaC31jWYwUfRBuRbpIXTSAb6hQhWVFPVNNLMKSORjgOUZVFL5gUB/My6Kwhle5NboWdie1sKzOu+NrYLwFoyUcyILHZPzkM3+anzZxDpoWlLPV3pIi/7ucnVys6pN5oCNF9gkBP7jurfNvok+hZkb+BxtvczQNVARiy6zvvx7aVMjrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zsz/3qJL+ziC29i6ZIMc19UI7xdiqeVNWPBaNNEV0hk=;
 b=MAN1noz7/iO0tnKxh15nAZsGkVBreFUIg7wpY4EbageShov00/n6IlXb10WMuFplO4spUqPBX3SXhv1cMzOkOOUlUGK+GWS/WqGZjsR9t+MSYy+btHBrKx2lbr3y+ltyjuoLwUkN3etzbnrBqRwMROi9GTPf8juqRApRc5DjpSA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AM7PR01MB6996.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:1ba::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Sat, 31 Aug
 2024 07:14:42 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%2]) with mapi id 15.20.7897.027; Sat, 31 Aug 2024
 07:14:41 +0000
Date: Sat, 31 Aug 2024 09:14:40 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: docs@lists.yoctoproject.org, joerg.sommer@navimatix.de, 
	quentin.schulz@cherry.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>, 
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH] doc/features: describe distribution feature pni-name
Message-ID: <9275d1ee169aa794c789fd46d2e1f8f68befe281.1725088479.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
References: <9288e40f901792887ac98417ae8c89fcc2f23a0d.1725018000.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9288e40f901792887ac98417ae8c89fcc2f23a0d.1725018000.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0399.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::6) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AM7PR01MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 4956ce3d-b36e-4ae0-50ec-08dcc98c953a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CvgeVsd4zxCFKRmuhk/8qxtBiBpxkcOmu3fv9DwkrLXrCbEH7KJ1tMNu22i1?=
 =?us-ascii?Q?2gh//GihJcc1CedTNPXDbZEiU5Y2dxsK0FvETgUhRtbw0MHTh0wLVI44UjVr?=
 =?us-ascii?Q?4ltUYB6xNSGKkFUtRK5Hv6n8kCntDoQ/HZrQO7QrCNlzswkyya27utws6oDD?=
 =?us-ascii?Q?/BOjrEVjSg2gTmPXQA6px6fFbmROkXLwK1VDcZXe4dVmGERIyhWFnlg8I+T4?=
 =?us-ascii?Q?gkSNxbFnFH+wX9Vk7bCQLBeW9oDUe+6EerUaEyO+qQ5BdIDEB9LlondU4PC+?=
 =?us-ascii?Q?19KoarBbKvPjGALeZyfSFOV545Ozi4g6PYccJbV59GBGOWMp4vIWcALUTWE1?=
 =?us-ascii?Q?puTjKyw3bfVbiKFI/7i4sKyeXzko9wwbClywjJKEY5nKIU6dpXIi+ApIo2Vp?=
 =?us-ascii?Q?FM8GlF2saPDUtnNGtID+ax/kYduRUN2+15yASnmMW264/Ud5kxU4kXGtn/+y?=
 =?us-ascii?Q?AOfEzaDFhfIWLH866Gk/lDyqYyoQjL6JDERveSnrBTGroZWGPfBqcTiiif3B?=
 =?us-ascii?Q?6d+eZaSO+F4Q2pTCQgYMWUUaz/l4Ajy3NHLsdAu1QzvFnVG6kyYNSqMMjky0?=
 =?us-ascii?Q?m/4SlXRGSRY0EtHfHlBf/BApbPGIxLyrVuYk6Awag64hKiu9KfFtFtjeoXl/?=
 =?us-ascii?Q?5HvjaGU+IDVRDVehyF0crkwfbR/X4DtkMMwYc0fTWLpPOdA4OQoIupA8qbT+?=
 =?us-ascii?Q?MCdCXOPpq7CSFpTS9IZm1jgwLqoAoG3SKclM2L2g6xqipkM/nw+gI4Gd6Tm0?=
 =?us-ascii?Q?rADH8b9DItsTg1sdJYLAr/CcIXgGS2ywZUaWr3I8yaIlTVV/crHvB/LrbiuT?=
 =?us-ascii?Q?A0k7rIhFs6mHWkKx8E1i7myFnzmpOl7QJj6IRpkKXheFdtebQP2F91ROOXMs?=
 =?us-ascii?Q?rUv7NKjQwtXkqGsFzq/+9BS//c60eAKgbiKtGfJE0LvAZCh2AcRJ0QEknfAj?=
 =?us-ascii?Q?V6IUV2ast6eNMn5KgD95612UaTMdecQudP6FLP/N9Bhffo3WPjirmTf+qwQ3?=
 =?us-ascii?Q?NbYvkwKZGo6MpbuOKZSu9K5HaCIGp8uXSEj8dPQvCfYuR5ZWVFRFpOkfaqF/?=
 =?us-ascii?Q?PQPw3sDtRb//OAR9XMHyc7PjyjqkE1Xq/TiDDTk8XZP7bgRJVhmACXcpiTra?=
 =?us-ascii?Q?9t8pGEhzfrHqdFbabLiUdfx22x83fJ//OpqdOANm0Fg4GRa18G/Qh0CkWPtN?=
 =?us-ascii?Q?bRAEGWLEdGPiRbOS6yU2oxLDj79TsjgSV5gg/+8XkpJVH03+EWT2M+0SWhed?=
 =?us-ascii?Q?gTRm5NiUWpQwBapXTuvPMhSlq0j4+SWSJ2IgACqLse4UhIDJT68+qYp1+s42?=
 =?us-ascii?Q?Cs9B87zHiuH+g1s6J5o9txLG1neq+4A0LFWpD7Ncp6Cn2Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JENMN6rizTR7PpWCET02X4vni6ABWpBpYdWEk/4FwEqyTtl6sbOpKuqw04u8?=
 =?us-ascii?Q?UOSsJ+n4g/fteuh8Pr1R1inK96bDrUXPETzs/lUxG6Nsp4lY4khcJ9gFGVgE?=
 =?us-ascii?Q?+dMrveS7uaPUSNI3Ahd26fcoDEFByJR2P8cfGqEDwauYyuefstjJNzmkPSgu?=
 =?us-ascii?Q?hW8uq/4ArJB5fNP4cQwOI9bHyTENsmwPcCmhTBeycmxR/694OvjukDrGT/PP?=
 =?us-ascii?Q?yMLb/GyOO3PYhdkcKQBN2FPSvOINXqIjvKHkkZyP7Muqciemr6TJe+FgWc2e?=
 =?us-ascii?Q?MBNECWw+T4eqwsIHPgSPQQNcwea0vLK5NJB2xJ8b4u4NV4Zo3jrJ4/UWbt7r?=
 =?us-ascii?Q?9loSP6VVqMsmOVtCF4yo5Wmw+/Eov7ZR4/eCuWEyeVETXR6qrCT7TSaVe2JL?=
 =?us-ascii?Q?yAVM4p+KCijHmaCE7NeSCe6rQMK/7h37/TQogW6wCyUTywGM0vLnjturz6Yg?=
 =?us-ascii?Q?Lkm7HoLLIBK/vjcEYWRr/Rj54Z+jOJ1rUeIP40GBESSecOecmXtfizDfGb6J?=
 =?us-ascii?Q?7bVMiCFkI6WQCA7dlLaun7UGK+ABmB/IR5p9oufI1vnYnEJ31Bhydc05xXK7?=
 =?us-ascii?Q?srGyfBz0BBaGElI4E5qr4QSLKr9dee3SP8eiKI3F/KicecDREV3rX/u4Kvr3?=
 =?us-ascii?Q?mW0SV/t6kTzsuxYIDu3AGckcOOxRjWJ9ScoTEhHhGsz4NkLKcUyXB5j2ej5K?=
 =?us-ascii?Q?vm20MwiWmQTwUNL8iIQYwU+OyLlLfyaoEnPzkUJYtpzHsGICySJ1MA/DYxAZ?=
 =?us-ascii?Q?3HIwpsgIoobwoEN16bkNXXTaYJkQ4N6bGn1yyOeLAgu/J/0QMH9ve9A/p2y0?=
 =?us-ascii?Q?6b0GA1WxSEMKsHI6tCFNUoAx/YeykZyaSSgMhjTrIIIPXp7xyYiQdn6OX1Sf?=
 =?us-ascii?Q?76AWkWtG2Hbs5GRplMBb4cwAk5NNKxM4aE8c+Uti2qS3wz4JVs51Y4GqL9CW?=
 =?us-ascii?Q?MBwtp4dtGhS721wc+v861QA9hOQfu/TKN8nuFAVhoJMGVwzgXN/EaarUnJGV?=
 =?us-ascii?Q?phkpSjBwgNSVlGLTC+qiXUR5iio5dbmb+E0iuYLOSOd4syLrwehEVxP7CwEj?=
 =?us-ascii?Q?0WsgRmQgIp6M/5JKy4jutxWoewCjS/0+qP81qYDj675WPYhLWuDbZMnFle7o?=
 =?us-ascii?Q?damh15g/XSJF0O3twAWp3oRJfEo3YhrT73VE3ryiRIbK7MJT8R7EHrEU/7DY?=
 =?us-ascii?Q?wljYkINMm9zlcq8bn6Mx+OmVBqSbnyMoulRI2FtWbZ2x4eDMPidIvJGAvzFA?=
 =?us-ascii?Q?JEp/uLLvr1zsV5sxjf8V458MdEo+pQ6QU9qwLmf2hwFdokVDS+eZtFChCSw9?=
 =?us-ascii?Q?PmiSt45IqLDltsEJDR3uk5y44xRozgZenzwQCpDWZMsl09NecPHb1Xart35C?=
 =?us-ascii?Q?NXAdCtNlqq+kLIRW5snR/1nqB3T+YutvkGUg39nJVMsD4FYVSBK587dY2hHF?=
 =?us-ascii?Q?I1QRo1UIq0PsVq7/FV0HXj3Gu5cboLMdDk+227Y4Ljt4SZcGkq6+0entWF2h?=
 =?us-ascii?Q?YqI9NruPAup3LxL/kfJuq58CbfTNCynohYAZWArjcVccEDcOo2Ds1enIUfUt?=
 =?us-ascii?Q?zWUI12CzDnj45dYuDKDK25h3U65IluP4SCZwWd1AgZdFVExeL7rTo/gFEI1Q?=
 =?us-ascii?Q?uQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4956ce3d-b36e-4ae0-50ec-08dcc98c953a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2024 07:14:41.7629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CU/1vS/0Vc0LpS6n4DDMYjAlmVeBXVvXEwN2OFH4pGZHnfBIl2+J3X58F1xd0uSM9zUe63Dw8Ph+vfbGsLh3wZcB0jkvIgAThVK45WiEECE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR01MB6996
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 31 Aug 2024 07:14:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5346

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/ref-manual/features.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manu=
al/features.rst
index 2ea946b31d..72e7315197 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -197,6 +197,10 @@ metadata, as extra layers can define their own:
=20
 -  *pcmcia:* Include PCMCIA/CompactFlash support.
=20
+-  *pni-names:* Enable generation of persistent network interface names, i=
.e.
+   the system tries hard to have the same but unique names for the network
+   interfaces even after a reinstall.
+
 -  *polkit:* Include :wikipedia:`Polkit <Polkit>` support.
=20
 -  *ppp:* Include PPP dialup support.
--=20
2.34.1


