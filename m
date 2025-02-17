Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF3AC021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 12:12:39 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.55])
 by mx.groups.io with SMTP id smtpd.web10.49849.1739794354558977575
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 04:12:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=PlVf449m;
 spf=pass (domain: cherry.de, ip: 40.107.241.55, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TDZclJt5/8eimsc0wfIX09DISZyRYFE6ADA4PbUSaVWfiXFfTSzri/Dp0Sc/np57le2oCclNXma6htROU67V1MoO/p5y6bHs5lHeBRe0OiacVsnPrVBYgOKHZgKyUGTaiYgHh+MhEb7nsKyssTaBw4SyPtrK2K8QRsio+WkpNJLzXqaCcjjRbUdWui3393h93J764eZv0FKAz3EzWBrDTABnjf67xvvIA2o++fxOoa81KZ5d58WkYJhJLyPTE+JSxTq7qHq2RR3AWUFIPwUssnqQTOLWtl9cieTHFSVeJ1cb3Y9nI66paMgVHxrOobyGDIitTxRLTeF+V/dimxvFLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRJyUcgMnCWinhkWSVaDx+adkL/WLgHJu7QuGdGgLpU=;
 b=ZWifAgZU37kje+52TkvjkC9THROvbzAd1MPf2ffTP1fRvc1+/OdcwGWcJXN1r/h/CSRs1+tAhdaAMklQS+6R9DxiGCDgO7Tdb5PuSI3r6F3cn2lcJrfVXNxbiP/GwtqSLofGOMWeHFhGmtXGt0/wMxdEilaE79ajt2bzUrCfJ8xJ9zkEZidh6Hom6M/yktKuTer1Dy+onvfZhJzBupFjzXEYO4uLBeJwj/hxAMhXSHlU4GXLYmfce20muWr1Cy1zEROkGOK/X1d61h5taXzgtyApsPIfQ8vlnDwfevSoZS+ZC30n59w/6tGPgOd5E6ZdX7EDAH7EcNlm3GOmDok6uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRJyUcgMnCWinhkWSVaDx+adkL/WLgHJu7QuGdGgLpU=;
 b=PlVf449muSF7LNXcAQOnkts4uaAnY4Rnf453pZ1fK0GyjnykgYKw9K1j86/sUV5ieuF4wZu6SlaSt6kQ/z4FcwLogN7uQDmUALCu+xx4t0Oqvwy+MytaOuK56uU2WloQ9t6wmzTXLeLG4Swlf4p5i+RVUkhbeo5pDKNvPqMcZ1Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU4PR04MB11031.eurprd04.prod.outlook.com (2603:10a6:10:592::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 12:12:30 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Mon, 17 Feb 2025
 12:12:30 +0000
Message-ID: <8949b123-6eb7-427f-90a1-784e95611e46@cherry.de>
Date: Mon, 17 Feb 2025 13:12:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 2/6] variables.rst: add a reference to
 BB_CURRENT_MC from bbdocs
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250213-multiconfig-doc-v2-0-f2bd35115cb7@bootlin.com>
 <20250213-multiconfig-doc-v2-2-f2bd35115cb7@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250213-multiconfig-doc-v2-2-f2bd35115cb7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU4PR04MB11031:EE_
X-MS-Office365-Filtering-Correlation-Id: 60225403-108c-4f10-9eea-08dd4f4c5a24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QkhxZy9VTUk4NE9kVUpSVnZkWUYramY5L1I2N0xGbUg5eGh5MmM0SUROY3pP?=
 =?utf-8?B?dXQ1TmFTc2krM2ErWmxhWjh0b2p0cThvQ0VaTVVWSXVqL2FVOGxheWFzU0pK?=
 =?utf-8?B?VndqdjdGREpDbDRzd0dBOFQvclJDMUNmKzgyaGFrTjVtcllkdVdDVnZDcWtC?=
 =?utf-8?B?aDdCWkVHNFpJZm9uUERSeHlwZTlhVnREMC9MbTA1QldMQzlBYkVFSXp5SVIy?=
 =?utf-8?B?eUZTNENlUTdlQk1CRHNORFRQeC9EUitEVjBvVlhiVkZpRzUxQlRKbHVMRDRT?=
 =?utf-8?B?RHEvYUs0alorSG53OEhabnVIN0pCT0ZobG1LZEtBRHloem95Z1dsRkIvcUln?=
 =?utf-8?B?WGY5YkNUOFU3NjFEUzNLajZWMTc1UnNTS1JWeVNmZGRsNlRoYTFvdysxWnJz?=
 =?utf-8?B?OE4vaVpKWi9HR2NwQ2ZwR3NaRzhDOTJPdUQzYTYrQ0ZOUksreW9uc0t3eFdx?=
 =?utf-8?B?K3BwY1dMOXdxbnQxZHFyVHRZZW5XdEVicStJalR3Mjd3N2Z3VE90SDA2NEVR?=
 =?utf-8?B?aml0dWVmYm9MN2RPWGtidWI5T0dhNUV6V1VVdjUxSk1NVDR6djIzR3BWRUd5?=
 =?utf-8?B?c080YWZUTitrajR6N1N2WEw2UGh0WGd2SkN6clNNVlNQVUhHdTFkajRTMVla?=
 =?utf-8?B?Q3ZJeWdHS0FRVFRSS3BzdG9lWEdlSThFNElWeCtmV2YzMGdFREVwMnI3UWpa?=
 =?utf-8?B?UXMySE1kbEt5RG9VakdhK1NOeDNibHhVTnFZWkJPZnpod2JYNFlhMjVGcXlw?=
 =?utf-8?B?WE9WV2c1cGk0N3pzelIvNkVLYXlxN21DeDRlb08wYWRwZktMK1VnYkw4aUR6?=
 =?utf-8?B?bExLZTZWRTVZWER1N1ZPQkJ0Z1F0UVQ0Rno5d2Q4eFpUb1hGazdwSUx4TnFz?=
 =?utf-8?B?eWtvOGtVa0NnMVZOZFZxR1JMYTgyM1BBcWUxV282ZGRES3BobzJiZ2FNSU00?=
 =?utf-8?B?eTNSb2dJaDBtQnlwVFpuRytsQ3JXNThqd1pxOXRPMk9yTTdOSjhKdXBxT0Ur?=
 =?utf-8?B?WDhWamFQVDZtdHlvTk5xdVVpSVJWaHZRMnpFQ1ZMSFBHcVppQlF3anJYMVN4?=
 =?utf-8?B?bXE3QklENThYTHlXVUF4ZFdwZm5QUk1GUmN2QVl1MXBVOVVJYlhUU1lsQnIv?=
 =?utf-8?B?RlpRL0lyVDRBUmcybksrTWNPeDFQUGRFdEIrRDVacDV6N3pkelZwN1pjN0V5?=
 =?utf-8?B?Q0E1ZXV2WVVSc0JJNVNaY1VzZUg5SUtGL1N6RmJVcFRmNndtdzFHQUROY1VH?=
 =?utf-8?B?anJud0h6ckM2YkNFeWxyK25NSExhVXh2N0o4YXpvTEhjcmd0TVBHKzJOVEly?=
 =?utf-8?B?dlhzL3dJemhpdU1WbWUvSVFTYXVxbzR4NUZPY3ZjMmFZanJEOEpPNUlWUGFK?=
 =?utf-8?B?UDdRRkt3NVArSkJXWSt0Ui9LRlBlT1ZYVkxNcDlFNVplT0hHK1ZNUDNXQVhV?=
 =?utf-8?B?ZVcxTFg3REtwSXh2bE9rZVM2RFlrUmhqWEF4VDM4bkNidkJGbTN6ZDBWVFhk?=
 =?utf-8?B?dFJtV21IVk9OUzdjbWdjQW5IcDhzWFFoMnIrN1cwc0hlUStacjFZOHlVNnll?=
 =?utf-8?B?SmFKb0toQVFRdzk2WG1qaERETkZaK3p2N2dxbEk4cmVWVGpTVDVQNHNDRmNQ?=
 =?utf-8?B?cXhVM2FjMHZJTGJvNUZ3cXZEOExHcmFRUFc0ZjV5dFlJTXRNN255dWkxVktG?=
 =?utf-8?B?cTlxNG5YVjJybGhwVXRPbXoycXJYb1dHZ1FrQVFjNlh1eVIwWFIxNEc0M3Yr?=
 =?utf-8?B?YktTQkRqejgvUzlWS3V6ZzcwK1ZHeFlwZFg1R1FzMUhDM3RlUUJvSnF0cUJB?=
 =?utf-8?B?MFV0NnBSRGJDc2xJVmtFRWZOQ0xkL2I4K3d4N2hZUnMwSmFCRFRJcStmQlp0?=
 =?utf-8?Q?tCEQ8lrlLf2W/?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MytzMzA1NmxoZldSQ2Q4ZHJMQmM1YnpqcFkvcjhVNW9vb2hrVDN5bFlKd0NB?=
 =?utf-8?B?SnhZNk4wbHN0TS9KajVhTHcybWc4bGQ2WmdzMzdpVVBtME9OWHBJdTFzdVRL?=
 =?utf-8?B?ak9MVmxwOTRRU0NMbmtTYlE0dHlCQUMrOXBOYm9naW00Q0hqSlo4YnRsQnBP?=
 =?utf-8?B?RllHb3NqUnZaWVZTZlN3OU9MZkM5T2tITzdmT0NPenBPcjhPLy9NOHdzd2h6?=
 =?utf-8?B?NWtCT3RWdDQ5cVhCcEY1czhkVEx2MjhnV3lBU2V1K2xFeE0rVEdJdEtnVVZx?=
 =?utf-8?B?YXFPZzlxN3IvV1YxeldEWXdTSTNvdHJLcXh0KzkySmczVlJFYlhqRWNRTndF?=
 =?utf-8?B?bmc2TjJ2dWk0dUpQYzBoME5KNVduSEN3a1F3THM0YnpqaDY2Y3phaFFKWlpW?=
 =?utf-8?B?TVAxWjZSVVhISjNJUkV2SHVvR3FoakNyM3orckIvWDYxcXVWRXFjdklTUkFu?=
 =?utf-8?B?d29FWW1TNHVwaFlienlWZEUvbldkSXJjYVdKQllZMkVMU2poaGNZTjJWeXdV?=
 =?utf-8?B?MytQTlJwQnRLclByNk5JbEc1LzI0NFhvbUlHVzNyWFJPOHNsN0pZQzBrMG1C?=
 =?utf-8?B?WXJsZk1ZUzAweVV5cWY1QUJEQ0JsNm1KZUxvZ2pvcmRCTWlPeDZxb1FjUGwv?=
 =?utf-8?B?bkYxRCtmR2orUlpuTlJqL2JMVDZzRmp4Ny9CbEdpMXNQb2huTUFVeGZ3T2h1?=
 =?utf-8?B?eU1mS1k4aytORUhBRmRRRFlDaDJPYWQ0MFVWbEpseDZKK3ZHNzlEWisrMXc1?=
 =?utf-8?B?V25PYWFMNzdqb0JaaWFQV1pmNXpYOHJ1Z2JtaExKeDRtejFsUjFFYXJFZlB6?=
 =?utf-8?B?aFNKcTVXdWNWMnkxOFpNVDVnK0M0WUJvVW1IaG5sTkRFU3NCLzdJUjFUS1VZ?=
 =?utf-8?B?cTRsVElINXUyTldlcjRaUmVmTi9sZ21aMUJaWXBGR1hGOFFnWjY5NzhtcXRp?=
 =?utf-8?B?dWk5TDVBRit6cjFpeDBvcVNTMUlPWnAvcWhpdW82ZytWS1IweXAxRzVlVE5k?=
 =?utf-8?B?T0l0M3BxaFlrV0JNNjFNSmNreldqR0NGTWVMd25QL3RmSzdaN3dacWhKcmJt?=
 =?utf-8?B?Mis0dXI3Zm1SRDhJVmo1MGt5UjV6cFZ4Uk1BcjB2UHVTeHlnektOZ1hEU3Ru?=
 =?utf-8?B?bVJhZmsrTDcrb0J2eDVDeWhPL1k3eXdNc0VzakEvZTFTTzdCTDJjelZESHFr?=
 =?utf-8?B?Z1laMGNMRVlkQTF3bGJkak1kdHk1c1hSUWhFem5Gak96VFgvOWpXd0ozQjBC?=
 =?utf-8?B?a1VkV1FzYWhsNGpIWnNEQXBBMU55NG9ZQTJab2xKdmpydldKZEE2TzJTUmo0?=
 =?utf-8?B?cjAwbUJFaVZmUVhZRCs3UGhHbVlwSGxPVDZVaWdVVDROVDZMc2RlNWg2d3Jm?=
 =?utf-8?B?d1RqOUNOazY0UHAwM0FiUHZURlNIQkpNclpoN3IyakVhbFVHSEdpTTlBaDVh?=
 =?utf-8?B?L2xLcE42czc2ZURid0JvS1dpMUdnZnJKeWo3WVZxOTdIU0xxNG9lNE5IMDlB?=
 =?utf-8?B?c3FTSkNTalJmODRzYjdjc2c3dk9hcWlnNTNEWkRmbG5pbDdOV0lRdmRMMHdZ?=
 =?utf-8?B?YmNudFp4SFV2K2pFcDBubytTbzBhWGdMT0xyRnBVY0VuQlVRd3VEWXp4RmFu?=
 =?utf-8?B?K3pHQUJHZGtsWStUeVRHMGJ5VTdSam5UL0V5SmNiYmFWdnFhUVlyRU43VFpX?=
 =?utf-8?B?NDQxUlVOOUJGVlFmeUVqUk9rTmZRdFEwMENvYyt4YlpnQnBVb3R5SDNnaFB3?=
 =?utf-8?B?OHVZZEF0a3Q2Rk5lVDkweG1NQ01uSnVzMUE3bmpIeCtqOStsOE5TVEhxYktV?=
 =?utf-8?B?WHdhWFR6aVc0U3lZa3ZvYzM0Z3M4QUdsS3lhc3F6ZTFnQmJ2Qkp5aGpjRmsy?=
 =?utf-8?B?NUxUZHE3cjV0ZXhaYmQveVczU2lhbWtGYVBxa3piblNzek1WZGpBTlI3YU9r?=
 =?utf-8?B?cVB6UUp3dEZOSHVlYy8zOERBSUVDWUcwRFBuMDBDNVlPUlI2R2htVE80TUZB?=
 =?utf-8?B?eUxySy9xd2pzUWdic0VTUDU3c3k1UFhycTQ2cmorcHBUTXcvdEM5a29HR2Qw?=
 =?utf-8?B?VXNZUldFNzdjdDZTeE9oWVdHbTBaZlBwZVo5N2ltNE9lajBRUWhNUTBSWjlE?=
 =?utf-8?B?SCtYb3RaNEpNb09KbFc3WmVPQjZtM3VoY2lEeGp3QXl0Y1JKQ3dHcW4rZ3RZ?=
 =?utf-8?B?b3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 60225403-108c-4f10-9eea-08dd4f4c5a24
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 12:12:30.6359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KIltSzyFknzMJGLzAiKZu8ZSNHMURz0Wse4k/cQQt+4zszGMgN3exQiQj2oesKfNJ5kWk1suXfAGImqNqCkYGmZE1SiCgzxXoYRRgwLCVsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11031
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 12:12:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6384

Hi Antonin,

On 2/13/25 9:23 AM, Antonin Godard via lists.yoctoproject.org wrote:
> BB_CURRENT_MC is documented in the Bitbake user manual. Add a reference
> to it here.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

