Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEFBC02192
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 09:14:11 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.57])
 by mx.groups.io with SMTP id smtpd.web11.65493.1738919646077008173
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 01:14:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=SPDnUWIh;
 spf=pass (domain: cherry.de, ip: 52.101.70.57, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DfGHR51ufN5Gy/KuOdQtbliX5048OmC7gl5XDZNM4HM0tALWvYmUjaSxy+Q3FxxpLso6D82L0nC2kkcl05d+4v9ehIJMwHnk/4pE3RYH8s+XSO7tYSW5pHb8R+nRy4Xjj1O82zqnmul8GEjvX8KgOJWjDsPqBykk1rQA07wIUgiTKVEX1qh4QtjrXjsfb2gTqwpQ6dHRNrZmMRjFkPd6As8kUeRa3GUVaxUOzZOuvO+7ybTo7miLx4TAEolQ77dEwC6bdinWygKCnGnpZPkVq2USJ4QchXcWKYWVhlXgZuNPLjoBEFdGl+hVVk49Ol+zgi5SJTFZVKS0dyFLXoioVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iDXVm+E7qoMojPQ5E6+qF59sN2sh2QLF6ymf4pwZcI=;
 b=LIY8emdFbztOLdukTc4d9uBKVFIBM8iAdM2Ys+u3xtG9gL0uKRcANpTv0zzbkNGj+BgQ/1XjRw/BrctIM2On3hyImIr4qpSXUq/NQCaQ7dzKGn0WWOsmAoi1pahcypcfhtCDenaqIMAVNOUNifGiWZy190ipBa8Wumj5AIL8VBsfezTiyWas6tKEfA1rcOJqU/CtCT3B4bAeNjA7KjBHWIKjN5FsuVaVlqCOMmj0ovgq/dDDypwautKbTrirfTzxYuR+uSEpYR6m/X6Opwx9DNsTV6NfwDtb/giw1VJ2ffx97w8GgbnfvMPvaM7OUS7kQVpGK1ZDpa57QRNiwaBg+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iDXVm+E7qoMojPQ5E6+qF59sN2sh2QLF6ymf4pwZcI=;
 b=SPDnUWIhKsoearnSREXcVyNtHEAI3mA0NlSmZYQ5ryaMFFSh3W7dHNX44j+kQ+GwUb8agz3+qD804HWoYsIWKxUfljjs221gx4CB/QpxD0lTqg/2aoeSRTwtk9xa68aTTm1f5bgs6I6OPggVQevD3vHlkc993aWRLuZA/LvvpXQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VE1PR04MB7422.eurprd04.prod.outlook.com (2603:10a6:800:1af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 09:13:58 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 09:13:58 +0000
Message-ID: <52281efc-eeae-4b9a-a0a8-6b42f83a9d7a@cherry.de>
Date: Fri, 7 Feb 2025 10:13:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 3/3] reproducible-builds: add a "How to" section
 with OEQA* variables
To: yoann.congal@smile.fr, docs@lists.yoctoproject.org
Cc: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
References: <20250206215711.154194-1-yoann.congal@smile.fr>
 <20250206215711.154194-3-yoann.congal@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250206215711.154194-3-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0173.eurprd09.prod.outlook.com
 (2603:10a6:800:120::27) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VE1PR04MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: 2878ce09-e0b8-4fb9-04f0-08dd4757c12e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bStyZFM5a0x4TW1yTXQ2ZFZSSE54RHRNRk1JMUtVV1RvRU1VUG9rM09zK01I?=
 =?utf-8?B?Nmovb3U2QzA5enZTb0liZVh5ZzFUdWQ5cTdYbmI4amJCZXM5OXpacnZidjV0?=
 =?utf-8?B?NEVjUU1OWDAxSE9yT3hGMFluYlBoTGtFY1JQL2pKZFI0VytjcE03d2JQQXhN?=
 =?utf-8?B?M1o3T3dYRlVicGl3VEJEc29uR1dudW5LZjkrWkNwNG1lSnhINm5LOUVCdDVS?=
 =?utf-8?B?Z1N2MEgrWlpnL2psM2ViRG5hTDFjNC9WOENmczdTRVNHT3ZJWlNZV3hlb05m?=
 =?utf-8?B?QU9VTVJDM0xOQUc5QnE1UGFIL3FiaVV5SHVQSWdBT04xdmh4SUZycnNLVWUv?=
 =?utf-8?B?T0wvUnRyRmN2VktDRUdtMDQ3ZStoRkMydXYrSE9KNFcxNmRDOWRyVVlvKzN3?=
 =?utf-8?B?eVZBbWQyWDFXQ1NyaTdEUWppRjZoS0pOUUtqZnJHT0hBRjBBY1oxSC9xUzRt?=
 =?utf-8?B?U2hxV210UVFrMnlzc0xyUSs0M1hTWmN4RExYSW5qNjR1cVpGY2hvaWhzM3Nj?=
 =?utf-8?B?TWRwMm1idlZ2TVN1TldkUUx3Mzd5Sy9MRWV2M2xCaHRHTjNyRE9jME5vZHBZ?=
 =?utf-8?B?NWJOZGlEL3duYUltS1cweVl6SU84Y2RnMlMzTjFFc0pwczRVVnhwemx1MThU?=
 =?utf-8?B?REhvS05VQjN2R2FJYlpJdDdGMklwS0xyR0RWTTZhdVYwRHp3bVgwZHdMRTFq?=
 =?utf-8?B?dUJiT2FnZ3Byb3JNaTVGU3lZcmw2Y3V4bFQ5UjdWSTg3WkdiRzFVYzRvcGZE?=
 =?utf-8?B?NGNsbVYwdHVBaHpVNzNRT2JZektZeUFsYXF4VHpOZElEbkdnalhveGFPaVRj?=
 =?utf-8?B?ZzAvdDl5azhaaHFraVh2cjJTa25MMHoxRUFJcEczcXNLdGZPZFlndGs1MGN3?=
 =?utf-8?B?RGNRUWUvRDhVUy9HS2xlSkpJbUVCK2NFMXlONk1uODJXK2ZzNCtEeHFIMUpQ?=
 =?utf-8?B?VlJDdzJtWDd4RG5GTlgxKzU3eTJlYVhuNVNNUW1kQ3JUU0UwcGwyTGtRZG41?=
 =?utf-8?B?dGVYL2NqczAyNVJKc3c4Mmc1ZmZXcDA4L21UbHR3TlN0cldXZ2xGclJUazli?=
 =?utf-8?B?a1J6L0J2alJKOXdwbElzTVEwMlAwdUxDMVc5clh4SExpM0dQeGFUK3dXcUk3?=
 =?utf-8?B?RWNiQ0lNNDV3M1ExL2ttOW10RnNtZG9VRkMvY3BvNjlYY3ZvT0wrQ2s3TFBZ?=
 =?utf-8?B?cDZpMW8wTmdvYXVudWNNQTJTeEpJQVpOUUdNYVkvUUJXelJ3NFp0ekd6M0NP?=
 =?utf-8?B?R0ZhWTVaY2tzdG1TRjIybUhvY1FZS2dEY1ZSN0hOR0k4N0traGkyVWttK2xa?=
 =?utf-8?B?UW5NOWZ0WisyWVdFdnZqTzZLWmJIQVl0ODlKWk9XVnhGLzRrbWY3VEM0OXdB?=
 =?utf-8?B?bmpLMXAwU0pOR1A3dVBEcm9zL3pQWE0weEw2N0RqaTVJZDVwK1R6QzVNdnBI?=
 =?utf-8?B?anNTQnRBT3IyejFiUXZlcGhQQVFRUi9iTXZpRmlib1BpTmlJU2l3WFgxRllz?=
 =?utf-8?B?Wm1JSmEzbWRJalQxTC9BOGFLU3BlS1lMN1hPVVVKbFdBR0pYSk1kdXl2TTYw?=
 =?utf-8?B?ZVZuOVZIWkEvUnJIWHVrcTlkbWdld2hnMkRud1F0cGdtRnFndVRKSVdIQ1FZ?=
 =?utf-8?B?UUl0SEJXTWRMeUZ3R28zTUFSWmRNTFRwQjZPSVFqeElwRHZPR0hMQy9SVndQ?=
 =?utf-8?B?ZS80THV6YTkvOEdtUHhhVjNpSnpkUG5CcEFwTHBHSURzNXpkUkNnbU1Lei90?=
 =?utf-8?B?SGNQdzc1N1NtZ0hQcjllNXRicHk3YmhuQ0xhOTMvRW1RZnVWTWlVMHE4Zy9K?=
 =?utf-8?B?c1E5Vk8wcHFUOHMrd2hCR0EyMDQ3MkMxd1h5ejZScVpoN2tydUFQc201QzJZ?=
 =?utf-8?Q?ONDz9iVkH9lxv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z016K1NJMGpHR0N1RGZ2a3FFQVRDTnYvMUJHUTB1a0FkUUFWTW1XT2djdXgr?=
 =?utf-8?B?YWtCWGlQWVNYZWNmcnhFRzhGM0tSWE83STBtZ3MzV0RSY08xR1k3MjNWWmps?=
 =?utf-8?B?L25CZHVubFVORG5UM0crOEtNT0JLcTIzWHlqbkdYREt2UXFWNmxhcU16T2ta?=
 =?utf-8?B?TFNkZmdIaWVNL3RITWp6a0p4eUhCc0JyK1ArUm84L1crYzgrc09UeENGVDky?=
 =?utf-8?B?UGpWRVZyRmdYdWNpV2J2RzdZUXRZUzIyM25aUXp5MnE2RVJUQmZlMUVXY2x3?=
 =?utf-8?B?RWtOOTdPa1JISVFacFJBMlpLbSttNVdDODVLSzEwTTZ3cTB0T3UvcFYwWFZT?=
 =?utf-8?B?UGNiTDEzTFZqVy80M1p1b1Y2YkhKZTFnMThKQ2d5M0Jib2g1VUpmOGNvZXoy?=
 =?utf-8?B?RDV4UmQ5Wmc3amZ3TUQwYWR4S2FYaVIrQ3lBd2Z3aERJc2xiWUtXcHY4TmJD?=
 =?utf-8?B?TE9LMyt0NEE1WjFPUVRQZ3VaU3FSVU9qaG9yb3hGNXp3VnZDbS9SWGdING1h?=
 =?utf-8?B?bmZLWUt2TWpLZ0xTZ29CTzErVHJuQUNxU3pxRGpiNTRSUXdJS2NhdkdrY1V2?=
 =?utf-8?B?Z0xTNU8vK20xaUd6WitybVQwTGNtd3l3Nk9FVDFOOGdlWnJlZk1HZm1nU3o2?=
 =?utf-8?B?ZHF0VVBuc2tsN3JBTEFzTVhtVHNodjYwZTdmQnRQeUlrS2hOSWpwNnZFOXY3?=
 =?utf-8?B?MmFTeDN0dlZ3K1hqdEFIME5DV1pWSmJjU1U3dVRFQ21BN2ZxeFN2dDJLNjBY?=
 =?utf-8?B?cXdoQ1lZSGRRdGE2Qk1WWUZ5UExjcnMva0NNbCsxWTZhdmV6NHNWcXBDOVRs?=
 =?utf-8?B?ckVYWUViSVRWMTl2QUFmQVo2Yk9KcGF5SE9qeUlBcCtHbmg1d3ZFOWZUU0py?=
 =?utf-8?B?RjYzRnNOZlVGSEhPWFEzQ3RtcGRjQndjcmJZUzFncmliZWd2M3Q0eTIyTVg2?=
 =?utf-8?B?NmJCMjRQVm1PQVZnWEpjZmxyZVNQTTFoOHliVC9LYmorVkVIWVAyNUtGMWo2?=
 =?utf-8?B?RW5yUFR0TC9NKzBHWFVtUFVyRWhpU1hhYnl2d1oxVTRoM1RKc1phWXR1Mndj?=
 =?utf-8?B?d080elJKNVRNMUMyaU1Wblo1SnYvMVVxOU9wTlhrTGdPZUZkSVVPRkFtNzZB?=
 =?utf-8?B?K3VkOCt3c0NHSENhT0pVQnpKMW1tMFRDZzdPUU1xY1JNWW5XL1E4bW9WZjZQ?=
 =?utf-8?B?TTNUcVE0Yk1CMk1Jek1uaVV6a3lBc0F5K2ZMaXRiZTJxSVpnTCtia0Y1Z05O?=
 =?utf-8?B?RlhNaURYQlhzelgyTVRGblk5YmFSRitKWnMvU25sRUkvMjVrelZwcmErdGRR?=
 =?utf-8?B?WUxncWxqNTh4Vy9PVUM5TWVIMDREWHNSeXRaaWtLM2RydFRFaEJCc2M2UW0z?=
 =?utf-8?B?R1l2cm5RY081M3hxR21XNHZ4ZHZpajBNSnMzaU9oV2k0TGZOYW9EbzlBSmRq?=
 =?utf-8?B?TG56K2k0dUJyZDE3TlJTS2wyejg5RjgzV1lEVktVS2F2Tnp4RHg4amxpU3Y4?=
 =?utf-8?B?dWNDN29jbElWQ1JWSnlxN3M2UVd0R2hKZXV3dmpaUDFoc2Erazdqa0o2TVpQ?=
 =?utf-8?B?alF4UTZ1MWF0YWQ5RXJMbUJFcmljeFdhUHlHS3FOSm01VFk1UEwxWlZwSzBz?=
 =?utf-8?B?dlU0YTBVU3NuZUo2MWRvVzJFR2ZGSjloRk8weEdhVlhvZHJlcm1IKzFvTFJD?=
 =?utf-8?B?ZVFveXNZcUkvMThLbjlCRlVuaFhiaDhZSXBINllRY253RExMcGgxeG1EMXE0?=
 =?utf-8?B?M0JJcFdBcklxOERaZFM0c3lPSC9UU0JFb2hhdjVuMEYyOUQvamRNQXkva1gr?=
 =?utf-8?B?VnEyWFhKU3dPTEZObTVzZnlZSU1Da0gzRWkzRURHdFRRTWpRZ2JXNWZIazU5?=
 =?utf-8?B?VURFeXd2RFA4VGJ6eXp4cnEyTFU3MUkwRGplVFlscmhXQ0RhajVoYm1MY1dq?=
 =?utf-8?B?cC9NbXVFRURkNUJFaXU3WTNRVmNKMEtvSkRvTnp1T2xDbm1mZmRjbThqL2wx?=
 =?utf-8?B?WHV2UVNzRnpzYnRvek94eFJDRnozaHpTOG52dlBwK0JDRVl2RFB1YjdBRTFx?=
 =?utf-8?B?aGRkS3kzMTFEb0NFVjZZMXFObUZGZitlL3ZHaXdhTno1N1JWUFZRZy9OWWY3?=
 =?utf-8?B?OTlkQ3ZvUGNoaXloVDlhdVFZWjVUVWU0SFMvbHpiNWwxeUtCenhxMmx3YnZH?=
 =?utf-8?Q?2m0PC9aWG7ebqFe8IdBZtQo=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2878ce09-e0b8-4fb9-04f0-08dd4757c12e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 09:13:58.6362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uR1e4xvffYG4ML2kBk4KO62Wj+cuDR3h3X2O6g8RJP+rlmHNispPdPIpvBF4Cv0MkxOL4wQVKntFyZMEmpYSxNgONaFg6pvjLFZUcFqweac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7422
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 09:14:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6284

Hi Yoann,

On 2/6/25 10:57 PM, Yoann Congal via lists.yoctoproject.org wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
> 
> Shows an example of the new variable OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
> and still mention OEQA_REPRODUCIBLE_TEST_TARGET/SSTATE_TARGETS that were
> shown earlier.
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
> ---
> v1->v2: Quentin's review
> * tick-quote variable in title
> * a set of recipeS
> * 3 spaces to align a code block (not 4)
> ---
>   .../test-manual/reproducible-builds.rst        | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
> index b9f671d68..77c15d6e2 100644
> --- a/documentation/test-manual/reproducible-builds.rst
> +++ b/documentation/test-manual/reproducible-builds.rst
> @@ -145,3 +145,21 @@ set of recipes before the test, meaning they are excluded from reproducibility
>   testing. As a practical example, you could set ``sstate_targets`` to
>   ``core-image-sato``, then setting ``targets`` to ``core-image-sato-sdk`` would
>   run reproducibility tests only on the targets belonging only to ``core-image-sato-sdk``.
> +
> +Using `OEQA_REPRODUCIBLE_TEST_*` variables

Sorry, I meant double-tick quoting, the same way we do for the classes 
in documentation/ref-manual/classes.rst, c.f.

``allarch``
===========

My grep-fu didn't return anything with :term: in titles, so I guess 
that's why we're going with double-quotes typically?

Looks good otherwise (see comments on v1 I just sent for the end of the 
diff in v2).

Cheers,
Quentin

