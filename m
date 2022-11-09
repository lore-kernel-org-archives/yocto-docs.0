Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9520AC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 16:22:45 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.85])
 by mx.groups.io with SMTP id smtpd.web11.511.1668010962597551815
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Nov 2022 08:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=W9OoOFgg;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.85, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTl0210g6ouj3VWcaQFpbdm4FoUmAEi7Xhz3XRwnQRJBsqIGZlCx9bFDDUywGno8AWzBL/GTszTW/MRSa44W7e+uAPF3krhCMkFxc9w3/1YvkWZWL4omUUwwC7kVlPj5NF2/jqvAFKwTuFj/7AOa8aUvc6hsXKlO3lsaEJd/N7ksbGklkxiejUkFPkY/5J77MQ+NoNQeANU9M715DE3Z/vsKJcewqvQTTf7/tl1ZA22Sof3SbyzyImmAy9iRPvzW5XMPvEl/ZmvwdUPs9yTaT77AbBGMnLW3j37o+jLdsE3H1yWc44+ZQYJpI2e5m7eLTq+FusEQ0OHHuwc9PHj03w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IWmg4p9se38yTIQhAVQSbazARY4ba0UQQHLFMSGyEc=;
 b=Y4yCenD0mohUlmS98xFPEsNRWRQPT0AVrG/vAz2qgUsN6pwJN8oncvB7tp9R8nEusVQyN8vj48FCb8BaY8VzUGeKuHCVmKQzBcSmt+dX1cP+f/XSd/yKc6BiWsoFLJ6zVE7dqE1BaFZIj58/E3KNTlGogR2KeCtWwtEsRMOFHNdr/nVSLoq7X8+FM87V8tQe6deVcTrQLcnjxM1RurFqpzBRlEQ/WqDWRJb8y3KLqy0S9S4TTa9NDX/S0kwLZenEvTREzHYriaur7Gk0SvfRZ92FjdpyCOe0scNISe0jUPkap/PGmyeWFaY8v34fXu/9g2iIokvNSPIU+lztI7/Rew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IWmg4p9se38yTIQhAVQSbazARY4ba0UQQHLFMSGyEc=;
 b=W9OoOFgg/x28ulJ9C2lK0L08KJE7YPh5MdrzuWEaKEisWbUfxIz0zsIx4w0YiBjRa9livJilak4hrqrzIipndX2VblPsWF0wJF6Ev8dRsL4wXbvibkUQDAMSJJvwJy8QummzHm+Q3iyi/tPkL0JkaaGvdEXqQgWvYoOhHZiYiDj5RkvnGxP5BM8Wkufzj+MOmvcKo+Ht4HXf+iBSrTtIF06xJX0kNJ6+vvcktxadu/uaEEQL+NVbKySEGOertwgmCpezKAGpREaOnH6c3sLi5DQCMfOJ3Zqk5gvzqkrr+QG2S9oHte+e9xrcVNF4qsfqTRbvUZ2denDDUQYio8Le0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PA4PR04MB9221.eurprd04.prod.outlook.com (2603:10a6:102:2a0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24; Wed, 9 Nov
 2022 16:22:38 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 16:22:38 +0000
Message-ID: <1dc1fe68-08be-7a64-9c04-d6dc241f3049@theobroma-systems.com>
Date: Wed, 9 Nov 2022 17:22:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [docs] [PATCH v2] qemu.rst: slirp port forwarding details
Content-Language: en-US
To: Atanas Bunchev <atanas.bunchev@konsulko.com>, docs@lists.yoctoproject.org
References: <20221109134930.21879-1-atanas.bunchev@konsulko.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221109134930.21879-1-atanas.bunchev@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::6) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PA4PR04MB9221:EE_
X-MS-Office365-Filtering-Correlation-Id: 2703af8b-5c7e-4b80-bcac-08dac26e9e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e2q0FxwDweWPx1j/3pgFxIFFcdCa503p/Mmh5unvh9FnIVCKkMtrYqtkLaJY8Br4QzyCpvUVrf7xFVrZXDYhc3hf9Iynv1z/R/D6FtfCTofprDfeRXuVBdGOM1uDC/NWb846uOtmK5TB+QZrs5S6+AqpRXbiu+suuxV86NyZyDeolhzhc6sGwxHQE79xvve7mXqRPjZwDVaFrvJTFrAXzVKLSxBrss6HOuTlPUyQ12rBT2qGGFwFh4qtEmERR9h1/UDKB2zCNtYS52DhVaUVdTy5TGP1iq5MrdZIuPuERu7dNem7Gb1iy8o7lr9yVG2s+Z3nZIi5iKTiibXXoe8S+qQ18yLbp4gaFU3wSroY4s2h3wl87izBljXuPFiF7LBPwToFv5N27o+K+zlhVa0tQmAJazlkGcuScmWw/3QHAAeAiOt4Q5xUcbyYEWNWgfAifbA1MQU/KPWNjqu8P1+ZXehEBfTT8VGPwtUzBL4lGNGsueMhb92dZtTIaozQTf1CYW5t7qfKkAVnloeABmJjxtj1D8uU8A2N7T06NHxeKv5Soa5d3v+8ZPp/f1GU3D/sCW7iUBvRjRzUiEZ57/E90c6X8YVZiSs/l4LEA9VLRvniESlw8DJatDbHBVK4K7d1232uiiN8sSttyKnY4Ni5GsBvbk0aiDvblkmxF8Q5Rth02LSgJ2klVEWUy6s73ghdgHZI83iV1MuoMMpDvi6WzuNl94w/RhttnHtqISxzOMQMbrZv/SnaesdYPStmA2KSOb3+hcqrBeViaRpA3Drr+U15GlrFJ7OmVRxrVUr8ApM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(346002)(396003)(39850400004)(376002)(451199015)(36756003)(41300700001)(66556008)(66476007)(316002)(83380400001)(8676002)(44832011)(6486002)(478600001)(8936002)(2906002)(5660300002)(6512007)(53546011)(31686004)(186003)(26005)(31696002)(38100700002)(66946007)(2616005)(86362001)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dHBjTTBHUHhkL084R3pEZzQ3YTVCNytnUkNIT1d2TXEvaSsrZ2dUbXZ1eTlu?=
 =?utf-8?B?OEtwcnpmVTVJa0FUZXZWMFBoVEJsVEVhUENSSnYvOXpCN2h3WWZXdTcvVUNW?=
 =?utf-8?B?UHBtQ3JjQTdZUTNka2dQT2hob2hFUStuSHdVZXoxMk0wVWVqSGpYWENkOURB?=
 =?utf-8?B?eVJkLzhUczdOOFl5YUZuSGh0d3pINkptby9WMWh3T3BDRFBid2tPamRETVI0?=
 =?utf-8?B?NUx0RzRVb2R0U3Z5VVgvMHhxMmNWVEhxQitGazRXTC8rZnhyT1EwWno1L0d1?=
 =?utf-8?B?dzhZbGQ0MmZCTzlNOGxRL0VTNXRja1FMNXNJNitUK3Jrb2Z5SDNNM3MwNjdH?=
 =?utf-8?B?cGxxTzFLR1k2TW5tbE1ISlhLZnNyM0U5YklhclVuS1lFMCtoTmZWU0lNSXVB?=
 =?utf-8?B?TGFzaTQ0VjhWQ3kvVmwrZGNJWHcvREx1cFNDcEFYaFVoRWZ2ZEtVakQvZG53?=
 =?utf-8?B?YitrRGV4MWlGZmNVTi9CRWpLdXlZUkl0L2Nya3hlZGRWallSN2k1RFg0OHNC?=
 =?utf-8?B?bnRQR2V1TzNnMEpjd2ZiMzhsbnN4dmZlRWt4S1RTcGJONU5GbGl6UUZhOG12?=
 =?utf-8?B?dHNQUHlsNnpTK2NjK29CakorODhMNEJqd3YzbEEvU2t4bjJObnZ6Y0lWV2Z3?=
 =?utf-8?B?YkIyQTROMGQzc1h3MUh0dzNNZVFmajVYWUxYQktUdGZ2SnVzV1lJNnZESUxC?=
 =?utf-8?B?dXNCK1VKd3dZVUt4blhMQUZKREcveFpGdENOSDUzcythWnFxaG0wQVZ4VGQw?=
 =?utf-8?B?ZWZzLzRqREV3OFduZXZVdFk2bGF2VEdrQUVrMmpaTDVvSG5kUm9BTllVWksx?=
 =?utf-8?B?SHh2dnFBakFkSHlJcUF1N1pOanZRTXNsVENXQ0lQWGRLa3FCbWZ0d2p6TGF2?=
 =?utf-8?B?dnhUQzJBclVmcFNOc0VNeEZNVU9kYlMyc0t6TjhINTBsTit6SmtlUm9YS2Vz?=
 =?utf-8?B?blJ0cUJyamZJWkhzOFRUQnkvRmhGb0VwLzlHa2xDR1I1UWt6V2duMkg5ZmtH?=
 =?utf-8?B?MHllWjdYNzJ5bHM0eWZQL21QR1pnbGhDUEpuTzNvaHE4UURCZUh3V0VRWkpq?=
 =?utf-8?B?eUVTam0rTjZQcytzWTJKejJzS1lkNEtkVFZvZVF2U0JyaHR2TURyU05oeGVh?=
 =?utf-8?B?bHI3cTVkZ3lIZXJrUjNlZEFBR3IwMlVSZlhRRytDYmc3YVdyd0JBcGkxMW0r?=
 =?utf-8?B?WFdVVndGZ3ovaWZ1ZjEzblo2cERUZHBndDE3QU5JSkxyamZJOHl5RlJydThv?=
 =?utf-8?B?TXNHd3JJbVhNdU9NWFByWmowTXpsSkc4TnNWMEFxLy9tTjErS2ZXbVNuZFhq?=
 =?utf-8?B?eWJpOW9GVmcxTXVQbUsrNXI1TENNLzZyK3kwSmE3SkhTak43Z1kwVC9pS0M0?=
 =?utf-8?B?U0VKQWFOUVY4TEs4UVdkQ0FLSE1NMk5DVXNib1V2NWlhNUF0anZOMUIvR09a?=
 =?utf-8?B?RWZBMFdBbGRReGx4aWQrTlRnRm5KbWlGUlJwV2RUOHZBV2JQK3Bvd3VVM1NS?=
 =?utf-8?B?N3NFb1c4Y3EvbEd2aVJnOWw4RXdQU09SWmViMjFuQS9qSmU0bUJSMStWVDZk?=
 =?utf-8?B?d1JZb0tmQnNoakw1SGhsTmJ4bkpvZUNxQkZHeDhCNVNFS3dpaUlZRyt6UUUr?=
 =?utf-8?B?V3cxOEJyK0hGMDlHdjJJL09CbmsvSFVROTAybzR2OUhZcjlDeGdJcHplSzdE?=
 =?utf-8?B?RVRpVDlFTkVrOVBIcGFLTmVDVG8xRG15QTU4ckF6YTJJNTZNblRITldlL0Zl?=
 =?utf-8?B?eFJFNDB2dHlKcFF1NVI0NmxxQkNPOUFDVGVhUjNndnNONzh6NTY1ejFZekY4?=
 =?utf-8?B?V1FrRGdHaGk4VFVmQXNRSjFYeVUzS0E1UC9GSVI2OXQ4UXRtUTZKVE1wODh3?=
 =?utf-8?B?cW9qR1hsdmxpTUoxTHJCaTFpc3AvSk81VmtHRFZ5K3QwemthdHFraFd4S0V6?=
 =?utf-8?B?SGRlMjdBNlkvbXY3dG9SVE9mOWg0cDVKYkdhd1RIWnNLdWpQeTZhaTBMeUdl?=
 =?utf-8?B?anJ4Mm1JbGhpcFM4K0pWNW1TeVpqL3gwZ1g4ZFVmSUVQbEU2dkxSdDY3T0lS?=
 =?utf-8?B?K2Y1aURuTDc0ZVB4c0FwNkI2aGw2c2FrV0M3UnhKZDdUL051U3Y5UFhKY2E3?=
 =?utf-8?B?c0ZSWjRDUmF4V0kwTWdzVWxYUUVUVzA2UXk0dVVzdjJZWCtrZG01Y2VtblBC?=
 =?utf-8?Q?29Dyx/UMu0BbygUz6xdbyN8=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2703af8b-5c7e-4b80-bcac-08dac26e9e71
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 16:22:38.7884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7f+DOLHElXtHY8lHVBq0ZLXyMVklo/mAW/61YeVJf3O8O1/YcSE8pC8WH2DJxxzSbBkizzrLmSVNLqbvu/RL1fdd8iLlyZC61rBFSzDIBPlgJYdH5zkk/lyuyku15D+z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9221
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Nov 2022 16:22:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3483

