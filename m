Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D099EC433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 10:24:56 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.71])
 by mx.groups.io with SMTP id smtpd.web08.47699.1653992691577018596
 for <docs@lists.yoctoproject.org>;
 Tue, 31 May 2022 03:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=AHunhpsS;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.71,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ovplk4rGmxIo9zvb4dZ/JKfPBCH5XS7RK8UrForEEAXq8mpDoYFuqBlz4N74CC3ULAfq4r96auxVPD8r+cFq9ooZKBs8GYHvD0r7qhG7egrn+I9u4qeKC6waBsj7t8njDWRWYY1qjzSLeygW2UqpyPS/w4RwNpI1CGU/HIx9Es26312ZNG1FP8kSZKK8U2zeE4iNYFsJkUWf1IbovujXhz4DCQGjW+GYM1SoM1N72/2YEYu24w/1ciJazVHQWkzflSXmXZRtShjRLC8f+tMzubZC/XURtRMeZ7VVkFw8/nm4vx3Q1ZmlHB6v2wpxLHDZL8SBRC6rFRRWLYL+x7iVJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNlm+R0geki+9WeI7ANZMoq20XpPk8mOVCL3NsqvDgI=;
 b=Jn1K/eaG9OudW+ONP93CwmxUTksmLLCoGJjXjGLT0gbFNmDr4IeMKOo8kggg2UoS9U0M996ufYfQPhkq4K5Qbdsz8j1zwkO8wFlP5VHQ2FRJVUpmv3tH4ZwhxalbEyeWErL83m9ZQCurlnAl35UuTCR7NYtQgyJaHjlnVDfDyHaPHCavvLBZRdtYePnPtRw021/BChBjUzaD/OpZSOnOCfU+Aj3+Ht+sOvRuRyOeilZLBvo7osmAtY4v2uV2bywt/3hPEpDQZx8/4C8KoJBLeUZ0LJdY6IovtD6WJk6Ao3rDD513bfG7IUxGzR/VqpbniKhYMjbqG7nAAE4UoXOeaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNlm+R0geki+9WeI7ANZMoq20XpPk8mOVCL3NsqvDgI=;
 b=AHunhpsSSGTCjUEeC7/Md4r4nNdsccqku58/AWxaNv1TsJfJiHEMDWhWc3GcI5flgvVOU8YhO6+NSdTv/aVOUqVYMohGFqISapPiN8SEMVJBMSqK1A59Qr1pWcsUXFfdxMFDdAn7hFgQUytFK6eecMn6+tnaY2nJQo1JQ3jD8Ss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM6PR0402MB3365.eurprd04.prod.outlook.com (2603:10a6:209:c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Tue, 31 May
 2022 10:24:48 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a%5]) with mapi id 15.20.5293.018; Tue, 31 May 2022
 10:24:48 +0000
