Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C159C5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 15:39:13 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.61])
 by mx.groups.io with SMTP id smtpd.web11.36598.1749224348770652264
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Jun 2025 08:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=O9Z9qUfC;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=O9Z9qUfC;
 spf=pass (domain: arm.com, ip: 40.107.162.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rCWiRKy02xgwovbWm+orCFlv4jz5yDnLAi/wS7iY/uQhGussuKYxrv4tcqVfRdM3ywMUgBHNNrcjroSuMmV9/i3RYjKmBEDsiBBg3VdLmVMS9cv+597EIf6jE7lwQSMcXcnFt37D+CztWB/frTov3zuWsnEqUijYGjRpf1S7BPVts1jGulpVl9cnczW7hF9jZXHUM8Qv+zzmUTlGRUKhf28C8FZVw4R6E0EKp+v0cOtFM3a/kTCP6z9T0gsHFl39iQQjzzJK09xfiGsbSLgib3tUqIy9FQuG7fqLedRCO3v1bOoZAUvsZnmYqRVWx3JLSrBP6xoTc9L6DxmmKUzv/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfl6emMw3Dmo2RRuqSoViL4HhFvXl/BN509c8llFcPU=;
 b=C6TsAf2CTF7f+hF5/Y6f7jaewmNGseNzYjY2VNLc7bM0ZvWzNw0tjBp4f90z/of667SOVGKidgJy/2KwYy7JNc5a7YABVIJHfez/rbXMZ7Y5BPr7jX7oLfyT31ls9yRDz/Sbb/Ya7kk8HIWpE/FQ/+WZhYQuSNIkAiu+VwSLcKh1sZ/TNvtarBFlBVmKJF9ErJbOTO3SVE1uEIxLZbkcHlzN6yfYwqML8vIB6yJm+rPiwGnGu2h2Ex4bPDz41GrYGFS3e6JtLpJ/Gz/9MhU8aapFPagxqhbPyfuvwPPXwAlocrOLinjqzg1qMRAlaqkYux1qNDgxmuwKSc3DoWvsoQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=0leil.net smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfl6emMw3Dmo2RRuqSoViL4HhFvXl/BN509c8llFcPU=;
 b=O9Z9qUfCFGYNIa262VoXAd1JpX+anJzCgqlWhF5YZlzs2Iymz/w5fo6GT9SdXWzh6/Ot3ANQVdnAp1/wv8X5Jdy//GkhJH8m67GlwkISQeNEmO9LloWoDSD05cx6AiLUPB6J4/NxrSyJ5oaK/E62uEJtYSukn+FoWbTGEweRd/E=
Received: from DU6P191CA0006.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::8) by
 AS8PR08MB10315.eurprd08.prod.outlook.com (2603:10a6:20b:5bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 15:39:01 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::7e) by DU6P191CA0006.outlook.office365.com
 (2603:10a6:10:540::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Fri,
 6 Jun 2025 15:39:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29 via
 Frontend Transport; Fri, 6 Jun 2025 15:39:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqx2OiSmPZ7Ji4JpJRU07HGhMpGgdyX+Dd3bdBeIxlOUevXLWB69wbPYdBHjncg8ON41nu3ueSm0rG2lASEx4tZ7EVuZOUOT9LkpE48YJa9g7pgT6FdM6tbl9cTvcwT28WwW6N1RP9ReytJ//xCGwrLcioeDtJp0FduLWNv3EJlNiUFoYNjDwI00vbeT9mY60JZ4B/HExdqfJzZ5HFxxru3SQE5nAI2RJ0crz99g+tbJOEXXpwKN+G18jK1LTf3/FfLnARfSzFasBs2R2a9cdS6y9Vd2KX0Nd8HY5aQxk/IKwZIc4n+yclNjBIxsTQSLqkLRgcT+SCFw2XMR3zmJYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfl6emMw3Dmo2RRuqSoViL4HhFvXl/BN509c8llFcPU=;
 b=Jbxd/rcCLrO6mkJPG9Jag8HB7+vZaW6W106Sh8n/hd8b3wEsa2suaFXCtXvWidelqsR8SKrm4IWU2ggSzwr2JvajJRqxx7QA/rulT9yrDkf2cqYbYf71Pi2JLtYvcON/xgBsVb8/DI3hfpQL9NTL3miXZQ3ixgG/Uh8KAeIcZ0YS1oV1exBywPdImowgxT1pF693Ca+ONKtNWHPwZrzExD+uZyoSBsrAGLQUeUwoI6yXTgMvsgE3Jip1aZyo5j3QJ5+Wbx2WcJf3nZT1UCSsu1vi9dUKK0DN3LeQuppU+zKN/Fgk579zS49bOToT/Z09R9fuE77QAjeeBczCqd2M/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfl6emMw3Dmo2RRuqSoViL4HhFvXl/BN509c8llFcPU=;
 b=O9Z9qUfCFGYNIa262VoXAd1JpX+anJzCgqlWhF5YZlzs2Iymz/w5fo6GT9SdXWzh6/Ot3ANQVdnAp1/wv8X5Jdy//GkhJH8m67GlwkISQeNEmO9LloWoDSD05cx6AiLUPB6J4/NxrSyJ5oaK/E62uEJtYSukn+FoWbTGEweRd/E=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by DBBPR08MB6169.eurprd08.prod.outlook.com (2603:10a6:10:205::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 15:38:29 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%5]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 15:38:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Quentin Schulz <foss+yocto@0leil.net>
CC: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>, Joseph
 Maniaci <joseph.maniaci@seagate.com>, Khem Raj <raj.khem@gmail.com>, Quentin
 Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 0/2] ref-manual: classes: clarify native/nativesdk classes
 exclusive options
