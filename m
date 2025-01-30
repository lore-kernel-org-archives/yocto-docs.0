Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 009D0C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 15:57:51 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.51])
 by mx.groups.io with SMTP id smtpd.web11.18701.1738252664843847365
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Jan 2025 07:57:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=F8xH99lb;
 spf=pass (domain: cherry.de, ip: 52.101.66.51, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpdsdDPZJbvARvj6K2F3tuja3uS8IUjbUDpOGxXVaRztJt+8+MsO37KD/CYj2mhwtuQqTILDiMCJBPjmWAuMjDmez8V02Qx7xB0sjukAvvP/nRSWYupkO46Eju8mMFguvsbSSxT26OH3UYLNTOjTKVF+LBfn+R8Su6ybppk2q29QeM1g5p/q5p/uFISKvWV5NmGATIeTT8CjXqKQqUpnxzjUQtI/Cu1dyZP2quVZJWTXcQg0lRc/b29XlvA++Cuf/t/IynWsb2+TJOCtj+ILsVdoYzhqvUU3F6wXeH96X3XV7kJjJyu6I5WD/+TLnSM233DwGou0LgAlpGD7IEMMFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+fW78gNFfQlQBJ9dpjDlFwK23F1K0bDdTc6W63hM5Y=;
 b=Niz3tbGQ7Su0FS26gZlNeFL/FQD8J15DDNfa7n4OGZa54bV8mTIMxrqfYjsP1aYygpzJkyI1pfVaRuv+8/kwrPQz2wsJ5G86Tsekjy5R/lP/GDfgM/m4zRrGpmeQM4squa+4ecO4sE5C3zUZYSm0dV4xIJbBp1A9eYhwJj5B5zzpNd0QNnVLybYZMXrx0Jtz1XAbHF0rqHJozwLZdgzVmVPaGJ0T9kYCJhQbcn0ZyBQzExtkQ1W4QJJr931eDFGOjg9s6B+MxIpN8RJwpxdDMndZ5X1ac57mITlLli9qQZpf2OpGVD4j0LsoDIRe1h5yhd3MM1iTMJ5MeZbeNNQ0OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+fW78gNFfQlQBJ9dpjDlFwK23F1K0bDdTc6W63hM5Y=;
 b=F8xH99lb4Iu1pt+4wwC/VFTRVocpCxLJr+VteWmuYzKar46m5hbA7lWvymUPBaw8XTruDGQh0yQ/Jduyuunm9bFrSHYLjJCdz9TYcc9Dr4iC5liZOyCYz+NBdgfLCwtgWOVdyAJHUY1dejc7IHxetyk74L3nwKynXCC1PrbbYa8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8087.eurprd04.prod.outlook.com (2603:10a6:20b:3fb::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.24; Thu, 30 Jan
 2025 15:57:41 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 15:57:41 +0000
Message-ID: <fd45d304-a3bd-498f-816f-cc80313a9091@cherry.de>
Date: Thu, 30 Jan 2025 16:57:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3] ref-manual: Describe grub-efi-cfg overrides and
 GRUB_TITLE
To: simon.eu@gmail.com, docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com
References: <20250128102308.42435-1-simon.eu@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250128102308.42435-1-simon.eu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::23) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa0ca53-5f99-4928-137f-08dd4146d39d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eG1CSk51cnFPYXB3WWQ4R241WkxXeFlRV29mRmFmVTJva2RualJtVEZLSEgz?=
 =?utf-8?B?dU1jT0ozakhJTjR3bjRIb0RXa0tPR3JEeXk5eU9hRW5MYXBXK2pkZVE1TVEx?=
 =?utf-8?B?M2VUVzRhVmFuUTJQOE9wYlBPN2tYZXZONlBEblJ3dG1zWHIzazhiUXg4S29q?=
 =?utf-8?B?WjQ3UVpxdVR0K092VUZwRHVURlk1cjJld0krOEZ1bWJydld1MnFYaE83WlRp?=
 =?utf-8?B?TVg0UFNsdnJhcmkrTmpIb2haNGlvR1RKdzlJOG1YK0xsTWVuOG9JaE5RNmZu?=
 =?utf-8?B?cVhOV2c2NWVVbkNtUDk0WGhnK0pqQUlMZ0k4ZnhjcXhZTGdLM3dZdGNrSmpI?=
 =?utf-8?B?Z2hzRGNDbWJnVnZrS1pJWENTNjVJZWdGM0R0NjRWZUkwNkE1cXpzTjFFWHVY?=
 =?utf-8?B?SUcxVXZmbHdTT2pQd1BGdkl0bnlUbXhNV3F2bnhhS29yWUFXNFIvMVVLaGFC?=
 =?utf-8?B?SHpLUlFPY1ZMRXRtYnJqSE91WWgrZ2hXRXIzM24rdzNCcmRibkFBRVVQd1px?=
 =?utf-8?B?YittUmFlanJCNS9WdHdQTEZ2TjUyd1Z1am9NbXZRanFNS2hwYzloVDNWMkV1?=
 =?utf-8?B?ckVPYXQ2R2ROZkJPeVdabDBjWXVjeVZpZk8wMWRtSldEQ0hZb2RpeXlXMTlL?=
 =?utf-8?B?bm92cTIzRUVjazlZODdCb29VYklzNmJ4VE1GRnRjaVZtQ29YbVkzc1ZhektM?=
 =?utf-8?B?OXp0djJxVS93Z0lUd0ZQVnBrU2dFRXJrNVlWL1MrUzRyTlhheXgvcmd3dVJu?=
 =?utf-8?B?NFc0eU9JeTl5dzBCSTBLL09DdXJhWnZaU2hrakxyM2ZPWnBTRlQ5TzN5Y2lC?=
 =?utf-8?B?N0c4WEl4c0ZBSzJHNi9jYVpjMXVUV1Q1MUhNRDl3Sk9Ea2pFNUUrbmJQM284?=
 =?utf-8?B?a0h4cXczd00vSGQ3YlZiemhhbUlZTzNGU1Bjd3YvbzhvalRDZnFZdW80emhL?=
 =?utf-8?B?bk5nUGZsdXFBYnpwQXErbkdlVlFtcGd2U0ZUTUhQWS9DN2Rxdmk5c3ExOEhx?=
 =?utf-8?B?V0lBeGxQay91cHB3akNmb2EweTIrSTBLVWZ1YTd4QkhPdzA4Uk8yYUhWLzQ3?=
 =?utf-8?B?RnhuQUFPWE45NUtscWxEbFVkK1Bra245TEpqTmZ3VXRPNG01S293ZlYzV1Bn?=
 =?utf-8?B?bS9HS2Nmb1picVVwRjk4QkxqdFJTbnFKazFUUlhOaFoxaEpsM0hHc0MwSDlQ?=
 =?utf-8?B?VWpBTFEwR3FOa0M1c3IxYmtCSmtzM3VadGNDQ1FKbWt0aERwM0piQXltWk8y?=
 =?utf-8?B?Z2xRWVhhdE4vRWlkNzQ0V1g1dDRwWXVISFh2dGYyQ0l6N3JNRCs1OFVKL1k1?=
 =?utf-8?B?K3VBS082MzNQaTRuNDlSajJvNUUvekt6N3FyekMyODBwRDZkMnM4Qit3OTRK?=
 =?utf-8?B?eDNQS2YvMmNzamJwaktWK3U4bmRxLytYa3ZCaUFENDUxY3EzZi9ad3NGQzZm?=
 =?utf-8?B?Wm11NTlWOE5BMFMzT0V5ek80ZlJkNWREbCtyQU5vUzFMbHUyZ0JsT004d1FK?=
 =?utf-8?B?MTFhTmpnY3p4VmxaQ3hTcFUwOUtRMUdjVGo1NEt4cnJMREdVMUoyeHZETVNo?=
 =?utf-8?B?QnV5cE5tUXZTOExFdHJ2L3hQWTVFZnJORmRWb2tLNnhRN1hHeUxoSFVhd0dG?=
 =?utf-8?B?MVRVemdKR2w1RDMwelZ4anR2ZDE4aUNiYXZXMG4veWlQQ2wwRnVHWWhkNEU0?=
 =?utf-8?B?TFMyUnYwTnowTXpvR0hvQUpQdGRkcXVFWjFNOFJWWTllQWo1ekozbWlzakZk?=
 =?utf-8?B?Z09QY1QwbWVoVTlOOW54dHBqS2pXeW5WQmwyWUJQMGkvRGVmZWpsbU5NMXk2?=
 =?utf-8?B?Q0dWTnR1ZEJ2aEtiT3NJd3JPOHA4V3QwTnVWS3I4d1oxWGV4MzJuZWFJK0FN?=
 =?utf-8?Q?cy2iJY6ucFkTe?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MGwrdzJnRk1YUEROVFZNTzA0eEZKQlhJZnNRZG5LNGJmNk1iY0ZGRzVReFVY?=
 =?utf-8?B?Z3ZVbkxad0M5S3pmWW9VUFVObHgyN2pvb0Fwc0t3UjVYQzIxZS8zN1RVMVpz?=
 =?utf-8?B?TDIrZyt3amt6eFNWdUFGdEZrcTBBdFFndG5EMlFXUlNQS1BqRTFBOHo2TXF0?=
 =?utf-8?B?clZUcFZRaHdJYWxkUTBPMlFEL1drRFg4ZW9WTGJsZ3BtZXF2bWJCWnNzZWxv?=
 =?utf-8?B?NTBvREl2U0R5OWNPeDBxZ2FvZ2ZBRzJSWHBDU3ZSZXNPcUVZeUVoZmh5dk1M?=
 =?utf-8?B?WTJSZVY5eGh2cHlSdldCdGJQY1h3RC9OV1E1TGFtV2I4NnIwN2IwNXNpbzdl?=
 =?utf-8?B?ZTU4dDlITkoyWC9idWxYYlhsSFNVclRJQ2FMM1hqN2JuQ3hWNkJRd1ZLd3p3?=
 =?utf-8?B?VkJFYzdRbER3WFZqWkhNV0FDeWhNRm4vU1J2MDFRMnFFM1JSRFBIZVgyRjYx?=
 =?utf-8?B?bmlxWGMvalpoZUJLTVlEZThTRm5uZnRyWkFUeGtRaDB3RmViVC9HWkIwWXJK?=
 =?utf-8?B?ZC8vTG9DLzRQMWh3WlJySWFBRTFvTC9TeEVQU0RFWnIyd09hZ1d4dXd0N3lN?=
 =?utf-8?B?UVY1aENXbS9rUXh2QVk3bXVhNXVWWXV6R25DK0pBc0crVFhzcnUrYkM3NytI?=
 =?utf-8?B?ZEUzblE0UmFmRnNUZFNDdW1yOEhDdllPV2NaRWw4akpweUtReEZNZnN3NG9E?=
 =?utf-8?B?RFlpZmkxN00zODRSTVNUakVMa0VTTmlaOUFqMGJ2TEV3c2lnZXdmdWZXYTQx?=
 =?utf-8?B?ZStidWNpcTJOVnFJU1Q0WjBmdEdrMTVZL1BNZTUrdkdVbkN1V205MUhXdERi?=
 =?utf-8?B?SDVnUWdNTUZhSHB4cTdMN1piWURjUUx4VnVGYUozN1AzSmVQemxpOVErcSs1?=
 =?utf-8?B?QVlidk9tUXlLNVRJOHhsZmtwVUdVUnJOTm9KK3dyTEtXVWlLZzYrMVJuNXRk?=
 =?utf-8?B?dkQvL0hYVGc2Z1lrcVlQMWRFOEFNWnNSR0lWdFZ4Sk1hTjNYVUZiKzM4S1ZE?=
 =?utf-8?B?WjF5Z1Jtd1poVGpoMzBqM1BMMmtwa08yYmFRMDlQY3FPa3NjVlJ4d2tRSXBP?=
 =?utf-8?B?c0t0Q2Y2NW5wL0dDbUpwNGZQMTJiUWNobUJGQ2NvcmMzSkhVbENkVGZPV0hG?=
 =?utf-8?B?OHJmY0JFT2RBMXRaemhSNkl6a1lFc1IwWjRiQVZkcHE5bnBYYmszTHdnWks4?=
 =?utf-8?B?aGZxWmZ4dGc2ZEd2THlFeWtwNHBtS2E0NTRzZVFTUk1QaVU5VmRWd1FSdEFU?=
 =?utf-8?B?Y1hQUldrOFB0Qmwzd1M1cEZHK0xvR21lL3Rsbm1DVzNtQ3ZNcUpqaFBiZGtD?=
 =?utf-8?B?NjJMRmRQMmtpZk5ZM1lmdlhQakozWWdObThhSFRVcHNMN0ZxQlVTUHlRakl1?=
 =?utf-8?B?d3EzdWtwRE5aVy9KYnNvU01BWEZITDlnTjhDYzFNWXl2L0pBSENlVlpVcWNW?=
 =?utf-8?B?UHdhRmxLVm91ajVBemxDMm9xdEVzUTBtQ1RUcTUvMlNCcTlkT3dNcVl1RS9K?=
 =?utf-8?B?b1ZFeUFvbXVldzJnSXRqMDJuZ1dTbEd2TlhYbHBpZXMrM0FGMUxieG9TdjVT?=
 =?utf-8?B?Zm9MZTlxMXQ2QlVReCt5T1NCNTEyYVZ2Y1FEVlVLMUNjYmZhTE5hbTRtcEJo?=
 =?utf-8?B?VlNUM1UyTzBSTjRZZEZTQWE2MnBGeU1keXVCNFJSZnRScjBQWU5mRlZWcGxq?=
 =?utf-8?B?MHVmMExaT3UwUmpCdUR2bUFSWGU0SUFaMXMwZFF0K09OL2dQZ2pIWXVlT0Ru?=
 =?utf-8?B?aVczaWNlcTRPaFRHMGRWN3l3TDQ3T2hmSjhsNU1HQmdlR3hjR3ovcW9kMFVT?=
 =?utf-8?B?S0NSVjJHUHdCOXJvTGtoYmN0RE53QlYyQk5RNGVtRHIySUF4SUJrZ24yUHlj?=
 =?utf-8?B?ZFd0Q29lWC8zaVRxd0IzK0g3UmJRUkMzRWFOR2lCNGlWY09xWGVmRHdPUU4y?=
 =?utf-8?B?TWo1TFpFR2RtQ0ppejJ3S3pZek1TSUg0eUhNSkNGS0lNMWw2SDFoaVVXL2pz?=
 =?utf-8?B?bDN3ZDNITEJRV2R4bzA0QkZXYlpuVThvcHVpaDRRSko1V2t3WFU1QysrWWd3?=
 =?utf-8?B?QkZWR2Q3VE9xT0tUdTgwMXBlcGoxVVdxUGVFS01HUmJsczdJeWo1NHFUNkFx?=
 =?utf-8?B?TENKU0VPRG90bjB0eHZhUTJ5WVZlRjdoMWw1MlV6RzF0V3RVM1BNV1djOEpk?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa0ca53-5f99-4928-137f-08dd4146d39d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 15:57:41.1508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xOO8TsG2xzpL9cgGw8wIdRfypNqtAPuQGO7ikPHTbbhyJkHNc++wso1aM5RJvQFEriW+NR408LAONpqOI3FG+VizuXu9OgherjLUKBebJ5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8087
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Jan 2025 15:57:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6216

