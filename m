Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39321CF45AC
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 16:48:55 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37270.1768236532788222076
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 08:48:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=NzFhbPuq;
 spf=pass (domain: cherry.de, ip: 40.107.159.32, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rhw9TQapRZmaJUvgUrHGiltHks8jiJR5WD8RjRXU7onvaffvQUKetFp8JSAKcGKb1r3r/5sr6t8UHytEcDGyYZ3wLOh9AhXqMPyx9+q99e01S3G5R58D0yso5PFE8Qc4T/uHMDDmNSKGzU6sXOdwRwwr5YFrX9oK0n3wXhOZIYkJ2CJ6ivusA5SxnL4GI/dDDcmCeVIWtg5C5+5AgPHEFH2CaYBC9CVycoRQUaxtUxbCDGq8FeLbF82xxSPHyZxmMCeFdMqE3wmiggxv/NmxdY/WxnwZ+nNmSqInRbqOnUl35dPlfGy5A6StzIbrlMc9BdMuiLlCBBkG9lTP7efdKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WF0wuX1n8a8fv4hk8UaM5cfc/s2mOrP49j1riiBBMEg=;
 b=WaLmjFmdslsGpnkZugxtdJEovgu2GDvzI+wCjRJyWkX4/2+xr+PHsROjE4/qOaGrU7BjWB1JO6Xag/cDv2Mzyms/NZpJrOXzQYncKvsXa+hWE9xt7/LgM7Gq1zdKR+74SMxaYScoqD5bgxUYQe0LJwXjvtojhgs69c0cfc6gxaZfkXrdnvC4PuUdMNCg/tc4JocbCR1FCmOEBllO0swWdy2b1hZ363N697Zv2wDPK5T5i7EJOAPY4DYi/k2bS/urz0KrphH7GkW4ZGlAAWNC16Yvknl1a/neN/DFQLZnDJ1HQgE9bBUNCLDQy6SYoT1pAQsGensLThCNTS4NzF5nqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WF0wuX1n8a8fv4hk8UaM5cfc/s2mOrP49j1riiBBMEg=;
 b=NzFhbPuq8z62MJKEbFQdXf02GEWwzYjEwuqy3XbrYutYP1lwOcQo9y3/e8wQe2QNwmZ8e4XfG49Hld+eICbvaIJRWUwlXWnUnxfrF+/45TUcq/RoDkGb3IBbDusSHXE3KfEo+0s6fYefHfZ0Te2VhemDeaaQYeERgFxKV7d8RQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DB9PR04MB9867.eurprd04.prod.outlook.com (2603:10a6:10:4c0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 16:48:48 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 16:48:48 +0000
Message-ID: <e118a38e-0e45-49f2-9010-01c1a4d7d1ad@cherry.de>
Date: Mon, 12 Jan 2026 17:48:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] why is "configuration fragments" in monospaced font?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <7dbf2502-1403-3451-ea27-45aeae758032@crashcourse.ca>
 <4c7492bc-177f-4bb4-a8f4-cc19323fd242@cherry.de>
 <d59faeb3-8e61-7023-cc26-3918de5f0ab0@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <d59faeb3-8e61-7023-cc26-3918de5f0ab0@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::10) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DB9PR04MB9867:EE_
