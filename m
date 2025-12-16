Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97668D609A5
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 15:08:36 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24736.1765897705599786902
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 07:08:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=kr9z1UOF;
 spf=pass (domain: cherry.de, ip: 40.107.130.15, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVn+dG+egExz6ocK1443WeNrUrvOGVW7XqW69gM+ZMG9mdB65pSwQubVL0850V90pczZ5EsfKYrDNz8aJK/2xstBHMTpUXZZqZBVX3rrZ1cnF2D1RalGeKD5oEsaOioplKOXy+ssu12mNhmYgZkaGJHznOHR+82YWBnCty78ERhZhIYKWE/SjLGkEDMf/zeuxisiUwwc54RXIMEm5SMbS8m1iOr6c7QimmfAT2PbqjslNSuOYhsshjMpnafojEdxf1BUrHxYguLfQnSrNEDuAmmh/2ywJyzkYxDWjA+kUYmaG7P7LpWqMg/PsR8mjAkOtl1pSo3g5wR1ea4+j1+kuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILpN7nCfS4zifQPHfcM1FwYb8e9ZC29Nk3syKp0ur+M=;
 b=aiVcWKjsz0Zj3Gs2IM1iu+rh2/gS1MPmm/rP1JkaVsqdVqul4Q8bOWqdBJhUonyU2tmHaAnSZV2DIrzeyTwd4+Pq4+4nX1VuLpx8QqnhXnfiJcUTWAhH8Xl6VFyXdvQVdiLyZarZir8TedmLmXL6kpdZAgZhFDDZjJ44TJz1D/APFsCg94LeEjgBAxzcCkE1l5SQJGJqUpdLuM0P3JcthhuykBoBzUqu0knT7FIUnWQVbQRjOFv2DoiPFqgj3k1XdR9r8Yb3J+ABZ28Cn2qMugCav4Fd/NJ1unCbMSx3/7wIy1jUuJnbx1e9eE+535c5j42F1/It5mj5fcx38hWzAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILpN7nCfS4zifQPHfcM1FwYb8e9ZC29Nk3syKp0ur+M=;
 b=kr9z1UOFElptbKX0pUGovcr2lGXD8eregoM+VryOUE2iN9NYXgcSB8B0MjuHHdWvKdCXhuLLdQWRFxUAeeconBM2O/LI56uW0Y/1K7Ys/TDyZsGGLtbi77ranNkteXn1iowBkjP8MS/jvqABgnGclaFAqkSzA+lqMp4oDr/SCzA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU7PR04MB11233.eurprd04.prod.outlook.com (2603:10a6:10:5b2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 15:08:18 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 15:08:18 +0000
Message-ID: <91a4c433-1c40-4aca-b96e-4448c610fb10@cherry.de>
Date: Tue, 16 Dec 2025 16:08:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] ref-manual/classes.rst: document the
 image-container class
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251216-image-container-v2-1-630e5f91c0d9@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251216-image-container-v2-1-630e5f91c0d9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU7PR04MB11233:EE_
X-MS-Office365-Filtering-Correlation-Id: e7fd1768-3c53-4a04-aa8e-08de3cb4f1d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q011aGdDbGR2eTJjUHJ6dGd3bmNaL2c3NEttTXNEd0RTdFdUcGhxRkpnMW5j?=
 =?utf-8?B?OG9nTXFnL29ZVDE5b2NLTEVzSW9xUkpQcWs0MmhMdFVZdjIwSGU1M2xnZmJE?=
 =?utf-8?B?WXFWMUM1MWJRUytUeXdENFAvanVjS0U0TmVJdFFnaW43eUx2eDBuQkl3TEh3?=
 =?utf-8?B?RGUxRSs4YTdZc2ZRRiswZjFmNjNhNmVxY2gvZFl4elkvVmtESW9VTUFuYzRB?=
 =?utf-8?B?ZmpXSXNzUUdRN0NDNEZwa1Zsc1l1dlM5eU5YbXBhTWNPNVNoR1BxMENGOExu?=
 =?utf-8?B?Y0F1YmVaNlUxQitySHR4WHlUeWdzQTVmMk4rb0ZxN3JmNWVoczJodnR5Y1JO?=
 =?utf-8?B?aUxoczBab2dPT1MweGptUmc2UEY5cTgvejNQcUR0VEJIMjA3eHVaTmdXZkpZ?=
 =?utf-8?B?T3ZDMTIrNDdZcHpsSXJHR21oeXZUaUpNQVB0SUV5Ym5Gb1N6T3dGNlVlZDRx?=
 =?utf-8?B?L3lUSDh6V2RGcW9OK1RGUnJwVkQxRkFkUjBJMlBHRXk1RnZ6LzYwQ0dnMVlX?=
 =?utf-8?B?REp6MmU5dzBpRHNwTGpZMUZvMGdIMEZCeXlCUXVadmFRTis5UjJNUDIveUt5?=
 =?utf-8?B?TS9aeVYxWUNqc2hWT3FZdTQwWHdKeU9yNDlsMTlwU2h4S3hRekRJVE5qRHFK?=
 =?utf-8?B?SytTbElMamUxNkViWEJoSUFxOXBVOE5Xa0Y1dVZ4UmxGRTF4MmV2OXYzZXBP?=
 =?utf-8?B?UHlqN2F0Y0hRandaWDc1cm9yald2V1VoTWJYdTNLOFRlS2hVd2FLRjJSTzc2?=
 =?utf-8?B?SkZLVXZPN2QxSUpkbFdsQTNOQUtIV0oyOVlxY0VqVVBmMVIva2hVa3lMNEw0?=
 =?utf-8?B?VENoYkFEeWZoZFFpbkdFWHdSdGUzakFIQng0WTJQeWZVdGtVOVM2aWVhU3lD?=
 =?utf-8?B?M29vdnAwVmtyZ05SR1k5d0VoTGxRVzl3alkwQlgzQm9UaHYvVG5RalBuUUQ4?=
 =?utf-8?B?S0t0SEdPSU9YV2xkS3o4SEJZSzJDQ3ovMFN2WnNyU20wTHpacGtSMW43LzEx?=
 =?utf-8?B?by9wVkt3VlkyTlRkYnhaR0l6cFgxbDhzYmhUMlQ2cnV6cWdvbVJyWEtPMFZT?=
 =?utf-8?B?UTVnNEFmL1VwY2hFZzltVnVGVy8vL0E2TDBYS0lpRnhlNTN0VlhZYUVpK3NL?=
 =?utf-8?B?K3ZYaG0yVGZUT1BGQjRyYWpTRjViTU55SjluZ01FWnJReGtNWXNqT3hZNjh2?=
 =?utf-8?B?OHlIZHFwRldMa3FPNjZsSjFLNUdEeFFhU0lwM0YrQStvNjgxZG40c0pWdXRT?=
 =?utf-8?B?WVpHOGZMRzhubFJHS0N0UXdDdm1HWEdvNEw0cTkyWGhoL0Vha0FVZ0hWQ3I0?=
 =?utf-8?B?ejg4ejNhVzl6cUthMmxKb0pmc1QrOVNQcjJlOXJkMXJ3bG9nZ1dKVnhqSldw?=
 =?utf-8?B?OXJMeVBSK1J2NWNETUdEdko3N0tMR2Z1b1VQc3dYSmtxNFRLd3VKK0c0MjMw?=
 =?utf-8?B?cG1TbkROaDhCM1NZSmFxWGJFNUdxVUtDRHNqMjZqc2FISXE5VHpRWDQ5T0RE?=
 =?utf-8?B?Sjc4TmpZdkxPSXQxcWxpcU5rSTRaRmlrWTJlV1grRWxWbXlQZk5VM1B5ZzhG?=
 =?utf-8?B?OVpYeEE0Qm5GVlE2RThiWUFkdittcThBSXpROXFweW9QMm1PbktITUNOcUNw?=
 =?utf-8?B?Z1RuMXNMdWwzVk9lcWlxb0szMFJDa3pUNXQvOE10OUg5S1VVSnJYQ09jaEkv?=
 =?utf-8?B?dXA1QmpUUlVkUFVJWlQrWmJLbDhUOENsaDdwbUMrWWNidUZVak83TDdobHBo?=
 =?utf-8?B?ZFdPWU5uaEhGelVFMWg5KzIyaTcySnlhOHpFckdFVVVwRitlaW92TzZvOVlR?=
 =?utf-8?B?MWgvb291QkVCendnMytaemk0cGI1MmFLT0xKL2xVUmVYWDFzOTVzZ1hkL1Z2?=
 =?utf-8?B?TGN3cW5Va1dtTlFwZHo1UElWSEFXSzV0WUJoc2tJVlN6Qnc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RE56SHVUSGJ6dWFhcnpMc1R2dDZ2RVVEeEp6cStXOEFaaFR5SFdOKzhFMmk3?=
 =?utf-8?B?M05PTWpKazhObTNxSmJ6K1hUR3VVR0gzTXhHOXhRUU0zbCs0anAyejNGRGgv?=
 =?utf-8?B?a0ZpWXQrMGorM3NDd055MmZtTDc2ZWUraHNpWHh1QXNYZG1FdDRTVEJxQ050?=
 =?utf-8?B?dHVzdTlja1VDNTB2bzlZclBWaHg5ZXpLUVpmc1NSOG1BWkM1TUpLOFhSRnpH?=
 =?utf-8?B?aXluL1ZoSGZzQ1ZkeXpDdDk2MDFOMkVQeDZYYS9JcTRLR0tDcGdhTHVaSHhh?=
 =?utf-8?B?bnB6Yis5UXZDMzFXTGlQUzc1V1hXSWVRdEt4QWFrdDJmUW5kSExlOS8yUjlN?=
 =?utf-8?B?d2JJOG9DbE5rU01pRHhwMHVnRDk4elhCbjBRdS9OZmF5TXBxa3UvWWU4S3pq?=
 =?utf-8?B?aW54d3Z3U041bkhvZlpNcXZ4dGhsbTBYUUJPUWIyT2dDUkQwaldNUmtyaUYz?=
 =?utf-8?B?bDVVbk9pQXVQN29GLzVhU3VOVzhFYzhpZG5mQWNDc1VtUkxUZ0x0VWJyZDd5?=
 =?utf-8?B?Y3BQTjNjREpCYnVRQ1kyUXdyS0srNFpiWThaSDRaaU5XZm4xV2E5bU1hSWU2?=
 =?utf-8?B?Wkd4Q1U2dXlKRENRZ3dLVElzYTArb0U5bmM2REp2dWNSc01ZZEw5ZnZBejhW?=
 =?utf-8?B?NkVjSHArdGdOS3d2OXp3M09Sc1BhNVB2ckM1V1ZIU0FFcHVyOUJja04reVN1?=
 =?utf-8?B?THQrakFDK2wwRnhjaXR6VXk3bEgwemxya2kxTWlZeFQwM2orVzRYbTV3Vjdr?=
 =?utf-8?B?VlhqTWp4UlV5bXlhVlpDblhIdFBUanlrVm04Z2tFWm9BRi85YkpadWNEanBX?=
 =?utf-8?B?bTJob29RTWhCKzdRclh3U2ZXcDVlWlpZZitzOERQaGwydXB2dW9UREplTXZS?=
 =?utf-8?B?V3hTM2NlcVdZVStUWSt4VW51bDUrZEJQN3pZSDNoeE85clN2elV5enR6UDlR?=
 =?utf-8?B?MGxZSkRHMVd1c0xMVCtqU2ZZWGFBNUNBYUR1eldnZWppWkY2Q2NHZXA4RjVv?=
 =?utf-8?B?SU1VM08wQW5QZDNxdTRDWk9hai9GWThRU0JVTTUvTTlWU0RjOSs3Z3pFTGpQ?=
 =?utf-8?B?NkphdUx2SHBSUjIrUUJwd1oyTWhWeUN0Yk1ETWNGN2VrSkVNbGNKM0dBek1Y?=
 =?utf-8?B?QlUwaUNFWE4yK1BZMGsvT1R4TEgxTXN1VkhwYTN3TkNnY2VKdTh2VCs4R0cz?=
 =?utf-8?B?UkV3aEQ4V3AwdzNaS2RrWk5iWVJQRTdBbGxkK2l1cWZpRjU2cmxtK1BpOVYw?=
 =?utf-8?B?VWZ1RWJWcTFpNk5kcnVHS2RKai92N3BMZWpQZ085c3pQVTI0bXplQm1VQW5V?=
 =?utf-8?B?VERMSkZ5a25uZVFQN0oybUhLZ0ZNQ3ROUHBxcHVEbE5Kbld1dFNqbnFLcWpG?=
 =?utf-8?B?QmkyZzhwRjhURnlvci9vMWVCZHRvbVU4bTRFRGtpbjRLdDVRTFUzKzRMVC9T?=
 =?utf-8?B?bFRjb1RaNXhKb3Jpci83QVFKaXpYUjNJU2gvRGxkbUFid2M2TklObmVzd1Bq?=
 =?utf-8?B?MitMV3RCYWJzV0IrYjRtUlpLVzBMTU5YdXhqWUQ1S3hlaFZpOXpkd3Vaa2dn?=
 =?utf-8?B?UGorWkV5U1RGY0JGYU1RWlp4ckpzU1cwOXREVTlQZEtYZGJwY29Ta2NiSmZv?=
 =?utf-8?B?aC9nRmRWVW5hbk9raG1IOEtRVlllUk5LV3RiaWMvS09XTndZSXk5L2hTWFFS?=
 =?utf-8?B?QTdUQ3dNemNKVEYwOHBmank1RkppKzd1cUZ2a1hIejlHV2p1ejNYdmpQWTlQ?=
 =?utf-8?B?NmduNUMwYlBYTDQzV0c0UFl1Y1c5eDMwZVJJLzU0ekh0YkkrN2pvQ290elUy?=
 =?utf-8?B?SHcwZ3pwU2xjYnpCZVRqRHpKaGlCUit3Y0dwbitvTCtJQ3Z3QVpZeGFVUlpz?=
 =?utf-8?B?N3IxeVdjQWljb0w1QkZxNUR3SG9iUEc3QW14MkVPUmNiVFVKTUdSSlF3YTZ6?=
 =?utf-8?B?NW9qUFQzNHRsTlVTbFdPOVRJeXJmakpjMENtelVjd2lyeHArTmVJbFpJK2Z2?=
 =?utf-8?B?aXBLdDRxRU5lVFI1Z3hTV0RWVkduY0c4TWR0ZStveGw3R1VoZWZvRDZsaGFW?=
 =?utf-8?B?YVhiQWJzWkNqcTNXRC9MOVRpcEVsWUpkaG1SMk1TemZTNU9UU09wbzBqT3NZ?=
 =?utf-8?B?YkRyUHF1UmVhLzFEWUcvQWtUOUl1VjgwYnRDSjhhK1pWdXFWSDRPT00yYS9m?=
 =?utf-8?Q?OkwYS5RIapSSKUcTSwrXcg4=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fd1768-3c53-4a04-aa8e-08de3cb4f1d7
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 15:08:18.3415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JPDcKH0m+iOkUv0E6oToI4c/qx7ptRFZBGZYdwGFXFAuoypqlllY3tcXRoZLmQDK2UkBieRStGZtvvChxGiOJWsa4nvHnk9y7x0Rzmf9qa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11233
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 15:08:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8290

Hi Antonin,

Only blocker to me is the last comment, otherwise looks good to me.

On 12/16/25 2:59 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Add documentation for the image-container class, which is a simple class
> to generate an image suitable for creating a container.
> 
> This answers in part to questions asked in [YOCTO #14368].
> 
> It also adds documentation for IMAGE_CONTAINER_NO_DUMMY, which was added
> in OE-Core with commit f0645e172bb8 ("image-container.bbclass: Error if
> not using linux-dummy").
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Changes in v2:
> - Review from Quentin (thanks!)
>    - Merge patch 1 and 2.
>    - Rephrase class and variable to highlight that IMAGE_FSTYPES should
>      contain container, and that the class should not be inherited
>      directly.
> - Link to v1: https://patch.msgid.link/20251212-image-container-v1-0-fb6586d06813@bootlin.com
> ---
>   documentation/ref-manual/classes.rst   | 48 ++++++++++++++++++++++++++++++++++
>   documentation/ref-manual/variables.rst | 17 ++++++++++++
>   2 files changed, 65 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index a56a2f719..6781c5294 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1258,6 +1258,54 @@ The :ref:`ref-classes-image_types` class also handles conversion and compression
>      :term:`IMAGE_FSTYPES`. This would also be similar for Virtual Box Virtual Disk
>      Image ("vdi") and QEMU Copy On Write Version 2 ("qcow2") images.
>   
> +.. _ref-classes-image-container:
> +
> +``image-container``
> +===================
> +
> +The :ref:`ref-classes-image-container` class is automatically inherited in
> +:doc:`image </ref-manual/images>` recipes that set the ``container`` image type

s/set the/have/ ?

> +in :term:`IMAGE_FSTYPES`. It provides relevant settings to generate an image
> +ready for use with an :wikipedia:`OCI <Open_Container_Initiative>`-compliant
> +container management tool, such as :wikipedia:`Podman <Podman>` or
> +:wikipedia:`Docker <Docker_(software)>`.
> +
> +.. note::
> +
> +   This class neither builds nor installs container management tools on the
> +   target. Those tools are available in the :yocto_git:`meta-virtualization
> +   </meta-virtualization>` layer.
> +
> +You should set the :term:`PREFERRED_PROVIDER` for the Linux kernel to
> +``linux-dummy`` in a :term:`configuration file`::
> +
> +   PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"
> +
> +Otherwise an error is triggered if this variable equals to another value. If

s/ if this variable equals to another value//

that is implied by the use of "otherwise"?

> +desired, the :term:`IMAGE_CONTAINER_NO_DUMMY` variable can be set to "1" to
> +skip this check.
> +
> +The ``linux-dummy`` recipes acts as a Linux kernel recipe but builds nothing. It
> +is relevant to use as the preferred Linux kernel provider in this case as a
> +container image does not need to include a Linux kernel. Selecting it as the
> +preferred provider for the kernel will also decrease build time.
> +
> +Using this class does not deploy anything specific in :term:`DEPLOY_DIR_IMAGE`,
> +except for an additional ``tar.bz2`` archive. This archive can be used

Simplify by saying "only deploys to :term:`DEPLOY_DIR_IMAGE` an 
additional ``tar.bz2`` archive"?

> +in a container file (a file typically named "Dockerfile" or "Containerfile").

s/"/``/ ?

> +For example, to be used with :wikipedia:`Podman <Podman>` or :wikipedia:`Docker
> +<Docker_(software)>`, the `container file
> +<https://docs.docker.com/reference/dockerfile/>`__ could contain the following

I do always go to the docker documentation when writing Containerfiles 
but I now wondered if there was one for Containerfile that isn't 
hosted/written by Docker. Seems like the podman docs hints at 
https://github.com/containers/container-libs/blob/main/common/docs/Containerfile.5.md. 
No action to be taken, just wanted to raise this.

> +instructions:
> +
> +.. code-block:: dockerfile
> +
> +   FROM scratch
> +   ADD ./image-container-qemux86-64.rootfs.tar.bz2 /
> +   ENTRYPOINT /bin/sh
> +
> +This is suitable to build a container using our generated root filesystem image.
> +
>   .. _ref-classes-image-live:
>   
>   ``image-live``
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 71fe11b83..63fb7fa79 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3955,6 +3955,23 @@ system and gives an overview of their function and contents.
>         variable, see the :ref:`ref-classes-image_types`
>         class file, which is ``meta/classes-recipe/image_types.bbclass``.
>   
> +   :term:`IMAGE_CONTAINER_NO_DUMMY`
> +      When an image recipe has the ``container`` image type in
> +      :term:`IMAGE_FSTYPES`, it expects the :term:`PREFERRED_PROVIDER` for
> +      the Linux kernel (``virtual/kernel``) to be set to ``linux-dummy`` from a
> +      :term:`configuration file`. Otherwise, an error is triggered.
> +
> +      The :term:`IMAGE_CONTAINER_NO_DUMMY` variable allows the
> +      :term:`PREFERRED_PROVIDER` variable to be set to another value, thus
> +      skipping the check and not triggering the build error.
> +
> +      This variable should be set from the image recipe using the ``container``
> +      image type.
> +

Please specify what the value should (not) be (not 1).

This is the only blocker. Other comments are suggestions, up to you.

Cheers,
Quentin

