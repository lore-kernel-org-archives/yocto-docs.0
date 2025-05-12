Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E30C3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 07:50:21 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.71])
 by mx.groups.io with SMTP id smtpd.web11.44903.1747036212056683797
 for <docs@lists.yoctoproject.org>;
 Mon, 12 May 2025 00:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=dZDzheqC;
 spf=pass (domain: cherry.de, ip: 40.107.162.71, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFdzOr5WmwQip2KWqOVfBmRKCvoR5ujA+6z/N69baTimsW222O7Q0sCUTLtMKTr3nhGyGWNsedUuTFCMXWMXlgV6rYCUN2bzXf6VA/7jodiw5RjINeI58h6ZmdYJIfCyI4Fd3Shw7yNJkaiVgHM3bwad7uG0vxemxYi0emwbHSDm7Yr5SbTsxG69LdaW1o/hxSwZMNh1K34Ua8XfnGlOGQ4j1j0Ccvh65JldFE1VKedFT791Vh1kcamISC6K4x7CB46dokWlf424lbmg60cfSMGS66mDNA6L4FXhRy4htA0ZSnuIn9UP8x+QGt4wEDrf1aqzXPwJwZQKDSGJTGDxYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdQHUeSjX3uYxsrLStTFUJ7NzhityjqOhe5vwqHGMHw=;
 b=YBW7pd6QbUGkQ5LEBDq4mHya6Glz6YTT/kyf2XrHoxq6AZZsp4Cjfn7Da7u5FpFK47xLra2CWCQbgwhIvqsp3T4Yvgg+Q0mOtIjcIH0QrNz1yDE/IhvSIkGmmdrIO4jXRyRPanAE0/UgYa10+TWTLDCCbVNQPHsT0vbHYsB914prOKd+6/QqDD3vtLNSsiSzqbrUyZP/bT9jxFg362PEpDghHmLvcM7+BocaBVq8uFs6oSXIB0WDaE6RfZZMMqayNO+CAv6ydf1WJdxF1akGRKvmyAyKeiGY3Or2Rs2a8EyIWbx59YkBJrtZHTf4wpbMuQm2rKCey7KKye2IWMC3dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdQHUeSjX3uYxsrLStTFUJ7NzhityjqOhe5vwqHGMHw=;
 b=dZDzheqCle3TWLxyvQmXDha+NPucWPr9EGl902u6gJ4YYEkZRtbMfIUXzt2kAG1bISC7uQFZfm4ms1fww2prHWUgmdLWT5p+XOmi5iQ9Hzh3z1GUBepXnjIDNuNVVSsVhwxbSLhZPXzNrWLLEKRyud0G+92cSNvJe+zJ7BBIB7k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 07:50:08 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 07:50:08 +0000
Message-ID: <d7d0d319-581a-486b-bffb-7ddf0f771d9b@cherry.de>
Date: Mon, 12 May 2025 09:50:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] sphinx-lint: various fixes
To: twoerner@gmail.com, docs@lists.yoctoproject.org
References: <20250506180301.32610-1-twoerner@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250506180301.32610-1-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: 9098ffaa-f580-44f5-6aa7-08dd91299d9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OXNaeTNON1JycWdhaDJWRXhTa0UrcjY2alh4YXlsbERPR2NkY1ZGWmhEMVQx?=
 =?utf-8?B?TXlkaW1SWmVHd3UzbFBEWkxSd1dkTjVYMmQ5YmdzdVUxUjRUS2thK3d3Vk5V?=
 =?utf-8?B?cXg3bVhaQ3U4empyZXBiNFErVGQrUEJ5Zy9kYVZuM29LMFdCQkltNlR4Mjkz?=
 =?utf-8?B?aHFUb3JkUkhEdTE2MWczNXQwa3ZUbW9MTDNkT2hYZE1WS2lTUzVzcFN2Ni93?=
 =?utf-8?B?M2taWW5sSENvTzRSZllwQnNxQkFrYXJQNmtxTlFGR2tweHJ4SERQQXlsdmxi?=
 =?utf-8?B?MDVnR2xEMEcxaXltRnNRWHArZlpFQjJyWVZZZFViejR2U2h3ak5xMFFzbHhp?=
 =?utf-8?B?cCtjSWJLN0ZZWnVRY0pNNWNFeWtRbmE2S1FXSXd1SUhJTE5DcFUrZVEwKzhX?=
 =?utf-8?B?ZFhTZ3RFMGNNekRtRXlkdmI0OTRWb015TFZVcU5qU2FuNDJweWxvRTVxWXRP?=
 =?utf-8?B?VHhFREw1ZngyYXVaeWw5OE9jYmhDSmZqbDRMUzNXUHlLUG5UWEkwMjFLM2VY?=
 =?utf-8?B?Y0xQaVBLZllZUlA4WUhFejRaZGVGbDRRQ0tzYldnbmdScVo0MWtDRS9IczFh?=
 =?utf-8?B?NWREUjVTanpWdHFlUE5XUnBXb21keWZWSmZIL3VOQVF1ZXgza1A3dVdvQkZS?=
 =?utf-8?B?NHUzMjJhamp3Wmo4VkVYZmlPcUZCcWV6L1l0ZGRHZUk5aDQ3b1dNbnFUT3hG?=
 =?utf-8?B?bEk1Vzc2TUh2ZktDcGNZVTlCZTFxQUZUZXpKWFp1dndNZWtjZUg2Y3BFL01V?=
 =?utf-8?B?UTFvL1hwZi84QmxucEhrUGtZZUQwTDE0SWcrYzV4NUJ5YytTWG1nbGZsYWpq?=
 =?utf-8?B?ZmZWTFJnaWtXbWNXT0NQWVpGb2RWNWpJUDFYd3dMVXNlVENCNGZLc2g0QUp3?=
 =?utf-8?B?Z0orOFVGT0xGTitnRk5lRmk5NEdNdnYwY2NTZ0ZIYnpYTk9FdSsxRWhMR0pl?=
 =?utf-8?B?a0VPeUF6RGJRVm5jYjN6Sks5dXh3dTNZaytUaEEvLzNoaVBhOGlSTktSNGIv?=
 =?utf-8?B?Tk1RWjhqWTZGTzU2ZzU5YjV0L0lNbDVPQzB4RWRqVnNnalo1ZlA2aGVkamFK?=
 =?utf-8?B?akhoVXMxN0dZUnBQeWJCS24xYmprUUNSWHhucC9QbGJQMTMwOHd6MTJqeU9E?=
 =?utf-8?B?S3dFTzBGZTJPc21IWExQSU5Oem9hYkdLODdxUDJvOTB2S3VJTTZKRkJ0aFQz?=
 =?utf-8?B?a2h1STN2bE1ObGNqODZwbzZzcjlwVHEzVnBJdUdWR3FOYm9WVzZJN1FyMklD?=
 =?utf-8?B?b29NWEdobFVVRmc2QUNlMFd0SVhyQWg5aStxaCt3VDdnUlNwWmxSOWkxVjhK?=
 =?utf-8?B?ZDE4YnI5SENSSG1Mait0amhvcjNhNmlTblNXZVl6RXRhRW4xdkE0NUxnK0Ju?=
 =?utf-8?B?WmhSZVVjNFJPYUw5WXFnMjh1Q0xqRnRnVVROK0Z1K2NEQzUrS0NtTzFCc1BM?=
 =?utf-8?B?cU5Eam9SamMyUVczTjhoUmZ6RGtuN09qVG9PWGxmOWhDTDlvWHhJMHNzanZo?=
 =?utf-8?B?M3N5QjV6emFBcXBvMnJiZGJUNmNVRHdYd3B3U2hHdTV2dWxlOVNIdEl3N1gy?=
 =?utf-8?B?STVGQUdueDRpZTVkZXY2UzFLUjJ1cCs3bkN5SW5vY2Q3eDl0di83bDcxY0JN?=
 =?utf-8?B?Rm9LWVZ1QkhPZjlNVkRScS9vTGJpa1ZvWWhiU1hFTU1qcFd6aEhzSVd1QXpQ?=
 =?utf-8?B?Z0dzRllIcXZ3djVlQ3JEdHM5L0R1WDBKTkRJZVVBeUVQU3diVkd1VUtQVUJD?=
 =?utf-8?B?eTJBZ2RNRzNrcSt3bnMyOVZtZkZFV3pITWZnQmlMb3YycWExMnAycFp6Slky?=
 =?utf-8?B?V0F1OEVBcm1pck1hVld1TEVHc1FlOEhBcmVYL3JObHBYb2Fib090bHFNeEx0?=
 =?utf-8?B?ejVpdXJmZjhkcWJmSlNBd0RVSFExWnlUbjUwQU90aVZ6SlA5WHI0MDVKc2F6?=
 =?utf-8?Q?h+sfTo5m3bA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S0dxdmZ0ZSt3T0lxSk5nK0UrcjIwUVNNV3pqZ1VEaERNbEIrU204aHIxZWNt?=
 =?utf-8?B?WVlENWRhOFQ0RGg4R3gyN3lSSFFaWVMweTlpVUIxYjRiSDdNWHZhcW00SUtO?=
 =?utf-8?B?R3Y3YXpJQU9oYU01OU9mWWR0MG5ZaEJoTXVhSFd6NWo4R1ZPRlNCeURKd1pY?=
 =?utf-8?B?R3BOVndJTlRDTk4vdGV2VENCeWVXd1JYTmhrSHpWcUF0azBkTzliNzEzRUh0?=
 =?utf-8?B?ZWlUL0NZVUxiN1J4N3pjdmpoeUFlMTM3Q3NaWXJIVi8rUzZHUFdEa1FVcnpX?=
 =?utf-8?B?VGYxekJLcmFObmRiQzZIZnBlWkl1ZHVPRlJuOThjV1Q5dWtPVDdxdnZBZWQv?=
 =?utf-8?B?bytOd1k0NHhHZ0U5YjdUL2Z3cWF6OFNRWnN1V1R4RUhyUnJsSWMvV3lmK2lH?=
 =?utf-8?B?UUJpczdKQi9qZkZPSGsvNWplQlhiOTA2ZDU5M203cmM4Q2NLZDR2TXozTXBN?=
 =?utf-8?B?ak9LWjBLVVp5c0F2Vk5Hd1ZBNGF6WXprd1VzRWlpT3laak5TUEFzK2huTTZ5?=
 =?utf-8?B?MkhSZCtJdGQ1MUJCN3NOSmRtSngxZ2JDNTAwWWVCdWpUaXhYZmtrdmUrK3lF?=
 =?utf-8?B?ZzVRd0x4R0tjZkEvWW9JeFlnVFNFencybFFDQ1Q4MVJ1a3Buai9PN1B1VDQw?=
 =?utf-8?B?SHQrc0hHRmkwT2xGQmRGbHRIaEg4Nk5jUEhCb3VIaVNYL3J0RXZTb0d4aFQr?=
 =?utf-8?B?NzhhQVF3SXpVczdKM1drVTMwYzJiVldPR3JLL0R0MXJtckxCSHZxc3NwNmNi?=
 =?utf-8?B?QVpVR2lqZkIrU3J3d1A2TVhnREMrOS9Pdk5DODlVZEtBTU43T1l4eHpZNHRV?=
 =?utf-8?B?elZORDNyK1B0MVNoKzhXc29QaGZ6RUxHWVBCYWRoMVlxNU1xT2ZOVUlsa3dL?=
 =?utf-8?B?cHY2bVVGU1dPVGtYQWNvdkdyRjJxMUplV2Q4TnV6VzBEYmtrMnNwbEVrTmhN?=
 =?utf-8?B?UzJodmVrbDlrZ3JXTlN2K2J4ZmMxZDVIV2E4WDc4aEdXMW83VEhldkh5WlRl?=
 =?utf-8?B?VUJPcnZtcU9wNTUyREFKZExVRnI2R1BJOU1VdGlwTUV1ME5zNXljODBHYlU3?=
 =?utf-8?B?TXgyd1BGN243RGRDczhVOWNzMFpjZkEydzJHVGwwMzdwK0QzUWJwYzU5TTR5?=
 =?utf-8?B?UFR6WS9hczhBdVhHTTNqOGJFV1Vack93ZjJEaWpZNE5ucUptVWloY2Z1Tkxx?=
 =?utf-8?B?c1ZzcVF6aFMxOTJVWFhzTndWMmRwK1l6Mm9kbW1DWHp4TlhpZzZKSXhqVVdw?=
 =?utf-8?B?bGtHUS9GY3pFalZublhNamx1cWZ0Z0FuQU5ZeVhSS0tFM2duQlBxNkRWRk0y?=
 =?utf-8?B?QUVMbmFsckJRZWx1Q29rS2ZmcEZaYkZTRTFITFJsOVVJU0lsOHN6Y2xXdTRs?=
 =?utf-8?B?SytDNkhxcUpJK0tsZ0FtOEtVV2xqOWE0ZDd4N1FPdGJBeHFmdytBL1Y5Y2xE?=
 =?utf-8?B?MjNrT1pFdWx4MXFuSjU1OFk2bkJ5b29Yd01pc1AySy9odmdOTm9ZcWpRaXVI?=
 =?utf-8?B?anFXdHVtR3hQRXl2UHhKZnRJTHlKajBzODR0dDgrSXpqME9EQUE0czRjdGQ4?=
 =?utf-8?B?ME9vcjBRRVlEcEhjK0hKZ1MxOTJxNDdpTUpqUmExLzArYmRUaCthYlJZT2xp?=
 =?utf-8?B?Mms1YzlxN1JWM0NMRFFCYnZzQVJ4WHZ3Y0d5Nk54ZXA5bUtTZGpidHBuVmMr?=
 =?utf-8?B?eU15a1JtZmJQYmcweWZKVkYvTXpEOGJJNWFmRi8zNGU0RjZYM2JKVmEwRXBw?=
 =?utf-8?B?TTlyQTd1b1JTa2ZGcVc1L3pUNllTOHh0aFBKTi8vaUZnSzlKUno0Y3BGMEQ1?=
 =?utf-8?B?TGU0Q244ejR0Z0lrQ2o4T3kwWnFrc01vVU12bnBWcjZmSmwzWkd0bWQ3UDlz?=
 =?utf-8?B?M1NTTWpCaEhLdXVQcmQ5K0tlNFBXaEc0Y2hCU1VJUUpMSnJMWjZyYWpIRzJp?=
 =?utf-8?B?OHJuRlIxYVY5NEhydkZJSWdMNC9XekwvTU50UG4zbkYvT0hFM0dHSmREcHRl?=
 =?utf-8?B?a1MzL1BDN3RUZzVCMklhemN5VVdlWWRkZGYreVFHcFYwaUVVckY1ZE1YM243?=
 =?utf-8?B?ZTVTZzhWUGtHVDlXQ1NRRHFKYVc0WlVMWnZjUEthak5xZWtzUXJqaTkvd0xO?=
 =?utf-8?B?Y0JZODBZajEzQ0Vxa2l2eFZlODd3VVZoWXJITFV5VkJ5VGxmRGpqS3pNcGNh?=
 =?utf-8?B?bGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9098ffaa-f580-44f5-6aa7-08dd91299d9e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 07:50:08.2738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dGbyBGNH2aBd4i8803i++NqRNNiI+ZEVvSGNAbtbgEYDrX52jZdETehogh95eqsSyj1EZ8eb6WhsUuCi+96248ejRxYQqpIG+UXMERRd550=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7930
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 May 2025 07:50:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6806

