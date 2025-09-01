Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E31CA1002
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 11:35:39 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.25])
 by mx.groups.io with SMTP id smtpd.web10.49093.1756726529805462518
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Sep 2025 04:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=UyMOib2l;
 spf=pass (domain: cherry.de, ip: 52.101.84.25, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXxg497KNUGgVqE0tHzFLNTNJZXkNFFJG2Rocs4xSSexv9RwosYeSRM+ptNryi+g1yLpAGOqNsRUYqXxXRVzDtI77UIdcCRGXYPH6zlOudryoUu5v3zUQcmCW/J4BwGaFqzedek5zhqAHty0SRYGX0kjjYlO9lKw3PAQ0T4pQwDvwNEeZQDGNOe+wbdoMI/Elrw2rk0JYgdH5xZq66JvZml1pBUXNi4vI33ON7HmmGpCGWJUQJdEqc4IxvWVE80UzXlfAQePCXo6Rxh3ShOxo8Zm++mZorFuLovRon2F6igf2I+ZvudJBfwG+c/mWvCJmEYbrqyxH8kEOJXXOgA4Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Op11F+eOvfVK8lVSlCTASGvf6XMFdwrNLSggq1LSBO0=;
 b=g1U9evaSaenYH0DTyokyxWIoL9kNejVNSWCykHuNTBbfRKWKQmSpcleg9lQudNOOeNMOnk4SflOJGVjs/C/ILn1MLn8M8krRrl1oGqbwM+X3bNoWEiTlvCcHVKAViKlEcOZq+C/wJK74AUGox/KFdGYN6C2Xwzo7+3/nnPjQVHgtiaXvfocw0Ywoue7xaWillmN4F1nedOrFvpOVHt3uWzSf+t9+LuKH5sDmRRPIfSm7Q//8mV9lGte48bWUWVdS7Mjoa2S+RebbfI16Jt+GyOWPreKmSDIg6ddHX55kbFJU4F+zOZixq/ff8KltWXYAaBwKMaFAYU791p5If6IWmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Op11F+eOvfVK8lVSlCTASGvf6XMFdwrNLSggq1LSBO0=;
 b=UyMOib2lyjmAXiGUIrEggkKZmOMaomq5UNOEZX3YqQD7N0l/iNQM9MDajbaXDH+kN+drmwW+hdglXl0MgLxVrv/GUMTybiRdyvCgIAB9two7Ht+DQvxqiJ4ezI/wRbo9tVRhrijsfTc+XNnfHpofeb3AtiVSYtPUPF3t2bJGEsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB11023.eurprd04.prod.outlook.com (2603:10a6:800:25c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Mon, 1 Sep
 2025 11:35:23 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%5]) with mapi id 15.20.9094.015; Mon, 1 Sep 2025
 11:35:23 +0000
