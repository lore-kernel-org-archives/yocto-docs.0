Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F24E6896C
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 09:58:26 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.84])
 by mx.groups.io with SMTP id smtpd.web11.8890.1730368698628718615
 for <docs@lists.yoctoproject.org>;
 Thu, 31 Oct 2024 02:58:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=LWJy+vDa;
 spf=pass (domain: cherry.de, ip: 40.107.104.84, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g70AEehDthEPtAf2+jR4nUUqGFrCbf9pAj6epkkHbIuZT9VLOui43KQGm5Ll2COFk6wYaipU7VfX1UPUnug+Nrb3JDKoKwfIR1IK9SoP8x8OPDC0lKNQvhp3H+y78kqiE/mTl0292a16I/vZsabpVJSdJTvxa1XLBEGIvjY8KfnYyzy+cADnsO3qZ6cwV99P3+GGG5NTNOk4wD55+S8ny/snsPCl2cE7kqZaNjyAem6+NFHUxHEFcSqBKUNpcBbiuyfqc/iPKDwegUplq6s6DJTamG8e6GKYxP0sAKxxnG0E3meZUAH9f2KfxqF0E8UXw2TdIkuF9PYcty+Anh1Ejw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tlH/Bo8kUFNP/44dFlq9/Uu7aUtBVpw/dX8h2h0Bvw=;
 b=Fm/9LnHmgec1gJ5mPgiyafzvEmv0KVs/xU4+QoDPFZw2KUQlWXaqUQDenLQ+AKydOihz3PM5DuXCzU1iw4F00nHMlxmXMSB44wCbW+OMVW+ygbLN8ehqfWF42ZGNYo8GmgnltICYojMm6/a3VKwPElBiSmbMFv/vpbIXyQ604Y+wSRXqTakTvgHfTwFDNZOatDAe6XrJiUq4bKbYZO0qif/y+onaOzY8Y73CWAvgLA0uD4anQfCkR160pyeq8QZ/ZnQgdyAmrMltJo2yEl/FHQPMKZ1Wc5oYWwmJRitfQmlEKLIP6alzie2UF4afAQOIM7WNyopuMSzsbmyFsu2Uog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tlH/Bo8kUFNP/44dFlq9/Uu7aUtBVpw/dX8h2h0Bvw=;
 b=LWJy+vDa9ac86n0lnF46ArfLIYIGQVhNgYUSoKKEAGeqWm+9qAMpyuYVtE460vR6J5Ewu9S5mkvsPGl6z2ISsq+kCzT3i6JA5mR00AZOyePySFGCC8/5xYd+oL0nYpMecXMD33aKN/o1OuhMASXSHpoO0Y70D4Rmce2mnL4j25M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB10145.eurprd04.prod.outlook.com (2603:10a6:800:22c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29; Thu, 31 Oct
 2024 09:58:14 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 09:58:14 +0000
Message-ID: <0ffc20d4-2f24-4a3e-a312-175783523378@cherry.de>
Date: Thu, 31 Oct 2024 10:58:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs][kirkstone 1/1]
 release-notes-4.0,brief-yoctoprojectqs: update BB_HASHSERVE_UPSTREAM for new
 infrastructure
To: steve@sakoman.com, docs@lists.yoctoproject.org
References: <cover.1730307770.git.steve@sakoman.com>
 <91d6f1efc5f4dac64f73c282ed9aeab7f11ba05c.1730307770.git.steve@sakoman.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <91d6f1efc5f4dac64f73c282ed9aeab7f11ba05c.1730307770.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB10145:EE_
X-MS-Office365-Filtering-Correlation-Id: d92ef1e1-43cc-4ad7-1e6a-08dcf9928916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZGEzL0dad0JMKzFaVm1lQTV4ZER6REw1ZE1ScDIzN1haNm4xbmU2NlhkRWFQ?=
 =?utf-8?B?M09sLzZVcW0rYmpETm5OMGYyaUhGQnUrY1VSRWtmRFppeEZqTjJ5ekRyeUpn?=
 =?utf-8?B?SjFYVHA0Vng5bzdNUkNPRlNCcmFrSnhyYWsxU2t2MGJkU0tIQUwveisrdk5x?=
 =?utf-8?B?Mkl6YWpqbm9SNHJyRkpNMFR1N0I4MEJRbGJFSGR6bGZFTThKaTdKZERPWDYv?=
 =?utf-8?B?RlZHLzdqZjlDaEVQTnNOQ3NRbnFpVWJ4NHBqelZYZzJteXBVS0tVdTJVZUxi?=
 =?utf-8?B?YnB2aHpTQlR1ek9tdVFkRS9rdXBJWjJuTzFRWitVdXV2SGRFd0NHY20zQUhu?=
 =?utf-8?B?b20xL1h0ZXF5VjFabGtwRy85U2FJSXh5Qml3OFFMSHB2OHFOUmZRNXowckMw?=
 =?utf-8?B?MndQSFdvL2pvcnJ5MXVHNE9ibjA4WG55czZvU3dCMTlhU09TUnhLNTB1VVZE?=
 =?utf-8?B?V04zR0lxdFI1K3VoUUVTNkFqVDVYblg2aW5WOEVScWx0NVlhS0FIN3FSQmg3?=
 =?utf-8?B?bWZ3MGlTU1hnZVBEVDlDbWQxMHZrUjdLTUxYa09taFBpRjA1NjlhbjdYWFJr?=
 =?utf-8?B?REhUSE1VOWJLUUwvN2YvSzU0Q3lVZ3JxbTZTdGpaeGFnT0llSGlidXRPaHNh?=
 =?utf-8?B?d0I0OTl2eWFUcks4aUlLaDdITVhuSnVrU3RYUkc2eVoxYUhMakdTQ050dDhS?=
 =?utf-8?B?Ry9IY3BhVm9yd00zQ1F5UFVnUXU2UUpPZFZhTnE5MnhTeERvaXJVa1I1MUE2?=
 =?utf-8?B?V2xqVUVmbGxhcHRsMkp6cERnbTJjZnJWQlFaTHlQRFA5RmFxb0toZkZ3TWpn?=
 =?utf-8?B?RzkzVHgvL0kyZHJyZmUwUExGdnZYNy9MbTZMYTVnNGo3OS94ZitvZHByODlJ?=
 =?utf-8?B?ZHQrakoxTWZkR0dsTEZvaWlyajdKWmNpT1pseERyTFBveW00b2h1aUo0UjEv?=
 =?utf-8?B?VnRHVXNGMEV0VEZlK3dpeVY3SFBkQlZJZGZVRW0vR21jYnRLeEtUYmYxb0ZO?=
 =?utf-8?B?OE00MlYxMVhDQVVhZFBZTTRDdDcwOHJxZXRmalpUMUZHWUNWNzdsZy8zV0tT?=
 =?utf-8?B?OGJ6SVdFTkppUVdlTWw0WTZRbHkrM0UvbWFHZi9jUUdINHBHcTVMUWpxd1Bu?=
 =?utf-8?B?N1pwaVVOd25COTJpc21ZYmlqelBKRTcyRnRyVnd2endidkRKb25RMFdHbmR6?=
 =?utf-8?B?UFkvWWZoUXljZDhmdmd0Tk1iK29nOEU5T1BTT1pFS1NDNHZtaEpQeE9PNHI0?=
 =?utf-8?B?MlVxcDE2bnI5UEVNd0IxdTE1amVtaHpra01nYUI3RDY2YjhkaUNydnpYN2lr?=
 =?utf-8?B?d0orRVphQjJKcUdVQXZKaWZRYldqQ2htUWRKV2JnL2dEUWZKdHdOdll0dEdH?=
 =?utf-8?B?UzVNMkhBbjBSTkNEeDByTGFzYkZGc2cyR1dFMUI0MUhFWlN5anFRcWNjcnZT?=
 =?utf-8?B?dGJ2N1ZqTFQ2SHVyUzJERXhMWGIxREhmZFhldCtIM3hBSTVJWVFiS3lpRnFw?=
 =?utf-8?B?RGpHVkZyMUh2Z0Q3SlJoK3BPMWcxbGR0cUJOTXlOY3dwNFhZSGpnUE1aTnF6?=
 =?utf-8?B?UFBqVEI3M3ByMVZsVmZxcVliQXlkbXZJR2JZRzJzdmtrNkZNRDhLSTFka3B4?=
 =?utf-8?B?WGt2dmxCZTJCVGVMRG5uYytqMHdFSExRZ2VFNXNDRVlud1Y5NWNEenJseTg1?=
 =?utf-8?Q?mqAfKg3D7/c7cXGFZlzf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U2ZXNVRHZldRWlFLcXFRamtreS8vQmhuR3JlVDJPTEY2TERsdEpNaldJLzFH?=
 =?utf-8?B?QmE2TVN4RSs4L3ZMeFBXcDczK3FvWFhvTkZJaVZFWWVTK2tEdmF5V2haYitC?=
 =?utf-8?B?YTU5cnJwZkhvQXFmQU51amprNHc3YkhldVlrckZmSHVlenVNUUJ6UGQxQ21m?=
 =?utf-8?B?M3dUTU5EN2ZPdE9UMy92ZE83bTF3Q3JuTzBxMDNGZGp4K3djd0tEWE9wSXVs?=
 =?utf-8?B?NUhLTXdmdEtpbDhZWnpCNTlZVFpZdnJPb3VEa3NjOVNlb3dDdXdYUkE5eEQr?=
 =?utf-8?B?T1pISFVaKzUzOXRKU3puU3hFeXBDQkgyOGsrVk5GcWpqSlJXOE5rMGVXOG5q?=
 =?utf-8?B?cmpVclVwV0c5ZW5DTTUyR2FocE04RXpLRXZvSk5uM0xZR3VUdGlxWkRtMFhN?=
 =?utf-8?B?cVJCNmpxUXRrK3FJUmZxTHFNeDRSY2ZQdUtVYXN5UWJXRVFvdGY1bU9kem9n?=
 =?utf-8?B?TzNab0VmU0dzeHFHQlMzcGdSdkhGRW9JeTRxTFZtNXhUWFBaYUtBb2VWTmdq?=
 =?utf-8?B?UTdXSU52N1BFVVBZMjRkNlk2TDRXMkx1VHZ5R25aV1FUVVFHeDdsbzRtdTl0?=
 =?utf-8?B?dythY2FueVM5RkRpRjgwbVIvWEkxQW4yc1ZqbkNMbzQyaGhTeWlqTnpWS2hn?=
 =?utf-8?B?cHQ0MC94aEtPSkdpWGFrMkRweFZRMXRTelg2cWl4cG5sZ0U3TVF6NEsvWFNK?=
 =?utf-8?B?R3V3ak5rSnN1RXRGdzVOU0d1ZnRmRzRXWnRSN3FHa0p1b1FCZXYrNExucG9E?=
 =?utf-8?B?ZzIzTklDRSt5Tk4ySlJKQS9QUC9HbkliMUQ3R04yZmpoVW5wSWlRTG84WXBs?=
 =?utf-8?B?RUhCTnBCbCtoZzVrdDJBMmZvSTRWSEVLbllPQnJUZTl1cUZpVlNHWkpUa09X?=
 =?utf-8?B?WDVXczRHMlFSdDNvZTNIc1piVUhIb0Y4WjhWL0lTeWhPZ2Y0dUZDNXVZZlFF?=
 =?utf-8?B?V29YbmRqOVJpN0F3MHR0K2F0OU4rMzA5RFcvZlR1VVdDbW1FS2JlYUpESTFh?=
 =?utf-8?B?TXJFS0xuSzBCS0NwYkY3WS9mNUFFcGIvWko1cC8zcFRDSWdVdnB3U1NCczJh?=
 =?utf-8?B?dElSSk5XRTBpNnBObXJkdmpxSGk4S2k2SzJmQzRCMHRwNVh5NTFIM0lkNzdE?=
 =?utf-8?B?OHlvUVA4QXRLdzgwVEtrNUFLWU1Xc1VOUDVaM2IwOG5meDlwNTh1TDhaNFBB?=
 =?utf-8?B?NkRDanhwMVFZTkVYN0ZTNEJ4K1ZWaTFzeTR1VU1vSG9rTUdzVjVyaVpQZlhN?=
 =?utf-8?B?OEtvWHRBV0xKY0FIZERoUmtXOHJ2dFFTc3JYdDJCWnMxSzVtQ3BtWFJKZm1T?=
 =?utf-8?B?bGcwY01qMTJEejdBbHFjWnpYdTJ6N3laN0U3STZsNlNrRmcvZVFENkJUYVBX?=
 =?utf-8?B?UzJ1RzlZQm00RzZHS0hxQUpRMDNsaWNhVlg4SlRvck5lYmxsWnFNaThZQk1t?=
 =?utf-8?B?WnBzWkdDTiswNUluKzF2VHBQdDJaTUsyUkt2bjUrQU5xbEdmM2lwUU0wMGRX?=
 =?utf-8?B?dkVXZkM2RDNCSjVnM2JQbjNSME9zUzNNdkxVdjM5enQ4L1R0SmYzbzdkZ3M2?=
 =?utf-8?B?OEk0REdZdXRxZHM1ZXFtVzBrOU5zUUxodDhuV3lBejZrL1dSZHhHV1FpaWw1?=
 =?utf-8?B?RWVFVFYwZ1ZkWVYxRWNRK1Z0UEJQa0Y0Ym9pQzAwSjlZMk1WMkh3YzYrRklQ?=
 =?utf-8?B?Z2FPVy9JRkovSTN4a0lydytodFNZR2pmNG5keWpaQjFXVUpQUEUrVWdwNkZ0?=
 =?utf-8?B?djhRd1J5M0RBa2w1YUpPNVFhQ2FRNzg4R3RPTmxRc3ZPekcxcCtBUG45Z2pz?=
 =?utf-8?B?bnpIZEpWRDhWMmRQd21FYVY2emhpK1lhSm1VdnFuN2lNMC85dFptRHFld1VL?=
 =?utf-8?B?K2FVVHEzUEpMeW5QdDF1TWhWR251d29BN0VEdldJVEs2cVpOd3VweStuVjUr?=
 =?utf-8?B?Mzg3ZTZNWFMrU3hTMXRXdWR3SHRnVUp3OTYyVzZSdzFMSmZueElLY25aVllp?=
 =?utf-8?B?NWoyUnJONDFFb01nUHJWUE05a2wzdHpSVVVqQUtkSmliZDlkUkRCWExzdGN6?=
 =?utf-8?B?UmdLeTc5azlTYXNZSUg5Q3FrTzJVZUYyREd0T3NMNlNZTmJ5VEtTcWloRFI1?=
 =?utf-8?B?MVd0QVprM3pUSmlEUVU1NUVhUHBVNWt3QXM1cjNBTEVYMjJBOXBSZ2I2SmV6?=
 =?utf-8?B?SUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d92ef1e1-43cc-4ad7-1e6a-08dcf9928916
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 09:58:14.1902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8qRnqOd6pXGVUhW0iopN28ekdTB3EE9C7IqmKRYDbXcjd+uooQIHttNadU8HKEA8ufjiURP8hpOJ/pUjxELmKeEdbCt8U8FuUH3iot/DoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10145
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 09:58:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5626

Hi Steve,

On 10/30/24 6:04 PM, Steve Sakoman via lists.yoctoproject.org wrote:
> Public hashserver is now at hashserv.yoctoproject.org:8686
> 

This should hit master before the other branches.

Please split the commit in two so it can be nicely applied.

> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   documentation/brief-yoctoprojectqs/index.rst         | 2 +-
>   documentation/migration-guides/release-notes-4.0.rst | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
> index db17437aa..df9e7eadf 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -251,7 +251,7 @@ an entire Linux distribution, including the toolchain, from source.
>         To use such mirrors, uncomment the below lines in your ``conf/local.conf``
>         file in the :term:`Build Directory`::
>   
> -         BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"
> +         BB_HASHSERVE_UPSTREAM = "hashserv.yoctoproject.org:8686"

This one will not apply on master, styhead and scarthgap because we now 
use websockets, c.f. 9c7869b95b1784f58f0a31f7c015ad3e15af34e1 (and 
9dfe3d2dcba8bb2d2e277ff2204862dc8b77c8b9). So a backport for kirkstone 
will be necessary.

I see that scarthgap seems to support the websocket hashserv as well, so 
any release earlier than that needs that change? (Kirkstone is the only 
one supported that is released before Scarthgap, but maybe it doesn't 
hurt to patch the other releases /me shrugs).

>            SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
>            BB_HASHSERVE = "auto"
>            BB_SIGNATURE_HANDLER = "OEEquivHash"
> diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
> index 11206072a..005a299c2 100644
> --- a/documentation/migration-guides/release-notes-4.0.rst
> +++ b/documentation/migration-guides/release-notes-4.0.rst
> @@ -22,7 +22,7 @@ New Features / Enhancements in 4.0
>   
>        BB_SIGNATURE_HANDLER = "OEEquivHash"
>        BB_HASHSERVE = "auto"
> -     BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"
> +     BB_HASHSERVE_UPSTREAM = "hashserv.yoctoproject.org:8686"

This still exists in master and so should be fixed in master first.

No clue if the changes actually make sense though, will let other people 
figure that one out :)

Cheers,
Quentin

