Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361FAECE579
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 09:57:03 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.4])
 by mx.groups.io with SMTP id smtpd.web10.49417.1725875816042067450
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Sep 2024 02:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=VNzDBEQY;
 spf=pass (domain: cherry.de, ip: 52.101.70.4, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ylCj3X1WIYAbOBxwOx+M+2S3L0gurGoUl7tBC/NFKysuynt1Q6Dmiu9kY/JStW5DkFi+rVd1Boj/F2Q9CZdsasM0kP7M8QFwubO7leF9PUqBYB8vOhOxU4mVUrtW7+HDcKGa/GOcqls1L7h3Dk0a3yfrN+LZzBgQ96mN6hxNesm2HpLYb2Jd75vyRfXJ6YtVHAN9MXtp3iWc+7C05FQs4DSt8EqV4krjIOPK6nfWe1HYFG4iUEUETa26b3y1vKRz6cNbssQAknJQR94iY3D5SmEr00ddqz7GPyNdzw3Orm1a+DaBxFlKyaspOTzVlsWeQHT5Jn4ZZgyvyXFJbjDAtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ejru6XZkXV3e/OZM2LgEJJYnfdQGRbtdvfVmTAQm/xw=;
 b=XPnRYyWQqyvSjL/Vn3t9Qo3g3r9U6crzxXcNcx5DAI/ZzENFit6stVwATZiMEd8uVJHq1A3BiPptVIu/eBTlDwskn2dcrXK/Zt201RHgpmgApmxqnXTiD9gV26NH1/kD0r+I3r5qbyo5R8HcPnBMfDGrZ2r8+gJk1mA2hKzqsafBcqZ6AQSZX4zndl6/BP2pov7rpcZ6kbG3Uq+a59nmiLheQ63Fg4qYSFrZjyV1G3J+9Ixp9qXVa7IBJ8ZqyXM0b4SI2A0IGujwZfUVojr+hP7kXhkE09OeRZMJrG9QRRaOgnfbS1Prrit+wkzRiGOxUf2JDQBEqznHLj1UCDVUgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ejru6XZkXV3e/OZM2LgEJJYnfdQGRbtdvfVmTAQm/xw=;
 b=VNzDBEQY4wVi75zZdtu0rWy3bVx25xD4Lq/XE9Ua5QbaUbr7BK7V7i42C4Wp2zVFdbc+yeOO0EX6q2wx2P746gOOJ3OVHEJZ+utJx2qbmozzVeRBcimp3kfNRfhnUhSSKGBxeMGMvj6ejZRWV+aiDhPHpk3z8cqZEqVlYxdZ5u0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PAWPR04MB10031.eurprd04.prod.outlook.com (2603:10a6:102:38b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Mon, 9 Sep
 2024 09:56:47 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%2]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 09:56:47 +0000
Message-ID: <cfae274f-86c0-4ffa-9c8c-ffd3601ec26d@cherry.de>
Date: Mon, 9 Sep 2024 11:56:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] docs: update VOLATILE_{LOG|TMP}_DIR
To: twoerner@gmail.com, docs@lists.yoctoproject.org
References: <20240904172748.18526-1-twoerner@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240904172748.18526-1-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::14) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PAWPR04MB10031:EE_
X-MS-Office365-Filtering-Correlation-Id: 55482bdc-9069-43f3-3972-08dcd0b5b798
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SlpHaStWcHlEeCt5cVVVdTc1aVh6ajJuU0lEeHg5N2pZa2dzdHNwY2dyT3Bo?=
 =?utf-8?B?cXNJeXpFaVRTc2hPWHRDc2V2bXdIVEN1ZEttMW9iU1VYS3VwWUVxZHdyVFNt?=
 =?utf-8?B?OWwvTTNYZXVGOUdLKzRodXJWeENZSUViZXdCc2dMMDZSZTlxWDB1YTd3VCtm?=
 =?utf-8?B?R1B0cG5yVVdLaWVsdGtWZEtzWHhvN2RVRkFBUDZ4dWx2N0JTQUV1MmZmcE5C?=
 =?utf-8?B?STJJYzdmUVh0ZjVXc0E3aWNaNFEyZFJaRnFrVEdKdDVUVTdacjNjQkQ5dmhk?=
 =?utf-8?B?S0s0dFJ3OWNuTTljWWNraFJSbTYyVG8rZEZWalFOVGhqbk9vYXpXeUUvQlA2?=
 =?utf-8?B?ZjBqckFqRXUyWFJhWExJOU12OHluWmpyM1BEQXBCRXRTN080WHhTU25qdHpL?=
 =?utf-8?B?NmNRWGdQYUZHaEdJVDdrY2JIVDR2Q3dsTnVFYVhTUy91RVhUYVc2ejBBaGwx?=
 =?utf-8?B?UFlUVDM2OUhnMHpHSlAvR1FoSWgyOGNOeWF0TFdLMmNHRHgvQkpDMktib2dt?=
 =?utf-8?B?VVBsaHQ3eU9XZWhwYkhOaW5xZlVvdFRwcXA2WVhiakJhVzBNYVptK25rUWp5?=
 =?utf-8?B?U2xXaHVvVnR4R2xPL2tQUXozT0l5Nzl6NXAwT2xibGNDWmtaY04vWEsvSkpi?=
 =?utf-8?B?UlUvNFFDUjhqWU9kNWZXbGgydFlxZE53TTM1TTNDa3luc3V0aXBSU1ZVNU5L?=
 =?utf-8?B?YmxrTHZibjhuTHZTOWRXZCtvNVVGNVpoa3pzcFZaZVF0a094ZVBMakxsUXBw?=
 =?utf-8?B?LzlCVjdlbVJPUElnQU9DY0IrRkpvVHFlOTRzNTNZWjRTMyt3cDB6WmVKQ1FJ?=
 =?utf-8?B?MXhhbUY3ZFA3TFpVbjlNRXQxcXR4ZlJaakNodUVqeTlCRktkM3V3Z2VnbTg3?=
 =?utf-8?B?OGxFd25iVGlxcEpKTHh2SDk0Y21jaEdkVzhoUHB1am4xWXZIUjhRQ3ZwaERj?=
 =?utf-8?B?cmJvSmFTdnROR2ZuRWo4c21uRXhoemE5cjgrKzdQSTlvd0JZSERmTnM5VkV1?=
 =?utf-8?B?T2Ztc0ExczdUNjk3dHdmVkVwaWxEcC9KbWRIY2hUNkJlcGxrWCt0SXUxQncw?=
 =?utf-8?B?YUFsQlEvUUNOYVo0Z1pYYk9jWHpuK29LMC9OK3NySW5TMTFad0NRYnY4c3JZ?=
 =?utf-8?B?eDlTLzAvVmU2VEJGOE5ScmV5KzNZcFdSOVoxa1ZhdmJFemtkUUkyTVlUQnVW?=
 =?utf-8?B?SVRUYUFwdTR3VTFwRVpvUHhRWGJzKzl2NjZiTG1yK1NUNzFROTdqS0xZYkE4?=
 =?utf-8?B?K1BrUGlJbG01RTFvZFhFcHlhSjRpTUpUcTRUdHBXbm9nYnJ3UzVMZldTM2cr?=
 =?utf-8?B?R1JsSzVsYnFOckg5Zmlza2E3R1k5VnA5cHBIMFZBRkJzNlROak5vb2ZSRGZa?=
 =?utf-8?B?SFdaK25xOW1SbTk4UHEyV0ZWRExFcmt5b3NLOFIzekpsR2x4QWFpdG9qVWVR?=
 =?utf-8?B?bVZjWFN5R1FjL25JQjRKRTlGajZhK0tPNGRqTVBzbkRwZzlidjFINXpxdG8w?=
 =?utf-8?B?c2tvQUxQSFN4NVBLM0I5ejRDZS9rUlZvdkZ4eENQcDcwdW5yWnkrY050SkJQ?=
 =?utf-8?B?N0g2TVFLd2dqRVkvVXVjeGlmVGZFbjJMc1JTRVhzUkI3Mk96U2RMTVRmYVVm?=
 =?utf-8?B?ejduWC9ZKy9GT2lKQk10UVlBQUViYU5RWFgzYWNBaUVrU3Ixa3NUdGtGSzN0?=
 =?utf-8?B?VzFPc3pXcFIzWnlHbnFSeUJhME14dll1OFVOL0I5K2VCSS9zMy9Id1BlbE1K?=
 =?utf-8?B?VlA5eXdMemNkMk83NUltSndsV0d1cjRtcnlXeGFvNTVYb21tYVVQODZvaWFF?=
 =?utf-8?B?VFhkZGFqbE0vRnUyMy81dz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VHppUVVEQ3J2R0xWUWtBbnl5WVN2ZTV1OHhhTkY1U1NFVHNJS0doZmJjbnhm?=
 =?utf-8?B?RzU1VnFsVktOcWo4OElIeDJORUNDQ2JKK2RBdkV2V0lTR3VQSm10MS95NlFM?=
 =?utf-8?B?QjV4K1ZYY3hjQ055emlWYTFtZ0E1QXVidXEyRlUxZ1VBZ0FYSmJNQmxhbUk1?=
 =?utf-8?B?bFo0TzBFdkxETUJYcGgvSGFiVlZpeWFheUFWM0JWZ0tsUHhsOHdVemszZGw2?=
 =?utf-8?B?VlYwZ3hlaHJzdUpFanRsbk5qMkVtVDdhMk5wc0k0MlMxVjg2OFdpejNEclVC?=
 =?utf-8?B?dFNzT2hYUHZjeWxEOGxyak1UYTJSa09VelJjTHdNem9hYXRuNDZyazhRSWRF?=
 =?utf-8?B?blYzVzY4SU5UVDBwZEpjOUZqOEFpbzFoWXNsZUV0UkN2M3hWbTVBT3g0MTZk?=
 =?utf-8?B?RGE3M1UvTjhSRVJZa1loRjNLcXhjNTVsQkVKQXRkb3hBNkszUG52aUFZV1Ra?=
 =?utf-8?B?SzRXWFNrVGpGdERiSTJsUmYybjhqdHdzNVJ6YWZBbTd2aG1Qa3FwbzE2bDVQ?=
 =?utf-8?B?V0lhaVVjNnNlZ0F5UEV4cmVRU2xnOG1HV1VkckxncjhWMkFlR3NBOGdDVVFN?=
 =?utf-8?B?ZzF3dlpNSUpYenZpMXVEa1BKU0twL3E1aFZmUGdDNHJ3SkNPNno3RWdsSjFm?=
 =?utf-8?B?NDB2d1B2S05zU2xHaGV2RVhDYUUxNDhFUldPSXFsSDByTnNnNnB1c2EwMkpk?=
 =?utf-8?B?MmxBdHNnWWh4YkZMTzgyc2VPUFl3TU4wbllMTGRjTTg4U001SHl3alV6aWhs?=
 =?utf-8?B?cHgwLzY5REd1NlMxaGJLVjBubnRxWElXYlE1ODR4SlpnN0JwR1pPUDJXNGRw?=
 =?utf-8?B?dVpnN2JQQUhvckZCRm1ZNnVVTW5OdDZRSnJJekgwazNUeGYzTThyRTkrNitM?=
 =?utf-8?B?djlEODRkdUNtbmVMWE0wQytSU09hTk52UzZGMmlHUjZIRkJCQ1pxc3o2R3Jl?=
 =?utf-8?B?MkgrQ01kZDZxbDh5bzgrbUdOU25wYk5YcXc2NFU1VXB0MWV0UGVnNXg1Qi9K?=
 =?utf-8?B?YTlEamtGemhWZG9OZi91RVgyRmp1MFJlWmN0NjFLZ3AreWYyaENURXJBd3RF?=
 =?utf-8?B?ZEFGQVRRaDlES0RTQnZkbS9hNXRRMHN0cFlOREllU0diYzlPZ1E0RGVFR1JT?=
 =?utf-8?B?bjlvTG1tK29yNUN2NlJYN3pjUndwU3JQZnVCNW5hV2dMWW1iVVpHK1dud0xr?=
 =?utf-8?B?ckN0SFRVVDJTMlprQmtLT1JwU25CcURsSVAyak5BUWJxaW9LejBpaFFMSERD?=
 =?utf-8?B?Y2ViVG1kQ1hZUXdXRG5IY1R4Z2h4Sm9ucUk2Y1FVQkhFUVVzNkdUelZWeG1Y?=
 =?utf-8?B?VkN2ZzBsaFBoaUs2bHVQVlZQcmN3aHNCU2JSc0lEaG5rUG1GdDNRUzU0QWRV?=
 =?utf-8?B?VTNYRUZIVVNOUTBYZ1N3RzQ3TlpIMEh1MXNQZUxOUURtUUd4RGlwNFVxdVdo?=
 =?utf-8?B?Ly91bFJYMmhmak5oNmk4UzdYVXc3aEQ2ZFFRamNvVzAyZXZUeWw4REdXQkJ1?=
 =?utf-8?B?VklDT0MvemtYclhBR1FsTW53TXBEWTV6VU03UkRtNVkyTkYwaGVGbHY1cUwy?=
 =?utf-8?B?VVBQbldjMzZNc3F4TGVhT0czd3lTK1ZpRDE2V1dPMEZFbEEvK0xCNzJpYXdq?=
 =?utf-8?B?K3g5c3F0Zi80QytXUlRCeUJNbXVtODA0SzYvRHlPN1M1b0dyYnVOQmZQdzBH?=
 =?utf-8?B?ZnljVzdMcWxPcU5xbjhRbDd3K1Z3cGZsY3lJMktvU3ZtQi85OEE2UWF2dnVz?=
 =?utf-8?B?ZTJqeEdHNmRoZTBwQWNUcVhpMWlMMEFHS29PYWx2RUFTYk1TVlI0N1VOUDE1?=
 =?utf-8?B?ZnNTY2pSdVE0UGVVYjVNVlkzT3F6bithQTBpV1JCc0tBQ2VCWmdGWG9sZFp6?=
 =?utf-8?B?a0t6VU5yam45OFpwd3lRamNTbWlkMktqVlZ6allhdFpqSWdYR0N4TGR4eVBy?=
 =?utf-8?B?V3BMWFZCQXA0RFR5eTBPYjE5NjVVNy9tZDNUWW40cFpIRnRhdTFHWi80U3FY?=
 =?utf-8?B?NHZONlIxMVZXUlV2OC8yeXVBOG50dlNSVy9RNDNoWS8xSTRkS0VPemJZdGQv?=
 =?utf-8?B?RTZYQzM5R0IvTFhuckg1SCt5UzFJUnNWa1lFZHdVdkhLM0lhOVJqdEdlV1NX?=
 =?utf-8?Q?MDSk3z3HorlaQq2OdfUAEZF1t?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 55482bdc-9069-43f3-3972-08dcd0b5b798
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 09:56:46.9201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJncPEG96rpqyM2rjnPZj4Z/7/JXRHNPn/xH6zQX8uDx8lbZxJnkjlN4qblM2WhGei8Wx5DaFjED6OzOv1T2s4hsCZOYVsaIOI2++1R5ISY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10031
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 09 Sep 2024 09:57:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5356

