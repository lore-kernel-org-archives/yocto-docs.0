Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28DB2C54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 09:29:41 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.27])
 by mx.groups.io with SMTP id smtpd.web10.25208.1748251773327917505
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 02:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Agm0s2C3;
 spf=pass (domain: cherry.de, ip: 52.101.65.27, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qWi+BAUCAhFwVIIAeMUpkgHQYBtFGpJzsvKk8sXM7XHc1V8E9v9EDM2kcy3zzp11AhxmPGB7BxLFeWMAkYpOznNHCOg/cGsOMFrd1PKN8DWAhnx5wibnAQ9wcy2b5CQM7TgU2l5O/tEqc5wSZNsqeIZ/f9ASOCWzBYdZ49gOWNViEwgaFpQWXU5CDuwek3k16XWtaJCIieLccFV2cd6eI5VJuIxpfoQZK2PGauqsglfPkgERNLqcDVeFyMxvE0n4kkArTxf4OKHKMEIDYUKZSG5QkEfs6EISOhpSqDmTovxad3kJPrfmVEvLsYb1o0q8QabwlL79joPoCQgmytjqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMDrf9qIokCO+meHt7F+2jiVbIxLAFJPgBnUkxECqQk=;
 b=icVj4cs9tD60kbM0bABi2D/sdGaagWgZCfH45ffkYIe54MCp1uAFeU6/ys5IbK+lhYz+NF4SCa8eHjOxTXHxKAwZPMU9uwnQTjVsKRPor2Vegn6WIP3uQ1Q2dvM/s5nl7kPsaomowA9O6sBzE5SAEbHT02IeBltM5izADbGduHj7OFTsgzyjDFgOgul+sjMyW+HKVlKR10dfh0WPxPpLvz+W1RBECO4F+j3bhWDoeCzsm3cNTovjzr5zN2vqhR/QqiJXpJhBKvUBapasMXIE8HsJA4O7nyJktMNUieKMaMwMAWIx+Ju37qk+f3XRONXcNBk3DgkXr+NjnT0Bgatgjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMDrf9qIokCO+meHt7F+2jiVbIxLAFJPgBnUkxECqQk=;
 b=Agm0s2C3EBzftA7HQJjkYjwn16aY6fnwP0d6NrVs8fRyEHkjX3lnH7g2R00+3+9fEagVGBAcq9RteT/8fy6JzQqzjjcxHptSrog/wOUS5gEBVj6HF1vSJ5ekXS+JY66S3SausKxuYx4J/NiNtDdE5USZtk45i5BxsIbqQN1f7c0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8750.eurprd04.prod.outlook.com (2603:10a6:102:20c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 26 May
 2025 09:29:30 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Mon, 26 May 2025
 09:29:30 +0000
Message-ID: <96ff6922-ede0-4b22-abd5-1887dc36118a@cherry.de>
Date: Mon, 26 May 2025 11:29:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs][PATCH] Simple cleanup of explanation of minimum version
 requirements
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <727b1435-c923-6c06-c2df-e1ff35c8968c@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <727b1435-c923-6c06-c2df-e1ff35c8968c@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0077.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: 92acce02-e9dc-4aab-25ce-08dd9c37d0ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dWZvYmUrZ2ttUnE4SzJhNHJvN2VoTUdkQWxFeTR1VnR0R293QUlqbjRMZlJt?=
 =?utf-8?B?VTdybkJLRkJaZDR6NW5hMWozRXc4a3RaVFB1Sk15Y0lQQ3FYQmo2d3pydGkx?=
 =?utf-8?B?QXhPU2V1b253K3U0SVpvUFB5cnhmWXJZUDRGZmJuQlA0UDlpcmh0MG1FT1oz?=
 =?utf-8?B?VWFoVWRvdVBzK0pCK2h3UUUveUZveTN6OHB0T1VTOUtEWWdOaFdidDdsMUdV?=
 =?utf-8?B?OVBWU3NOc2J2ZFN2SVllZ0VuSFRmRDZlWUhickd6Rkl0YUNBaU5zaW1PRVVD?=
 =?utf-8?B?bk1HTFdNTm9YWWVmZTJGazBnQTlMcFZURHR3bURMU2dDYUM1VDdUODlxeUVD?=
 =?utf-8?B?bk1udUpJMWs1MlB5S2VoREVyd3BOTDdMTHo3TWs0OTJWRzM5KzI1UzkrVklB?=
 =?utf-8?B?WmtuQTFjWEppZVN6d25VcDdub2dGeXJMYTRKMEFYTEpGUDNHMDBzTkVxdGpZ?=
 =?utf-8?B?d0dxdlZNUWQ0d0RKVW9TUGR1RkZ3WXpKdE1NWERrd0ZwTVFrZnBMdm95em1Y?=
 =?utf-8?B?Mzg4UUEvTWdhbG1mWUhSM2F5aUZQWVBUd1ZFbDNGckRRWFlLbEV4MGNiZEdv?=
 =?utf-8?B?R09GcDlkQzY1QmVmYVo2b2ZKMm52THlhZWtMc0psM2czTmZGMnZoOXlDaTRW?=
 =?utf-8?B?dEp2dFVyYUM0RHdLNlplNW9RZ1YzMzRJU0UyK0tOY3ZucjB4aytwTHYyWFcr?=
 =?utf-8?B?bjZDU2NiTjFmNDdEOG12clJBYTNMbGRadjBNSjlDbjNnOHFsT1YxVml1RG9B?=
 =?utf-8?B?KzdDMHR4RzJJL0ZjVktqalNXOHQ5N09GR0JRMWd0Z3pmUW90eVNreVpRaTk2?=
 =?utf-8?B?R2NPMGppTlJ5OVFxd2luNWgzMU44dGloUmxQYzl0YW9sOFY2TUROTS9rbTBm?=
 =?utf-8?B?YTc4bXc4ZEtxbG43OWNoTnhzaUNVNHFvY1VXRTJaUXVhVm5BZWs1QjcrZkN2?=
 =?utf-8?B?cjZIa1ZzbFV4VHM2aVhtdm1pU0FKcDBDMnpEbmhldDlPSEcxK09DZmVSU21F?=
 =?utf-8?B?MWhSUThtUzVUaGN0MUxmTFF2VUlrcTR2MFBmNW1sdlFOZURaL0w3OXY1UkJM?=
 =?utf-8?B?RTI1dVIwWlZLbEhmTnREY21JeEdWeWhuMy9Zam9STVVsQTFhY3ZTWFkvS09z?=
 =?utf-8?B?SGEwS1ZCMnJ1RklIS1hBQ2xaSEI5MFhYU25uWlR2OTZYejlKUWpDMVA5S3VV?=
 =?utf-8?B?U3dUeXNtTzRyUHBoSXIydnlKTzRGbDhXWXNCV0UycWVoVXhCUDFjc3RVUlFH?=
 =?utf-8?B?YkR0VlM1YVNTdWFWd2xCZ2xnbWUrbDQ1WkpCMTQ1SExjNC9IaldkSWN4b0VG?=
 =?utf-8?B?c20xTWxtbm5hWDM5LzBOUFRWQ05ZdjBLZkhMUWJveG9hTHAraFkrenFKdm43?=
 =?utf-8?B?VDkrMDJiQXVQYXlNRWxXRUk2Nk50ZzNpUGQ0WFdnVmxZTzZwbVFtNjFiMkVm?=
 =?utf-8?B?YTgvRXA4RVhyZ0xFSlRVMWd2eENDNUpYQ1lFVmROVDdpV3A5UDNaVmNKNGRU?=
 =?utf-8?B?WHFsZ0l2WVdTNU1YYVllYTRkQndHeXczZ3ZQWnZ6eCtwL0FDcGxzdkUyVHli?=
 =?utf-8?B?Q2hSbHVXL0dZdWpMcTFvMW4rQitvVUpwc3lXdnptSzJ2a21yc05IOExKSkRW?=
 =?utf-8?B?YlhqZU4wWjV6SzIra2krWjFZMXllczM2MXR5SGY3SkdUSEc4eFlOdHcrUTBK?=
 =?utf-8?B?Yjh3TXlFZmtQbmpWT2p2Q0hqbUVwWWVyWThvSVpIMEN4eU11NFFNZlZ5WCs1?=
 =?utf-8?B?NmtaRUxicUJ2MkU3VVY3b2ZldnJKR1U3MmZpcHRDOWRmVUtKd3d3bXJ2VzBw?=
 =?utf-8?B?am5haTQrcmtLL0EyU1BiUXdmUTNkTFV6aDhxR0xIUzloZ3ZWTGtZdHYzMGIw?=
 =?utf-8?B?M2pSeGdUTWhnbHBydzdQTFFOZ3o2cDVHYXVxRTdTRllBOWVkbXRDd2QySjRy?=
 =?utf-8?Q?vb8uwK0aklk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b1Z5dGR3ajhwbFBVNHBBd2RaNTVEbnNzVU4yeU56aVVTbUxhUEtYMEFHeFUr?=
 =?utf-8?B?MGk0NWw3dXdvTGV1UmVnMGlEV3BqazF4blJILzZHYWRIcWNkcHpuY1RJdU51?=
 =?utf-8?B?NXorR3I0Vy8rbzVWUGtjL0laK1B5M0dUSnkwaE5sVTRUVmwxdWV4MHllSW1B?=
 =?utf-8?B?YlpESnVZUWxJNHNYbVd0YlYyNnhyaEk5VVhHZUllN1NBT3hncnowOW9ObjNu?=
 =?utf-8?B?QXZDU2lpaVl5SzlGK0E4VW13YlhGeVNTTTBqN2FVenVBYjhqYXRKWDVhRmdL?=
 =?utf-8?B?MGR5N2RuQ3dYTEJFUHdlb3A2MWNiYzhSRi9PcDJtU3BBU0o2b01JY0ZUcERh?=
 =?utf-8?B?WEJzZERIbnhBQVV5WWhvUlViRG53SWlmZ3QxUEgvOEF4K25Fa0VDeHZha0Q4?=
 =?utf-8?B?Q2lleGFoRU1FeksySjhrM0VhYnNrVFJ0TnBvWEZ5c0Fta1QyaDNRNTVTUkl5?=
 =?utf-8?B?cGpRR1V4T0NsaHdNbm1CeTloYTRKWEpvY1FEZVJFSWd6N093TmZIdzREVUJI?=
 =?utf-8?B?dE14UWE1bEJvMjJKWm9XUitRUWFicmgzcjdLWnRheXptK2xYNHoyOE1zSVFp?=
 =?utf-8?B?T0JRdVk1aDJLaHVQMEpqQmNKOUs1V1hFVzRoTHBNZ3B2TXRMbnRZbnNnRzNy?=
 =?utf-8?B?MzVDMzF4Q3R4NzIwTC9VbXRYYjVvZ0pBaEZPZ1dhK05HTzJKVkFJckxLMHQz?=
 =?utf-8?B?azJBb1puOFFLWlVjOHh6QWlDTVN5elJJK1hzeVBsUkpTWDZnL291aHp3NEV5?=
 =?utf-8?B?bXlQZTVrV3Q5a1ZvUENQdmZaYmErK1NxeW91a21YK2NjSm5YRmxTWTVNUngr?=
 =?utf-8?B?VVhXMVdIS2lWQzRhTE9OSm9Rbk5xOUlTWnJJc3V1SUJTMVdyZUVIQzEyWldT?=
 =?utf-8?B?ZjdXSmpvRnpraURxWU1rU2pta0JwaExvL1d4cDM0NjFyMWo5WkVvTFQybFpT?=
 =?utf-8?B?Nk53ek9kOGNFR1I3WTgraTlhSjh5NVZFVnlTd2RmUnA2U1BOYUpkczR4cTJs?=
 =?utf-8?B?NkR3OUlxS3hjQU9kK1I1MThSQUtFQnVORzFPa0RWR2xUNlBnTGRQN1JLZHZV?=
 =?utf-8?B?amdTNVdTUk1uaUNPcDhlT3R3a28xZ21wYUYwQ3MxQzFYMlRKZTI4RmozUWZp?=
 =?utf-8?B?cUlpbWp1MlhDb21BdEZPSGpHUWo1RDd4eVJ2cEl5eGxuRlRzUGtQaHg2Vkhm?=
 =?utf-8?B?NG5Id0UrZUY4c0JkYzE0cXArV3paVjhzeUtaVCt3UjlONjRUWTdaUWN0aGkw?=
 =?utf-8?B?STFrME54Mzd1WGJTblFDY01JVmlQSHRaNjNLL2JqdUlPcjh1SU5QbTJoSm13?=
 =?utf-8?B?ZVJoUUYvMkJQanZ6dG5XdE5ITm5Za1FNcXBDa1RYVW9XSWk1ano2L1NtcjI0?=
 =?utf-8?B?aW9Xd0FzM2Nya0xMUE9HZ3pscFd0T3lhY1BRWVBkREltU2dRVk1PaUZXZnI4?=
 =?utf-8?B?WVo0RWlpYkxSdkxVWnFZY2xiUUR1bVBxdUIxMFRwbSsyeWIzKzN6RlFkNklO?=
 =?utf-8?B?RmpkSTV2akFiT2xqY3BDeUpjOHdxV0s2UFBtRnRGM3cwMWdSWDFtQzY0c3ds?=
 =?utf-8?B?eW1xWXM2TVRtSkRVNkhxNEQ0bEJSSkdSSjRxMlVWV0tDaUsyZnRFSHZ0TlVI?=
 =?utf-8?B?R0tJMkVvSGFEZzNMUEZQRnVmK1F2ajFHRFF3MXdtWVZwRmp4ajNvTkx2L0pB?=
 =?utf-8?B?YmlrbnczVURhV3hFdlFieDgxKzJwQzVRZVc5V2FjVnR4RExIYW53Ynd0Q09p?=
 =?utf-8?B?cURMVUN2OE1VaERiNnBwa2wxcHlMbStuQmxxVjQwTXhyVzJXcmdhY0pxdG9w?=
 =?utf-8?B?ZFNsQ25qY29OWEJ4UzRXSkt3T2U1bFNBREJ3MmZsUno4UnZFTVFqY2VHa3lN?=
 =?utf-8?B?YTUxZXRvTElEdEtVMHc3RnRuenhLbUVtcDk1TUIva3BFZHFyS09lbGVDeXRS?=
 =?utf-8?B?ZlZUd3dVbGZ5RUQzN1F2V2phR212OGR3YjJvbGlkMkVVc1NuK0d3ZDgyZVA5?=
 =?utf-8?B?aEExaTZVUjc2OEpyQjZOQ1M4dXJMOUlNRXowUmVmSnlJUzNsMnU1c3F2SHJB?=
 =?utf-8?B?cDNXc2dzMFVKLysyNGMzN0sxYUd6MWJnOU1Fd3FZTjN0TTloaXlqRURncGFO?=
 =?utf-8?B?WjBiRkVCYTRIaWNSSzRaL2xxZ2kxYTVWWjVVMjZhcUJrSWdnVmVHd3JRMXdB?=
 =?utf-8?B?Q0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 92acce02-e9dc-4aab-25ce-08dd9c37d0ec
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 09:29:30.0202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cwKOtFcOr8FxeW2Muqmzo9/rTHQhxxaEfy4WhEuyo7wS5a2Jxs1FYjb/kCaGIRNcTgWYDjdSaNjSK3uErsz0PyM+DuPQpFvK4Sv42BkYd8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8750
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 09:29:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6922

Hi Robert,

On 5/26/25 11:23 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Trivial list rendering and grammar fixes.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
> index 2f6e4cf02..a8d877a54 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -57,7 +57,7 @@ following requirements:
>      :ref:`dev-manual/start:preparing the build host`
>      section in the Yocto Project Development Tasks Manual.
> 
> --
> +-  Ensure that the following utilities have these minimum version numbers:
> 
>      -  Git &MIN_GIT_VERSION; or greater
>      -  tar &MIN_TAR_VERSION; or greater
> @@ -65,7 +65,7 @@ following requirements:
>      -  gcc &MIN_GCC_VERSION; or greater.
>      -  GNU make &MIN_MAKE_VERSION; or greater
> 
> -If your build host does not meet any of these three listed version
> +If your build host does not meet any of the above version

Not a native speaker here, but should we rather say "does not meet all 
the above version requirements"?

In any case:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

