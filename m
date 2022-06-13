Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0673C43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 08:20:05 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.51])
 by mx.groups.io with SMTP id smtpd.web12.3397.1655108400937759451
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jun 2022 01:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=WYjbRtae;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.51,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UzC0uFItqrC+s/e+MBTj86yzKXEDqTCoBXZGCzjxuM+e2T0ZMwbaC0UTj18uETcScaApxboCpSSCEglMp8Kg+WaEmucktl5dsEQ0luVshV0eyg5u5mS7zdKsCd+pKN8t7nNaZXUioZKTeYHR7vDtMIVOFeWJguvkpOvbl/wmaP/7UC4V/LMueXwhRBvQP9UCHEpbU/vkQok5v1mpkZCAfjkciIkCpZPuDCd+bODXa7pLYePrzJxqG3GeqhB/z/1fqzb+1tiNDR+iGp41sKMa5n+ExG6lXydaxddxEELohretiPkaIZ0oF43d8F9TtMCt1vSKkuCBZRqTGCipeArImA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5S1RzrAVRwNBXpg/qHXItTsYc4Uodx3K5LXK8rbz4Q=;
 b=X8HSdHgcJpMchq4M9CPhA8fmg/KizxK7DlTHk+WPhHVHKwjzeUSPwEovBYzyFw/LNIvqXZUkreXy9/Ift5WyT/dwRh53jtMQw5EVSHw91w1f+ttDzjNta8h/2+dYI1lxOKxt8Vav10aX1Ye50b7+eESShQdBQH27/a/ltRfyetJZ53/qOkHrzfC8QeE2ozh5YnOINEqJMLTuR2jmMET1KhEUEcVufP+EOo1aWbBvnPp/nyoGpIfjpKCLzvgnkww7SF6GOSHtESFrYUR6GHePR80vnAQdDFfdOP/FdU4tzqLX5VwEdNCW7v/T5VgVhrWDm3JehnS1orcyar3ujLLJHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5S1RzrAVRwNBXpg/qHXItTsYc4Uodx3K5LXK8rbz4Q=;
 b=WYjbRtaefE4Z2A+rcxRd3MOUosVMlN/4Ls1gZjaRYKadXLVfXNvJJCD53PoNXmA+bU+MWrM5V+F1pPCGTsPkSUOPXaTclcA80x2yB6Sjx6u5qL69Gu/S3muPEFISBZGCHrtt+6tmD66OG1uaqFQJf8qMDF3uMKaH4gWo0xhHNnU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM6PR04MB4021.eurprd04.prod.outlook.com (2603:10a6:209:3f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.19; Mon, 13 Jun
 2022 08:19:57 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a%6]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 08:19:57 +0000
