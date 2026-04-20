Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A50BF557E4
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 08:36:13 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15012.1776674166698369645
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 01:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=akXkkRNz;
 spf=pass (domain: cherry.de, ip: 52.101.66.30, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZLSKXNx0yqZRr9v88BhvSGpgyNG/ybY4xCb/M4oW7MttOHQCWd1QF1iLKp44/xhMWsTsMWyKok73cZxLmXQT49gL9UOsB0GZ9pNf5pEmSYdrtWts9SAFTnsnNG1JKNnagxC3twcsBuxYIPWxxgWg1vA5Uxzels3XeWEyKItjUqllHFPTrPWaBwDCQXOOtI9gwtbnnRqM1Q/i6pfDht3jm6ya33Qfx/QeKRGf8lCl/G0THAxu9lB0EqfkSv2ODd+sOg0JzgZH17XkS1EXxNtcSI6eqDnIu7KrSkaaKdqiRw+viuu1b0VRwziar2daU8RykApBtSA8As5Yp4vVvmFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chvHuRKisvWEXVqaW7MHvR8OBgcKHkpBWmoi05Tw1oQ=;
 b=Szl+DJ4+ktQgurVpK3/DBWuRCDXnBCAPy94Cm6eEdkN841Mr2n7fnjevo9tzAbBujpIGTGzhiYZd9aqtgrfJzI9muUMiAdCzUFGOAHMadsy5ymfHZTo7qwJmVJ2Vx4Z5L53EN2rnGqR1u1IkmmiQWoIcz2uxgFAIWavZGbWO2tv9LlVYjVprK9I5YjgcRMmzdLNPITaCB5tpS8/yz8dOPYHDI8kZKwlBJaG/yXNVWYhiQMuPZCjpqXQaYwTWtnueje2qPqt48Xb5/PvnksnO4EzzUQeAnaSmYRaoZJqXaq8m7JJD5EngvBMFc16IrzoXyX210WenFNi+FktqqWeYgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chvHuRKisvWEXVqaW7MHvR8OBgcKHkpBWmoi05Tw1oQ=;
 b=akXkkRNzrWmkGahhy5/nGXCfZFuaiQ3+m4zhul/biWrBqe7RgSiIkv5k7rm3Yq16B+viTZLcUeZqEujSrd0uK3nAU02Se6eIov4eebthBcejcvPey9017Dum0mBkO3Ssa0J3bdUzvGJczr/RtQv+nTOlB6zqIF+ZDssyNSksYMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by VI0PR04MB10437.eurprd04.prod.outlook.com (2603:10a6:800:216::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 08:35:57 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 08:35:57 +0000
Message-ID: <4fd140a8-d461-4fd7-866d-d9c3e701c3cf@cherry.de>
Date: Mon, 20 Apr 2026 10:35:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] variables: add precision about special characters
 in CVE_PRODUCT
To: benjamin.robin@bootlin.com, docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com
References: <20260420-cve-product-v1-1-812a75eba43b@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260420-cve-product-v1-1-812a75eba43b@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI4PEPF0000013D.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::887) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|VI0PR04MB10437:EE_
X-MS-Office365-Filtering-Correlation-Id: aeb3fa8c-812e-4b59-6542-08de9eb7d7ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	1lQP4rmVcR8Qbm9MRs7b5ncZa0AjIngoAaZ4pdrWphoF10eVsaluSBnPQj0W0MYU2ywo0iN2IqE9tiZ1SYtWv1xTscObMQ/jvw/VKOa9R5k580GBElwwEKBj9yC0NMRGQwx4iGOQRcKm73J0TnoT9AvjlfWb4bLx/8AiQc/DYuGNLY6UXJUuZoJqv2kggJPGDTeSEyRG+m/K1zZixe9QcxOcYLzKQOZ1+b1Kp5V3cLNsUlJsyZ5OLk5+wj3lyhM5reC6/UtdFelgdnPWQqhytSWboItTzLzOGJWbOHfvboQiVK2PJf0VS0JF8P2nckFUAYJ00+FReatjSy8A/crOpgVJOsqqZdTKxYge9lX/Lgu+6CEjuLt3nTcwb1Tw4TwXRF6MjplfzidcAovGamX7tdrQGkZUYBnbo6U0R0HKPA/UxvQPEeSspFgpHF6uu2bbkVslsvb11yIwuM5Vbi1Y//NEn0twEabJTRuKXQi81J+P2hXFiKi2A9mdkYt5rsvUkXoNMSp5/+qBvk+GVJVkxlsB7QNAWyaA3M9WBiFg3hzoWtFpUPNRsRVxEdwZPJrV020g1iCGHbbYYWrw57fosjUhGUsjdIX8744GNpu4vbDiKKaiJQu55kfc4CSxva/Gl/1WH9FN10ZbR+Ku03boeS4hINkI71/bB7G8sGzkS03fZyISR8VTm94XmxMr3hbB1LS2Bh6z+EGz0q0MHr28f6k1XbWT/CPqS3ErHiujwkM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V3JLbGVVakFKaGkxbFltYUQ1UDVYVnBhUk1QN0lubDZIdFdGTW1xUnBKMTR1?=
 =?utf-8?B?QUVYR0NpMWxmWXlma29sSURqQkhIRGlaYTJIT2NlbWxDc09xeE85SXhkbGZ2?=
 =?utf-8?B?NlZSKzE1UWErZ01aQS9zbmtLUFpjY3VUbHFPZGVsTFI2U0YrNkZGM0ZPaDFQ?=
 =?utf-8?B?bE5FMkQ1NE5kWittRTNoOFEvc0c3R0ZhdmF5bUhRRGJmNzFiTDlHd2NZVHJL?=
 =?utf-8?B?TGpRK1RNenB6M0IrU2MydThNVUpRNnk4OHAxZ1A4S0tEWHN3YndsM2Ridmhq?=
 =?utf-8?B?cUVPVWY0REJZWHpUN1RjdUFMbDcxSGR3Z0ZCc2MvN2FRWGFKRDdwUS92MEJj?=
 =?utf-8?B?QUlZQ0JPREV3bjg2NW1SU2xGNDhnMmUvRll0WENOQ2tudEpGa2FMeEtUaEpx?=
 =?utf-8?B?SHVERUlHdlBHY2FJN3R5dWt2a0lYMmxhdGFGUVd0aGdMdTdkQmZ1anQzd1hH?=
 =?utf-8?B?dlNqUDNSQ1c5LzdqcWVXZnFoVGpQUWptMC9MRHk5K1pidVZKZno5Nlh0R1Zk?=
 =?utf-8?B?UjROWW8xUmtKYitPT09FR0d4TncwdDdUb3g4bDJiL01VeUdFK0kyQ0wrMWZs?=
 =?utf-8?B?dTUzM1ZxU1J0R3dlRUFEQmtOKzlTUGtrZDQxcFdwQUk1b3pWbUtsUENXbUNB?=
 =?utf-8?B?Y01KRkRhMXBVWFNhNFI1b3g2Ky9BVExiZ3hGc25CNzlWUjVnN2gwY21sSzN6?=
 =?utf-8?B?ZXB4cG9JTlJLQVpJOFE5OWZXdnBIcnBsbGUxTndNYkpLbFcrUklkck1zWjA2?=
 =?utf-8?B?WENReEtuR3BKN0JwbWFoVldzNWU0N0RYN0pLbEdLVVpUM21uaERISSs5WHJh?=
 =?utf-8?B?S3RBelU1OTRuSXVwczBRS1NZS3B6Z25ic3Z0cXBSTlBPaFo1aHVpSVZqNlpu?=
 =?utf-8?B?ejRSRC9WczJTNCtvdFdIQllxTFFqa1ZVUStlTWpkVi9UZlBCOUVla3dTZEdC?=
 =?utf-8?B?VVZFU0JjRWdEekZ0SmRDQWJaRnRBaXBDK2krZHh2SDBvVmExVkFJRmVMUnI3?=
 =?utf-8?B?ZlI2TUQ5QjE3bnVocmVlOGQwbDNFWDgwR2ZXK3B0NFFkeVEwOHNnWmhkMm1N?=
 =?utf-8?B?M3NvRjVSQk9zWnVuNUUvOHRsZFdnaEhzdHUzUi9JYlFJK3Nyc0MvTzRNSllX?=
 =?utf-8?B?QTlKZk1Eck5rQW9DZ1dGeUtmSUlnc3hBSGNoS1FJd0UxYjJBdDB5cGpHeC9r?=
 =?utf-8?B?WXZBTkpjNDRmcE50U29Qb2xkK0paZTR3VjBKU0ExUlNLbHF5anVjb25mcjJE?=
 =?utf-8?B?SUlSOWFFQ2daMXhEOXdLdnFEallnV3hpRjZBQ0toeWJTWFVJM0JIb2lkeWx4?=
 =?utf-8?B?TS9SWUp2Yk5KSWg1T3p4bnl4RDRiaEZqblp1cUZicCs3MlZsOWpGU1BTV1Vw?=
 =?utf-8?B?VFRyRHJ1U244cUsvTkl1Uzdnc08rczRiQ0hKUUltci92aU9QQUtpREt5ZzJE?=
 =?utf-8?B?THlNMXpDWktJdHBWYmJ6VmIySDAyRUttNWlSU0hKYnBaa0wvV2QzdFFXY2Vp?=
 =?utf-8?B?cXR1R0JFTmN5dmhjd1JubmFJSHB5NkxPK2dqdDN6eTRxNkhDUjVVZTlwWUdv?=
 =?utf-8?B?Rkx5c1ZKb0ViNU02VWptNTg3YXdyZUpVUEtwaWtTMFJzQjdsYy9SM01JQzZI?=
 =?utf-8?B?bkdac1Zmbk5HREJxWi91MldMejRSd2l3aDFaZUZrOTJtR3VQQW84WWZpbXpi?=
 =?utf-8?B?dlVzanBIZ3dQSFptR3BuTUdTMUVBaEtpRkM1dFh2c3MrWGRITzgySzRrSllU?=
 =?utf-8?B?VUgrc08rUmNhWWNFaGQ4MzFkM2pYdG9ESTgvN3hKa2NSU25xUU1OOUZFS2h1?=
 =?utf-8?B?RjJSMGU2cjF0Y3U1R1NlWHd1cmt2ZDNCRWRkRzlVQzI3UHArU0trQWkxSXFG?=
 =?utf-8?B?QnIxTmFETU5YdUFnNiswRTIrbjFuQWtCNDVCbmp2cU43NGdwbWRuNUs5ZHQr?=
 =?utf-8?B?MkZHVkNhbHZhL1lSRVY3YWViVmlLemI5S3Q5T01lbXJKcjNobTFEVnZjbzNH?=
 =?utf-8?B?YW1QSmR4Z21oSnl6RzV4ME91cmdNVlNDOHRmRWZhNkVlMWdadEVlZWhRRCtR?=
 =?utf-8?B?VDV1WkpzRFBRdGxpU05lSFZhTmJGS3FnQXBZekMwcEdFUXR0eUpGNkxPVlJQ?=
 =?utf-8?B?TXc1dVE3Yk0xK0RzUVNIanRUd1h6dUZjSnl0eXNqSEwxSlBZMjZtY3VYWVZY?=
 =?utf-8?B?bFVQRTJnMHBYR1RPMnp5M0dlc2pxdmxnQmpwOFFjb2oxRit0RnFHQjZONVlY?=
 =?utf-8?B?WEpRSzlUWnEzakpvTFg4cnhHWmpRSDBCR2wzSFg4RnhqalUrM21DaGg4Vm1N?=
 =?utf-8?B?Y1BHSzBDWVdTcDJoSXFaK2U5TEhxb2dIYnN4VSsxUkh3Qzg3azBXTVZaL002?=
 =?utf-8?Q?lmMK0alkGSGmwZPzp6bK9k/mB9Qot01+IcwKE?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb3fa8c-812e-4b59-6542-08de9eb7d7ee
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 08:35:57.3661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXBOn1cLE86ICo6QKXHcR6Y9Ih1wcmIJaplxiyK0cRA4MFtjOH6/rjX1RtO6B8xDVWIZTrdSeQb3VHgDkymZI0St1BGHvLISItZzzdybui0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10437
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 08:36:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9280

