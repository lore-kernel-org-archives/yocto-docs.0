Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315D6E77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 10:03:44 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.84])
 by mx.groups.io with SMTP id smtpd.web11.41464.1736849020564297229
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 02:03:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=dtTnp3TL;
 spf=pass (domain: cherry.de, ip: 40.107.20.84, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnUR9N26xLl/CDhYuteklnKr2u9a9n2K8pwtC8lSFNJVTQ7Rd8cF9Ugz+wNfI7p+ZEvEGWmGQW+Dc/9X8hNK/zRurIvMjjdgznSTwpJmmWLXNnqy5dgMT8szx0+KW9zNUnacC5SowHIo8cyHeZS1iGFqjVI4ucnhB6SXgq8WQHCQW/HaxO2KhU6wTvlQRF4+SIS/r4V3kOt3LpMMpIrTVqhfgfVpbJaaePyhyYkQRYmJcej03v2vpqjcAJo9rySz+5YR3Sm4zSIaMQL7wzLpZiS6DKmJO2eJFMD7lEm/CYHgLAz2iVNySy+jli3XozxakpldNGg0wFKq8zi0BXrqXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qy65Liy/cleEG9Ps8G7uAW8pzgRrh7x6eCfpAALmX4=;
 b=Ya65B04ORHwjrYFbTpftGU0FGlStoqXh9ZpiVT7JU2Jql/8nN/LEgR67JiPOxHL6lBkHd6+dTX1vkcLoZikOJe4A3I48tlwiplXtQ58tZW6iahjsQParHOC++d8EIUmncu0JX3W6QrLN6oIYa3j/jI1vvzgPJcYSlW8ZNLrXQAdj4ydqaDSSV3ZxYvDulAIK13CLNRSZYMFjPYMqhDtFSkjRJ0Y8AGCqQwTS9NBAS86wGtQcTXbjWHBFk0jCzaXG3I2YP+b4ra29exUqmtcdCRorWcLMYnDTor3duRR1rydzt0xf1iMPzlOeoumXKET3yufUoW2w34wDLUGs3FsJ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qy65Liy/cleEG9Ps8G7uAW8pzgRrh7x6eCfpAALmX4=;
 b=dtTnp3TL6VJ7QN2W3fk0sdd2uSQ82UJZdYkNpiAFvy8iG48xhdn6jK4JJ1N1oREhk2DzorfD3WXDA86U03Kk3qGwnso7V7zpkFloZCEbRE7H88mEn0ovmmy0uyreLWlHfjyzWnQ8K3/73YGzcLuwUpJJGpBk8Uvp32znykhG+3Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8573.eurprd04.prod.outlook.com (2603:10a6:102:214::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.20; Tue, 14 Jan
 2025 10:03:37 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Tue, 14 Jan 2025
 10:03:37 +0000
Message-ID: <e98881ba-4566-4b45-9f39-fd6fd868883f@cherry.de>
Date: Tue, 14 Jan 2025 11:03:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 1/3] migration-guides: systemd.bbclass do not
 add Also services for 5.2
To: adrian.freihofer@gmail.com, docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
References: <20250113233736.4181201-1-adrian.freihofer@siemens.com>
 <20250113233736.4181201-2-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250113233736.4181201-2-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc0f784-dd69-40d8-18ed-08dd3482b6ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dkNyY2l0cWRrT0E5Z0N0VFZRVUM0QVlNZy80MmZKazByYkRaMmZvTGljL1FM?=
 =?utf-8?B?eWlleGtuZnpNblNGY0tvMEZyT3dHckp2NXZ2TklXZzI0bHAzTmdldG9nMVlF?=
 =?utf-8?B?Nmt6V0ZQaFhDNUhQRFVMUktxdk41Q0FJRWdFWGVEK1pWczJiZHhsVGx0dHo3?=
 =?utf-8?B?NzlYZkFObXh2UE9vQW5jNWlCRi9wYnp3MUdVSUdoajExdG16dTRFTStoOEV4?=
 =?utf-8?B?WnVFN3kxazlTcEgzRUxvMjlvMFBvTXhyV2R0dGVVME5vQ3FSMHVYUzhSUVhh?=
 =?utf-8?B?SGpDMU1UaFhMVmlNKy82MmhuWENEOSs2RFhQQzhyUlNQV2QzUlkyb1FZVC92?=
 =?utf-8?B?Vm93WnhLL29EV2FPRjBaYTVUaUNTdFVCekVMK1hXU05UaXIyTzF4SVpGRDBo?=
 =?utf-8?B?SzIwOUJTNHoyOTU0RGJRQmVZNHNEQ3p3dC9VNzhoV3JiRWZJK3BRcVZndGda?=
 =?utf-8?B?ck1ObXVpak0xWVhBTmsxNFlkbVNJUkxjQ2FDUXhja2NGYzdCdCt4eGZXUGVW?=
 =?utf-8?B?dlhHZ1c1V292a3UyOWJKUndvRk9CeFFzdW9Zb2J0TkVnc1ZiNURzRDUvTDVD?=
 =?utf-8?B?blYyYVJ3NTZ0TFA2bkRURFczelJndExPNmJDeWpxTEpJaFo5QW1YTTdsQlZh?=
 =?utf-8?B?a0hmd3BXTFk2Z3FtdFFNMDRjWndUUU0yZDk1d1d4cFNKalppWFhlZDlUaFZZ?=
 =?utf-8?B?SmNSMi80akkzNXRrSTJaQzlIL2dsNG53YUFEb3NxV2xlcE4rMURuM2hQcCtQ?=
 =?utf-8?B?T0ZuM2NjT2NnanZFSWlDRy9qNldRaFhheitCUGFhbCtXSHpJdS9jU2JHTXZ1?=
 =?utf-8?B?bm9pZ212ZW5GZlNFWTdMQk0xVmFjdHBpZThUK3J6b2srT1huT3hQRm13b2tP?=
 =?utf-8?B?cC9nakdKZDJkNWh4SE0vUXpQMVJkc0I4Rko0UHk3UnhrdVB0TkJBakxaOG85?=
 =?utf-8?B?ZU1lSDRGZHpCdWVUWE90ak1udU9MRVV6S01uZ283K001QnYra1BLMDRkUitK?=
 =?utf-8?B?THlreGFENXhkc0Z3bUJJcjg4b2tYWDZKVTJpMHdiaHRaRmZVcmFyTitITWYx?=
 =?utf-8?B?TEFUdlBOYUlnN25YblNnWmU5bE00Y0hHL1VCWStZYXQ5SU9yL2JHNEZZYzZv?=
 =?utf-8?B?Q3ladlU4SE16TVFjUW5DSFV6cWM3dVVRWjVWRmMyRlBDMTVwQmlhcGxHdVJY?=
 =?utf-8?B?TVduMlhZWGZPajRsbFRjdW02MnJsYWQ5ME1kZXJScE1STTZkQys2MjdqOS9B?=
 =?utf-8?B?ZE4rRThlVlBJUEhZcFFOSWVIMmVKTFZjMmY2KytycUI4SDdIZUpEeURJaEpL?=
 =?utf-8?B?SERhY0xpQlZMTTJmakwrQnJSQVFmV1hyNXFSWk1uMjJpcFZUaUx5L0xpRjcv?=
 =?utf-8?B?K0FsMmhka0xBeHJ5eVFOSG9HK3NEYy9kdTMwTEs5L0xzd2tCaGFCV2dRMEFV?=
 =?utf-8?B?bGtSR0Y0Z0hPWjY2UDEwdzU4ZEgyYXdubzBMTkhNU1Y0V2VFQW9hOXNBa0hW?=
 =?utf-8?B?Zi9KbEU1NWJjYVczRzNQU2JBK1pnTDVJRTcxZmlVcnhqbjhOQzRla2pGWXN5?=
 =?utf-8?B?V3dyWVpwMFpWeVhJYWl3cVo1czhBTkpNYnEwU0hQWjNSTVVic1F0dG9TTUZE?=
 =?utf-8?B?TUkvVk1LNmRyTHUxU1ljc091ZWxUOXhTbThCSmV1Mk1pbTE3cmFrUW1YMTZS?=
 =?utf-8?B?aGE3d2haajJIRFNkbThWSEF5VnRUb3FHTlpxZVpxcnFuczJtcGEvdUJaTitR?=
 =?utf-8?Q?rFf1O+C3nvPjwhyt1d/HILnyUHDLLCX/hXzCpzr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RzdiTk9SaC9TcjRxN2d5b0ZRb1Zldm53RU9ibTNrTUw5VEpnSjZBOGpYRXk0?=
 =?utf-8?B?UHl6TnFabG5KTisycmo3RkdsYkUwZUxTQXhZdGF0b05wRDc3am8yRkFYVUk5?=
 =?utf-8?B?ZS9PNkhIMjR0QmcwNnhpdklLREw0cnJYcXQ2S2UwYzNKTC9nbG0xeXdpSjhD?=
 =?utf-8?B?NFJ0cVkyZmZ6OUxnVnk4NEsrTDNUNzNIZDZ5eDRCNU5LdksyVEIvaHQrVFJi?=
 =?utf-8?B?THN6MHRIaTEvcmVwS0JyM3Y4a1dMTmYySXF6N0NEOU1nTjZ6N0JEclRJTXE2?=
 =?utf-8?B?V2RUVlZZOEo1RUpUYVcvbFFiUC8wZ2RxZTBnTzNqTFB5Uzh4S2JETnlTVGVU?=
 =?utf-8?B?MFRWVXhBNjFzWjF5bXFrakJyUk5UU3daWjdVVmQvM25hVTdFRlA1SlFCZ29S?=
 =?utf-8?B?RjlHNXV3RjIvNFQ2ZlJKUkF0WXlwOHZ3cDVuTHliSEg2UnQzTERmQ1U4QXJq?=
 =?utf-8?B?RUpBV2dGUDNJR1h1S3lVV1k0R2FLbzlXS2QrbjRrdDZpOU9iOUxZNjdBYUtC?=
 =?utf-8?B?TkdBWjNseFhZOWdHNVNTbGRaV2NWWFJQQkkreWZSODZ0UUpLQitwcmdpQzYw?=
 =?utf-8?B?ZjBGZWYrQS8ybUJwNkpoc2lmRDk3T3A4Y3IrZ1ZTM0FlRmRUZUZNRFk5cmRL?=
 =?utf-8?B?V1U2c1BTMHd1SXNmdTNHVXhXdlFVZ0VGM0pUYkhnUUd5eHppLzQvQWZGN3RS?=
 =?utf-8?B?bU1VWCtuZXVCYzN2NG13b3A3TERpL1ZPYy9QM3BWWGRDL08zUzQ3QXZwZ2xo?=
 =?utf-8?B?dnBmd1luVUZLV29GT1I4ek52SEN5c0tubkk2Q1BLbjZtUmRWU0thc1lTUFBn?=
 =?utf-8?B?TDdjbUkxNkM3N29za1dnY0dZMHp1bXE3ZFAzUDJZVWNEdmJ0QW5tVmZLbUtw?=
 =?utf-8?B?a254WjBGc1ZIaWlPWnQ1aHcybzNDWnRZOWE3UzlVemV6Q09heW9pN3VZcmVp?=
 =?utf-8?B?SHdpOHRQWmJac1hwUU1YT2dLZlZXdnJJZUdMTWNnbmwxd3dKVkVyQjF1ZUZG?=
 =?utf-8?B?a0F4QkxHRmJlSjlGeGliekZnYTFWNWxYMjFFUk1sN2c0SysvbkRvOUtkcUIx?=
 =?utf-8?B?YjZpRU9DcEY3MWRnajAxU2FBRU9TUWRHMkkvMW43bmZXYlJwRWJBM0lid2FN?=
 =?utf-8?B?UWlxQnJRRHNaK3hYbmtpaG9MOFRtMHozYkRKYVAxdStjbDAwWnVMT0FWOHRG?=
 =?utf-8?B?Zk5yME9EaEhteVdjNktMc09lM1BkZ09NK1ZvOVFIVmNYUUl3aExzMlY1Z1RQ?=
 =?utf-8?B?blBsNVB1T2M3ZWFrK0Iyc3g1Znk5WG05MVpBampieUpzTThTa01mdU0yV0JW?=
 =?utf-8?B?Z0phR1FsZW41VFBBVTlWVUhhbWJ2Mjd2aWZ5QVJkNG8yUlRqZDdPY1B1c1ov?=
 =?utf-8?B?ek45Y3dMRk9hbTR5MW01Q0w5UnpweFBtMEVWaFlFZGM3U3U0a0dhSFlqNjRL?=
 =?utf-8?B?bVVub3kxTFNEYVpMa2xQOTVJRjJuMFZUdjkxb1R3aHhUUFRFN2p5MkYrRkhV?=
 =?utf-8?B?WGtLV0c0TUhtdnBaNm1EYkxHZmZZSHQyMmFoZEtVSHRxWEF5MWJhYkx4N1d6?=
 =?utf-8?B?TEVlOWdPdUY0RVBkdVBsZ1grL3Fwd2hSdnVSNEl5RUlwTlRGSjJnNllrN3pt?=
 =?utf-8?B?M3oydWtYVGxoN0U2SFlydXI1cys1S2cxeEthb2Z5TDVNQzZhejJWTzVXcjlL?=
 =?utf-8?B?UVZscFVJdmZjZXhOdWMrSFlBL2tqMlF1MmZLbEFJcFkzZFhOMExYbGdQNVBh?=
 =?utf-8?B?Q250VHN5TlhmUWJpYTQwbDdkNldNaGJUR3RFS1FSeTRGMzA3YTZWbDNIaVBM?=
 =?utf-8?B?R3VsS2N4ZlJGMUVPUmExSXczN25rWUpuQWFZNFFYVzZ4R1dxcFI3SHpiTGZm?=
 =?utf-8?B?RFdTeGM3aHh0ZEpEOUVpUUdXbTJuVlhySFd6UUhGNDhDYk5aZ2k3MnVKeDVS?=
 =?utf-8?B?Yk55STNpWmpQbW9oWlJsTkczbDRRRnRDMGNITHdqUlc0bW45YVVQZm1hVUFH?=
 =?utf-8?B?Y2x3SG1FUzNJeU54TXdUVWtQK3pvb3NncFF2bzdOY28vWlpTS2l1YmRLWVVv?=
 =?utf-8?B?Tnk0bXBDbGZ4Vi8zQXVRSW93bjl5QXkvYmdJeE04WHpRd3NBVCtiVFRONElL?=
 =?utf-8?B?SXJHZ0prKzlGd2NDZzJScUxENHg5Mkg4cUlGQktESkJQb0E4eTRQNU93L2FE?=
 =?utf-8?B?bkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc0f784-dd69-40d8-18ed-08dd3482b6ac
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 10:03:37.2872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMM5uSx7wZ0EGazTzo9aTZfvc7h27RB/USdJRFkJd0dmaLwMv+JJjaFebY1ipOM8z9QOy/cUwk9+MeSB8B0cW0aMbn9/x2Xbip55fkfm0pY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8573
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Jan 2025 10:03:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6100

Hi Adrian,

On 1/14/25 12:31 AM, Adrian Freihofer via lists.yoctoproject.org wrote:
> From: Adrian Freihofer <adrian.freihofer@gmail.com>
> 
> Covers the chagnes introduced by commit
> https://git.yoctoproject.org/poky/commit/?id=efa5f65c2214239ed7aaf7bd8998683e755c5660
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   .../migration-guides/migration-5.2.rst        | 20 +++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
> index cb70e19da0c..0e0566fa6f3 100644
> --- a/documentation/migration-guides/migration-5.2.rst
> +++ b/documentation/migration-guides/migration-5.2.rst
> @@ -74,6 +74,26 @@ systemd changes
>      As a consequence, the ``systemd`` recipe no longer contains the ``usrmerge``
>      :term:`PACKAGECONFIG` option as it is now implied by default.
>   
> +-  ``systemd.bbclass``: If a systemd ``service`` file had referred to other service

I think we want "``systemd`` service" here instead of "systemd ``service``".

> +   files by starting them as

I am not a native speaker but I would use "via" instead of "as" here. 
Not convinced it's proper though.

> +   `Also <https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html#Also=>`__,
> +   the other service files were automatically added to the :term:`FILES` variable of
> +   the same package. Example:
> +
> +   a.service contains::
> +
> +      [Install]
> +      Also=b.service
> +
> +   If ``a.service`` is packaged in package ``A``, ``b.service`` is automatically
> +   packaged into package ``A`` as well. This happens even if ``b.service`` is
> +   explicitly added to package B using :term:`FILES` and :term:`SYSTEMD_SERVICE`

s/B/``B``/ for consistency.

Cheers,
Quentin

