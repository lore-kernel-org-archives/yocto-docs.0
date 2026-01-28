Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C80D3F06F
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 14:24:13 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14045.1769610249863999006
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 06:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=LW4Tavku;
 spf=pass (domain: cherry.de, ip: 52.101.65.11, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rwyaT3MK4+JTsO1v1bt+CwGKwZX/llX0asL4twdz6zzRIWGOMZPOAHT2/YIt7FvG4ormpPGof1B2ifh1e+odof6RFCb9MH/+11YMI6KxVu/t91archInatMulyh2vGNsIQ5AZjDFW4J1TekGHoAxDa1iLA0iWqjuujBh3oJBduapgwrC0HRNOYTBS74DO/k5+83e2UYMKH2FNGyYHuP+9tMPzGZP5IfkCY5Z4K1R3k/VKX3UYD4d7XfwDE5c9RWJFghROHCX1npvRYPRsmbS1qljALST2BjXcJqF6XHNnoPfoOC/+97d/SJdIKumlcqoyv1G98qkox7GS6pf48sPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDZ+AbdaxBBooPA+uP+rzwF87QLke8NDo3HYgsjf7mg=;
 b=UmpLgd0qqzIHpxzV1oeDIdvv1jGrYkhRXB7Jpf0Pu7Z18Bp1K2elYHrgbPsoSDD2tZ8z02IDA4Is6HiwFKS8MDGXfScdLF3bh5AtGSOE72iy0tWOn2nhjm0+WenIyVn4rqO8jRF9HtITuKIUOJvIThQnvyVt4MumF6MA7ukJy/HrE18e1+UEagNA6BR2JK6b7qCI9BLY6pCy2DixYWpWRelhEkqWM2izsr7096mH55NgvBzuNfGJGgG0JJpH9wNhmK4GJclQIgPnVdkx6CdWhal8WJcNtZI57WzkKzh6hJkcDdzNi/ay0NNPTI45ah/7WGcJEIeFZHVQ7au+qpEvuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDZ+AbdaxBBooPA+uP+rzwF87QLke8NDo3HYgsjf7mg=;
 b=LW4Tavku8zI5SiULFWflgUsfjyfnRytOIiMYOOfD9vyaqMQiDqacLDwH01D2NeIs5LYkZh+EiM++B48f9p9NK35zyABmXE9bjGYkvH8RSP7UqezCDh9N36WUvyQYObRiLwP5NTy35RUCKaEDRVkpDQWuVe3tXt4x3cJZ3NM8Dto=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DB9PR04MB8396.eurprd04.prod.outlook.com (2603:10a6:10:24a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 14:24:05 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 14:24:05 +0000
Message-ID: <0760a739-9d81-45c0-a782-2165e767ecde@cherry.de>
Date: Wed, 28 Jan 2026 15:23:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 47/56] ref-manual/faq.rst: remove obsolete poky
 repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-47-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-47-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::10) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DB9PR04MB8396:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ace070f-6542-4167-b2ba-08de5e78e477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bklhdlBNckRyb1loZVM1MVZ3aEtWTlkyb2xOQjB2NitwVUtOY1Rhc2tSVDc1?=
 =?utf-8?B?a0lqTlZkOEs0VjlicW1BY205MldvYS8zMGtZS2IzZkRMOVczaVoybWVKOVBO?=
 =?utf-8?B?VWRnZzI3aUQraFlGVmd3RGVqRGQycDVMay90NkUrenNiM0czZWtZTzNJeTFJ?=
 =?utf-8?B?RzhmVjFFTGI0RzV4L1BTNFhldGVHTThCbFlJQjRidVFOZ0lKblZ4UXFCcjZC?=
 =?utf-8?B?TFFVdExjNS8vazYzb0cwZDdBUFBPL0prL254bGVaRXJtMmFMeWxhYjYxTjBO?=
 =?utf-8?B?VElFa0VCcmlyZzNadWdleGxtS2EwTklDK1J5a3NHOWp4aTFNaS9NamY5dm1y?=
 =?utf-8?B?K1JDWEROcXR5dlVkQUplTTJra2I5ci9FbC91RTREYkJ2c3R1RFRyck1SbXBo?=
 =?utf-8?B?djFJR1RZck00SzA0OWFacFhzeG1MdnpTWXdwcFFHMEY1VXhob05xMERlcnlR?=
 =?utf-8?B?bi9SS0pYcW4zazA1SENkQjh0UmNhek9HRmlEc29JalNCTzBFd3o0VXY5dS8v?=
 =?utf-8?B?ZE1CR0l3NllZT1V4VUMzYzFydzY1ZTV0aXUyMVkxcW5DS3JUd0N2L1ZWWXhx?=
 =?utf-8?B?Z1llcU5mQjJRMmZyZHdmL2RTdDVhV3ZJZFJ3a1QyOGlsZ2psMk1zdENpRHU2?=
 =?utf-8?B?amQ2N29XSG5od21US3RJSjNOUG42djBibHJQSUhoeDdLd2dhdTJkbmNXZ0Fq?=
 =?utf-8?B?cjFxVTJkcFloYklaZjZxRWlMVUxaR3dtenRKalltOHdVM05neXZVWE80eURH?=
 =?utf-8?B?bkNPSlh5L0VyS0xZSlJaSFN4K1BFZjdWSGQrQzF1cGZJcmVHSUxocVZETTdh?=
 =?utf-8?B?TStIWGR1MkJFNDVZSkJZemFJd0VldmxoOGJkcStIRUVTTGhnaWN4cGNtZURX?=
 =?utf-8?B?R0poZUdwdHJnU0JPTGs5QndFYnBHQk5VemRUcVRONDN3b1c2VEo0K3RmQklr?=
 =?utf-8?B?TFovdkNJcXZxcU9OcndNS0xDdzM1SEJ6MGgrblkzMjVIZTdkRzh0cmY4aEN4?=
 =?utf-8?B?K3NvYnA0OE93SHVsd1NkZTNCcmtQZmF0bGh6NTNTOEYyVGs4V20zN0FUQ29J?=
 =?utf-8?B?a29rOGpNcDg4SHY1WGRsT1o0UUJxTkdMMk8xVEFiYUtKY2NiZ0dDUFpZQXo1?=
 =?utf-8?B?b1FZL2FXSE5hZitJTDYwbiswT2dkMmU5elI5SCt6YURvNmVpMHR1YTVWTWhE?=
 =?utf-8?B?YUc2djVzbGd0ZHphRG52TTVNazVzamNEemRNbDQvejlIMjhsb1hzcDR1QXlL?=
 =?utf-8?B?Z1YySzNwYW5TZGNQS0V1MGJZcExWZlE2ckhzbFdzcG5Va1N5U3RiRTkyZk0y?=
 =?utf-8?B?ZHlDM2M0SW01ME1TWWtaS2VwV3U2SjZXc2QxdmNoWXp3VENCQStHK2h0U3Bj?=
 =?utf-8?B?V0EwREthWUVUSEN1V0NBa05HNDdvOUh2SjdWQjNjTDhZQWJvWFFxUERxaC9Z?=
 =?utf-8?B?K3ZtQjFLSmxkVEE0Z2lDaDhRRlZPZVdXRWs1VC9qSVdESFVCazdZbXc5aGFX?=
 =?utf-8?B?Z2pNeWI1ZmZ1VFBXU3p6Umx6MHUySERPSXpKR2QrcDdLWHRSa3lGMTZpd05K?=
 =?utf-8?B?eVhJREsrS3FWWEdZL3c0ZWxzSWJVdUE5bE8xREFzWFRPRjQwMTA2N2NLWmhD?=
 =?utf-8?B?N2FiNjQzQWtlRUV4WS9NNGZIQ29hQnI0UkRUNVU4ejRjZ21LTEdEWkdaYnl0?=
 =?utf-8?B?MVZTY1llZHFpVkx6a1hPQnROaUZWc0tnYTlwTDB6T2o0RjIwOVArRFlaclBP?=
 =?utf-8?B?TjJVSEZsczFYMFEvYmo1SVA0dEI3SmxlNk9KS0thaXJuazNySDMwbzNDd2l2?=
 =?utf-8?B?MnVGanM0UHVQV0dLZjR3WXZiNWlCcnZkR1hwbWNJTUpZV0FCMFNOSHRydllM?=
 =?utf-8?B?NklxZk91R2hEcVppY0RjaE1qeXZ2NGh2WG85c1pRam42QUErWTRUdXB3dUty?=
 =?utf-8?B?bmpCdlFMR1FtT2E0RDlsUW5lV1RBaXV2Y01VNWdTNWtMeEtqL29telNBZmZC?=
 =?utf-8?B?U2s0amRtQ0ZzamtrdjN0NTlZZ3FDY0lkRnZLeU9vMGp3Nk5rYTdMNEs4NTNO?=
 =?utf-8?B?QWRSa3lhajllY2hHRmdlb0U2OWpWcVo1dDZmS0RWbVlhcWJPY3A0NG1UVjc5?=
 =?utf-8?Q?onJU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R1JJem42cVRBek9KTVduL3ZrODBaQ3JrbTU5dEZob0JyV0xheGVqN25la2hB?=
 =?utf-8?B?YUNUYVIyWndnUGIybllhUUxORXRGYkxwZWVpM0U3VC9KdndBUW1oQUtxVU1B?=
 =?utf-8?B?UXB0cVI5eEt4YnpyOUh2cnhod2NNT1FCVlkvQTV2ZzhzZDVVdE9wR0Z1TE5E?=
 =?utf-8?B?NFMwaVhpQ1FDRDVKTi9WWHhEZzRUZEJ4MCtCWjNpTnZlRWJONFNtaGRlTEs3?=
 =?utf-8?B?Sk9saGQzcG8ybmh2QlY0K1ZYU296VXVUeHY3L2RzcXZZVkdHWlhHZ1JBekpy?=
 =?utf-8?B?SStIY3NML29nZ3krL3VNNmx2V0dZdzlDS0tFazB0ek45ck1DQ1NmVGZ6ekMy?=
 =?utf-8?B?UHlPdS9sZDFYbWJacDNLbG5FaVhzb21XRGlSVU5CcVh0R09WVVk3U0UrMzdz?=
 =?utf-8?B?SU5uM2JNS1FqZUZ4NjA5VDgrRUNaOFpRTTJtTFlUOW0vc09VVERnRkNOM2Yw?=
 =?utf-8?B?Z2hlUnJ2RlRZWE9NZEk3MU1iTUFtcUhqZU82NmFwOXhOTDNlV0JkekJJS2Iv?=
 =?utf-8?B?d2NlZUJNWE42Sk5NSVQvU0x4eFFYaDBrY21DcjVkUWx4MzIyQmRMYWFpMEs5?=
 =?utf-8?B?MzY1SnRRcUZsYU5RNElaRzV2YUpYRTl4RjJ2WlBlZThKclBsckszajRDRytv?=
 =?utf-8?B?YnpFQ3BldXI1NnM5RUNQZjV6ZlBNZjhIMnA1NDhXK1h2TDRaSGcwZ2tuZEZu?=
 =?utf-8?B?R29keHpZdXFLdkcxUERaM3BHK1UzeGNBR0tuVUM1Zmx5NmRUZTVxb1BNa1JU?=
 =?utf-8?B?a2RPOFBua0RweHIyblY3SWdJVWFlNXZHUWtKcHd0QjJzSTVHUlNmamtrRDVm?=
 =?utf-8?B?MDNrbVNidFFyZTdMRTRXcXQrM0I4cVhob0dONElOQTdDRm9Pd3JMQTlqU01H?=
 =?utf-8?B?V1JQOTdUd29GVzdQS1lQNUFNMWVFdGE3dFY2eSthQzF2RitJeHArZDJWdTc0?=
 =?utf-8?B?V2RpMHV4Z2VaaTZUSVB4WnJTQlp6YW9MSTNjTmZGRWFJbjVyQmw5K2t2bnVz?=
 =?utf-8?B?Mzhqbnc1Ym9PSTBubFhqZXVLVm1mRjRuaitsV25YdTAwdUVCeUFvUDdZQTdT?=
 =?utf-8?B?Sk84Y0F3YnlVNlF5U0hpeU5WbG5oLzVQR3pwWGpUMHMwcy9QOWdkZlBOZHdD?=
 =?utf-8?B?T0lhazMrNmtCYWttRGlqaXpaUDBhb0lUS2Q4Z0ZiNmJtVkNwZ0ZzYTAxVlYv?=
 =?utf-8?B?eU0vdHpSZitZU1Z2Qkd6Ky9zbTd0SHVXOXR3ZXlxb0RxdWZHZ20wOTYrRW56?=
 =?utf-8?B?NEpmdE80YndLVTNkUjhTZmh5MWVEam9ueHNMQzdCVVJUajBacm4rVjVxMHUx?=
 =?utf-8?B?eUI2OG9Uem9aQnVCSHlFTnh4MFJ0SWE4YVU2TXNSNmw2MFZVcFk1ZmdBN3do?=
 =?utf-8?B?eSszbFcra0FiTGdUTnZkZERlVWszek1RamNGWi9ZT0dQSDVNYVEraEwzdWdl?=
 =?utf-8?B?QTNlZkROcmV5ZzVvVGdoaWhKS0FYMUdZaVVuS0g3V0U0VDhpWUFadFV3UkZT?=
 =?utf-8?B?bTB0ejFNbmxoQ29tbXdlZHkxSjY3TGlZckdvZnhyZW5GczlGV3BxL09SVWV2?=
 =?utf-8?B?amcwVFk3dkxJNmRSalordnJvY3E0b0FibFJGRnRLU0RsQ3lyaVV1Z0pDK2tN?=
 =?utf-8?B?TGx5V0dCRFBoclBoSWEyYXJaRVV6MzFtbGxRenlkTk5wZkM3ZndVR3JUSjNJ?=
 =?utf-8?B?UTk0ZmttYjdoTFN5bTVkdFdHdk1naGZrSStvc09Scys2aDNEZEtzNThqdGc5?=
 =?utf-8?B?L2JBRVdQb0djT0h2Q3JOWGdoa0xEU0twSC9KMEM4NVNpYUI4Q0Nta1pjUTdV?=
 =?utf-8?B?Ynl1VnZJZk1keEtJd0g0WmJ4YWFsTzZqNUdCbTBCazdmRWlaT1ZjWjFiWWh4?=
 =?utf-8?B?cWtjVm9IYzhnVnBFQktSTDQyZ1NnaDhjU3F5R0NmNlBDeEJ2Qy80M241bjli?=
 =?utf-8?B?VWhLRkxRSUlhaW5uVkNwSmF0a3BOS2tqUEs0RWIyODAxQ2I3VWljSmtzVXVR?=
 =?utf-8?B?YXNHNUxtZVZyYWlXMjRDa1Q1OVZFbWJTdUV5eS9Bc0FWMzFxMzBLWCtMK0M3?=
 =?utf-8?B?U3daUFl3YnVkVktNRjVZbGhQVk1EeS9KbUZQSThsRTRrTWt0dDFXblFBYmw4?=
 =?utf-8?B?Si81ZGJvQzZZRVF1SVd5VmtabkVqTVZxWEtSMExvTktLaTBVRUxod1dUc1N5?=
 =?utf-8?B?b3NiSC84RE16MzAvTXZDaXpuWTRkeUxCMU1tSzdZZUs1d2xwWDI1UlRxanMz?=
 =?utf-8?B?NGVMTk5ucHdnZnl6MlhFTGRqeHJ6eWY0TWFIK3pFZ3RVVE5Ba2hBQWZHaFFU?=
 =?utf-8?B?ZG1ONHh6V012TmJOSHlNMERUMUlHWGYzbXdaSE1QYTFmUmxDdVVXbGc4L0Zx?=
 =?utf-8?Q?gMhDoHF7GrouCUrYP25hxZrubzRjEu8xbRTTB?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ace070f-6542-4167-b2ba-08de5e78e477
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:24:05.6245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pz2dE59VJhVuDIVJ5+NvsN6zUGaEAka4XywQ23I88te78aBatZOqsMnEYMDI+0XOP8IcFqw0EkH4IWBJ/u92c3J/5ZvYdbT7/7P3b9c3opY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8396
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 14:24:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8772

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 
> Rework the difference between Poky and OpenEmbedded. Copy the note from
> terms.rst regarding the now obsolete Poky repository.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/faq.rst | 43 ++++++++++++++++++++++++++++++----------
>   1 file changed, 32 insertions(+), 11 deletions(-)
> 
> diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
> index 6c5b9d4e7..7557a7269 100644
> --- a/documentation/ref-manual/faq.rst
> +++ b/documentation/ref-manual/faq.rst
> @@ -12,14 +12,35 @@ General questions
>   How does Poky differ from OpenEmbedded?
>   ---------------------------------------
>   
> -The term ``Poky`` refers to the specific reference build
> -system that the Yocto Project provides. Poky is based on
> -:term:`OpenEmbedded-Core (OE-Core)` and :term:`BitBake`. Thus, the
> -generic term used here for the build system is the "OpenEmbedded build
> -system." Development in the Yocto Project using Poky is closely tied to
> -OpenEmbedded, with changes always being merged to OE-Core or BitBake
> -first before being pulled back into Poky. This practice benefits both
> -projects immediately.
> +The term :term:`Poky` refers to the reference distribution that the Yocto
> +Project provides, and a reference test configuration.
> +
> +The :term:`Poky` distribution is built using the :term:`OpenEmbedded Build
> +System` and :term:`BitBake`. The :term:`metadata` used involved to build the

