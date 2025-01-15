Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3071C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 11:29:52 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.52])
 by mx.groups.io with SMTP id smtpd.web10.18665.1736940584554413734
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 03:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=OpheS1nd;
 spf=pass (domain: cherry.de, ip: 52.101.67.52, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9Uo9h2ZdSnKHvMiNUgU5QYvp2WB1cxjY2MiWww4fREhyq15kinA1rKxMCbsGfdEnLHgQwExtV2oEdgiTPXMC6cV37AyO6wsyoCx5KJ4r2wKPcODn0St6nKWObLfeRsmYuwgWIEc0NchrtDdfTFRtjIc2WlzC/Jk2Mga9mB+Jg1C1NMwdsCfNYqIt0eUSLR85+IAuM4k88M8TtZfod2BnL3pzOVTlhZ5M2vsCqeMESdaCUmgoZrWMUNhvD+C8SzI+Yewi6VoRjVvglvLIdVk7Ucm+Ws8cA11mBlScXMBKTRYpcTOj2Np5+1K9RJFhyZl/P9WI3YNSOqQh/qElM2DUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88rtvvWyFgCfz0kTXTmJkgb6tzk44YdQ19H7Ym4ahLA=;
 b=n6s0/KJhBQHfBUowKEM8o3S4cqJB9zrablDyOq+SMzgW9NO5XaBRzLFZUT5brmXtIu+rCN+SIDAmav5UQd+PjTX8PofxunVeGA2TJTLgzlY9s70Te/mkpIS+lORjeqDoaBJTpvX/y8INDQK2eQcfH/i53Ol9kGW5C3OYYUpCd6GqKaZ4m2q3o0NCP6nAp0BtsyTVZERLgAZJYg/6TXUNZTcx12mXp3oOPb7UWUjAZg9VnQXanPm0+6l9lyl9rbT+yTUYQE7C2Ndezz+5dA7lzVGY8MiEuLXS4mnzVPpRpHcOzRPpz8u/UfF7O37idH9AxwtHI+VrUU+B1IhiR+R/ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88rtvvWyFgCfz0kTXTmJkgb6tzk44YdQ19H7Ym4ahLA=;
 b=OpheS1ndg3fT5K8yPIf8fVLJhcMrY2m08wn5w5f/HbCbX+pCMfbuE/QolpnN9cArDepNWrGFeayIGT0FVN5+4+tfzHMlvnf5gCk/WnG1lj5BHb2ZdKZ0nWm3Ccu4mbTB9rLKln5TTR7/iXHnwQVhz5cI+zGGLPQ2qDyMNbmCZ0I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB8043.eurprd04.prod.outlook.com (2603:10a6:10:1e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 11:29:41 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Wed, 15 Jan 2025
 11:29:41 +0000
Message-ID: <7f6c45ec-a417-4a90-9780-c2c13e6318f9@cherry.de>
Date: Wed, 15 Jan 2025 12:29:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v4 2/4] sdk-manual: extensible.rst: update devtool
 ide-sdk
To: adrian.freihofer@gmail.com, docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
References: <20250114200734.4191354-1-adrian.freihofer@siemens.com>
 <20250114200734.4191354-3-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250114200734.4191354-3-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB8043:EE_
X-MS-Office365-Filtering-Correlation-Id: 78bd740a-3102-4317-661f-08dd3557e726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aVRLREM4bmZvVE5JdEgwUjh4d29LVjQzVzN3MFd1TWJMQW15YjdJbSszSVoz?=
 =?utf-8?B?TjdDdTIyNFl6K01NdlhDMXhkVUx5L3Y3MWRuQWVxei9qYThKQjFvaGdyS2Ja?=
 =?utf-8?B?MnRzSnFVem4rbzNKQUVtRzE4UGRlYWV1bVEwQ1k4WjRmeWZObWowbWxPTk1j?=
 =?utf-8?B?Z1lObXdpdGMxdTN5YXZUT1ZpNldUTk94emViem5kUjBCSjg1OWlHVG9PWkdQ?=
 =?utf-8?B?czQ4dUs2OWVXYWV1VXQ0ZTFKM3VXWSt0L2tNdHpJbndQdDRTNk9QblNaaUNF?=
 =?utf-8?B?OFNzOTNaMlRrUFF6SDZPYVY3V2ljZXgxYlAyM3plVWZvN2c4L21ubDBXTnZF?=
 =?utf-8?B?R0FFTmFDR0tNeU9QenRHYnNsaGtwaTRRMlptQmdDVVVORjA3YUx4M1I0MElm?=
 =?utf-8?B?ekc3eWFhT0FmTzNRK0JidU5JRENIcmRyL3hYSHZUWGdsQml4NjZMcGtqQzhR?=
 =?utf-8?B?UU0xSTdwOWZRSk5VbC9kdU1NZHpRMVRDQmFVVUZWdjVYbmVmZVVFcXpXM3BV?=
 =?utf-8?B?bzJ6bDZzek9Xc0I4bGJiMEtaYzBKZHNQbFRnN1VrckxWT1QyeDhwdHk4ckJB?=
 =?utf-8?B?TXZNZVZMaWpMblZsVHg0TjI4a0Jzcmp5R0tlTWJFcFNBN21tRk1XeFB6NVIr?=
 =?utf-8?B?ZkhGSitLQzJQK3F4YVk3VnlNa3BZbnIvOFRLOEtBWkZKSzYvMUVtK1JJWk9L?=
 =?utf-8?B?U0x5VGJkMDR5SVIvUUx3WXQvcnJpTjZKOUJZbVpQYm03QXozTnN2Q3QvdlFx?=
 =?utf-8?B?Zmd2ZmpRN000NGNZbmVaKzNzeVJSUmdoZkM4VStzamJqb3JWTzdodCtMbWht?=
 =?utf-8?B?VzNyOUtwOG5GUTBaSm9JY1ZTSWFHbVhOdFk1MVZEUE9vb0p3Q0NGaVhXUmJr?=
 =?utf-8?B?b3NPRlpEdWdvVHdUTHN6QkJOa2RFSzBwNTNxSmFJekNCRzA2SDM5OTdiU1NF?=
 =?utf-8?B?aExDQ2dnTk1ta2FIQ01BMzBLYUF2aGRNQS9RQ3drTGMrSHNVSDNDUEd4bGZn?=
 =?utf-8?B?RkMyVGg3bFdGU1pVTC83Y2t0NFZlVkdWdWg4Sml0cTRLUC91azJ6dzM4MGN3?=
 =?utf-8?B?MVVqTWFhcldiTE5uR2VxeUF5TWRiSzlEQndrdU90RWtVbnI2M2szZ0ZiS2N4?=
 =?utf-8?B?anVCOUJ6VnNBMjdyS2Fqd1NubDd6Nkt1R29CbmNyV04yaHNBNmV0clBIaTFK?=
 =?utf-8?B?Zy96cE5ZendBWFI2eWFQTXVFeFpvZGVySGx0V0szZk9nUjJTUXFrRlJuK04y?=
 =?utf-8?B?U0dlbXdIQlRVSlpKSEFoU1FnREpMUWVUd2l0SXJ0d2VwVm9GaVVBZDRBYVdI?=
 =?utf-8?B?OHNRcERIYWhNMmg3bHl2R3hFbFA0ZnR6L2xZK1VMR05Ub2t4UkRaNy9RTnNG?=
 =?utf-8?B?UzVrVHNyNi9nRUJBK21sNlppZjZUcnpNTExXeHE1aUV4WFdTcUVtUWs3Yk8w?=
 =?utf-8?B?a0IwUmwweWJIR1BOQlpycG5Iam9IMHR2S0RBc1hPZFhCRVJ2SmRkNDc1b00v?=
 =?utf-8?B?U0liZ29OMmMxa25RSllTR1dBMTVzcFBHYW8vZzlmYjcwdllKc1NrWXJUM2pB?=
 =?utf-8?B?ZUhtM1d6NGhOZ0haaXBEN3ZXYjRQQXVObEZOcjNSS1FMdENja0xvYmxrelpK?=
 =?utf-8?B?Ti85VW9JSTFkOTc4Tm83MXpVRkJ2QjBseTZscDM0aEZ6S2U3S1pieWMxYndI?=
 =?utf-8?B?L05CanJTdHZjRmpxZFU2MXhER0w3QWY0UXdHcHdpQTZwZGZCam1SZytZUkRq?=
 =?utf-8?B?eXA2K0hDQ2F0ZXlkb3FHcGlneko0dlNBeGxWZlFrcExaQXBVdVRGUU1Vdkhj?=
 =?utf-8?B?allqTlpCODA1UjZ4QTQ0Zz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WXhwVFVWSVc4U0hqbnNINGpad3F6QXV1U1NkbzZuM2E5WjNscXNxb1B3NFBo?=
 =?utf-8?B?NlJuL1VFOW5TcUhYQ3FHQlVSZWxybVhsZWhIU3NOUFRYczIzd1NCMHBaUjJq?=
 =?utf-8?B?MzVkSVhyY3kyRDZ0QWtEZkd3cGVLMUtlVDBpY2tOeFRpUTg0bGl0SmRyNVFG?=
 =?utf-8?B?MEs4bDlOTGQra1FQK1ZSWG5aYjVKMjRZTk1mdlBqYytQQzY0NlZxSUtkTTR5?=
 =?utf-8?B?ZktPUWFwTDRKUjVyZ1dVWVVTZ3ZrdHJMZUdadXFXTFVrMkxFUGJWNkNLWGZJ?=
 =?utf-8?B?WXVaY3pXdTJJaDh6TmozbjFGc1U1VkFNdDd0Vmc4SWVqOFBPRGVDWSs2Rk9H?=
 =?utf-8?B?aGtQZGpGeThBMFNWN3J4VFR4Wmx1M0cwbU0yQzZsdUkyVjJkeWpXdHl2K29J?=
 =?utf-8?B?QTExWk5JU0RFMWI0U2pTWCtySTg4Tm1sTWNTc2Y2REtzSHhIZWxuYjNGYlBQ?=
 =?utf-8?B?TVVYbW9Hdkx3dUw4ZWRPZytNRjk1ZGFMOHJWdk1Ca0tZK2hKVFlnYmJuYlhu?=
 =?utf-8?B?OG9tMVh2bmVFRVpOUmxoMVNXRXhvbkVheEZoNTRXcG0rdzVKSEI2c015RWww?=
 =?utf-8?B?a3Q2K1JUUmJ0KzBZOXB5QmlDTzhTVFcrOFNYT2pQTHFpM25jRVk0ODhpWVVK?=
 =?utf-8?B?YStyUVFYSnpPV0FWWnd2QnpUcFZEOWRNRHBWeGM5dnhaNFBIQTJaU3pvdGJn?=
 =?utf-8?B?TU1sZ09QbjFvTGJ4U3lISFN0SFlsK0xjVUFBREVnRlRrK1Q3SGhPS3A2TlR2?=
 =?utf-8?B?S0F3UUxZaU9OQjhQRDdvdE9kRitpOGU5Y1VrRkFaZ1pIZWc4K05ZMXpjVDFz?=
 =?utf-8?B?WldjZGZWNHQ3THB5M2EzSnpFaTh5R2ZLSlBKTTFYR0dxNnZ0eUExVWtSZi9N?=
 =?utf-8?B?WEIxT0FmTTFITEo4MzQrb0p4Z0Zibnk4TC9HTTJDSlFWZ3hXTTBUcDd1Y3Y5?=
 =?utf-8?B?bzA4OFRpbS95MlN6TnpaWVBpNjZSb3Q5MlU4d01XRlFHUG84L05SMGJwWTNU?=
 =?utf-8?B?NlYxdkRXalZVU2NlMEtMaHN4enFER0UxeFNXbnd5bUU3ZWRHbVRCdkk2VGRO?=
 =?utf-8?B?MHI1Y1ZQYks5S0s4QllGRWc5YzEvenhTeTRlRFZSVmxSQlJndklvN3prYU1R?=
 =?utf-8?B?WjFRYnhCVUtYRkN4MmZ3WE1uTnk5a2VZVXc4OVJScTYxUWdQYUdXYkhZYU1F?=
 =?utf-8?B?NGFFUndBZkNZbVBLNHZ1OC8vTlh4eXVGL2xueHlrQmVOSVNLN0QxelpyQTkr?=
 =?utf-8?B?VmdGd0o0N24rZ3JCbFJyOXVFWiswRUZIZkxwZ0ZxWUkrTCttVG83NElhRGtq?=
 =?utf-8?B?bmQ4QVBiejdPMnl4V1NkU3JBZHVSTDJBUDRNaGJoSDErOUQ0OTdYanJtM1Er?=
 =?utf-8?B?UGs5Y3R1NWJWcHE0SndhOVpONDFHdTU1UU9JSWgzTVhtamZ3YmhYbUpyVS9S?=
 =?utf-8?B?YmlFRTM2Z2kydzVXdmszSC9OQ21NYTJPZzUwM25rNjNOTExLN2t2Wnd1L2NO?=
 =?utf-8?B?NjU0VVpCTnF1b1VEY0pNRGhrNzRVb2dNRTJXSFRib2ZFQ2t4VkYybkVIK0Y3?=
 =?utf-8?B?YlI0cVl3dzQzSjVFMDYxMGNHc0QyU3dpNkVmdzlpdXdDUVJadzZEY3dkektI?=
 =?utf-8?B?Y0RPdGdsVGN5UW52Y1ZCWFRSVnU1cFQ3ZUdRMVhhNlc5ekZYTzM2Mk12NVNT?=
 =?utf-8?B?Mi84c1Q2ZTl1UEs4M0pVOFJ4VkRXL0xQWEVVUzRmYm5DYThhUmRYOHlOUWRu?=
 =?utf-8?B?c042c04rWWJNQkFSL0g4OXp5ZE9wRFF4VlphUlJOUW1ROWxHNEJMRUswMDVT?=
 =?utf-8?B?N0E1SGhVdlZpRGtNNUFIb2RwR0lwSHovMW00bnAwYnhlMmNkVWpleUhZdnBR?=
 =?utf-8?B?eE5WN0VOVUlZRW1IMkcwOElCQ1FVSUpSNTZkS1dOYlZoVUhDb0E4RUQySzdH?=
 =?utf-8?B?dHBnMWVvM0pQRXYvSXZMNjJ2Tk8vaUVwNDB3eWE2d0o2dDhoM2NqS0U5Qmpo?=
 =?utf-8?B?VkFkWm1mL0V0dkl3OVl6b3RFSFVUMWlVSjdmQnZ5MEV4cmxORXhaTHViNWVo?=
 =?utf-8?B?QTJZdHFMYit2V2h2UmVJYWJPVTVFL2t0OTdiVTB2am0yK2R4OHRZZjR1THFR?=
 =?utf-8?B?eXNGYWN6NGU4c0l5N0liTTdFWXQ5RzVPSUtNaFZ2cG8rKy9hK2hQd005akdh?=
 =?utf-8?Q?dc7qrAYVATaqESKlxxeza94=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 78bd740a-3102-4317-661f-08dd3557e726
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 11:29:41.4265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QPxKy74lNPQbtEl2u+x+VRoaEq7ZgrdNpeKxCrVt3wVlooVFRfRSct2495KD9Cyo0vL1wHPNzJepW8uGn/BPFNMpieQCWSOgzgguRn3OZfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8043
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jan 2025 11:29:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6116

Hi Adrian,

On 1/14/25 9:07 PM, Adrian Freihofer via lists.yoctoproject.org wrote:
> From: Adrian Freihofer <adrian.freihofer@gmail.com>
> 
> Replace
>    devtool ide-sdk --debug-build-config
> by
>    devtool modify --debug-build
> 
> This change was introduced with commit
> https://git.yoctoproject.org/poky/commit/?id=1f7eb26c947dde14698ae6e2ab88f0637027f4cb
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