X-MS-Office365-Filtering-Correlation-Id: c180cc23-3025-48e8-3f26-08de51fa7531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y2RZN3VOVSsvb1R1TE1tNExua2VSVFNvYWVETm5KMllTRjgwM2NzSkZwRUUx?=
 =?utf-8?B?MTVkZDRMek9aaEMrZnFVTDROV0RhVjQzUTVLYUM3UUNYeTBaL01uS2cxZkQ5?=
 =?utf-8?B?YUFTWkNUbndyamhGU0ROdWFENERXY0R4eWJ5T1JRZXdLTFErcmRDUVJwYkhh?=
 =?utf-8?B?anJKSHh2ODN2akN1ZXY4YnFEaE1QT2N2Q2h4QXY4V3dyekx6Y3NLVlp1T2Vp?=
 =?utf-8?B?UG9FN1NETzVWdW5oUDVzdWcxRVdoVWxOMHFibXB4M1FrN0w0SHBycmhIQjd0?=
 =?utf-8?B?OFRySVl3L0xwNmFXQjVPdG1LMThOSHg0N2hIclhBL2ZkL1hhVmdGTXZuRzlt?=
 =?utf-8?B?cG9ITWJMSXZDeEovd3F0c0VLSDN5Tkh5YlNpSS9hdkRaQmZwemxZb1ZTV0hJ?=
 =?utf-8?B?R0k0QUN6c0NyM0JqbXhvQ0cwNXBrWFFqcEszS0RtNVYvSzNzZWw4a0FsZDJP?=
 =?utf-8?B?Ym9JSVNmS08zMW1WUFVJTmdDNTFpeGZvaTVwOWYyQnFibnR1U1NwOEhNZXY1?=
 =?utf-8?B?enlVbHdBUkJtYTVVRUdjNExMVExxcysyZ05LdTNUVWQ0STZpZ25VcDVHbVpo?=
 =?utf-8?B?Rld3d1Y5VmI4ZzJkSjluaGNJTEtDM1hvTDhIVytVbVBRUmR5OGFMdktxRTU1?=
 =?utf-8?B?SC9TZEpLTzBBN3RhUFZzVkVkOThIcHpva2VQM1V2ckhGaHhOTFh0VjV2bGZy?=
 =?utf-8?B?cytxRk9yMjZ3Q2p2Nk9uRTdTR0pTb0p1RHhId3FPaGJEYVkwUFB4SzdEcmhL?=
 =?utf-8?B?TjJ1c1F5ZkRQTFdINFpWdXFxK1NBTnVvNjl0T2lpbEdzTW1aTlFzNy92em1n?=
 =?utf-8?B?SEFuNkNFRkpRKzdqTHRTWHJwUmNDNXl2ZEtNR09KVlN4dGFwdlhMU3k2ek03?=
 =?utf-8?B?UGRhV1Y1N1AxWlAzbEs4WitOZFdMNjFscEI3RXVVUlZ4QmtPUmxHMC8zcUFN?=
 =?utf-8?B?ejNsdG4wM2IxVzVabHhEc2xMNXR0TkY2WHo2UERwRWJqS3NhVHN2WmxDNTNv?=
 =?utf-8?B?R09oRllLalZYSmdjZWRVUzBSNEdQU2hVaDVjb0F0N3A4UE0zUUZyWUlDNFB2?=
 =?utf-8?B?M3dCMWsvL3ZlTUJRYUhvZUxTMVQzTDBlR3ViREt1WVpTWXFzWDM1SzZFcCsx?=
 =?utf-8?B?ZkhCcWtSSi9SVnFtTExGdGRxSjlScmw2dVVhNFdXdjBNRlYyQ0pVK213SEFI?=
 =?utf-8?B?ZENzcGQ4MzdjaEw3VTltcXA4bkZaNzRvMWY1MG0xZFNSQnVrbWJLWUE2MkNo?=
 =?utf-8?B?TnlzRTVZK1RBdHVNZ0lXT0gvR3l4QTVsNThta2QvM0ZtOEtYTVdmUW5JVWhp?=
 =?utf-8?B?WkQ3dXBjSnpFRWJiY2RwNm5jbk1LUktHS2szcW9pNDdoVnJIWXdZZ01PN1BK?=
 =?utf-8?B?VXJ0VGdxUlBlQU96ekZVM3FWaXp5QWVKanQ2M3ZwMitYa0w1ZG1ScUdXNzVy?=
 =?utf-8?B?aDV3emRlUXdNanl5bXlZbGcxNldLVVpKbmlRQitiTmRFRDF1cWxXbmpTWGtN?=
 =?utf-8?B?ZnQxZUI2dU9sNGUwRVdXdDlDM3U3bmJaeE5janp2eDJLVXFDU0xsbjJ6SWR4?=
 =?utf-8?B?V3phRy9EaVVMdTBNT0lZbVY5c2RjdU1Ud205MVlucVoxYlJCRzZtSFpSVEJS?=
 =?utf-8?B?Qm1Va1g1eElQZzBoR1VDR1hLYW1vRld1Q0tpQ3Rhbit6WGZ4R21qc29qS01B?=
 =?utf-8?B?a29UNm1DM0RxUFVmU3I2WVpDOFV5WW0rSkRUKzRZZFUrQllmZlYvMDdwNnpL?=
 =?utf-8?B?ZVl4dGdkdkp2d09pZ1R6d0RjeVVUNGxEbWQraXJ1UE01Wk1kaWM1czRQK3lX?=
 =?utf-8?B?Mko0ZXRPbTFjWldlcG9VclJzWi9idVEranVvWHRMODB2STh6U1dxT0ZwVGVH?=
 =?utf-8?B?QkpPL3FjU0VNRHhCTFpYazFpSC9SeHlnOFBjV0lCaUN4WHc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SkNrRUt0S1FxV0s3NHdFWEM3M2tSTDZpMUNNTWV4OGtTYzhPeEJDSHlCWjA1?=
 =?utf-8?B?MVRPcFlqRzdOMm16QUJ1NTkrUm1TdDRpYmIwNlgxaWVKOEhtbHlDaDZNYVV0?=
 =?utf-8?B?VlFnZDM5c1k0dStGcksxM25BSWhYMmkrTVRJdCt2a2Ird2Y0QStPUURsbFQ1?=
 =?utf-8?B?NjV0UkFHbnhOMjJ3cFJFOTJjVnozMUZRdlJRU0RaMkhZZXZxOUtaVUhGbUJ5?=
 =?utf-8?B?REdNNndYcXgvZ2NQNVhuQUVKanI4aTdFb21NbGtXdTBYV3JWaDRrcnUzdFBz?=
 =?utf-8?B?dUpSaGw0LzVQSmROa01zVWI4N3UzRmxVRlZjQTc2bHc2Vjh5WUs4di9HeUMx?=
 =?utf-8?B?cm9lMUZXcmtqMElobUpYbEZnZTB1QWlCOUJpbkkzSkRZQnVvTXd3aHdzQVY1?=
 =?utf-8?B?aW94NWN3RXNwTnVCK2c4UmxodVRDUXduYmY0Q1JvMW1PTzZCOEs0VnpPSFBa?=
 =?utf-8?B?SUpFWkdQVXU5RzhmelJLak9DcUpGcE9jdEkwTmVTRUdvbnZCOUlGL0IxQjNt?=
 =?utf-8?B?OTFzTWhqVTVzcWY5Tkt6cDA5SGxzK3U4MmovcnpKV0RkYWh2a3VXU1J0WkxI?=
 =?utf-8?B?T200VmdvS3FtcDNZWXloZ3pHNTZiQnR3SU9HNWwrMThXSFp2S3h0ZHZzN3Y4?=
 =?utf-8?B?L0RQOHhNZ1F0TTlOd0w3MmIrZERhdGI4cnZ0bVJ1eGsydmJ1SE1qbkw4cGJU?=
 =?utf-8?B?anNaSzZONlNpdGdjNTdWK1NUYnlxWldQNG9ac212Qmk3Q3gvcWppSjAzNktB?=
 =?utf-8?B?RFdwd3ppcUZBNmJCYXo1empaMkFyQUhadUdyYmViVUVJMDUxd1NTMXUwdmxX?=
 =?utf-8?B?bWlQeFA2TEo4RnJoekNDMmg4RmFxdytFaUpNeko1ZG5qWFQ5SmNrK0JiZFRn?=
 =?utf-8?B?RUthOC90b0VEMkxDdDFIYS9DMDU2VVFrS2dqVjJWODY5UUVORCtzQ29iaVJ4?=
 =?utf-8?B?UWlLSjJ5Vk14a3BTVnBiWjlUZTN5NklRYjRIZDN1VjcrWU94bTdpckVJcTZC?=
 =?utf-8?B?MXNtTGtKUVZRbU9MRzE0aFFndlc5S245QTdCSTJOdTJXWXMvaHhycC84WjVF?=
 =?utf-8?B?akc5VmJiQlNnWFVWQlpJM0FZR0RmcUVicm5kRnhBcUVkVVBGa2g2SlVucFdN?=
 =?utf-8?B?cE04aGJ1Q3JjT3VDQ0RWdDUzbEpkUjVxdXk0VTBHaVQ5dkVTMkZvVVRYUU9M?=
 =?utf-8?B?bFhycFMrUllZRi93SGhERE83a1g2SG1hMlI3aGJRMGxlWkhFMVVxalFYamRT?=
 =?utf-8?B?VnNQQStURWwzNURuNEFZUUZUczc4T0FPT04zOER4dkQ3VDduUGVNMy9BTnlL?=
 =?utf-8?B?Nmc0VXhBS1ZsUU9iY1hzQUQzZ0hLMkhvOW1mL0RjcDZvYkxkNTIwZHJuM2R0?=
 =?utf-8?B?eDB3d2NrVDhIaityTUlFZDZNUHA4SjJ4VmRjTmRyemQ0TVozL2hiVmRmNFFl?=
 =?utf-8?B?bjlMNXVpSGRNdEYyTk9UUi8wNlEvTDFCV2tnRWNSL0lWdEx5K0ZsVWM0SnBS?=
 =?utf-8?B?VndTQ3c4ZjF2aGRsOWpodUtKbXNNTW9mSXhwdExSdVZ0SjBiL1FWMXRGTzlN?=
 =?utf-8?B?MlFnS2F1SXRQK2tBSVcwNmdQK0dQVnVIZHVkTitiZUU4bHFlU1dzUldCZlN4?=
 =?utf-8?B?U1pFK1dTYUEzc2ZsWFM2S2JzQkdhT3AyN09iNHdQYjJvUVhJZkRmV21oOGpx?=
 =?utf-8?B?RE8zbmlUYzlhbjNsNStBVTEyTUlzdnF3b0EyUVpKSGcyTEsyTU45ZGxUYkdq?=
 =?utf-8?B?aitHeG9IVDFwVVdYNjFiODBSbUhXNkdPU2Q2U0lPZ0RWcWtRYUFEV1U2dStF?=
 =?utf-8?B?Tm5MYUw4cFc0SElJMGFWakJmbjBkcmZNK01RQVNtaFY1OUlYb2VLVFhSV2J6?=
 =?utf-8?B?MExaSVQrbHN5dFdjRTd2QTAyWGM1Y2pEbXFjRm9Yb1lycDlHcUdiaEk2SDZu?=
 =?utf-8?B?d0N2OEFQczc3N0NSN2lMVjdXSGpNTit1QmtzT2tDdFFpbVozOUtSdmV6SGFz?=
 =?utf-8?B?M0IwYjU4bDc5d2RGYmozZVlKUERFOXRRZjU0anA5eE5LNmZJNk1jcm42T0tF?=
 =?utf-8?B?RmtQckEvcVZRVklNSDFuSVNkUHh1MUsrTmFmNUtIcHNkbk1PckhxQ3c1Ui9Q?=
 =?utf-8?B?NmlZdHRqYVppRml6S3gvN1M3dzNna2ltNlRwR0hGYUdlZ2VPUjVyanVPanEy?=
 =?utf-8?B?eVhyekF4cVJRT04ranlCVVg2Qk83YmtSZWxCRlJxdjY4TXZCZHBERTFxaDNa?=
 =?utf-8?B?RkdoWHFXdEVoTWhWV1JKOUVBVkx0YzFXaHVNWXhhSGU1N2pYakFxUE1SZnVH?=
 =?utf-8?B?RzByQ29ETDJvdkI2bm0yK21wWWc0d2Uyb2ZLbUJyNS9lQ2VvSTlRdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c180cc23-3025-48e8-3f26-08de51fa7531
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 16:48:48.3838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qJ1gImq1RZqZdpDjygpZHHwOYVqfZqvpKB2w8w5IsgYd7HnbPtKY4scz/3V7i4CEVUazeZ+8pqVG14fdyfaZ5h2LGwo4RvjebBFAE84Buk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9867
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 Jan 2026 16:48:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8469

