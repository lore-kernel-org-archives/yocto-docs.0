Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024E5C433EF
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 09:03:58 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.45])
 by mx.groups.io with SMTP id smtpd.web08.1595.1653642228795617534
 for <docs@lists.yoctoproject.org>;
 Fri, 27 May 2022 02:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=cjUt9CDm;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.5.45,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OF81pe7NZho3TLgv4hkHag+RV0BbSzErF4diz5EMpXT2HiXgONvu2jXiY4cgEDLvFjpqSANTaFfcBket/KSRjYZvYnj/u2EIBWPQJpEOTKXCaQOlaaQL+kiwQNqSF4PzQ666AJZhF5+bygM1Q0tir6lK1H27mb2Jp2v9sFkmqR0cGNEd1NIfSKITkHBlz4OQaGCARaXWY+KFbAaKgmBaR79ZnUJhTXuF8ENnEokfSmLg6bPLeJFJM8eLyGeb5QKSoMqCnLZH6BPG/L8DfI+wZGq92utIUINrghqqgLkQAAg51bilc/K7P6t4rDdFnqCEWfxJiqVcpRcaDscQsdEK/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhB13F688R0NdQ0+jlrnug1O7oTPzYbuJEadRuj2Z48=;
 b=gEZgM8CMnXO96XMpWGl0glb66u8bocEfTU/OE2gugBupKcpRV22i92D8wAVFjkloBoN9qcsvP7mFIXbZIV/+vqY4ohqN18S9LY5Y8AZUwlng95YsWb6XD5Ogg8U9zdg8XePIW4S2HxgxTs0rb1y8OANVV+27J0KZzTHwdRXIyeDq5bSa3/Wb2mVX/0yoyP628eB2po9dxUvyzGuOhu5qv+bbfjnJzOh4pcNfg8NERzh3qWn1L/jGgKW5Tvjln861sLyLzNh059bokPKb/SFu4q58aONmRjov08T2wifZ3RxX4RAJZ9ACLOpT1El+sYNSoMzAGteG/xql8PI7kJ9sXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhB13F688R0NdQ0+jlrnug1O7oTPzYbuJEadRuj2Z48=;
 b=cjUt9CDmTzhc3bsfUCFRpQheVMslnwln5Y9Fm48S0f3yjpu7bb1mcoYoXkBp2ubt20tblI5beUAdhQ1uVg4APiqum1+3XbPW3UKDzfQPeKGgt6jMz71DLMNXHX2LN4X8Q1bH/dgCA38k1vWvsfmTmFhS/wI2TVCAo+SQUiQ979c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by PAXPR04MB9092.eurprd04.prod.outlook.com (2603:10a6:102:22a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 09:03:37 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a%5]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 09:03:37 +0000
Message-ID: <2b585790-7ed0-543e-d643-1b1646486cc5@theobroma-systems.com>
Date: Fri, 27 May 2022 11:03:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [docs] [PATCH 2/2] test-manual/intro: bitbake-selftest needs
 bitbake
Content-Language: en-US
To: Zach Welch <zach@mandolincreek.net>, docs@lists.yoctoproject.org
Cc: Zachary T Welch <zach@aquabyte.ai>
References: <20220526151228.562281-1-zach@aquabyte.ai>
 <20220526151228.562281-2-zach@aquabyte.ai>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220526151228.562281-2-zach@aquabyte.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::18) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8fc1869-b1af-4eec-b6f0-08da3fbfc942
