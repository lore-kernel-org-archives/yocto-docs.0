Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AB6C3526F
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.82])
 by mx.groups.io with SMTP id smtpd.web12.1951.1650357778260233060
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 01:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=P2/jmzKF;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.82,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k08hm48aU1pmS0rYw12Mt1bXaKmvp43TVMpJ6CyKCDcI7jBwTaJk6E6rrixXaL/lrQJRn0okeDgMo6OQ1c1esskq95ZfWb0RfjJTq4sGJMv9MxOQgxnjgZMc3ccSSuAwF3a6fj96h2Ki4mPFmWBN5pqCMht8oSgkj2vfASPGyeq6FEcXkJkynIcJdZY7wcVkeU7Z+DZR/uuP98m6l6hF4EenqbuaBjzd+EwFAiUPiS1RQa06cTNOb5SSlN+ELWWC8qujE6QdPskLxMUGTmQk8W8DbLIFVP1uBnt47zX2Cb30l6Wv2o3zjpsRmNvG9C0xDFMzYaXDJ1MmSGGpoe6ycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKpPe0zl+Sw0U7REaqv/sOol0Yp9g6XSrOOLbY+fIdw=;
 b=evc38lqA0uMjoY4hkOE7s5Oo1tqg9zzqvJI/XFJ8+MY60y1ZHqaLG1BRIEHx2zs0xyHEMnMbTzuX31anXaZWnrgaIisbWUHGCqnZmC1qysckxUsxhWq8UkcS26wTFXUmin8IPNOsMDuWcDwfpMdi3VZ5eFeCbn+6gsXLBrNMfDfDhBMFnKb8gGLfiOePs//Z00WCMpJLR/00LoeEYXBTmE+8NVLMpehwVp1k3XLJxPnWCQtVwcZuBoNFbs/0nFZ2k7QXkepJWX7xREdCtc8cA3Gcqs0zQ8eEZs0QZBVDF1+Butfjszwv6dQp5u4uRLlpc0qv1ByzenGcryNJdXOtQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKpPe0zl+Sw0U7REaqv/sOol0Yp9g6XSrOOLbY+fIdw=;
 b=P2/jmzKFpkbzQziLVl6s7M3FVgfM5K9aIq4CwGuKoOzeLdhy7kM+PX6Ek9p0QJOfLbfTewRtxN8C2SIcTV77XkKHaAUEKbIREPdr6iaaPXuGwtPLzB4zBNs+AB5faJqaH1wyjDfsc6g1nNeXOCKvkSwn1TzggOYJ/44aWlKCLkw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AS8PR04MB8979.eurprd04.prod.outlook.com (2603:10a6:20b:42e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 08:42:55 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d58:89cc:5b41:f13f]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d58:89cc:5b41:f13f%2]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 08:42:55 +0000
Message-ID: <c755b5b0-9132-63ac-a893-d13aa5fc2c9b@theobroma-systems.com>
Date: Tue, 19 Apr 2022 10:42:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [docs][PATCH V2] Improvements for gdbserver configuration
Content-Language: en-US
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>, docs@lists.yoctoproject.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
 shivams@gmail.com, john.kaldas.enpj@gmail.com
