Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B7BC433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 08:15:05 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.54])
 by mx.groups.io with SMTP id smtpd.web09.7253.1666253699211744225
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Oct 2022 01:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=GyGmCh2U;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.54, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUINjHf7qNwukWC9M3PH4UFAbCcgpEaZWiUKxAdILyh6w1UM8eAUCfKN7jCoEnv3RiUAmy81Yowy/TaqT3gsfhVAgBx7hA0AtpiKWB2zCPELg/2Iwwpq87UeLiVCBNQ36p1hfwrVWJ/kAoJ6drUqS/esX9VrpLGwx9/1ml24LhQX9my5uiwxweXulzjFD8iv7Q7RshkxLVnebhWEzIchkX6Jbbr7AQvdUu2ByM2sIQKIFyzz61DSg1WrlK3l9vwcRPAkXnOdCBuz+9880xKYaFBpcK/XfNQiaoKpSmsCyz6R8Yd4ZZr/9gg58zMI+cvFdE/EeAewa0AErd4N2o/+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIVgUdAF7q1csUkUEIa2c2oIcwEcwOCqRn1AqjiL4qg=;
 b=WPnH/px2ajJbyoM6hKxcMcptHF6YZxQp2vG/FGJHxPbWQ2H4p83tSB8jF2t7qFEr2ryTwHuArxoF1D7sgaS/00kQmgeBTQpc+LSjkDPk+7KwZ7LZIeYLylHLXApEyRutIIR+bG5PtLbG8+KqOwIaq59teyqdZSOk4r4a67KsR99Bf2HixeBNzbprnPNU0yrcThyevO3eurVd3krdM8fRtMxQoDb0SLiOaY4HpgTfQX5U3mtwNsFlWvi4vn0kbYcUcWW1pZcWRd9ICHlCkB2x7vsWPESUFuBRKRcTd97V/mJSYnyT6E0fYXOqoN1RqSzgWt3OUMta1W07aBunUhhmpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIVgUdAF7q1csUkUEIa2c2oIcwEcwOCqRn1AqjiL4qg=;
 b=GyGmCh2Ue15kfBYJwYLWcoxonFN8taaPtFLW1sqxJ2eVTGjDZLNJy26e4n/RjlvHhsNFShTtK9xvDCCe0Sea3Bu7666ZCfSd/lzsFV0D+k0f6qwNWiYbWBIdCoP7Y6aK5nazc0DswwTeWn7xZF4tSKIw9luwGmxW+6cBg9uofLIcTWx0CiJAwQKPYZ51jXzdXouNv+t6f0UJv0AyOUZssI7XKWIffbJcdL//eZKFeh5RKirjpcJ/WMjXMpaHiTqi2I72F9gBri9Ht6VmtMxCh9r9E3/MHSqoBdvDTzap4WphJxIezLfcavAXYhyxYwdLnepQ+iO2K6Ct8Xu2ZHUV2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PA4PR04MB7565.eurprd04.prod.outlook.com (2603:10a6:102:e7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 20 Oct
 2022 08:14:55 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 08:14:55 +0000