Hi Robert,

On 1/12/26 5:50 PM, Robert P. J. Day wrote:
> On Mon, 12 Jan 2026, Quentin Schulz wrote:
> 
>> Hi Robert,
>>
>> On 1/9/26 12:45 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>>>
>>>     more nitpick ... here:
>>>
>>> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#sharing-functionality
>>>
>>> last line in that opening section, why is the phrase "configuration
>>> fragments" rendered in monospaced? is that meant to be an actual
>>
>> So it doesn't feel left out with addfragments right after being monospaced
>> too? More seriously, I don't know, but I wager the intent was to make the text
>> italic as to highlight that it's a two-word term?
>>
>> Would you mind sending a patch for it?
>>
>> While at it, I think it makes sense to modify the "``addfragments`` directive"
>> part with a link to the section in the docs. Maybe another patch to send?
>>
>> Also, this pertains to bitbake user manual, so I think it'd make sense to add
>> the bitbake ML when asking about bitbake-specific docs (both BB and YP-docs ML
>> that is).
> 
>    I notice you just posted a set of patches to fix a bunch of the
> references, but it also seems that there are different syntaxes being
> used for some of those references. What is the blessed way to name and
> set references across the YP docs, and the proper way to then access
> them? There seems to be a lack of consistency.
> 

Can you write down those inconsistencies so we can discuss them?

Cheers,
Quentin

