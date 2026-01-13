Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91160D2D0FA
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 13:12:12 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58746.1768309929916631436
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 05:12:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=eQhpU8CB;
 spf=pass (domain: cherry.de, ip: 52.101.72.48, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WP9ZBgOvVwIBLE2C+n/q7v6tgIa18JxOCm+GW/9iSqXWBxGoC5FN6PZtUKkJA9bUaICY2u+TEdDE+/EIurDEgQ6vMf41MSKnKXpShTuq7FIrfn1+72LHIP2UDfL7pvqyCfsFq1rLJvQY8MZ+HePuSu7VmvNLfRx8xdZAeGFx145LTt0eRa3rfzmcOXfAIoz9wvw0nojDL9JEKn4ZuK7MMX1e5rFx7egMqC2U79SDij5AMzrcqiRscmKMAE5k1qLIrcdOrp3f9MrYp5UfKleHwmrIdq5kB9f0v938eE4WBcoBLMGTd/VQZWT6PCK5s3p37PjdvBb0odl+GomX1lJkFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTtyct6Ozz9rDP77CbVuzd+IDInYzbVKu8cLy8KVnEs=;
 b=R29j/xNhzvU3vkEafkbLfrinlLEKctymHn3Fn4Q6vbgc9Ay7vX/OuPaIAfG7Yl3vP63Xc+msj1FDyN5IOxST4/ivfIKd38t3biyE8DUUflHhdPevVUCUCDtQw5tSNT9PQ4CP3AysilISzO0mUmsggnZ4zw+VdvUUFowWLKT1f1xYWM/QspKqEGjl4rS+CqyBfBzIUa5qSvH/wEKc4Hg8dXwOiz7hi25zt5xfqwrioO6xqLqqfqyzICsjHlMp3FvsEcGX4L8Jg91HqBpyC9jJOymgzWJx9qXwTkaCAU9F1RADp/dKe4b1a7qJHPueluJRJjOp6ul8llPo6yF0acaAQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTtyct6Ozz9rDP77CbVuzd+IDInYzbVKu8cLy8KVnEs=;
 b=eQhpU8CBvNQZWrAMLq5eAbogRwoDjJIINpuyzay3kf9qmUekF71g35qqKfhnW8Uj7fBmLZSJd4BePep4Rb11SzdIueUD3rDNx0L8OWt4XLpH9enFnRDREUz5i0zDIuCBt2pf+j3Gx4RrpzwOWAP0TZdnJRG62vzUxO/AVjpSgZc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM0PR04MB11932.eurprd04.prod.outlook.com (2603:10a6:20b:6fe::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 13:12:05 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 13:12:05 +0000
Message-ID: <70e9659f-dd62-49e7-949c-90cf1d60b3ec@cherry.de>
Date: Tue, 13 Jan 2026 14:11:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 16/53] dev-manual/temporary-source-code.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-16-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-16-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0365.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::8) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM0PR04MB11932:EE_
X-MS-Office365-Filtering-Correlation-Id: f9db8708-d015-4854-b670-08de52a55912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M3dCdXpONkphcmJZYU5CeWJnanZjb1Q2K1dzZS9QWWZnWEZ5Y0JnSWo2U2RS?=
 =?utf-8?B?YytlUWFPdjVjR04rMHBVN0VFck9oSitWQlZ1TDJNZUJ0Y1R1MjZKbDhPZm9C?=
 =?utf-8?B?QXkzbGhUMENEckg0eVVZaFZoWUFMT3JjUmJtYWU3RkRFNC9NNU1HQTZ6ejNN?=
 =?utf-8?B?cUxjYWtqRVhVRVZ1ak1DSTRIQ0lYOERBbjdCT3FPUk12UDhaTTg5ZHh1UXRR?=
 =?utf-8?B?SUhpQmg0c2JybHNQdCtwZEdGaVBjdVNDWjRGaXVpc3hzQUxBWUIrTFJEUXBw?=
 =?utf-8?B?djZRTEg3VEJ0bThTLzZmSC9hdXN3NWpDMXNzakdNRnJJOW9kNEdoNnFFTGpR?=
 =?utf-8?B?aFI2bVVZN2lxWTkxamgxYkYyWUV0cUJKWHo1U0ZUdWRVcis3QnI2Vy9nUXh4?=
 =?utf-8?B?eVVobFpjZ1JSVHBaN0g2cGg2VjM2eXQ2bmtyUWVVMHdTSHRHajlOZkJ6VFhT?=
 =?utf-8?B?QlBJY2N0cElyRXFXR2M2eUtsOFFkcitHNU0veDYra2QxaFM5WVlBdUJyN0Ra?=
 =?utf-8?B?TTl2VTd6VWkrT1FYUUZvemtpWjdHZnpIY21Fd1lyVHFxVDhJbndWd3F0ZzZr?=
 =?utf-8?B?TEtxNTYvL0pzaTNHQk0yM3ZUbExhTVVQYVJlWWR4RndKQzFWMHgzRWQ5TjFv?=
 =?utf-8?B?bzBjeFhkdXVNVXFUaEU4LzNTZ3FPcG1zQUt0RnA5cVU5QXI0V0w1OWNneWZV?=
 =?utf-8?B?d09Mb1l5emZhWHFBUUI3bDh4RGFwSnJZRkorRDY3RG9uN00rbktNZTNvOFBz?=
 =?utf-8?B?RHdKc3lLdjRxQ05rU1dESFlzUytnL3VhZmlqb1g3QmVBRFcxVG1zV0lnVTFl?=
 =?utf-8?B?dk1oMWNCWEZSeTBGUVEzc0NFTWk3Qnd3OUZJSEV0NHdqRE5KNnlWQ3g5VjZF?=
 =?utf-8?B?QUt2ZWlMbHZqeUJSVUhPU21iSFRJRjBPS0RwaCtHU1RvbVFQNmRBOElNUC9k?=
 =?utf-8?B?Q3ZET051UTFoSllUUHhzdlB3YmNlV1NlS1Y3QXh2RVJ4ZWwrNGhMZTE3dmNo?=
 =?utf-8?B?WFBlRXREaFUzcG81bmh0Rkt6SHdvaXl3MjJpeTQ5TnFEa3Btd0dxYUxHcm9S?=
 =?utf-8?B?ZWk4MDEvb0JGdTd1TmtyNExncEVmaUZJc3FienNWTlc2K1BpNHJXaFdzOG9F?=
 =?utf-8?B?cWo5aXJRL0NSSjNGUWVjWnl4ODFST2VDZW9GODlFd2h3WjFmVGs3a1YxVmxY?=
 =?utf-8?B?aXN2V0YzbUxtUlBVUEx4ekk0d25kWDZzZjdJZmpyY1NGQTdOVGVQUGh5U0Uy?=
 =?utf-8?B?N25SQkZCQXhXTDZOR2ljT0VmaHhmOFM2bmtwT0JYeDh5Y3FQeXFteVBSMGtY?=
 =?utf-8?B?MEE2UjMxSUJqeHJtRENQejRzZGVwUU9LamJjYnl2Y3FzaERIQytkYVZLWU1Z?=
 =?utf-8?B?WnU2V1gwWlR5WW4zV0ZOa2pSbXJrekxRWENvaTlXMUZwQkpDNWJ1dkNtODUv?=
 =?utf-8?B?S0xYQXhtMDA5Y3FXQXplQUgyK05ZZHhKVXp0NjVNUFJiMFJzSTUvZTRXS3RL?=
 =?utf-8?B?bWQ1bDFUZjJpQXhycFQ1ZDkweTJkTkdNTTYzTFVsN1A1YlJ3MWFiSjRtTCta?=
 =?utf-8?B?KzJNeHg1ODJWVWZUbXVTWGtTeEtEL3FlN0hhZXFnazFYbWFLMEo2Y3dwMDAr?=
 =?utf-8?B?NjZWUnhFTlY2SWt2V2RaUXNyS0ZwVDlDdmZxVG5GcHpjNWUxcjJzbDhmbDRu?=
 =?utf-8?B?aWNNbmZuRm1wMHRoRXppOEFvTDJNQkRjUCsrRHVCdGRXVXdXcWIweGxBU3Mx?=
 =?utf-8?B?RGZ0cEllRkZuQnFQbjNQZ3pEdnlYSUdXa2NsQmlwN0hTaXQyTGFrUGk4WEYv?=
 =?utf-8?B?MzdiUi90dURVbFkzU2RFS0RUYi85R2FKbUFIYnhIWUEwUWR5NDVybjhDaFE5?=
 =?utf-8?B?Y0FHN2Z0VHR5QXV2aytEQ2xaQklQTUV6OWdGYWRmakdSMjhKcDkvMXcyWlFw?=
 =?utf-8?Q?Ar55ssIqxJCZwhv7lwrAqUlHWhsjJhAQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eEx3a01la0R0WHh2RWxVbC9OSTFDcnhpU0l6aEttMExadE5yMXYxdFNHV2d4?=
 =?utf-8?B?dWdNTXdDTFFGNXBqMzJSMVF0NWx0M1kzV3ZPd0dBTUVBM3FEMHNWeUxPT2Ir?=
 =?utf-8?B?MVhrS1FTd1A5ZXZENkdLek9DSFh6UndZdjZVMmlvcjltcW41YzlpUzBqMi9G?=
 =?utf-8?B?T2RxejZ1TTczcTRUY2QwY1NzeXNKRGZmdnd3TDdsbDJWd0s0TlJMTUswc3Ez?=
 =?utf-8?B?bHIyMnJxMkhtTU1iRllzTVpuMWJ1VXVEN2FFYTJvY2ZidkxUUmhyYURjWFh1?=
 =?utf-8?B?N0NkNng0MmVtSWk1b2dJbExGRFNIT2FpajA4NWhaZ0FQckxKZTQ0S0U3Ukxl?=
 =?utf-8?B?aGhNSzd4d3pkc2dNdW84K24zOCt1eFhET1pqSUN0TEY0UlpmTmpBOUtmTmV6?=
 =?utf-8?B?T0Njb1lCYm9GS0p4RmxQUTJZSWsxa0s2eW03TW1NVUpudjlUbm9jVkpZQ3BD?=
 =?utf-8?B?VDJuajI2RlVHOFVZWGtNaUhoenh6a0psa0xDVzFRSVlFU2NEbHRpMjk3WTNk?=
 =?utf-8?B?RHpwNE5XY2tTbm8vbHJUeDdFMFNKeS80SVJ0ZEFWOGI0UWM3WXA2Rm8zMDNS?=
 =?utf-8?B?N3NxY2RNSDdYMWZzYzArTitoNVYyMHBFMy8zZ3U1b3NZejVGbGpoSXZVYnVL?=
 =?utf-8?B?MXVzZG5BMGdjNXRFNC9Ja3N3VDNUYUpYRlFVeTZxcndZUmhiN1l6UnpmbUFY?=
 =?utf-8?B?SWoxRk93ZXBpTnQrOWZFdnBSSXZwZmxZTzJ5TWc4UUxxRllKRVdqdFRLc08x?=
 =?utf-8?B?YVVhT1hpdkczWHJMKzhkcEx0Y2VvYzBFOVFuTFZHc0dCaU96MUNYbUU3aFJ6?=
 =?utf-8?B?MTRaaHNaQVNpOFl1UUdqdWEvWHFtdUltK1Z3U0hzQ3czUzhXWFZ4YVJTT1BJ?=
 =?utf-8?B?M1o0NTZqRlRDNkhqWHBGWXRTUEV2N2VORDZaeVkwNW1tN0hoUGpYYjg3eVVS?=
 =?utf-8?B?UWlmYjFGQTlGUzgwZ2hsSUUxUWg2Q1R6MnBuakRpZWdyejc0M1RseGwrU2xk?=
 =?utf-8?B?ODRJT0ozaXhTbG1DRTFkdWhRUWRVVng1dXVoQ056eXpDMVdCTWJ4ZjlQU0hu?=
 =?utf-8?B?NkdsbE1ZT3owekl4YmJiWUlHMWhHcUo1S3VGRHhRMXNZY01GdlEvUGFPd0ZE?=
 =?utf-8?B?eFJ6dVFXZG9QRU1JaFhkdUZ4R1JCOHZheXBtd29lWVk4SFBYdS9FTTFoUXBq?=
 =?utf-8?B?a2NDd1lOWlg5MDhwZzlwaTMrOTNMQUVoeHByUERtYTlzeEJFandkVGJqd3Rl?=
 =?utf-8?B?ZUJ6Rkp3K0ZLbnNUWWI1blNSZStmZkNFVys1WmxsMU40TTBVR3NER3NSVm14?=
 =?utf-8?B?RW90MW1DUy8xcHV3bFFLWDZGT3BSM3BHbkpxQUt0akR4ZFJ1My9vNmFEQmdG?=
 =?utf-8?B?RFY4eVZhby9KOWxmQjdMc1BZNCt0UFhrOGs3MXV1d1lZb3NlSVN3Rk1pVEhs?=
 =?utf-8?B?YUx3L0lIOGhFMGdpdHo2S0RHc09oTFB1MUt0a0xSVnFzcDY4RXJsaStYVmxD?=
 =?utf-8?B?OGFmeGtyQlJJeE85M1g3dW11anBFZmZUWW5FUDVwYW5VaFl4TjNHaGkxOFFM?=
 =?utf-8?B?VzdvRnZCNmFBQlhVVERHNXJoWTJjZHM4cE15d01jSFNPRE9objRJVXIwZ0JH?=
 =?utf-8?B?dVFnbkcyZmdUaWVHL25WRUJuL0dxSDFIZi95YjNQUTh4dVF4SkFya285SDV6?=
 =?utf-8?B?YTdGNDdTTkZJL1R2TjRSTlBTd1N0bjdHMStXN2ZvaHorazdpai9HNFR5em5C?=
 =?utf-8?B?ZlQreElpRUw2Y01NLzRrNll1Y1dyY3RTeHFFcit0Ylk5ZVRuTk1GOVdmNWNT?=
 =?utf-8?B?L2FhbnFJOXNBSGNzRCtLQWF4RHRjbyt4OGNhZVVBUit4M3JhREhaOTdoMzJF?=
 =?utf-8?B?VXhxZjJHWElhczdzUmlqSm5QcSs4ZVRuNmp2M0gzd0tRL1FqN1J4Rm0waDhs?=
 =?utf-8?B?aUVHMytmbS82WTB0cmY3UjRiRFM3KzFOcUVzbi9ZdjNrQm5mYy9MdVdyU1BD?=
 =?utf-8?B?aHVDZHNWVTJvYmprWlUrRnpuL2NZYVMxZm53WG5nZ2J0dUptVWltemlvV0Qy?=
 =?utf-8?B?VmdEQ1NPUmdqL3pwYm1MeUVGaFBKeUhubHE4V29hM1hDV3JwVkUySEZyV3hx?=
 =?utf-8?B?YWZhS09pbW4ydEljM05VQUtac1VqVVYrTlJmVVpTOVRkWk4zQnh5U3YyRjg1?=
 =?utf-8?B?dVNqMEdZQThVTHVBM2ZNRUFZT1JGaW9XT08ycXhSTmhEdzFzZG9TVUszUDdz?=
 =?utf-8?B?MndsR0U2RHAvZFo4cGVLK3UxQnFMa1NpSHRlbSs5UmRPc0lsQlArS2pyaFNR?=
 =?utf-8?B?aFBnMnBiQVdxWGdITEQ1cUY4cmd3NHR0VzQ2bmpZdEpGR2s4MDFuQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f9db8708-d015-4854-b670-08de52a55912
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:12:05.2275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93ktF47yqEfUdHH17chI/GKIIW7uqbLDACK/CYK26dQrHgHTV5W7/GbAhjKHTUBGye/1ICJopMXAqPnWkjCfGbDWC2+OG6QBovR86eIAmh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11932
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:12:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8505

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

