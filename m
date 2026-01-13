Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E623D2F332
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 15:25:33 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61669.1768317932934175324
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 07:25:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=JknHHqd2;
 spf=pass (domain: cherry.de, ip: 52.101.65.70, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+Gvg0/3lNPY63oEiTqYL1kuEb1rnSVKyvQgnd2XSwJzCnjQ2L7LRIpmGo/5gyI/5UvJuzIU0R/4VWm/b77wZ7nQq23D0EUufzjXlw6Dp/N45MYuhDqGELPgNvjVF7sL1qKI69W4nzYmbQq59Bc76OhyVNQwjJPb8u77jAfoqTwTwrIdQRZYbjriWDQuI82JZNRtRY3ej4opoisJ3SHOhHIZswpYxfWrWeTJc3kEJsdqJ4AbsfDsHGtJ6wklxDY7o2egmU3fCaeUsq5uejvIga7djGBWbnK2JCCKRjWjEAURQGGbrTrqbjJEhbuX5GxuYvQBJHPtR8to37FajAlGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0lha9nBBXIIR2hP4wOFr0xcD980KXUzMCBBGaUtGes=;
 b=LVtDGNBHcOQspxaurgbaXNniAt8Xp3deolUxoOqDH3KUxeGbCmvSVNcJbVxQZz8Ytzqxyfac87ON7I2sAgHjtb9KVIoMTE3EKEJ7W4DvsmL7DlQGkBoWDla8fTyVshl5hEbFiyHWik9v/NpFgVp7djA2FYoAzs1Pj/xDDg/xu3nYQmDzjXWuaxxGsZamEF5xTsg5LRfXxH/T3k6jfCD80ZWO8Z0BM9ZujNNgCGuv8dpBHOiKuNjl6WcaM4yDc3GwbrXbZJ31tInflp0FuIMK5w1Nlzl55HwULSLdsRntGguodRoekg3xGnrGgww3swWsw8j3Rf67RCthMmTgMNrmtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0lha9nBBXIIR2hP4wOFr0xcD980KXUzMCBBGaUtGes=;
 b=JknHHqd2ahhY1sD4eBg3aP8HgLwzm+P96Aa0/vPai9GPe2WSjhrlgub1OU5L8YdI8D4zy2xFl72DmrhTpRrVNAisDMpq3F8hH46S2UXEBW1zRwBgp+H+Txau2WHmtJ4Hw2NjLF1q6kCrHbFp0CKlKs4pUyDQ7y3d/96nWYYbKf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA4PR04MB7695.eurprd04.prod.outlook.com (2603:10a6:102:e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 15:25:30 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 15:25:30 +0000
Message-ID: <bbfda58d-b320-4b0f-8b4e-e9ce2b76e7f6@cherry.de>
Date: Tue, 13 Jan 2026 16:25:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 53/53] what-i-wish-id-known.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-53-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-53-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::19) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA4PR04MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: b57d8d2b-cd5f-429b-57ef-08de52b7fc61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dy9IZXNkb2NCV2lzSUVXMHNPSTR4L2VZR2U0UTNLUVc5ZWszSXdyaGJSOW1v?=
 =?utf-8?B?M3BlVVFheDlKdHdTdXA4c1NTL1NEVE9kM1dmZEc0ZTNlVmhtNUhtSGJ2L0E0?=
 =?utf-8?B?VHZVdmtqcmZjR1VsUi9vRTlvUmhlWThaRnJPN1VreU50QzhQT0JsenJaM0pr?=
 =?utf-8?B?WFpZbGxmOVkxQ2ltb0JFemtlM2JYbmNoOVNGWmVuemI0RjZyakhVVGN0Q09N?=
 =?utf-8?B?elJwWW1DWXdFWGx1bDNHUWc4elJ2SjNSVzFscGtuaGNkYnQzVWhpWGt5V3N0?=
 =?utf-8?B?eVhuZGVkQTBxR1RjVXExbitPRzU4SU5vSWlaUzNJczZDNTRSYzRlUXk0SGJz?=
 =?utf-8?B?QitTY0RTZ3F0aUxHdGlZY0p1Zy9iOCsrR0hUYkRGN1E4NExoNVlPRjdTY01u?=
 =?utf-8?B?VWNYU1ovY3lTZ2E0WS9sOWk1SW0wdXpiYWR2YkJlYVQwMGlGSS9RR3BKbDN5?=
 =?utf-8?B?NURFa2ZFQTVoNCtDNTlPcFc2eS93TzhjOW9BNUphQ3gzRkhjeEJvblA4MW1O?=
 =?utf-8?B?TVY0Z3A2QnNZOEplRzdVREs2dk96Qy93UlJhSEdodUFlNWdCZkFzVkhBRUt5?=
 =?utf-8?B?TEdVbGF5WHprKzl6dXlNZHJoVy85OHFERENYRVBoWk1MS25HZm95OEorSmpM?=
 =?utf-8?B?UzFES1ZFUjdLcDg4WXo1WlhEa0JLS05ISEJWd1VDb05FOHo3SVVsSmE5MEpQ?=
 =?utf-8?B?VTBRZlZSUXZNdndIejBnTi9mZTNlenRiaFlMd2w4bVh6TkZzREsvRW5EdDJX?=
 =?utf-8?B?UEtiZnNlN0grZWQ3MG9qZ2pFUGkzMGViOStaLyszYURQaVlyVzVBN0U1emZB?=
 =?utf-8?B?UmJiSDJrNTBmMEwrRG93RVZmd0t5MzBUUWpUeEZmVDYyemljSzB0ZXc5MVBV?=
 =?utf-8?B?QklhS3E5a1ZnR0ZCckF1R3E3M05ENGJycTZ3MlUxN3BVNmJhZGxSN1lVK2JH?=
 =?utf-8?B?Q3RmbXEwZDlxYmZrVldGdmNvWUdxWXZ6RjlncG1JUUhoVmpNZisxblk4bmEy?=
 =?utf-8?B?UmVXbEhWQ1dVSHBNaVJLMWU5cXlCWTAwaDN5WEhKL3luMGplREUxbVY1OWxD?=
 =?utf-8?B?MFVZK3dENS9aSzNScU5XREd5L0NuZnNHMU5zM3lBVnNObHhCL2lkZzNWQ3Y2?=
 =?utf-8?B?Rmdmby82Q01ETld1QmtRSGZZcm9ydXYzWjJ0bUR6WVptRWIzQ0hiMm5Gb0VB?=
 =?utf-8?B?enZ2M0FJZnpTSEJDTHIwUFdrK3dpRzRaYWxvOXJjU21aY1pSV2dvNHprTXE4?=
 =?utf-8?B?SjZxbXFMNmlwaEQwZGU0R0YyeUx0Qitqcm1kT3d2RjczSlVIZHpySis0Zmxn?=
 =?utf-8?B?YnU0TkJCWUkyWFVVekhLRE0rendzdEhrU1VJZVR4UkNMQjBjTTZ2RlRENE0y?=
 =?utf-8?B?U1RycitlY3R3SDh3TURwaFgyUVJQdTF0enRkZ1FkZS9lZVpVRkdMSy9OU0ln?=
 =?utf-8?B?T3BFeWZmWUhML2RxTFFJREdIU2R3T2YrQzhSNmM2NUMrS3NobFpGMTFPeGl2?=
 =?utf-8?B?YlA4MGh4Q1BhZEEzVzlycGkyQ0hROVlIb0c4U2JBWTZyV2NpQ0RUTXZDeGpX?=
 =?utf-8?B?cisycnRvK2ZmVURwNHV0V2Nja2R4dDJ1ZjBmMCt1bkVaeklYOE5YMWthcith?=
 =?utf-8?B?TzVvKzk5WVFRQW95N09tQ09jUzBrZWZvZUc3eGtHOWRzL1ZqOXhvcW1ieHFI?=
 =?utf-8?B?TmhWZFB4M2xmR0ZkQTNsTWZzSXcyTnhtdHJxZ3o2ZjhUQzRDWkNaaUNKbXQ2?=
 =?utf-8?B?ZEoveGNWb0J3a01vZjZ6MmQzb1hFS3g4RW9WWHJidzNDUThQUFEwM0NKRkNV?=
 =?utf-8?B?WUcrYW5uQzVPdTZ3NWgrRTlMUE9jOFZWQUJsN3RxUDZtVFMrQTZiZThySmVK?=
 =?utf-8?B?MGk1cmZtSUVJVjltQmdwYmxqQ3dFU1htOENEdmE5SlhXMGZhN1hhYWl2bG5p?=
 =?utf-8?Q?+03obidlfWojN2zc8oSE6Y6Dd+uJkYel?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UWJoNmhqZHlJY281M09Ka0JsQ014c1FuYzdqWktDTHBTc3RoTlIwWi9IZFlr?=
 =?utf-8?B?cy9FUXlCSmFkZk1wNEN6SzVibGFJL2xUeHEvUlZZbEV5UGl0T1duRDAvNFA4?=
 =?utf-8?B?bXdTOHZBLy91ZEpGNU9tRWtoZ2xKckZvdUR4RW1tY1haem9IeUp2NmU1dE8y?=
 =?utf-8?B?QVBpMmdjRGRZUUdwTGRFb1ZmNHU4bXptQkRHOThRK3VBN3FOWW9zTHBUWStt?=
 =?utf-8?B?SThyMFFPaGlFSlhycHFEdkh5RVYxZmZ6ZXk4bmNBVzVyZENFakdBNEl5M1Bq?=
 =?utf-8?B?L0prNGlnY0NlNno2UkVQZDU3bFFqOWxycHFhQWp2YTZuQWZlZHREM3JFWHY0?=
 =?utf-8?B?M0RVUjR2WXBHeXF1R0ZGbzZjd0cyQzBuREFzaFhhcVpUZFRTc3plenVVamJw?=
 =?utf-8?B?V1RDV1dhZFhRc3NZbXhkTk5OdTVqRHk0cEpNLytSclh5eGk1Mm0zaXhRazNu?=
 =?utf-8?B?bVBpdFFLeDNjVlNoREQxcEd2WVk3SmxscUxSeVkyYitnNWZUZ0JYckczV1Yx?=
 =?utf-8?B?TlhhOWEvK3BZbUpia0NmWHU5UEJwN2dOL0VES09MTjZWWW1velJwZUJjZHpV?=
 =?utf-8?B?U0R3cnpaUlIzSFQ3Z1dXQ1U3K0tQaHl1Q0wxMkdXV20xZ012ZjM1MFY4SFNK?=
 =?utf-8?B?OGRtSkRRdXR4RjJjVnBOUVdkVUt6TW9nOGhxYU9remNCejFVSjVpSmI0OHZy?=
 =?utf-8?B?K2lsQ0hmTkdVZE5hcHp3bGZ1ZVhpaGRqUkZpK0VGQkdOT01kM3gvdUdqYVlZ?=
 =?utf-8?B?akhuR1RVNEJCNWhGOGgrOW9mc0E2SWtIMHBDQmM5Z1VJN3FjZGNnL2pqMVFH?=
 =?utf-8?B?eVpHUHBHNFNEUTEya2Z1UkdCM3g5d3gvcURxMmhTMU1lbEF2ZjRTYTRuODlC?=
 =?utf-8?B?VktpUnFBZ2lHWWh4ZXczdUEzRWY3bUY4cFNCclJ5NnJidk5OZTl0b0JWeVVP?=
 =?utf-8?B?ZG8xdmVsRWVxbzBZeDAyVk51bUdQNW04akczMlV3aEkyNEhOalowQnJoWHNK?=
 =?utf-8?B?b2cwODNRMGt5d2FmTER5anhnVklvc1ZNazlMTE1heC9RRUlFUENTb1Jlblhm?=
 =?utf-8?B?bU4wWTNzZFBnZURtUStPY2cxK01NVVlJZWNGVm5UUittYWdzSmZSandkRHJW?=
 =?utf-8?B?RGI5NmE4bTJ0T2R4RTA4bEJpeCtnQjVHeDI5TDJhQlJQR2wrSHg5MFNXa3FN?=
 =?utf-8?B?WHdld2JSNi9xN1BMTGlpMmxzRVBWV2tiMXBubHpUYndHZUk1Z1NvWGhkNVor?=
 =?utf-8?B?MC9LQmhRdHBmbUtQd1pHWnB5ZzNheHhBWUJEcHdqN08yTVRjRlpMSlQxNFZX?=
 =?utf-8?B?TE0xQ1JBT3dlU3RERnJYZnFnMXh1TmtBR01ySHpib0tMenp5QS9VbEhOT2xv?=
 =?utf-8?B?L0kzTittQ1lzY2QrREovd1A2akxrVWNvNk1IS0Q2dWJoMEdEZjU4citmUU42?=
 =?utf-8?B?bmsrMmxzRXdONzV2ZHg3ZTYxMERIZUJRcWhzWGlTVzVIaTZ6ZVF5VUVPZUhU?=
 =?utf-8?B?VXI4K2MySHBTS1ZhQ3FITHlZcUNNTG9DRi80eGRlUjRIbzd6eVo5dURQNzdj?=
 =?utf-8?B?UkpBQjZSUFowLyt3WkQwaXUzTzVEd0dVK1lEY0NhL2JKdEIzVkhEenAvSkhZ?=
 =?utf-8?B?QzFleFBPeXplaFBlNXRuSnh1c3RoRWUvaW9ucm02UDVLWVpIa1lsUldBWDJy?=
 =?utf-8?B?WHZjTmNMMjdiQVdsOWVIWXBreUtjTFoyTExuSUpJYVBGUFpFMHVnQzVuOWNN?=
 =?utf-8?B?eis2WFB0Z1BxcWNWYjZ5OWhQcjE5RzZwdzhVa0JWaXlodUpoaFQzU1Y3eWlz?=
 =?utf-8?B?RTFIM3FXWUlJenNEcFc0T2JGd1ZIOWJXRGJmRkthdGJsbitQeHE5YkQwQklv?=
 =?utf-8?B?NVhtNjkvbG1GK0VNUG85dDVGOHVVenhZTWpicmhlaDM5NmVKV0RMOTAzeUJ6?=
 =?utf-8?B?cEFLK002cytMcnBaaXpxOHo1dDk0ek5ENGVUa0tFNXl3VndXN1lTMGkxdXVB?=
 =?utf-8?B?OHh3TzFTd2FzL2ZQUnlFQ3Y2eWV3aC9FTXVsaldKcXlKSG0rRkVIWGNkUXc4?=
 =?utf-8?B?aXBXdzZpNGUzWXZ3TzNVaDFCd1g1QUxkM01DVEZBdThzQVNjRUErWUNaNC9n?=
 =?utf-8?B?Q2YycmsxMW00aU5lOXJMdWFvUE5xL0V0ZkllUWIvQ1VnU1B1aEJVblhJWnFO?=
 =?utf-8?B?aWZwTGw0R0c2dHp1TThRTWpVVFltQ1J5cFhMTEIwL0R4cGtjdGQyMy9KSzRW?=
 =?utf-8?B?Y0dlVWh3cFN2SCtIR3AycGhXczVqdmhnSysvemhDclM1QXhqZ3NkTXNzL1Za?=
 =?utf-8?B?R28rL2s3cmsvRWIxak9rT2IzREdwKzEwNERLZkllbWpRL3pBYUtwdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b57d8d2b-cd5f-429b-57ef-08de52b7fc61
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 15:25:30.0972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWxXbpO0GTpeV2oozKsAuTCpnlVPkgGcM01ECiEkeuG65hsUXPM+24Ic8iFU8eC/ouQ6KO/H6q8/xfSBEasylfo4BcXNpjbRvQqUBeopt7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7695
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 15:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8542

Hi Antonin,

On 12/24/25 5:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/what-i-wish-id-known.rst | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
> index ddee6ad74..a381a6fdf 100644
> --- a/documentation/what-i-wish-id-known.rst
> +++ b/documentation/what-i-wish-id-known.rst
> @@ -60,8 +60,9 @@ contact us with other suggestions.
>      layers, on the other hand, helps keep simplify future customizations and
>      reuse.
>   
> -#. **Never modify the POKY layer. Never. Ever. When you update to the next
> -   release, you'll lose all of your work. ALL OF IT.**
> +#. **Never modify the core layers (:term:`OpenEmbedded-Core (OE-Core)` and
> +   possibly :yocto_git:`meta-yocto </meta-yocto>`. Never. Ever. When you update

Please also mention not modifying Bitbake git repo. For that matter, you 
shouldn't modify any layer you are not the maintainer of :)

Cheers,
Quentin

