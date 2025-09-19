Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68491CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 10:18:06 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.43])
 by mx.groups.io with SMTP id smtpd.web11.12893.1758277085274697312
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 03:18:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=md32zVSp;
 spf=pass (domain: cherry.de, ip: 52.101.65.43, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmeJuBmluZzf85udQ1hxZH4Mh+gFH2TfXCVMYqxN1vnaPpfyewLl0GNHpinlV7pEhgU4KImk6SnSR7KKhxR5JYy/0v8Y8x1K1mDnionBoL6H2W6XvOU+g+kt0UXGz+LwqG/CjnT7tyccjSyW4QK4vtS7HAC2lGsC04shxuTLN+Esz3TUFFoGNWOUefR4ff0eMpPlAr/CKR4cJRcY8D9CLO/J1/J7cZTb59sWrfBk2xp66PyN/NQFzMehLj88HSvD0RNOh4Fcu1r1O6VVoSlpJOztGC1Xc6c7m9AAqXwK2jfu7/kgzGvh2hH5L085dzSzuT4xCranc2d/i4v3fW3Hfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5tqyiVJVCrueCYgV6/PrPHffj6U7u9y2acIrqGDsZ4=;
 b=PjVTNsTZ4iODkUW23C025Kg4jBnZG4oBA5QQGVOuoe0XMO+7g7aT9iIXhPrXgc+uC+vsaPQ9Q7lOx4McMgntht6yr/c0h59MRpgIxkOv8P66qZqFibStyh8TmbSi/ur/nKpuljRDy5ca2PofD8LyFsr1eabGUyTVRMKzrni2vkvclTKIBgzlZS5jU90CBjfwUta1tNHX7rmdn/LdIsHy7TdYCn/mTucSLsIZjaND0Hoa3vrO3ucWZzpbT9XKjwVm93ocakVHJlWU09NTYRw/XOng8AaQQw1vFweb0EwGfBQLlAX3SpzKgRKOnLRm0o8S3ru4spMqPEnj0SkJMu8e1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5tqyiVJVCrueCYgV6/PrPHffj6U7u9y2acIrqGDsZ4=;
 b=md32zVSpoDUhKtWPFf6yIW5OArPfQtEsWZDmSfilWoZq6uxl9M6Z8uiGVTHXUGFnKcccHlti6JXh9A9p+XjGsRClzyJRSk5vuMO0Zb5nyecFwIFkH0WsIDAVAtEQj1qO3xwqYvLBcbls6bb6KvtjiDTr807yrHBKnSzToTtuA/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by DU2PR04MB8533.eurprd04.prod.outlook.com (2603:10a6:10:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 10:18:01 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%4]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 10:18:01 +0000
Message-ID: <dbda1a5e-6adc-49d8-9988-ed5a4308188c@cherry.de>
Date: Fri, 19 Sep 2025 12:18:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/2] test-manual/yocto-project-compatible.rst: fix
 a typo
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250919-update-compatible-doc-v1-0-f3a343914503@bootlin.com>
 <20250919-update-compatible-doc-v1-2-f3a343914503@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250919-update-compatible-doc-v1-2-f3a343914503@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0039.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::25) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|DU2PR04MB8533:EE_
