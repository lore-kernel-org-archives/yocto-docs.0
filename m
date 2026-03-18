Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C539C10854C9
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 16:04:34 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.104])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17912.1773849865501101556
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 09:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=W2ydjkHG;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.159.104, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=syPUdXoIYWFgV4HOniMhqsBO/DuW7KiAOXfG6LGQFxcSsmMYyjCjT02kxocIZhGw6spBhyYZBMWtO1sOVRPxr9SwMYOZRGdBeDvS+FaLAL5fhNXz2LTTJsWgerbV0uwGhIz50+SOwugJtcjp9uks04527koZhdmW7mi2DfjnD8sYbPPhxUrh4b09+CIkl99CQp8d7/805X/8m7RiZa574fNwwidECHxbEqoIkmw+swtf23CQ+9ER4F0Ars+jo1kovvsAfjb2YSCPUU1MDC67I8CnKsop4yVapSsWnQyMviwLUF/NQrTfbg5JNtDBNCGNzjle0a84zavQCUsUMG48bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJ5aJZ6JzvVFyC6oF8TLa4SMuyghbp8sRcGUxQFQA0Y=;
 b=MkaliTfzkVssEnMxwj34ay+5O8yJAxYZTO/UreEbdaNXy1zPGpYlnMyUzvY70Eyv0uUlGrc8KWq+UGOsMCYsjJ5X7fi4bZokFSaIxr4is6+AlI4tObrA3+XhGhHURa/lMemDkN7LBHQKqAuQ0nKBo6oG4Kp8w2uSp9f709B+RHkb979GpQf85y7Iqn1AUOqBvWPqf5obUEtT7A+/cBDx8jIdme7GvqJy13A6UGRUdTJsMOjBUGTFVKm0gOcpT1U1wqeFt/1re/BJjuLmWCNNoBXMqXAOSq/MO51dounNBPMlQJGpPOUOa4V77c9R9rTbDnCvpWIz/qSk8uGFLZCvSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJ5aJZ6JzvVFyC6oF8TLa4SMuyghbp8sRcGUxQFQA0Y=;
 b=W2ydjkHG5CTqO00VbFo4Djul4MDOEFplxAkUpOjMwrorRPJ1vA9HbYGekU2p+tTbC2jjq/27Vml4dXnzAJRIl+kERmV+53kJq48Tfbw/0nKaWRhsT2MW9H1rJ3M0Xbz9IbmtLUhhKwJv2rTTkNoV66HgqjCAi0Do6r3OHLR4X2t0x4DhcVHDqIakouf8WPP59AjJy6JT5LqfmlzUCUU4IWKeuReZakDu4H9EZDLc3vTT3MiT0cig/+lRX03nIG2pDoxXvGiBUoj9PGsroUS6s67rDRc+mW+d8DQG2splp27UaspLr6LMsi/hYDEMFacyoVbQanmToOmYzWlbBXBPkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GV1PR06MB9194.eurprd06.prod.outlook.com (2603:10a6:150:1a2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 16:04:21 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::fb61:408a:ba4e:990f]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::fb61:408a:ba4e:990f%6]) with mapi id 15.20.9700.022; Wed, 18 Mar 2026
 16:04:21 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] recipe-style-guide: Drop obsolete EXTRA_QMAKEVARS_POST ref