Message-ID: <d790220a-b0bd-425c-92b4-9e6b9a1c3293@cherry.de>
Date: Mon, 1 Sep 2025 13:35:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual/security-subjects.rst: update mailing
 lists
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250829-update-security-lists-v1-1-42d02ed2eb24@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250829-update-security-lists-v1-1-42d02ed2eb24@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0392.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB11023:EE_
X-MS-Office365-Filtering-Correlation-Id: fcbbe795-22e5-4440-92ef-08dde94ba311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UmhtMjBxUGYyS3psak5rREZTLzIwZi9jdElLTVhPbWdxdHRUSXk3UXhrR2M2?=
 =?utf-8?B?bEZta0l3eERRNmpUL3BKVEZ5YXpwb253ckVraDViejFrdHZoS21QTnUrS3RC?=
 =?utf-8?B?dVk0RnBxd0dGam4xUTg2Z2kvZHRaTnVCTUw5cnZoL01EMFp1QUx5Znk1ZHZV?=
 =?utf-8?B?SmRyak1wd1hnOU1yYUYrUDhHS1lZMGJWWHIvb1VsOWx4dzRGSWxhL01DSDBL?=
 =?utf-8?B?elBZdFkxazRPWHhFcktyeGQvNGg3NGpNVzZGOTg2Wk5jU3ZtUGt5SVRuZ3Yx?=
 =?utf-8?B?bEdiSjkzSnFYRmF0UC9MTnlnUUNWQjV1cXVuK2oyQmVUYjZGWE9TbFhka3Fx?=
 =?utf-8?B?dlFnNGNlYlNaaDdoeVpVSkQ2SyttMERkblhwK1YvcFhBYjNGckFnM0tRUGZ6?=
 =?utf-8?B?bDhleGtDL24yeGcyblgwSUlzSTNKcVBQTFh4TTJJZ1JKcmI4SGdYdUpOd2tL?=
 =?utf-8?B?OXdyRUlZZUFvamZvMDZZcVdmb2x6WjJHSmJIbWppMTNsT1hNNXdlZCtNdGw0?=
 =?utf-8?B?Zm9FTEdjLzV2SVhXYkVHbUpLM2tDTkdoVFZEUmEzLzM4SGRXbjR0RDZ1RVAx?=
 =?utf-8?B?Z0MvZ2hxOW9xQmxHNzVXSEdIeWVPU284enZFSHpCdTFNOTNyZUJtd0YzQnQ5?=
 =?utf-8?B?RmVCMGN0bGdEeEc4TVc0UUliMXMzSzUrSE5GdWNhejF5Mkt6c2JzSHRkaTFw?=
 =?utf-8?B?ektqVHNUT2xYZ2c1M3hvZkowY3dDUHJ0eU1EbWZ4ekVhZTZXck1yMG5uUkZl?=
 =?utf-8?B?U2RmTUYyLzdZUXhMZityaEUrMkJBYzlaU2hwMFRjNVZPY0cvMk5LcmRMYU1S?=
 =?utf-8?B?cTRTc0J4Y1huSWtxV281M0JpVlI0NkhVYmxLQUFUa29yK2RiMENFbDM3U0xx?=
 =?utf-8?B?TE5XaDV1emR0ZFgvNjd4ajRzMUxteHVHaWpoVldHYzBBZHgwRk1DdmJ6M0d5?=
 =?utf-8?B?MHhFNThDTVhZZ1ByMjBzSHl6NlZ0UUpicmp6c1NPd1k2a3RqNGFxRnQ0Mjlm?=
 =?utf-8?B?d1dmem0rWmJIY290V1BnVVpHa0ViWjBNeUYxbUcvSVVrd0pDaS9WM0tpWVly?=
 =?utf-8?B?RzZwSzlNU3ozbVhwQUtMaEdsT3ljbU41WHhiWSs4WGtKTDFzZEtEMEJqWlBp?=
 =?utf-8?B?RlUwc0c2cC9MRjJHUzFOVFExU0JKeXhZQld1YnNzNVVKVHAxa01XaVZjQmJV?=
 =?utf-8?B?cVlhUDlwNG5mOFh0eTZQUXUybG9aOGNRc0FKZ0Z5SVhibEdFb2JzQVc3TDQ0?=
 =?utf-8?B?c0hvVmpUY00wbThJQ1hNbWZDb2prYWw5YjRrbUJFajJoYTZNdU9zbU9sK29B?=
 =?utf-8?B?OWQzM3ZKZGJvSjZvdFR3bHVCR1dhTmMxU216V29YODV2VUxvUENIZ1dSKzFU?=
 =?utf-8?B?WFMwOEtQdFIwbGlxcWtrYTJwNEx1MkF6dTZRWjlxWmcyZ0dxSXRMM3ljNjdn?=
 =?utf-8?B?NzFNSncrSGpuU1NpcTVlVzVteFY5QXZEVlI4NVVuMG1FbmFtemlyemROWEV6?=
 =?utf-8?B?L1hRTDIvbXowSFZyMHh6YTRsVFhoRmp1bEg5MUVUZjFUMjZDNHVvRjZlendh?=
 =?utf-8?B?Z0w1ckp6YVBYMWNIQW9iSnZvNkx3cHRpOUtCUDFqa2FIbHdESVNOUkhmc29V?=
 =?utf-8?B?RFdyWHNKMjFxcFRVUEtNS1MxQkFLMngrZmtOVjVEVWw4NllZd1hnMHc2UXJU?=
 =?utf-8?B?RDJSb2NnLzJUMlV2NmQxcklGY29IYThsdXc0Z25XT0lqYTNyOWIzZXpJOG42?=
 =?utf-8?B?cDVYaEZBSTNSeUVqYlRxODhYVUNpVTlvMnlSdXhJU1o1S0N3WEsrdjB1VS9s?=
 =?utf-8?Q?brg7H7TavwN8OoRrW/GaeNz2VzcWXOdyQgu18=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eFlOZlVwSXVlek9qRldRNnlRK0VDajZzaitaRVBRaU5KcXh2VTJvSlpWdGpT?=
 =?utf-8?B?MnF4Mm90bXJYdTBxTW1Eak5yODNlZ21PMW9WdWczN3JJUDJiRDlIdmJFeEVL?=
 =?utf-8?B?cDR6bTFuaTVBbjAwV0U5OG44cXI5cVJoNWZqSmlVVEdFc1ZDVWoxVkt1UG5W?=
 =?utf-8?B?WUJ6dWdWM3dlTDNyYU1DYnFnNW5NdTd2L1NZQnk1Nk5rRDlWb2hSWW9lNVFy?=
 =?utf-8?B?SnoyUVRtVEJ1UTRqa0xON3k1dng1cEFsUkMrc2tBQ213eWd5ZnNxZWdpL0pl?=
 =?utf-8?B?S2ZHUkdhWWkxbUYvRnBPRm1FNXZLY1c4eXFvYkgwQ1E5OEtRYVd6ZEVvZXVK?=
 =?utf-8?B?MmVzYW5MRnBBY1N4VkRvbmNJR2t4YVRubEwrUTBFeHFudDZ2RWszamdDcnAv?=
 =?utf-8?B?VlFSWmR3dzdUQzB6T24wM0luOGp2emxNUlBxRXhSaGFmdDVXK3RFOGd1SzZ4?=
 =?utf-8?B?N1QzWnZ3WnQ4WFFxdC91RVk2TndEZUpHNHp4MytiMmtaVk1HL2tBcU14VkFU?=
 =?utf-8?B?TmQ4YlNhbDd3NFUvQi9aK242bVFZbURSRGhEK3Yrb3dSSWErSXYrUTJlRTYw?=
 =?utf-8?B?MktGSU5yajg4TWx5dXIyRXYwYndBUldUUXdXa0RyaFBYMUpjdzZqZzRyNkto?=
 =?utf-8?B?RkZrNjdkcTVrOWpqK0IxU3hKNHRnWk9BZDZCSUN1MG51SmxsUnVpWk9wNTJG?=
 =?utf-8?B?V0dldG5GTlBhaWdpMnoySkpoWnl6Vnp6eWFnSkk5WDlkTGZ6Tml3L2F5Q1pC?=
 =?utf-8?B?TFJtNEZEZWowOFpoYjcwdG1Ud1VhRy9iM25md20rNit6cnVQc0xmbElLMndJ?=
 =?utf-8?B?bytqVFNrZ1ZYOE1UUDdScnM3VXlZUC84aWUzcGJIL01uTVA0MHpYWUZkYit2?=
 =?utf-8?B?QWM5WjBnUnNyYU94U1orV2xST29YaHNNNFlTbG5FNlhoZVNqeUV5dGJQK2VO?=
 =?utf-8?B?RXRoNDMrR3hSS01ZOXdUc25qOTFsOGNVVFlSS2k1YTZSQmh0OWRpcGxUSjl2?=
 =?utf-8?B?NW03R3YzVEhzL2MwU2h1RkNjdlFCSGZ3L3VzeXh2eEFXUVM2REpWU1Y3OWRI?=
 =?utf-8?B?TXQrOU9rMktNQmdSR3I5N2N6ajJkZTkrTUUvTUVnZHhaYkp3UUZOOEsySTdZ?=
 =?utf-8?B?Zk1lTUVjV3p1Z0ZCRjdtam9GZERuaEkwOGVIUUYxcHBKcUhrNmRMSnljcjVs?=
 =?utf-8?B?aHEybzdNOS9TZVUxaGpBQWRXdk5OM1NTejdBa2JyeURkendsQlBzYnBTL3Fy?=
 =?utf-8?B?SGJVUEg2TUxlMnhVbzRQdEVHek9NS25IdnlibGhETjQ4RjNHRS8xYTBJR1Jh?=
 =?utf-8?B?ZWRZVHRCeUhqWEcyeC9UWHFQbkVSREZBSk02eTBMRW1uaDhMdnVmMWdNV0Y3?=
 =?utf-8?B?ckhza1JjVm5kTS9WREhMc1k3NFNIWUhWNUxEMnRyTzBRYjJjeVVOK3dDdnRs?=
 =?utf-8?B?a0VvN2l1ZVJKV0xLNy9kYTl3L2VuVllHdWpzSXQzUHBCdHJpekhKaFB5Rkxx?=
 =?utf-8?B?SlFxajE0RUZYaW5ZYXM1TXJIaG9XVm5IUVZFa25LMDJ2R3I3RHpBdjJidXNu?=
 =?utf-8?B?Ti9GZVRYd1JsMTRNaHBtd09XN2cyVTlnK3RaQWVacmdDS1FHSHZOMmFhdis5?=
 =?utf-8?B?STU5V3k0T3J4WW5DWno5YllFSU4zSjdyTFRkNnFwOElVVFhuNkxwWjJXOUxp?=
 =?utf-8?B?ZUZtYkE4M2xmMUhHMUdnSC9xeWhMT0pWdVNOdy9JN1RvVTZBMUh6dVlkYjFh?=
 =?utf-8?B?WEUycUpvL25KclhFZVlJUktPRHRMaWVmYmFsOFg1UFR4TnFsTEJydnhyNEIw?=
 =?utf-8?B?SFZNc2REeVBKWC9RQ3UrbmtRMVE2MzVINE1KMVRMSWNyMEYvRy9IQUgwZEFK?=
 =?utf-8?B?VzYvSU16NzlpOGVwMmFHVXRJSk45Sm1UQlRpNXB0eEtQMHlmRllxZHhScVFX?=
 =?utf-8?B?YnB2Z3VmK3Z6cFYwamV1OHJqV1o2c1lvZTJZNWxuazZ6bG9zdmJFdGJXbjFN?=
 =?utf-8?B?R3NySEFqZk8yL1RYMHJIUlVWNWsxUmluSkxiaXlnTzhDQk1UbUt0a0ZkM1hw?=
 =?utf-8?B?Y0FSOEJLdS9VOWY2M0Jrb3B3dEFNK0JmYUFJQktETW96ZGhPQ2xiR0s2dWVz?=
 =?utf-8?B?SS9mQTZOTm9USnJhTEhvWmZZVm5wTHd5d0p0LzR1RjRKdU8wM3A5aHBFZlMz?=
 =?utf-8?B?TEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbbe795-22e5-4440-92ef-08dde94ba311
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 11:35:22.7498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnYMK9WnxNp7dov0Y+FR27oThMWHX7p501zSSnN4i4r5cF8M6O/vf7nCTYvWiIcwvm6NJPq31AmhSIgFbpyi6J2ICdL5p88tyMOtuvmq2qE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11023
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Sep 2025 11:35:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7474

