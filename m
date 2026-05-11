Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B0ECD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:23:59 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47283.1778495037550901881
 for <docs@lists.yoctoproject.org>;
 Mon, 11 May 2026 03:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=OnGG5QhU;
 spf=pass (domain: cherry.de, ip: 52.101.84.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fnqo/Y+0/aFQUvfec4MDkYNw5IafsfjSNuqqpoj+JDrul5dwCMepHTYJqinl9LGZqXvjJV7ejYX1OEquyME86+gwykDp1yZRVDtDBjVe0WYt0Rbux1SNJUG4Sxs/tgIt/oCL/X+JESj1qlCVayukQR/TmW6xLVTsyo6rhrsAYMc1BbYgnZF04Lh0pV00z1PCHb8YgM2gDcu6qFMM2S6oqvms983UwYEPJ3FzhENGvDaiM2zpXQHbfVLY+sBeWi91rZMpp3xsuj/E8GHORGNt5EmskrC6BxSjsjrjLonzkM0HwqO3uzKyYluWeBzqm4z7pRKpe7oYR9U8DmSP0/Jq2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VG1XTSQCI2BtuBo+N3PTXnIsfjCe4a4lg5Wu2ASQ8A4=;
 b=jts9zrYsED3FtQjGvD5bbFcxvVu0fBP4ZUnN08kqU7qWCoK1vm4CMF/q8l33YetcauwfrG1i0iIhn+XFcGxKAsLhFAM6YKcF4z88du90qBpZT8w/4zVknXHVCxLcj/wKROTkeFcNgbEcfRtTGDC+0kmCqE8y4cqabITVDlHzt4pGHrRv3JcsAXOjiamWXaPrC76sV6Il8T0AwXNauXO4sSeYEL5/TkzU3hxHgF5ysDIuD7W9+jQl1nJN8H7eCqb2SDBauGegnKHx+ebkRmm7XI6/epc58ghx4T9/8g2owYyGNo2yx59p0X7w5dOpqc61nYptfS9qTQ1ja5OHXGoQNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VG1XTSQCI2BtuBo+N3PTXnIsfjCe4a4lg5Wu2ASQ8A4=;
 b=OnGG5QhU3OoFFylBW/7FaYIoqJWuSGNZ07MI0liZF9XL6gRGGG2st8ABgdXHrkXVVxgSW3q7SbTglmfwBJDOzY7EBq2psJ1Z/f7K1j1YZp/DFmBzVOT9qDMwYa4Q7DL4/fMpt8fcCMLwvgQNiq6DnGVoOu3A93Ost5eqNozR8pE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by MRWPR04MB11287.eurprd04.prod.outlook.com (2603:10a6:501:79::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 10:23:54 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 10:23:53 +0000
Message-ID: <f3864725-4661-4a05-b284-aadc84078d3c@cherry.de>
Date: Mon, 11 May 2026 12:23:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] What I Wish I'd KNown: Various pedantic cleanups
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <7492d4a6-6194-d081-2266-98f33dc5ae92@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <7492d4a6-6194-d081-2266-98f33dc5ae92@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::14) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|MRWPR04MB11287:EE_
X-MS-Office365-Filtering-Correlation-Id: c05fcb17-53ec-4814-7d41-08deaf4766f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	MNI362EV7CvU4f3SvieP8bLP17dmzmUKiqyXmAVSUUHEhP0zw1pQQiLyuwkfvYErhhNlnFC7RgLGq/QZmqLk3VaPHtGReLcIzeP72T0yVf+6LLSnrnD5RK9LBYIh+S6vlWxMzjETCp9CZ93WAumfkVobc67SG7CB6WV5yWg2oZv6yLqbIQzexoGHcMnEM4dDmzcgBHn1vsB5oyx4o0WRBo6LT0BTUgZ9UAnPCaymS3sblHzy4+mhzD1KY7EOE/M4gJGoe84GEBIkDPmY8eeHanU3iXIXnYjuHkAsBqpPvUT9nmYNkr61iizUJfeiQIhijaI/yMxH9SNVEePd43sh7mF5TTdy5h0e2c+FDhHljuFA+7G+/32EIbZYgjA2d8vJaFaojXmSmYuOJNBoj6v0W3vbPMiAz3KQu8PBQs6JaY8jsIwSIsJBqNAIj9V26RZHk6jpHu+ZPn+bFsV/qOVMKz1PK4wlinkaz0q70+ZgSgAkgyBBz2N7QxofE5zElJ3VKaWgF5CQi/CktuSQlXtLfbb+eJ4l2zjQ6htnaqu+sYTCYk8ClLdntQkSz1GLi1DU07rlOcELWDXcx/cIqY/uWvxXkRJRfryuiT84ewFwTbmz6cKT1V5wAUj6QblMhXkzBYFAHHVHTYsVwe7IZI8T2UCsk9wAah+a+GlWR16mo3p27DA/wMFczk3rw6Dn1jAl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TjBLbTZ4b011OWQrSHVBbVRKNFNkclRrdlI5R3RCbklpRVhRNFZHdGJ0c2dy?=
 =?utf-8?B?OWM1cExhTlRnV3lvWTBsMEEzWGhOTmRrdWZoZUNGaU0yMjN4Y28vTUhKR1pG?=
 =?utf-8?B?eThVOGI1MjB6OFRNb1hGM2w3R1FsQ0pOTEFhWlJnYUlmcElteG55ZDhzUWFw?=
 =?utf-8?B?SnQ0bmZ0ZWNHSDNvaDdCeDI0dGJSSVp2ckRKRSt6aHJhZm1aREZEZmhaV2M3?=
 =?utf-8?B?TzBPdHdLRnF6MnhMdVg5SXl4dEh3UjM0djgxTjYwN3dzOFVjQ29nTmtyalNu?=
 =?utf-8?B?ZUNycUIwcnJWKytPUTZ3ZVQwb3I4Z1NPTHI0MTg3TUFlT2pkNE1zSHFzRnZN?=
 =?utf-8?B?Wi9pWFlObWppNTAycjljMHlmSitQTkN2NXlteTFCSTVuQjh0SUhwVnp3S1VW?=
 =?utf-8?B?ZlZiVStSbnFvT1UzWm1wZUZEMHlFelZmWTNaOWhkSWtCL0hPTjdMQTdjTlR3?=
 =?utf-8?B?UHB4Z0Ruell3VStBS2RYVFlFUTNKanByMWxybmluaDlqaFUxcVJsWVRJS08v?=
 =?utf-8?B?bGFaWWVBRUlFb0xQa3FiMU5LTXVHeE0yQThNUDltanplRE4rTS9nNGpmeklW?=
 =?utf-8?B?Q2xkcW9xK1ArYlNCWmJ6MHlyb2lqdEk4a0htbkgzM1lFRGdYWlZzVjNhM1FO?=
 =?utf-8?B?K2ZEbFVKS0RvRERQdkZLVVU3U1grbTNzSTlsQmtrN0dyRkVRM1E2S2YrNTdC?=
 =?utf-8?B?WFBaZkozaVE5MnIrU1dQaklBdUM1alpZS0QzeHNCRUlZT3YzUXFnM1A3eThi?=
 =?utf-8?B?Q2xLN2dqdzJoTTl4MmExMklYc3RVdFZLOFdzL1l4TEN5Z0I4R2o5NmlvdjIy?=
 =?utf-8?B?Y3Njd09DYklXK3dvYjBydkRCZFE5VDNJbUlweTJCeENIZytjMjFCNUhPWnNi?=
 =?utf-8?B?VzJtaUxmN241RmJ3K2lKOXhQZ1h3eFZYYUtJODBKclFBZk9iZE94Sm1HS25p?=
 =?utf-8?B?amZNYnpmdm9pK2xiZDRIUE8zQW41aEJEQmpqaVp1UlhQUkJBWmx0a05GUjJs?=
 =?utf-8?B?aTQzR252Y0pYVUxsaU5vRGpzNFZ6WUdlWURtWlNKNFc1dlAzWEIvakNGNjI0?=
 =?utf-8?B?eXZpcytSais0bllwMDdWWTNvOGlUM2ZFWjczQ05Ib09nRHZPR1JjTUQ3WmNp?=
 =?utf-8?B?VnF0V2ZtZTlJcndETUt2OENldGpzcUE2SzVNKzVqMFRBRjRtOTgrSFF0SnFx?=
 =?utf-8?B?QkNrbDlQTzMxVlJKUXk3cUd6T3dEdHV3SElTVURTa2VjN0FzNXl5TEdHc0U2?=
 =?utf-8?B?QlhSN3JOWVVFZWFWU1hMaFV6QUdjLzRJNnViTFZSUE1aYlJWZzJZRzdlUzBW?=
 =?utf-8?B?ZU9NRlppZEduVGJHYWRESWtKd3lOWHAxUmgzK0hpL2l2RDVrUGRlM1VvNVZW?=
 =?utf-8?B?bzdMR0dTS2RDMlVKbWZKSy9vZDJkUEFnRHBWRW5kb0pjSFVVZC9ZQWVYQmlw?=
 =?utf-8?B?Q0ptK0RUMFQ1R0hXazBIMS9ReStNT0FKR2VybTYyQ3c2ZkZLMjkrN0RWNnRF?=
 =?utf-8?B?dzJJb0lMMC9vMDF5N0F3cGZYalFwRU9VSUJ4dTVWQnRmZzhuSVhMYUwzK2lo?=
 =?utf-8?B?T2R2STk1UkxHYkNpNEJTZ3JpenFJNlhOanJVMllBYlVlUXJRK2JFYk53M056?=
 =?utf-8?B?TWlsbnZLNHhSYWxoZnRxSFBrTE12V1FZTFNsaGhPM0Eyb0J0c1Z3eXNXY2l4?=
 =?utf-8?B?R1dmZXl3M1M1UUxUZW5oUVlDODJVMjdVVU1ScGVFaVV4VFU2cDRLMHZzOStp?=
 =?utf-8?B?QmIweWhMYlQ2OXlMdmFpSTdIRkJJdGxZS3hFSm1kRXo5Q1JQNDFIclRQa2h6?=
 =?utf-8?B?Z2Rsd0VjK2Z1RGdZTjJlOHBTWTRtSEFzamRFbzFiMmE5RzJlK0RxcC9XTmU0?=
 =?utf-8?B?bFQ0MVRXQUpOL3NiQ05VT0tnUGpLZE5JL2ZQQnVVcnhFaWxpeXJ0MnRGcU9F?=
 =?utf-8?B?SW9wOWRHRmNrM0piWWpGWVU2MWhKVkFQOTkyOC8xOHdvcG9Lb0pVakE4UXBr?=
 =?utf-8?B?NGo0d0liSUx1RE16blFCay9HK3AyZVIyaE5xNjNiK2E4eHdxNW1RRHljVEkx?=
 =?utf-8?B?ekdHTDlCUysySWFON0hTTi8yNkJTVHNxVXYzeHlFNDF2ZERRanZEZi9VWEl4?=
 =?utf-8?B?T3lYS0VIZUJpc3g1dDA4a1JwdmE4eXZ4ZEZZMCtoVTdYQ1dIMTJOYzZNMlQv?=
 =?utf-8?B?eGdkb1gxbzZId1QzUy9EUkpjR2YrcUpCUUlRL2lJUzdDcXZ5N0NKVGtmczY4?=
 =?utf-8?B?SUNiMnpSL0NuUTZ6L0pKWW9ldkpEZmE2WmRWbm5WUk53OUM3SjRZeDZSU2Jh?=
 =?utf-8?B?WGtoR1pNRThGcmFvTENUeXVhMFhYYi9IbzdmZjlGL0pEbVJHSHh4QT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c05fcb17-53ec-4814-7d41-08deaf4766f4
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:23:53.9250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HupJt+NXVNVeoqrfxxZfyR1nqBt/DU39BIsKwHK43SpN8SQcYfyoiuLsWG1Qzf2ncmpNke/JmEb7k9yfaHS7WnG/d70GUoqRK8DEbUHA/TE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11287
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 May 2026 10:23:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9445

