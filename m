Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02748CD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:50 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68445.1781264321497925893
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 04:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=b9I1ty9a;
 spf=pass (domain: cherry.de, ip: 52.101.83.46, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9CXybR5lcgzCFyaSc8qUN+dSlDq7PyoF/rGwYByMtSbHbCkTXFtQ6UNHyEUHOCOd4joy/Rcy7rdXOPRAr8TJHQaikBEDifEbBYc+eE2IrDWJRXHoxbM7dnzu1cU8OYEOI2Zz61zxIoBUdpQP1PF2/vLPtZG86YPE8PuxXPVpfqT93rDdnJI9nbXXJeodbTqOAiqPBJwVVot99/vCoyoiNHyRq2C01u1Z7la3rbJa+Cs1NjYQv5UsffHbGgZ2KfCwgXD28cbAsTg665ZTTFCRVDf0gxlqs8geCsIYoqWKzdq6CmqVHzlU49byfjnaVE2OKZY7QrCmg03hWDArhpczA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QamSYDeW4EvhE3Wn5BvBPGM9J9SIto2B7yguU2ivuZI=;
 b=GhKHy6AInM61Sc1LFq9Foat8YGD0GxE/A3LbNHP8Q/OjbpoQZyR++gwe0VMY1wg1zNK4E0T4q8SYqmp5srLHzDKISbh49dekftwtjiCAyzSaNav1hVsNiAz/Nye698zbvMDJ6nmnooN01xjLBFSqS32iWUo+h1wzd1WuG2PFvHLEz4Ga2HE9FxHQpaCMeH4yRGfmaDHOhQDCUjiyynxJT+lJgWdjFoP8zP6oUkzQGxmaZ6QtLw9vtOExPsuSb+GIDEITpUbVYGg+Dj6lrq3PyKvrHf/rqxXyl97yrStjLBxMCpZVipii4QcONFtLcoMnfX47K4p0LsEpgvBWeQ2z6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QamSYDeW4EvhE3Wn5BvBPGM9J9SIto2B7yguU2ivuZI=;
 b=b9I1ty9aOB5eWXbkq5k5jRhmqsKaOoCNwrkWBUdg/6FCLULivLkKZpEjQ9ZGRnjQMJ5zD+GhgDQ3bK+Jgj3E7jl5+r4BJ1jggBd0y1DMjFHfhjFgebPqg6ml1FleNzj/SGl89rApRRYyIdR7IaywgrRWoyKou5jPsLIN480lx4g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by DU4PR04MB10597.eurprd04.prod.outlook.com (2603:10a6:10:581::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 11:38:36 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Fri, 12 Jun 2026
 11:38:36 +0000
Message-ID: <2a441c4a-81c4-4c51-a80f-7dec845cba45@cherry.de>
Date: Fri, 12 Jun 2026 13:38:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: correct which package variables
 support which backends
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <063e2bf1-5f48-3ea6-f18a-3d422af03a2f@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <063e2bf1-5f48-3ea6-f18a-3d422af03a2f@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0122.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::15) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|DU4PR04MB10597:EE_
X-MS-Office365-Filtering-Correlation-Id: 576dd406-ec26-4394-1e43-08dec8772403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	1y8opze+O4CdQxWBRSiP/ejwm407J5IhI25ApWHI5qKTzzwxge9wwDm2hembyg2FXKZRFwfBIC04tr3qUsCbv+lD8I2ohO3L3ZaPRd2JXmlZFy3Np6MnGlls7bYcApjh5eO4fTuW2d7i9wRRwjXe/ee6NJC44N3yIFzLurgoB+lZ12X1Crh15/mlK9hLdDZH4GjYrO3DiTZLYNcttunqHxbtGPj8cvDc93j7juUOVC3Q/S21uOof3EfHKnjlEWeaOgYIlOf6kO5Pd0wVcxrN2uzUpjV063JaIaCXRNc7xrCyVExBCKm3Vl3tPOcAemh8TSKj/XhzdOmKrJfT9FGXniHXlRSMSteevGX9qEbVN4QpJd6RoLQ+lgEKhL91tMSVMFK6PcUvjTmQ8j7KAZf7yhYgszgSeIFDG6MsWTw0ImcUAq2hNREvwshjfT0OzBtLg5t4NxgGRH5SAtQe2VpK8sByfgiR/CoV59VefDXa9xqiR7FqTRSyInWnkVLdhFKchmY2i89r8FhYZqL3JO60o8uLqClFC2eMj7E2+1RlcSnZfQMn+zNy6az31rUkO6bGRblM34HOOS+Iza4Gty0bKn6BsGidsQIMFWmZvssvIryMac5Ou2TjtSNEq9Wd9HzYO6ht8HDUihmwZepszqhfL4cQJNHz2svei2B068iVzCgTrO2LpTCCGgXGCq6lVFnV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MFR5U0tBN2RLYXBLQjYwMVNMYm1qb2tvUXhESDhtMXhEdCt4WUpyWjdXUGlJ?=
 =?utf-8?B?SHdKWnZpUHYvZVU3aStwa2V0MnJ3Z2tPajFXeWNJYjNXaHZoVW9uS1k0ZW9S?=
 =?utf-8?B?U0hFR254aDEyVW1VRXhsNFBBaENQL0JwMzhORU1XbVJIS3dYa3pSbnNLK0c2?=
 =?utf-8?B?OTNlc2NyTXlNQkViWktiVm9Gdi9FWE1JTVpBYTY2cEIvZEJkVzFRa0RFMXJ5?=
 =?utf-8?B?VzN6WVFWM09kT3BoMkJQUVNmN1Avc21VMTlhUE9LTFdTV1FQSnBaSlZ6S2dz?=
 =?utf-8?B?U1VKM2RKeGlTc3hPYlcxYnBTWm0zUzVzUDJ6NEp5bG1ybmE5T2pFWkZqZ1FU?=
 =?utf-8?B?MVI0S2YrcW9scytwZE5uM1MyRWR4blI0cThVTVRVcmtxSldXdlFRQjhndzVB?=
 =?utf-8?B?M1hFV0JWL0YxN0RQc2VSNkhSM3FRRWxMcWNTZml4UnptSnp0Zmc2eWxUMVpD?=
 =?utf-8?B?Qk04UjYrdUVuWDJnTnJkV2YydEwwQXZsMkFFbDdjNXJ6Yjl2NFM3N0oyQmRh?=
 =?utf-8?B?dUVpMDhodjRWemdid3ZwUG5mdEx2djlUZUpWaWVRWklqWUlnL0ZBdXc4NDQv?=
 =?utf-8?B?djBmWXJWK05NZHNjQUk3cGRCNmhUQm1BNE5oZlhMQTF4a0JkS25FblJ0Tzcx?=
 =?utf-8?B?T2tYZTRuYlF2Z2R6YUVWSVMvQkwzYnRDSU5IMFNoU2tzUHI2V1d3SFptVVEr?=
 =?utf-8?B?b3o3UG10NmQ5UWI3UHN6eDVZMzllbXdSY1V4K2IzWXVZQjZlNzE3KzBDckdn?=
 =?utf-8?B?cE5vSUpscndCeG9sa3lHeEg0N2ZGUDBhNGViSlc3WjhYZnQ2ODFnVko4ZDEw?=
 =?utf-8?B?Ly9YdTh3YUZxeVRsb2xpdWkzcDJSS0MwWXJhNkUvRiszWHp0eVMvSkJrR0NM?=
 =?utf-8?B?bHZXeS9zeHlSMmdBNjlZdmFPSDdSYm5EbVo5UGFNUzFxSVlXbjQ1V0pmeG1q?=
 =?utf-8?B?NW5zWnZlZlYrTW9ERGFnY0MrUkNzTmZWRFpXZHZoRXRrOTZJU1haekk5aTVa?=
 =?utf-8?B?Z2g1TDZ4S3Buak5KaEMxdk54TWNVbEFwNTNEc1dzMmw5L3djSG9tVGs2aTNt?=
 =?utf-8?B?ZzAvS2FMQW5BbFZwbHhXbVhKT3JRQlNDc3JxdS9wMzZtVmxXWXFxQk9TK3BY?=
 =?utf-8?B?ZWRDUzcyN1pJN2RqZnlFTlFYbTE2ejl3QnpiZnc1V3VpOVd3S21FWjhIS0x0?=
 =?utf-8?B?MWk1NFlVWHUreWl4S0l3ellaN0QzQzNUSThzaVFEU3FYdDV1b20zNVhHcHZq?=
 =?utf-8?B?UDdwVjU5WExxRWhFZThQc2ZOS25aVU14THBqUVRyczhRSmFmQm45eU5BTXNm?=
 =?utf-8?B?ZU91RFBXQTQ2L2picEhrUzV0akVKOTZjc25xVlYyNDQxS21pdHdiN1dTQlBO?=
 =?utf-8?B?bnM3alBpcGVtTFdFREZKdExPTzZ0aHNXbS9wWlFUOVdVa0NVVlNwSnBNNThr?=
 =?utf-8?B?WW5NRUJaSG9FMG5NN3RwTFgvQ2V6YkVOeEZvVnZIMHpnUGhwUmVJTDVsTis5?=
 =?utf-8?B?QjIyZXVpbXM4MHFkZkJIOWw5NzVGaFJHbG1XbTR5dE5pUmZ6NHd3K0hFOWZq?=
 =?utf-8?B?NURjTGhEaSs3VENXMEZyL3prTjFNd2NqbFBydmU3ek1YS1VPcHVOUGx0T1Fw?=
 =?utf-8?B?VmpnNW8yMHZDVGh3UW9jd1B6a3JScnVwMW1uQnAzTmR3a3lITVlHUXowTjFl?=
 =?utf-8?B?U2dSTTdrRVRiMGx4RDRIQW40UHF4bSsxeFVCd0tveTh0K0NPWHVOTUVuUitS?=
 =?utf-8?B?Tk01MXZOMzJOSlBRVFRxTXIxSjNqZEVxUUdVTDBzbFB0TW9meUR1dzNYTlFy?=
 =?utf-8?B?TDZiYWdpb09CcjUydkRiamNkWjJWRU85RkVyMXlFQXNGakk1UFptMTBKOFRt?=
 =?utf-8?B?M2k5QWhXT1pTaGZyT2NTc0E2U0FZTlAxMjFpd1g4S05wdk5YeE9oU2JMMFdY?=
 =?utf-8?B?bnNkUXFKeVoxTE5rMnNlR3kwdjNBeG4vc2FSVERSOXAzVkZzVGxXdlo0TzRO?=
 =?utf-8?B?SzN1MnhPMjJRODNpOXB3YThpeCtnUStrWTBxTFFLR1FWV2JVazBPbk9tMXl6?=
 =?utf-8?B?RU15b2lDMlFxV1JxQlVnK29sZmtLN0NwbXlBMmxNaHBsYVFTNzZjNkRSRTUy?=
 =?utf-8?B?cHYwK1l0c2lWWGFweXpYVlVmNFBOczRIbGZJOGhJalBFQkVmeko1VHRtaG9F?=
 =?utf-8?B?REV0enpzbTVOTW5rSTV6ckxtL3ZQQk1ab2RwWW1WQWxTdUlybGwvZEc0WmNB?=
 =?utf-8?B?cEQrWXhaamlKSG4xb0xYZ1BITGRYb2ZyNEkwL21kY2FHR3VSQXBHNzQxMW9C?=
 =?utf-8?B?eC92RWlaL3gweHBYZzdwZVdUQzJuVVZLWGtsNUxTWEJFUlhIU3lPQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 576dd406-ec26-4394-1e43-08dec8772403
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 11:38:36.5435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLzdKw/lEQgze+Q5+kKHm+Axb/BaPIQTFQLQYf/r6CBLXg50w5OFJxA/tLDpagS3bswsZL6mx5JWVpY8NN/x7coz68HIy5dvpRqCuNlp7f4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10597
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Jun 2026 11:38:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9705

Hi Robert,

On 6/12/26 1:33 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Update the section "Excluding packages from an image" to explain that
> all packaging backends support all three package exclusion variables,
> with the single exception that Debian packaging does not support
> BAD_RECOMMENDATIONS.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
>    i tested with adding "minicom" to an image, then trying to exclude
> its recommendation of "lrzsz".
> 
> diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
> index 500639565..80bcac0ba 100644
> --- a/documentation/dev-manual/packages.rst
> +++ b/documentation/dev-manual/packages.rst
> @@ -30,13 +30,10 @@ installed into an image. If so, you can use several variables to direct
>   the build system to essentially ignore installing recommended packages
>   or to not install a package at all.
> 
> -The following list introduces variables you can use to prevent packages
> -from being installed into your image. Each of these variables only works
> -with IPK and RPM package types, not for Debian packages.
> -Also, you can use these variables from your ``local.conf`` file
> -or attach them to a specific image recipe by using a recipe name
> -override. For more detail on the variables, see the descriptions in the
> -Yocto Project Reference Manual's glossary chapter.
> +There are three variables you can use to avoid installing particular
> +packages into the final image -- you can either set these variables
> +appropriately in your ``local.conf`` file, or attach them to a specific
> +image recipe by using a recipe name override.
> 

What do you mean by "recipe name override"?

Please do not say how many variables will be listed, we'll forget to 
update it if we add or remove some in the list below.

>   -  :term:`BAD_RECOMMENDATIONS`:
>      Use this variable to specify "recommended-only" packages that you do
> @@ -53,6 +50,19 @@ Yocto Project Reference Manual's glossary chapter.
>      prevent the installation of a package whose presence is required by
>      an installed package.
> 
> +.. warning::
> +
> +   All three of these package exclusion variables work with all three

Ditto.

> +   packaging backends (DEB, RPM and IPK) with one exception:

Don't think we need to list the package backends if it applies to them all.

> +   Debian packaging does not support the ``BAD_RECOMMENDATIONS`` setting.

Please always use :term`<var>` for variables that are present in the 
glossary. Here, :term:`BAD_RECOMMENDATIONS`.

> +   If you try that combination, you will get a warning similar to::
> +
> +      WARNING: core-image-minimal-1.0-r0 do_rootfs:
> +        Debian package install does not support BAD_RECOMMENDATIONS
> +
> +   All of the other combinations of packaging backend and exclusion
> +   variable are supported.
> +

You already said that above in other words: "All [...] work [...] with 
one exception", so necessarily the rest works and we don't need to 
repeat ourselves.

Cheers,
Quentin

