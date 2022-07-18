Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240D9C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 09:07:11 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.54])
 by mx.groups.io with SMTP id smtpd.web09.25020.1658135220410067321
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Jul 2022 02:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=WtM8+ciA;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.54,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJcibeDg/QfiMWYBXlAeEVNv+lUUW5f5YvD2YdRjO1U/3bAkGZ75ZxufczRAftfmIkA0M3IL+jkTPY385zUivuvQWdErwT0TcTXOuT+ehKfI3vnrwnYYxtDLFrdFmulrh1G0N73nGmGMJcjYP4yWNl/StCVBu4OF7sZNLbir9B+J0WIlFSLe0xr0hdDcVi/NFcfQfq/Pb3xJhLOQb58B1k+gYWjfc4vMXWB62QVFmq/gF4E9klXDdLcnQGvPFedmnDvxV7zPQ1XE/ExUPo/DOopoQK//UPzkkGD5LfBg1203tuM6L5JQZR13DnmizlNYQFAAoZ+AYJjJ49128NQQWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d19D47r/H/B7sVzV3oD2qLjvIllrix+GumFXr/kDeU4=;
 b=Zy8gRo+FWWseGc0qMR4t43T8n2PieppwcKkK0gkIqw40adH0slk0H7WR1Zw600igBExgOAnsZPxehpBKIfYPALAC0lywkwAXxsFVFH2yxJyI6MX37Sa+UUFXTDp+EsZfFxEpFeP5sDtlCoWsFad+mniKm0ygSO3Id+IZs5W877GPentxEpiUuf3Ey6rOrDyQBeFjUI9+ut+xoxSZtzMYQO2DaXW1+aePdoM+h1DYQY5AksgXM02J4I2heqxt4KT0OKUfDPZALKbsnGxPzUrmwae6SvJR8xeg1z1bxGS9knXCk+93AwXosWmRyuZYidERIJ8Aay5D1sJLS5hwvPsWIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d19D47r/H/B7sVzV3oD2qLjvIllrix+GumFXr/kDeU4=;
 b=WtM8+ciAAyhdrkGRewALVVHrjI6aNhosCtubj/wB/1cA8mEpPFYalGLZidSR5oc5T+kwG9wlQvrDyyQOohyUBDFZzhO8iR7Zfl9xToxhJHTQwPI229EFZ1gTYGGDcR3pDPXLiHnVNxA7Qk+lOne8Yc5CGzMUDGRy73Hk/J2XVY0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DBBPR04MB6138.eurprd04.prod.outlook.com (2603:10a6:10:cf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 09:06:56 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4%9]) with mapi id 15.20.5438.022; Mon, 18 Jul 2022
 09:06:56 +0000
Message-ID: <56af7b46-b595-f440-592a-79d8a3cefaf6@theobroma-systems.com>
Date: Mon, 18 Jul 2022 11:06:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [docs] [PATCH] docs: Sphinx note directive for DISTO_FEATURES
 definition
Content-Language: en-US
To: aatir <aatrapps@gmail.com>, docs@lists.yoctoproject.org
References: <20220705193847.12544-1-aatrapps@gmail.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220705193847.12544-1-aatrapps@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0401CA0003.eurprd04.prod.outlook.com
 (2603:10a6:800:4a::13) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bf342fe-5d24-4e84-3938-08da689cdd53
