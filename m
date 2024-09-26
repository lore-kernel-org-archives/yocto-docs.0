Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99AA0CF9C7F
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 12:53:26 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.35])
 by mx.groups.io with SMTP id smtpd.web10.41944.1727355201037983979
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 05:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=HAQsiBDF;
 spf=pass (domain: cherry.de, ip: 52.101.70.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tw97zDayevxI+XsU3gYz/Dpbf8cL9l9Vpf0FU9y6V9Sm9hgTElrEs9dG4uLqJiLOnpvs/Th2S9nAIeDpwUXZtrZ5f3xrVpVSl5d6nSlnhHe5H7zbZSnHuIsmkgR4zD4PjN/kd6ALugBmN/SCM3zO9tEp+QZlPH9plGenHRSxEu5/HVCd0+dPK5EzbZsIoc1wAJXGX5mclMvZ3BwJCj7lkYTFkewuNGVYJv/xq8wu9EyNHkLMkmetlfadNZOZkQPP9HRiGzHkIiQ1wPrJQktJb7tLNQjpGbvdNE7YysY3azCPRKxxZubT4IQV1rpLdXRpSeTwwzVTJV1pHVSBiirLGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIbQZb2vVfhypTCcdlTx+UcNQVSGR2Cl3KL8Ux4Ds30=;
 b=PPaNtlTTsS3/jQtsKha1lCBxC5OHUf/XYwKdMNFGpwEA7kVvSz0Mz+twYDDW798Pvbz0WuigR2IDxGaPHNM0uH97bYvRc1XhvoYaGooi3+IaDbV1YmDMtrKTgWrPp1hk1u95/1SVz4dTt5RMczgE7zsx/fUUvV6rFh6GOPZDtZ/PUobFQgiZkTDIHDI7lCToFS73fD8Qp7IBUzqM0ZYLDvGceDeHrSS2AIj35BWV/sKDwW6mRYga4Ly2GcuonfgcGWLEQOaAu83K3BMI+hmxij6uneJ2u0Mkl/7FD5t0M8fBPvEuuFHfyuLGvq5wvNOYyEP/MSKrfImlXb5d9Ql9lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIbQZb2vVfhypTCcdlTx+UcNQVSGR2Cl3KL8Ux4Ds30=;
 b=HAQsiBDFAZNhW97wne77SlKnrmBchFRupOf0vLA7WQmDN2Qn8kOaHNdWaUQ3olLzf4n8aBATytyL09cSxFL4PfAC0lpm3VCgKYv8L3No3kkOpSpmpXSlsllXh/SaGW+qXqs+OP4FMTHEcxugdtA9VYBFdmTjZuXxeXbSnFfn4lg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by VI1PR04MB9932.eurprd04.prod.outlook.com (2603:10a6:800:1d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 12:53:12 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%2]) with mapi id 15.20.7918.024; Thu, 26 Sep 2024
 12:53:12 +0000
Message-ID: <541662d2-754b-4e0e-afd8-71bf41094f46@cherry.de>
Date: Thu, 26 Sep 2024 14:53:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 4/4] release-notes-5.1: document spirv-tools
 reproducibility
To: yoann.congal@smile.fr, docs@lists.yoctoproject.org
References: <20240925132017.3427438-1-yoann.congal@smile.fr>
 <20240925132017.3427438-5-yoann.congal@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240925132017.3427438-5-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::10) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|VI1PR04MB9932:EE_
