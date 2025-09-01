Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A97CA0FF0
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 09:50:59 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.6])
 by mx.groups.io with SMTP id smtpd.web11.47480.1756720256619393378
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Sep 2025 02:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=SwMxgwHa;
 spf=pass (domain: cherry.de, ip: 40.107.130.6, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQ5QNWl2a3WSlhapSvcn3vV/EbZflyManfHCQ8UPxvE2bOtD8E+Qp/J+dzaHFppQm0ApHDJY1o50KS66f6xk7IrUV4mT/u84WUsmUkw19bSRdm5XyhQZUtjtV4oaSo16PTJH5Or0bLAi5EolrEwJtgvVg3b2dCAxTFjpQCN195QVXOAvmVtXmYVvfuRb21M2Bu4j6bnW2DRArQM0uv3bsuZIzJwklhVn2C1/8cVn52zil6cVChu4AByyZiTou0OtyII+F2IbWt79g+jZ0Tm+ytYn6eR5xbKaSsCz75SexYLH5JtjdkEk3b/fSYOdX5z5Q+oKEzU0lnekJpeHTLC5tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiPl2AfYFYzHHoRfxbGI2d1o5aY0QC3HDCQ/4ujxQgk=;
 b=oZvpbmVH9PZZziR2kCUfGONYasp8FxMaZBUeWjL6NN1py/6xF1P2EUBT+JKzp8ruT8/GIvuOwtmA9kYd8K7P6JIgIQzzClbekrfcMgUe1gEcCXTXay+cd+PpSjqBwKzL+ima3UkY7DrS6n8S0JivaTCSBi3P5cCDxrDaXNlvgOVg7KrYaWJQH4fYwFQe4Z01ttAC75RadHEX+P/DsFfJoVzFR5pV4H7GeKZcevbMrlySYt0/+HuwNgfQoBxmmsLoAwcpBr4xQEZJCDFXEizjKWAqEWCxtKkfLp8dzUK48gq/s9Bjz82TAppTzbkVcNvAJc4VlWBFBFO6Nn1/XhKt+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiPl2AfYFYzHHoRfxbGI2d1o5aY0QC3HDCQ/4ujxQgk=;
 b=SwMxgwHaO1mD0iuwxiDtBmh8F+ywtBXH02S7t9gOOSa619IqQ6iEkMorsVoI3UxRbdB/iLgwO1e/2Qbp65GFXJU/zRZqDxCv1OA3RsH3DSValX9ZoFLUgXZ0kbQ4V/jUyXC8GMbXxQsdO/Bwq+jOpHlgPPEs9BmvLTdjTCiLPZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB7936.eurprd04.prod.outlook.com (2603:10a6:102:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.12; Mon, 1 Sep
 2025 09:50:38 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%5]) with mapi id 15.20.9094.015; Mon, 1 Sep 2025
 09:50:37 +0000