Hi Antonin,

On 8/29/25 11:08 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Update mailing lists following changes by Michael Halstead
> (https://lists.yoctoproject.org/g/yocto-security/message/1478).
> 
> Also fix formatting/spacing.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/security-subjects.rst | 23 ++++++++++++++---------
>   1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/documentation/dev-manual/security-subjects.rst b/documentation/dev-manual/security-subjects.rst
> index 1b02b6a9e9..6785b5a16a 100644
> --- a/documentation/dev-manual/security-subjects.rst
> +++ b/documentation/dev-manual/security-subjects.rst
> @@ -52,19 +52,24 @@ for them for significant issues.
>   Security-related discussions at the Yocto Project
>   -------------------------------------------------
>   
> -We have set up two security-related mailing lists:
> +We have set up two security-related emails/mailing lists:
>   
> -  -  Public List: yocto [dash] security [at] yoctoproject[dot] org
> +  -  Public Mailing List: yocto [dash] security [at] yoctoproject[dot] org
>   
> -    This is a public mailing list for anyone to subscribe to. This list is an
> -    open list to discuss public security issues/patches and security-related
> -    initiatives. For more information, including subscription information,
> -    please see the  :yocto_lists:`yocto-security mailing list info page </g/yocto-security>`.
> +     This is a public mailing list for anyone to subscribe to. This list is an
> +     open list to discuss public security issues/patches and security-related
> +     initiatives. For more information, including subscription information,
> +     please see the  :yocto_lists:`yocto-security mailing list info page
> +     </g/yocto-security>`.
>   
> -  - Private List: security [at] yoctoproject [dot] org
> +     This list requires moderator approval for new topics to be posted, to avoid
> +     private security reports to be posted by mistake.
>   
> -    This is a private mailing list for reporting non-published potential
> -    vulnerabilities. The list is monitored by the Yocto Project Security team.
> +  -  Yocto Project Security Team: security [at] yoctoproject [dot] org
> +
> +     This is an email for reporting non-published potential vulnerabilities.
> +     Emails sent to this address are forwarded to the Yocto Project Security
> +     Team members.
>   

Matches what Michael said on the ML, so I guess

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Please also backport wherever appropriate (maybe we should think about 
having this under the same mechanism we use for migration manuals so 
it's never outdated even in old release manuals?).

Thanks!
Quentin

