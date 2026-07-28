Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F19C54F52
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 07:24:22 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.121])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6407.1785223457282552894
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 00:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=frS7UNOy;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.70.121, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQFxTiK4wFRmc5C8a+t9j1Jii1rN1nRHyJc/ffwVlc3SQf7Zc3Svf8ZdvwCHGR88R8NiSPxx7YVvBSxG8IsGtaiFLg/6zZvJMqLS/Dd91yYFO/ZHTzm+P/+P5U3+4Y5c+peD30RgQTrQUJcBNtzM2+fgfRQo/6va8ekevfVjMiw34nbRrJUblejvTWUolkzbxSEKHjBcpUd6mEVzBzyg3mWqriesfRPxS902uwoOEBGjyyflIHgfWeylhJNIAFf7ay+Y2QcqrC6lrqr82UEfiUpxcjk5RgsrNIWLa8mybfw0S3VnW6JPf2PdlQ7KZSuxCzgOGwsOCfua3mK+vGa8JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Wyyx/rYbIcA5TIsNWBeFb0DwebOE+EvjrWEzUxxmTE=;
 b=JqEZFVxMtjd4d0CBtTytZBiQYA+VGeoMJyPvYsWvXBIm84rNxlb7iwxPRqZvukchIUejYc43ee/eL/sMyoHBSlZYUhx5POm6Cc4Aa5r0HMVukK512swdnQ4yctwWYvd64aqEjHGtFJxWUdshONsPiIE+RIKRc3CP7SYFV8MyO82YHKoBVnLu8+/66CEQidiV8d2jyCTvlIy8UXGs8ZH1YJlvKGDtDfubGBx80mLnCHdU9Nn6nLmMGJKuk0nGgnvYuXaK4T08u7y2+63H7zPfmARzfKkUmdaCrtPAeYq9DxtFDGcwVqS/Nv+yV1EerxSqU9ksJqZPx1nFYcJQx2sm5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Wyyx/rYbIcA5TIsNWBeFb0DwebOE+EvjrWEzUxxmTE=;
 b=frS7UNOyisgI9IdyDJtTZsjBAttJgwpRjpcJqkvsPHXCR4oZQZhbqe36lBqmQno1z+MEbIPsLukIrURWIxOwAdHkS4cB0KUQetYKR/4dQCWIYpG0PDtgbIaBmawhhjmbVyV5TEBUBs3A4OhU+F+s9Tgs2E66dPSkuQl/Qlkwta0Zm9HTrnj2iyXLs/VGSXDRREksJoGiAlDe8IMc+A9O1dkUvfFLP/V6KNo2eFDMr1CWLiiK83vEAJa/aec9ld1+J+4nwIrpIjiCsMou97KN7A9mba+6sk6QzKa+6nBWriOoW5gvuzsrSWWO/OtNS3SFHkMc2mhhYweeFbAc/1F9Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by GV4PR06MB10528.eurprd06.prod.outlook.com (2603:10a6:150:2e8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 07:24:12 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 07:24:12 +0000
From: niko.mauno@vaisala.com
To: docs@lists.yoctoproject.org
CC: quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2 3/5] dev-manual: Fix missing whitespace around '=' operator
Date: Tue, 28 Jul 2026 10:23:17 +0300
Message-ID: <20260728072328.11926-4-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728072328.11926-1-niko.mauno@vaisala.com>
References: <20260728072328.11926-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF000239FF.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::2b7) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|GV4PR06MB10528:EE_
X-MS-Office365-Filtering-Correlation-Id: 096a5260-8881-4736-4516-08deec79388f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|52116014|376014|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	3w85pPHucGTAM/bcEQn6oLkSIkT8ooNL85tskGuKqhN7/8jU4XRwfIi3YFKAmZWvTOHRBW/fXOXaFbi6m0UvXUmMBOyjljSFHgBGSlrQQeJPxO71oHtmD//r85cKsZFebNiLN4SXd4d3v5EsNbhjckD5WYKEpUmzklZF5Sa+mbfmvFMo72sk96ULGov0z5XnhVAdXp/eywpvDq+C4+Akf1v6EXZJosJOwJ0osVgO5Z8YXxusiZuK94J+q5p4AlAeHFMUUqG0U3cKOJvE0SDopgoigqPHDeuKUB9Vd15BezoqgZxagP790oIgEoWee9r9yhLMwf08KqY6dzYpuQDoeP2AN/jLbbj+9n4O4bZB9RTCUeOts1fMyIC0OkhRTUVPxn85ipmfeKcAShDe/IhtevsLNoDx9oSZmhxfLvAUv1H8aaq1zTNvGXeesZ0T+YofycZlawIolkVHyFbcdfKuJ/s0qVXAekkCIBTBOqsmJpj7mzuG4YMI/kz7AUkhPEr4J0/O1xTkSjjA3QxRzCaz1BjYdBGaUcrfEy6NIIrTVPh5XEC+VOzpRVN1a368apiVMqT5I42f9ffPomVD7ODQfy2lMWAC5V9jMZjHFALhBNl6zZygndi0vosc+aZ6XEVeX6tJBkaowKSk2y2CsPNzft/J8+ZMryAvcFJRCFLg9UGnPnlITAwXq6/XDRpijpqtigCn7xiOl5BjssFyWkltpYbPBSC+DRj0ZZ/+4ROUszA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(52116014)(376014)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+wkRtnDEB3BH1vCWcY0j0iZsSh4swJtrWYzG8MHrQeiEDxR6My8HeXrPiGze?=
 =?us-ascii?Q?bfXHFFXIy+MJOJ5FwVMdbb3BFWPHUjXZ6wswLkPgPO+wkZ2b1Br7OcGhSfYa?=
 =?us-ascii?Q?IvbQBiO5g+cjmOsoCmcuaXgMoFvSxXFM31ncRlwBs1GBPJABfZx3YV6UPvTQ?=
 =?us-ascii?Q?MmuwjCikbtsxXGGWxMyls2+KHEVHsQzs6pIb0eKHi1Z2W+GAuOjH6O+v2ePj?=
 =?us-ascii?Q?mlJNvfN+UhJQQa00BNhcHHBaMG4i0JFeL2I4u/2FZrvZSao559r3Us5NA/4o?=
 =?us-ascii?Q?LrXKMwUCNkzIBE25V2gSwrKnDKW/7yYp9q1nqAgfwWQ8SYHQRMPDN/Q/phtI?=
 =?us-ascii?Q?3156oLL8F8zNgCnyN49sy2QoS/jZyjRZcgWS0U4jvU30DyRfLadYnhfmDb+a?=
 =?us-ascii?Q?CCTOBCHA3uxduP+7MwnLsGKI9aR7VhYCUQMo/+x0BscmOTxG0PFsmQcHuosP?=
 =?us-ascii?Q?jLLvNAg2Mx5jtlxU8zpMjPDB3+xefnqjZCnoPS9tEBtlO0ly0jqSubwrKdRF?=
 =?us-ascii?Q?uExcuC4LinF9jJvCjImLU1JzZuR1clXQSz+4eFa23BTGtMBmQnA21Qr6sv4W?=
 =?us-ascii?Q?8ywrmFUJhociz5sQjI3eOm3eeo3V226nKRLA4FJOxDejjaSMbnw0kyvUB56G?=
 =?us-ascii?Q?nMgpSJrXgfk+tk9cI5N3pgpvBG6doPHfzpVKh4hc+L+5BPgyBJhcjWfPacHK?=
 =?us-ascii?Q?FOGFQAI2tijHjT7L3Ropq5yn2WaMQvIR5rTyPMGeD1Zwxosnwz9KCqJ8IV0e?=
 =?us-ascii?Q?JaTQMp01RgmDu1Dgj62TsPUL6onkIQKLQMWwWnIGFn6vhWNAXWVwcasC2zSU?=
 =?us-ascii?Q?kDy1/U+DWBL+IIRdYkks6JY0HFDLpXIsnPgUArpFVjk+HwaPs8zkpPg9ZweZ?=
 =?us-ascii?Q?DxrJAQUNHmroZ0v6qIUkdpavoqJyVQusQVUXTJYivycuxr1tmoEXeHaiwdoM?=
 =?us-ascii?Q?+vmdU/6J5QeWVruGqU7L11LpQSzzn0Y6S7D6QjAVRLM/dDHDnXuAoqHumE0V?=
 =?us-ascii?Q?IqhCrM50wUvylQg3MR6690rw13lJSdPwU0AxgOKQCQNvED1iynNrnI5Pyn11?=
 =?us-ascii?Q?DNzfyH3FpWaDRzi8A6PUe8lQuaDqzy5x8hijH2wq/FC9hwPrnnZJxMiD8iNE?=
 =?us-ascii?Q?zUwiuEC+eXsbqWVmt0asWSOJmFKxcyI7BEdflHchgjUYzq/loWd+GM+iO8SN?=
 =?us-ascii?Q?snIqaL8fL2u03t3hnf1dScT9GSWKwtYv7RO7GpOVYukl153oZ5/o4b2hhTw0?=
 =?us-ascii?Q?a4BNW/wp3xbZn2HpbhnIiS7kLqPmSMI0Ak8uCBJFLNmaN3TZz3CQgoRZcov4?=
 =?us-ascii?Q?4yCJWCFMu4E/HAgga0hI2/HaIau4uCYOU636+yVM3nKifznQBeAEEKKGdDC/?=
 =?us-ascii?Q?QxskfeOP5+QLtIO/r54pnJRAME38GDEB5eIzrHtDnwbkn+WwdO9kr/eoW5QQ?=
 =?us-ascii?Q?ZAoUqGU/gjzKkBanlshwGf+eTeZFnuBbLkkwAtQ9Zyu4yN4sfNUFLutMUMhQ?=
 =?us-ascii?Q?OhoouD2QN8AulDO4rtEoF7ez91rXduaCZ0o3Bhru5yzQ8QaIiun5l400okSu?=
 =?us-ascii?Q?Srigg35gdRssCj+zrpn8UqZ419T3HkbJ7DgAFOl2/AMItA/tu3NsAjhNt2gv?=
 =?us-ascii?Q?uWYW+osoPoPa0uya/8iFDUAHS5TzllZbeR8ZHgagERIAYgvb2v19pHviXudj?=
 =?us-ascii?Q?pkofPauxouC2NPHVk7oKAjX3JGms1vw1Bdi/vxn16Nr3fskeBbvAYlJxt0tL?=
 =?us-ascii?Q?lH4UoNGHEhB85Jg1TLI5bR29NKL+B5E=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 096a5260-8881-4736-4516-08deec79388f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:24:12.0439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aa7boDFMmZOZ4+iWHzYUGvscqSnmVFhoD5ihZucGHFAgcrRfD1Bsau8h6uX6HEXXwnYZRwf9KNn9eVuA2hlhww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR06MB10528
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 07:24:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10156

From: Niko Mauno <niko.mauno@vaisala.com>

According to the Whinlatter (5.3) migration guide;

  A new warning is now printed when there are no whitespaces around an '=3D=
' assignment in recipes

Fix occurrence of example verbatim applying of which would generate
such warning.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 documentation/dev-manual/layers.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual=
/layers.rst
index dc63478a3..d33eb136d 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -252,7 +252,7 @@ following list:
          KERNEL_CC:append:arc =3D " ${TOOLCHAIN_OPTIONS}"
          KERNEL_LD:append:arc =3D " ${TOOLCHAIN_OPTIONS}"
=20
-         KERNEL_FEATURES:append:qemuall=3D" features/debug/printk.scc"
+         KERNEL_FEATURES:append:qemuall =3D " features/debug/printk.scc"
=20
    -  *Place Machine-Specific Files in Machine-Specific Locations:* When
       you have a base recipe, such as ``base-files.bb``, that contains a
--=20
2.47.3