Hi Robert,

On 5/9/26 8:41 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Tweaks:
> 
>    - Update "Software Overview" link to go to "Technical Overview"

Why? What's wrong about it?

>    - use proper capitalization for "Git" when referring to the product
>    - numerous grammar adjustments to basic skills list
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
> index bdb9e492e..d89f43304 100644
> --- a/documentation/what-i-wish-id-known.rst
> +++ b/documentation/what-i-wish-id-known.rst
> @@ -9,7 +9,7 @@ What I wish I'd known about Yocto Project
>   .. note::
> 
>      Before reading further, make sure you've taken a look at the
> -   :yocto_home:`Software Overview</software-overview>` page which presents the
> +   :yocto_home:`Technical Overview</development/technical-overview>` page which presents the
>      definitions for many of the terms referenced here. Also, know that some of the
>      information here won't make sense now, but as you start developing, it is the
>      information you'll want to keep close at hand. These are best known methods for
> @@ -22,8 +22,8 @@ known before embarking on their first build with Yocto Project. Feel free to
>   contact us with other suggestions.
> 
>   #. **Use Git, not the tarball download:**
> -   If you use git the software will be automatically updated with bug updates
> -   because of how git works. If you download the tarball instead, you will need
> +   If you use Git, the software will be automatically updated with bug updates
> +   because of how Git works. If you download the tarball instead, you will need
>      to be responsible for your own updates.
> 
>   #. **Get to know the layer index:**
> @@ -166,19 +166,19 @@ contact us with other suggestions.
> 
>      * deal with corporate proxies
>      * add a package to an image
> -   * understand the difference between a recipe and package
> -   * build a package by itself and why that's useful
> +   * understand the difference between a recipe and a package
> +   * build a package by itself and understand why that's useful
>      * find out what packages are created by a recipe
>      * find out what files are in a package
>      * find out what files are in an image
> -   * add an ssh server to an image (enable transferring of files to target)
> +   * add an SSH server to an image (enable transferring of files to target)
>      * know the anatomy of a recipe
>      * know how to create and use layers
>      * find recipes (with the :oe_layerindex:`OpenEmbedded Layer index <>`)
> -   * understand difference between machine and distro settings
> +   * understand the difference between MACHINE and DISTRO settings
>      * find and use the right BSP (machine) for your hardware
> -   * find examples of distro features and know where to set them
> -   * understanding the task pipeline and executing individual tasks
> +   * find examples of DISTRO features and know where to set them

No to this one. DISTRO is a variable representing the distro, not its 
features. When we mean DISTRO features, then it's represented by 
DISTRO_FEATURES.

We use distro lowercase throughout the document, so I think this may 
introduce confusion.

Cheers,
Quentin

