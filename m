Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6C4C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 12:04:30 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.73])
 by mx.groups.io with SMTP id smtpd.web10.2461.1667995464511527730
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Nov 2022 04:04:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=SVOISmXO;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.15.73, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QV+p1ErQpaYhICWVWHxDLxQIIPuq9GcY1JY1x5g7tKmfAIPyzapaAUl0hztmYEm7tq7Tsnb1yaW8IR4yeda5/SCDw9j9wuqQZ6dMFV7CA/gKwpo8jutbyMhOIAN2YrhWYNgIknqvH36qyyZhAxZ8i5IuKto/z9FcnqkKxMG0PzhNB+G3bR/3NDz9mbWN1VDQRi9vPObFf4jPTPSI/cw5zUvH50d6whpQKbCE+f0FMb9bDmTVX8vPeXFTZ3+gcOM5/BokdTvdyzKvNN0j+v1/cUh6Y4+9ILq1W8mVdWQHO0fyH0kpt4zaxez8ItHmDf8HBqsE3MlHKnrQv4zPsTWm/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1w/zOPARnUE8qdp5q56cSusoOayb+ShjmjRT928CjE=;
 b=iRlHQJ7h0VNr180Bkb4ueO4npjVFjxtEoiKxCA0XSkk9HOllR9AGf01nVyw/77X3E32B9MHBwzl1Pf8SusFvBPBfVoxaeeZrzSWwSqhtO6zllcuW1ZXasIy1FX6j6OycfPvlNnp66bobcmOOmNbbyGUeTqhfDodVKNzUQHTjUc7JjFSxM5AXoOopjUh8IR9Jd5QpM38TjaqVNSM13CjJCIEe92LHHDTD0DKkISdHkii4eta0mLQIYUXTFN+n10lOaZvx1VM76Q+xRybktjR7LmUXUQP9kG1iqxcC+cg/E8HQYE6lM1ekabJXBjirxyWvdrYqZv6xhAl87+NqYCJabg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1w/zOPARnUE8qdp5q56cSusoOayb+ShjmjRT928CjE=;
 b=SVOISmXOqSFeSoUGVdlRWF5007xyBjTG2u9K2Ld1Zb3hVK6ZN+IdZGC7IPP4f/i+F1dCXaS1gHvOcToyCnTkTQoe1CXtf02QxQHQvBeUZGSed8kXiWRTS7VzS2P/AOfstteTcfy+gvitjr/bs4sYp6Y0Ugyh+iPKmzReunHSyrffFL6sPHRlnplGkmFpLkzwdSzi0MQt50x6GjMzbdUk7OO9dhQ98JEWrOI4u8ziWhOma60z4GcXfJ4yCEm1Q4SA8A88Y9RdrRQiKl04pYoDHGaPNno8otdL3GSeUfslhUYrfYbfIQOE9RhZdDo1LGwze4DNgo63xoF6+UZ1NvVPBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS1PR04MB9455.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Wed, 9 Nov
 2022 12:04:21 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 12:04:21 +0000
