Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612D7C433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 10:26:20 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.42])
 by mx.groups.io with SMTP id smtpd.web12.5851.1668075969410998362
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Nov 2022 02:26:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=e3+FB1+s;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.15.42, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHFsnDdinORGaBG3jI3Y6xlVO5Vi5Y3D1kF9X0oOO+P8YQWZ7prEYuIFcHPxWMA1btpsiA8TMWUm4CXH01QCAKy6nodfAO62URdEReY0EVCnRKLmFSj5EVeCYoaSvcI7R5OpGy3mEU/w0USDn7sniFrRsAzygoExBmgWJtMnj6paTtCJHQrS1+fE6D7T9W0DHgOnx0ooCrziiaP+hTWbOzkqpdWx/0eco+g7nuyC0G/Qkr+dYO2eSntmWuH0pwzYpJIhglEPGxFZI2sQDo8EIB9RSFGd4ivssFtjMO2ceYMTz+cQ19LtuMiQDh5u/qiTSuomNDvQTx/gaeufvA48zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XzQsLnD3GSyOYmyXbQU9j4bCiLWy9nWBcx3Iw9w2b8=;
 b=gvUKQMIJkQ1lkrkjhHlOmu7jA5M96wJiYJGHGYEZTpfmc8bOMfWRP8nPUwW9a43vYzF+dGDCFPnRyhipd7S9erZzWvoj5j8jvkbeoFzO1xWzC7UxHHfcdeBg4tbPhWTYS+7PcW83fW9tvUzX3HRPmqVUDJMWA16hcGD5v9DuktN4hHFbvu2NB1HDrzHnfpOmfoIgm3FS8GRpQyJIViz+SE6Q2TsTNQ0Th6aZqqOrO8DYlhHPRy6eI3WH8RM2KOq2eMseL4lNsr04joq1wBGIY9JuYI+UJTrW/8x410mJAW2lBSG3VuldtG/Po+ynhBCaMiSbLdEmX2twqa4iHU0JxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XzQsLnD3GSyOYmyXbQU9j4bCiLWy9nWBcx3Iw9w2b8=;
 b=e3+FB1+sbeEqYoIBfoKZQnmZ9Y89geWDzao59+l+Ga9Z1UZqBnd+W4bn03mDVUwH1r/jinBfKuNV2kX8tRnldYL6P2M4b7buO4IE/f3S1Qai7N+ERALX0iBoelCCVHICaBaWBhCMdLjt9aQmhoS0mt7D1fbVzfnJ6pqwjEkwVuqUacaQR9SIevFbm3PrOG0ARyFSA9u6BtUgKXRd2Sjb2rjJ6Lri1Q7hnbpKaFUUSmf/dJ5yHm+UYEYvF/p2UtMAu9gR6GV9JURWqmMd1Ex50RKqZcgRULcMzSZziDtKfYfHXukmkMPUXjJkDvLdAfCncgQgjSj9jMdSUmmEbck/DQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB7512.eurprd04.prod.outlook.com (2603:10a6:20b:29e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 10:26:06 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4%5]) with mapi id 15.20.5813.013; Thu, 10 Nov 2022
 10:26:06 +0000