Message-ID: <d9f68cd9-8e66-dc20-b86b-3248c03bfed1@theobroma-systems.com>
Date: Thu, 20 Oct 2022 10:14:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [docs] [PATCH] manuals: updates for building on Windows (WSL 2)
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20221019132402.48293-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221019132402.48293-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::21) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PA4PR04MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: 95560a36-993e-4bdb-3855-08dab2732bc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/eh5lqFK9ANKGMNX/BPH1cftCB2cu8zzQUJyjWK+Yrt+WmpeHwI2VesAPfZjbUysBJSSl+xdORPcFeNUokB1EFqIXtkvpJXPsnTmKgCcb3h8gdt+GiF0saesmqQGQvEoI2WWaj+C9nIxzVgz12rybHibRrJO33qprpqccDq2kLT6xbCkjp7ORwaXLZfHQbKt9fDG/cCfvse+DmNvn6IbhHsn7RDIVA8bFJH9ohc6hGpyreEBWaWC444NTryAmsxBf5FZBBudEjilydtBIhMHd9LwnqKn+Rr5qlAjj8juZfKX2UjVxDUpVNUZ6xY0UbSzMJO7PtvGW0RJn9l8UCPnZ03Rd2uMHXY0uurvxG5VvauF93p70pOtoqzA7t5yH2hkvDZ+p94Rb76gC0OvB8OTMTdlU/stw2dAl6jCZcEBa4KlH74o4rbppKDa6W7VPxh+1z611o53Y8XKSbeF52O7Rj+kjGJ/LUw4Fry7EYkuvucCPkHWFUjBoCJAgWFw3bB5zxNiph8KfTuliifx6ibFNvbZYSHpT8JggwZi8aXT1boX2Rig7LNdWZWiJKw/+XdxYfAYBBCBuDYOvIz+6f37I3uARHSmYko44xBRFUQiDydPCquFx2IhF60jemlHHNoLIlzyEnzyFNTJeLLq99W+A8aRmtJ6BhO1fbyAOV5VfiApWXLajiq5lcVHigZ0ouVhXoDTPh8FLnX+97GNfZFgsHjp2cZ3wPQLF6iKt14fWgZcwguD9emJqI7sCJUwA2tx0Ehc7oodfb8+zcPU2GKWfWJRhD6Skv1hx3sGIfaMheM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(376002)(39850400004)(396003)(366004)(451199015)(2616005)(186003)(6506007)(53546011)(6512007)(26005)(83380400001)(2906002)(15650500001)(5660300002)(44832011)(45080400002)(316002)(8936002)(6486002)(41300700001)(478600001)(8676002)(66476007)(66556008)(66946007)(36756003)(86362001)(31696002)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NjVoYWNzeStxUjZCWjkwd2tHZ2l5NHJmeUxJRi84WllJb1YxTTVERkFmL1h6?=
 =?utf-8?B?UHh0RHVqRTN1RC9HbFVqY2J4ZmZXUkt6aDZxZDNVQngzaFNNWHhTellkY1Z2?=
 =?utf-8?B?elRLOFdRN1AyNHN4WGNCTEVlYTZMN0FnNTE3UExhYlhkeEJhcUZ4V3ZKRlRj?=
 =?utf-8?B?MTZ5THdzTnBNZ3ZkT201NThDVTNiY1MxanRyUG43Rnh5ajBSOUVPbE40cjZh?=
 =?utf-8?B?ejdJWmRvUExRVzBZWTM2bXJxTFVIaTg1SXJwTVZ2MkZsMEZjWWlOQTJ0RjBX?=
 =?utf-8?B?OGxCNXhhY3ZrdithU044L0VLSmpnVDNmc1ZvTEJKVHNWVUxiWjRHYzlsUkF6?=
 =?utf-8?B?OHBMUlhLUi8ybGp3Yzl0N0VzcDBtY3EvMUpwOFhKcEVXSU42WHZqelR0bWNr?=
 =?utf-8?B?NXRaSVRhSnNPR21SOVB3NmJ0SUdHUy94MWFILzkwTWFSS0FtRlVJbGk0Wk84?=
 =?utf-8?B?RWZCMWQ1Rk1lV0JXRnpuaFlQbmR6Nko3Z1R4aUs4a3Y1bzZNYUxGNWhzU3ZY?=
 =?utf-8?B?b0tZNTc2VFZSRlY3LzVsUkd0TTVCc2lWVmM2VXR0ZzM1aGNrdElhVUlzL3hQ?=
 =?utf-8?B?NDdqaDNoTEdLZjBiRU5wNU1adC9vc3NCajZEeEI4am1WbzdiaEVnVWxLWjN2?=
 =?utf-8?B?SFBoV2dzTWhtdGdhUGF3YVVmdk1oME5QTjBQb3VlK1liUW1TSk5rU1ZqWUtp?=
 =?utf-8?B?U01BSmxpOEk2d2FiQ0ovWnErdTBCUlZOODNqcURnNldSSDVSMXBHVEptUjdG?=
 =?utf-8?B?bmhIRUs3NVFsQ1E2YVJvc3RGTkgxVitLNWxYdmEzbWRJTWpLU2VZakdxazgv?=
 =?utf-8?B?UmdIa1VjazFTUzVRWjZFckNvVHk5cVkrQ1JDemxENlhjUmRVTktiT0xVKysr?=
 =?utf-8?B?OEQ4VnQ3bnc0SG1RQWZZMGRaWEVTN3NVS0l4TFQ3bTlkMGIyKzBKTXM5Ujcx?=
 =?utf-8?B?bGE5ZERtL1RyY2VoYlV5WEtUSzlsSmhnNWdDTzQrbDUwZVo5aVVNU3RXeFU3?=
 =?utf-8?B?MU5oZzBsZUtGNmxvbllUcmxOOFU3bWNsSUQrWXBuaEwxSjIxNmsySWo2RjNp?=
 =?utf-8?B?ampzOG02Z01mbE1jcnRRZlJxYzBlR0E2NklJWU5uZGpURnk2OG9GcTlBK0dV?=
 =?utf-8?B?andxWllGalVpQXFEVDFYRXl0aTFTaUU0Tnd0aThxUGdDM0hYRy9mTGFwUTBw?=
 =?utf-8?B?K2MvOVI0VFYvdEh5bjQ1ZTMvNi9DZlNzelBKc0pMMThDR1FHWHJrei9zM3Jh?=
 =?utf-8?B?OGtHVTA5WnNzVm81UTBnTkpCQkkzeFVmNFdYRTJYdWdxU0hHVGQzV1VwMVZa?=
 =?utf-8?B?d3JLdGQyb2gvZDdDTTUxWFFpUFN4d1EzdzJrQzJ3UGFobzdTbURBYWdFTTlH?=
 =?utf-8?B?RzYzaFRPbmRpSGhINXRwd0pTeVRKVmJSbGtpUkM1QVB0ajFmdFdGdFVSbWJR?=
 =?utf-8?B?akJhYW5zRkl3U0FPVklteXVWZ0ljSkVsYXJKcjlMRmd3QTI4KzZlWVpTcUU2?=
 =?utf-8?B?bm9sWlhIRmtwZnhaT0lKWnUxY1NaY0xqSGNpamExY2JuWTlTeE5FL2FRMEZx?=
 =?utf-8?B?YnFPQnVJYmxHVVNOZzM0Mzg0WDFKVy9KcDRQaXhMaVRIcnpqTEtWWHBEeGZO?=
 =?utf-8?B?VStXT1AvZUx5N0hLL29HR1c5RGFETnFFaW91eFpEa2t5MDN1V2tvVzN6V2RP?=
 =?utf-8?B?WXB5bDJJQm0xbmpsQmVQTUxxQVluTGplNW1PbldsZkRvU2F3UDFrOVZIVXVU?=
 =?utf-8?B?U1BkdWNNanpZMnJQSG1ydWNZMTU5dyt0S3ZYOWV0VjNLZEpncW83TWNZclFp?=
 =?utf-8?B?WXQ4K2RrMEtzSGU2MUxmOGxUQmdkeU9IditLeVNhQlVVQWp3RmNWeFFTbWNr?=
 =?utf-8?B?Mm5FdUhSRDBvNmswSlRSVlQwQkVNdEFRQmgxVGU3bHNiVTBWUEkrRVZrWEps?=
 =?utf-8?B?Qy9aSGxMN2pYcWg3UEdqOTVWSS8xZEpHaGNEUFB5cmN1dUZERXZYY1VaaUVN?=
 =?utf-8?B?WVEwNTRxS1UxSzhEWStlL3ZTYlBkRGswTU82d3ZhcTBkVGV3TExGK0VaZ1Nt?=
 =?utf-8?B?bW9YRGMyR0ZZVGV0a3lVZG12TjNUNzFlaWlLUUt1bE9PN2lyN0RmYm13SVVm?=
 =?utf-8?B?c0ptVGY4TEo4bEhRcWJoNFNFNHZXSkdJTDNBeHJ3d2RkSUgzNCtLU1BMc3JM?=
 =?utf-8?Q?tq9/vssJhn+2vXRJ2Koe/l0=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95560a36-993e-4bdb-3855-08dab2732bc7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 08:14:55.8380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGJM7lLTqjWBrY/YNRhwjdbNavMGA41/OAwXUdnelEvt9Y1s8Sdw0yMsf9GPm3T3NhQdfDyndmOpus1lwF9Y4+1CuBDSTNGHxh1R2RybQXzC8TxCr9c5sjeJEjKMs6Mj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7565
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Oct 2022 08:15:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3392