"used involved" sounds wrong to my ears.

Also I believe it should "involved in building" or "used to build".

Up to you, either works.

> +:term:`Poky` reference distribution is:
> +
> +-  :term:`OpenEmbedded-Core (OE-Core)`, which is hosted at
> +   :oe_git:`/openembedded-core`.
> +
> +-  :yocto_git:`meta-poky <meta-yocto/tree/meta-poky>`, which defines the
> +   ``poky`` distro configuration file (:term:`DISTRO`).
> +
> +.. note::
> +
> +   Poky also used to be a repository containing the combination of
> +   :term:`BitBake`, :term:`OpenEmbedded-Core (OE-Core)`, the
> +   :yocto_git:`meta-yocto </meta-yocto>` repository and the Yocto Project
> +   documentation -- which were combined with the :yocto_git:`combo-layer
> +   </poky-config>` tool.
> +
> +   This repository is still hosted at :yocto_git:`/poky` and is still
> +   updated for maintained releases that are older than Whinlatter (5.3).
> +   Newer releases now use ``bitbake-setup`` to clone and setup the initial
> +   :term:`OpenEmbedded Build System` environment. For more information on
> +   how to use ``bitbake-setup``, see the :doc:`/brief-yoctoprojectqs/index`
> +   document. An alternative can be to setup the above repositories
> +   manually, by following the :doc:`/dev-manual/poky-manual-setup`
> +   section of the Yocto Project Development Tasks Manual.
>   
>   How can you claim Poky / OpenEmbedded-Core is stable?
>   -----------------------------------------------------
> @@ -27,7 +48,7 @@ How can you claim Poky / OpenEmbedded-Core is stable?
>   There are three areas that help with stability;
>   
>   -  The Yocto Project team keeps :term:`OpenEmbedded-Core (OE-Core)` small and
> -   focused, containing around 830 recipes as opposed to the thousands
> +   focused, containing around a thousand recipes as opposed to the thousands
>      available in other OpenEmbedded community layers. Keeping it small
>      makes it easy to test and maintain.
>   
> @@ -87,8 +108,8 @@ configurable. You can setup the build system to get source code in most
>   environments if HTTP transport is available.
>   
>   When the build system searches for source code, it first tries the local
> -download directory. If that location fails, Poky tries
> -:term:`PREMIRRORS`, the upstream source, and then
> +download directory. If that location fails, the :term:`OpenEmbedded Build

Suggestion: Would "download directory" be :term:`DL_DIR` here? Maybe we 
could specify it.

> +System` tries :term:`PREMIRRORS`, the upstream source, and then

Suggestion: I guess upstream source would be :term:`SRC_URI` here? "as 
listed in :term:`SRC_URI`" maybe?

Suggestions done in a separate patch/series is fine, so

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