Message-ID: <6f6a0bc4-91c4-7d30-6ae4-ccab2674d809@theobroma-systems.com>
Date: Tue, 31 May 2022 12:24:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [docs] [PATCH] docs: standards.md: add more rules: line wrapping
 and variables
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20220527163249.558316-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220527163249.558316-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0010.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::23) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3ba7d16-01d5-419b-bf9b-08da42efc9ef
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3365:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR0402MB336593688D9618CB5AECA7BFC2DC9@AM6PR0402MB3365.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DL3AJxUnruQm0uoZgAj+HYsoQDBV/su235fvEKEfJ28SMUy5kSmixJIiyKQmCG0hXOQeegs2IzI6hEPVNif9B+QdCg2i/bENsWaDRHMRlIVdORoFrK/Erpdq+G1qy5dvuv4l0+bj5eNrzGLq6+VFLh4f9d9hlHVw+ai8TShsC3sfwwVsc9cliFL1ma+xalQ3WQQU7tNL/lsxX3HPT6AJLMITxRdjH67z9t2O1UHc/LG8vpuHVe1VeCdPedkaE/UdpSOQcMLdzd+xLJ+OqV/MraKJSA9Teucpz99e3YlhG8XmH22pR22Qvw6hRKYUXJxHPkTBQC6QwQElDvum5lfL6hBszRfWGtoILy2vmOtzAtwhJ2jkq4vRn348yhEZGREcn93pm9hIXaHhxQKesiF6x24UwFmLqRcVoUQNKdaMBD2gmmNCuE5S6gHD1x+JR1WVCYKvbQrVHK5+Ji8ek9mScRCwg7qZNODnTWro2U5mT2dzbU9FA0a8jLa8BuAnqWXnGvNpUOXkwdir6VK+VWM+AOE9CDNWKMML/I7B/aCogkH0zqkYtkwo7lhyQKWluhP8BnnR2HbpMzNfgn8/DZbA6JAby766CW1zZcT9eFYG6+JYx5Q69q3sCMas1AGqLtSdPWH3jGLLlY18qFmiHczbyU39QO7JeYCU43ozKOYH9LDwTLiR8sZMIi/mvKr7Qun+rS0I/R+aUkiZqqkq7+aocVphKqPg9ezYiIAhvrPIpWTiP+1sPkjGEIbxOidhfxC5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(86362001)(6506007)(31696002)(26005)(2616005)(2906002)(36756003)(38100700002)(8676002)(316002)(66556008)(66476007)(66946007)(31686004)(6486002)(44832011)(186003)(83380400001)(6512007)(508600001)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UkE4TWtxRm0yRFZnT1JqS0ZuZGgwSTRsZ3R5bDVqbnQ3WkNpeUsyb0lMQVVB?=
 =?utf-8?B?ZW9RMS9hMmtjVW9XaDJJaWpaelVmdEJFMnlySGsrc3J2WmZxNWJPWGJadWky?=
 =?utf-8?B?NEx2cGp5M2xxeG1ydU5YNXlJcEpVK1hiKytQelR6bG15eG0wdkV1MWoyMGpM?=
 =?utf-8?B?S3dGRlhPeEQzK1BzSkVYM2h6TUpEcVk0RU1HbHNzT3JjSzIxaWl5TUgzUS92?=
 =?utf-8?B?Wk8xVU5HdUE3SlBvei9DRUxzcysvZVZ0N2NEZDJ2ZTJtM1o0blpON05ieG9j?=
 =?utf-8?B?QVFMdlo0a05sN2krUnhFK3dZOXlXWVNDbmlvVzdlNmczVGxUdXdOVXZCc2Nh?=
 =?utf-8?B?c1pJZHk0ampmVUpxY0hOQkRDb3Q2dWptamc1YW9FWm1YM1QzNG1MTXJaZ255?=
 =?utf-8?B?MWxXSkJJL2lZUEhlUGdWTG9zSllHZ0prYU1Pc2JPLytQYlk4c3dCMEZzNFoz?=
 =?utf-8?B?Q2MzZ0NmT1Fqd1FibzNNZ0Frb3l1VVlISVNXVGlXSTc2amZHekxPdTVqaHho?=
 =?utf-8?B?YzBjZWd4Qm5xYUloMmNGRHIzVVV3S3paQ0xxQ2lWN2hWaWhoV3EzcnlvdE5J?=
 =?utf-8?B?S082VCtKQStWdjNOQkVQREhOTGs2OHlrWjdpdENpZElQUGw2eG9QQ0k2Rjc4?=
 =?utf-8?B?T0RSU1VIWTlST0M4VUFBWVNMRkwybWxBTFNMcEI1ZWFTRnMvRVRvZEhHL3I3?=
 =?utf-8?B?MUtPSkVvRjFYV29lTGNXRjdHRU93MHhBbE9hMU4yaE5CT2tBN0pKb2NvdzR4?=
 =?utf-8?B?cGVIWm1FamJhMWlJZ3I2aU9vVUVZWG9qbjR5TGQ4a2tMNURIWGlKUWZ1d0NY?=
 =?utf-8?B?UnJrM0UvNzVwSUJrQzBrS0tYTGpyNFFLbU5ZZ3V0Q0kxR2w1M3lPWnZWejZk?=
 =?utf-8?B?N1NZaHR1NjBJVVlySC9vdkU5ODdTL21nYTdsQjg4MVY2UisrM0Z5RFgwK1Jp?=
 =?utf-8?B?ZDk4d3ZaN0hXek5zTkJyQ3U5YkEvQjNrTy8vemNzdk8xVWY4MDRwMk5TUXN5?=
 =?utf-8?B?ckIwZXpyRlVJTW81NTl4MlFveGE1bmZXczg2ZWFVRUdvS0haR3RaL3FSU2s2?=
 =?utf-8?B?RWt6b0JQOEJuRGNFWTM5YnlYZEIwZDBFZGNMbUNHSzhES0FWTFNZNkVTWHR5?=
 =?utf-8?B?WUd1R21ibDVNVEEzdEhZb3lTQmU2dFlvKzBSdGFORzV6ZFlJTFhabXFwemZQ?=
 =?utf-8?B?cUQwRk1IWmpINEwwYzA0WjVQbk82SG5ndDYvV2VlUHNHOWgyS1NZaGJseFNZ?=
 =?utf-8?B?OCtTWWJBaXkvMS9jY3FVMng3RUczTkljbERFYTdQOWIvdTFlcTZlc0pvK0p5?=
 =?utf-8?B?TFY0UnprNUovYkJTSXFuYWlwaCswWGtnVEZ0eHR2WktobHpoVE8rcjhjL0Fy?=
 =?utf-8?B?UG96S05RVk03bFJkWmlJd25FZ2Z6MFdsRlI4UkZsTmVMY29UVkZzRnVRQU9j?=
 =?utf-8?B?WXlYK1hnK1h6UVprS01tSy9xaFNqZVFFd1pyM0l0S3BHUjJyYm5tU0ZRMUNV?=
 =?utf-8?B?R3UrZWlZS1grV29wSmV2Q0RIb2thTjA1K0xjOHdaNHdhS1lWSmlIeVloZzJw?=
 =?utf-8?B?QjJKNkpUa3o5d0tpcXBXMmtjT2tBVEIvbW03c00vRFQzWHRmdnRmUTJTZHE1?=
 =?utf-8?B?dFgvb1FzK2FOakdneEVML0FHTnU2T2Y1dUlIUEhCOXRIWTA2SVd6akd1S0J5?=
 =?utf-8?B?Q2RxazhCQWVETkxBS2U5eE9lQkM0L2MvTVlqTnRocXdvaVJBWEZzY1Y0alV5?=
 =?utf-8?B?ZWtocGVXWHg1dkhjSWpRME51ZTVLTUR0dkdXZTFhUVJ5TEFXZWlQY0xpL1h5?=
 =?utf-8?B?QTBwRVVBVE1Db2VwcG5HNDhpbWsraHY4Q0g5OGViUVBHLzhoenQxVHlvLzRY?=
 =?utf-8?B?am5CeGlTeEZSV0VvK0VyS1k2NXJWRWpnZld5WTJNdDh1WUhjbXZPV3d0SzA5?=
 =?utf-8?B?YWVLSlU2d3MzdUF3eTlnQjMxRExaWkx5dWp3QW9SUEx1bEJEZDJhSjdmNjBj?=
 =?utf-8?B?WlNPaTluSVNWUy9DMm85UkU4SDQrUlFocnpmMy83aGdjUE5qaFRWbm4wVzZO?=
 =?utf-8?B?YTJJMnE2NDlWdGJWRzRabG00bUg1UTBQOENrelF3N0FsdE9Pa0dCTzQxdzBU?=
 =?utf-8?B?Z0pXL0tIR0tqek5icTdLUEkxenE2R2pFUXdjYjdFZzRzeGs5aFgzeFR3d1k1?=
 =?utf-8?B?RmsvRzJxQ1RDYW1vU0hSKzVORkZHU2J4bUk1QUVTdFZMV3U5Q3BNWHVIaHhD?=
 =?utf-8?B?Y2ZJL0tjWXpFQU9UcVdYdFVETHZRUXFkZnRnZzYyNUFJUHg5RGNOK1IyaFcr?=
 =?utf-8?B?elF0TjlVN2JlVEhTQWdwWTdwRDNYMzdXMTFBV2hWeCtzbEtwTzAyTXpHU2Jw?=
 =?utf-8?Q?Vu+9CsvxjiDQ2Wkl3rv3+4OocD2qa+oVUDJGP?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a3ba7d16-01d5-419b-bf9b-08da42efc9ef
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 10:24:47.9833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 T6r4QrKjLWxd8We/7EU2O8pvG6LOXb1GAmWmu26hdXIZ8WJDnOirfkY44iMubndJQ+BiivA+bMDk1RNi6S5bHl25Gl/oBbZcRdZ0VZJ7BXvfe1hkvYqqAoIS1S/geAIH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3365
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 31 May 2022 10:24:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2955