Message-ID: <6692ad46-14c8-d99d-f99a-46a4e2b3fb06@theobroma-systems.com>
Date: Wed, 9 Nov 2022 13:04:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [docs] [PATCH] qemu.rst: slirp port forwarding details
Content-Language: en-US
To: Atanas Bunchev <atanas.bunchev@konsulko.com>, docs@lists.yoctoproject.org
References: <20221109114823.16010-1-atanas.bunchev@konsulko.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221109114823.16010-1-atanas.bunchev@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0050.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cb::18) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS1PR04MB9455:EE_
X-MS-Office365-Filtering-Correlation-Id: e26440f4-7231-4975-903f-08dac24a88ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n6v1Yzz3sIsxveUwWvN38+d+ouq2Hdpi4YVHnuxQKXYaEX21C0ok8StX8I/t2hfY0HPi84uRohqi9Z+4q0XeY0M//PKLj5/fUNXGilmnAKzWxhY1hF7iJGFVMCQKy2lfVFzb4VsmDT16sKWu4ZGS7hFMg5W6Rp10BBmb8Qq9VRYuleVA+peYBwViy/xZV2rrKd2QzyvO9ZAoS80yOLbmrcEZxfLi9cY2H+n5DqM0YUXVtM3FH/b0NPSzaLZBZKswB5uW6tF0DcCnSs5pe3O7w33rPCrHBfJeiQki1mGXsCRHI+h0Oq8PSvbtSRiPlE6P3USZhE6V6fD9RbCG+Clg3E5o5aAUeVblVXtoUKj7jmRHZMrU9tvtn2OAF+HULVsAJJ9UCb54HvdLPwtLU6pjxL79YVsF3cqhSnODLoXAdqnbhdp+6YzdF42Vg7El7lKrBlYjcwc9YLYJYKFFvTs0MLV8OoSnVBCvDVLUfFK3fE4HdeAqK3kYqe9TEmCya0sYzPXUemfWAEb3aQFM1fldQ4/7vpPZD4y9CllynXVihp7zqA5QFKVaRfvb6rR6GMEC792daYD2ul5rPN0uhyG4u5dvI9OJR8Mx3XMCeDnwu++na5LrLIdfF4+ND79ZtLchLZEkeyQg2qFyQjgBD+ZeKRqvY5knyR4HK8gcHtMUXp5Q19UlHVT4l1gh5tCS46Ag7jqJTPhUNOb4Kexpj3PuA3rD9UGpxLhKPq4OSk5u9MDeBMbV5mgaBoFZ1o/8z2aPIKG48AmbUnJrphZuVh7bhoGHILUsfzf24dTgoEaSjcU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(136003)(39850400004)(376002)(451199015)(31686004)(6486002)(44832011)(53546011)(478600001)(8676002)(2906002)(38100700002)(36756003)(86362001)(31696002)(2616005)(26005)(83380400001)(66476007)(186003)(6512007)(6506007)(66946007)(66556008)(5660300002)(316002)(41300700001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YTcwSm1ZaFEyRnRzajBNVk0zcXd2VEx1N2U0VXlFbkhkWjErR21MbGt1QkRS?=
 =?utf-8?B?VTIxZHg3NVNlcVpJeHFXb0N2ckwxeDZhZHNJaXliR0wxVm9NNk9mTWhESlBi?=
 =?utf-8?B?KytROThyWmNkYzYwS040OWY4bjhRL1NlaXhnRFNyaUQ2TmZOYmc1Y09UQlhB?=
 =?utf-8?B?ZkkrYlhJa1NPZ1VLbXNRMTRrT0htZUovM3RYZ1I3anJDenk2WjgyR2psRnlZ?=
 =?utf-8?B?a1NqTFhiS1cvWnZHQTk1MEsvdDdhU2xCamVvYWxIVENVYWpUL050RENjTmQw?=
 =?utf-8?B?b2krWTFBTldTUzk1S0hsM0tCSDZPVkhQUTlyM1N3alBVNFlFVHpMek5pZFQr?=
 =?utf-8?B?TGk0S0N2aGtoUmw5UENIZk5LTUYyc3A4a0d4VUw3UnJDOHpYcUwvSDl6NHpE?=
 =?utf-8?B?YWdWd1d6aWNhZEhwMHg4dXV4NzBXT0hjMm91bmdaZzFDYmFxVzZZc3VmU3Ni?=
 =?utf-8?B?VWZJTGVyallTUDJ0VldVVWJsSlRGdk9mcHVYSXRKanpHM1lqRGVqR3NkMVBV?=
 =?utf-8?B?WlZJQi9zdjI3YmxtYVhEcTdPR2puSytiSWM0Qmw2b01PSlZKZTd5c0FhSjRD?=
 =?utf-8?B?MXVUcE9HRGJrOXlxOVVqcEYvVWpCV2I0UU4raFJnTnh0NTBiQUM2ZmI4eG1G?=
 =?utf-8?B?TE1iNW9Cb1diNERIMmF3NUU0VkR0dkN4V202RnJkaUh0c2hock42TTYycllT?=
 =?utf-8?B?aGlNQ1oyKzFOWklmd2VqakhRQlZEQ1F5N2ZXQWZKUzRvZDNrUGpPUXRLWEx4?=
 =?utf-8?B?VE9zLzA0amNnaDVIcG0xdzRqb3VneFgzQ2plbllNVHNBS3A0bERYeG11MUpv?=
 =?utf-8?B?OXJURkxRREppcEZiUkdiT2V0RWlhaVloaU5US241MmQ3dEdCVEJ2SWFFc0xp?=
 =?utf-8?B?OTd2Zy9JL3BQWThIWndWbWZad3RDWXIwK3RKVzZQZ3NZTnJKMTlOUkdVTnZv?=
 =?utf-8?B?M3lmdnBBV3duWCtveWdTR01sUTdEZS9RMXNvR1FLNTFwRk5aQmNTUkNkM2Jm?=
 =?utf-8?B?ODY0SHBqVENMUktGd0FhVHhWd2pQSEh4anZyRVRYSzhhV0pyZVNWTGVPTkQw?=
 =?utf-8?B?cjRUZUZHYkVZeGp6clV4L1J3cmczak1vQi9hRGpFK0l4TDcrN2VlL1JGL0I4?=
 =?utf-8?B?dGJ6eFFjcVB2TUdKZVZ2bElNN213SGZIazQyTkJnZTRWUGdZUk04MVlpSVR3?=
 =?utf-8?B?TDFiTGw3MTQ2dVY0RUJjaGJIcVR0cko2OERWTFlTakx0dTJZcXVRNEpLeEVZ?=
 =?utf-8?B?bDQvZUtTenZRUFE2WkNYMDZMU1lHTEZYV1FkdThNa2I2Q0Vpb3Y3dWJiZXJB?=
 =?utf-8?B?REN2YjhOQi9iYlE5UXg2QzNvMWxzc0ttRFdsR0dETmU1SHpBQm5qQ3Q1MnZ1?=
 =?utf-8?B?eFQvRXB1MDkrYXhyajdiZERNVXN6bDFtQjRTSkhmYVR3KzF1MzJ4aEhya0RN?=
 =?utf-8?B?RS9McXBzMk5TeUU5VUJnc05VblkyT2xBdzlMaUh0VGdGa3RMUTFEa0FSN254?=
 =?utf-8?B?V05rZnVQK2E0S1UzcTFBTEVPMFN1WjVOK0xkZ3lCY1A3VHg0dzJWYWNvUWZT?=
 =?utf-8?B?ZnRtY3d5VnI1MEthcEw2b3BjK2szUEJSQ05DV2d0YlJ4eHhmczZyNzNUdzBU?=
 =?utf-8?B?djI1d0VkZTZEOG9jcDYrM25KdnNPL0Nwdkp6aTFBNW9CWTBtc3k0SmFxQld3?=
 =?utf-8?B?ODRVZGdqcjE2bVFCU3V2alZKNW1UdjE5VTJXSm96MEVYejM5VTRTYzRJY3E1?=
 =?utf-8?B?SElUamw1SHJJa1JZUWtjRU1nN2xZTWM1QXNzVzQxTVkvcm1EY092MmpIZXhw?=
 =?utf-8?B?UnMrdjN2MUQ5bWN6Y0VNUXRwOFJuZGQwSVU0WEc4alkzK0RZWm1tamdBakQ5?=
 =?utf-8?B?ZnQraS9OeWJPQ052SEFOUU1zZzNlZDJ0RGxNZVpsNUdsL3hCdm1KTUxXbU5P?=
 =?utf-8?B?cktNakFTTXZyMmZ4cUJCdm1nVlhxSnlyNTJ6d0hiNmZFUDVVODFQanZtc3VW?=
 =?utf-8?B?TUpXUGNoUnRmL2MrYml1ODRUdlVoZzlMUE91YWI4NXdHVUp3bEQvN21qM3ds?=
 =?utf-8?B?MUN1MjZmZjZHRjBIMnpXeVlHWGNwdDdYSTEzcXErelR1eDNQby9QRlVOaGxp?=
 =?utf-8?B?RXM0VmZyRDVmQ1ROV2RiV1R4NG1hc2lKRXRLRWVReXAzWXpWWmZtcEdDT08y?=
 =?utf-8?Q?ji3oqUk4TaVAd2Zg6sP7xg0=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e26440f4-7231-4975-903f-08dac24a88ef
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 12:04:20.9628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDPXleZo+rtOEJVwmr9WNxzlFaSwOxtMcZLk/HDK1APA4aTpU/1AP3K/qEow1NZM/iV9iJ3G/x4/x6SIHL4azvTrsPQ9ivowQwppUNt7s1NTbX/hkJu68kqQLUqqCTmN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9455
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Nov 2022 12:04:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3479