Hi Trevor,

On 9/4/24 7:27 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> A new mechanism was introduced to handle whether or not tmp and log are
> tmpfs-based (i.e. in RAM) or persist as real directories in the root
> filesystem. The variables VOLATILE_LOG_DIR and VOLATILE_TMP_DIR no longer
> exist, and PERMS files are used instead.
> 
> oe-core: 8d1ae67b89c4 ("bitbake.conf: drop VOLATILE_TMP_DIR, use FILESYSTEM_PERMS_TABLES instead")
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>   .../migration-guides/release-notes-5.0.rst    |  2 ++
>   documentation/ref-manual/features.rst         |  4 +--
>   documentation/ref-manual/variables.rst        | 32 ++++---------------
>   3 files changed, 10 insertions(+), 28 deletions(-)
> 
> diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
> index 800ba20a27b5..191debd0174a 100644
> --- a/documentation/migration-guides/release-notes-5.0.rst
> +++ b/documentation/migration-guides/release-notes-5.0.rst
> @@ -335,6 +335,8 @@ New Features / Enhancements in 5.0
>      -  Add minimal VS Code configuration to avoid VS Code's indexer from choking
>         on build directories.
>   
> +   - VOLATILE_LOG_DIR and VOLATILE_TMP_DIR were removed in favour of the
> +     FILESYSTEM_PERMS_TABLES mechanism.
>   