X-MS-Office365-Filtering-Correlation-Id: c2a5935b-ea42-41f0-c63e-08ddf765d037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RUF4c1VZOFh5dXErL0d5bFBubG5MNUJtTm5URWJoZk40ZmxuSTYzQk9FSzJl?=
 =?utf-8?B?NVJ0dFBKVGozK1NIaEVyRDFzT3czMEhncmJqR1hMa0FzNUVpc3h2V1pXMkhx?=
 =?utf-8?B?WkdxTEJyMkFHR3R6T2UrUVFoUWFwN21tNVYxUW1IdXREVEVtWG4xYlM2NXZw?=
 =?utf-8?B?cVNoRTBNU05DSVpySzNGeGh4UmFmZFRjaU14Y0VPNXUzK25DQlprSkhta0dv?=
 =?utf-8?B?VGZCNHkwTytubEhRQkVmTWl6aVdIcWlQQ3phOG5WenpFSmJPRzc4T2tPMGhP?=
 =?utf-8?B?b2RHWXh2QmNPcXA5cXVabWV6T3NPOWlTTkFvR3hWVDBTbDNLTkloaWZLOVNY?=
 =?utf-8?B?eWd6NGgzNmhTaENjLzdjaStXMUs4ak5XdG5OR0xVdytmdTVNS0I3bS9sSU5E?=
 =?utf-8?B?djRRemJzSGJyZ0pSYW1PQTBDMzNwOHBGZ3hMakJSQW9MR00xU0tJaFZYMEhS?=
 =?utf-8?B?OTk3b1dHQjRUTzA0c1A0TVlOWGo1OVJiM2hKdERKeEl4Q211UFpZcXZ5THR2?=
 =?utf-8?B?Wjc0bEtBeTZ2ejJ1Zk16L0EyRGhsbE1PNDRVYjlGaklKS1J6ZFYydWdlVmdN?=
 =?utf-8?B?c3BqbFFIc1huclY1SjZaUVdoK2pMTjBGVmJjRkxOeG94LzJnWmRjN1VxZjVE?=
 =?utf-8?B?dFFQM1czZ1IveGJPelJJSGV1NFlVOUpuR2NpMFR3MzV4YnBQM25SZkhwN3dC?=
 =?utf-8?B?TGNHc3VyMTlBUU5vNFRacXZmOW9qYytkbHE2WGxFKzNLUGZOVHNGOThBekVy?=
 =?utf-8?B?V2xTRGVQaFBmUHQ1NWtHVHJ0K2QvRTEyMDY3Q3N3d25uakR6eXpNVXRROWtK?=
 =?utf-8?B?STRuaTFKc2tDZ3oxYXJGSWh1R0hLWWk0ajBEeURyMXM0alVUZTJyZ2FsdkY0?=
 =?utf-8?B?bkd5eUFhd0wyOW9KdHhCYk16VEV6VFFQUWpEa2xvZnRzb1JSaGZueTNScHpJ?=
 =?utf-8?B?blVOdVBLRndDTFV5T1VGZFBLWjdWYWZHVEN0YUs4ZEpPYUNzZ01OS2pwRGlP?=
 =?utf-8?B?OUQxN1VSRXRqNXgwa2x1TWlGeVZMeXR1Q0p5MGJHd240bmYwd1d4VGExbjA4?=
 =?utf-8?B?SG5BTkkwUjhpUnRNMW1VMEFUSDBicDhieUpjRGluOEZoMmhuSGUybndPNDgy?=
 =?utf-8?B?bmRaNXZZTVpYamNBVTVIdmVGd0tUdkFaRUo2dTdXdkhkQmI4MXNuMGFvSlk5?=
 =?utf-8?B?bDBQMkdMaEhVN2o0YjlMTFVtRC90WnZwdFpNV1dya1o3Ym9ucEZXalFsZFRB?=
 =?utf-8?B?Zm9adWxDUUtGdi92eG13Q25qdUltLzh6NWNEa29BZU9QTHZYbWE1TVR3MDFV?=
 =?utf-8?B?VkoyWVAwVWZkSFdMdGNRSk40WXU5a3VleDNwNGFvUFEzY3FiMlJaY1JTRkc4?=
 =?utf-8?B?TVB3QWlzanlEZFd5RDN3c2pHeG5WRnRDOXFjV0NLM3JwWUZMSitiN3JEdW41?=
 =?utf-8?B?TFdvOXhqbG9ObzlJbEtwTlRkbkl4dTFiRkVKOFlmQ0lOV0YyTjhxWUp4Z2dw?=
 =?utf-8?B?YTFjZkRzcmIzNkNvYjBHNHh2UU43Nkl0V3o4LzNzTVpZaXJFM1QyTzBsZjMr?=
 =?utf-8?B?ckZhd1JVd2JQMGMrR05HMmtUeUN2N256aHhTOURpbEZsOTNpYkRZdWJWSGZL?=
 =?utf-8?B?elhFSDZUYXdXZXdSdUVjcnU1Y3BmaUtJcDF5cE5HR3FGUWJ3S3d6cjNjaGd3?=
 =?utf-8?B?UEZkVjQyMlJlZHdqeTVBYW1PYTNtVFNOSG1EQ0hnTEY1anBrQ1JkWFJPbXJt?=
 =?utf-8?B?QklXZ05XSnQ5R0QzNWdyQ1hRNHVyQ05FbWQ4UFNMMFdOQ04rSmVRY1l4MnBQ?=
 =?utf-8?B?SXJyQkFFRG1TVUJ6UitWL0NtVmhBY1ZkbVUzSzZMbnZ4UEUybmQzUVo5SlZU?=
 =?utf-8?B?RnY3ZWtobWRzMm9zSFJRTlh5a0F2d3l0dE5HUnp3QXJ6VFZQWUN3MERWU2J2?=
 =?utf-8?Q?KSYwlXM8UWA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WjhXTEJsTVF1U2NvODNGRlFsTTJNQmk3eG9iZFJqdEQySTl3OTQ3TDhRcTEw?=
 =?utf-8?B?TmlrRUVMbGVSNFlsaTBaWjBTcTNZaFBVTlBPa1RVQ1BwSjlURkh4L09QS1NQ?=
 =?utf-8?B?U1B1N2hXOTRheTZzMlUyVDRpYkZycndTYlYzQ1k1WStWMmxRbERDb2lTM3lu?=
 =?utf-8?B?MzhmcHJJUHFqWDg2OXBKZEVxOEI5M2MwTXVXVDdGaDF4S05GZXFpcitHRndF?=
 =?utf-8?B?UlpxUndrMEtmQmpvQjd0dHkvaitDNlh4a3FrWURUN2J3V2NuWUpmaWw0NHRk?=
 =?utf-8?B?OHlVbUpkaHUzRkowVUFtV2R5NEppSTM2QlgyZjM4TzZRdmVEcFhWNG1INno2?=
 =?utf-8?B?SmNCY0c3N29nbWRUTHdiRXgwa3Y2VlBYMkt6WDZpZWZpd21LTzVNcityU1R0?=
 =?utf-8?B?WUZFcnRhUHAvRDFKeHNaclJJaGR5SEtVb0VZLzUzOVRWb2dzVGd5NW9mSXRJ?=
 =?utf-8?B?TkRNOUY1c1NFeUg5cWR1WHVWTjhtMEdHVVdLQW5ub094RFBNdW5ldEZrR3pC?=
 =?utf-8?B?QjBtZ3ZHWTN0YkZXMGN1VFhZWkRXczVSb256MTB0a21UVHFMV3loMXFoeWpx?=
 =?utf-8?B?S3I3S1VicGp0Y3k4Z2JocFU3M1ZpS2JKMzl4Z0hiSU1ya09HMGFWYzB4Yzd5?=
 =?utf-8?B?RXVBMkJGQlJxRkkwUU0zN0FyQkQwUkVCblk4ZHlVV29yTENRR0t4RjhuM3ZE?=
 =?utf-8?B?QkNRc09aRXF2WG5ZSTdnNEc5Sis0Tmduc3RObVRaUUkyVllRMnlwanlyNnZq?=
 =?utf-8?B?dkcwcVhPazFHUEVXTEJRb3h4dGhnczNxRVRkUFlEWkFuOW1YT3lJakNVcWtH?=
 =?utf-8?B?R2lkc3VibmQ4Tml4aG1lcXpqdUF2bm05ZTdJUytGUnVuM1R6cWxyV2NoKzBS?=
 =?utf-8?B?L0lMelhGU095aEQ1UExFRi9CZHdNeE5DNStEWkt3Y05KRy96d09DcnFwc1Zy?=
 =?utf-8?B?bHBHalZ4WmVFakxvdTk4VHhwOHY2eEc5S2MxamRMVmUxYjJkemlmRGNxc1Zl?=
 =?utf-8?B?cFpTOWRYR3Rodi9yWWhvRHpWc2twYks0bFRCeTh1TW5VOXQxbGdiVEZTK3k4?=
 =?utf-8?B?dWtGYSs0eTc3bGY5N0Z4Mk1UUFlzaVRHeXdSUStsUGpBZkE1YmZ5Y0VyZGtC?=
 =?utf-8?B?QmVmaXl4RGJySXNUaThNTDdPcHI3NTB6ZG1TWjhLVEVXWDk0Q3dPR0NjRkI0?=
 =?utf-8?B?MGZEb0N1Y3hHNlNrTDc4Nk5hUHNkb1UreU9NbE9CN2ZHckw1SDVQeXNUQzhw?=
 =?utf-8?B?U2Q1YW8ycVl6SlJwQmIxU1ltMHROWi9JTitEVEI1eUoyUHFmWmpoWG1Yck80?=
 =?utf-8?B?TDY5b0J0QzVqbjlLU3N0U2xYakh6dno2dGZhREw3TUpYRDY1M3ZDaytMNkJB?=
 =?utf-8?B?QnZUT09Hd0xuV3haNC9JTkxkUUtYZS9QbGphM05MbHFQQmdSc1pvQ1pPRGhN?=
 =?utf-8?B?b3hXaFVIaHhVc3hybVVJRTZlOVloUnh3bFg4YnYrSkZoa3pDR0Z5ZDRPOFow?=
 =?utf-8?B?RGxYMHNZYmNPb1gvREhTMEFad2xNeFZOL0hYY3pqL290V2NJSWt4ZWxFNWtS?=
 =?utf-8?B?WDhiWVNTZ1RuN3FnQVFjOWhrNTNkYmtuQVJpSkVaNmNxeXQyUnZBL2trZG9p?=
 =?utf-8?B?TXh2UU9RMmJTWlkySU1IeHV4QTBNQlo5bWFnQkQ3Q3VXdnRFT2VtSkx5Y2h3?=
 =?utf-8?B?S2F4RWlnRm5lLzBHemhXcVV3S09GcFltdGlSRHFDL1RtNUhEWmRWL2ErSnlm?=
 =?utf-8?B?dXdJOWJtOExCWnB6UHpHSnVVajRkZjdjSi9xdXdUUjJHQW9MWDNDLzV4SHJQ?=
 =?utf-8?B?blY5a3RxdDZ6QVlxRDc4QVlmNm1tSjB3L3Erem5iYnExc3QrSUJKQkNqME1K?=
 =?utf-8?B?OWM3eU1QK0Z0TWFjV3ZlcWIyZG5uRE53aGJiRUpyUzBRbVJ0SExnR2ZJbjhu?=
 =?utf-8?B?dVYxY09CY1lLR0FXT1hwQUxXTFEwaG11Q1N2R1RJZkJuUk9TMjAxRHdXWFJL?=
 =?utf-8?B?cEFnN2JXSCsyWEJyZ2l5SmtuU25zWlEwSjh3MkV1ZmpDWWFkVnM1MWVObHlR?=
 =?utf-8?B?RXYycTNKSEVrRitKQys1QzJza290UmlOODI3V2NaRjNtSy94c2xIckQ0Nk9V?=
 =?utf-8?B?bTZ2ejREV1JqUHVWNVJDWEFCclEydEVFVUg5UVgrN2hpc0xMSkQ4eUR2cE9w?=
 =?utf-8?B?ZGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a5935b-ea42-41f0-c63e-08ddf765d037
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 10:18:01.5980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qtz+iAJPPsGXotocFYT81KiY4YafLepqfAzCkzAaGvMyDNfe9aZdHeh2e5FoEKc7+oquJXoM/ve1NYwvrhItS2VT2U/u9iKyuNJ7XTPZXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8533
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Sep 2025 10:18:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7558

Hi Antonin,

On 9/19/25 12:14 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Fix a typo in yocto-project-compatible.rst.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