Hi Atanas,

On 11/9/22 12:48, Atanas Bunchev wrote:
> Explains the default behavior of `runqemu slirp`.
> Explains how to forward ports from the guest to the host machine.
> 
> Signed-off-by: Atanas Bunchev <atanas.bunchev@konsulko.com>
> ---
>   documentation/dev-manual/qemu.rst | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
> index 5a4a82ce6..1f866f1b7 100644
> --- a/documentation/dev-manual/qemu.rst
> +++ b/documentation/dev-manual/qemu.rst
> @@ -426,6 +426,16 @@ command line:
>      networking that does not need root access but also is not as easy to
>      use or comprehensive as the default.
>   
> +   Using ``slirp`` will forward the guest machine's 22 and 23 port to host

Can we put "by default" somewhere in there?

also s/port/ports/

> +   machine's 2222 and 2323, incrementing them if they're already taken
> +   by another ``runqemu`` instance. Specific forwarding rules can be
> +   configured by setting ``QB_SLIRP_OPT`` in ``qemuboot.conf``.
> +   Examples::
> +
> +      QB_SLIRP_OPT="-netdev user,id=net0,hostfwd=tcp::8080-:80"
> +
> +      QB_SLIRP_OPT="-netdev user,id=net0,hostfwd=tcp::8080-:80,hostfwd=tcp::2222-:22"
> +

Can you say in a few words below what exactly those commands do so that 
the user has somewhat of an idea what they are doing?

Cheers,
Quentin