Hi Benjamin,

On 4/20/26 10:18 AM, Benjamin Robin via lists.yoctoproject.org wrote:
> [You don't often get email from benjamin.robin=bootlin.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Indicate that special characters must not be escaped in CVE_PRODUCT
> starting from Wrynose.
> 

This probably should be part of the migration manual as well then so it 
isn't missed when users upgrade.

It'd be extra nice if we had a commit hash in bitbake/oe-core related to 
this change

> Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 317b75913396..edacb6be648d 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -2056,6 +2056,9 @@ system and gives an overview of their function and contents.
> 
>            CVE_PRODUCT = "vendor:package"
> 
> +      Since Wrynose, special characters must not be escaped. For example,

Maybe specify the version number for the release, not everybody is 
necessarily aware of the release names. In 
documentation/ref-manual/release-process.rst we word it like "Version 
X.Y ("Release name")", in some other places we have "release name (X.Y)".

> +      ``webkitgtk+`` no longer needs to be written as ``webkitgtk\+``.
> +

"needs" is probably the wrong choice here, it indicates we could still 
be writing it in the latter form. Maybe something along the lines of:

For example, the :term:`CVE_PRODUCT` variable for the ``webkitgtk+`` 
recipe must no longer be written as ``webkitgtk\+`` but rather 
``webkitgtk+``.

would better fit the new behavior. What do you think?

Cheers,
Quentin

