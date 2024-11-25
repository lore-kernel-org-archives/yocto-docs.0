Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C541D58D66
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 16:28:25 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.79])
 by mx.groups.io with SMTP id smtpd.web10.22592.1732552096645318438
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Nov 2024 08:28:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=X+6zx57W;
 spf=pass (domain: cherry.de, ip: 40.107.103.79, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIVuLxT3um1AZ+31JDV0FHqQgmJ1QapsqeB/gwZaNT7W/yFmsRXAGlTIl5u5i793I1agPpABbcME2d7yVX9L+Q/2l6N39T4uBTezblxR+JYHPQ0Na/najblRF3aU73x1YoxSheOawTrPyrVds1q6o4BZ7k6J5ub7NXnEcLocOfySadNk/OicEhQCBdfmVFMWpwEi0xjM5hIv6VMAUe2FaYSngGq42yasXAMPDEGfDF6l4hiCQZ9aLR1fB7e1AHvLt5TD24Ol2hZMZdvoZcO4paFV9e3Pdxxfir+ZYkRG7M9CvSvvh9ABB7qXukz3GWt5JyvYxJa1IXW/fc990zt7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxOb8B1X+k3qCrmPFex7nIENsuG7IyDkg1r4mi9sA94=;
 b=Ep6vSggpsqsMd7H8ADRGmAzWchYorO+a/iTJPc6nz+umb24KgYgccGoNNyJH23AndbApcB/zAUV1w58JcGOnWjaL0Teg6qkxjNV1p/u/9SuHj9GIXg+EiNZnVYkNiwb5aCEPVyL1w+jD4pakPchel7lh692Ieur8P1W1yeYI8q8jtnIHM/RIqu0HGmNbko3+xSLR17lvhuPZ/N5ZytBC58EN9UpQvnarq4WojVjw31TI6ysLCkj9TFE2ev8oLoy4TNX9rCq+uqXevF86R3bkeHhrCbXeb5F6mEEU5Zz30iL6ucFdHae/qUYkv7icusH8fdyiu4481r/RQBkn9de9wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxOb8B1X+k3qCrmPFex7nIENsuG7IyDkg1r4mi9sA94=;
 b=X+6zx57WCjnWNuEMlLyZLPwFydTW5jTHmD32ATdOf+UGZdF4TMRkdZxQ1uTKy8EfkoAZUdirmbs7kSfrJHAdSaDqH8tbyXpWuTSLVsZAGc+qb3xr6OLj0mO/x8JU2jNt6ND2Msj+whO2YwQEaZqt161RqurTTaPvMIWqSSatLW4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB7627.eurprd04.prod.outlook.com (2603:10a6:10:208::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 16:28:12 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 16:28:12 +0000
Message-ID: <7e1b27c1-0833-4f66-835b-02e39a837fa0@cherry.de>
Date: Mon, 25 Nov 2024 17:28:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-docs PATCH v2] ref-manual: classes: fix bin_package
 description
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241120-fix-bin-package-v2-1-917a5c2745d2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241120-fix-bin-package-v2-1-917a5c2745d2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB7627:EE_
X-MS-Office365-Filtering-Correlation-Id: 2065892e-e4dd-4815-16e7-08dd0d6e27f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bFZEcENYS29WR211T3V3Qjh2ZHIvNGFGZ2N0VkpueXYwenkrVXowZkEwMG5y?=
 =?utf-8?B?T0xiT3dBMDFHK1ZIZFlTK2hwRzFDdXlrZC9acXJOT3Q2aEFIcmw2N0xzRXNp?=
 =?utf-8?B?ZEVKOUdQMEQ2T1NWWCswV2xrVkJaaHZndmRVQjRYL0hUNGc2YkZWVTlKZkxH?=
 =?utf-8?B?SUZLYnRSejZsZEhLRjZOVkxBbVc1WXM3VTgrOU9rL095Qk50ZHlQUDR6a0d2?=
 =?utf-8?B?a1FZaitPZWxUejdNSTI2OG9vK1MyZ1QxVFpIQzBhamdnYjAzZjhDajVBNHIy?=
 =?utf-8?B?dEh6SGdzamdvRGE3VXprcldSVXE5cFQwZnUwV0grclFqY1loNStiMmFMbEVq?=
 =?utf-8?B?Y0t1OWt5Y295bTh3TEFBL3ZDZGNPR3J3WG9ScVNZQ1YzbUJZdXhDVndxM0hU?=
 =?utf-8?B?MFVhRTZQSTNNMGxkVjkwaEYzOU9PS0hBYS9ZYm91bU45S2x4QWFuZ2ovd0R4?=
 =?utf-8?B?Ym1hUG84dGZYYnJPWVNWN0szZjJUbGhRR1ZySit1ZSszanhldHZ2eC9xelZy?=
 =?utf-8?B?QUdzaVhrVjVSdUJweTRPeUhieXZ6QThYM1ZjSG5mNHdrMDd4U1h5ZjRaelB0?=
 =?utf-8?B?b2ZGYU9wcnJJWThhQWRDNExjdGtnS1NudXNVVnBHaHZ6SHdFME8ySXNqS3l2?=
 =?utf-8?B?WEpjdGI3bEkrRVJBMDNPeUpJbEVPOHpzcG80UExsb1FYRGFjQ1lXTUlHUEFY?=
 =?utf-8?B?ZHZBNE1iNjVobDBVeWtXTkNCZERPVVNGVDdUeE1STTU3RnRFYU0wdEc2VWlm?=
 =?utf-8?B?SzZwR1RBNWd5MUhMcE4vKytQR3VKY2RCVURNUFh4V3BkR0FVck9pZ2JQSjNM?=
 =?utf-8?B?dEM2eTcwamJwMDB4OWg2cW1oRXNlSnJuWlFEdFNjZnUvMURXSDdBSFpYbURo?=
 =?utf-8?B?Q3lWVGhZMVZtc2xNUEoxQ0JRSVVzVG1KRjluMHgxRSs3OGNqci9hMkpTU091?=
 =?utf-8?B?d1BKUXorbXUrS2NEV0Z3bjVIY3RUNFU0RkFkWjhObHZHb0Iwc0NKRi9WQmUv?=
 =?utf-8?B?Ryt2azZCcG9KbGNzOVh0cnlxeFY5b2VRYjgyTlBQdE5tWENTMzY0QzQ5blpH?=
 =?utf-8?B?L0w3K3JXUVB5bUNIbDM2bjBnVkVMOUVZRFJBRS9DRHlUTEY3aUVaazlscWZL?=
 =?utf-8?B?TS8wdExFTjVmaEJONUFuWWJ4UWRLN3BUMnM2ZXJBc0tGTnUyOHM5VXh4c3pZ?=
 =?utf-8?B?aEdmMlVyajZpUnp4QlVaRlFFVEVpVTcrUEJBLzhFZGZVWk91RVpocGg3ZFov?=
 =?utf-8?B?djNsQjZrcS9ZWHFzbjRielV3bkk0T3lQYVFXekF3QUpvb3ovNGY3QnlMblJn?=
 =?utf-8?B?dDQxeXN2a0RMcUdIWEhFaTVaeWlLa1dCUk1qTEx6WTBzdVpINGY0SEFJS01q?=
 =?utf-8?B?WkxpWExqSEFxNFUzOHlDZ3NHSXp1dGtrTjRMWkRMcUc1eGRjMFlHamd1b2VJ?=
 =?utf-8?B?em9DTW1oZmdTbldhRTJ4Nnpyc0F4dFBLK3RrZlFYYVdDSEpIcVd3TllXNWQw?=
 =?utf-8?B?U2FLbEN2UU4wSlpIanMveWVqVTVHOXNqUlFVRVRIc0I4a1dBVFRScDVZYWVu?=
 =?utf-8?B?YmhkZ0ZEOEoyTnE4SEZ3SzkvdnNVZTVXT2w3MURMaUpNWlJoUnkyU1MvdVph?=
 =?utf-8?B?Z2libHJDRHN6bklIaTBYcDlvMkJrdFpYYlR1R0tFdTdadUlYT0RqMUNMaUY1?=
 =?utf-8?B?c2ZKcS9zTHkwYnpjSi95K0gxWTJpb01HVFQzRjFLdTdGUksyeDhUank1QmFu?=
 =?utf-8?Q?yMEn6z1oO0wvHf75Dg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RXNXemQ2cUk1M3NjNlllZnZqdUhOVXpwTk5HbHdJWk0yK1ljM2lhemhUUTFH?=
 =?utf-8?B?V2ZHSEhsTXpoLzQxZjdHVXoyaDJ5S3JFaERBS2FUNU56QXBkalFUeWVQQXhY?=
 =?utf-8?B?dkJ0djk1ZHRYQWlzdkd0UmdmazBIeDFYZVlsV1lwbTh2QnZTZE1EQ3N6Wi8w?=
 =?utf-8?B?VHNoNjE1Z3BBVGVDdkY0bVlNOUlFOHp6V3ZGTnRSRi9aTFhIVFVCTDdjK2hK?=
 =?utf-8?B?dy9KczZpUG8zamFWbWpvZGIwWmNUc1grL2dodWU3Q0xlRHRvd0UzQzlZbW5v?=
 =?utf-8?B?Yk1rcEhKQmVxeThWRHdmZVQzSnJwV3lZWXZVR29QSE0weWg3WlEwQ2N6WFRD?=
 =?utf-8?B?NkoyWkttUjNGbkw1WDdDdXJHSFlmRmVkeXArRFVTUmdrdGtVZlZaVE1rd0hr?=
 =?utf-8?B?Unh1azUwaEFQbERwQ1lsQmV3TGRiUUlCV0FrVC9sQkRUMW54b2RUQ2s2MjZK?=
 =?utf-8?B?ZUlBVkVaUDdlZ2tLZnRabHpvYUhPdHY5OVErM0dFVnhMSk5nYVRwN3F5WVEw?=
 =?utf-8?B?QitIY0hkaTNESmo3Rm83d1E0ZTBTZEJhRlV4Ynh5ZXFRQ3RHdThsOS9mcFV5?=
 =?utf-8?B?UmZEeGc4NDJRZDZONjZJdHFIZEpRRTJTQzltWEh3WUFYWUZCYXlhR04vZlhN?=
 =?utf-8?B?QU1rRjNDbGlQZ3lOTC9jZkhLVE5RcjJ2MjhIbWs5bzRKbTlDclJrV01Ddk9R?=
 =?utf-8?B?cnIxRkZTakxEeDFKYnhOREtSRXpOZlpKMlhsTkJCaUx5M1ZDRzNhZXRLMXln?=
 =?utf-8?B?elhUL0RoeWUwcTdLUXdyVWJiYUgwTkFSWHZ0MzlwU1BhbmM1UmYxMnpzckNG?=
 =?utf-8?B?Zkt0M296aXEvNmVvQU92eXFIOUdSd3FBOXZ6cHBGVXlIUmdCWkJJYTNCd0Zw?=
 =?utf-8?B?cnBSbzZmaEhpSGI0SXk4MGhiZTc1RWwrMDRaVUg2OWxQcCtMRmFTQ2JjUGM2?=
 =?utf-8?B?MlBGTjNmRytjbUV6V2VFTHRhcEFvdzJLa0owWlVucGdTMjdvbERMeHNGUUdv?=
 =?utf-8?B?V1VWVTFsdUtmWUcvY3NqbjcrKzFtNUpydndVRENzSEhRTzFHTjVQZmhGOVRV?=
 =?utf-8?B?WFFNRkdrQWhObVdXQTFGS3BIRVgrQzhac2JuSTRHMjJyZHBvdnk1b3JIcnhJ?=
 =?utf-8?B?Y1Q2WXRTOUdkRllKYi9rT0tYcHpVNTFnZ0V2UHhxSVVDMm13SENvNytHREdt?=
 =?utf-8?B?WlpORnpueXdsODUzTnhrZUFaMVhMSEcrVWdCUThzblN5ODUvL21CSUQwTUFs?=
 =?utf-8?B?eXNkc0FYc2Z2azU1NVNWQW5QbENWM2lRbGpwOGpkTGFlQjJ6VGc2RmdiYXJY?=
 =?utf-8?B?dkZnVFJaMHp4a1dxQWtFM3FGVGR5V242YzJ1aDJHYnlVMHE5eE9PSno2V2hk?=
 =?utf-8?B?MElHa1J4S0xsWURTU3hXT2kwSVVMdUVPZmpKMG5IQ3VnUG0yMkNoNlN0di9X?=
 =?utf-8?B?M3NxaWt2MDJvaXZoc0VKMm5NSjF4anJzNDZmbmlHUGNvcTZnc1JSMkVHdGFB?=
 =?utf-8?B?SVZqWDlwNm5QVkErUUxVa2s2eExIaEMxMTJUNHMydDhpZFdIUUFLcHl3OEIx?=
 =?utf-8?B?VnVER3hQTndqMHcwS3JpTVVaNDN5ZEJtMVBYMVhkRGpXL2EvMzZPVEpySjVF?=
 =?utf-8?B?QXdIemNqNjVvKzBVV0puWk9aR1NmUUZxdCtlM0VWOW9oVEJVeDlhVVo4OG0w?=
 =?utf-8?B?OUhCcEd0VXEyeTNQaFhnNXFxRGRGK1JkQ1FpYVZ5azVhdXRPTGJLZS90a0pq?=
 =?utf-8?B?WlMyaXlHV3hxRjRac2hBNldOY3g5TmtpTDZOckZXV1c2ZkI2NDlKM1ZzSFZE?=
 =?utf-8?B?cVp4QW5GS0RsaU9Bc3pPdHgvc2J0U2xrekU2UUhuaWloSTRUV2JyOTBTUUFM?=
 =?utf-8?B?RjNvSis4eC9DZXVKbW5ySjRvNVRjbDNvR1c3bnZ6akRPRjFhcEhoRHhMcVpm?=
 =?utf-8?B?bS9Vb3kvcHE0TnpwTS9qZkFzZXlJNTdzS2N3bUJCdWIyNGhTakl5eCtmZkF5?=
 =?utf-8?B?NWVQRkY3M1ZHME9xbGhxTW1qK01COEtUOEF3LzloZWcrbG5oSldZby96bnpt?=
 =?utf-8?B?d0IwVEpSVXJidnI3cEQ2bHpJbDhlUmFMYjJUNHB6Ym91SE5vajhxa1g1L0FX?=
 =?utf-8?B?L0lBbXBkUGVTM3Y3bm5GcktGTjNjNlZ3OHd5T2xzeW9SNGhmM2ZvUk5sWHN2?=
 =?utf-8?B?YWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2065892e-e4dd-4815-16e7-08dd0d6e27f5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 16:28:12.5846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9Pb55l+QQ8s/UIJGkQmt/yD4+P2R/N4Zxa6flg0HdwMcLdbKI6/j/xn5U4Drc+z5X3C0CQli9KnOdNetyWZEF4oyGWYk3XufDP+Cjjq688=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7627
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Nov 2024 16:28:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5802

Hi Antonin,

On 11/20/24 8:57 AM, Antonin Godard wrote:
> The previous bin_package description was confusing: it would instruct to
> use the git fetcher to extract the content of an RPM package using the
> `subpath` option - but that's not possible as the git fetcher can be
> used to clone a repository but not to do the extraction.
> 
> Simplify the example with the HTTP fetcher that points to an RPM file,
> and instruct the user to use `subdir` to extract its content to the
> directory expected by S.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

[...]
> +The :ref:`ref-classes-bin-package` class is a helper class for recipes that
> +extracts the contents of a binary package (e.g. an RPM package) and installs
> +those contents rather than building the binary from source. The binary package
> +is extracted and new packages in the configured output package format are

I think this is actually all misleading, this is not what bin_package 
class does.

What it does is disable the configure and compile tasks, take the 
entirety of ${S} (aside from patches/ and .pc/ directories) and install 
it in ${D}.

However, it is mostly useful when providing RPMs/tarballs/debs, etc... 
but the extraction is actually done by the fetcher I believe?

While looking in the fetcher, I discovered that there's a parameter we 
haven't documented yet for RPMs which is "extract", c.f. 
https://git.openembedded.org/bitbake/tree/lib/bb/fetch2/__init__.py#n1568 
I believe this is a way to extract only one (or more?) files from an RPM 
and then extract it again? c.f. commit 
906285ff00d6ffd3fd7713af52250e7c6503edb7 in poky. Unrelated though :)

So we should document this and states for what kind of recipes this is 
usually inherited but I think the current content is inadequate?

Cheers,
Quentin