Maybe we could add some :term: here so people don't have to look for the 
new variable to use in the docs and just have to click on the link?

>   Known Issues in 5.0
>   ~~~~~~~~~~~~~~~~~~~
> diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
> index 2ea946b31d36..97c05cc2839f 100644
> --- a/documentation/ref-manual/features.rst
> +++ b/documentation/ref-manual/features.rst
> @@ -323,8 +323,8 @@ The image features available for all images are:
>   
>      .. note::
>   
> -      To make the ``/var/log`` directory on the target persistent, use the
> -      :term:`VOLATILE_LOG_DIR` variable by setting it to "no".
> +      To make the ``/var/log`` directory on the target persistent, remove
> +     ``files/fs-perms-volatile-log.txt`` from :term:`FILESYSTEM_PERMS_TABLES`.
>   
>   -  *ptest-pkgs:* Installs ptest packages for all ptest-enabled recipes.
>   
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 32c9e7407dbc..994ee23e2709 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -13,7 +13,6 @@ system and gives an overview of their function and contents.
>   :term:`K <KARCH>` :term:`L <LABELS>` :term:`M <MACHINE>`
>   :term:`N <NATIVELSBSTRING>` :term:`O <OBJCOPY>` :term:`P`
>   :term:`R <RANLIB>` :term:`S` :term:`T`
> -:term:`U <UBOOT_CONFIG>` :term:`V <VOLATILE_LOG_DIR>`

