Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A4DC5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 15:48:39 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.17])
 by mx.groups.io with SMTP id smtpd.web10.15104.1748965711065148077
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Jun 2025 08:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=inZsjfUc;
 spf=pass (domain: cherry.de, ip: 52.101.71.17, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjE5R8s7mG9GwO3wI+MLvKh8EwWz3yxxLKYphkAoudfv0seLCyKWwSgipU3njWY1xL0UW93QH1FNY7QoOgoC1s7Hbx8nVuW2SHFTx112tfhNPpWUEmaJwT+4FjL+qeK29GGXJgneN/LHTqpixllchweVFmqcRZ92XtmIEZn/ielpt+zCeVRCHIDY7m3Eq9n7JrtR4UYjRGmdxXLKWIQEdqHuKsLhK7rgk3EiTd9NVq58b764UhzEtMPE+/wp2FHyGuMPoauz3fYHnRWgd10ezgYJoVjFvEI/ubKiHxT1q2gJJIqiSFOdkId8hPic5Ez152rMbTQW1ld+GnSmRjcE1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHIF8NMxGjEEljN0qPiNLgKnL4g60kLamV9siPJTPsU=;
 b=LGcNVKPcusx/HQ7n4y6MAwmevEsZMeDBKwOXisFgRNP66nstz4c+/Kez5OlFkK2Nh2j0NVbqBbe2ahWkJAjj9ULIl5qS+jeJqhHTU3BZpyqqDUWIjcimNAJqjoUM81J692L7E5qyI5UYxErAqQYrwHkPjerA+Cu41gHaUqmKTJcqnRGyGtTGrjXwT97hUs5KL6rvqSVbogRIqk08j+QxJyAUoDrjFZQY66f6X9QFiViMjdVWMKT7PHdOhwDM1k6r22b8S4k4KwA1MGYV73gj49QnNfKtNyBRTbqNHLLMb06Jipdmh8TNZs54Qe5oiehBYYfqxhu9TFWNVlbGJNZyhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHIF8NMxGjEEljN0qPiNLgKnL4g60kLamV9siPJTPsU=;
 b=inZsjfUcoTxwt/zYpj9TZtxZo57FuHv3xXOVBo41XkUCKmin6X0aRFk9uoOTYZYcXbP1LxCrM/3F+byTRNOFLCiJBYux7jQzXOOpx0Jurabitsb9MDJf4NJrsAf9Fn0/2Z9A1F7W+OeLzLhaGdo4v+a50IefQKOFQM65V64qsjE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by VE1PR04MB7439.eurprd04.prod.outlook.com (2603:10a6:800:1ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 15:48:26 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%4]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 15:48:26 +0000
Message-ID: <be39614a-235a-4494-86a0-18381f5d4bd9@cherry.de>
Date: Tue, 3 Jun 2025 17:48:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] BB manual: DEFAULT_PREFERENCE example does not exist
 anymore
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <9040c30a-c091-f2be-fd62-087fb758ed47@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <9040c30a-c091-f2be-fd62-087fb758ed47@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MR2P264CA0031.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::19)
 To AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|VE1PR04MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: 57afa8f2-4d4b-4de1-8065-08dda2b6142e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aXN4Sy94NXFSbU16blJ6a2FOL3dTZ2NESGxzUHArK1Q0UHhwKzlRVmN1UWRl?=
 =?utf-8?B?RDhJRUpBSGZwcFJXSDRkREFncmpCZFVISzZPTEtrZ1VBdm1tcmVvazZ2MVNZ?=
 =?utf-8?B?MmwvUGZhblBsZ2hrU0pYZGxwOUlyTVpaYjE2ZFdwYnV3Nm00ZEVCZERsZTNE?=
 =?utf-8?B?TFhUR0FSekZXWE9tRmdTOWVkU0F1UVEwZjQzemFJc241ckI5eHUzbmR4YXpt?=
 =?utf-8?B?UmM1MThJQktoUzA1M1VQME9xbFFKdXBtOHF6Ui83T0h4enZReXdkNU9DVXB6?=
 =?utf-8?B?QWJJYzFOcWtFRm9jQWx0RmNLb2ZMOE9EV1lSeDlwMW5xVStvQ0JTNlBSNlZr?=
 =?utf-8?B?UFloSXRUWTZYZE4vajdZb2xOQit1WWFRWGNsbUJIS2lkcFNwcW1UODllMUhT?=
 =?utf-8?B?Nll6bmtDUUNwUmFhakJrblc3bkQzd0hBN0ZmVEdVMXlNM3pkOVhBUHM0L3N2?=
 =?utf-8?B?cmlPZng5MEZvNm5hMUFiUkhVYVdPN1prczBBWFpXVjE2YzRCb2hmekNxaE1C?=
 =?utf-8?B?VVJTZ0RuckVsdkcvNEdENURrNWxPSFBZYkdOQ0FYZUZ6cVBsYlRPTTZBWSt1?=
 =?utf-8?B?VmxqMXdCMG1jaWFvRTVFa0luaDNCN2tDek9DTGZHZjloNVpIUG1SMzQ2bHAy?=
 =?utf-8?B?c1B6UGlSL0NGc1d3VTZuYTFMRjU3dk9oeUVMRjF2T1FibTVXUGJ0TndjblNB?=
 =?utf-8?B?UkdJdGZEU1FIUUFPd0VkdXpKSUtFOEV6QnhJNGJuRGU1OVhsWk1aRmZtbWcy?=
 =?utf-8?B?Nm1KdGJlTC9LWUN4SXlsSWxLWXltNXdrbWYrb29RVFp4WC9NZ3o1WkJoQWJE?=
 =?utf-8?B?aThHUHd5V29IQVRMUFM1bmNSQ2ZiSGx1Tk9yN2UvMTJ2OXRoa3hsVkVyMkN6?=
 =?utf-8?B?bTBuZjUvdnRMZkZWMjdvUU1jZDl1WEJTY0lpQ2E5N2s1QUlvb3ltQ2d6M2xB?=
 =?utf-8?B?QmxoSU1vLzZLalE5RzVEYmpEU29uUUhiSHBjeWFPWjJwVThaNXgyZFBIVk5H?=
 =?utf-8?B?NERISEkwR3hvVU1WbTArb24zNWhIbElnZml2S0pRVUpKMHQ0N1NuRnF3YmFq?=
 =?utf-8?B?Q2lWbWFaWlR1alBhdUUyV0IyVnpSYm9vSkVNcnFMYlNrbE0vOWd2T1hOT0RZ?=
 =?utf-8?B?ZU1MUkFhYnlreGlkM2NOY1MrSjlBMFhpemFXTlZLd3BiOXN6Um42aTVDODBL?=
 =?utf-8?B?b2VIODhaU2FLOWtvUDFqRGdiVGVNOUYxK0xkdm5WRGl0Rm43c3EybnlGVHMx?=
 =?utf-8?B?TktVZll4VklxOVZHYll4cTRrbG8zaFFIdW41YmcvUXJLYVN6dzNVeXZSeXQx?=
 =?utf-8?B?TzBUb3J2U094dlZwS0NzdDQraU1LbitVRHNRQTdKRit6RmN2Q1QweTB0Tnoz?=
 =?utf-8?B?cS92dnBaMnl2R2wvV0VsT0s4cGlVaFdEUlRhVXIweHZKak9TamRmWkttVDBQ?=
 =?utf-8?B?Y2EwTkhOTUs0Nk52eTZkc2ROc000UjFPZFNIMDhnVWcwMTVJaFpEeTdHeDQw?=
 =?utf-8?B?bTJGa0xGd2FmaWxkY0xXZGtKYTNqNDJnTDRqNmtqUXBlMWlFSit5YnB5d0lK?=
 =?utf-8?B?MUJsVGxzTm9seHJvNTdXK3poeERhTU0vWTJnV3B2dmNDQzc3K25Pb0FpdzN3?=
 =?utf-8?B?d3lHbTM3TmdQdllLZU16N0YzVG9GRzFyY1k5RkI2R2Q2c1hhWS9tS0l4UWxk?=
 =?utf-8?B?eGRTajQycWxhbXlEejlzMUVneFJYZDlkb0lybzdyeTdHVm5UQmxRV3o1Ylpv?=
 =?utf-8?B?YjJOdm96MzlpbFdVTDd4dU8ycFl0WHY1alBrRktlNHJ1bUFMN0ZValVhRGk4?=
 =?utf-8?Q?Bkq1HuOZnyC2V4/Q3ZFHrUNGtkECXyaSNca64=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d2ZNQTlJcG55ODdNZ2l6S0l5c20vZ0U3Z25iWVliRm5pR2F5L1V3WFcvcnZk?=
 =?utf-8?B?NHV5czV3TXA2K0hoTlVabkhLS2paZWZ3R0w2TktjMzQzQWZBcmFZUEsrWEhV?=
 =?utf-8?B?bzEzQnl6V3h4MUhnVDBIRStKK25hdFF4azI4OEMzUm1iQ1lWdkVCcERMMTJj?=
 =?utf-8?B?Q3JIZFQySFlEcnErdURuZXhhb05NSXBYWWFwalFKZGJBSk9vb0QzSlRpcUJz?=
 =?utf-8?B?eTJPdnJNTjFJVVYrNmNTdEdzVnpYenZMdUpZMjZyR1M0a0pydW1qQlJ3WVhj?=
 =?utf-8?B?cGJ5WlNzMkRUT0xrbHNwS2dyNXhSTEN5UFdIaXA4R0labmgzY1lDaGg4SkNv?=
 =?utf-8?B?Y2FWZEttQ2gyREFmbm9JZGM2L1NTelFNc2J2UkRxVlUyR1ZubHorMUt1SWR4?=
 =?utf-8?B?ait4L2Z1alNNaXEvQUdWZG1ZWCtScWgzUE5vTG90NExIbEdST01OTDlMN1pz?=
 =?utf-8?B?ejRFUlVHVWFmTThlbDZOTEhCUmRjNnhKRGRLVXFBK254d1ozeThzbHk4V1o5?=
 =?utf-8?B?SUF5RFJhbWhlcklBSlR0VHdxVjNTa1VZVjFSbTlZK0YrS1lFT2ZuVHVqcU1S?=
 =?utf-8?B?TGRPaGNkektYNlJpejF0amFmV25DYU1pNGVadXMzTGtZRHdSbHNSYkN2QVZO?=
 =?utf-8?B?bzVZZGZZeGN4MXp6ajFBNDBHVnpmZFpRUEJ5RTA2VFJrMlh3MkY5N0xRVTBo?=
 =?utf-8?B?cVpWMmdmSUh6dEt5YWM0VHBNaVBkYUUwMmhxbDRMUE9QUE9CS2ZZRnJXVFNX?=
 =?utf-8?B?T0ZlakROMXl6SDhYditsWFZybENOZ29aZk9vVWx2VFcvZEN0T04yaDJuSU5K?=
 =?utf-8?B?YlJZTjlZSDJ0RzFxQ3VVMU9XZTNGU1hwV215by8vODZDd1loamkwZ2RIYmw3?=
 =?utf-8?B?ei9GM3dGY1VOV09WYWlRY1p3eVZYTE04T1lmRXFDcitvS2RlKy9DVmFkRlI4?=
 =?utf-8?B?eGNlM1Y2UXJjQnM0Q2t1QXRKLzBqVWM1dGsyQlRic1RuSU8xTldMWGx6YWtE?=
 =?utf-8?B?c2FTR0xneXdzOHlyQ2F6dHR3bFErM2dzcGlNdE0yV3BpL2RFd054N1dYZkt3?=
 =?utf-8?B?bWJiRkg3RTc3cU9FL3Z5aTFJS1MwRUJFYXVtQUFCTzNwUlJWb1crYURtVWdo?=
 =?utf-8?B?UVEwZ0Nwa3N6RTRUaFpxZFRRMnQ4eUp1UDJFODk2VUdoN0ZzeGNzM2lsekc4?=
 =?utf-8?B?bjlLRjhkS25JUDFteWlpN1pJanNPQW1oUGtsN0w2RTBnMGFuRTF4U0ZKOVVM?=
 =?utf-8?B?dTZmVkh1TmdrSENhbW1xOWNyZ3JTckdZMmJ0SXBWR3ZmbXR2Vy9pVGNrVTAv?=
 =?utf-8?B?N0hQb3ozMjhBeUhJYTF3RjNLeU84SjVUcDdxYTF1OWVBd2FwTHRreE91a2RH?=
 =?utf-8?B?a0dCQUMwcjlHRWVSTHEvczQzcVM5KzZjTHkvRXY2akptKys1VFIzc3FaT2tL?=
 =?utf-8?B?QzFnTmlidFA3ejRrU1ptMS9wZkZaYjZRNHZZNmkyR0h0SUxuQkRGeU93bDl4?=
 =?utf-8?B?QXhwa3ZRamp4dkluSHI2YlIzeVJIdHM0R1JiZm81akx6aEE3VmZJck5CeWwr?=
 =?utf-8?B?UktPRFo5VDBwRWNCQWhxK1ZwcnN5d2k3VG54SkFRME1idUZweGE4M2hnV1A2?=
 =?utf-8?B?SmtkYVFNWUdmaGx2N3FtcWRwMVRwY0tRdjdPUE5PemREWm05aWR1a0Y3UUQ5?=
 =?utf-8?B?bzMwcnBQVFJVZGVGY1dPZXg2VWd3emRheExDcVhRTzR0WXdtaTZyTmMwM3Va?=
 =?utf-8?B?RGM2dUxzRHRLMmRzTVY4TVR2WVlKVG9mdE9jK0pQSEJwcFlmb0t2T1o3cXpp?=
 =?utf-8?B?V0ljWklHQVlYR0xlc0FXbXpsQnZyU0w1WFBIenRRTDFtaXh3cWEzbStxcko0?=
 =?utf-8?B?MHhiNGZJWWh5M0ljVE0rZ0VRN0RoTjJYY202ZHBSSkxuckVJcE1IbmxBb3NW?=
 =?utf-8?B?czJoc3JaVXdORzFoTEo1L04rRzZmMXFiOFYzaEdxRFBFazBIckZqWWxvM1l1?=
 =?utf-8?B?RlJudis1bENSZUZSTWNIWXQrUkdvNkkrVWMwajVqcEtDVlg3K0NYYjZsQmdM?=
 =?utf-8?B?M1lZeDlCcFoydlgzdlVGUXRsWG5XWElxTGNZQUtVM1FmRjFJK0xWTG9wMnlR?=
 =?utf-8?B?dEY2Ky9xNUQ3RnJNVjFSQk50K1lUbG1vaFlqMVVtU2V6ZHVmQ1EwclNpRlcy?=
 =?utf-8?B?aEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 57afa8f2-4d4b-4de1-8065-08dda2b6142e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 15:48:26.4109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qcmCx2pZKQy1Bta1R+ZhWnUzNqGAk/cQj2tOqXwwe8W0/YRLmB1/vkKz6uICrZa05lW5NriHaO7WwQ03BNiGDFGUjhfsUqsGp8VOpgKEM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7439
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Jun 2025 15:48:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6991

Hi Robert,

On 6/3/25 4:31 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Here:
> 
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html#preferences
> 
> the Note proclaims:
> 
>    "For example, in the OpenEmbedded codebase, there is a standard,
>    versioned recipe file for BusyBox, busybox_1.22.1.bb, but there is
>    also a Git-based version, busybox_git.bb, which explicitly contains
>    the line
> 
>      DEFAULT_PREFERENCE = "-1"
> 
> That version of busybox is long gone and, in fact, in the current
> OE-Core codebase, there is not a single usage of DEFAULT_PREFERENCE
> to be seen.
> 
> The best example of that would seem to be here:
> 
> https://git.openembedded.org/meta-openembedded/tree/meta-webserver/recipes-httpd/nginx
> 
> which is actually nicely explained in the .bb file. So should one
> update that example to use nginx? Or just remove that Note
> altogether given how infrequently that variable is used?
> 

I would remove the note and provide the context in the first sentence of 
the note somewhere else in the section, e.g. reword "When there are 
multiple "versions"".

Patches welcome :)

Cheers,
Quentin

