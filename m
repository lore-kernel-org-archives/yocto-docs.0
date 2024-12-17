Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6ED5E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 14:43:58 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.72])
 by mx.groups.io with SMTP id smtpd.web11.83357.1734446630122895722
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 06:43:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=edUSa5Bu;
 spf=pass (domain: cherry.de, ip: 40.107.104.72, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YinxrMusFxvHoHq43A7t2BUQaTAHVcWS27GEIcXTV+eLpsFLv2UkEMvrVRouuKgCBH2/kH2HpNbM6tBtZi6sRNUBTC8K/0mQCv3QnWL9WT09aGo5rGQl8K+z0l7ngfBBbZnoQ3xUqi7EFil+525g/dlnXiBZvOdawzm+FIbMcUJlGYz9cm66Q6qAc9wgNTkwe7DQ/Lu+SUR6XSuOBZZ3yFJRaBSci8HpHa87h6eqT4V2G+/1kcRse1UqvUoSm2YEPbII2JdGoJK51lbVworus8NesM2uDlUX5S14eRRw8wQuQb+CXjsDJZMebco+mcUmkvtbvCh1Slr3dyH4TnsYIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDKCTQFXzExMm5K6tyqXoXXUBZAbyETUNzfdgmfDCe4=;
 b=pqXEFL/rOuRj41GrSQtvlYn8+ZeU7ruyzqj2pn/90baheo/1lKDcoo2QwoE/UZGZa/wNAMO/Tm6xul+LSwY6pNgBgSH7ONbGJHqv9w/UYOhbh3gpsrl/tp47lAv9fGPID3gxsihlysP4GBk7IE9WQqYF9Wo9irR3QmSnafwmUn8yBi6zbhGYIquM00r68O0XL4MCYhdPAjj6URbGVTC5/ZseEmpDXvzw1uYmIqVET0tGoJ38Gl/GRL+1UQDDSJrzKt7+JPiBOZf35wWjLONFScK1YN7xUG3fwkqfCjD/9h8IVQrB53oZscKEnOL/qVo+AcmG0NbgzKx1YgKx9UV8BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDKCTQFXzExMm5K6tyqXoXXUBZAbyETUNzfdgmfDCe4=;
 b=edUSa5Bu1LyFSWd9UWPplwOekkWaUwrubLKx0yWS8s2RMSUa0bjfkJ5Im4HKSKkYiJGnUhVhnT6FiD8h1tMK/yCa2vWL3rrUCqKu3AWq2K7rXiJpcJeHWrhva4xC5nSJZIKlluCMlYJ+xlujpS+UuV6bn5BURyGZHvZIVJJBOrY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8882.eurprd04.prod.outlook.com (2603:10a6:20b:42d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 14:43:46 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 14:43:46 +0000
Message-ID: <7be52ac3-ae7b-40ae-9bc2-69aa0b7f5d5e@cherry.de>
Date: Tue, 17 Dec 2024 15:43:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH 13/14] ref-manual/variables: document
 the PREFERRED_RPROVIDER variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
 <20241217-release-note-5-2-updates-v1-13-b189493b1b09@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241217-release-note-5-2-updates-v1-13-b189493b1b09@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8882:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a04e511-904d-43c3-fe6b-08dd1ea93616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eW9JYmVsTGJxSFJHaU9HS2xJaHE3TGorMnpDSGhVdTJsemFCdXFwZzcwelB5?=
 =?utf-8?B?eC9TTVpqREMzZ2hnR2tJWDlBS25TaGJJc3QvOFE0Q0RMWUZCS2RvTWUxNDJq?=
 =?utf-8?B?YTJBREpDL3pSOURVZWpQVWViblNSdFk5WVZFa0VrYkRIYkhleUs5VFRmTVRF?=
 =?utf-8?B?N1dhcnpUaTJsRFIyRVRjaW5BbUc2YWEyL1M3cFdwcFBVQlNJbkZCbXhXN3Q0?=
 =?utf-8?B?NXFmWkxwN2dHdzRiUWlPTWhsRGpZSmdJc3dvd0tFcnR5TG9HN1ArNjRtVWZy?=
 =?utf-8?B?TTZGV1BCVFhSWTF4WlU4aFpDb0ozcmFyN3N1aS9SMzltSllRSG9vSG8rYlgr?=
 =?utf-8?B?MkRqOHkxZjdITTZCeHhjZmYxNENHT2drYW4xOG5zZDNSMFEwaUdKZE9relZN?=
 =?utf-8?B?Zm5BQmY4SU9DQyszdUV6NjhPaUZuWGFLVXJHQitNQUNiZzc2T3BXMFVicXh6?=
 =?utf-8?B?ZVU0UEJvalBtdjFYUDdVM0syVno1MXRuUnFIdEp3TUNnRGNvM09td2lyaUdx?=
 =?utf-8?B?TG9zcC9oenJCL29QWFltVW9JTXI0MUJZQ0drSU56dzVuOHRJSlZ5ckhwM1BR?=
 =?utf-8?B?NlFqTjJnWmJkaXJTMzdGalY3OUh5SGNXa0tRM0VjZjhIanl6cVJTdnByb01h?=
 =?utf-8?B?N1Rrb2JwNnM2RzJiSG5oc00wOVY1aHBQdWswRzNFM1ZKQ3pjcUQ0WFdrSExt?=
 =?utf-8?B?NStab0tJNGF1SHoyM0lrcFM0S0RWZGtQT2xOeHZWUWlhOHd2QkhQbDFuMXB6?=
 =?utf-8?B?SCtxVEpXcm5PR1FpbWlSRmpBbXBXVDMwYU02bkVOUXYrb1JSbE9OQTRXa0Y2?=
 =?utf-8?B?YWFQQ2R4L3kzalFBSnYySDgwUWNUQUZTVzVGWFZETWREdEN0eWx2eHUrL2Q5?=
 =?utf-8?B?aVlXeEtJdEh1TXBPYU1sYnFxaFV3bG42WWtZMW1NTERHRlk1WWNDZlNOTGZn?=
 =?utf-8?B?eEx0RVlYUWNNK0o1Y21vNmRLeW4zM09Ca1VINDJMZ1kxQ2ZZcjR6WEt6b2o0?=
 =?utf-8?B?ZitmQ1VhazZoWEMxcmw4V2xScHRieldMZEZpVGl0QURCUmJoN1FoRnR6T3lV?=
 =?utf-8?B?S0NLKytzSC9SMVZPTmtmclVCUUQ5aDB1L0MwQWRSa2dlMzdQeVVEd2ZjVFNv?=
 =?utf-8?B?MEVFNnRLb2lqdzhnMEVRWWYwMkJMREROb1hwSmpmaEZyRHJQYy8rR3p5WHVw?=
 =?utf-8?B?SWdrV1dJVFNDNzNCVXUvWXM4RER3ZXExWGtWc3c5TkNwYWgzVmFjaGdMc011?=
 =?utf-8?B?YmVyZHE3OXN4eEhKVHlIcjhJY1hSVVJjTE12bFcxLzBEa3RXOE5iSHFJMk1r?=
 =?utf-8?B?MWg2TFJSZVI1eXRWSkxZdm1VTjZRL1lMNG40NHptSGpqVUxCeXNhckk4bUZU?=
 =?utf-8?B?djU4RVhYQlVJeW5nQklub21OYnpDMGo1OGg3UnhKRkZOZUxHdVZYUnFzdDJh?=
 =?utf-8?B?UlVFVDlSR3hTdXFSZndpckEzWHBWREdqTWdiaWMvNmtsRytCUjJQSjNCT3V3?=
 =?utf-8?B?Z3Q0QTRvRFUvREFZSTlEbmhJNm83bk93aUEyUys4MUNBMmRaUmZSMmd1aW5i?=
 =?utf-8?B?VmJuREg0Rmp6VithbWNYOHlFcU1JclpIVkdabEdDY01XZVpWbThDSVluRzNR?=
 =?utf-8?B?ajBaVWlVZGZITUhkVktwcFVhTk1pVkI5SjdRNGpuT2hWbTFtWDFLRE1GbU43?=
 =?utf-8?B?aVR6NDJyK3dpUDZHbFZDSmJvNzE4aVQzVDd6WWtGbnFrUmtyc3BrOEgyWHJG?=
 =?utf-8?B?YUd5cU1mUm9QMWVZK1I3ZDM1S21TM1d3aEVFK1VySXYrSEg0V2lwL2pCZ3hx?=
 =?utf-8?B?WHBvZUdmaEFmMjBKU2VtaGdRZVdWTmpIQXhnTkViSG0xUUJKWFM5TWFmODFm?=
 =?utf-8?Q?hkLz79wly7xBM?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OWNHanVuV1NZTU5vanplRkIwYkZMS1BVYTI5VnYvdDhlMEFvR0MxbVFmbHpo?=
 =?utf-8?B?RFVzRWpXem5qZ2NaVHcyTjFScHdkR1NRSUxMWUxIYVZsNU15SjNLUFZzTWtE?=
 =?utf-8?B?Y1FZZHJEanJVY3J0bitkcXpNTzdRSFlOVWdyd056QmVZMk1UWjVpUkMvTVVW?=
 =?utf-8?B?Ri9hZFM1bElSWFZEamRJalFuVVlMZndUckJZaC9SNkkwZGt2SkV3OHNXM3Na?=
 =?utf-8?B?N2lXZmFjSWk4MUV5VUUvanEvZVVNekJLMlpGMWFzYXVuSVh6bk1LTEVoWEVj?=
 =?utf-8?B?d2xDL1l3Tkpha2VlUUNzREJQeUFzdFFiM1BFRWR2K25ZOUdOaENBTVRBdUl5?=
 =?utf-8?B?VDQ3aEhDZHI1RGtnckx3UEpGSTNJRmdBREJFQVhDbzkwU2FEYjdHWGIxWWtD?=
 =?utf-8?B?ejhIOTFGRDBPcStOWTJ5aDNmN3FQeWNldERRRWs1WEdXYXJQZElVbHhMYTNt?=
 =?utf-8?B?WXNmOGNXR2dKRWo0UHJheEIzcU41blZzRy9WRVRNQ0plOUEyd3dYK3E4SmU0?=
 =?utf-8?B?QXNIakI5WHBQSUhnNk94eVl2eGhVN0NaSzFPQ1Q5L2NEc1NHQTNOY2k4V1VJ?=
 =?utf-8?B?cGJEdGIyckdkS1lVdHZSN1BoV25IeVRGd284L1oySXJySmVsWGozQTN2ZnN2?=
 =?utf-8?B?VE01YlNoNlc5VUNya21xblJ3OWIvZ0VYM3gvRmVzMHp6bHAyVnFEZ3IrNnJt?=
 =?utf-8?B?YW85RkFYbk8vZ1BNbXRERWVuZkRJTGNBejZoWDhRSXFFRExhU3A0b0dnL3RW?=
 =?utf-8?B?dUhtaW9QdHYwWlFYZkdIZDQxc05kTHRmaXJkMDFMWnZDV29CZmdLOXRHU2tx?=
 =?utf-8?B?VjJGZmhBRjN1czZoTXhIY0VKSFJsVGVma0tMOVV4OFVwSTFqeE5ZMXcvMjZD?=
 =?utf-8?B?dUkvZUNHOW04dzlvMEJPajRuR05lZ0dXQ3lNRElZQXNiS3BmbTd2VTB4VmlS?=
 =?utf-8?B?WHFKM0NiSytRMFpQQlBBdHcxT0t6YlJpb25oTGZOSWpVeUZhVnNnTnhEb0FU?=
 =?utf-8?B?czRJMlVwQTI5L0hlUFEzYWdhaytWSFFHdTJtV29oZkVHMGpkWkNpVXNQU1d0?=
 =?utf-8?B?MDZUTVpiK0J0Tkpyb1crVTUzTEFLd2xGSHIyNlcwZ2FpOGNvTXhSbndlb1ZM?=
 =?utf-8?B?Q2NTUzM4NjBoWnMzc2E1SnpJK3BHeUZlUG91YVkraDhqSERVdmphSDg0ZHZy?=
 =?utf-8?B?eEV3SXc1N0dOWWRuclEwUTRtdW9aT2pKZVpOWmxqaXYveUZQZkhnUnJ5N0o4?=
 =?utf-8?B?TGpSNm15eWxHYjdyQkJlcWRrc2xCNGFqbDFNZm9KVFRHZmZoS2Z5K0JUOElw?=
 =?utf-8?B?L1JXdTlvVFNORjMzWE95U1RwOHduNFhUQkpvMjBCUXJTUjNuU0krL1VEZU4y?=
 =?utf-8?B?dk9EbytPb0lSczJQZTJCQzNESis1YUZvQ1RWZm9Jdm5kMmZqRVlYV2UveTJo?=
 =?utf-8?B?T2wvYXNyUjlqRWRQVTl1QzZMUkx5TmxJVnVZSWZLd0FDVnB0OGw0YmsrNHBK?=
 =?utf-8?B?b3U1cURITG5rRGNmRkoyZ0VEWjFIbW1zVUN0bHNWV3AreWFXaHMyMTE2Rytz?=
 =?utf-8?B?bC9oL1Z0ZDcvL2R5dDkwWjVLVUN3dlBNTEtLVEpIQjN5c01MOXpYdnA1T0I1?=
 =?utf-8?B?UThIZGdZV2hjWjlZTlpiaGUzWm9BRTFadFJTY0FveXgwQzRoN0FFVDlySzQ1?=
 =?utf-8?B?QXBuNmd0NDJYYkovWDByUE1nMXdNYzR1TnZvVEd2WjlDVzhWcEQ2Z2NpSkFi?=
 =?utf-8?B?S2ZjRmp6cDFidDBXMC9NTnlRS1JTOHBqMFBxUUtteUZpUXQxendzSG5LWDJP?=
 =?utf-8?B?OTZJMVd5SnY1ZDl0Uit5NWdiUGVRaUN3VXJjZkE0bFlUc1VsM1JYYXAwMFJp?=
 =?utf-8?B?MFVTTTJ4bVVpcWMxdmpKVitCblcwMHBhNGErSmtRbk9acUY5K0FiVzhMYk9D?=
 =?utf-8?B?dS9jOXhHNm1xSFJXUDBlbWRESDd0MEdCekp2U3FYMzZ0TDhuSzhZbjIrckdi?=
 =?utf-8?B?dUh0S0JNVkVHTkhyeE9SOFBQcEwzSXIyM0pPb3lhcVQ1bjRtSi9PT3RzbitK?=
 =?utf-8?B?di96eVJ0WEttOWpwSElaV3lzeVZTdHpON045ZTBsQUFZT3pFQVVGeHAyblkr?=
 =?utf-8?B?dTdxSlpENjZsMXhWcEJmUUNMZUdDa2VDSDhKUXcxT0VSWEYzZzhybzFEcDhG?=
 =?utf-8?B?K1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a04e511-904d-43c3-fe6b-08dd1ea93616
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 14:43:46.3282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V08DG8zhu2j0wTPsxrCzOtS5bgNv7LS1hB6FRe+8JTMv6AZLCmMRRkjffZOo0QAoF/P1PezQBfpO6dw7+CBtUCodD/BX+EuwlCUAGl28Z5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8882
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 14:43:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5969

Hi Antonin,

On 12/17/24 10:27 AM, Antonin Godard via lists.yoctoproject.org wrote:
> This variable is similar to the PREFERRED_PROVIDER variable but it
> denotes a runtime provider specifically.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 50cd8948b35f381414837acc9b9e925dc5110779..e0b87c0e5ff8cf7bd2598cbbb184f9aada19d326 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6711,6 +6711,25 @@ system and gives an overview of their function and contents.
>      :term:`PREFERRED_PROVIDERS`
>         See :term:`bitbake:PREFERRED_PROVIDERS` in the BitBake manual.
>   
> +   :term:`PREFERRED_RPROVIDER`
> +      The :term:`PREFERRED_RPROVIDER` variable works like the
> +      :term:`PREFERRED_PROVIDER` variable, but it denotes recipes that provide a
> +      *runtime* component. Runtime providers are declared by recipes that set
> +      the :term:`RPROVIDES` variable. For example::
> +
> +        PREFERRED_RPROVIDER_virtual-x-terminal-emulator = "rxvt-unicode"

Missing a whitespace for the alignment I believe (I believe we're 
three-whitespace aligned usually?). Ditto for the other code blocks below.

> +
> +      This statement sets the runtime provider for the X terminal emulator to
> +      ``rxvt-unicode``. The ``rxvt-unicode`` recipe is a runtime provider of
> +      this component because it contains the following :term:`RPROVIDES`
> +      definition::
> +
> +        RPROVIDES:${PN} = "virtual-x-terminal-emulator"
> +

We have to be very careful with the word recipe here. Above, it's the 
``rxvt-unicode`` package that is a runtime provider of 
virtual-x-terminal-emulator, because of the :${PN} override.

I assume PREFERRED_RPROVIDER_virtual-x-terminal-emulator should also 
contain the name of the package and not the recipe? That I am not 
entirely sure of though, haven't looked into the implementation of it.

Cheers,
Quentin