X-MS-Office365-Filtering-Correlation-Id: f896521e-c931-4ada-f8e9-08dcde2a2de5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eXJSVDBXMFBuemlqbVh6QWIrL0QxeStvVndYMXFaNjdzWklNZG5HTGc3WUsy?=
 =?utf-8?B?amNUSldBVmVCZU9TV1JNS1RXSmo5eG52ZGtCbHNPT2t3TmlmTzJRb001K05G?=
 =?utf-8?B?RFpwWXhJY3hDRkwya29rVlZZYWNUdjI2SXB2RXMyREV1OW1mUnk3cVB4TzFs?=
 =?utf-8?B?dS9oM0hLOUlBMzJBKzRyUXRETmFCckZZMStwVHBlRkhJdG1PTDhtK1liSmp2?=
 =?utf-8?B?SzVlZmVpY2Yzb25QNGp6c1pYelF4RSt4aXJBb1R1RDdMcmhscHRZTS9uL2w0?=
 =?utf-8?B?dDVrMDBBaGRLeXFwSk1sQ3B6OFJJaWRKOFlsaElaQkFhZ05JL1dpVVdFQlo0?=
 =?utf-8?B?WmQvdGRGQlorUS9CTkpYTDk0U3pLNlBWcmczODYyRU5hREhFalROSTYzeTFu?=
 =?utf-8?B?cWc3T0MyVVo4dHhLVnIrRjRmbndMaEQwUVBURFBQbkVrWUJzS1RiMFJuallF?=
 =?utf-8?B?NWtvZ1JFQ3BOa0J0UTVDVDNNcDlQQWJkVjdWSi9lZDU4azl6UHhXdUJjUlZi?=
 =?utf-8?B?Z1Zkc0l2VzdraGFwYTBWZ05LSzBEeDhjZEc2SS9jeUV1MS8xVnpxTmRDYkxs?=
 =?utf-8?B?Z1JHWm1YNlB2NVFKU2k0UFBhejhTWnlYM0lNY0pENmJtOWt1K0tXNWsvdlB1?=
 =?utf-8?B?aE1vOFhEeEt2dXYxSzdZWjROUWVYVjgzRHZUK3FGMFY3Ly9IR2lvY0hRWkd4?=
 =?utf-8?B?ZjNZSCt0bUtkcTlDMWdldjc3SHBzcUNPN2IrOHJYa3lFMENSNzZYUjdZdzI0?=
 =?utf-8?B?dDJkNGlDZE5Nd2pIMHhkc084S0IzZEhma1Fhai9udGFFZmFISngzNnBNSUlF?=
 =?utf-8?B?b3F0RGdBS3FXSVBFMm5NMlNaaXFZWWs3b3J3akx4QXYzVldFMCtCeWNBTm5R?=
 =?utf-8?B?d1RiM3NzamNZU1RiWE1qaU1CZmlLa2FUbzBTb3UrTG00MzhZZzU3emJyYVk2?=
 =?utf-8?B?U2FkQTgrOFRpUGdTNms5Y2xpK0NuQktlbDlLQUNhblRJZHFvbFJSRXNDczNN?=
 =?utf-8?B?MVAzVEs1Q1Y2dXlvYlkxVWpCbjViYUxHaEZ6WjJocTFDSXpiZ09ObEhSeXIz?=
 =?utf-8?B?eDduc1JjWklwTjRzYmxyU2lvaTlNZG1jdmtlVFhoRFQ4ckRnTXZuZmg2MXBt?=
 =?utf-8?B?am9iVWtEaFpPQkZMa1Q4VXhkU1NaYWY1UEcvVEdmMytTM2hqYXFOY2w2L01w?=
 =?utf-8?B?d3RuS1kweFhUcWpLMUxVYmE3bXdqL3F3VlU0VDRaRHlWNlE3b3R1NDYvTXp6?=
 =?utf-8?B?QlFabjZFTCt6ZjdYaWdpMVhNWXg1NWpyZ3dUbC9mTDhGaXFZZVhyNVVuSzNE?=
 =?utf-8?B?UDlDSHdrNmtZMEhUdWNMNDBMV3FzaThiVDltTy90UmpLNUJiSlN2eml0M1k1?=
 =?utf-8?B?NGhBRFdwQWpubEZHaHVxbWJlVi9qOWJQSTlUMjM2ak5qejN5bVdDbVEzMk5H?=
 =?utf-8?B?UEE4NkJWQkdOdXNWM25hSkp5aEtUSGJZSWVMTUMxTjllZmF0VGhiTGVCYmpm?=
 =?utf-8?B?VTJrMGpyU0tmWUdGckc5ejUzdEhSN0VOS2FGc09VbERwOE5yYkI4K2RIQ2pq?=
 =?utf-8?B?b0pxanhQQUFMcVBTanp0MjR2Q3BLT3g4Um1mS0FCR0I3RUNWZElPSDN1ZEVs?=
 =?utf-8?B?UXNkU2JLbUJ5M1pET2ozZmM4akxGSGhDTEcrS3kvQW9oeGUyYk4va2h6RitD?=
 =?utf-8?B?SitxMjVFemtnbGF5cHgxWDdVY1Z1Q1BsOWtsRmxyaENtQzNhKzJ6ZVhRcHpY?=
 =?utf-8?B?cE5iRzRaNmxTWTh5a2hmV1ZZYmlCWTRCei9EY3MwandBeVpzSWxXcjNYOFRX?=
 =?utf-8?B?M1VwanNUdjNYZzdsSW1Hdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QVc0aWtIUVRPS20xYW12Zk1nUzZMemdSZ0R1Z25qdUlpYVJFREdtdDdhY0JH?=
 =?utf-8?B?KzdzL1ZZeVVWM1orQnp0b01lSmNtOVYxeFF4SDRpOUhOck5YSEFQc1NzdTlR?=
 =?utf-8?B?WVpFWmhSSU51QUF0cGRMYzNYc3l0NVA4bjJCN0c0NjlnZEk5NW5CV1lZYlBD?=
 =?utf-8?B?c0VLMDNIMmhwUHNuMlY5SXNVbmVQMm1HQ1BsMzZFMjc3b05KUy9WRVdNclU4?=
 =?utf-8?B?aDJkbDVaRWZZT05wTnh6dWlyUWhPc0tadXZKZ2Qwc1ZreFMxNGlhdWNvYjlX?=
 =?utf-8?B?dGFOeG9iSnNZRFJhNnQ5OGxNSURqeU1ncENVRHFNNUp5Nk5CajR3bHFYTWRo?=
 =?utf-8?B?dmdwSHVTL241QUxlZVJDVElFYXZ3eGJEWlRSMUtDM3FaNEhrc2R5ZC90YnMy?=
 =?utf-8?B?NE9mcnA1MHBOVXNWY3lCVmVGZU9mb2Z0RG0xNWhZWjc0R01lRTlWOUgrY0p3?=
 =?utf-8?B?blBVdVlYZnFkaWk5dzVTbkZHb2orTlRTZ2hoeWRPRFZnbjJHTnE4SFhxNEVO?=
 =?utf-8?B?VmxtZXcvdlJVUiszRE5TWWFGaXRIZkY3cU1YdDVuNlpVL21jTDJEUytoNWFF?=
 =?utf-8?B?WVlHbkVUNjlxNmRjTXhnS0NWMTBoTXpYa3hqRUV1VzZSSklaRnJmOW5MSDFR?=
 =?utf-8?B?cGptZmNvanFINitvcTg2eHFVVHhPcUZmeEoxSzFXSUJGK1Fmc0lSbGU0NWN4?=
 =?utf-8?B?NU1kZ2oweEdSTkNwRytaWGc0OHVtV1NYaFNLU2U0bDladkYwL2syOFRVbUNJ?=
 =?utf-8?B?VDNvbjlTdXE1UVpnTGhhdW05azNXby9EYURSbEt2VDlFMVBPSXgrc0VJZllD?=
 =?utf-8?B?cGdmVlQraTdKYVp3QkhyY1lOaTM5bGdNdnh2K0U3UWxUTjQ2ZGxvTXp0RTlp?=
 =?utf-8?B?bEtTcFZ0VWRFTTdVTCtWendlYjhVTktPN09BRGY3N2hUL20rOTVTT0h3dTFa?=
 =?utf-8?B?aElIQ2Y4NStkcFRCdEVDMXVMSzN5UUFvdjdRWmo2anIyMyswNDZneW9MaHFT?=
 =?utf-8?B?aFFtbURoYVhBdDBxS2hxQ1NXRjlxbmg4WFdlMmNsL045Wk9pUjllQWk5OHE0?=
 =?utf-8?B?SkRvb2VNcTQ2UllPUzlZZVl0QUZOMWZtdnJ4WFYrckw4dGlwMktzeGN0TTlk?=
 =?utf-8?B?bUR1STJrS1l5NW02UWRVckNUa0w5dmVXUTU0eS9sdUticG9ndFluMTc0NlNS?=
 =?utf-8?B?OG83eDdWYjdpSGJiTjMyZEpiQkxlbnZjSnBIWFAxbVJ3WmFsOXQ2QU1ub3V1?=
 =?utf-8?B?Tzkrdy9MbWczZGF1Mnh5ZFRpVEI3amp3bFY4SExWc2diVy9YMlNKbzVnSXZF?=
 =?utf-8?B?c21nY3lSNWdoNFhrQVVIMjR1S3VOaTBncDFWZlQ4M0ZGUUFEdVpQcjkxL1hZ?=
 =?utf-8?B?Q2MrODYyWkcybmY5dkx3cDdFemxzUzZSRkZmN3g4eDFaVGhCcFNsS05hRmlr?=
 =?utf-8?B?akxFcUttYm52NGJZV09rUDBON2QraFFSTEJPcnYxUVZnMHk0b1V2d0FwdFNS?=
 =?utf-8?B?V25QSlJkNFR2YkswbVVWVStZbWh5bmh6eGlIdHgrQng0bE10QWc1U09hTVg1?=
 =?utf-8?B?WUtOZkFCYW5JQkEzQVlLS1UraXFUOGsrMDNWekdjazhpdThLQzVmY09DbEFx?=
 =?utf-8?B?SXE2cGZBVDBOdDd2QXFKTDVkeFdQRlR4MWpBNW1CbWtwSjBGeE1RMFRza1di?=
 =?utf-8?B?dFdaZFRGSXdSTjFhUVZBdGZiVENCNnpRcys4RUFIalh6ZWIzL215NndkSEtv?=
 =?utf-8?B?QmFYZ3gwMFd6NVNjSFp6ZXAvcE9keTFXTHYybFhHUlR2cTJRQlRZTVNKd0pW?=
 =?utf-8?B?WGEzdkRXMEJwVTU4Q3lTbmUwUzExTkgwMXZCL0EzcWx4YldqWXIyN3ZqeGhN?=
 =?utf-8?B?THBjT01yQTV0WU5Oam5RWGtuMTNGUEZodVJkRzhGV095QUh0QmlCSFAvdUFW?=
 =?utf-8?B?djdGZFFEdHpuNzFjNUg2VEorQVB4TUxhQ08wUk15dE8wb0JDclVPMG1aM2Rh?=
 =?utf-8?B?WnFEblN0RkZNcmdUNURsZ0FuZGx4VTkxUEJVNXFXT2xUM0VPNU1icEVXU3VU?=
 =?utf-8?B?MmNpTEFZWFZZL1ZkNExVUjlLWUdPSWxxc1JuVWFOdXZiK2lGNDFoSmFWcHRs?=
 =?utf-8?B?YWRROGczaHF4V0FaNHFzNlJqc1FINy85bXR3QmRiZHBQNk04ZzBDbHNrZENF?=
 =?utf-8?B?amc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f896521e-c931-4ada-f8e9-08dcde2a2de5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 12:53:12.0762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgCggd7AUr3hZYjQBsQQsaVEKKA2VBL1q9KTWnCMIfb8kElsmnFCTV3IyuT987MNgkiQe63U7iWkBK66B+GQa71JZafb4UASd8plljQD9NQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9932
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Sep 2024 12:53:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5375

Hi Yoann,

On 9/25/24 3:20 PM, Yoann Congal via lists.yoctoproject.org wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
> 
> This covers Poky's commits
> 47ed8ac83a6 (spirv-tools: Fix git-describe related reproducibility, 2024-08-03)
> a19bb8c1d51 (spirv-tools: Update merged patch to backport status, 2024-09-05)
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>   documentation/migration-guides/release-notes-5.1.rst | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
> index d6c72c5c4..8b51f5677 100644
> --- a/documentation/migration-guides/release-notes-5.1.rst
> +++ b/documentation/migration-guides/release-notes-5.1.rst
> @@ -50,6 +50,8 @@ New Features / Enhancements in 5.1
>   
>   -  Miscellaneous changes:
>   
> +   -  spriv-tools is now repeatably reproducible
> +

Somehow my local dictionary doesn't highlight "repeatably" but my - 
non-native - brain is screaming it's incorrect.

I can suggest "repeatedly" instead.

Or even better... not have it at all? Doesn't "reproducible" mean the 
fact it can be reproduced, meaning "more than once", hence "repeatedly"?

Or maybe we thought it was reproducible and we fixed it, in which case 
"really" could be a good replacement for "repeatably"/"repeatedly"?

Cheers,
Quentin