X-MS-TrafficTypeDiagnostic: PAXPR04MB9092:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR04MB9092DC8476DBF1D3473BED09C2D89@PAXPR04MB9092.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ybRXVy0q1bVbe46uJP3m52mAw4BUzpab3Eqekb/By/NtEvwTAFQflVrLZwHf7L9vqD+dV0fj/3F/ouTl+sDZSrLyRI1BksnNif6/x1RP/VzJ3A4s9S4LMnbuyOuQYOeE8u2fKIK4gO3JE3Mi0zXFlzQIOjsF3Ca5akA6Z9wm60SfGH3dwN/OcoY2YOdxcl3yCjDMIl9pjOSK49jXRodTj8W9LwWjVSgkw2t8pBek2gKjQkzV07upNRG6MVzrq6NhfDo+r/Yrorairt5oWgBq9amrNMEBexTlsKA7XE2xGdWIP2EMIjICMjKt96zVb9XC1TiERyJ0fNo8wNn5Y1qJ9Lnnyn0NyAHJ0a3K9qCEXKd5JgsbTTwR9fR0j4e243qkomS+hHqlN57iNRUM5RtnzhM1HG9i5A/TKTK1qidTrHV/TR53pE3BuNP7axgnamnix3BtHtasZwpHYUx2FEojTKAbECp46Ho81iNOYi+zSbICLoOA2gpniwYdjS+N6PDg8OTUAL7AU5q+E0rFx1Zjr8v+YNxMfjubQ365wjkAEMW5xAqC9WDLP0MMcUnaHpSRZKxHMPrkt5vO92j9a57rx9Ue04bhcyvEz/jKIz5q27qJrqjoQck2zpU0xp46qfZonOupHARhU9KrpoYa0P+sKR9jzAyQ0GGgXl3Z+7VJA30j4NT1QPXhuMBBX5cQLkdThYxEqOwJAUejgAZDfxQNX+A4B1J4hDyoGS4glo/6ofxsce0U+A868fo5RRAKVYOI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(44832011)(316002)(31696002)(53546011)(86362001)(2906002)(38100700002)(4326008)(8676002)(66556008)(66946007)(66476007)(6512007)(2616005)(6506007)(8936002)(508600001)(5660300002)(6486002)(31686004)(186003)(36756003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eXRWU3pOVlpzeStpK1FDcGo1cGxpWm5Ba3dPOHJLYmtYYjVMUVBWdFh6V3A0?=
 =?utf-8?B?bHdWS0JUbmltVDh5YlM1WVRFaFNaWWkwb0ZSVUdvcVd0V080SmhFRDN1Y2xS?=
 =?utf-8?B?K0kzWmhNV1NSbitDVUJzR1o4OFc1Z1hyYWxWNXVvZ1hsay96MGI5SXBKREZZ?=
 =?utf-8?B?WVg4UUtkQmFVaWtrdFQzdU9RRk1Gc0RpWGdBZ3BINU1rZitLRm90Z2hpUGlo?=
 =?utf-8?B?ck55cGhwaHUxLzFQemdIYzhXUi8ra0RHK0dnRlN3aXhoMURhS01JYWtJSDVX?=
 =?utf-8?B?Zk50d1FnajJYckxlQnNjSXRadk1MdGMwUVArNEhrUThHb2J0OU4rMkd1N3hu?=
 =?utf-8?B?bURQYkxGTFRuRDdGNzJ0alNCR1ZaZklMcDhsTVdPZ0w1eTRwV09LQkNielVC?=
 =?utf-8?B?MHVFd0paMHFJb2phZ0VsamxNbUcraWNhak9rSThueVkzQmhJblFjQ04zMHd6?=
 =?utf-8?B?aUdJRTZjd2Z3c0JzcjNyWEF4VCtQVXBnWUJ2SmEwTGZEUjZvVFI1SVo0N0oz?=
 =?utf-8?B?NHVLd0pteEpjYXdPZEtLMTRTZGluaVcxTE9veVlhVS9TQnppWkp2UUhqNmJU?=
 =?utf-8?B?UkRlOGlaQW93RFczTndDRkpLY2t3RFQwZmJXU3M2QTNjdWl5OWhGdjZML1g3?=
 =?utf-8?B?OS9scFd2NlROMSszVmZZdlBGM2NKMTI3Uyt1djUzTVdhWHltUU5ER3JKQ1BE?=
 =?utf-8?B?Y25xMjFOVnBEb0o2bWFYWmcxNDdLY0Z1eGxtZTloZGRsNDFJOUxENncrVTdo?=
 =?utf-8?B?bWNMbFduRkdUT3N6ZXlmc21LVkJsdDVKUlUzL1I0a0pqL3JqeFdHV2J5bGdK?=
 =?utf-8?B?ME1PRlRJREhqb1F2dnFVdEV2clJpK2Q0SjlLMjVOTjY4S1NvOVArdldQN0hW?=
 =?utf-8?B?aC9oL1BCakZVeVgralQ2bHNzL3B0czB2QllLeXJ6eVdUUmtpOWFJdmpsOUJP?=
 =?utf-8?B?LzVkbUZ4Ny9CL3R2RmgxanF6VzVMak9VUkdhSzc2cFdUTlJqTysyakkvbzhx?=
 =?utf-8?B?dXF6ZXBXeDQvZlRjR0orZWNpYkorOHFNWlNhblFQUW9qa0ZsUWhYdnBSNGRq?=
 =?utf-8?B?U01tTG9XOHFZb3VoLzZVY2pFbGZja1U3WlkvWEFXN2U1ZEJJT0ZncUhQenY1?=
 =?utf-8?B?NitJaWFQbHZvcTIyU1RCbCtwK2MzaDZpUE44T2lEVXBCd3I1S04rQ0swd0Fq?=
 =?utf-8?B?RVltVjgrZlRGekhOdk5JYjBVQVRJN2lEQWhUUTkyZmNoR0JFeGNOSE1VdEIx?=
 =?utf-8?B?ZFZJT0pLTC9qWW9FSXpmdnJGZkF4QUFHSlhET1ArZjRGclRRK005MzRDTHlV?=
 =?utf-8?B?QklsTUFGKzhXNGNNNGdvQWREeThZVnJNWXRnbjltM3BUMWQ5dHhoQlhvOFYx?=
 =?utf-8?B?TGZ0WENuSG9UQXBsOUNCL0V0NXQ1RjJRdkw4dEtBdFRNdTI5KzkzVHV2SmFP?=
 =?utf-8?B?c0QvSVYzZHJRZnhwbUJhN2N2dHF1ZExqdytCMzhwZ2VtVDB1eGNtZkppZGxp?=
 =?utf-8?B?d0JYVDdaRWhjcytFWlk3NHZEYkhjVnowRWFOSEFWZjNnaG5FUTYxcU1ta1hS?=
 =?utf-8?B?dGRESXc4OEk0aUtpc241WUM2VHdDWTBJRFhISUowdzY3ajBYSlN2RnJPK0xG?=
 =?utf-8?B?dUtFbWZtci9aMWFDcStiZ1JzenFTTkVHbExWMlFWUnZsa2ZIYzlJaXFKbTk5?=
 =?utf-8?B?Y2dwM2lMMUdzWmVzSEtvTmsrcngzMmNyeERINFMxcFhDU0ZoOER1L2ZXUUJF?=
 =?utf-8?B?UUtaSkRNNW9FYnNuMXQ3SnRSOThNTm1QTG1OMTdIOGVkMGpLcDRscWFJdUJu?=
 =?utf-8?B?MzdXMEtwVGZwQUJPZTBqdktLQlpQUWdyS2Zyb1pKWHc2bW1FOGlycEV4UVUx?=
 =?utf-8?B?ZHlFc1ZIRTRRUzh0Q25jZzdRYnE4eFlDLy9hWWg3L3NBeTlMMklGeXBKbzVC?=
 =?utf-8?B?UFRkQnVTWk1yVVlneit1Nm00M2V3MHRqMW9USmxPcS9NZWprQU1ucEJsOVhq?=
 =?utf-8?B?MSt2ZGV5VC9mRnZzRU9FdU8xUmJGZld2OGpWN0JTaUdZN25CbU9iUDRnN0g2?=
 =?utf-8?B?aDlJdFVVWnJ3czBINjF0RU8zdjIzVElvekM1Z0srNWZJQytmckpob0hnbDRS?=
 =?utf-8?B?YjF5VGJ1YXJjNyszaG03TVZBZFVGMVdmOEczVkF1ZlRoMHEyMnZvZzNWblpp?=
 =?utf-8?B?SEtpbmNvVWhZbTFqT1hMT2orcWRRZzRDd2ozUHJQZEo3WXhXZjNUSU40L0Fi?=
 =?utf-8?B?ZzVwRDJIY1M4WDVrV2NSRFpMK2VxaFg4Q3dVWlZ1aGVEeXhvVEJxdjhETThK?=
 =?utf-8?B?cVp4YlR3Y3Q4eDhpRUROVUpvcFBhbUs5eThJbm84UTJWOTBuZ0J6dUR4cUc0?=
 =?utf-8?Q?FnTEiDYB24p39LrXRbPfay7ylEe+WZuCuzLLM?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d8fc1869-b1af-4eec-b6f0-08da3fbfc942
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 09:03:37.5336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KjCOeuejO9jomtxjJWt1poSwcdDlPbawRrZQUoJcIhde/+thBBTkgkQcK+82KVai6KV98Ur8NjlkViVKegAGy+JnNtHB9hGQAJESQi6JUpcEnN6ZgXHrtThdoRVANY5E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9092
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 May 2022 09:03:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2952

Hi Zach,

On 5/26/22 17:12, Zach Welch wrote:
> Without adding bitbake/bin to the PATH, some tests will fail when
> they cannot find the main bitbake script.
> 
> Signed-off-by: Zachary T Welch <zach@aquabyte.ai>
> ---
>   documentation/test-manual/intro.rst | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
> index c445e28a7..12324e592 100644
> --- a/documentation/test-manual/intro.rst
> +++ b/documentation/test-manual/intro.rst
> @@ -175,8 +175,14 @@ Tests map into the codebase as follows:
>      which include the fetchers. The tests are located in
>      ``bitbake/lib/*/tests``.
>   
> +   Some of these tests run the ``bitbake`` command, so ``bitbake/bin``
> +   must be added to the ``PATH`` before running ``bitbake-selftest``.
>      From within the BitBake repository, run the following::
>   
> +      $ export PATH=$PWD/bin:$PATH
> +


Since I think Bitbake won't work when there's a folder with a space in 
its name, I think it's fine not quoting it this way:
export PATH="$PWD/bin:$PATH"

So we should be good.

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks!
Quentin