Hi Michael,

Thanks for extending this file so "rules" are explicit :)

On 5/27/22 18:32, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Fix Markdown syntax too
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/standards.md | 33 ++++++++++++++++++++++++++++++---
>   1 file changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/standards.md b/documentation/standards.md
> index 81aff5f193..8d5c4542af 100644
> --- a/documentation/standards.md
> +++ b/documentation/standards.md
> @@ -7,6 +7,21 @@ It is currently a work in progress.
>   
>   ## Text standards
>   
> +### Line wrapping
> +
> +Source code for the documentation shouldn't have lines
> +wider than 80 characters. This makes patch lines more
> +readable and code easier to quote in e-mail clients.
> +

This also makes simple diffs harder to read (e.g. a typo which makes the 
line go above the 80 characters limit triggers a change in a lot of 
lines below the one currently being changed). Obviously, whatever the 
character limit, the same issue will arise. But just wanted to point it out.

> +If you have to include long commands or lines in configuration
> +files, provided the syntax makes this possible, split them
> +into multiple lines, using the ``\`` character.
> +

An example here would be great I think.

> +Exceptions are granted for file contents which lines

s/which/whose/ ?

> +cannot be split without infringing syntactic rules
> +or reducing readability, as well as for command output
> +which should be kept unmodified.
> +
>   ### Project names
>   
>   Project names should be capitalized in the same
> @@ -25,11 +40,23 @@ in lower case:
>   
>   ### File names
>   
> -File names should be quoted as in the below example:
> +File, tool and command names should be quoted as in
> +the below example:
> +
> +    ``conf/local.conf``
> +
> +Using `"conf/local/conf"` would be wrong.
> +

"""
File, tool and command names should be double tick-quoted. For example, 
``\`\`conf/local.conf\`\``` is preferred over `"conf/local.conf"`.
"""

I suggest this because it's not "wrong", it's just not something we'd 
like to have in newer patches.

Note the conf/local/conf typo to be fixed if yuou don't go for my 
suggestion.

> +### Variables
> +
> +Every variable should be mentioned with:
>   
> -     ``conf/local.conf``
> +    :term:`VARIABLE`
>   
> -Using "conf/local/conf" would be wrong.
> +This assumes that `VARIABLE` is described either
> +in the Yocto Project documentation variable index (`ref-manual/variables.rst`)
> +or in the BitBake User Manual
> +(`doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst`)
>   

I would add:

"""
If it is not yet described, the variable should be added to the glossary 
before or in the same patch it is used, so that `:term:` can be used.
"""

Cheers,
Quentin

