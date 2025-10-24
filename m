Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D081CCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 15:14:21 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.24])
 by mx.groups.io with SMTP id smtpd.web11.14137.1761318854649664779
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 08:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=iTPI/COX;
 spf=pass (domain: cherry.de, ip: 52.101.65.24, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpyT7uUcaQqv9dmMxLFMpMgVf6GJioko97aZfa/9a6CZU+oVDMOr2JJEBQOODQ7/lECIWZgsm5aLTT2EeYosmxAV8P8/K9sswuvUKybm4h+OEOWHM1EecRssEk2oHcUMpRqnPXi5pruA/z7vzb9j/zRDaRfcEqPMzd3sHMsLI9fAO7YW1k13BY1lMfb4tcT/e96iqfoz/8LiZqBLgsCeIL9RmPrdRVjVCgtCwxsYn2l7QDZh6HDH10H5hn6jrgkWDzm9kixn45vdThPAqP786p2bjAr9q0UktmunkjMuiSxn42drQNF5oGW0VYjCRtYQW2LKLzMSSURFZweFt4OZMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umfDYQU84tTcYtzFnsBkuJ9hgLUoehY58a9ZEivz+jw=;
 b=JBY3IY1NJ9mEKSL5HN2wYjUT8x9X5KzUEDNtUjWLnt8zC/DayR69tqjvejTRquar4XceXzpCeqtwQJP2AtTvNPTzdhkQJhEcAhrtxTCIkVXClMD65QKzWFKLuO2V6mTEwZazVVTwx2hX2ymGDFEjibjc0MrotPm0uMV1Dkc24LiLAe9DRtBipNqaRc5z6h7QcRczdxlaJOkDmTEE53twFnTzdTLOepnZuO/jej3kaf7tNDs02FfqXXmj0ZIh6m/Qv5gb6752FTSRrRoPP7qBCmqmpFnNzZwF5jneT+xpVZzqcfhXNbJje19QygTekvckBNBqTk+Cb+5sZtBso3VGuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umfDYQU84tTcYtzFnsBkuJ9hgLUoehY58a9ZEivz+jw=;
 b=iTPI/COXzDdsVvSryxteULfLecS9JCH9eHdRvSi7/FIkpXjaNalApkoc3Xv4+tIcStyPO0YiXZ8oLjWBz+7cJd18zPRc7xfDP97c9bK8UYZ3Ga8Obped7esa0UqGngNNuADowbzrvYyZVmC1arENiBPyztYc58g66b3sD0ARRVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV2PR04MB11192.eurprd04.prod.outlook.com (2603:10a6:150:279::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:14:09 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:14:09 +0000
Message-ID: <bcc2cf60-0f80-451a-b924-25e2b912b47f@cherry.de>
Date: Fri, 24 Oct 2025 17:14:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 04/16] ref-manual/classes.rst: ccache: mention
 that the host's ccache can be used
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
 <20251024-release-note-5-3-second-hunk-v2-4-d15dabc095d0@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-4-d15dabc095d0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0414.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV2PR04MB11192:EE_
X-MS-Office365-Filtering-Correlation-Id: f36a0db3-473a-480c-d06b-08de130ffb2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dUxuZWlrOE8rWmZmU05DWmNRSzh1dWFLSW84N1pXcURmdWZOS2cvOHBrNUU5?=
 =?utf-8?B?ZFpzMjlYWDRrWXBuQlNvZytVM3VTdUdKamFDK21hYlIxSUEvakJzT3VFTnNP?=
 =?utf-8?B?RUIvczNGeWRjMVNrWktBaEFCSE4xaEJ6bG11enJXNk1PWldiRVhDK0IvQzVQ?=
 =?utf-8?B?cWx5MHlNcDBlODFBMldBNDU2WVlBdHpKVHd6eFc0bHgvRHJwRUF3L1ptNlVa?=
 =?utf-8?B?cldFeEpSREJ3KzZ1OGR3bE80L29Dbk82QVJ4bnJoT3pGTFArREdlNXRHcmVX?=
 =?utf-8?B?cElsNEQwcHBoU0d6Y3BHV3ZOYUdhTVNiZkVxY2RlYzFLcFZxY1VPNFdNYWpJ?=
 =?utf-8?B?Unc2UEpWQXA2V01vbzZPWlZ0VEhZQVBUbGFMUWNHZ0ZUZzFFNjhhMGVxNENZ?=
 =?utf-8?B?T05oQjAxYVVuTEFUZnhkaUlzWlFQSU1zRjllbkd2clZrdEpwcFAzZlYzd09k?=
 =?utf-8?B?RWJOcVB6Z3ZtWXEwZDFPaC9Td1UxUkRpSjFndjNZRnBaMFoyeW96UlpwTnl2?=
 =?utf-8?B?MjlHcy9hMlN4OG9RQUJIVUZMelZ5YmVURVRtN0dhWFhJUFhSaDBTbk5zZGhT?=
 =?utf-8?B?MlhMbDJaSjFNWUVGZmQ2Ty8wUXNjc2NWQW1EOE5VNytMLytsQmdWdnZobWNN?=
 =?utf-8?B?eTYvc3JYcUpEM3JnL2lzbDZlTm1WMXpRam1wa0psSUJFcFRXSnkzVUdvU2ls?=
 =?utf-8?B?REpaRzBheTdSNXc5OFJ6T1BhdWxqZ0NBRFpaazFlT0t3ZXRYN2hTSjZoUTNy?=
 =?utf-8?B?S2p0NHl5c0NWTU5kbGtQZHhSYVl3NStuZ0tHbkVpL05BT2d6dlcxMlVodTNr?=
 =?utf-8?B?WVhGQSs2NUxwbml1VzY4aStONEhJU2ZwSEJuZlp3UnluZ3RDek1DZklXWlJN?=
 =?utf-8?B?ZVNWVTVoWnF3R09qL1VZVjQ4Y0FkYjRSN3FwckY5SVY0NlpVdVJsbWZBZHha?=
 =?utf-8?B?S0d2TlZpR3NCRVFJNXAzWmhsU01vWnRrbU93cWpQaExTOW85K1FzRlhpMlB0?=
 =?utf-8?B?d3I2YUNFeTd3K1MwTnR1dHJEa2xYUm81YjZNd1AxSUJNU0g4S0F6ZThQb3RZ?=
 =?utf-8?B?U09JdktZbjBxMkhIeHhzU0htSEZ1VERmR1F6OGRpQVhhWW80ZzZsL1Q3bXdD?=
 =?utf-8?B?dlRWUUxVbmVCN1RxRnJtMXdnVWdpcFpIYTE3Q1cxbmw1alUwb1RtYlZnbkFz?=
 =?utf-8?B?Y1dJbE1vdU9VMTZ4a3ZCQzVzVlIzRFZucEpIQmFBeGJKQUw0SHkwTG9CTXhB?=
 =?utf-8?B?eVlaOW81RnZsSzR6U2dzK2FhQjl4NHFHalVDcWhUOHlFNHlmSWQ5YzVHMzZP?=
 =?utf-8?B?L1d3TkZJdHU4c3NCcnFsaVZTQkgxRW9sZmJ6cGFBV2t4WHMydU01N294Vzdz?=
 =?utf-8?B?N0hjZHFzU2l0RUtyL1ZNOWJLM1Y4ZzlQWVBWSkZWYVpzUytwenpKdlN0Qllw?=
 =?utf-8?B?U1hpTFZCa1FPSjFtR0tIaUxBUG1uYXl4OG5yeEtZSTNPUzZScVVWN3VoRUlT?=
 =?utf-8?B?OHhUT2FINnAyNDVRdWg1Mzg3Vkxxd25DcTJleEdKeUllKzZoSWdxSHNRcWRm?=
 =?utf-8?B?QmM1TXRGZ3JOdDRwMUlwVldvTVRNeUZOWmRSRGpSVHFHeTBqR0pJWUl5Z20r?=
 =?utf-8?B?RXRsOGoyc0UwKzc3UjBGdzhMQlgzckRtdFExVjAybGpGSGJXTHp1YTh5TzBR?=
 =?utf-8?B?OTdidmhhUExZeVJEMFlyTEx5KzRiYWZoODRDMGdIMkFZR0pOVTJrakFXcjZ3?=
 =?utf-8?B?S3A4RjVuQy9taUIxVEwwWml0YTlNM0lXYUpGL2NobDlQSTRrbWxjS3FNZWNa?=
 =?utf-8?B?Z2ExUTZLSXE1aThRZFNzTWpwRUJEQnZzQVJkOG8rQ3R5eCtXN2kxV2p4ODA1?=
 =?utf-8?B?SGJxZXRNZWdDVmVpRDVhZGtIdW1JSVNOdzJOUlFyNWVmOGN2dm00K3ZZWVgy?=
 =?utf-8?Q?9DUgFw4ehndYB6/Tt/7/SVDoI3/swV4A?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WW10TkQ0aVJSUWMvUEhUSVdNUitWZHc3T1lJbGVPeWNNUWdvc2ovK1N5NzBk?=
 =?utf-8?B?NnVXUmJlTTlzSUZwSVFodmN0c2JHNnQyN3FNeUV1UEZ5VDc2V3pLY1MxTEM5?=
 =?utf-8?B?WHZrUFRGVHF4QzJ4NXV4d0UrbTR5UiszZmxuVjFTL0o0TWpLMEZ6SFZjUEhW?=
 =?utf-8?B?TFdLbXBSK3A2ZzNTR2tHb3AzS2QxcnltaFZQOFJ5Z3FYREwyeEtUT1ZGUm9L?=
 =?utf-8?B?Ym9TWm55MkRUQXZwYTVUWFlhTk1lTWVvTWtoZTBZYnphRmhWMmZ2djlUdmw2?=
 =?utf-8?B?c1FneDFrQ3lmSnJmNzM4MGpIQnR2UUgxREl4K1ZoenBBdG5mTllRbVpTT3NW?=
 =?utf-8?B?MFNBemdWY2JEeG1JY1Uya3JMWVhzTzJMeFVSQjJRMmEvYVZHRENXdjdrL2tq?=
 =?utf-8?B?ZlY5ZXJOL3VTRkdHeSt6cU8rTlhibFFCemhkZGRhRXpGam1Ob2lteFZBNU1i?=
 =?utf-8?B?U1ZNU05Qdk8vazJCbk04cDBmWmREbEJndHl5cEl3YW4zNEMzWlljakQ2MmI5?=
 =?utf-8?B?R0VYNTBETGVhdDI5WHorRWsrUjdKVkFHREZhRWF0dVB0UUV3RE5RbnZEL0FB?=
 =?utf-8?B?dDFpNGhDZjhHdTJ3Uk1xZ0VkMHNSTnlHd1hGNHNGZi91V1ErVzRCeXhGbnUw?=
 =?utf-8?B?bXBNRGRRY2ducng5VWU1ZFUvaXJvUk5hSDBVUjg2ZGZHSG11UFZCSStoOXRB?=
 =?utf-8?B?TGJNczBzV09peDA5ekZGR09sSFFjdTMvNEdKbEVFTkFGcjhyM01XTDJsQ1Ez?=
 =?utf-8?B?Y0RBUUl3bHZOOTVkM2EzZGxnMlROVTUzbTZSUTRhZTNGUnRwNW1uRGQ1VjM3?=
 =?utf-8?B?aDFRYmdSWmdpMXRERDFNaTZIamJNRDVRNWI3NXhkaWQ3dGRQYTY1OURCNDY2?=
 =?utf-8?B?WlIyVDN6MWJibHpKVHFYdGJsRVMyY3NjT0gweWFkWVhlT20xUVIzZXMvK1FW?=
 =?utf-8?B?RzhBcXZyWWNwdi9Ea0YyTm13YU42QnFJQXYrekpSdVYzbGdmcE9ITVN2aEI0?=
 =?utf-8?B?cm9MVzZMVXRRMTUyTlFPN2hYVVhvY3Z0c2JtMWdvaFZrSGtZK0g5WEFrVjhF?=
 =?utf-8?B?TmxTQU1raEhLV2RUYjlIenQ2T1VVLzFiSlQrQnpBNm80RDc2Vnp2amNQQkdS?=
 =?utf-8?B?eEhpZHBsMnYvN3NaZTNjM1orL1g0elp4ZEZpKzdiQUFpSWZSOWpPOThmM2xR?=
 =?utf-8?B?VWJnUTNrRXNXaWNzSGltSlgybnRlbUxrOVFpajFFcTFrWXFCS1FmMkI3c1hJ?=
 =?utf-8?B?MkVEMWZBYjViQnlqbzVKYnB0cVl4OWZLOWwxbXFEaHhMZFRjK3ZYYXpKdExD?=
 =?utf-8?B?eXlhRXpMUm5oWW5kVTlLaHZOditVTFdtMHcxU1BRSTkwZmp5cisvTmMvTDh5?=
 =?utf-8?B?dXFpenRrUTVwa1hUbmdpQjFKQnBUa3ZUNk9ia0swaEYvSWkrSTV2OGt4V0FH?=
 =?utf-8?B?QlM3R1ZHRVNXVXpFNm1JNmZqN084bWk4YTc0MUhTRTJBeTY1Wm4vT3M0cS9s?=
 =?utf-8?B?N3VXbUkwQ1JqZ2tWaVNZNWN6bkx3cysvbFRyb3ZyaE1pbXcrZTBURmpQdzhP?=
 =?utf-8?B?T0EzNzRtK2lONlo1Rk91Uk9ucnNOZkVXWEhyY25STHVoNktXUlI3bm5EUXJW?=
 =?utf-8?B?WE8vZlRwWHJ1ZmJucTlOV0hTLy8xbDN4MVJJYytUS2lSZW4rZE01MkJndHY0?=
 =?utf-8?B?TTdpK1B0akNaUUFNY04zeFBlRXM4eXFLYzljeWFPQWJ1M1RUbENlR3h1T2NP?=
 =?utf-8?B?NGlzUDhVNnNNa1pXOTJQUWlLSXdVdDNrRFdjRGxjL3BtYkFpZUYvSnU1SFN1?=
 =?utf-8?B?UUVGbTJPcGRHVjV2VE92S2RiRlVzVUNsNGdyd2Zhbm92cUQ3WWgxT0VtMjZo?=
 =?utf-8?B?RXZCcHM1TVhrZENPbFI4YWJhelg2dW1YM0kzR1JVVlpkWTk5VzRKZ0h5U3da?=
 =?utf-8?B?RlNoOHBDQklpRWtpRStEUTdoQ1g4K3dUdmhSUVFqWEptVTMxdVFtSkhPa29Z?=
 =?utf-8?B?ZWxTWTVSdklWeFAvTzdvU21KVURPUzVGTS9yUTdLanM4MDA2OUZaQWttWHlG?=
 =?utf-8?B?bUIrN3dFWmhFb0pTQ3lJSG0zZHVlc0RQdjFzYkZkUXhoYjFhZ3diOVU5STlr?=
 =?utf-8?B?SjR6Tzk5YWhCakpnVTNpMmcwbWZTeERPWTNjc1hEZzdrejAxdVdNRXVPRnV0?=
 =?utf-8?B?R0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f36a0db3-473a-480c-d06b-08de130ffb2a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:14:09.6112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DVlkIFsd8S0xex2xXjxRQG2Zd64vhthdLKt7wJqRUuWHJKod0Wp2pt0sTMqtt05Trye6ZWdMwBq8inKISoHhIvzHPJk3L/pcgQffW046/2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11192
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 15:14:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7826

Hi Antonin,

On 10/24/25 10:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> This feature was added by commit cc91a0f6500e ("ccache: enable ccache
> for all recipes if it is in HOSTTOOLS") in OE-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index f93897be1..4372bbf06 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -392,8 +392,17 @@ file for details about how to enable this mechanism in your configuration
>   file, how to disable it for specific recipes, and how to share ``ccache``
>   files between builds.
>   
> -However, using the class can lead to unexpected side-effects. Thus, using
> -this class is not recommended.
> +By default, :ref:`ref-classes-native` recipes are not supported by the
> +:ref:`ref-classes-ccache` class. It is possible to add Ccache support for these
> +recipes if the following configuration statements are provided from a
> +:term:`configuration file`, which uses the host's ``ccache`` binary via
> +:term:`HOSTTOOLS` instead of building ``ccache-native``::"""
Recipes (including :ref:`ref-classes-native` ones) can make use of the 
host's ``ccache`` binary (via :term:`HOSTTOOLS`) if the following 
configuration statements are provided in a :term:`configuration file`::
"""

Cheers,
Quentin

