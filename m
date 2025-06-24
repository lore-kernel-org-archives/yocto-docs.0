Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5783EC77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 09:47:57 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.63])
 by mx.groups.io with SMTP id smtpd.web10.4570.1750758470701886276
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 02:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=a4xlYSG4;
 spf=pass (domain: cherry.de, ip: 52.101.66.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7ceAT1olCeaSb1LzykFWiX0YM/ttccr5lDKHNYwwDlnJ5GGpbMMLjSth9ZI50KbupnrqP1dJ/wQ5rMB7siu67wqQdAOTlBoxgm3+DEXBUarD4Et0aN9ebFw7uE6VkFvTQlIZaLRGasm1/gfsgT28kR7XEvLZBCQcF7G3QbvgmegZDPPsARCXtE8oFFHT8KzGcdCcjFzFAQGSWj/jTS4ryS55WsjOjIVTuNcRPiz9rWYudpRZTDuNTRRzalgR4HARy+b2PKIwX2JaTV4e1U+n75mlk/Ngb/wqDoheKGFZ+D04791B31unNwFV56zcpLN3qXEAGzg3X4g72iaE+AhfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHqHZqN5liPELkcvM7mmV77O1fbEihaSILBc7G1KSIo=;
 b=cuLwkcRmMGWMv+gzLsFep+vNE0xuSr6u39YH7GtjKBl0FfYrR3Q7/rMqBXknvTN10EkTBLMW1w/9pEn0HF9l8HrM+C3kLdemxcPXNGzhTG+FIXYN0LMl3PnYBCljo+IHz/9vHq5qkpoNrHAGGHkvpGBcX2nQu3xkfUHEiy8tzgj+XIbIkMisMu9t22qeNn4YuK8elW86i1Q7T4zFdppK8FOEkiohKwpOJ5/9+O+qJ18zD9ChPD48o3u3C2kGd3dD4sO6cKDiXiVohqLg1dnX6ua7BsxU5R/unQc42Z+JAHG5LiEDmeohsxMcr/6Q2yjIWv6jsdJX6yCpFzUfh6um3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHqHZqN5liPELkcvM7mmV77O1fbEihaSILBc7G1KSIo=;
 b=a4xlYSG4PgX63BoM8mgKc6+BGs2heVZCBhqngfZ2G7rq1LAKrU0m6yvMFuR7/3ddTonf8R7QOoiqUhrCQfP2cABzgKb2OCjLZUvWUe9x42lshxsYhEYt2CFVq2ucl6LCdFfnqwnh0DuPykXw6cwSceX3mFBocYH3AFrChVwSaAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS1PR04MB9454.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 09:47:45 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 09:47:45 +0000
Message-ID: <c3579d85-68e3-49b0-8bfd-4b7b7220e9ea@cherry.de>
Date: Tue, 24 Jun 2025 11:47:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: fix rendering of ${PN}
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <27fe44b9-6e5f-9fed-9878-de50ffa72910@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <27fe44b9-6e5f-9fed-9878-de50ffa72910@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS1PR04MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: 513f81b1-0c47-47b8-0cf4-08ddb3042c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bStKSHVKREZ4dHpBcVVRdHNGOE14NmxlMkdZL0lDYVNGdHRJYVBMOWlwVUVW?=
 =?utf-8?B?cHFTdWFFd0JpMFpUSnlWdjRtb2RlbTIxVTBNMHZHUlBQa011MVhyYUloeUhC?=
 =?utf-8?B?cnQ1RWFsTHdmeFBKc1BmNllwREhJU1RGQjRLRE90K2VpWUVwWHgzZ3AzaEhP?=
 =?utf-8?B?czRhbzZiOXFCbDJ3NkVDYTgzYUZSR3NaclBMOUdMcTh3UHJWTkFPaXZkdzNR?=
 =?utf-8?B?UTc1RFdzZHFIeHJUVHFWdGdlRG5DZ3V2OGlSVTNHQlBlWktWM0tpSmtLLzVi?=
 =?utf-8?B?d2RINlc4VmNNckwzcDRCWll6dFdsN0oxalY0NHAvYVRSMmVrTzNnTGxidGFj?=
 =?utf-8?B?L0FreHRGdkVvYkZRblJ4dlZ1WDFCSkt3bjVpaUcrdUpWYlR2aHZVejc3b2RE?=
 =?utf-8?B?dnQyZit3U1ZENUtISjBUeDQyczlvQlZheHkxU2ZHd1Qvb1NBM0dhVDJyZEo3?=
 =?utf-8?B?VkR3VUIvMFd3OWRER081bnFtWmw5YVNZamFrT1V4QndoVG95VkFmZ3pOazBj?=
 =?utf-8?B?TDVFeTJic0FyNDdsdzIvUE5zMmxqZzJVQVcvNHNvcTZOSVBRcDZVREJtelFw?=
 =?utf-8?B?TGFOaHhEOHFxcm1EckJaN2tVd0JWcmJEVUN6d3UzSTE0Vjc3VXpNZ3F0Y29T?=
 =?utf-8?B?QmVPZndFbE9VRGpLa3NxQXNqSWkyWERvU2xRRGxrSWxGSkdDNGRLUHpyYjJn?=
 =?utf-8?B?OFI2N3FzUEFJMFM1VE4ydGRydUc0SW9Ld1QxZW9DTC9wL1VaMG5IUHdTQ3Yw?=
 =?utf-8?B?UUxYSmJ4ZlJXcWNMUUx3L0VZdldPVEczK2QwRDBRTlVqUWdVYThxbzhNczNL?=
 =?utf-8?B?dU5CeVo2RGs3bm51RXp6UlRxUlNIblBDM3BSNnVvK1cweGRIajZoS3FLaDRX?=
 =?utf-8?B?WHcyUjFtKzY4V2dNVHh1RHp0OVJuWjVNd3RiSEdxME9SQU5zMis5ekNKcG10?=
 =?utf-8?B?TE4yVk0wZjZhUVJZdVdadHIwWk81dUpLMmx0c0RwWFdGNUhZekk0eml0SmZW?=
 =?utf-8?B?WUR5ODBjanA4cnR0cTNSS25aQVg3bDJmUXpFUW5qbVQ4RWx0bFo1WThublBH?=
 =?utf-8?B?U3krT1JxeWxtNEdCUFpLTW1DTmRyRFNoUEJWWUdPU0t4U3duenEvYzFQb0FT?=
 =?utf-8?B?QWtvaWxDdjNKdUFkVnhwNUtxSE5BVGNCMDBEblhETkgvZ3lYQ2tNZzY3K3ZV?=
 =?utf-8?B?NUZ2N3lxOWVOcW5LTU55bm1KdWtobkltRXJSTlVHYWJkL01vMFdXODE3SVpS?=
 =?utf-8?B?Tk81NmtmS1VuTDdMWnRNYS9GaW5iSE0wNHNCUktOakNtUHBaSnBSRnBEcEhQ?=
 =?utf-8?B?RHgvTDJNSjEvdVBYSnpObE1kWWppbTAwZWZWMUcvWVRub1pjMnRRWDRIMitw?=
 =?utf-8?B?MTRPL0VIU1hKSE9Cdmw3QmhDa3FMRHVkOWlBeGdzS0swUEFqT2FWcEg5OERZ?=
 =?utf-8?B?L2plbHVDcDljNnEvUGtCRkxaNHE0dVZOTzhJdlhueklXbGkrYVdRUGdFSDQv?=
 =?utf-8?B?YXgvaVNHZ1V3WEV5WEI2dTdCdmJWMGFqNFJWdFNaMTV0bVp5d2JFZnAvWEhn?=
 =?utf-8?B?bUdkcTVFR1BuYmtZMmlYQVliSkhtNjNSSEhXWmJuaHZDT1drS2ttcUxLUE5y?=
 =?utf-8?B?S3kyVWNJbzhuZzd5dU5QTzlSMEdqcHpVa1NwQTg4SzFTR3AzT3IzakFhRUFD?=
 =?utf-8?B?MVl2UzMzbDQvRHEyRHhUTzNOb1FqaVoxWFp6YWFtS1pjOHRnelgvUjZHQ2RJ?=
 =?utf-8?B?TlFmbiswZEIwZUNTVGFucEFSTldlZkV3Z1VxQ0x5MmpTNU0vUEw2cmR0TEty?=
 =?utf-8?B?UlBDdnl2eXhGOUlxTzRxcno2alRRUGFvOUxObXplVkt0Rk1jTmZUMzV1d0tP?=
 =?utf-8?B?S0pIN1MxMGhMUmJ6VFNvVG9RcWw1SmkvTFBYUHBXTGZudS9XbEdpN204Rm4z?=
 =?utf-8?Q?4AfjcXnzBmY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QnFqbkdXeHhkcjJBMjQ1UG1PNFZsRWhoVVZRcFZCMmhDSmpwVjJSeWlyb0Zo?=
 =?utf-8?B?Q1BaV0Q0SFY0NlpOZEY4c3FScFhVU25aeUdncUVneHF3R3R2Rm00MVNRWUlP?=
 =?utf-8?B?bk9WdTc0OFFEb2ZaQ3czdjlUc3plQnRJYi82aDh2L3NkaDdnU282bzZOSTJW?=
 =?utf-8?B?c3FLZWV6bkc4ZytVR0xlN3I2eXEyQVFpd0x0OWhOVkJLakZlZXNFeTI3Sk9L?=
 =?utf-8?B?aFhFaldRLzRHUWRSN0JLR2ZzTVJ6bEF6cUUvU2FHSlpBVk5aMFB2SUpjY1Zs?=
 =?utf-8?B?dDd2VWMyNWI2OWQ0NHlaZ1JXTEN6bWc2ZjhMeS9HcWQ2eGNPdWtZT2R3SUhD?=
 =?utf-8?B?cWhzK0ZSRU5LRTR6SGs1eFBwOUlIV2ZlYTBuM1FkT0YwYU94b3F3U3V5TTZk?=
 =?utf-8?B?aDNJYlZmb1hVY2l3MGZYV2ZZcmtOeEx0S0NmanBHdWJOa0cxaDZPU1pFa3BD?=
 =?utf-8?B?amdDb250SllTT3FjSXVBRCtLZnF0K2dXN2pBRjVOa1dYM2VUMURWRHZramlT?=
 =?utf-8?B?MitKR3Q0QUVpNU9MdEVtTlhndEp5U3FHOUIyY2hIVjIrakRLSU8va2RIb2Jp?=
 =?utf-8?B?VkhPNFRySEpJTWtOUXBiZjdtQVRsdTVLNWI0UU5wMTJ4TCtHZnd2dWxaTWRV?=
 =?utf-8?B?ZnQrMU5nNndYL2UyVWRFN2tTb1A1emk5amY3UVFkTW1xYkk2RXdzTUFSdkhS?=
 =?utf-8?B?MmhETTlmMFJzUHpPWC9odHJJZzByeDcwckNwLzc5YnFqNmUvWjBNTk85ZHFR?=
 =?utf-8?B?Mk0xcy9KNWtPQUFUUXQvaUl5d0NDU1JaTi9RdS8rUDFtMW9pcWR1M2hleUlS?=
 =?utf-8?B?ZVJvbVN3VnMzazRobnladFQxaVJWb3FZaGZuV0kzRGo5eEJRb2d4b2x1SWxY?=
 =?utf-8?B?eU51bWpYcWhCSWdob0VqVzlvZm9jMjRhQVBEYTdRb3VoeWhzaHVKWnByM3I5?=
 =?utf-8?B?MXI0Q05OWDVSYzJJVjlDenozS1g3WitRZUQ3ZlFaeXNxRmZrRDNzVHhFMEkw?=
 =?utf-8?B?a21jQU41eTBCZ09TNnRMdmcvSS92OUtDbExYem9zZUFZL0l1MDZHKzBLQWoz?=
 =?utf-8?B?M3lDZXpZa2xxNCt4ajIwQnc2MnpzSVVJRVNzUEh1U0QxaEhPRTVKVXE4N20v?=
 =?utf-8?B?ZFRJc1VYVGZEMlBZWGQ0ekcwTTYxa3V1cGpJU2RSWGw2YzMvWDRSLzFKT04x?=
 =?utf-8?B?UW8zN2hGK3R2WmxQbkthaGhLM05BRmRlYzg1ZFhqRkFRZXUxbWw0Y09rcWV0?=
 =?utf-8?B?UDBrazgzR1lmN1V6b0QwL3Z6MUoyMkp4R0V2elhGWENuK3hXbHpKZ1puM2xp?=
 =?utf-8?B?MjlsSGtoR2VYNGk1M2toSzJ2U2dGeFJySkFRSUpGUUYyVHBWbWFJMWpDdU94?=
 =?utf-8?B?d01UeHdVZmhpUTZjeUR2bDRBUWpDbkQrcDRxOUFiTHV6M1VTaDV6cVc2RFMx?=
 =?utf-8?B?eENzMlMvakVTenJEaUJnRVdYbk8xZElmWi80NStIWGZWMlRMTmdlNXUvZGc3?=
 =?utf-8?B?Rjg4L0FVSjYxN0k5WCt0N2l1anpWcFBPWFVNbHdsMzFzcmZ0ZGFCeEpVVTJV?=
 =?utf-8?B?RjJ1WTgwMTRpSWZRZVVVYWVGdzk2NjZXM3pRRlA1a0FWS044UzVhTGgzUUtS?=
 =?utf-8?B?TmJjaVNBZnpOaTcybjA4SFRhTTAybm1BNUZNTnhnQ0I0R1I0NjErT09qL2pX?=
 =?utf-8?B?eGxNN080OFgwSml5Zm1KZUQ3L1pSaUxSQVd3dTZYMlJGMHoxdG43b3pseklD?=
 =?utf-8?B?dkRCVGwvZzQ3UmhDOEh3MWlGcVJSbUY4L2NNK1ZUa3prQlE2MGdQQUE1cFpY?=
 =?utf-8?B?MDliQVZsczhUWjZrR1VnbUpLN3kxWHVQWGJnZjluNTdQdUtZSGFFSHRVOS8w?=
 =?utf-8?B?Q0VNUU1CNkJ4S2JXTnRjbWQ5L1FTbi9NQzdzZ3Y4aXBqTGRwNVNld1AvNDR5?=
 =?utf-8?B?TEttVlNKMWJoRk1GdHdnL2E2VDNZWUNsUmFzeUFUbkV2cTJZaFNwWW40aGZM?=
 =?utf-8?B?WVgyQlYveDlheThIREJ2VWNnaWpwYzg2Ry9xL0h0bXI5WTMyV2ovSzJHNUhQ?=
 =?utf-8?B?RTBFaFBCVnZLMks2U0ZFaExDck9oR1lRQUpPRDlNMjFpY0hDUkhNQkN1TzFG?=
 =?utf-8?B?bGtkaG5ONkZGT0xIM3J2dTNqNWxuQ1YreU93SksyZjhOWVdtc2Z0L3hIUVAx?=
 =?utf-8?B?RGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 513f81b1-0c47-47b8-0cf4-08ddb3042c02
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 09:47:45.7091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+AGRBoK+BbunCM/6Y81px33Ny8zCVKNeZAf/HTWnPrcbVhag79Kj5Bbmi3qWi9wH2psdscBVUYjjBoB9gu2wlN95hmtbvCR2YXgTQwIcvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9454
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 09:47:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7202

Hi Robert,

On 6/24/25 10:41 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Current markup generates italic, not monospaced.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