Hi Trevor,

On 5/6/25 8:03 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> A 'make sphinx-lint' pass found the following issues:
> 	trailing-whitespace
> 	missing-space-after-literal
> 	role-with-double-backticks
> 	missing-space-before-role (role missing opening tag colon)
> 

I'll let Antonin confirm but I assume it would be a good idea to have 
separate commits so we could easily backport them to earlier releases? 
Or maybe you/someone can run sphinx-lint on older releases and send 
patches for those too?

The changes look fine (and necessary) to me :)

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

[...]

> diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
> index 0f015d434041..21d3dce58c14 100644
> --- a/documentation/dev-manual/start.rst
> +++ b/documentation/dev-manual/start.rst
> @@ -860,7 +860,7 @@ Initializing the Build Environment
>   Before you can use Yocto you need to setup the build environment.
>   From within the ``poky`` directory, source the :ref:`ref-manual/structure:\`\`oe-init-build-env\`\`` environment
>   setup script to define Yocto Project's build environment on your build host::
> -
> -    $ source oe-init-build-env
> +
> +    $ source oe-init-build-env
>   

You could also remove one whitespace before the $ to respect the 
"code-blocks are aligned by three whitespaces" rule we have (and which 
seems to not be part of our documentation/standards.md :) ).

Thanks!
Quentin