Thread-Topic: [PATCH 0/2] ref-manual: classes: clarify native/nativesdk
 classes exclusive options
Thread-Index: AQHb1vP17vb3RvqEtE6bQge5fcYAyLP2RCQA
Date: Fri, 6 Jun 2025 15:38:29 +0000
Message-ID: <A25BC5D7-FC66-45A1-8C2F-2CFED5CBE101@arm.com>
References: <20250606-native-options-v1-0-2ad99a184f90@cherry.de>
In-Reply-To: <20250606-native-options-v1-0-2ad99a184f90@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|DBBPR08MB6169:EE_|DU2PEPF0001E9C0:EE_|AS8PR08MB10315:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc8c960-fc7e-4a12-3ab8-08dda5104283
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Y2M4LzdLTnJOZGFYNUgwMWtDOG9VVlFvS2gxWnBPTjhVUW1oWDFtYXNzeFRH?=
 =?utf-8?B?RERMYU9xMmpweE1LYUYxS2gxSWNMdnRNWEFWOW81aUlKOEZIZDBCWElhaS9D?=
 =?utf-8?B?Mlk2cG9tbWxjR2JDb2hQcEhOaTVTb2gwaFFaNFR0b2V1ajhWRmN1eGRrNWZF?=
 =?utf-8?B?OE42MFphSFdleVdmZXhNTDQweU5BdENZS1NaSittQUI4ZWtoZlVsVXYxVENu?=
 =?utf-8?B?d3lXVEdZOXNyRVJBVEdSUWc1eEl4Y1hyTGs4Z2hSNThFeFBuRVYxMmMwaWRl?=
 =?utf-8?B?em00TXV6WW04Qm9QZ21tejFVOHMxRUpROERlNGNIMHBreEY5RXpCYXU4SHRk?=
 =?utf-8?B?a0dpa3cxM2g1YzhZNmdqUWR3QTZsL3lhc0F4MFlDWjJ4Q2F3cTJUb1gvRmE2?=
 =?utf-8?B?cStYMXJscmZOaFhVaTZCb0F3Vk4yaU04eW10MUc5TGV4UlEycC82THBRVGpS?=
 =?utf-8?B?WDF2aG5XaXN3YUU1akcxRGJIdnI3ME1veW0rc09neGJrbjYrOEs2NGhBbkxU?=
 =?utf-8?B?dkhUMmgwcjVJN25yN0ZhUm92TytpdVVHR2ZFNG1vZlBXb1NsTnRCcXdvMDV2?=
 =?utf-8?B?eE9Vc0ticWhBeWYxem5tSktXKzVneFNuVU9oNTYxSWpxditTTXBIZlNjMmI0?=
 =?utf-8?B?TUxvWDhpYjNEejRLdi80QUIzRHZWY2tSV05NUTVRUXc5WEFQQ0wvWmdzUysv?=
 =?utf-8?B?ZDZQR2VJaHZaUzJlY3p2ODFBSElQOU94MEEyM2c2eEtjK210SzRLS3VWb1ZG?=
 =?utf-8?B?bmJJNEdWU1B4ekhxVTNUVHhEWXZCYk1BV2xnRVYwUUdZM2tnOVI1QXllL1R1?=
 =?utf-8?B?N0x3NEJHc2pyN2ZMTk9wNER3ZEJHSVFzdWF5b3hvZ2VoUHV6K1ROOFZoMkdH?=
 =?utf-8?B?K1Rkb2J3NHo2YTVDZUNzTngxQ205cnpBOW5DWmJERjlpYmxhZDBFRWhjYWYv?=
 =?utf-8?B?SkF5VDkvb2JaV0xhUEp6ODBFWFVnVFQrWkdKOERLeU10ZTBlYkhGVE5LdkZ1?=
 =?utf-8?B?R3ZtZ0lkQVV4emJ3WHEvaTdteUdPYmtWdWdCS1B4dHI0b0dxamQ0Y2h0OXFi?=
 =?utf-8?B?M0NPNG5DUFdZSWNIMGhIeDlMckJPS044cDBISTJjV1lka3RHalNGb2VSMUJa?=
 =?utf-8?B?TVVjRjVJNkkvNnBQaE5pdXNseHg0dmlFUFlHR0Z5azJ5YUpoWXRxUHhuUmt3?=
 =?utf-8?B?MEE1NkM1Rkl0azhHa0dpNnpDNWVSNUhxRDRjcnRReHJtN0k1MUQ4QXJnblUz?=
 =?utf-8?B?MTRWTXl0YTAwc0FpY2N4dkRXTUZOMDhZamV1SHZKbkhoSGlPVXdPandpZHM5?=
 =?utf-8?B?Qmt0MjlmSnR2aGhLWC8zLzBPbGxMWDFidDVkRHlnK3NZcnY2L2RncFoyRW00?=
 =?utf-8?B?MmxVNlg4WXByNzFGTGZpWlM1WjVuT2xqNGVZM0lCS3FwMzZTOXUxVkVnMy9s?=
 =?utf-8?B?a2lLdHI5ZUtjRzRKTDJwSjFHUVA3UlA0M3Rnc3pLdTZJd2pMeUcyUWhxK2pu?=
 =?utf-8?B?RGpYMUhDa3Uxc2xtUlFiM2U3dkxWMWowcVQwKyt3dTE1dGI5RnRvRFVuZUxU?=
 =?utf-8?B?UDJ2QVBwWjNWdjVCYzJreGRPRmVvMStyelVMR3JaNWhhVkwveHRlNTY0Uks4?=
 =?utf-8?B?cWpoUGREVE13dVVOSU9GbWROcExZZENUb0ZrOUJwdUxyR1ZERDY5NzJpcEVW?=
 =?utf-8?B?Vk81aGtsMDYwMjd5SERUT3pxZEFsTTdPV0hINWZheEFUbVh4UWhoZVV2cEVt?=
 =?utf-8?B?ZDlzQVBsMXA0TFBCVnZkTEgxbEZVTDF4TUYwR2krOUkxSFN5Z0FPOFg2c21N?=
 =?utf-8?B?S3ZCbU8zdUFZa0lxMmxpdi9rOUtiQUVhVU9IdkdTMDVqRTRrWGszRGovZ0Uz?=
 =?utf-8?B?dU1malRyd3lTL2JtYkNkb29SUVBVWEVIdmVoaTZCakc5cERjUjBkVWlyWmxi?=
 =?utf-8?B?bUlNVGtZUWlpVmYzNFdZaDh5Y2tUdEZPYWRFSVhZbXFRNHZGU09YcThSdjNN?=
 =?utf-8?B?b0RmUjU5MjBBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A829A9B356E9074E8B3D7A622787F853@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6169
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7f26a0d2-0157-4786-89c9-08dda5102f88
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|1800799024|36860700013|14060799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ejY4Wlg4ZUloak9GSThmcGhkMkQ3OTA3LzQwZmd6Z1gwRmF1Y3BrK09EaU5E?=
 =?utf-8?B?aVRxRlVvbnVqUlI3ZlhzOTZMZWNZRnc4R0RrT3NxbnRtanhVa2pFb1AxaytR?=
 =?utf-8?B?RjB0bnVSYVZuVkNhc2krcE9mVEhEcjZLU2JiM3RXOWNva0Y5TzM4dVdtbURh?=
 =?utf-8?B?Q0s4YzBKbk1VbVJhL1oyMXVpSUk0RE1jb2ZZK3BjWFdveG9QSXVob0ZKUUZB?=
 =?utf-8?B?MHg1MEdSYkk2THhzbXFjZ2E3cmIzcW96Mlc4SVUyRFR1cE9DaDk1b1FROUla?=
 =?utf-8?B?NjFyTmpsTFhSKzVrcEtubHoyb3g5YWRpN0hoeU1kb3d2S3h2MS9mZTRmVHpR?=
 =?utf-8?B?R2JqZHlqVm5MbnAwWHFiVUFuRDFyRFA5eXBiZHA4Rzlib0lOSzJmWGpKQUtE?=
 =?utf-8?B?V0NzSGR2bHVLeEJXcUEzNDloVE9uL0RtT1A2RGRMMTBQYkJDZGhjOUY2dWVY?=
 =?utf-8?B?elNlZG1memxtT1RlbmdRZVQ5UlpFTDJRb3hoQ2JENnBZSnMvK2FldGNDSkxS?=
 =?utf-8?B?eFdROVA2R1pHT3prS1dybUYrN3IwNEZBcDZ1UUczMGpSdm1qQ2VLNzhDNjZH?=
 =?utf-8?B?TTJLRm9TNTBmNWxHZk9qaE4vcWJEVzNPUVhreWFNdXgxbTFsTk9uNDhiZ0Ny?=
 =?utf-8?B?ZlFtNjArakswOUxVZWk0R3N5M0hNUGluWGFucHJab3ZyeDhBWlhOcitaK1ZY?=
 =?utf-8?B?VXRMTmM1Z3h4Z25OT25PRElsSk5MTFJwcW1iLzFIZVNNcG43ZnZ1aXZQZVZs?=
 =?utf-8?B?MHhHNUJHTHFnWWVlN0Z3VG5PaDNubmF3U3VucnNDT0RwRlRJVlVDYTNLSlA4?=
 =?utf-8?B?bnRoOVZHd3l5M1p5bTFqT3M2NHBvYnA4bVg0d2F0bU9XUXdRek9HKy8rRjNu?=
 =?utf-8?B?cmdYTkZ0Rzk2UTNxamw3dTlsckVMOWozQkN0M3grL1BiRFhJOUV6TTBRMkZL?=
 =?utf-8?B?bG9WeXdKODhKdm4wTzJ0b0FCZTRDUzYwMm5RRmRoTG1FdFplZWFmc256QWNu?=
 =?utf-8?B?MHRsNDdZSUdZckpKaTROUW83OThoTEc1ZWlCTWNQQS84bFZCRy9jNHFGdjd3?=
 =?utf-8?B?c0U3WXlpNVU0SzhUekZqcnZNcFVaRitlTjVWbTNLSGxINUdVUDdDU0dtWUtt?=
 =?utf-8?B?cHhwSUxjak5PeTFrWEkyWjk0SlFraDN0amMzOXUzbkErMVhoWVNrVmpJUUl3?=
 =?utf-8?B?eUtzWStqSWlwTVJuUVJ0SnE2SnF0MDBYT0YzVnR5eERVajFDUnB5bGNrYTkx?=
 =?utf-8?B?VWhxUEJlUldiY29uVmpPVXBKZ0ZqWEtLUnpqVU1ZY0t6aGdIZEdVcDhvcmE0?=
 =?utf-8?B?VG9IeVMvWDVHV3l1bEYvVHhMVytaR3FndlRDVmZ1enE5KzVUOWxaTXozRmF2?=
 =?utf-8?B?cWVjdE90ZVhEa2FaMTBkb1hSZ2RRR21iN1pySFcyUXoyUHdmd2crWUhBWmJF?=
 =?utf-8?B?T2dJaWFMVTFJcis3RTF1R0VTQms3Qy9kMGZQM3phTHRvcmQvQzlaYjN0bzBk?=
 =?utf-8?B?TmJpbUhqZkxIN2VCdFpIc1RBaHQrSUEvU3JHNzFaUlkrdXFrWW9IMzE3S2JB?=
 =?utf-8?B?SXZkUDh6MFhwUlRZNTk1cGFPUXZ5bDRyeXpoU0FraVRsbHZFdmFLb1ZsS0x4?=
 =?utf-8?B?RXo0QnpmSGlhQmRkVUlrdm9zVE5GeDVyQ2E4OWdlWmpLM29xVEVOMDR4QkRu?=
 =?utf-8?B?YlRwR2pKYkpVMGlqM09QTG44cUtrbnFlU1VUUHpIT25QcmxjdXIwWVBGLzl4?=
 =?utf-8?B?emw1Z1loOUxDWjdBWldMclBaK1pwSXdpbDMyOWpxMTNsdWthQTNJWkUvRm5G?=
 =?utf-8?B?Q0l0TllHakpKTGVna1hGU1VoSmxsY3F0U1o5WU5qdUhsRno1enBBOFJlK1Q2?=
 =?utf-8?B?NEt5ci9XZ0laOGFkQ3VuWUpmdjFkRUc4MFpHQTRMS3lvdEQ3QmhKVEVqSHBI?=
 =?utf-8?B?SmpYMFd3ck9PMGZadkFnTHQ4UEtUZzlFeUdoRjVSaWRETVhHMkVRcmFEN3By?=
 =?utf-8?B?SzVCNHhsUUZRVFJKRnkyQk1scW5jaGdNNWJPMGc2ck04ZGRIdi9zNGhJWkph?=
 =?utf-8?Q?o0K0Tv?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(36860700013)(14060799003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 15:39:00.9458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc8c960-fc7e-4a12-3ab8-08dda5104283
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10315
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Jun 2025 15:39:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7027

T24gNiBKdW4gMjAyNSwgYXQgMTY6MDEsIFF1ZW50aW4gU2NodWx6IDxmb3NzK3lvY3RvQDBsZWls
Lm5ldD4gd3JvdGU6DQo+IFdoYXQgaGFwcGVucyBpZiBJIHdhbnQgYSByZWNpcGUgdG8gYmUgbmF0
aXZlIGFuZCBuYXRpdmVzZGsgYnV0IG5vdA0KPiB0YXJnZXQ/DQoNClRoZXkgY2Fu4oCZdCBpZiB0
aGV5IHVzZSBCQkNMQVNTRVhURU5ELCBhcyB0aGUgZGVmYXVsdCBpcyBhIHRhcmdldC4gIEkgZ3Vl
c3MgeW91IGNvdWxkIGRvIHNvbWUgYW5vbnB5IGFuZCBza2lwcmVjaXBlIGluIHRhcmdldCBidWls
ZHMuDQoNCk9yIGhhdmUgZXhwbGljaXQgbmF0aXZlIGFuZCBuYXRpdmVzZGsgcmVjaXBlcywgdGhh
dCBzaGFyZSA5OSUgb2YgdGhlaXIgY29udGVudC4NCg0KUm9zcw0KSU1QT1JUQU5UIE5PVElDRTog
VGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlk
ZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50
ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5k
IGRvIG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0
IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55
IG1lZGl1bS4gVGhhbmsgeW91Lg0K