Date: Wed, 18 Mar 2026 16:04:09 +0000
Message-ID: <20260318160409.1767493-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DBC0.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6b2) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GV1PR06MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a2d6897-3950-4dce-2f0b-08de85080439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	SpDj5+lti+QLQGk7W6QICyIUVU2PgrqLdb7IxOl8nt8Fyg/y4XLDZu8OW4W7tg/XPqiIk7hb5+avtjGKIdkJ3TA1ZstFcu2D26qxG0cdFWlh2u3qei5OgbjkOjMztPnetsmPLMzO4pw4jcmTz3pH7timVpJc0JThbkozi/LlqjMi5I1hck2QBQJJcjSzm6HPEGU1RG2ogrPzlSUlZyrhvx+pyPajFy3o0jGwWLaeUvOe1oDc8SfCiwsmLWaV6meyOfNWfsJCholJr/sXpvmnz9U2YhI/Dgeeypqm/khCqhkGa1RUn/B6pXZl48sp5uEYH2pYS8RtfzazZRGno4kf0n0G/mjDkR0uNNzekWnklRlcp8WS33FJSzcR1h4srDvQcBRSIthJl5rcYQvTr+L2ntvPSCRGb1AtzWrSHSUJPGQ+dLTYSaKFGifzvFi43P5qKHFrbqi1mP/nPsdUY+eQRZNRfrguBBCAQc2L3V8kj7vrMdLmm/MbGM+M3QRyvNqH/BADeZI/LzEZiu6NRiXF3EEcWdjh0ATDuhGeeWhrsjm8UhKA+GShw6Ie9/TRNAT2hTxuGH6AA4rtdN4jZ9TjztYNrfchjXauFLnJRziFHYf14Q5CEKKPZUKJDB84sqHPf1Soof9qwcwsEs/UKgURQV4KsI9QPIq1IX/B5QnOObekoLNB6ehFwPyxfGKFjkO56Ss0oaJkYpTMixU+iCOnnmhWrYfwcL/SdS+BsB4yol5MGwKx8ClK7LusVFl2NGbP9q4CHguI/IbxcDTi+UmEaq7U4OVBSckQgHIpEQPhzJE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kXGxL0gfUwKAVYz0VKTBl0qSO1kKZpNdesArwItImNOVCDgyAupk6fkPwr8V?=
 =?us-ascii?Q?cGx62QEOlFnmHqJGBoE62fpaY0OSkWSke5XosLcU5hO3StI52s5/CiiMHvq9?=
 =?us-ascii?Q?WQ5lVRjs4oHzyQWc4lAuRSyaqF8C8UKZW2RJ3qT9i5aCR+le6Q6HCx/7onNQ?=
 =?us-ascii?Q?XhQDxDQPwp3zCis4kmK80VK1wGmM+O7zIZ1/iWjsyZSpin/gvKpruSa9saSl?=
 =?us-ascii?Q?uiViyCHjdJAlsUZUI9aeGTjLR+IeQosIp6WjQ4syPc9nHErA0mHKH2knSYAw?=
 =?us-ascii?Q?iv/Lp3K5tV65aA4paaVG357JL/+NZ8TdLN/AhLBiI3kcLBXo0Lzlr2bCvxvt?=
 =?us-ascii?Q?Iiw7ApJ5ctnBXmH/RjsbvcjeR3k1u6yr1hDn7l+kK8Il8ApNNB5oC1o8dkOZ?=
 =?us-ascii?Q?IFTv+Gm8xtfHWqq5U17gHV74r+i5dzYtCjFNF10ajy0sM88Ia/jA+9ssLHk5?=
 =?us-ascii?Q?MfVhE1xzl7XpkUdcFk2G0bXhaONnTlhIPBIPLjCIajQ1L0YillBdDSqpg4Gf?=
 =?us-ascii?Q?PDiSSJQPD6hbauv8BCIGcA/xe03VvASuMRiY909CGaded2euLeXXyywMLFQg?=
 =?us-ascii?Q?w10Ef5HvNqjAqxnrP+RSn2YD1yShgqyVbruXWuiLVTg14jZc/ME4LsaCWSMS?=
 =?us-ascii?Q?8wmm2tb1XAgqopSeIPHK2U2t5XTrt/awnI7+9tA2Zaa2oAGaj2JMtjwQ2aOo?=
 =?us-ascii?Q?umK0pbPy4JhZTA0yasmiKeSPctbzO+Eda7f+RWYK7MBb/fEb+pedv3Z5SeTi?=
 =?us-ascii?Q?N5DhVjfRnSN4p6vmyeE/i9XF55a8c+w36dMrMuHeb6A/QBJ03lN/Pg9yP7/m?=
 =?us-ascii?Q?ZVxHu44FXL0arNjNSDuYqz1M2Ty7A1tNzANvtvLGymUBDwm/6OQVcH+G95PZ?=
 =?us-ascii?Q?uEHkugfMEm7oUWzQj4C/XIGnXErpOK6Bky+E1VZcOcwCtMP2aTH1YIa4r8zv?=
 =?us-ascii?Q?gXjKOzXEgDSgKbRwGbDCpOwf5VZKrcce7pkOvodXp824/3wq2vlPId/9pbBv?=
 =?us-ascii?Q?faKSsp/6hjSVvWbaq98YlcCCuGiRaXtD7Bg1e2dvQkDYitakaFLo5+jH9s9c?=
 =?us-ascii?Q?QCFwx0NTtY5OIEd4YhsE7ML7D2O7QdJzp5M0QfF5GxgXYlT6A+Da42d1sRyn?=
 =?us-ascii?Q?gK3iToVLVsKaLnp/fLZBoSPPX/+aL7M1TIhkDzBNcji6fK+R60WGD99ppMlk?=
 =?us-ascii?Q?M3EPuliSmMI59Y/viKT1uJ+ekXoPP/RykS17z53+Xz0n6h16o+bnZEk6yhts?=
 =?us-ascii?Q?eJjGHBiKIWwTJqA8h97UZgzeFjW/Qg7UTFeUGMCnqBb3+WKVJDg5w9y0P5GZ?=
 =?us-ascii?Q?seQL4gwlMcO/xPdfYP+fc2+O3ltizWbwyllggpxcgoG5EFp9cq6BR2EXzRw4?=
 =?us-ascii?Q?0pVft3fxRcQi573IxPkEdUV+JX9vzBiEYBYio58Mcdvy7Vtv1Ltj3HS/kHSM?=
 =?us-ascii?Q?BE4/oJQvD7V9OfArdrXO6jiyxYKjxq/KwxaPdZeFjd7AqOOeLqiXX5bgLFAG?=
 =?us-ascii?Q?syhB2zVXH0W+QjoSJOzF+zoGiG3/Z/t2wIlpbhdDf2q7sLu5xQytQhajdVXO?=
 =?us-ascii?Q?328nEo+ZJ5eUqK8vQ5F2uRNdACiWFiG6fXQnlPmAH3FaRev7ixHzDnVOInyy?=
 =?us-ascii?Q?rqCh/vNVuaUrFFr0cfzPYrmuSwI7ZqL+CzwrQSLfvvPUBWMbLzW6zxLh1Rxg?=
 =?us-ascii?Q?O/5KxUdWHRXOU8SAsOxInLSl532yN149EPSo2SpLrxG/ILdVCWhYG+gdqS8c?=
 =?us-ascii?Q?w4MnyvsxrJy5io/vSKIaNtn8yQyS02g=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2d6897-3950-4dce-2f0b-08de85080439
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 16:04:21.1865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6cEbCZaZVBVbbK4o3gi+sFCFvYOIEU1qvL05Ts1kcHgnTwMZVeIGzD6qpNaqpDicwDPgczT2L8f3Z2ynQn/ZWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR06MB9194
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Mar 2026 16:04:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9096

The use of the variable ceased already in 2015, since openembedded-core
commit cb89d2b25b4e ("qt4: remove recipes and classes").

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 documentation/contributor-guide/recipe-style-guide.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/docum=
entation/contributor-guide/recipe-style-guide.rst
index 464895212..d0cb65295 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -158,7 +158,7 @@ general order when possible:
 -  :term:`S`
 -  ``inherit ...``
 -  :term:`PACKAGECONFIG`
--  Build class specific variables such as ``EXTRA_QMAKEVARS_POST`` and :te=
rm:`EXTRA_OECONF`
+-  Build class specific variables such as :term:`EXTRA_OECONF`
 -  Tasks such as :ref:`ref-tasks-configure`
 -  :term:`PACKAGE_ARCH`
 -  :term:`PACKAGES`
--=20
2.47.3