References: <20220415155838.375378-1-sundeep.kokkonda@gmail.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220415155838.375378-1-sundeep.kokkonda@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0152.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::36) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b748a8a-07c2-4228-0032-08da21e0990b
X-MS-TrafficTypeDiagnostic: AS8PR04MB8979:EE_
X-Microsoft-Antispam-PRVS: 
	<AS8PR04MB897987B44F25805E67787EFAC2F29@AS8PR04MB8979.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PCY/wAqyEv2KLBfzSKtJWqj6602A3J76eoKRyoQdS+H4xORgFMk2TqFb7QGKrRFQ76TUPCQvhaPAIp6B7IlMJ/xEo6hZUekXEj7SWLXmPIdkKFPMtNGxo3V/f0+Zg7uNbzuiiGcHUCRqtfQWli50E6wJUWeGA3DoqPccoXb0ZLyHuP5sfRNgipSg0IQWz2aRTw8+GJW2aY0JWV904T9XKgMUPhEsjPog3bdwn9P74Qedpt1D4VvdIn7LRDIvbTkmqmnfnjWcNks1nqpG5RcEhtwFgCE5GTD5HS8rbP/mSEhzHIXM72YdAc0+JiprzOGHv06t0V7ZBKkGSXzPWRw8m1ilT3ovtHtOvgHGl8wG54WVicqziIpXwx7kng9v/0QIyWq864yINnYtjFxcVWwvNO/rRW2h0RvwjMPfx/lCg6lyBWj3vPQwkybZxoKn/o9Zif8zljxbBsAedJ9cTK5lcI7uBqAWr/wEFF55WdxhScQX2wTMM9QH6mLx+4Eqzt13xMOmyTR8jBlSzdNE9TEIZ18wC/AjGCFxh8h4RcBemHodujue/2pgn0fOhRwbW3SFeG0ZQpIZOfhJygFqYcpzIX18G3ViHxLBJ7TbtDaCCGzs5pZ8x3pNSNbljpp42oEghUas0Y3J+PQ+9pGXu9cbB/qM4ewq96HKhgEn1Ds7NhhJeWSNl85+PCG6Ov0aiSFNlA7kqXT9Dy1esS2hA6FSVbs8dM/ZN6BEiGa677ELi2E0Mi79hMU3x/tiUaUczbf0xLAB0XqR3rKOlS9sRG4S/blYnhtHsDV4zRduhtBZ8hWXot5k9rZXW1RYIdjpRhE6pvz9aoffZfyDX5HH4Kc0OFpgdcbbxLei9p7549Az4NI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(2906002)(8936002)(4326008)(6486002)(966005)(8676002)(66476007)(38100700002)(316002)(66556008)(66946007)(31696002)(508600001)(5660300002)(6512007)(6666004)(53546011)(44832011)(86362001)(31686004)(186003)(2616005)(83380400001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TXpUZ091d3h6R2JMNlA3QytUQmpHcFQwR2NsTGFzVTJSMWJkc1JJRzEvR3c5?=
 =?utf-8?B?QkVrTldMK01STmQ0YklZbzRzOERERnpnaDVjOWxvYkRlTUJlZTBoY3Z4ME1H?=
 =?utf-8?B?Ym1jTURUWlBKRzVxUW5LOS9STlRHTGpiR1dQSEZIc0ZjekhNMUZ6SGYwQmNs?=
 =?utf-8?B?d3F4aWFmd080ZjVVVlE3cjNZT1pJQTBiZ3I3cEdPOXI1cmtJanZJbmFjaEM2?=
 =?utf-8?B?bGJ4U2pEY3NsS0cxNmQ0TTRvcXpXMmlDVTFOZlZRS25IMTFDbitRMUU4SnVD?=
 =?utf-8?B?VGtqaHg3elZ2ejJ6c3F4Tm5ldmdZZUJVQmZ1aVF1SXFQRUhTdFJUQi9obFdr?=
 =?utf-8?B?TXNkcjkwNlVBY1ltVE5xZlMvNUtkY2J1S0xaZFBYcWtheXdsTndiblgxRThU?=
 =?utf-8?B?SHIvME1zdGlGY1p0RDdTQjB3TjBYU2xKT2hjbjN5QU1MK2tENlNOOU4zdGNO?=
 =?utf-8?B?QmhsVTdwc1F1WW9Wd0VhVmpFRmRnaFBWLzE1bHgvQ1QzSEpaMUdYbUtFQ0JC?=
 =?utf-8?B?MUdPVkJ6THlzbzZtQlovaDM3RVFXdHlhOXE2U0pnZjJIL2RxMXlWQ0szUXlX?=
 =?utf-8?B?Q2lscENwbkVuSVFaR3B1a1pYTlFQOVI5ZUNFZWVtdGZhYW5sUFNnR1ZrbVdK?=
 =?utf-8?B?V2cxSzhPRXVHNS9oWnhyYVNZZ3g3cWtMQ1BQZStyV0xKMUM0U2krMWc0cnUr?=
 =?utf-8?B?SGo4K2lYYXF1TEh1NnJYSjE1K2lkZmJkTWpIWnJHUUxLbml0dlFLV3hkZnRo?=
 =?utf-8?B?Y2NSeDdERWlLZUxKK3BTUXI2bktjblFldjRZUDdKYi9Pc0piRG9KdmN3V1NN?=
 =?utf-8?B?UGJ1RjllVElpR2tFN3d4UmpqbVgyazdpbFdRdlJzZ1lMd2p4WlR6U0dUUUVx?=
 =?utf-8?B?cVNlZ053QXhxZHZ2NUU4T0Q0MXRjWW5XOXpQdFA5TUp0QWF5dkR3a2F5WGZP?=
 =?utf-8?B?a1VqbmZpK3RFUy9oZnJXVW41VnNDOStkRUd5VTFuWWZMeW00M0s0eU5jajlT?=
 =?utf-8?B?REJRRTBrQUhNWmJOd21USXZxTDFGRHFzSDM2R0dwbWVqUVVmcVNGNENoY0Jp?=
 =?utf-8?B?bFdwaVpLM1JPU2tVdFIwTFVRRkpqalRWbGtOcUp1L2txY1lreVFpZS9nUlc2?=
 =?utf-8?B?MTNLYWNVMlBhSERGOFlsK0VEb0owZVJBektETGNaMlowR0c5N2ZvRU9PeWgr?=
 =?utf-8?B?R3ZGbzdHWXFzc3FKS0tyUnRoSVpCZ1kwUmpkWGx4aFlZTHc4YkZCTzNFQzU1?=
 =?utf-8?B?dFd2TTUzdE9pRUhBYmV3ZTRRblA0aEoyUjRsYjhETzZNUmd4WVQ2RTlWcUN6?=
 =?utf-8?B?Q3dvMFdSSC9wakhVdXZMVjRIWVRnWnR2Q2t5S1d4MkFMd3JoYWJtYmJxUk9x?=
 =?utf-8?B?Q0U5S21NY1pyMENXcTQ5Ui9pMVg2QldGYTFMV2ZSWHJIeDhMSVhBdDIrZWc0?=
 =?utf-8?B?VmJCNzNmaGN1UlQwQUgwa29PN2NPd2JtRGZMc2YyVElOamM5UlBsQ0tuaXlF?=
 =?utf-8?B?UUtYaEIxd1ZqVG83dE9zd1cwQ0hTb0VKd1QwTjhuN3phbkxSVHhQZlFmUElv?=
 =?utf-8?B?Y2xLb2FLQWdZQStkUkRoVU04S3cwbXlQS3ZLYVBhUVozRFpPaGQ4MGhjS1BD?=
 =?utf-8?B?U0RpTmlKQVc3UGNBdmVLSjh3VWlyOSs3U003dlZOTitXYkJZNForSG9iUm1Y?=
 =?utf-8?B?MDNXRDA3TkZsTC84NFNIRC9MT2szNlF3RUpPZkJRNzZXV1JTUFJQRHU5Ulk2?=
 =?utf-8?B?c2J6WDNjN1A3ajFzLzRtK2lJNUR4bWFQT1B2TjRFZGhTU1N4c2w4M1BjQURl?=
 =?utf-8?B?Y2FQenRLUDh6c0xkMzZtNHpTK1NmUzlLSmExUTgzT2VBUUZCTGFHNFFEMEFP?=
 =?utf-8?B?V0RsbGtYQ0FtQkZ6Q0RjWjczOWE1US9SVzBLZnQ0Ky8rVHRZWjNWeWJmN3hB?=
 =?utf-8?B?MDhzZlZ1OGY3TGhiYVMvRHRMcW5vWVhmRFJ3cDBlQUQvSGtpZkE2NzRtODJF?=
 =?utf-8?B?SSt6L2lsRSt3SmhxYm5YdlkxU0xVWW1BNTd6dWlwaEtzRmtLV2NKakw4UWNj?=
 =?utf-8?B?Wnl5MkUzS0xVc2g5SG04eXNvdDhjTjZBZ3JjTG02UUkrN3JtRXVRU2VjREhJ?=
 =?utf-8?B?UEtMdVZHOEpJQUZpcXY1U0xGT1ZCb1pNSzJaV1JIaytVaUhsdG5JS2VMdzhn?=
 =?utf-8?B?WGRuTzFLbHlVUHFnaXFzcklEZEtyZTcxNkhMUUlUY1dSOVNqbzUxL3haaVBz?=
 =?utf-8?B?MHRxUTZhZjA3Z0xsUklQdWtEelRKTGxLOTdQbnhvUUVzOVowM0JNNVp2bmNZ?=
 =?utf-8?B?V1V6bXhCWCtTM3BPOTNLS2czV3M4TlNrdWhyYjMrS0hHZ3lhSzZzYzRBbVhL?=
 =?utf-8?Q?p9R2RU5hFbK8YnyRMIo0gcpkp34sLUCsbhJidM7qUPsz/?=
X-MS-Exchange-AntiSpam-MessageData-1: aQS0Y1ezQN9Y3dn+65SBphGspEcNrd/Hv5Y=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2b748a8a-07c2-4228-0032-08da21e0990b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 08:42:55.1622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 N3Uz/WlXV1qFkAp3FEayocUPuGhvGzHbAqurrWFtUnlfcvDts1gsuAOmqwhDOum7k/kPLtJgC4JH6xVrwpKOK2A+TMCgvrjrNOvgNXmhYoGCEwl860thm9em2EMn9GgX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8979
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2784

Hi Sundeep,

This looks like a diff applied to your previous patch (the "v1"). Since 
your previous patch is not merged yet, you need to create a new patch 
which has the old content but with the diff you are sending in this one 
applied. In short, both v1 and v2 in one single patch.

This is usually done during development by using `git commit --amend` 
instead of just `git commit`. It then "merges" the changes currently 
staged by git into the last commit.

Since you already have both commits in your git history, you have (at 
least) two ways to create the new version of the patch correctly:

git rebase -i HEAD^^

and then replace `pick` by `fixup` in the second patch and save+exit the 
text editor.

OR

git reset --soft HEAD^
git commit --amend

Please send this new version of the patch as a v3.

Thanks!
Quentin

On 4/15/22 17:58, Sundeep KOKKONDA wrote:
> [Yocto #13722]
> The Yocto bug reports a few improvements in the gdbserver configuration which improves the configuration of gdb more easier for novice users.
> 
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> ---
>   documentation/dev-manual/common-tasks.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 0e989f78e..2301e3ba0 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -10181,7 +10181,7 @@ debugger.
>      an image recipe::
>   
>         IMAGE_INSTALL:append = " gdbserver"
> -      EXTRA_IMAGE_FEATURES_append = " tools-debug"
> +      EXTRA_IMAGE_FEATURES:append = " tools-debug"
>   
>      The change makes
>      sure the ``gdbserver`` package is included.
> @@ -10235,7 +10235,7 @@ debugger.
>   
>      Install the SDK (if you built one) and then source the correct
>      environment file. Sourcing the environment file puts the SDK in your
> -   ``PATH`` environment variable and sets $GDB to the SDK's debugger.
> +   ``PATH`` environment variable and sets ``$GDB`` to the SDK's debugger.
>   
>      If you are using the build system, Gdb is located in
>      `build-dir`\ ``/tmp/sysroots/``\ `host`\ ``/usr/bin/``\ `architecture`\ ``/``\ `architecture`\ ``-gdb``
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2778): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_message_2778&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=zzre_8g6GYTVIULf1Pzmq36fFweUrcQ4b26bOTcpB6bWFpl_Lmux6y0nvo8WNuq8&s=TuY-GfBjLCHoS4eINDBYR6f0m1gvjV3_2MsPyZSOajQ&e=
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_mt_90489657_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=zzre_8g6GYTVIULf1Pzmq36fFweUrcQ4b26bOTcpB6bWFpl_Lmux6y0nvo8WNuq8&s=TWmwe9ePZP1QxeZXj3lKPcBF00EMppZkTBUfOpJ0sq4&e=
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=zzre_8g6GYTVIULf1Pzmq36fFweUrcQ4b26bOTcpB6bWFpl_Lmux6y0nvo8WNuq8&s=epq9IX-B6gGwsvh80SPeBnUCX7xdknqxd7UV0BWUw5c&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