Message-ID: <aa016b93-f655-57eb-2973-1d9df65f67aa@theobroma-systems.com>
Date: Thu, 10 Nov 2022 11:26:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [docs] [PATCH v3] qemu.rst: slirp port forwarding details
Content-Language: en-US
To: Atanas Bunchev <atanas.bunchev@konsulko.com>, docs@lists.yoctoproject.org
References: <20221110063610.9047-1-atanas.bunchev@konsulko.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221110063610.9047-1-atanas.bunchev@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b95cc1-fad2-4dc6-3fd4-08dac305f8d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5I5J3Wl/Jiw9tLkQjCaPSlPszYs//mgLZ8RDxCzYp6sXykyJzrKxnEEeWvW7Ssyp4Z+SucMfNfvdxH8nhMiqF4VU3XDfKaXMhWrntZplp+yQbEtnKvI51E/yUUhxdW9vPnkCSPe2T94WZRIoaldsu73DN64tjXkaBlnvksWFSEf9e/GnIMUixDE/xFa3fA7Ye52ayavTQuGCdgnOGPRVn31tvBoKbp62PvTvbYBTgO2k+zVVDSMj9dYyPFPV0sIaX5z3tRczoGoBO6EpEeEjf93vq2SF9qgmNQziGohW9M7PRlZXZKxw+4EnH0tJ3BC7h1p82G+zSarHA6Gaao4If5B0hB+IRCY4EC54PP0blMtHoJEC/4Eo+ypAY7HLkMsHBBRRtAsrUFdNw9DBd7yulZCBw5hmH2R8g+SC62vT/qv8V4LvsTmD3zJ+bEGrRppQ0KSgLq2hkMEB7S8h79dij9Qx1H0Wxr3x9Ns0c9fN5m79JjZfmTcxFTFMYCtaNo+PJvFrZ128kw3tmc+8OqAWE0k+3i7twKKaTzjIj0Iz0cg7knSgi8q9y1R9MrLT1R6hC4vwtUP52sIlnLMszU72/I/BCsm4GcgCkEkTHwo1qHWon+NeH86mEDeh0ga4QaGi8oXBq+tSzc+NoBbc0lX875DNl9/LfGTr+FkmCCoqGI1Tkobr+UppsHQ3UxIQg8fpiyX7LZRrSZrWLj959aZDh6JAbB2zq/r0akrAil4ifjAhWrdy+OX05Exa54O5ZXrJLgwwfazdSovgUAkiftdVAut8IzUzINeuQEpH4ZSOk6g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(39850400004)(396003)(376002)(136003)(451199015)(44832011)(31696002)(86362001)(36756003)(31686004)(5660300002)(2906002)(8936002)(2616005)(66556008)(66476007)(8676002)(6486002)(66946007)(186003)(38100700002)(83380400001)(41300700001)(316002)(6666004)(26005)(6512007)(478600001)(53546011)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V1NvWUtoc3hpWTViV2RhRFI2T0xKK1RZMzB4Ri9lcE1NK3c3SWlHOS9UQUIx?=
 =?utf-8?B?T1J2b1k0Q0NzSzNNMGRCdFhQa2w0d1o2ZzhmaUYyRkRhNHFtRzFNNUdEcXRt?=
 =?utf-8?B?YS9YOWg1Q1h2aUhIZndjTE1meW1tbE1rVWlyZU1qTjdJdFZGQ2FsQXFRaitl?=
 =?utf-8?B?M2d6TVAzelM1TlViUTFJSUtlODI4cDJScWdXVGV0eFdHVXBHcDBGWFZNUGlO?=
 =?utf-8?B?NUhnbXJiTk5VQXR2cE5MaVhHYzRGV2RnU3NQTk0xK2ptdzUrQTRIWGMzemFr?=
 =?utf-8?B?dFNEaEY1blFoNGFwanJ5ZHZWaFRuZ0xDNkJBQmN0c0tnUjB3YU02OHI4R0VV?=
 =?utf-8?B?aFdoSGNVSFFyeVRyeldEUjV1L0s1ZVVjVDFTWHZSc3ZVbU8vYktreDBEQVFQ?=
 =?utf-8?B?SWFWaGo2b2FFRmR2R1g4cHA4VDVjU2lSSDFlQXlHMVNZaEp5WktwajlMREZQ?=
 =?utf-8?B?SjZaL2kvbUJUaDR0L1M5eHBDRmFUeCtKbHJOdjlsdEJZUTBMbE5VenNhbXl3?=
 =?utf-8?B?eWxmWm1hbGVGaTBIRUZVa0ZUSm1BOWdyTklxOW1FVUR0Y2pzbGRtdGszTTZY?=
 =?utf-8?B?RTFra2Q5aXVQQXpkdU1ndjhmRHlBVXpVQVBPZ3dCdEpsaytMbHhkQkhQL1Vh?=
 =?utf-8?B?V3hJSkNHM054ekxrQVBsOEx4Ky9pNHVpN1FuSU1rQ1lhUzFYYWpRVTRpNldq?=
 =?utf-8?B?cjdOVU4wM1pmQytLSmZ6STlMTERaT3ZseEhlcXk4QStZd2o2VFZjdmI5WkNU?=
 =?utf-8?B?T1ZlN3NIVzRBZUFCcjdOMlhCNS8xVVRsZkpZYW1haVRQSUhaUFZIaVprZFRl?=
 =?utf-8?B?THdQRVduQkI1Q0RWanJzZWRFcVVIaWk4RjJ4ak51TVZvRzRsYzliTSs3RzYy?=
 =?utf-8?B?TnhhT2l1QXp1dTN1L3lucFM1dFdUTDdLQ0VsSUNaMWpwZWZBazBUQzNxeXVl?=
 =?utf-8?B?UUhHOUYyd0x0bkd6NHN6Ui9QQ1JhOStqUG9WTksrQVg1ZysvU1dlMStnSEpF?=
 =?utf-8?B?RzNqUU5XQzRqTmJScXVJVW8reUZrQnFZKy9SVEhLMk5HUjRhZ08vQU5qSFdH?=
 =?utf-8?B?eUw1S1ZGY2VBY0VFT08vN1lyWlpkUG5KZnkrbFhPQjEyYjNWcDQ1SnBqMDJ3?=
 =?utf-8?B?dlgwUGN0VWIxVkQ0OVNXaHVKZmZsQ05QVE05dDVoU0U3TTBZWlNtMndPNVlN?=
 =?utf-8?B?NksyZFM1Y252UmNnZlZrMXFJNThSN0sxa2doUmZBYkdjdTNacE4wNVJYWHdp?=
 =?utf-8?B?cjBmVnFQcVc0TzNzTDNLZXdCeGlscnE3NVZXTzNpTnl0L1A2OUVvN014L3BG?=
 =?utf-8?B?ckc0eHZzTXBlODBFYUtlZm9wTjl6bnRwVUxxRWxFRkZNUE5JUlJ2MmJMa1o2?=
 =?utf-8?B?ajU5cDZtYkhpY1pobTBQR1hTK2dJUFcxVmx5ZEEvZFViNXB2KytrRG9jcTRq?=
 =?utf-8?B?cGpYU3VUdjlqOWJpZWZCaFVCWTZ4MVZFalNYVUhkQjlRYXpVK09FS2YzREYr?=
 =?utf-8?B?SEpOY2VXb3F4VG1zemRRVGlRTlFzVzR6SjhnNDE2T3luVW4zYkJIeTFRUDVv?=
 =?utf-8?B?eTIvS2p5cjM0VVBRMmd1SUVLZHpuNDJYRTVCQ3hKYzhrekllYzBDYU5QZzlh?=
 =?utf-8?B?ei84ZS9UempVdm0zQnR5WGpPTDQyb1FLRVB4U3dKNWNCNVc4YXUvSDFhZ2tC?=
 =?utf-8?B?N1ZvUjRHM2xEOFF6blVvUFltR3BxYTB1SSt6KzhVU2psZUxvLzVNcHBTeVBj?=
 =?utf-8?B?K0V4N2hkVE50ZE40RURzQXYxRVJEbzR2M3dyTXdWVEpMR2NZeHNSYmhVMXlx?=
 =?utf-8?B?aDljVWt2R29tSG5zWWZINGdIbmlWQlFOZWI1R0lCZEtuNDlzV0RWMG13ZVZx?=
 =?utf-8?B?UHhkeTFEVlIwUVNtc1Bvdlh2SE9pcFNjSDRNNCtSblRxQjVtWjFpMUw5S0Ns?=
 =?utf-8?B?NnZWWWFkTTRpdk0zZ0t0K1p5VVkzL0kvem1tN1MzNEppR05RQ2dLYU81Tlkw?=
 =?utf-8?B?YUF5dGNzS1FBUWtydGJHK0lOVnZCMVk0citvd2xlclRjRXp6amFObU0xZ3k2?=
 =?utf-8?B?VUtLMlZjdTBtU3dsUjhNMGIrMFNqUG5sWDFnaDBjSFJSdmxvNFF0R2VmTEty?=
 =?utf-8?B?SXZWc3oxWkxDbXFBMDJDNlVENUpIWlkvaFRCZDFGaUNkLzVDTk03cnJJaGFI?=
 =?utf-8?Q?aopHTVaEucN5/8phK5FoNXk=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b95cc1-fad2-4dc6-3fd4-08dac305f8d3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 10:26:06.0862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGx2U6EeCRxvhmQwrGEE8fmUc8QGHzR9rHEN+CPGnbB0gBoYISNV86pyuQQlBD3QRzasK34QNdKuZselUm2iVzbPNgOo4z4u0LxVuIizmPHAhR9qk4LU+bQZ9LoZVokk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7512
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Nov 2022 10:26:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3488