Hi Michael,

On 10/19/22 15:24, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> - Use the Wikipedia naming scheme: WSL 2 instead of WSLv2
> - Take into account Windows Server 2019 and 2022 which are
>    supported too.
> - Improve some explanations
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/brief-yoctoprojectqs/index.rst  | 17 ++---
>   documentation/dev-manual/start.rst            | 70 +++++++++----------
>   documentation/overview-manual/yp-intro.rst    | 17 ++---
>   .../ref-manual/system-requirements.rst        | 10 +--
>   4 files changed, 50 insertions(+), 64 deletions(-)
> 
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
> index 7ae0ddc349..0dfb4cc7ff 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -25,18 +25,11 @@ build a reference embedded OS called Poky.
>         in the Yocto Project Development Tasks Manual for more
>         information.
>   
> -   -  You may use Windows Subsystem For Linux v2 to set up a build host
> -      using Windows 10.
> -
> -      .. note::
> -
> -         The Yocto Project is not compatible with WSLv1, it is
> -         compatible but not officially supported nor validated with
> -         WSLv2, if you still decide to use WSL please upgrade to WSLv2.
> -
> -      See the :ref:`dev-manual/start:setting up to use windows
> -      subsystem for linux (wslv2)` section in the Yocto Project Development
> -      Tasks Manual for more information.
> +   -  You may use version 2 of Windows Subsystem For Linux (WSL 2) to set
> +      up a build host using Windows 10 or 11 or Windows Server 2019 or 2022.

Matter of personal taste but I would have written:
Windows 10, Windows 11, Windows Server 2019 or Windows Server 2022

We could probably even say
Windows 10 or later, or Windows Server 2019 or later
since that's currently true and may lower the documentation maintenance 
burden (provided Microsoft keeps on shipping WSL 2 in later versions, 
but time will tell :) ).

In any case,
Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks,
Quentin

