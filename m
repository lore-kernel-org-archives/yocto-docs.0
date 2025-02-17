Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B4EC021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 18:03:54 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.38])
 by mx.groups.io with SMTP id smtpd.web10.98.1739815425036068292
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 10:03:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=MO4EEuZQ;
 spf=pass (domain: cherry.de, ip: 52.101.67.38, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S07pbPcwc2nugB2CWvf7PxxsVWkVwZCxNg4JOWKxqeRArZlMpxa2zDmnvcrjByicO4IF3AhHNNG42XzA1F0B8/VcJWG3vLFecbiKuHEGQWKfySov6hA28J4zSr0VIj5l010sQ1AbsT0ix1i45LTPtL28dX+mEJw9e1Bmh2ZPBTGZ8tImILjVuCV7vBoN3jnZZ+WWsLP266WMmA18+SAiASh8aJaO818ilZmSfTQ1QAzoMh/noBcd2Rop15ASaL9qObs9mWnKQjNIfYgcuK7AJ0LUnNJ5xJI+Dv4PqP6nrJ3ElyF4ivpqPTmNMKbE/ai7spZ+kv1F9dse+SIpdpGyqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Vd7BxmU/XzL7w3mJ2LyZEL//+zwE1mljAbTv1IRBxU=;
 b=STui28SFKe/eeQZ691/XBmSOKLZGmS/QEHEAcZZUfOaFK5nYwobDoirjnaAiIAsrAN82upf5Od3CQApUl+NN+oLdDlWaALwvQT4+NwsQkMENjGVe+KG3hIvbLkk93BbbtUoCBGlYeLzOzbzH7EVrqu9q2jZ3YocAituOTFzr/WBZ3B5bN5uimdWzYqYoxqIEJ58fYwhHYie0KfPBlNdkHZTMDZXuZrJR1yoxhuMm/d5sr5A0YJelhZedoDOIQWLScbn7uD3/QCaiZw9SLXKd2f3pmQCojHihZZIdsHD7XsQbQTbAlLrFAmmQoZwTTsNols9rTMTUzFs1P+rM7n6uLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Vd7BxmU/XzL7w3mJ2LyZEL//+zwE1mljAbTv1IRBxU=;
 b=MO4EEuZQH6JdS8jP4v86RSq2Rq6NTxZF+JVxRwDeVJQitsJOF2DjZDOnQp5XP1r39UqScVmpL74n4DtOcq7yXiSVMFrcWkhM9Ba902DFfMh/jpzgCLuvG/g9FPfDiCW0eQQyCKoKL6m+xyv8edw8QJ0lJ42ytjyzc4pmcbEDd+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8293.eurprd04.prod.outlook.com (2603:10a6:20b:3fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 18:03:42 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Mon, 17 Feb 2025
 18:03:42 +0000
Message-ID: <95ab1687-6ca6-46d3-8c63-57ad79a0d6d6@cherry.de>
Date: Mon, 17 Feb 2025 19:03:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] contributor-guide/submit-changes: add policy on AI
 generated code
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: tsc <tsc@lists.openembedded.org>, Yocto TSC <tsc@lists.yoctoproject.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250212-ai-policy-v1-1-c9cc7510e317@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250212-ai-policy-v1-1-c9cc7510e317@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: b2a98db0-3097-4079-032f-08dd4f7d6972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bU5jbERrSlZ6RC9VZCtmT2ZQdTc0RXNqZnBZbWh6aFp0cFRkWXhua3FXaTQ1?=
 =?utf-8?B?dUtZTHZCZjA4YWRudTRsZzAyRm5rblFFSkZWMVBHQTZTTlNQemhyWk40dzNU?=
 =?utf-8?B?bGZCZ1dHMlJjaW9tZldtRkZqOFIwVi92dHhWQXFwektoWVdXTGdGOVY0WU5H?=
 =?utf-8?B?YTl0dy8wYWRLMVhCazFUeU1pN25nUXNQSjA0R0g5d1N2TFBwd005cUIvWDZT?=
 =?utf-8?B?eGVhTFZvQ2Y1OGJoYzVMQm8vcjR6YnM4S1ZZbGdKbHNPVGIvNm13UVdSc05q?=
 =?utf-8?B?V0dvRXVUdjdmanYzbVBRSGUxZzdRc3JWTmV1dTl3Y1FLTnp1NlRwT0kxV3M0?=
 =?utf-8?B?RjRiNjdNaFpidFoyMVlqZ0xnTGt1OS9lS0lkYVlBS2M0SExrK05jUDFZN2JF?=
 =?utf-8?B?VEpMbFhSTmJiQnh3RGxCbkJSM2pML0huaSt2NVd6T21TUksyaXpPRmRDS1NC?=
 =?utf-8?B?QzJsOG5aVUZOTmM3VHFKYzBSQTdyWGRZRXhwU2pNNzdaT29EamlRVGp2RzY5?=
 =?utf-8?B?TU9UeTdsTUNjRExXOSs0bFRwQy8zY0t0S2xEcHZaZ0tkUGpuOG03TkRUV2VY?=
 =?utf-8?B?Sm0vSTltakN4SGZ6OE1tRUpHTkV5V3RyV1JIWVRoQ3g1ZEU2cHRWSDBYYldJ?=
 =?utf-8?B?QzBtZnJFakRPcHppYmQxTlJrMDlwRnUzN1pQYjhoQU5OUnVKZGcyWlNlM1lp?=
 =?utf-8?B?NW1UREF2eTEvZTJNODZPKzZmR3poa1JNUFV6WlROek1iZUVFMDlsS1d3UGZa?=
 =?utf-8?B?S2ZDVkJRdlcwQW1pMDJYQXZ1ek1HK0JRNEphcWkyMVpIWGFsQ29XNEVNc2Iv?=
 =?utf-8?B?L3Uva2Rwa00wbVViUk9HSnpBdXB1L0ZEZEVXNjdWcHB4M2wyWk5iMGJFRDUw?=
 =?utf-8?B?QVl2VmRkbnFLWXpucFpZaVRIK1J3RlhBQjFSbGRJYzhFMHUrTzBRMG5FTkkx?=
 =?utf-8?B?Vnc5SmlFYThVNEE2U2VRbHNnTW4zRy9oNWFzaGY5OFhLSTViSFpHOWZzL2x6?=
 =?utf-8?B?bXQvY3hNWnpLYW55RGxaSU9UbGl2Y21wY1JiMFNYSVJJcC9LZWhZMUtGYTln?=
 =?utf-8?B?eUx1MFJuWlcvbHVMUjFBeDREUU5EVW0xdVBEd2FRVU9kSVJnWnBPSVp2eEow?=
 =?utf-8?B?MU5hWEdrbW45V3dzWGI2OUU1THV5SlBKTG9pMWx4dEZ3YkptSW5WQmkyT0xo?=
 =?utf-8?B?TUt0blBjRjJCOGZONWtZL0NnMDh5VmxXRVl2RUlEZEZ5T3FKcWhzcmJRWWpV?=
 =?utf-8?B?aXBzUm9lR0lqMkFpVDI2ekR3V0xsNi9sbmg3UjUwWVZBei83SWdBajBaMUJy?=
 =?utf-8?B?dE9QbWJKTlBtUzJSM3VNN20wdWRieVQ3cllOaG9GU29XdE56SW9GK0YzSnNU?=
 =?utf-8?B?QTV2a1lPaXA3N1hhT0ovOEs2Yk5iRkxXN0EvMDk5SzZMSXFGM2ZRY0JBWkxM?=
 =?utf-8?B?aUxIZTFGY3J6VDRLMjdvdVd3akhXOGNCanZQcjJDTWE4QVhnMWtUazgzZHYx?=
 =?utf-8?B?ZUFxZ2cyUjRhSlNMd0NYdGRab3VrNTFabWs5V1JzeHVHRUlLMHc2aEo1cUxO?=
 =?utf-8?B?Ym8yWVlidDkxUEtwYzIrY1NVVXNaYUZLN2VEKzFQSEtXaE85RGh1Lzl5SmIv?=
 =?utf-8?B?Y01CU2dlaGZQTHN2Z29VM0VOcko3L2p4aDB1WjZxbU1zTWp0MEsrakJScjJJ?=
 =?utf-8?B?VkpuTTJhZHc2aytmS3I2MWdTTnFHZVlZbXlxN05OaldmVkx0NmhmSDVTWTJR?=
 =?utf-8?B?NVloWUhPZmsrL2hDODZaeUwrK0ozUE1ZWk9pMlhBSTRPL2JkR1I5TVVKak03?=
 =?utf-8?B?OVpMNjZPdWx4T1BrNmhDZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RlUyS0JaZkdpVGpSS3Q2RVdZZVFyaEU5c1EySFU4ZHJKN202azNNMm1zaVZJ?=
 =?utf-8?B?bEhkMVZnaEl1NEZZYi85NWorc1FFVWR2ZzNEMWM1YVVhVkRWaVh6MGJ6cWlt?=
 =?utf-8?B?ZzZ2SUJ3UENEcExBTnVuZkhOTGFHTWJ2U1BrY0FKSjFxUU1YQ0FIYmVkOWpI?=
 =?utf-8?B?VGY1U3FPOGRZeFNPelJDM0pCWms3TTlwOG5hZUFUbDNucWF5QmtpdDVXbVpL?=
 =?utf-8?B?cEhRRS9oU25TT2tvYmpzVUNYS1h6MlVTTUtMdmpVdHJZb2dLcHFkSFBwaGhp?=
 =?utf-8?B?SkpDZmJ6RElpR0FvcGZvbjVLZG5VL1pzSjZRK3UvbUNOSHVTbnNyOEFWQnFE?=
 =?utf-8?B?WXA3NXh6R1BCRG1HSmRETUJ3QjVEWFlBWkg0TjFsS3FEKzZpSExreWUxdmtw?=
 =?utf-8?B?TVhsWkhFU2RZTnA5V2NIUS9INUEwVlM3UzZFSEhYSVRIQ2JnN3J6SE5ZTDEz?=
 =?utf-8?B?em5Id0doTUNhSlF5cGwrdisyODh2VDVBZVdSQ001ektUaS9EUE13L1h0SFJa?=
 =?utf-8?B?UmVTVEZSRkQ1Z2dxS3UySDZUckMrRjhHMlQ2Vk9vU3JBTnVQWjlsVk11L3BH?=
 =?utf-8?B?ZnZjT2ZFcnFJS3VxMk14NEdYbmxPQTVkcUJtNUJRSWgzZnN0cWNKYUM3SjN5?=
 =?utf-8?B?d2trc1ZKU3ZYcWRiZlZMQTVYUkVRQXR5YVhCR3ozWmVoclRUWFhwdzhsRHdo?=
 =?utf-8?B?M01WVXc5ZnR4NjBRTk95bWJIVVZld0pTb1JaSnNKZUc4Wk9TTC9zY2ZtUGFh?=
 =?utf-8?B?QXBtY3hLdHFGd3NtbkhoT05JbWhuU0hCa0VHcjBIeGdwTWQvTkd4MFNTbEtq?=
 =?utf-8?B?b2gzMEc0c2xlcElJMzh4SVoxVW1CWFJWQk9IOFNpVmxPOVZjdWo1M2xRbTNJ?=
 =?utf-8?B?UTNtbERoZkQ0eXhZb3EwRnUzeWpXbE53VGtoTkNOSUM3Y2ZWTEJSdEkwUzVR?=
 =?utf-8?B?b1dGejlYNVJ1akJTU2ROM0hyK0N2TGpiWmk4eis1d3lhYno0QXRWbXY0dzUv?=
 =?utf-8?B?Qk1pQWpIZTB5TWpXRFJramRvTzUyVHk3NXRRbEI0RmphdTN0cUxpbDdYekNP?=
 =?utf-8?B?TFM3LzI2aVNqOE5QMG4wSjQvOGlvY2hDeGNIc0swT0F4V244OENHbktSTXUv?=
 =?utf-8?B?bDI5WHA2bjZTdDlOOFUvRDhhczdpNCtYbmFvQ0lQQkdwVThuZFFWN3Y4ai9i?=
 =?utf-8?B?NHZnaWxYTWwvdEVXa2VnL0pKMDNEcW43cmtiaEFtaWRpZUlLRmdQZ3NLL2c0?=
 =?utf-8?B?THpveHdYV3lTN21lVE5DYkZVaG5jL2ppMktLTXB1T3ROTHNaVDR3cGJPazdn?=
 =?utf-8?B?b01mT1hWdWFmN2V5R0llVE0xdzVKN2hRMUpnYUR6VFEwdnJhaDMxZ00wbDN2?=
 =?utf-8?B?d0hhSXpiUkxOS052V0J6US9DazVxNDBPS1B5ZzZVUVpCc3dnT2kwZ2RzNzlV?=
 =?utf-8?B?UTNrUTdZZURnaFNkTXVuSWJyQjdNSG1UbDRseVRvV2p2ODZCQm80Z3dTMXNy?=
 =?utf-8?B?MUx2ejd1elRjZ1IwL21pM2c5YUFvbjZpcWxWTGJYZ3lpYnRKRnlUMHpMQ2Nl?=
 =?utf-8?B?YWdGL1JxUDBFS1Z1clhMcksvN3dLN3VCa1BnWFlWOU02SHJJM25HMCttNkNr?=
 =?utf-8?B?MUNaMGRYR016OHdncUJrb2tqYXN2dnl3WnRpZnVzY0FINzdjK2dVL0ZkQkQx?=
 =?utf-8?B?d2dRN2M3a0hiV2NJZWRBL0I4QkJGdWE5U0ZLSnVUQVBqQVJvZXQrTWVuKzZN?=
 =?utf-8?B?VEJReXJqbEl4d1RVU2UxRHVNeWhvTURZM1czYkg5SVJxVlBYVGJJci91VDJL?=
 =?utf-8?B?ZzNQVGtYMmR0dzNvMzJ6Tjg3VXhMTlQ2bnJBWkp2ajZ2K0hiRTVIYUlGT1Jl?=
 =?utf-8?B?SWYzQmJ6MEkrazUraWNxdlNUWFNLdVNGMjA0aGNJQjdGcDJ3UW1xLzd6OUla?=
 =?utf-8?B?Y1REclUzenBzSkZIRm4zZENsc0pLNmxRYW5pS0g5NWhlVzlick1nWkhBd29B?=
 =?utf-8?B?Y1l0OGU5R2pIbFQ5ckpwck51WkorUnlKcGNrZys5Mmx4dEpZN3BzVklpcVcy?=
 =?utf-8?B?dHVvYTdOdlByY2NmSmkrZCtoVnVQU3lDL0FncEZONVhRdXlQckVRUnRKcjhT?=
 =?utf-8?B?dGhYUkh2dUs4VmtHYjI0K0YrVVR1ekdIdGtEL0JNTFpDNVpucjhWWERhamc0?=
 =?utf-8?B?T0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a98db0-3097-4079-032f-08dd4f7d6972
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 18:03:42.0993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQoh5WnhexYh0miDkSWp/GUwSY3VVgrvr6yTCzlgPfVdE80TE6VWweeiuRvXdBeanNq1JeqfOLt1plvAVUGPIAvp0DanLun18gbqZPa8upY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8293
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 18:03:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6404

Hi Antonin,

On 2/12/25 9:50 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Based on message by Richard Purdie on the yocto-docs list:
> https://lists.yoctoproject.org/g/docs/message/6300
> 
> Re-formatted for the Yocto Project documentation syntax.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/contributor-guide/submit-changes.rst | 49 ++++++++++++++++++++++
>   1 file changed, 49 insertions(+)
> 
> diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
> index 85ca987df..0675aac98 100644
> --- a/documentation/contributor-guide/submit-changes.rst
> +++ b/documentation/contributor-guide/submit-changes.rst
> @@ -832,3 +832,52 @@ Other layers may have similar testing branches but there is no formal
>   requirement or standard for these so please check the documentation for the
>   layers you are contributing to.
>   
> +Acceptance of AI Generated Code
> +===============================
> +
> +The Yocto Project and OpenEmbedded follow the guidance of the Linux Foundation
> +in regards to the use of generative AI tools. See:

s/in regards to/in regard to/
or
s/in regards to/with regards to/

> +https://www.linuxfoundation.org/legal/generative-ai.
> +

Following the discussion with Richard in a different thread, I would 
suggest to add something like

for the document taken as inspiration

or something like that. I read this first paragraph as "we follow the 
guidance of the LF as explained here <link>". I personally read that, I 
don't even read the rest, I just head to the link and take that as the 
project's stance.

I think it makes sense to specify that what matters is what **we** as a 
project wrote here and not what's pointed at in the link above, even 
though they are today essentially the same. It's just that the LF may 
update that guidance in the future (possibly without notice) but we 
would want to keep the guidelines listed in this patch today or update 
them with a separate patch. Essentially what we want is to not blindly 
depend (or imply we depend) on a document that is outside of our control.

Otherwise the rest of the text is fine for me. Do we want something 
similar in the BitBake documentation?

Cheers,
Quentin

