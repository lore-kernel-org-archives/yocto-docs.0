Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6110FCCD187
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 09:29:46 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.65])
 by mx.groups.io with SMTP id smtpd.web10.7960.1760002179977986096
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Oct 2025 02:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=XoIGAotz;
 spf=pass (domain: cherry.de, ip: 52.101.83.65, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPmEbIwkGjOsLyRF6yyPT0SDhWxG6YpyIg2trqJQ1r7Q64Mv2t6hOKNv0dsMA+/HjIEkiY7QFR+XaOgiOvgcgVmma42kenue1HOZzFIMkIIEZEpoApejJa2VkV5fg2HdZkGqcRz9eOv54yoOVJMLioQsbmPBBFgyWAtrhvgu4H6gYBv14CrNUjTn1hqWP6OWEurD1vvvSV4arBbyXC1uNxxzdBNkpQorfw9UsNt9V5mRyzLAn97shfcU0tM/SoGmPohY/H1+akOled+dkvgF5/Wvwlcpd32dsWmEgc+Eeg4xB9iqhfDO1nJutvNNa6e2dGUPoZe5eGEcpJyENG3AUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVsgk1EKwFWMsu6r+pNa5joLorLcwALru/UEEsz8FWU=;
 b=VQlMfYZX+qrLk8sndmIIFmnDftIzLnT2NJHovP43pfiV1XdHQuJDdapV1vdhCMxuSlv+hwYjeHBHdWJF+x33KucLQra2iThI91FKS+rqAIW7xfxXsOPPVJGNLST1SVZGu2SGyKNcrN41cmfuuhuLmZKmKDuY3VYkVc4UESBWtDLpYmHMYo5vaY70C05SLP2dEtkbQ5VcMtOVDJ+hQ35BqV4y/g49mqh6isJnq1Bet5Yy3XDyYdlxyX0dm9SI8E62/h0SQAq+ZNOhkTLqmvybph2A9Zqd75AF6BZdeVRZtSLy+xTBCGEUElPK20JhnHgAv+D/V1gup9uO+dVbNbiFKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVsgk1EKwFWMsu6r+pNa5joLorLcwALru/UEEsz8FWU=;
 b=XoIGAotz63NXZmv0GTTNGk17pTryg0klJDdIbRiWU3C/93JNu9JLnTNAdxNmC53XuR/+p03GGo5RH0Vl4KnL9k0sEU2oCZ9wCE5IuYcCvp6QtZwLjsHRmnY4rFX1bbx9JH3LfeT2nmN/XJiNW75iQMOmdMVOyy0VKJPhPryHiEo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10127.eurprd04.prod.outlook.com (2603:10a6:150:1ad::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 09:29:33 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 09:29:33 +0000
Message-ID: <c9641d08-7fbe-46ca-a89a-9723d60eb7f2@cherry.de>
Date: Thu, 9 Oct 2025 11:29:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/build-docs-container: make concurrent-safe
To: Quentin Schulz <foss+yocto@0leil.net>, docs@lists.yoctoproject.org
References: <20251009-iid-file-v1-1-d9ca8563c88c@cherry.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251009-iid-file-v1-1-d9ca8563c88c@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10127:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aaff0b4-22b0-409e-c387-08de07165b10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZTIyV2VReWx4bFMwZE1ON0sxZ2VVeVBiYWE5eHRyNllVZ2xlU2d6VHZZSkR4?=
 =?utf-8?B?MEVsTjgvcllacUVxcG1tSjlDMkVTbjU5d0NMQ3QwWGVyU0VhVlYwV0V0QnNU?=
 =?utf-8?B?endsQ3NhVU8zMHpoWDhtNE5JME1idCt1YVh6NGU1V2dnNnU3L0Zmc2UvSGd4?=
 =?utf-8?B?OFBsR0x0Rk9LV0NmYStiV0FCUThLTStiaHZycTFqYWNEZ3haMlpDMjVIalFD?=
 =?utf-8?B?R2tSYndzMnhiaWtYNno5ZVdBQUJ5cG5aMmZqMFFtaWNLemFCUkF1TVlvcVhp?=
 =?utf-8?B?a0RURThMemhUbGhBais4YlVyNkcyK3RrSHdnTzR6bHJZbDN5Uml3NXNVdjdS?=
 =?utf-8?B?cEJLOWtVUTViUG8ybklVZkZWOUlSeWFBRXBDK3BGUk50NXZPcHJydHVjeVp4?=
 =?utf-8?B?ckJJb3NvU2VBNVhoaEt0bTgxSlgyK3h3bVBITHBScVBuTEpzejUvUm5FNWJT?=
 =?utf-8?B?MENlR1lodDJlNVRkSHE5TjQxZDVlSEw0YnRkZGlnNVZYL0JWc08xVkFwbXNY?=
 =?utf-8?B?aDIrQzdyTVlnRE1uWWhodzRRRVFvdU5SL3lXcEFwQ3lGV3laczcvejBJY2dJ?=
 =?utf-8?B?OHM4WnV0Q09SSjJqSit4dFJ2SWRGa1pxcVFaMnVvSlFtT1c3N2VPenMzdWNQ?=
 =?utf-8?B?UlN5UXFJODVrSUkxOFpwdUlPRCtVRys2alZXcmhnRXYxdlBDdzNaV25yQ2NC?=
 =?utf-8?B?ekREaFZ3cXEvQnNqb1I3SnZTc0ZFYlFtcjU4VzQrczNkMDZqYzVWemY0YXNW?=
 =?utf-8?B?QzQ1b2pxTmVVUWVwQzJjQWVFdDBXOXVsclRDMTdYZjZoVGtGNUxadXhHbWFM?=
 =?utf-8?B?WHN5ZW9mcHJHMlNFNnVWVEZoUlBLbi9HNEIrRHJxOE8yUmhQYSszNzJmOXg1?=
 =?utf-8?B?NjVjdG5SVnBBR2pFalhvV0ZsaU9TK3V5bkhZaFdRNkpGZlpvSU5Da2hlcndP?=
 =?utf-8?B?bWRQWnIwaEZ2UHBjOXVWdU9LbHZzUEtlVDc0YXhGZkUvZVlESktFQzl3SWJX?=
 =?utf-8?B?Q3hGTVJIM1FlekNtbE5haE9KRWxETklOQnpXeDVRUlFnM0ZVc1NhY0NMcHg1?=
 =?utf-8?B?SGhjdFl3d29LV0VwTW51Z0IvNitJQWxxc3AycmlmQjNMWTZhUUppem5kLzUr?=
 =?utf-8?B?YXBHMy9XYWl1M2ZKQW8xOVZTd1Z5WXpJcUFXQXNZZkloS3AzMndsWHVkUnVv?=
 =?utf-8?B?YmlFeU81MjhKVWlPSW9lWjNsUi9ZaG1Ra3Q5NSs2KzRvWlBFdkdTN3JXNDJl?=
 =?utf-8?B?VCtyL3k2bWV0ajBzYWdOektGSkppeDFDNXNITExZU1ZvZ1M4TEs3UUYwSVNh?=
 =?utf-8?B?UWlYUUhUa203bkpCSzFERStldVI0RlBDZmVtWDhKbnF6MUwyNmV5Vm9xeWNW?=
 =?utf-8?B?cExUcjdhYnowVzVpU2lTbTNYcEFtMUlvcXp3OXlWYStKTGNHQVdScFl3cGdX?=
 =?utf-8?B?YnBHMkRDMXRYVUN2UVd0QlNZM000RDVEbVRvUjRFU2hwN1BWemh6NTVCNDJC?=
 =?utf-8?B?TnJ0R1Z0TGd6K3J1OU5KdXhINmxEN0ZuUkxmbWpCYWRMTWFvWEhwVE1WUjJY?=
 =?utf-8?B?cnRCVGlXM21XeHRGR0NlTnZvOE9tbkdaRXQzeWtmRnAyRW4wOFNYbmRFdUdr?=
 =?utf-8?B?RnROV3kvRmtHcTJvWVV0MFhXRXE3ZE5DaEZHWllCNi9SWXV4NTk1ZDdxbytN?=
 =?utf-8?B?N1ZzVXduTzR0R21nd3k3RkRHbmJQYjJkQTlvZzZFcU8zSGdnK3pzWnlvQmZa?=
 =?utf-8?B?U0lDRDZuTG8vbXhDUWszWTA4c09vZkRNc29rOHBGeUZGS1V1M3NIc1NPQ3lt?=
 =?utf-8?B?NlFoY3dmdG80T1ppS2JTUElld0VQdU8rbGttY1hJcHpuZyt0MTJaQXNyVERh?=
 =?utf-8?B?SnBjS09wWDNQUW9LL3RTK0MvSTFjWkxDdFBtUElwd3k3d3lnVDFtZ3p6ODJn?=
 =?utf-8?Q?ctWUOuARdXBS3h0ivhP41BeixoBrzOMJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SXJucTJ6OUdGRHYrVE5VMUoramRIU1lmZ1ZjTHBPQS9UREJaaGtpQUJQaE5h?=
 =?utf-8?B?L0NmUkV2K2MwVFNnR1NodWNlRjg0RE5vWXAybm44bUVGMzVIMGZvbnRnZzha?=
 =?utf-8?B?R1N6SlFrMFJNMCtlTm8wd2hDQVN4VEp4R1hqR1dQV3lsQyt6TnlneGFVUmVw?=
 =?utf-8?B?N0xOY0tvdytSNlZWRjNLQnZSbkxVcGl2aGdBYW5adTJyM21xcVZ5ekE5TGlL?=
 =?utf-8?B?ODFXTjdXaUtzZ0g0NExPSVRlcVBDb21kM2ZYRGRzWnNLOU5rbU14VkRYOGRo?=
 =?utf-8?B?QWtTVmZZN2U0YjNjWTBJYlZqRnpMN2xHczg5amRwM21XM0F0VmF2NlhzMnNx?=
 =?utf-8?B?SnpXME85b01sZDNJbFJJZHdFblZ4WDhPYkpQWjV4Qzd3NWVDUy84a0xQVGhC?=
 =?utf-8?B?NzI5VzhvWXViWWZ6b2NzYUd6NGVTQjB1Nk9oRk02anh4ZFplcTJ2S1ZWaGNZ?=
 =?utf-8?B?c1NpdVZ2SE9UNWNmaWQ3MGh1dTNDSDkrVkdFSjk3N3VRTlJ6ZzBnSmE3WjNX?=
 =?utf-8?B?YUloT3oycnpxL1pkUCtBUXQ2NHRHWUxCREJYaDhMWWhnSWNjaXFvS2gyUWJJ?=
 =?utf-8?B?VjBYSWNjNzd6TTc1T1l3WXJveC9uaEUvbXU1Ymw0enBTOGY2dm1INERva3NH?=
 =?utf-8?B?QjIwSVVwWXYwNm9JZVR5eHVvRnAzaUV6MVlzcTBLdEN5cXlaSWRzdklncVZH?=
 =?utf-8?B?Y3VHNDlPZHlWVDFpNXk1MW9GWU5FNk9uUDZlb3MvcGdxZ1RqY1RFTFIrQ2Mx?=
 =?utf-8?B?QjVhNFZTTWoraFZkbUNWV2VXcmlBQmhmcm90OHhOK240QjdiWGFFUGVEQTQ3?=
 =?utf-8?B?ZUlBVzZ3U3oxRkV3SjFkazdyZGhoWWl0NDZIN21sR3BFWTV6TnhFZ0oxVndo?=
 =?utf-8?B?Y0tLWFcwampmeU84WjBMbEI3R2E3Z2hwWnpYVTRCUVV5UEdMVmdxNVFkMEF6?=
 =?utf-8?B?cG4xeWRLcmJzUkZtamdrcFl5ZGt1L2F1TUhVSW5mdlBTbnJybzZoYXNqT3h5?=
 =?utf-8?B?M3JydDkwTldxZCtEdWdtbkpyL2RmUVJOWk5zdEhsbmswY3NndStpcmdmTXBQ?=
 =?utf-8?B?VldvLzY0Skp3RW1USUVVK1pXcXBmTHdFZW5VYXA5YzE2MXRxM0lBQ0M3cm0w?=
 =?utf-8?B?RWVkOG55ZkxTa1Z1bDlCQUpnVktPeXBHSVBEYjYvZEMwL0F4Z0gxTzNFSmhO?=
 =?utf-8?B?cnAvb242VjUrbVBvNGx1Tm9jZHlhN3pXTDR6WWlrZTRreUI1TjlnRTcwZUdJ?=
 =?utf-8?B?RFJiN0p0TlNYMGJkSXRzR0VrWjBScmxZVzVGOUlYSFMyK0pWVTQzQWI4dmxV?=
 =?utf-8?B?a3N5OEpXMDdlOUQ4eUozUVEzZlJPRTlJNjRpekozZFZKZGFUdzBDaHVPa0U3?=
 =?utf-8?B?NXl2aWs5czVMOHpVOS96aFF0QUdZbnd1OXRnK0pDVVcvQ0EzelNMK3FTUUYv?=
 =?utf-8?B?NUszTVhOalhQUmZqZndMUEliRm55MUkrT1lMYTFtZUJmOG1vcXQ3Qmh2d0Nk?=
 =?utf-8?B?WFFGVGpFdk41OTNRL3B0YzdWei81RldwT2lpdEoxbTArOUQzd0ZrNkszZXJo?=
 =?utf-8?B?dzRmTFZCUWRBUDBuejR2T3ZVUTNFT25TN2QzSTRMQ3hhTDhBYndpS01pbk1z?=
 =?utf-8?B?SzhaNWJNOFlYN1VwTitTNndtREQwN25VR05XMmZtWUxURTdCZEdrTi9EaFpq?=
 =?utf-8?B?L3B3a1o4YUF2amlXUXE1U2VLTHFkd1FIVlVBNDZHR1VXQ2ZMaHVBcGVzenRl?=
 =?utf-8?B?NDZLSDl2SS9nWURqVzJFOFM0cnBTb3BITXk1NDBpSkdaYkpBUFRNdjEreVpB?=
 =?utf-8?B?WE9DZVRiTVJidGxrYmU5TyszRVJrZGNFWWttRmp1Ty9qWHZlajd3SVExQUVj?=
 =?utf-8?B?VkpSaDc4VEpLOXJkSXo2TWVYZnFHdXZFMld0YllFM3JmTXpuMFRSc2M5cnVK?=
 =?utf-8?B?L1hTYTY2eDBqYUYzWUdabFREdUNCenIyMDJHUVkrck9LTkZmZlZ4aEE3aDkv?=
 =?utf-8?B?clpENnJEYkpBUU5RSWs0K3IzYmZjWlh3Z0JFbTdRUFpQY1BZOEdYSEtXeTNL?=
 =?utf-8?B?OWRlQ2pmOTZoZFk5c2xVamFaMUFXNFI5WUl1QUZEL1FORDJ1dTF1dkhwaTRH?=
 =?utf-8?B?VW41dDBpdmEvRDZMRWFlZFgyL2FRMi9IN0p4S2g4aHdKbWxaeXRDYnJMa0tN?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aaff0b4-22b0-409e-c387-08de07165b10
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 09:29:33.3828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYJ1gVN+UPXwhr/KBJaShR1AYkNnpTiXS8BczUWNIJkLhQ9tgkc/4daQudZILAaJggXSY/ZeyByI31DtMRgWf/qJ6rwrI3CjxUKyNWcFN5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10127
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Oct 2025 09:29:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7671

On 10/9/25 10:59 AM, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> We aren't that interested in tags actually, the only thing it brings is
> a belief that we are going to run exactly what we just built. The issue
> is that this is incorrect.
> 
> Indeed, one could simply run the script in parallel for the same image.
> Script runtime A will build the image A and tag it X, Script runtime B
> will build the image B and tag it X, Script runtime B will run the tag X
> (image B), Script runtime A will run the tag X (image B). One way to fix
> this could be to introduce random numbers in the tag so that it's always
> unique, but we would be flooding the system with useless tags.
> 
> Instead, we can use the sha of the generated image and run that sha
> directly. If it's the same across rebuilds, it'll stay the same. If it's
> different, the sha will be different and thus we are safe from
> concurrent use.
> 
> The only downside is that we cannot infer from the image sha the
> underlying distro we're testing.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>   documentation/tools/build-docs-container | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
> index 70e05f295..f3ef21304 100755
> --- a/documentation/tools/build-docs-container
> +++ b/documentation/tools/build-docs-container
> @@ -64,10 +64,6 @@ main ()
>   
>     OCI=$(which "$CONTAINERCMD")
>   
> -  # docker build doesn't accept 2 colons, so "sanitize" the name
> -  local sanitized_dockername
> -  sanitized_dockername=$(echo "$image" | tr ':.' '-')
> -
>     local version
>     version=$(echo "$image" | awk -F: '{print $NF}')
>   
> @@ -139,8 +135,14 @@ main ()
>         ;;
>     esac
>   
> +  local image_sha
> +  local image_id_file

Shouldn't be local if we want the trap to work (otherwise reports 
unbound variable).

Also, this actually isn't concurrent safe as we would be building in the 
same build (_build) directory. We could fix that with:

diff --git a/documentation/Makefile b/documentation/Makefile
index bade78fe8..94d19e350 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -11,7 +11,7 @@ SOURCEDIR      = .
  VALEDOCS       ?= $(SOURCEDIR)
  SPHINXLINTDOCS ?= $(SOURCEDIR)
  IMAGEDIRS      = */svg
-BUILDDIR       = _build
+BUILDDIR       ?= _build
  DESTDIR        = final
  SVG2PNG        = rsvg-convert
  SVG2PDF        = rsvg-convert
diff --git a/documentation/tools/build-docs-container 
b/documentation/tools/build-docs-container
index f3ef21304..3bc66970f 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -60,6 +60,7 @@ main ()
    fi

    local image="$1"
+  local orig_image=$image
    shift

    OCI=$(which "$CONTAINERCMD")
@@ -160,6 +161,7 @@ main ()
      --volume="$DOCS_DIR:/docs:rw"
      --workdir=/docs
      --security-opt label=disable
+    --env BUILDDIR="_build-$orig_image-$image_sha"
    )

    if [ "$OCI" = "docker" ]; then

This would help a bit more but we would probably still have an issue 
with concurrent runs of $(SOURCEDIR)/set_versions.py which edits the 
source tree (generates poky.yaml and switchers.js).

I can send a v2 with the local image_id_file fixed, an additional patch 
to build in separate build directories and reword the commit logs so 
they don't seem to be guaranteeing concurrent safety.

It should however help make sure building two yocto-docs repos 
separately at the same time is now safe.

Cheers,
Quentin