Message-ID: <44868213-2ff2-44bf-89a6-48e1dc6d3b80@cherry.de>
Date: Mon, 1 Sep 2025 11:50:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] vulnerabilities: update nvdcve file name
To: peter.marko@siemens.com, docs@lists.yoctoproject.org
References: <20250824145316.1098911-1-peter.marko@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250824145316.1098911-1-peter.marko@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f918f7-a4a2-4619-06e0-08dde93d0105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V0dGS2pTdnExRG9JeWJuREYvSWltVFk0Z3E5VEJxbW5aUFcrREVEcDZIOXpj?=
 =?utf-8?B?SlZ5TWsyWi9IK1I2ajljLzNxbEJyQm85NWRoYkM4MzRGR2dGTGFmNWE0eDJX?=
 =?utf-8?B?NzhBVTNHOFFLd01uTmwwckJLZm1mQmtEcG8wTDR4Vm9KeEwzL1RPeHY0Q0pG?=
 =?utf-8?B?czRjbzhMczlxSGNZVjZoblFFc3NxbHBKRit6THVDNGFrdEZrTENnQXMwc3Bs?=
 =?utf-8?B?R3k5YnJYT0pIbjV4U2lhdDNqU05nOHFjamo1TmRtQ1VGYmdaQll3cWhGMldB?=
 =?utf-8?B?ejNHai9XcVZ6dVVaaXl5NERZSDhsWE9aaDZPMWZlVk5FcTcvUTJQQVQwNDFE?=
 =?utf-8?B?ekl4SXJrTS84aldBRElxK0t4TE5HUWsxNTc4UDRrUmJXZUFzeFd3MGtZWTNV?=
 =?utf-8?B?WXhya2xXYXNvd2dBQXV0Z09VdU5QM29naXhNNnUrQU1EandMdlp0N0E3ZHU4?=
 =?utf-8?B?OW5pQzhKMFhMVkh6Z3RIdFJ4RC9XdFZVSkJPV2FBNjNmbUtKTEVuMkp4L0tE?=
 =?utf-8?B?YzBaVnd6c1ZOZWJaTGVDR0dxQXNUQi9rQlJhRTVwcVFKQVNjS1NteGpLTGlv?=
 =?utf-8?B?Z0p6WHcxSUpwclBvZlg4QnJwQVhWbGpIdjJoMVBmMWZXT3lZWkZZZGtXYzcr?=
 =?utf-8?B?b0gzYklYQnhjVUxSRllSWm9QRU1RRU5jMWRQOExzaXFQbXJIcm5LdnlPZ1dW?=
 =?utf-8?B?UVNNWHBvRFhtQ2tHR0p2eDBTaXRFRjRSSnl4WkVENnd3YnVMY0k5U2o4R3pz?=
 =?utf-8?B?VjJMdVNKWjVWb1pyM1FCZ1lQTzFiRVlnMWtCRGxyS2ZtYlVrQ0xKN0pnajZL?=
 =?utf-8?B?d21BSU1Zd09teHJST0xYOU5NMUJmc0tXZGxEdXlCdVZTMWd4YTBKQTIwQ3lp?=
 =?utf-8?B?bTdOODkzanRxOWN6S0xIS1VjL2FHS29MM3VCVThOeGJOV29SMVlZQmNRSnhP?=
 =?utf-8?B?VXhBcTF1UlN6RkhKd0Nzdkk4ZnhwVnE3Z0tteEJSRDhFMi9EcHA0RHUrVTJu?=
 =?utf-8?B?RTY4YWpWRkdYL3BTRFV5bExFdVkrV3dPdWRuMTZhenB2d3p4aDI4cjRlS1lu?=
 =?utf-8?B?bEZ6bDVHVDZIN0hTazBEQ2pCaVZrRGxGYU1uQXNzM3RyUzc0aVVKUTVXRE51?=
 =?utf-8?B?Q3VjZHkwSWFkemg0alg5VUdTNFVqMURaeWg4OU1uMUxlVk5scnV1ZDJXZVd2?=
 =?utf-8?B?eEZDNkFnczM2NHdhcDcveTlVaXN0cld0dDdDV25JemdLS0sxWFN2ZGpNVHNn?=
 =?utf-8?B?enY1UDFtZjlsTkcwSTJUTlJwcUhZYUFNdm1lcXJoSkQzMHVjbXlZV05PK3Q5?=
 =?utf-8?B?Z2t6QklBMjZ1citBYzRkUlpQL2xKYXRCU0FjMHIwLzFyMXhsdGVQelBCV3Z6?=
 =?utf-8?B?WUdxdVo1Mk1MVW1NNGxpcHUvQk5TL092ZlFKcTZCc3lPbWd5YXR3RXExWW5z?=
 =?utf-8?B?Rno0TGZOUElJYk5xenpiL3IzRHdCUHlSdk1aWHcvWkhmbmtveWgvRDdUUHdp?=
 =?utf-8?B?QW43SFVXaXNXMG5TT3dhTmlHOStERVBsbVJxT1U3eExFaXpyMERpVGRGTllN?=
 =?utf-8?B?V3REOTREcU9keTF3aDRscHlKQWl4aHJQNEhaQ1crK09VbGlmeWFrVzI4YXFo?=
 =?utf-8?B?Z1EvdHZzaHhPYlF5QmZoVS9YVFdzbVJzSXVIQzU2UEF0VHJXV3dTb29nVnpY?=
 =?utf-8?B?d1MweVMrdG1odmZWU2ZtQWcxNFpyMHNtTy9PSC9zWlp0N3I0dXJibXgrbTBB?=
 =?utf-8?B?OUpWZkYzK2JBa1M1Z3FDQVQxRDBObzJhMU03TERVdVNJRTY2NGIvbGEwcHlw?=
 =?utf-8?B?ekp6WmxTNzhtYy8wU29VenM2SmhHVlllbTNraWREMEJaMGVaSU91K3RGbUNN?=
 =?utf-8?B?WUV0UkFvVlB2TmU0ajZIR3Y1dmdXMjUvM3QwUG5BNVdKZCtYbUFrdmQvaDJh?=
 =?utf-8?Q?wTCnj91Fasc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Vjd0OG5vSlJxRkNXbmxEMFJ0VjFiY1VCRldTeHN2Y1EwREZlSDZVTU5Kb3ZU?=
 =?utf-8?B?OVU0RXhwNmxaY1RRVVVGeGFPMSt0ZWlLZUU4clhmWU40ODA4UzhJSWVCaXpI?=
 =?utf-8?B?dnowVzduNytuN2JRbmxHL09YL29aY3Q1NzVNQUtHVllEL3ZyM0xjOHhjZHdR?=
 =?utf-8?B?aDFBK3NVUnQzMllZcnROdEpjd2IwbmpNN0hBSGNzdDhOUUZOeHJ0Qy8vVWNY?=
 =?utf-8?B?ZjhmMWhpNzh3Q0FleHBZV2pBZlVvaW00aFNlR1o0VXh3VC9kdTAvbjJ4N2xH?=
 =?utf-8?B?Mzk0NEdnaUZEQ2ZnOWY0Z0pTUXRpdFdJQ3hnZU92K2lkd05HTGpKSUtSR3Fl?=
 =?utf-8?B?UEErMVFueG9UTnpyWXYwYitNZ2JlVnhkbWpZN2IxVHg2YnpySElyUWVFT05k?=
 =?utf-8?B?Y0ZIWGlyZExmRkhqRFdqNnlZNmtqTXlueTc3c2ZVNXFXZEFWRFZseCtoTk13?=
 =?utf-8?B?VldtY0o0SU5uUWpWMzRCaTB2K2dVTVlYWSsrZTBBMXpFZFllOGRqNUpkWlZV?=
 =?utf-8?B?d2tLdTM0d3Zvd2dFMTJLUmF4TGF2MjBUYURQT1plVHBHODN3L29ad1JXdURU?=
 =?utf-8?B?Yk5zdDExdUNRSFNZcGgrRGV1b2E4MnJvWXFyMWx3K0ZiVkUyVHhRME5vQnBq?=
 =?utf-8?B?YmVGTVpMWEhUMEczSXBKQjgvelYyZnRxUkU2YXFFWCtGZm43djlQSDV3Ykdq?=
 =?utf-8?B?aVlSdWZaak1OTHY5OWtaKzV3WnlQZWpxNGFuQ0YxVGZ6WDJhcHBlWkZnOFNo?=
 =?utf-8?B?SW8xbEgwblNrNmFYSE5QKzR2WTFXNmNGaDI5OUFBUG1GOXVCY2NxRWRjV05X?=
 =?utf-8?B?Zmx3c05pS2kwZ1J2bzROUStlTTNkTnlRdmpUVW4zNWNBZ3BpcndnR2FNSWc0?=
 =?utf-8?B?emZzNjVEQVFUTjBwQWpnays3SnpUMkRyb1NxeFRqSUdMTU1qUEZ1VGxiVXpu?=
 =?utf-8?B?NStOelNKZ1d3SVRnR1k1dWFUUkpsSWNLVWIzOHFyaHh3ckc1cVJNaS81dVkr?=
 =?utf-8?B?QjBXSVZQVmtpRVJGZkJEMWlXcVpQQnVQN3dXbm1rUVMyNjhuWWN3b1p1NWxl?=
 =?utf-8?B?UHhXUU5IcXJLazRTc3Nnd1djZ2t6VEhkVFRZN0lFUXZia3doenRiUm1IRkNX?=
 =?utf-8?B?UkxvZm5ZZ0dEMXVIbEVtZEkrTmJaanIrL2tvblRrZ2kwVm9WWWU0Nk1HQ0px?=
 =?utf-8?B?L2QwMmxQNW4xeTAwZWRRK0dYSERYa2JmNEh5ZW5UVkJ5MGZzVVJzMG16T0da?=
 =?utf-8?B?c1AybjQ2clVPWHkwbTY5M3MzWGZyRkRoRHluVkFBKzBWK1JPNGliaFh2ajhM?=
 =?utf-8?B?bEJXMVIxMEhqTGRkMWJVU2YwMjlJQks4MzJIR0NhdjlCcG1FTW0wTFlzaWhl?=
 =?utf-8?B?OU9VbkhLU1NpZjNEdUFCV1ZhaFlabDVpM0RncUxoUlhUSHBNWmZRMFpPTTE0?=
 =?utf-8?B?YjhRTHB3OUJUdEkrNEFWd3JsVDBCK3gxOERKdFk4NmIraFZLcnUrRytmR3pz?=
 =?utf-8?B?eWdhQzhHdUttMjVkaS9BRUhRWEVoMVVsUy9COUFWZWp0NnJndHpneFB2MXJO?=
 =?utf-8?B?c0VmTEVUTVhlMTF1YUR1aTdJY0twbkNEa1AyYW5JT0g2emFYUjFRdHM3Z0ox?=
 =?utf-8?B?dkN2VDZHaFBkeTlWSzRZMmVJYTRIbGNPR1V5UU1XZjhXMUlrbVlzZ2NENkc5?=
 =?utf-8?B?U3hHbHUrOHFVTEVlVGFudUlzVlh1ZjhTaDNYQlBXd3Z3dEV6ZGlQVkxlQ04y?=
 =?utf-8?B?MnhzalFmRDRnYk1vUldlQVVDeGQvWGVtVEJYZWhNaDN4OGV0Z0tmVGh6bkFM?=
 =?utf-8?B?dkZRa1pSUnRxcm5iblQrdWcwWWZDMXVHemZTbFpzQTJUNDhlL2h3UlRMaUta?=
 =?utf-8?B?RHIrMnQ3VTBvVWQ2QVBjUWwyN1pBTllQSTBxZGlBY0hoN0ppK01qV3A0QzVC?=
 =?utf-8?B?UkNqNVpIRitOUmM3VmZpcFNadkhDMEo4VXMydm5JY1NBSDlDbnB4TlBuVW93?=
 =?utf-8?B?Z3VuVlNzNHpLVmU4dTYvajZmcG00bHZTNTdMdm1TaGRJT0tPMlR3dVA3V0FR?=
 =?utf-8?B?amwvTEIrRS8yMGRSdHRrWDZNMDVaWW8yMncvZVhCa05BUVBtajVMMjRZNk9u?=
 =?utf-8?B?TDcwL0tKUHZYTnNzWFBTazNGUUlJMy9ubmNaMGEwRXdKY0ZRaFlaeWJKN1Qw?=
 =?utf-8?B?V2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f918f7-a4a2-4619-06e0-08dde93d0105
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 09:50:37.8101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MS5PL/AlQ18nk+lLaaSNbwMjPFkw0SY8zW4ZxLyJw2C5A4uVCIh665BzOsYbId25R0pEFhgiiYoo6IGzv0/wd7ZWDuC4jAJpXI7O3XaMrkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7936
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Sep 2025 09:50:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7473

Hi Peter,

On 8/24/25 4:53 PM, Peter Marko via lists.yoctoproject.org wrote:
> From: Peter Marko <peter.marko@siemens.com>
> 
> The filename is outdated as its version was already bumped and there are
> also different files for different feed choices.
> Use glob to match any available file.
> 

When did this become possible? I see a new fetcher in 
fb62c4c3dbca4e58f7ce6cf29d4b630a06411a97 ("cve-update-nvd2-native: new 
CVE database fetcher") which is already in mickledore so would be a 
candidate for backporting to walnascar and scarthgap.

> Also the directory changed to CVE_CHECK2 meanwhile, so Update it, too.
> 

This changed in dd249921a5d6b8e472242b57415de3f210dc81f1 
("cve-update-db-native: update structure") apparently, which is part of 
walnascar so would be a candidate for backport to walnascar.

I think separate commits would be nice so we can backport the glob to 
scarthgap too and have the CVE_CHECK2 backported to walnascar only.

Cheers,
Quentin

