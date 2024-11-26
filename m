Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A98DD3B7CC
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 10:01:32 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.86])
 by mx.groups.io with SMTP id smtpd.web10.42193.1732615282056313472
 for <docs@lists.yoctoproject.org>;
 Tue, 26 Nov 2024 02:01:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=AgPZDyON;
 spf=pass (domain: cherry.de, ip: 40.107.105.86, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+NTs61TqqdiV1+DuYC9wCmyBhPxvnZ5rvKw4Kz4piHyHxOJ0zUYWgMTayyDzcJBNwZWu21W4trsWQnWa29RKYFfqVm80sIKGIo2+kQ8Em9ORsSrtDXSpAjqqKvd+WhajT+cx5uFAUxmSSGrEC3/dBH6Sqzfz1iJ/HxmZExr/mwYX6Gt93yR4Vibl3Qd7cZQJpeR1Bd3xlAsh1lbi/Kmx87Tcan29exhUOO1Q1vOLoehbGPvdXFzZ5/PL6ngwlBLiaPZjpEr2Ar+UnNvv6IyXjKPsMm5pwUjqJebp6/0JLp4GaKJr4bxSln/2cH7RecZ98CHG+u1EymQxcCb/pl5KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGNIV/9GNogWrGAXVEpt3+KRKXB2q8jNUKBLlLNfB3I=;
 b=Kh7qDxin1bgRITmMAKlx0x0qcX9p+UC5sRjau7K2joUcGkM3w/6ylvIixIjZJ6hI3b4hIAmblugBZmi5ud+QKcA85rjZh9XvK53emTobKlsAA3QoMe4Vt6oPFKrnc9E1bxrkJSoApeKaEmV7cpIBHlfMd7K9IP0VlY7ZHAyHoeLBgO0o2SVJCwSu4zSqMwtzJhU2GBegqlgDsxQ2zsJ/Od+vepZMkhjc+sG6Q/UcCb9aK7OxGFXha3lGDVMKa98boZotW0sakp0t/uBMpw3KCf/sN7/qSM4AFqooo4wepCJFU0/wnwt3rYMtrKulK2KLxmJE44x7+J9/6gXKSvkHuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGNIV/9GNogWrGAXVEpt3+KRKXB2q8jNUKBLlLNfB3I=;
 b=AgPZDyONjbAs5PmgeeeT83KOvCRL37xtmw6UWxnCjx2kQMZs3xDYHGJv5QzEc4uNYw3O4HvQSJkCcGt90TZRw4FeLrLTPlkqm5AON/6blQJUSCkYXbgRPs7udxGBKx/8aM7OKYlOdDFEXkneXWflK9Iovz3Bew99m2aLUOkcL6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM7PR04MB6840.eurprd04.prod.outlook.com (2603:10a6:20b:10f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.12; Tue, 26 Nov
 2024 10:01:18 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 10:01:18 +0000
Message-ID: <5de7e392-8c41-4d34-bc3f-1597343d46bc@cherry.de>
Date: Tue, 26 Nov 2024 11:01:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] variables.rst: document uki.bbclass variables
To: mikko.rapeli@linaro.org, docs@lists.yoctoproject.org
References: <20241126082906.291040-1-mikko.rapeli@linaro.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241126082906.291040-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0048.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM7PR04MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: 47cc2d9c-f240-41b1-a48d-08dd0e014572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UmxiUGRXdisrcFlCcXFyL1BQUG1adnBpTTVXS2tOeWxIMjlJNzVhTWNFcVM4?=
 =?utf-8?B?UStJYTRYY3gxdnJ2S1Q3Q1ozc2pHMnRRMVFuZHBwRnNBdWVtV3hrNWxHcDdl?=
 =?utf-8?B?eE5BUzdjZGorcE1FSVFGSEx2ZnJzZjFDUWhWck5reXRTUmFxTDlzMjRkdXhK?=
 =?utf-8?B?K2R6ZmNGVHpNK2ZMekJyaitXNFEvYTB3OHJXSG41RnJLUUNrcXB6RjhLYUl3?=
 =?utf-8?B?QlpneHBUNDJoaFZlMi9JM3JSTWZtM3B4bk9PUDlINGNQaVJoUkF4Tzlpa004?=
 =?utf-8?B?WjFGcjcxaWtCUVNmaGxHbGpqQnEzTlFwamxuWEhYSjJLU2g3NnVmMG8zN1hO?=
 =?utf-8?B?QlFQSnVqODB2NkdSZUtZM25MZm1ad2M0Q0JEeFdSYzd6MjlzcWx5MzhmZURS?=
 =?utf-8?B?Nk8rM2VDaEhtejJDaStsbXVOSzZVaW9mUEc2aUhHRDV6TlRlNW5NdGpkaWZV?=
 =?utf-8?B?dkpFT3VZMFRiQ1NjUmRqUnJTQU55RHo0dWtReHlNOHZVYndnVW9yNUpWRkFB?=
 =?utf-8?B?UmpoT2FLWm9xaUx4S0t5a29rK3BvNUlSNDBQYmh4dkpsQmZ5Y2k3Y2MvRzhE?=
 =?utf-8?B?bytOaDFBNTNXOWE5aXllOFg1RjA2aGxMS0Y2OVpSdjl4K1ZOT2s2MzY2VEhE?=
 =?utf-8?B?a215MjUrVm1hVWJPQkxWdmt1VFdHU0VtUlp3cGpvTnBoYUJlK1ZRdnA5WUJP?=
 =?utf-8?B?Wk1EVVNmNVI3emRFU01iNUFMNHhPWWRnbHUwUVZyclhmd3lYanV4bTRCT3lh?=
 =?utf-8?B?aHhocENJTTJhcm8rSUpicTc1YnVYekJ3cmdmcnVNWHFadG1KbmsxNlh3L0Mx?=
 =?utf-8?B?TmVLREUvamg1bU81ajlDbXBpbVNjNFVWSnhSbnZSUGVuWndXZXMxM3JQU2Jp?=
 =?utf-8?B?UmxkY2hQYkIzMGlHUnBkMmpWSy9VUStsQmNKdkZyY2NCS2h2a2crRE5DZkw2?=
 =?utf-8?B?VERvRFBaMGszdGdsTm1TdFdqQWt0ZU1SWU5JUlpzTGxFWjF5N0pHSm03eWp6?=
 =?utf-8?B?N2xrLzFMejZVVERNSnp1RjVKU2JZSzZaRTR4azRnd05RSUZTOE9pWjRQSnpS?=
 =?utf-8?B?SHdWNFdlVlNydkJ0MEFSeE5pb3FqZ0xiNWViZTdyWDFXZ21vSXN0NmVHZXdx?=
 =?utf-8?B?U3F4OXM2c0dwVmZmbGs3aWsvMzcrRFBOcjBFaFRJSHF0dklEeWdlSWc2MHdX?=
 =?utf-8?B?YzQ4ODZMdEttZ29oT2tMYUd3eEN2R3A1NW9xNU9sLzZKRnNlbXA4amFsQ3cx?=
 =?utf-8?B?SDBWMkZRYkF4ZEN6OVVJZ1pDS1J0Rml3czFYYUNIeVd4Z28yMmxDYXMzU2dh?=
 =?utf-8?B?RzUvSE5jbGljWVhsWjhkcVhGMlM3MlJVZExLakNkd2t5cnpWeSt3c3EvU2lN?=
 =?utf-8?B?QTNFRlRmRnNlSWI3QVMyOURta1d0QVBrL0tDenVKTFdmYmcrek5xY2tnQ3Av?=
 =?utf-8?B?eVBaWTFHKzVDbFRpR0ZnTlNtODdFS0dCSjV1Z2lqSy9GVUJxZi9BeXgwSlhp?=
 =?utf-8?B?VFJ0ZVZCQ3BFV3o0MVRiM3BCdWt4dlJncitHSDluT0RycGMwZTdJb05DUjFV?=
 =?utf-8?B?OWhzQzYzWFFORXZtV2NxcnJ0d1FmcTNUVE9uK3IzeUl1NXF2clkwNEpKSXpu?=
 =?utf-8?B?bkNza240WmllVThVem1velhNNEp0NHgvaWttcEs3cXg5Q09FVnpld2Z4SFFT?=
 =?utf-8?B?eHlIWFFpTWh5cVpIanpaSDE3ME1GOWV2bmNEVUhiaG9SL3N0VzdLWTJnWEh4?=
 =?utf-8?Q?DOEdEKRdGH8pNXlmFc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U3BnaDltTTd0L0FhMFZxdUh6WitjOXlQQjlpSENJNGY4L3JoRHJPMVFqLytF?=
 =?utf-8?B?NHpSRmRRd0p0UW95K2lzZXNTdmVTSE91dmJpU2hMdWJ3bEJTUDZxVlhocEk5?=
 =?utf-8?B?em9NSzJndkxlKzVaMmw2UStlelRHaDV3bVdNQjNBYTZqU25PbUozM3lMbEY3?=
 =?utf-8?B?cStvNnlScC8yN0F4SUlpbnZPb0o2UzdzMFQyMXhzYVBBMmRqVmg5YStpTkds?=
 =?utf-8?B?d1hsdWZCbzd2aUFCRDQ5bncrRTgyYTdiRmYxVlZXSXB5VGV1T0xGSGpqSURj?=
 =?utf-8?B?aWIySnVhcU1JUjJvSFlBbWQ2QWh6K012aytKaUM2cXBIdGlFeWdVMlh1V3Nm?=
 =?utf-8?B?aHVqTWY0VTJ0eFppVFJmU0JJNFVqdmpCakFKYmhJbnpuakhNT21VQS9oKzRG?=
 =?utf-8?B?UkZtWHFzdWVnWit3SERuZnpqTURiVkpoMjFURGI4VGVqSlB0SVFWTWZPRVVq?=
 =?utf-8?B?dmppMDAxTTV1T09wa2tnaVNaRHJGT0ZrSHR5a256b2RXRStpVnhSS1Z6TUJV?=
 =?utf-8?B?aWVZaC91aGhnSk5sa29LTTE2cWZkL3lEZmV2cE9hZE1HMC9UU1B1Z2o1VGs3?=
 =?utf-8?B?R0U4U2R4SVpES293TEZHNjgwYzdwSEhmcjZweDkxRDlMMkZUc0Rmc3hWMXpW?=
 =?utf-8?B?YmRBVjBxVW4zWnJsRkk3STR2aytMNkhKaEFQVUY4a3BnUSttWFEvOTdPRWVi?=
 =?utf-8?B?VXlLSEM0c1g3QkhMeXU0cVcwOG44ZFhXbld3bVkyOGxKRmVmeGtVY3htMTBl?=
 =?utf-8?B?Z2JnbEdwYks4TTlIQnpSYldaZHFURWE1L1J3bXg1ajZzQllEdTY0TXpBV2I5?=
 =?utf-8?B?bDhSZkwxNG1mWXNUQXYySURZdlpjRExkRXVCQzkvWlBqa1Vjb0JnUGNVWWMr?=
 =?utf-8?B?QkU5YjNGSC8wcXdVMzByNTI5NWR4aU9qR0hZSlZ4ZElVQ2ZPVm1DNjZOQzlQ?=
 =?utf-8?B?ZXB5S29mcVl6V3pWbXd0YTdZQmZlZ0k5bW9HdGlKL2xiV0NuVnFXc1h5bGcw?=
 =?utf-8?B?ZGVCenVMQ1JDYkRadHJIaTJudGIyeE96dy9kakpPT1ZKOUFQMlNRTTZyM3JQ?=
 =?utf-8?B?T1NHa2pwbnRMMjVRNjlEZThHMG9ONVN3ZzgvTWNZUmlQNUh4WDBZU1VLeHdC?=
 =?utf-8?B?VEhKRDBqaDdOeVdCSTBTWnQxYnR6eFNIbitUemx5Yk9yN0N3SnJvMzhpUkhS?=
 =?utf-8?B?V3JyZkRTWXpPbEw2RTNVcTNIK1hmZFhGWTYyRXJZUXphMUZzWGRtS2ZVeXk4?=
 =?utf-8?B?MDNFQU1qd0ZFcXRLZ0Q0WTNOSk1BaUwyV3QzcXRnVE14d0FUT2x3SDIxN2V4?=
 =?utf-8?B?VGtZbmdwby9vZkVudWtFRklPL2poazF4eTY2S0kzUllEUDRYY1NWVzdFNnFZ?=
 =?utf-8?B?S2tmcTZxRmZNSjh2K0w0RU8rUUU1S1BPUDk2dzA2RGQrUjJXQ2lHczRINDhS?=
 =?utf-8?B?QlRJUVc4S3NtRUlIVys0ZFNtcGRHVmd5bUtabkU3UW43ZC9rSnlkRFBtdllG?=
 =?utf-8?B?MWovaHNIOWZzUGRiZS9HUkhqTnNYV3RZYWp4NzZ0Nm5iL1Z6NWJQQkxsUTFO?=
 =?utf-8?B?a2pJVTJSWnAvUjkrblBVYXo3TTZiNzc0Z1ZpTUJNcXBHdnJQM0hucDJnSzNT?=
 =?utf-8?B?NHF6V0lveEFLeEVaUmhQUVZwT0ZvZ05MT0FwMGw1MHY1ODN6cnBGaFI0OEhh?=
 =?utf-8?B?MVlxbmszd2lqcWRWNk9WTFlSSmlYSzY2MUQvcUs0RmxZYnZEWTVIMTBhZTNv?=
 =?utf-8?B?V0VkNktjUUJ4WHU3eEY1cmZGekhjVTZ6NEVJUFlQMnBiTnRKQWVBZEJJNDBX?=
 =?utf-8?B?ODBjK3RNV0FjSzZJY0lZVHJTcUwyK1ppWEZnZ0w4YWVVU2wwNlR6RXArQTNk?=
 =?utf-8?B?S3FpbzRERUI0YmgrcUE4Z1BKaUgzYmZRTmtkeGxFOVdQa1p6U0FXQlJEVnQ2?=
 =?utf-8?B?Lzd2UHJRYUpqS0R6eFpCQkhRQXJma0lUWkpqV2F5SWwxZFJtdU5za1d6MHdM?=
 =?utf-8?B?V1JwZmJrclRwdEdLdUhTVFZ2NDRJYlRKekZCNUNZUmRKYzNOaXl2YTNITk1v?=
 =?utf-8?B?WXRMT2l0WWlRbk5EaUgrYUs0UWVVSzdnZWM2L3JWb1dLeU9hckNvVW5yZnNP?=
 =?utf-8?B?aUZVWGkwZnowaW5PM1pFbm5NbmYzWU93N0ZMNmlTaklLRU9oUEJIL0sycUVj?=
 =?utf-8?B?N2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 47cc2d9c-f240-41b1-a48d-08dd0e014572
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 10:01:18.1195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFqY2ouc12ETM71TqCfiOiWkuLCrCK9JgqETvlCXA3UzARPl2K+puq7xtPE99pVDJpacCmHhceLfDlQSuewdHPGBVG4LkTgX79rLY2djmN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6840
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 26 Nov 2024 10:01:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5812

Hi Mikko,

On 11/26/24 9:29 AM, Mikko Rapeli via lists.yoctoproject.org wrote:
> Documentation for the new class.
> 
> [YOCTO #15650]
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=15650
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>   documentation/ref-manual/variables.rst | 32 ++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index ec4d7ab73f..9dac0b2d25 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -9846,6 +9846,38 @@ system and gives an overview of their function and contents.
>         passes and uses "all" for the target during the U-Boot building
>         process.
>   
> +   :term:`UKIFY_CMD`
> +      When inheriting the :ref:`ref-classes-uki` class,

I don't see this reference defined anywhere, which we should have in 
documentation/ref-manual/classes.rst so that needs to be added as well.

EDIT: this is contributed in another patch, 
https://lore.kernel.org/yocto-docs/20241125153415.282847-1-mikko.rapeli@linaro.org/T/#u

Having both in the same patch series would have been appreciated, or at 
least mention in this patch that it depends on another patch so we don't 
forget in which order to merge them.

> +      `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__ command to build
> +      `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
> +      Defaults to ``ukify build``.
> +
> +   :term:`UKI_CONFIG_FILE`
> +      When inheriting the :ref:`ref-classes-uki` class,
> +      an optional config file for `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__ command.
> +
> +   :term:`UKI_FILENAME`
> +      When inheriting the :ref:`ref-classes-uki` class,
> +      the output file name for generated `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
> +      Defaults to ``uki.efi``.
> +
> +   :term:`UKI_KERNEL_FILENAME`
> +      When inheriting the :ref:`ref-classes-uki` class,
> +      the kernel image file name to use as input. Defaults to :term:`KERNEL_IMAGETYPE`.
> +
> +   :term:`UKI_CMDLINE`
> +      When inheriting the :ref:`ref-classes-uki` class,
> +      the kernel command line to use when booting the `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
> +      Defaults to ``rootwait root=LABEL=root console=${KERNEL_CONSOLE}``.
> +

Can we have this term ordered alphabetically too (just below UKIFY_CMD)?

> +   :term:`UKI_SB_KEY`
> +      When inheriting the :ref:`ref-classes-uki` class,
> +      optional UEFI secureboot private key to sign `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
> +

Same here, please move this one below UKI_SB_CERT.

> +   :term:`UKI_SB_CERT`
> +      When inheriting the :ref:`ref-classes-uki` class,
> +      optional UEFI secureboot certificate mathing the private key in :term:`UKI_SB_KEY`.

s/mathing/matching/

Cheers,
Quentin

