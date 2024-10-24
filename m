Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74875D0BB7F
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 09:27:16 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.61])
 by mx.groups.io with SMTP id smtpd.web11.10487.1729762028387963355
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Oct 2024 02:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=aEqiBZVH;
 spf=pass (domain: cherry.de, ip: 52.101.70.61, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qWXzA93XPfo6fyzhWYS2V5Ut3l++Qz7lwUtaCt9M2xLZ6zSa/c2i33u125w/eMfG8N3HdS/ONRjlJt2Z6Pvms9dMg+Im2BYnN/WWk62O0UeeZ+B75zfmNVKIYNA4qO+MlTXRtU3n6ypZDkndnyURotHex0VD8Km4iAtGdLqG95JyN2qqMYXU5/CucL1J2ZZPxJhASVRkkKiKYONhLz1g3uro3FmH0bFtDYI+qHGCNh152D7orWQbnVG+8pqCcFexlS3BY2hX3fUM0Y/aAv6Xu8wJWg3lc0SulQ56evVM7NjNV/pzp3lxg8owI1UusoqNVELALCSaXeTn8Kb3A4VLqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fB9QyoB3gynzwMaViR1bgDWQqZLLikyWAn12k71V8g0=;
 b=qph7JoY2+E4x4ObACKUT2KbUm/1kitBCJxwzQ0RymeodX/csORYjYGz6CPEYInWGW6IQfbCLrMs3ClErPpi8QNc3EV5x0hMH1kTT0DTEFa1W2kavUg2Ur4WGftaNLaWOQDNk6qVttPSsYWMNkxd0hrJz/dN2EqsfWcN8aDVCkZE4Y2VxLYuW4VVL4CiORfvwaVXHL7VzglYmoN+PsSkHuw6th62ADixo2ofmr3GJbTF3IwmvI8zhW3yqN1y+FKspBmYGZHvYSxh86osaG5TipVEJJJXezhWAS4hALexDltvBQhb/gMUaG4YSKTDMWHXMh49utpus/Li/tKzfzdf+fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fB9QyoB3gynzwMaViR1bgDWQqZLLikyWAn12k71V8g0=;
 b=aEqiBZVHrrloJC+LNyrj80mFMGKVZgknPwXo3U6OqFUFzZOkBJUswFJgOzHqGE8zSFEFuMFFlbdCJuDU4LnVjSbVnF/kScvy9LUzKabWpsTxwehjIwYtsiklgtsEDGO1AUAfp71L2rzQwacwDLszTI1rpO6RuD5bSIjyB7QLOCk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA1PR04MB10117.eurprd04.prod.outlook.com (2603:10a6:102:454::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 09:27:04 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 09:27:03 +0000
Message-ID: <368af907-7c85-4e27-812b-f608f1d2b8dd@cherry.de>
Date: Thu, 24 Oct 2024 11:27:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: faq: add q&a on class appends
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241024-faq-class-append-v1-1-673c675cc6aa@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241024-faq-class-append-v1-1-673c675cc6aa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0262.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA1PR04MB10117:EE_
X-MS-Office365-Filtering-Correlation-Id: f090890d-8e5a-4763-58a3-08dcf40e04ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TjI0dTRPeklNSmVTaVVkejNvaXhLNGo0OXFsTG9CbHQrVE15RkJXYkVNRUo3?=
 =?utf-8?B?VHo5KzJJUTNLZTdlSXlvcHY1WitmTnVzME4vZzBJbjlnRnFUcDNaUU1RazNH?=
 =?utf-8?B?Ry9nNmk3OEoxZUpFWkdRczZQbUl6SmdDb1RBVUJPTnB4VXUrMzVNNWpNWG9W?=
 =?utf-8?B?LzkxSVY1UEpKUTVIOC96dW5ZdmF3U252dzVzMXNZODQ2azlGZk50cWNwOFJW?=
 =?utf-8?B?d2ZXNCtpWVpCYVljY2Q5SWtYMEl3bStEUm9wL0lHRE1UZEc3dy9lbnEyU1RZ?=
 =?utf-8?B?YThGUU9YcmVrampBd29MTXFJM1BZL0xhYzJTc3NTekd0YlRSVUcvM1RUaThG?=
 =?utf-8?B?Y1JSaWYvcm03TzNZaVVSaEUrTENZV0ZLc1hKT3BFQnd6bGJpRG1WSWY1Wm1Z?=
 =?utf-8?B?Y29jUTRrVW1lVWIySC8vNGZkaXhSSWVMckljVk9DQ2pCbkpxZXJBUlBucnBw?=
 =?utf-8?B?bUFyTjNlNHNTNGtZRTViV001d0I5b1p5eGxlQVZFU01nRTZBcnk1MFE2Z0xs?=
 =?utf-8?B?YzFEVWFnbitFVkVVMjZOOEVuMXZIVDEwZnNCeGxIdXl1NmlqcUlGUUhsUVlT?=
 =?utf-8?B?Q1g5S1Y5VUtpMUJZd1VTTVY2cm9ydkFzOUNZWnZVSlpGNldCSFJJa2dxZmNm?=
 =?utf-8?B?YnAvVWR3c3ljMHZqM0VmQW9waXJDMko3ZmVGUVoyb0huN1RJbkVXS1E5TzZy?=
 =?utf-8?B?WmNSUHBxaG1YVlFuZW5wMEpHcVoyUXlkTm84bHh0blk2czFLdWZaM3dCU2xq?=
 =?utf-8?B?RFpDKzFtRFRCbEdkN1N4OGlHalpia3d2Qk5YZmZUUWZxVzhKSTAzNG5zSWow?=
 =?utf-8?B?SEJRV3NNdGJad1hpTG5RNm92bDA5WXI1SytETDVQc3B1dy9heUNkWENBWG9L?=
 =?utf-8?B?Wlg1cUdSTkZwY0Z0bjlUYUNLUkdFWVdjVHZDM1l3RkwrU3BuNFkyd3JoTWsx?=
 =?utf-8?B?YitqZEdTcjNCUVVJY2NWUjZMdjFBcmNEa0hOTTM1VURkSXIyYnZsdStLVGpV?=
 =?utf-8?B?anNBNytIYkRCUWNIT0JoYjcvMGVhTkJEQWgzakJYUXJHcmtqcW5JUENyY1Ja?=
 =?utf-8?B?Y0k3TGY5UWZmdFNPUXB3WVVub0d1SVg4ZFZGeUhDUFB4WC9YVTF6TmRnZUdp?=
 =?utf-8?B?SGd5SEdsckNFT2lodUxQZ20rY09PaHA3N1JITFErSHZ4STM1QjlzbE54N1Zp?=
 =?utf-8?B?M25NdjFJOVd1VFowa1hXK3d5QlVWaEhsYkhISTBVYU5rcGNScEdRN0Y0TXNE?=
 =?utf-8?B?Zkh0SGUzd2t4NkJXRC84dEVENnpxMThyVGRLakM3YmVEYWFSQm95OEp5QVBo?=
 =?utf-8?B?eXd5eHpNM3JnMHJMVk9icTQwWm9yRGR3VnBESkcvWE01bldqbG1mM2k2QWZj?=
 =?utf-8?B?WkpVdW1EY1lrRjIvZFY5UVprc0tldk5UeEcvMi9QVFhQSGtNVnp0ckxQNllt?=
 =?utf-8?B?dFZPd3NmSXlXc0hsd1RoQ2RWblBmTWxzc3VmZlF0MkZVODhhajRtWVNBVlVC?=
 =?utf-8?B?WGhEK1JZUVp5VldrQTRCNjNVRGpTNVNmbU9wRjF4SHpmVjVPcWx3N2JpUkZM?=
 =?utf-8?B?YUJjaFVzODFZT1g5ZVM5dzhMK1hiOFFWSkxRTTZjcDdtNEVkYUVEbXZoVnBo?=
 =?utf-8?B?ZDM5c0ZHRTNBY0Qxc0ppK1cvYzV1TzBZUzJvN2YyUU5SNkQrN1c4NWh6RFUy?=
 =?utf-8?B?RkdTb1drWUVYZldUU0FWT0FuTDA2S0lYblNLeGZEYlAva3p5bUFnRGh5QjB0?=
 =?utf-8?Q?lBeHEOY67GCWvGQomWGiWl2WdM1ex23sIfD1LWt?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bHd3NEllRDZqdnVYUmJpc2h2VUdQWEdRWk5CUFdmbjlwWGxNQUIzMUJSV2do?=
 =?utf-8?B?OVJuQ2Y0Y3lCQ0wvOWQ4TDJGdDhORDNFdEREOWUxVDhiRVBoSkxCWmhmOC9z?=
 =?utf-8?B?dlNnZVRnVzdrYkNKWTZxZ2dzUVgxNjRJUHl0U1RFOWVacUZTdUk1eE1hNDVv?=
 =?utf-8?B?UkM0cE95R0NQUzVjTnV0anhxckJRQmtHOXBuQlVFWHFIV1dWVWdrMVdXTHda?=
 =?utf-8?B?cUJjS3N3Wk5udE5lZHBBNmZSR1JoZVIyRlVDaUZjRGhVeGlOODBWMzBITXFT?=
 =?utf-8?B?OXd3Z2N2R3UyTkxLSUU5TXo2R294WHIxTEp1ZGdVRzJrVFFja2pMQ1VCRjlK?=
 =?utf-8?B?ZFVXalNhTnZPNVFuMWhoT2VjempYVUxXVzQ2VXdoN2QxdEJ4ZmFYaW1ya1ZL?=
 =?utf-8?B?K1QrV3hiTzFuL2xoeFB6Q3BiT0FuRkdLY2taUzBrWDkxS3lBNkpWQ283RWRG?=
 =?utf-8?B?QUtublZMdG45MVJpd3Y1Z1hPUnZTaEpJbEZkcWYrTkcxUlhuMUNrdzRYZnpH?=
 =?utf-8?B?cHFJMHJoaHBqUTJLN1oyVnd0YkNUQjQvajBZcFlVVFRWTXZLRlB2UmVGUFBr?=
 =?utf-8?B?UTB3dXJ3bW5XSnF3QjV3T2duNmN2b1pOVlB1WjBuRnZiczIweklkR2NtUGZK?=
 =?utf-8?B?bUhKbWdLbFdlT29LZXNMWkE5SHkwY3IxQ1ZhZDNlMHRBMXZJQjFJSlNlTlBk?=
 =?utf-8?B?NFh2QUFwTnh5U2FtWENUZk93OFJtU3lFdGd2WHV4cU5SNXdrblBVekhuMzhO?=
 =?utf-8?B?a3RXVGhRU1kwZVBabEM0anZKWWNpY1dwRjY5V3RnZUJLZU83NWlTZDFua2dy?=
 =?utf-8?B?Sy9DMTdhWm9jTElxS3IzQU9zdTBiZDBiQ250MFJEWkE0TXNCTkd5K1FxZ2hS?=
 =?utf-8?B?QUdNUFZ3NXdnTnUwb1R6Y29maEF5NmJaR0t2QmFyZ0g0R0YxTEFqT1pjaGZo?=
 =?utf-8?B?K2JZOEFoeGF3b1NUcjNPckd6S0Z4Myt3N0dOL2lpZkJFcSt0UUQ4Z2F2bTEy?=
 =?utf-8?B?RkFNWU5NaDljY09uNHUxdS9oekZORmtOK1dUTVAwT2swQnZDR2J0cmNaWG5l?=
 =?utf-8?B?ZGZUOHdKWmhuOWovY29CS2FzdWJhVVdsdk05WVd5a3p5Rm8vRDhxVWl6d25E?=
 =?utf-8?B?aHVRNVRWMHVaa1pEOUphLzVWVGwwMVZ0Z21DQkFJbEFNdktsWDIwQUc4b1dl?=
 =?utf-8?B?RWFrNHJzeFdwakFPUmc4dWtmY3RIajZnRFRyRHE1VjgvQTJqL3BMRFlQSklS?=
 =?utf-8?B?OVVUVFNjMUlBcG5iNUUyZmdVdDNkemtlc0QwcDd2L2pyN0pnL2ZIRllJelFU?=
 =?utf-8?B?bWZybTVsT3lOWUhLbUt4cU5TTk8xcUxWWTJjRmVVek5Nem5VbkxyMlZ0QzlR?=
 =?utf-8?B?UE9iRkZrVnlmZE5xZzBTUEhiLzRlcmhrMlFZY3ZYMzNPbnRxZXNKRFlSN1hY?=
 =?utf-8?B?RHRSVUJrZE52R3F2QmRuVlhNK2pieURiSkpWRE55V0pxZGpqWFJlS3JYa1BH?=
 =?utf-8?B?TTZrMFVINk5OTldTQ0VuUUpoZzFVWUdianA2b2tvSTgvRi9zUmVTRVNlNVlu?=
 =?utf-8?B?Nm1KT3VmUlFEY0I5RXRBMVFXYWVWY2JKZ1lZbStBaURPSlJpell5aDRyeWUv?=
 =?utf-8?B?czVqdWhlTjVOclNTcUE1SHJORU1qeFAyUXNzaWtOQzhDM0t2V0lza05NZjJh?=
 =?utf-8?B?ZGVadnd0S0dXbVk3MmNQOXlZK0dKVWdvaUMzbitNbmprNlBSS2RwMEF3WFll?=
 =?utf-8?B?VE9aT2xHMmxKSjR2RTJYWnoweldERWRJNHpSRkc0cUdJOHZkT0xNRDZEbFU5?=
 =?utf-8?B?UWpYSDZWYkRpZlFWTlIzd1hrS296V2d5eGNBaVlJWXBMem9DZzdtbGZEbzlT?=
 =?utf-8?B?MjVCVW1XTmU2Ujhyd3Vsdm5Gc3VIL2hEUm02cFdCOHYweWprcWdrUHZ4Qlh0?=
 =?utf-8?B?ZHMyb1ZqRXhLZ29STytuSmFtc0d0TEJabFhGa2JROWpqaHNOOVFabUpoYmE4?=
 =?utf-8?B?RXFkOTEwd1l6UHdPblJKZUpaOGxKdlVCRU5leVFpMzdqVWdld2ptSWZZdkxo?=
 =?utf-8?B?cXd5QkQwOWlHeGlTNEVSYnpZdGtiYTBQanZuT24yVnIvaGJGUVlDck9RYU5m?=
 =?utf-8?B?a0pZZGdQUVVpeEFzQUF5VGZORjNsYlJzU0tvNlNkR0hoeUVzSXprWGJxRlky?=
 =?utf-8?B?Tmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f090890d-8e5a-4763-58a3-08dcf40e04ee
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 09:27:03.0461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQGdTZn4t+hgxXaez/oDNpESNNKRJA24dngNOFCvSAamD0zTBVOBKZ1BhQ8tprcV7uY0+a6mR1MUyHVdQs5fqH71238BKAELGlKAymgg2fI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10117
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Oct 2024 09:27:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5579

Hi Antonin,

On 10/24/24 11:14 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Add the suggestion by Richard to the FAQ, with some minor rewordings and
> additional punctuations.
> 
> Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/faq.rst | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
> index bab284bbfdefae02c284204d3c94891a8238239a..3dcb1f862e24716be703f9fd3e811d2fb9ed34a0 100644
> --- a/documentation/ref-manual/faq.rst
> +++ b/documentation/ref-manual/faq.rst
> @@ -259,6 +259,25 @@ Within the :term:`Build Directory`, is the ``tmp`` directory. To remove all the
>   build output yet preserve any source code or downloaded files from
>   previous builds, simply remove the ``tmp`` directory.
>   
> +Why isn't there a way to append bbclass files like bbappend for recipes?
> +------------------------------------------------------------------------
> +
> +The Yocto Project has consciously chosen not to implement such functionality.
> +Class code is designed to be shared and reused, and expose some level of

s/expose/exposes/

except if we meant "class code is designed to expose" rather than "class 
code exposes"

> +configuration to its users. We want to encourage people to share these changes
> +so we can build the best classes.
> +
> +If the ``append`` functionality was available for classes, our evidence and
> +experience suggests that people would create their custom changes in their

s/suggests/suggest/ (evidence+experience)

Otherwise looks good to me :)

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Cheers,
Quentin