Message-ID: <740c5857-39f4-0dec-d5d7-f1609849d951@theobroma-systems.com>
Date: Mon, 13 Jun 2022 10:19:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [docs] [PATCH] dev-manual: fix references to BitBake user manual
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20220610171701.7654-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220610171701.7654-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::21) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ac68832-89c8-493b-2616-08da4d158089
X-MS-TrafficTypeDiagnostic: AM6PR04MB4021:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR04MB402130467B7CF74BF3F7017FC2AB9@AM6PR04MB4021.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f0bIuyYFLn2gLc9rSmK8LPAp7N/aG4PTytk+z87ARbfhk/xX6NNaFdybJgO1eARBsvThqpxunRpo1Rwvt9e8vK7ZitKx2Py9v7sQd1P86tbjE5WYXjFHrOW/NOnuS2AlGWFIShw21GGbW0RUxFkZ28PDkEIM7ot+bIfaG+xr9jd+9bWUxP6VgMaBDm93H9j3cwHTzq+LRh2lDcpHFI3aPMKWNtohvuwSg0Fo9LQtOMKPjxjL2y3nDNcO1aMIod29kdoYFrNIMecZsB2A2+h7rd+wMcDM+eoPttIGWE4BZEniM+Vd57GW+Vy7AgQl5T43MjUbI1hSi7OrSDOha37l01LR4knO0hQQI2S0D/p/Hp8M2psHumfaZ8K5QBlnpUClB9Dy30vd631zD7z7LsY4bsBK52iwGG7aV+7i31uiEmnROoaFwjPcq/mqglKXRA9G9ArU4hRsMS+kZW9e3fj0aRWHXCNkiJz7HwJDhp5WCqBBYXpb94xiWAKxbdqkXyQJ5L9KZ7dF89o0LKtjsddmvOo09y+1bwaoc6RmSvR5RtclP7NUyfpzI1NL8+zXqTahHTZHUuuCHIb7CAULY4eKfvBKFyLhjR10/MZWK4XhN3xZ6fLeMybyVF9lRza0xekV85JEldaDe83mpdyBJok92+vX7rb6SHHGVo3Si3kosbzMTGYLrgBLNqIrsI6BEjltKf4ynBcyvFnSXSDOdtg4VWkBMZFpIieVO9pPT1sSRe8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(316002)(8936002)(53546011)(2616005)(66476007)(66556008)(8676002)(86362001)(66946007)(6486002)(508600001)(38100700002)(6512007)(26005)(31696002)(6506007)(44832011)(2906002)(83380400001)(36756003)(31686004)(186003)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bERSRitvWlBIZXg1QUozQy80bVhCc1BoSlZwamNtY0wyM0FCRTFDakFOakFZ?=
 =?utf-8?B?djdEalFycnNEdUpPOCtTMTdTMmRVd1BkTy91V1ZwMGJQRzh1VGxPYjRoSTlt?=
 =?utf-8?B?WFlkQ2pJNnFoS1A0dVkxN3Z3ci9VbEUzcW02ZWRLUUIzYUx1V0ZjMDFCTm1q?=
 =?utf-8?B?V3NGVFNQSzczaHFMbXlqbVR5c3BubWwreEJNMlpjWmpzSENKc2F2N2ZTaVR4?=
 =?utf-8?B?MnY0QVJWdjNVL1FoMVkyOGJOSGpKUmtRTkF4VU92RlFBc3ZIUnVkR1YzWC9J?=
 =?utf-8?B?L1RhMzMyR1huL0lVeCszNFoyWi9kelJEVkw4SGpyNkZZaVlZNW8rWkRrQWhS?=
 =?utf-8?B?L2hFMGQ4RENQakhoWnd2NXFlYzlXWEtyWG9HeDdoTmlOTmdwNlk4bHRRUHk4?=
 =?utf-8?B?QzJ6b3RQZjVsaTFLbGhpNnFaa093QVZpMGlQQlJIZnUrK011ZFBXUFR5MEVt?=
 =?utf-8?B?aWZCc0xMMDhoRzBHSmYrZlRUZU8zb1dGdFZ3eG83RnBlU3ZEM3pCUUVGVjhR?=
 =?utf-8?B?eThIY1d3Y2MrUnY5aUtvMi8xT3FMWUxJTFFtU3UvQnM2c3Z0SDMxanNmRnp5?=
 =?utf-8?B?dytsbVF3MW1rUkJMUlNoekVTamR1eVVZcVc5ZHdRa1h2VDQ4cy9XMFpVZnl6?=
 =?utf-8?B?RG1EVkRjTXpXNHl4K3ZjRVcyZVZISkhlRmV2a3cxL1dNN21SMDh1SHMzdDAy?=
 =?utf-8?B?MmpIQ1JqOWZ0bWx5VEZKSlFEaXU5ekw1RkRzVHhoZERpbUp6eVdNMi9FK0d0?=
 =?utf-8?B?cGRIWjNlamNiV0VzS2JzekgxeTg5eFB5eGJvWVdydzgwSWo3U2hTVGlJbEtZ?=
 =?utf-8?B?ZS82b2g1Qi9GNU5QbE9GNzZ4QzhUZUl6WmVPM0RGY3Z2ZWpRMU9VZllxQnZ0?=
 =?utf-8?B?VjZuNjJ3Rlh6Tkl6ZE1OUVQzWVJuU01VeE92b2EvdVRnaEM0SlprSTZabnZQ?=
 =?utf-8?B?OFJSNGdINTJOQ2dRSmt1U3BzKzlkSk1yeVhkdGJtVmpQZzFKaHhGRVpLVm1t?=
 =?utf-8?B?ek9zTXFLWjBZc2J6V2krdjl0bEtKWVZQRTRmeWppT1MzVjhWWno4ZCszeGd4?=
 =?utf-8?B?ODM3dU55YUl4RVNZNnRGL2dSWDZaVEo3K09hWUppUm1odWlkdXpTaHpPZmpX?=
 =?utf-8?B?eDNkNFlhTkRHN2hsYmJ2a0FZWWNjakNRS25mWmFqbmR6Q1IzVXBTQkVkSGNv?=
 =?utf-8?B?K0hncWJNYUl6TENDVlpGZ3I5SUgrUDdxZWYzOHpyOU5GRVVFZ1k2a2xIaHQr?=
 =?utf-8?B?dGVsWEJtU21HQWU3aHRTOS8vbG9Kdkp4OVQ3YUYwZHZ1VGJ4bkM5bGQxZzlJ?=
 =?utf-8?B?N3FEeVA3K21mVEdhS0dCQ09DS1U5dno4L084aGw2Z2NZVzJUTWtlcjFEM05s?=
 =?utf-8?B?QU80VVJMMEUxZVh2dEpISUlEWXVoQzZzNHdjUXMrRFR5UFRTTldZdlVId3B5?=
 =?utf-8?B?SWxFM0YxQ3R1OGFneUJEWW9zdDhuSlM0UHdYNlppeDFPajY5TjVWY0RtdU9v?=
 =?utf-8?B?V3pkWDJKbk1JaEcxZnd4dFdJYmFXVE5WVTZCb1F5eGhIQ01XYllTYWdvNmhq?=
 =?utf-8?B?VUhRVFYrUWhROHpkbGlibVI4QnFHQUY5QUpSVGd5eVNIOUZEdlNjWDY1L0hi?=
 =?utf-8?B?dzVEWjB3Q0k0SkZqSGl5NVZvYzRQcG5XYnJYaS9nVnhjV052dFdmb1NTb1Rt?=
 =?utf-8?B?VEo0eHpqaFR6SXQwMmx5eWdBQjZ2VXE0Q2Y4bzViTnpRVk84Z0pwL01VOVpJ?=
 =?utf-8?B?WVBQQUV4a2I4NVBXaHFlYmtDSGdoY1ZvZ29Vd1RxVWNKMHU2Sm1IWUdUd0dp?=
 =?utf-8?B?QjNNcTlCMUVHMVAxUkM3YW92Yk9JRm9FU2FZRzJ1NmhOTURzQXBIcUorb2Vk?=
 =?utf-8?B?Ny92Q040RUJyWXN6Z25PUmNod0t3SmMwalVMWTFGQ0puSnlhK1dYOFUyUzJD?=
 =?utf-8?B?RXFSek5tZ2dVTGNsUlRWQ3FLanBNNHpkVDZrcmFzeHNTd1FGUTFNc0RJVTRm?=
 =?utf-8?B?Y2ZFck04c1NCN1pFWlJqY0F0a2JmQ2NrbzJFOFNuZm4rTEZ0SndvY1Y4dlZw?=
 =?utf-8?B?eXlwN0c5dVZmM1B1WmJnNkt5ejNTcWJSeUR4UnJ3b09lWEJodzE4bVY0bjRK?=
 =?utf-8?B?eVN6YXRVbEIvMEo1aXhyaFI3UjB1RlVSNlBJTElMUzF1enVlZEFhYVQrcDJW?=
 =?utf-8?B?eWJvNVd4aXN1UVZDOHlaVy9ma3FiWmM1SVFDN1BSdS9RcEZLei9sMXFnZVNF?=
 =?utf-8?B?ZFo3SktYR2M2ekFHY05uQTF0RHpDU01VNVQreDM5a1BNWUNsUDYwWko1LzdI?=
 =?utf-8?B?b1RoZStqTW8vNmYvQ1RjUTJoYkJvMmFaNjNyVGtWT3UyVTQ2dGxteWxTS2tL?=
 =?utf-8?Q?QYxaBpcAoKhc3WHeCKLlVhTpZ3SRb0NBjNQM9?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0ac68832-89c8-493b-2616-08da4d158089
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 08:19:57.5750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nghgcL8rTIayhE12VScowNPinOtzqMmccmxHfG+Ehi2trQ2VRnkWKVn8tgOY1UujW6Ck4guW3YkVs88CwYIxWc8D79wubqz949xARPWa6pteSfRoMLOO07ud5fNfQMaH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4021
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Jun 2022 08:20:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2985

Hi Michael,

On 6/10/22 19:17, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Fix a wrong reference
> Add missing double quotes in a reference to a chapter title
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/dev-manual/common-tasks.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index ca6d594386..7b9fdac10c 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -2563,7 +2563,7 @@ Recipe Syntax
>   Understanding recipe file syntax is important for writing recipes. The
>   following list overviews the basic items that make up a BitBake recipe
>   file. For more complete BitBake syntax descriptions, see the
> -":doc:`bitbake-user-manual/bitbake-user-manual-metadata`"
> +":doc:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata`"

I don't understand why this is required? Sphinx should find this link 
just fine in the objects.inv from the Bitbake docs if I remember 
correctly? Is this just to have the same "convention" (since we already 
have links using bitbake: in front) or is this actually fixing a bug 
somehow?

If the link was broken, we need to work on running checklinks when 
building the docs so we're aware when links are broken or outdated. 
Well, it's anyways a good idea :)

Cheers,
Quentin