Hi Atanas,

On 11/9/22 14:49, Atanas Bunchev wrote:
> Explains the default behavior of `runqemu slirp`.
> Explains how to forward ports from the guest to the host machine.
> 
> Signed-off-by: Atanas Bunchev <atanas.bunchev@konsulko.com>
> ---
>   documentation/dev-manual/qemu.rst | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
> index 5a4a82ce6..a17c8cead 100644
> --- a/documentation/dev-manual/qemu.rst
> +++ b/documentation/dev-manual/qemu.rst
> @@ -426,6 +426,27 @@ command line:
>      networking that does not need root access but also is not as easy to
>      use or comprehensive as the default.
>   
> +   Using ``slirp`` by default will forward the guest machine's
> +   22 and 23 ports to host machine's 2222 and 2323, incrementing

Please add "TCP" in front of ports (or somewhere adequate). UDP is not 
forwarded by default.

> +   them if they're already taken by another ``runqemu`` instance.

I'd replace
incrementing them if they're already taken by another runqemu instance
by
or the next free port available.

because it checks if the port is available, it does not matter if it's a 
runqemu instance running or not.

> +   Specific forwarding rules can be configured by
> +   setting ``QB_SLIRP_OPT`` in ``qemuboot.conf``.
> +   Examples::
> +
> +      QB_SLIRP_OPT="-netdev user,id=net0,hostfwd=tcp::8080-:80"
> +
> +      QB_SLIRP_OPT="-netdev user,id=net0,hostfwd=tcp::8080-:80,hostfwd=tcp::2222-:22"
> +
> +   The first example forwards TCP port 80 from the emulated system to
> +   port 8080 on the host system, allowing access to http server running in
> +   QEMU from ``http://<host ip>:8080/``
> +

Missing dot at the end of the sentence.

Also, this is incorrect, because if 8080 is already taken, it'll try to 
find the next free port available similar to what's done for the default 
value. So a bit of rewording will be necessary to include this important 
piece of information.

On a side note, quite interestingly, we only check if the TCP port is 
taken even if a forwarding rule for UDP is added.


> +   The second example does the same, but also forwards port 22 to 2222,
> +   allowing ssh access to the emulated system using
> +   ``ssh -P 2222 <user>@<host ip>``
> +

Same remarks apply for this paragraph.

Cheers,
Quentin