Hi Atanas,

On 11/10/22 07:36, Atanas Bunchev wrote:
> Explains the default behavior of `runqemu slirp`.
> Explains how to forward ports from the guest to the host machine.
> 
> Signed-off-by: Atanas Bunchev <atanas.bunchev@konsulko.com>
> ---
>   documentation/dev-manual/qemu.rst | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
> index 5a4a82ce6..bdfa8f3e3 100644
> --- a/documentation/dev-manual/qemu.rst
> +++ b/documentation/dev-manual/qemu.rst
> @@ -426,6 +426,28 @@ command line:
>      networking that does not need root access but also is not as easy to
>      use or comprehensive as the default.
>   
> +   Using ``slirp`` by default will forward the guest machine's
> +   22 and 23 TCP ports to host machine's 2222 and 2323 ports
> +   (or the next free ports). Specific forwarding rules can be configured
> +   by setting ``QB_SLIRP_OPT`` in ``qemuboot.conf``.

I didn't catch this one earlier sorry. Can you add where this conf file 
should be located?

In the same document, we say it's in "in the Build Directory 
deploy/image directory" (with a ref for Build directory), can you do the 
same (or better if there's a possible ref to the build/tmp/deploy/image 
directory somewhere?).

> +   Examples::
> +

I would remove this line and end the previous one with :: only (no dot 
required) but that's a matter of taste, up to you.

Cheers,
Quentin