I don't think this is appropriate here.

Instead:

:term:`U <UBOOT_CONFIG>` :term:`V <VIRTUAL-RUNTIME>`

>   :term:`W <WARN_QA>` :term:`X <XSERVER>`
>   
>   .. glossary::
> @@ -2994,11 +2993,12 @@ system and gives an overview of their function and contents.
>         and users across an entire work project. It is best to do this in the
>         packages themselves but this is not always possible.
>   
> -      By default, the OpenEmbedded build system uses the ``fs-perms.txt``,
> -      which is located in the ``meta/files`` folder in the :term:`Source Directory`.
> -      If you create your own file
> -      permissions setting table, you should place it in your layer or the
> -      distro's layer.
> +      By default, the OpenEmbedded build system uses
> +      ``fs-perms.txt``, ``fs-perms-volatile-log.txt``, and
> +      ``files/fs-perms-volatile-tmp.txt`` which are located in the
> +      ``meta/files`` folder in the :term:`Source Directory`. If you create
> +      your own file permissions setting table, you should place it in your
> +      layer or the distro's layer.

Where in my layer? Is there any variable I need to set in order for this 
new file to be found by BitBake? etc.

Do we want to explain what the default means for the persistence of 
which directories? The same way it was done for 
VOLATILE_LOG_DIR/VOLATILE_TMP_DIR?

Cheers,
Quentin