Hi Simon,

On 1/28/25 11:23 AM, Simon A. Eugster via lists.yoctoproject.org wrote:
> This patch describes how to use overrides for grub-efi-cfg because that
> is otherwise only clear after reading the .bbclass file. It also adds
> a description for GRUB_TITLE.
> 
> Signed-off-by: Simon A. Eugster <simon.eu@gmail.com>
> ---
>   documentation/ref-manual/classes.rst   | 16 ++++++++++++++++
>   documentation/ref-manual/variables.rst |  5 +++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 761be7b545..1d64ac2f28 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -991,6 +991,7 @@ This class supports several variables:
>   
>   -  :term:`INITRD`: Indicates list of filesystem images to
>      concatenate and use as an initial RAM disk (initrd) (optional).
> +   Can be specified for each ``LABEL``.
>   
>   -  :term:`ROOTFS`: Indicates a filesystem image to include
>      as the root filesystem (optional).
> @@ -1004,6 +1005,9 @@ This class supports several variables:
>   -  :term:`APPEND`: An override list of append strings for
>      each ``LABEL``.
>   
> +-  :term:`GRUB_TITLE`: A custom title for each ```LABEL``.
> +   Defaults to ``LABEL`` if it is not defined.
> +

I would rather say that it defaults to label's name (``LABEL``) or 
something like this. GRUB_TITLE does not defaults to LABEL, which is 
what this may imply.

>   -  :term:`GRUB_OPTS`: Additional options to add to the
>      configuration (optional). Options are delimited using semi-colon
>      characters (``;``).
> @@ -1011,6 +1015,18 @@ This class supports several variables:
>   -  :term:`GRUB_TIMEOUT`: Timeout before executing
>      the default ``LABEL`` (optional).
>   
> +Each ``LABEL`` defined in the :term:``LABELS`` variable creates a GRUB boot
> +entry, and some variables can be defined individually per ``LABEL``. The label
> +specific override names are defined as ``grub_LABEL``.
> +
> +For example, for a label ``factory``, the override name would be
> +``grub_factory``. A custom GRUB menu entry titled "Factory Install" with the
> +additional parameter ``factory=yes`` can be achieved as follows::
> +
> +   LABELS:append = " factory"
> +   APPEND:grub_factory = "factory=yes"
> +   GRUB_TITLE:grub_factory = "Factory Install"
> +

FYI, I believe this is currently not properly handled by sstate-cache. 
We use the same OVERRIDES trick on extlinux.conf generation for U-Boot 
and we needed (it seems like, wasn't there when it was implemented) 
explicitly list all variables with their OVERRIDES.

c.f. do_create_extlinux_config[vardeps] in 
meta/classes-recipe/uboot-extlinux-config.bbclass.

An easy way to check that would be to only modify APPEND:grub_factory 
and see if it regenerates the grub config file appropriately.

Cheers,
Quentin

