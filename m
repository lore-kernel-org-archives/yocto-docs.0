Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712B6C77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 14:19:20 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.34])
 by mx.groups.io with SMTP id smtpd.web10.21056.1750688351648302925
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 07:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=K+JbsBk8;
 spf=pass (domain: cherry.de, ip: 40.107.162.34, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UnxZvhylfJQSEgP1d4RZM+R7RPX+T+1JNAve2L5paPVPmPKEgS64C5cbmy3kfOA+0T9XiW/g2efq4gR47NXu61AjT9baPGhQ9rpiYyeT49HSeb5At6YWNbtWctdPC+V4IkRrXIMQp9PGZpnnzJsO2v7+x4kATalaeVJqcz3oN5NTfARyuOEQw8moOONk3dc+yrCXz+WIEugJ4Z24auGq770nZByIHPIGHe9lpJ6c+kqxl15KuMvV/xNptvRZRDYd01Ta0kk9g1cV2W78sBeDMHg8lOA0sTQGX7snVzQ5GHvideoznZFZ6Ws6hA7JLe8opWaidr9OkOJ1J12C88EvUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7T76WyOcXSEs1ioGjq9cjvx9cmm43wFVIdVK7sr2oyo=;
 b=Wb4R8aZ3uO3YKtaV9l+p62bj0hA9y/wjJLwDdxobt2kHDYEYi7INWh6PDfFMrYTqX4/CUJAchEGbohV1AkQLCf2jjl1+Qo4DjUo5g7xhZg6s824SdNnHKJijMiJhLH2zTBE7OVPxay/TLVnxZ30qQX7stk2c+VZRLUOU83TX2teCwHNi2bX8DD180iYunHvHf/wc4mhYi7bQDugZs1aWQNsmhC9OLvZ0Pi6ZwB8UhIvfZ2BV5sk43OB3GLeoGd5ZqkILDGLGYNcJ6KwsyE8ojXlBk242qH2pwaaJXBcfz0TT99FF8OLTMEs/Epis5LadxrSdzC7jkMbSYnYaCMRyTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7T76WyOcXSEs1ioGjq9cjvx9cmm43wFVIdVK7sr2oyo=;
 b=K+JbsBk8T7HkikLd7G1PUYFoDL04bCzzuhVP3p2NoFejCm6c+1MvHjlUWJsf/hWL6TeVT/xtomNEG6j5prwt2CxKmTSvC02DYennd1rZKPiXIRq8oDbrYNZFlaPDar+vgtFrBXBX8bZ1PsNL+/zXnt7R64e6qI+ZzzNycMfI4MQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8512.eurprd04.prod.outlook.com (2603:10a6:102:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 14:19:09 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 14:19:09 +0000
Message-ID: <c900e2ae-b13b-457e-a39c-d6ab9736dd01@cherry.de>
Date: Mon, 23 Jun 2025 16:19:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: correct statement that source is
 always tarballs
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <9c2b4c83-b40a-4f21-1680-e95a9e238a82@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <9c2b4c83-b40a-4f21-1680-e95a9e238a82@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::21) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: b7da9c69-f4ba-4af4-bea5-08ddb260eb88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L1Q3dnpNdDFZTVhOV3FFaDVtRGxrUkRIazBwNFlrUUVOSUtUc2VWL0ZjL3lC?=
 =?utf-8?B?b3BxNHViQWdwbVJselpxN0w1L1R6ZDZPbEpwM2ZFK1FzY0VzZmNJVFNtTjNV?=
 =?utf-8?B?QmEyMWhVWS8wSzd3RVF6cU5TMllneGVDT1FtQVJ4dE9NQzVIOFZYdTZsUGNP?=
 =?utf-8?B?VE96d1RaSlF4ZUlhSEtkN0RFeFpubysxSHhZTnEvdU9DYUhTQVA1cVc4L2k2?=
 =?utf-8?B?NFh3WCtlY01IT0lFMTk4Z2V1QjRsQjdkS05YL2lnei9qZDFBNG13TytHSVRG?=
 =?utf-8?B?WUxldm9EQisycm10alFLcldDalBXUjRLNGhCWTQ0OXFZSzJKSWwxMS8yeUE0?=
 =?utf-8?B?elNXNnptVkpwaURkWGY5c2k2bC9lK2VEeXZ4bVNOTWg4aHV4anQyR0lSNmFS?=
 =?utf-8?B?bStvSXViNmpreHZmQmp3bWNpMUIzc21YUnZTOENMUXVyMHlpNU9pZGpPSGU2?=
 =?utf-8?B?RStld3B6YjM4b1MrSmpKVUllYk1YaUEyTkVuZzFKWUlrbkdnNDcrWEVMSlZS?=
 =?utf-8?B?aTlXZzF4WnNmcGlENnBwUDlrT0xUcjNmQW50aEtnUUFya1BDVGFJeHVEeEpV?=
 =?utf-8?B?MWFLanJaYlVDQzVpZExNUno2M2FoVk00eFAwQnRFMWVhaDQyR1djOXpxWTND?=
 =?utf-8?B?VG1nbFRHU0xsZlpxbmlSM1dETXN0bzhJWGQ2WmowV25makVybXhiNTYzZWNm?=
 =?utf-8?B?RDd4SVdZdWRlK29jOCs0alhzaHNQdEJ3Uk5UNG5iMkdhblk0YlhkbmMrRGhC?=
 =?utf-8?B?R2xuNFY5K0dlcU9maUV6a29kZXZWUlFoeHRyQXF0TzFoN1F4bHdnaUd5Vk9w?=
 =?utf-8?B?UXR3VHU2L1FabnVLMC9kUDgvYWNpSElXQVpsL1dsNG15SFlRTTB3QmVYZk5m?=
 =?utf-8?B?ZGpLckpFTGFGYW1tMHNTRnkraGRlRzJWR0pOZnNBVG5yT1BwUlNiRVFYdmVv?=
 =?utf-8?B?WUhzSTRRaDNVU3BHS0F2YW1TMVUwWUFFUERYd2IzaHhZUFdpQzRHVTU5OFVF?=
 =?utf-8?B?WGVJTjlXcVZKM2VMOWtpNmgwcWovRUozMWsrb3d4T0hOSFc4ZHJYS2prelh3?=
 =?utf-8?B?V2dQOFlVMzBCai9VVCtQNlNPcUpleHI4d1UwWElGckIyaHIzRlM3eDdoNHpO?=
 =?utf-8?B?eGNQZW1ZLzYyZmdZT2V0bmtQSTZ6ejNiamhDKytVWEtsaVE0SFlVa3ZiNUJi?=
 =?utf-8?B?Mmp3S3pXWEYzT1RrY2w2QkllQnJWeFFSRG9IQllCUWdyM0JJL3JwMkJMT3Ni?=
 =?utf-8?B?K2c4WmRnRHNIL2dwSkZzU1dHQTZpTWJXZ0k2K1ByZDE0NHlwUDQxUjJKNUpk?=
 =?utf-8?B?M1N3aVlyQXprcXpUUnJGamVjdEhJUTM0V2htNkplRklvR0gxV3d4SG95RzdT?=
 =?utf-8?B?b1grcGZaaHpOejlNdHBtME0wK0R2aFg5SnhCTEV3emd3TWFLcWd2SGl4MERC?=
 =?utf-8?B?Y0FVcXV4UzlLSGxhYllYUndWRldUczlvRkVJUEl2d0hiVVZKRzAyMFE0UG1D?=
 =?utf-8?B?ZG1jdWtXaGthYVc5d1VBM2JmVkYrZE5oaTJDZEQwRjVHTTlPKzAyVDBLdndH?=
 =?utf-8?B?ZlgyRWh5d1d5VWdEczYyOFgvZFQ1MzJISUpaUHdEbytmREVYL1I4emp0cG9z?=
 =?utf-8?B?VzEzdTVRVnZJTnFnRTNRSWVHTEx3UkNkaU5GbzF6cWNsVVZOZis4aDlwcVN5?=
 =?utf-8?B?eGNyVVRTTkZwNFJjd2FuaTFmWWYyWTY4QVNPVXBZMG1YVThFbTF1VVFGTUhZ?=
 =?utf-8?B?YjhrejNJRnpZZWtjTy9kUEplNDJWQ0FvMllQYTdjL3V1K1J1emlKSXBld1hk?=
 =?utf-8?B?cVJvcjQvQk9jZ1UyM29hODNkV1Q0c1hMZUUvcUs0UktXcjRBaE4rcktmalN6?=
 =?utf-8?B?bWZHUHlHZHJHdkE5bUwwVzFUcVE3QktxeFZJNmN1VkVwbUNWeUdsV0JnbkpC?=
 =?utf-8?Q?05I26wfHpew=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V21tRXRPeUlPQUR1Z3JEbU5tc0Rnb2ZtaWNKaUhIc21RR1h6L0E3bkk0ZHFp?=
 =?utf-8?B?Z1I2eFJHQ3R2enBTSWpDYitTOFNlTVNNZ1lDK1R1M2N1NjkwdWp3VzN2TW16?=
 =?utf-8?B?R2ZyYThCSGhZK1VHU2RveEJWVHl4OGRzWFh6TDQrb24wR1lqL0JBUWNRYzF4?=
 =?utf-8?B?Y0Z3a0VpSThESklIS3AxRS9JeFUvWXhHTXEzWWZIeHZLVzZpVE5RdGFQTFBL?=
 =?utf-8?B?aWJPeEZDUGtoR1dwMkxtZnB5bFAvbUZhTjFWMS82SGMwRFJDa1p5ZmFIZSsr?=
 =?utf-8?B?bXp5cC9uWnFkU3NhYjEvSDB4VmRNaFQrK1RkSUM3K1RjRWFHUXBSdkpsa1Fh?=
 =?utf-8?B?WlVXT25MN2dUUU9pc0VjNzJlK0w3c3BiU2NnbXJ3Q3orUEhLbUJCcWEveWZj?=
 =?utf-8?B?OXkwMURWd1RocmFjZDVwaDUyYncxU1A0c0o1bFhVeUJRT3I3Rm9aeWJEejR0?=
 =?utf-8?B?STMxd2dqajQxNHMvd2RRR1QzWk9lbG1ycS9Db1V5QzhJUzJlbHJRdkdnVUhX?=
 =?utf-8?B?MVhQdm5wUU0vdmo5R3ZBamNacytsekxDdHlia0IvTTRxOGZaaXFBR25OL1VN?=
 =?utf-8?B?eUJ0SHFnNENyN0xJY25vTTVJNlRzMU5paURwbHdZM3B2NGJ5QWoySWJLYmRH?=
 =?utf-8?B?dTE4dTBKcU9oR2lUVUg1emE3Vktjd0g0cGQ2bEhGaUFFcEdmbXFEY01wNW5o?=
 =?utf-8?B?d0lwNjVjWWVQMUUrZ3hzTXNZeE45c29hUW8xTmZrQk4xQmRDKzVEV3VucUVV?=
 =?utf-8?B?c1lIMjVuZm5FSGJqb0xZVG9hWWgwUHBQbEU3Y1FLODl1dis4YWxSK2pieERW?=
 =?utf-8?B?UmRwU2l1WGZPVVo3ZUVPRk5FWHBoTXBsUFlhMVVMMGIxUHRJOG9LYWt3cXc4?=
 =?utf-8?B?U1VFTUR1a1B5LzBCekZid29DVzg4QVhyWXZJbi82MDlzOGtrbWg2dnl1dEZB?=
 =?utf-8?B?NW0xNTNaVXJJaGdwWEpQRjQ0UzhBb2pCQnNhMW5nNTFOTHdMR0dGRXRwZjFm?=
 =?utf-8?B?UjFnTGtORXF5RGpFbk5kS0F0VExXM25kSTZEa2ZLSWI2Tmt5djczZnJVamhB?=
 =?utf-8?B?anZDbG56cEtVenJ2UjVKU2VFclVPSThxWVRpTlFKVFAxbGZIK3JYd1BIZmZ0?=
 =?utf-8?B?UGc2dGczWFBHcVpvdmI1RnRzMEQ5UFpFbnpxOFltWUhodTBScVNMSjlKTThC?=
 =?utf-8?B?TXdqSFV3OEdFbm5Qdng4bkpDUklmVFI1a1V6U1Fzb2xwSGdWejlZYzNWanR4?=
 =?utf-8?B?VHlqQkUwNk9KSjVVQlBqTjMrVThGZDhOMUlVdXorZG50d0piSFVld2NadXhi?=
 =?utf-8?B?UWk4dVMzb3J4U0JkakRHb1R5WThaNEZaQWFsbXRzV0lNK1ppZVp4VndPUEly?=
 =?utf-8?B?c1VHMkxrR2IvSkNVMGh5NHQ1TkpvSWdFQWZOOVc4c3dYd3AwakNhV00waEp6?=
 =?utf-8?B?NGxjSS8yYkdSdTJxcmlIWFpRL3Z4bGV6aE9IUHh3NmIydzllZFJpR0w1K0RO?=
 =?utf-8?B?WWg4NHpQT1BZSU40L2gyUFZqWWlOMmYyRGFtalBvR3dxSGtYK3puUUsrQjBG?=
 =?utf-8?B?T3JHWnhSUGdic3YyUm81dWlQSUhEN3ZOdkZJVWloak15aXhIUG8xanNWaEUz?=
 =?utf-8?B?c3lTZmQ0ZXZ0OXU0aTgyL3hZb1dyc1F6N0NoMVB3LzJkSkM4cVhBMnByRE9G?=
 =?utf-8?B?MTdWVEgyaTlZbytvWDR6cnhSQ2V2VG1aK0VxM0xLTXIxd1dlRjR4cUU3aEQ2?=
 =?utf-8?B?U1hybU1uMjhHcXhrQ3hEb3pMYmlLUG9kTHdFOThtYWZUNmRmQklhV2JId3pW?=
 =?utf-8?B?SGM2NjR0Zkk2NDkySGJGSDArK25wUnp2aGhHeGppTm5yVTlTRURZTzlCRHVG?=
 =?utf-8?B?N2pFYUkrYzJJTlFnd3JPRXRJSG9EdFE5ZlJDd2FhaERlbHV4KzE4QmVkZnBn?=
 =?utf-8?B?Mmlya2xnQmxyZlVlRTg2L0hzRnBuUG1NZ3kzZXExdGwzdnNWUFVNY1J3VU1X?=
 =?utf-8?B?QWNQcjVtcDdIcktSUXI3VXFpU0lZSjhNZ3Q1anY3bUg0VlU0KzRtNmZVcHNF?=
 =?utf-8?B?WTY4R0ZjU20zUnNZL2d6c25BSGUyMW1JUGhiMlhSQitaUi9mSmhIbVB5U2do?=
 =?utf-8?B?K1kwb3RRY04xUEFCZXBzSUlOL2NnSlkxZFZBV2dXSVo5Z2lyM0tPTVlvd2pL?=
 =?utf-8?B?L0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b7da9c69-f4ba-4af4-bea5-08ddb260eb88
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 14:19:09.5657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pFcrlzw1DaCAPUAVWAYlV1b3ZhufMLQ8dITt4mKaJ0Fj1bNfezE0ymg1RqLQT4/yMiqhCG8X6KGn6XSXbfJ1LMskUJlQ63SZQ840L/vNe0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8512
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 14:19:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7160

Hi Robert,

On 6/22/25 4:50 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> It's misleading to suggest that source is always fetched as tarballs.
> 

Seems like a reasonable change to me,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

