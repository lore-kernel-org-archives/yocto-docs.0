Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102CFD0C609
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 13:01:38 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.81])
 by mx.groups.io with SMTP id smtpd.web10.11476.1729861290176569593
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 06:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=PLJVvJvB;
 spf=pass (domain: cherry.de, ip: 40.107.21.81, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjeG8Qu0vyt8mB9BUKOGfhUeD7ZOPvOXEiJf++UMIFFUsL7fmvG58JWLj615ZgUcEUkyV6WG/n1VswpuUX+GraSv4TemrwWy02ceobEhpuiNZxoBFQlAE1nZH1PVucWj8m7QXuAEWt69lIMRDtrKMovZCr20pGzmIAoRmpcip1mYrQVqaFxdyqZXJZ65htu7foYy9ECxchuQWfcg1TxlrjSTagEjHj7b8F1yu/i4YlYIxjHzlwJ/sBaLstqVehcQsI4CXh1LuD6Ww1P+Kea18wJgodVmuMEo6UnfzaZATMhqlicJMy04bF8YKyV2TkTo5UdvgOtnOgdF4KoQ02BJ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tkr0tT95Ewo3O7SBaOepI636FeWbspBugnAXtSAqWCI=;
 b=Lmv6YpXHVxuicdzsJmmn3pg+Y27T+sdTfN0ehmcGjOx6omI9TRN3wSlMe6h0bTQMMjJgO1jBzzKXmhdwXWz/6AF0Z70lxyHdUhE8MTJvUD7n2k0HiiP00A3cc1CA4q5kNGhz1PUKzzybqvp61bKxCU+CnHqa1W17zevoGU0iCuMQrzc+Z5iQaLZb0Elc1JKp8/2z4F1LnR+5L527ftyJjmu0nxhi4inN9QTbvxgEKVxxWVs6A+6JIPvkLaz4GJ6rRsOO1DS5eFJ2BI5mWQ4KS+RcuaHJJtTFgFMZAvKVBlKTTYwDbExMu4THVwu95LNYFYUT2JJhto3iobx+ag794A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tkr0tT95Ewo3O7SBaOepI636FeWbspBugnAXtSAqWCI=;
 b=PLJVvJvBlqgH5DLf5V82yD7lqapBJW+BQ10IorNPY5mmKT0FnXiJ8q8V4GdqUoLN7Jqu6mnVbbzviQhRAPQuUS1eQ3rfee43ADd5TObu57SAs8MR31YRHNfVw5f+YrqZAiXBSnYIdKmLu2qDdiLZo8PMkpeN+xgx4VYucl/jrZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB7817.eurprd04.prod.outlook.com (2603:10a6:10:1ef::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 13:01:25 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8093.021; Fri, 25 Oct 2024
 13:01:25 +0000
Message-ID: <ec1ae067-a4bc-41f4-ad3f-69e770eb6d75@cherry.de>
Date: Fri, 25 Oct 2024 15:01:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: set_versions.py: update current releases
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241025-update-switchers-v1-1-5e540ead879b@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241025-update-switchers-v1-1-5e540ead879b@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB7817:EE_
X-MS-Office365-Filtering-Correlation-Id: 93b87617-2ce1-4986-3f30-08dcf4f521ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YW9iYWVvMzltWXN0cURoQWV3ZXpYRU9sd3ZrNWJ4MmN6ZWl4U20xaUk3KzZX?=
 =?utf-8?B?NGZUdWRyQ3kzcC81TVdLU1BYYUNURWNJVHpiNjAwd2ptcjJ6ZlozTkd3ait5?=
 =?utf-8?B?ZkRKd2ppOWxydlhIMmthQWlNSGJpSFl6dTZIOXE4elZ3aktBempJNDRpL1Vo?=
 =?utf-8?B?Q3BVS0tsZEhYQk9nVEp3VW1uT3MwRVB1cEVRSTZZSnA3dk9GNXE4RWg2TUFG?=
 =?utf-8?B?aHlTc2g1dXZ5dGVmRExhWVVmcnJCTXNpYWMvdUY5SjdKSFNKSlJ5cTdUa0VT?=
 =?utf-8?B?Y05EZmI2ejRtSFltZVRjZlcwM0pYSEkvZFNORS9oWFNYWDYwTlFqckY3OUxT?=
 =?utf-8?B?T3ZQdW5jVVpDL3RadlluelV2SnhnSzVTMUlhU2lodnB4NUlWMWxDY0JUM1Np?=
 =?utf-8?B?NExCaVlHVENWOHY4U3ZIL1h5SGhMYUErSWp0TDlzUG5QRFNMVlVwS2w0VE55?=
 =?utf-8?B?TXV1NXV5QWZrOUVIcm8vTmZjUnZmU01sV3U5REdJc1FHOThNak9QMWcwMEhB?=
 =?utf-8?B?R1diMHZ6OEJFcmVUSVk1RWpwbjB5TFlXbjByQ2JvVGxtZ0NKeW9sY3laTThX?=
 =?utf-8?B?aXkxS3djSlNSdmFGbUNRRHhZd0w4QzJYMlI5eWphY2JlQlRQcFJ5SlRyclhO?=
 =?utf-8?B?MXQ4OUhGcnhUVzQ0T0pwNllPWFRoSGlMdDVtN3lzTEV4S3MzSm5XMXVwdmhS?=
 =?utf-8?B?R24wMkV0cWgyUlRkNndZUzRhVzdFNTZFUitPZFpVUXhtaU9MVm90Y0t6aGpY?=
 =?utf-8?B?b052akpqcklGYzRYWEhaZjFqVnIyVUVQMGVjNU9jTm96eURQWVBxQ2VQWitM?=
 =?utf-8?B?NDUreE1TWG4zZWt2QU01WGpwdDdCTjViWDRRR2RKcXk0UCt4Q2Z2YTNka1k4?=
 =?utf-8?B?R1RFRGo3a0RkNXFxYi82TVNjRlVNTjhqaC9aNWhCMkJGU2s4NjdhNVlHNVdk?=
 =?utf-8?B?Z29Cd3I2MytsWW5NcFQvUDVMditmQUFQTjZnWE8wTi8yM1R4WnRmYjIrbXgr?=
 =?utf-8?B?b3VKQzFCOFJ1dDZJVTlEZmVnenhuY3RMME51cWhXZ0w2ZENCRkpKbmNDUzZt?=
 =?utf-8?B?VHF0VEVrSG5MclRtTUdKcG92Q25nZ3c4VWxCTGt2RW5UUFFYMm5pQWZjNGFl?=
 =?utf-8?B?RnUxbmxGSlR4YTdvQzdXRHVyRWRncjM1L2V6d1BLMVJWTmlSc1BUSzhLbi9Z?=
 =?utf-8?B?WFFoQ0tNOXJLU0hYSGQ0SWJ0RFVHN1owU3FydlNmZ0tvUXMzYStNb3czOGJH?=
 =?utf-8?B?ZFFsRkcrZzBKNFMxckg3UmNma2YvTzlaVHdtOTM3WXVHejNNNnJlU1Vxb0xj?=
 =?utf-8?B?cGJlOFEzOXk3clJhaTlBampSZUZRUXFzR1hUZmpBOGNiT0V4OEttRk9XR2RM?=
 =?utf-8?B?dDUxVFoxYkNXY1BSektRZkxWbDFwMk1BMVUvNDBCZHl5TDZ4RlRrRCtsRmZB?=
 =?utf-8?B?Z3pKbysyVCtpUXl3YmZZMHBqU1kyZzc2aTVDL2FBZHpnZTRpMzJNYXcxSmtz?=
 =?utf-8?B?RWp0YUt3aS9TMWhQZmkyR0RFajhkUXRvVmNVb1VHbUVmQ1Q4V0E2UWRaQ00v?=
 =?utf-8?B?Wkc5NXd4eFJmL0RVdmpMbTQ2Uk05dGlZc3dhTlBJRkt4L0JTb2hlb245aU9U?=
 =?utf-8?B?SlBQZEFmdmtsNmdUdnY3UHBYTTNPMDNrRUpQak1RNUczWFB1L0xJL1A5RzVU?=
 =?utf-8?Q?FTxpHKU/86zGnKG2SwHv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZG45eHMxdnJqVUpPeHBVN1B2bnUxb0ZBZXBUSWRuS3ZXajgvOGFrMzFybG1l?=
 =?utf-8?B?LzI0SHZKQ3pIQmVkbit3a3NyT2VuNlBjZWF4cFQxMjNXbDgwMms5NjU5L3p1?=
 =?utf-8?B?SE1oSDN1MFZYdllBOW54QndsUkRHcUthZjhDUHFtUUY0UjdmKzgybnJiRmFC?=
 =?utf-8?B?VUl3SEgzTXNSMUo0Ym5YbW9hZ2NCL01KTEZRWnlYMHg5NVJ1N3ZidWU1bWJY?=
 =?utf-8?B?WjlNcVl4aEptQmR0UVljZkY3UGZIRmlpYWxVaVM4KzlsMzhvS0JyTWhIeGJR?=
 =?utf-8?B?WlpReDdSNWVobUhNVXpWeFdBQ1N1endJU2ZQMUpqczdUWUt0dlVadTBsdkUr?=
 =?utf-8?B?VGk2Z2JOR1JZMG5wWmk4Q3I4RVgybGROMXA4aWVPRHRmU2lyNHNkb1FsSWFV?=
 =?utf-8?B?WWU0OXNsNlRVc3hYL1hKTXZQUHRUOS8rNkVlbnFQWUp5M1lhSVhLYW5saFN1?=
 =?utf-8?B?d0l6RS9XL2ZlamRLeWxsdXZLSkxIYXVIblkwTXRMdkV6bkdkdHQ0M2VGcHov?=
 =?utf-8?B?eGFvcWYvSjFKUWw1YUViZjFzVndPV2xqRFFNV3dhUXFVNENIVkdoOG4wWTkz?=
 =?utf-8?B?S1ZHVitGUjRHQXFJd25rbllpbC9UWXkzSzlWZFJJTytkdEtHM1VOMWNWVjUz?=
 =?utf-8?B?OVBEcHJjbkgwSnJDOHdsYnp3MWlIT2lCMW9TMG5iOUprUXg4ZzYwTkZ3cmhn?=
 =?utf-8?B?NXdCMFVzb2hyS2ZBU0kzZFBzOW9SOE5XdWpqQlpSTk5LRWdjVG5wTkJNc1VN?=
 =?utf-8?B?dEpQV2M2cDMvcUxNU0g1RnhxRDI3K2ZKZW00cjdJdEhVQTNoc1RDMUJ2dHpi?=
 =?utf-8?B?aEJ5OHBNSFJQbk5xQ2MrK2dlc2srYUIwNkE5SlhYamVOdTJ5bDFYYWpmZEpL?=
 =?utf-8?B?QTVoeVRGUmZMaDVyaDd4M3paNzVZOWM4d1ZIUHVpcm8rUU9XbU5RZXNsMFUz?=
 =?utf-8?B?SHRSQmpWYmVCQU56U2NhankxdW9XemIyNnNUVmx1VzRFY2dyNTFTdytoMHZF?=
 =?utf-8?B?SWpEbG9GbTUvK25SRlBmajY1K3pLeWtGVVlVNVlTVGo0YnhaMndKdWVTZVZ4?=
 =?utf-8?B?UDZZc1h2aHpQYXArV2hzR2xVMThaSldPUVVyVlVGNFZkZE56TkZzbUtSYmZG?=
 =?utf-8?B?NytWbXBhK1VpRHJFVU1CM3BjSVZ1MXZuSml1TEpkQlFqSTlFMVp4dXFzdnJK?=
 =?utf-8?B?VkJuWU5OOE1CekJuK1hmUzl1UkFTTUJnalpkbzJRK2JHbWU0WnZVaE1OUFdB?=
 =?utf-8?B?N0R0TlVDbXhLUTdMdGJjd2NPMS92WC9LTkpPY3lreldrVyt6RC83dTFiZ3hC?=
 =?utf-8?B?a21wRVhYQkZOQmRvdTViZVo4SGFZMlk2THcxeTFFcVVldnhTUlB1THgwQTY2?=
 =?utf-8?B?dWJKcll6MytpZU5oY0lmNHMvbWdNNFdzTGtxZXIwWUV0cENwVy9QOEIycU8z?=
 =?utf-8?B?elBVSi9WMkNFUldkZlNOL0hQcGRlbysxd0pQOFFWVWNCbzJJWk9rU2ViYXRO?=
 =?utf-8?B?WmZtV2JsZVpINkROMnFJb0Ntc2FpcXZuVHp6YzVZdWNUc2xibElrRGdjN2Z6?=
 =?utf-8?B?VjExTTJsRGJpSDc1SlpvM3FBZy95d0RObDFEcmN4aTVybmVCK1M3ZUR4K3cz?=
 =?utf-8?B?NVNIeElzRGFaa0dINHlORFBMU1pRK01FT0hQdEhBSzk2dzJ6YjI3NkVVTHk4?=
 =?utf-8?B?SWFyKzU1Y25KQWwrTDdkVVViMW9ReER3bWNhNlZzOWIyRXVua0JKRUFZV1dI?=
 =?utf-8?B?cGdRY2FQQ1ZURk9sek8vUUpiR1lQZm5oa2REb1NJUDVVNGdaMWJ4QVdRTkZJ?=
 =?utf-8?B?TVkvQkYvUEEyNWhMWUUrdWVlV3cxNFFhU2ZxQlBKaUtuRHBhbFN2Sm1aTnJn?=
 =?utf-8?B?WDFTazI4WEtXZ2RMNW43S1hRbW1nMHVheVRMNURvSXVrQXdtMmo0REpsSmFT?=
 =?utf-8?B?M0ErMWU2K3R6UFEvdE1ZTUZXVmtQdGZOZ0dKbHpESHRKSm16cUhvSUR4c3RH?=
 =?utf-8?B?TG80R2kyTmNXbHZYMEt4eUZIOExHVEJlMEc5Q1dybDAvVmlHYjZKdFM0cW93?=
 =?utf-8?B?YlJPbFdpVnYrQkNMUUF5RVBHS0ZXT2t0aVlRSWkyakdDS0ZZNHI1NUxTVEhY?=
 =?utf-8?B?VE9SeWZENFJncXBDZVFjNCthR3FDS0V3OERwM2tlL01qakZtbzM2R3hzY3Vy?=
 =?utf-8?B?REE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b87617-2ce1-4986-3f30-08dcf4f521ed
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 13:01:25.4841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3V13MpudQXr540r+837DLWvd5T6lrJdJgP6RlmUFVm0GBIXgoNMBpq9qSmnXvjwLxhYvEmE8AFsgPxqaNuZfwQRt9yY5Yszqld+IZ7vX8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7817
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Oct 2024 13:01:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5590

Hi Antonin,

On 10/25/24 2:00 PM, Antonin Godard wrote:
> Remove dunfell, nanbield, add styhead as active release.
> Remove dunfell from ltsseries.
> 
> The switcher menu now contains:
> 

The suspense is killing me!

> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> @Quentin, I'd appreciate your review as I see you modified this file in
> the past. From what I've seen locally, the Styhead release does not show
> up in the switchers. Is that something that is done automagically by
> the autobuilder?

I've barely touched the autobuilder so no clue what it's supposed to do.

But we anyway need to do some manual updates as there's no way we can 
know the release number mapped to a release name. Similarly for the 
mapping between the release number of OE/YP and bitbake.

And finally, how do we know which release is still supported or not and 
which ones are LTSes?

> ---
>   documentation/set_versions.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/set_versions.py b/documentation/set_versions.py
> index dec078083441263cb1350532b2749f5ee222d555..77fcedef7c28165704b79ab8d506a466110b8249 100755
> --- a/documentation/set_versions.py
> +++ b/documentation/set_versions.py
> @@ -26,9 +26,9 @@ ourversion = None
>   if len(sys.argv) == 2:
>       ourversion = sys.argv[1]
>   
> -activereleases = ["scarthgap", "nanbield", "kirkstone", "dunfell"]
> +activereleases = ["styhead", "scarthgap", "kirkstone"]
>   devbranch = "styhead"
> -ltsseries = ["scarthgap", "kirkstone", "dunfell"]
> +ltsseries = ["scarthgap", "kirkstone"]
>   

This looks fine, albeit incomplete maybe?

We should probably also get ready for Walnascar.

https://wiki.yoctoproject.org/wiki/Releases says Walnascar will be 5.2 
with bitbake 2.12.

So I assume we can do the following:

-devbranch = "styhead"
+devbranch = "walnascar"

+release_series["walnascar"] = "5.2"

+    "walnascar" : "2.12",

Similarly to what was done in cfbb2cda2c3d221f944ae610c05039c9d12093bc

I remember not having a lot of fun in this python script. We should 
probably document the code much better and see if there's something we 
could do to improve readability.

I remember we have some bugs open for the docs that shows some version 
number for dev it shouldn't be or something.

Hope this helps.

Cheers,
Quentin