X-MS-TrafficTypeDiagnostic: DBBPR04MB6138:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h/2vCp0c9Qe328Ms7jTC4wmcR89VY0KhAi/rQBuFwrnnWuKR+sq5BJu2P34LUczspoxp1JdRMaXLlYZqLCKzK9iH5zw4qZHRlzXM9py3enE6C3Wla89KBixT3WBToeGhtT47DxedLh8JHygjvJYCUm+0dZ0U+KsLP6QK22RNdz8Tpm3C0ylm0T/lulqqUWY7etTLAmu8pL9DZWYJgt/ahoZLQ/wqZWbMztV5YZ83YXWh1UjUuiM++tP5OjhvZPmSlHp0c0BnNM/su+TM1znIN5q02A+yLijfP/EDUanfvoy5TAxmFGjw24Of76vehvXIxEKQB9dmpZnI4kkd9umXwri+RNkMgjtmhBhb6YkVI33sSumPZxCHIVSg2Esu469+KMXA5MYiUuReND+T4XYZwhFrF3U8z4ms2euB59nRglsn5XXNJPvwobNxJhghVgORf3w1RTQB9lDvYQWWTo3CvAKeLhYnkRMJLpW2zyZ+iGchuke6SXcNokop1hbJu0xNBRvDX7NVKP8pGHV6VIIScPnwZDjG/PcIa1hnpTQfzp7egKDq6p3AlSZaRyc2Nolh/rIBvHw0vFJwl/ocJYezNzQZB2QhlPVQ8NxCDU9KLoiMM/6EDVEdj6OGPEBmix8wYNdh8p5a5JS9yEzrCa28+BCvuGmySttQMgPaVn8eXkW6oIf6UWnJprqFtr9fcg7eDZgPestjx5c5ThnTbtxHTzFDuBVhbzklAeDDGXWSc4FSI7zc8yEc2r/9gjU5oX+MnDovVtCMeCLylHMlzMksfohqjei8Bs0OCNq0Qvjc184Qrv0bqQjogJHFi1GlwGBWjkqdb5SpU6IjMUmh4yJrgg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(366004)(39850400004)(376002)(136003)(83380400001)(2616005)(186003)(53546011)(6486002)(478600001)(6506007)(38100700002)(41300700001)(6512007)(66946007)(44832011)(2906002)(31686004)(5660300002)(36756003)(8936002)(8676002)(316002)(31696002)(66556008)(86362001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K25MSFQzSmNJTDc1bDhMd2NqaStkcGZhaVUyU0ZZa2RESmcxZk5xd1hsb1NS?=
 =?utf-8?B?YnZiU1M1MzRCK3A4UjZ4cTVPK2FaR1lpMXo0VGFZdkxDN2xMWDNhY2pUbzk1?=
 =?utf-8?B?OVQ3NDRKYWZRV2xMTnVCK2R6elJMUnMwTTZRZldQelVyYXBTYzlWRVZRd045?=
 =?utf-8?B?TTR6dStJblZDNGZacWZlbmNodG5BSG1PRUx4TjlMMnNDVk1zU0krQ1JHR2Vs?=
 =?utf-8?B?NmNPMHdSOS9yWGFvM0JtMEdOZTlzNkNOM2lxSEtBUnhVTWpIN0VHVHZ1NU5U?=
 =?utf-8?B?N0xndlB4OGsxaXBpd3VyVys1NFJKZnpEeTJZMFFtZW5oVy85b0ZIbzgrbW9y?=
 =?utf-8?B?aE0xZ1JjMVhRY0Zoa3ZqdnhWbWI1c2VvYjBiVjJVQTcxSFZVSlhieC8rdk1V?=
 =?utf-8?B?RkNrdXBOU1NJVHFDeUFSZ2dnSk9nMkR1Vmh1OGZKcGk2TGpubWpiUWcxeWtu?=
 =?utf-8?B?a0F5MVFZRjdNUDVvS29GMHlWSnBpL0duNExlY21VRWZWQlZ0Slp4N25abnZj?=
 =?utf-8?B?QXhEbDV0d1J5b2Z6d2lDcWZTV0NGMm4vVWo5QytKZWE5RGl5YlpYaGc3OGJt?=
 =?utf-8?B?M3I1QjA1SWQvbTM1bFBVOEgybUZpMWlFM254bXFTVE1tSlArWHdtTy9zT2Nt?=
 =?utf-8?B?TzVEdzZNNlBBZU5JbUZkZWRua3VlM3B2UHUrNThlSkMvcVViNFNveWhydGpM?=
 =?utf-8?B?V2szL3JZVzJPcTR1MTRFNGgvNlNxMGtFNkNzSWl5NmtWQWN4QjdUdXVHYko4?=
 =?utf-8?B?LzRvZlJpd1c3UnFFQmZHc01HaHNEcmt2MUt1R2VLYzNwM0JnQ28yTHlnQkNJ?=
 =?utf-8?B?RkFzeWcyR0ZZNGFLRXNmY09uQ3YzeDU5NDBPcmR3ODlWOHo2UGlBU0xnQ1VM?=
 =?utf-8?B?elJ6VzlZU3dOVFVheWdUZjNMeHpybW9zS0tocGpUSjZzRk00R3hOdVBiMmV0?=
 =?utf-8?B?UTJGTW54ZEtGbFRzcTVtTERUYkdQdEJ1NzExS3dCS1ZqQ3VCS25uR1g4WTgv?=
 =?utf-8?B?TE15QWZWWklPMm5INm9LTUx6dHdrQUswcko2UWVlUk5OZEhWQ1lCeUxvTFNC?=
 =?utf-8?B?NlFrRzV4SS95WEFCVFkzNUg5bHI4TFcwdVFneFpyWXRkZzNyUm5FVzlvcFAr?=
 =?utf-8?B?MUdxRHRKS2twOWg1dk02bXA3Tkl1MFJIQkc5cXFwMVFoSFZEaUljMngzUWxv?=
 =?utf-8?B?MGthVGdDcm1lZ3hsL3E4TWRVcnVHUDdVaTNWemdXZWdGRzVxS0R5UUZMRXlC?=
 =?utf-8?B?LzlmWTdRNVBUdkVGT3lQZjlzU1FmV0ZObkdaTzViNm1KdmE4T3M3WGkzeTBB?=
 =?utf-8?B?VEpxTzZ1bnJDaFFPbk96RTBMQkdHTGFkbjJoTDV2VGpYUlkyN3E3TEgzUVgz?=
 =?utf-8?B?NUZ0ZGdEUEloUmNHN3ppdlpjUWdKcFptaUQyeE9mTXhLVDdRcm52YTE4YnU3?=
 =?utf-8?B?aUlRNzZuc2swdXVWenRodmlMUXhuVFlJcDZYWWlidmRyU2IvQUd5L2pMVVc2?=
 =?utf-8?B?WWQrZDJWeVg4OTRiY29rcXVVUVJ5SWtTa2p2bGJZOHBUZ0V3Yy9zeU9zZXV1?=
 =?utf-8?B?L2ZXN3RvUTFCSXc1RVZjQmhnU3lsdStsMjlWRXdTcDh5R0hvalNmdEk3S3VD?=
 =?utf-8?B?OG56WkxXL3NHblFDd1BWSG92RWF3RjAydmJaU3IwTklmN1Z6TW91TGpzMlVU?=
 =?utf-8?B?aE8zTlhsMkdGNXczRXNIYXpGaVdtZi9VTE9IaHVYZGhQemlHeEtOSGdCSFJL?=
 =?utf-8?B?aHdpbjQ3b2dDM2RTaXBMdTZoNUZMM0hmY3piTm9hOTUwaElSRitvTEdMMDN4?=
 =?utf-8?B?UUFNY1QweDFqZnZaaXFVYm02NEFBWVNnMHBETnpCSFhjRTdmajIzTnJWeFM5?=
 =?utf-8?B?RHZhS3BJclZXMVRkZ2k4VFl4emZoSTg4cndUUjFXNGRwSDF1M1huQ1ByRHF6?=
 =?utf-8?B?dzRwQnpZMWdSaUl6QnI5eU1ZRFBQUWlBb2h6RGltSVJpRmNBNE1XSWN2YUlj?=
 =?utf-8?B?b2JnekdZZW14TWlyMW5kN294T2N1Vmdxc3VMYlFTaThUUzlGUEdoUXdoSmNG?=
 =?utf-8?B?NXZlWmx1L3dSNWRCOVRXWmw4VWZCZEsvYm04V2tIT0VwcWlJVkJQSVJVa2xO?=
 =?utf-8?B?d0R1TERDRENJeHd6RkZSaUtvQnRFQXdRYnkrZksrVmpDQ0t2MlpkSlRpM3Ez?=
 =?utf-8?Q?aLTLFz5fwzMN0fCSM58grs2nhGY/goU45nCa2lkBosXb?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9bf342fe-5d24-4e84-3938-08da689cdd53
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 09:06:56.8126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wLxZqzFwX/mvGxooVMq7PbMozbPP35WnO02bAO+YWF3FXfSMG70nM3M/Tv1s2hXfqrnbIXHRsBRNKvqawS/u1nAEsLFuQOTLZmqlXcjiT9Y791exXbfB9oHqMnIUhcuO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6138
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Jul 2022 09:07:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3057

Hi Aatir,

Sorry for the delay, just had the time to look at it now.

On 7/5/22 21:38, aatir wrote:
> Signed-off-by: Aatir Manzur <aatrapps@gmail.com>
> ---
>   documentation/ref-manual/variables.rst | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index c4b2119f2..6a43e8dc5 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1886,10 +1886,14 @@ system and gives an overview of their function and contents.
>         optionally support the feature. For example, specifying "x11" in
>         :term:`DISTRO_FEATURES`, causes every piece of software built for the
>         target that can optionally support X11 to have its X11 support
> -      enabled. Note: just enabling :term:`DISTRO_FEATURES` alone doesn't
> -      enable feature support for packages, mechanisms such as making
> -      :term:`PACKAGECONFIG` track :term:`DISTRO_FEATURES` are used
> -      to enable/disable package features.
> +      enabled.
> +

Spurious white space after the dot.

> +      .. note::
> +

Spurious white space after the second colon.

This looks good otherwise, can be fixed while applying by the maintainer 
I guess.

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks!
Quentin

