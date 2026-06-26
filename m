Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C65C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 16:39:38 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39274.1782491974606903262
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Jun 2026 09:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=afTnQl4m;
 spf=pass (domain: cherry.de, ip: 52.101.84.59, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxNcoww6zfRqJkiT/VyQqBKBWmnRnJqqaHtbZ91woGSO9QzhgLAeIJcCkW+1ZpUef8UGtCINICxxUUE789SmoFFWNtTkKDa3+3tufFx2U1q3nTgEs5aV4yA9gBi4GdRFIVt+FLrnrQaWm9vdaJTZ3wAHSshFfAevnOJIQoEuXa4HTBVhn0NJtMYYf4yIYBIDQKaklMG2XLX1TlvzFou9p9ml5NW6TlqIqo6HpyE4mEQTdcN8yjrhCVy3a14JCcusTQjtwc8aAzgPgbBt+5Bxyoa/gc7+R07BCRPeMb067/h89U/Ay2MCh180oj6ynDXPZ2QNNu9qi4cAU0RrWnWweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3HwtEIIsESQQQNRG53qkzk7kE6rGAZtmPB2IQksyK4=;
 b=O3d5sSKWPJqKU74/L50h5k8hJaG+9uGkrHkHAqSp1X5rqj3yXaGTepNZQwLDaKPxmAd3hdL1DNX3dFw17cmkAOc2UNP348EMjpqIbFoZCzFdAWJzBtaIXunRg5kBY2e+GTQROLDVqrIGdPh7zILZch44K6d6aQVof0YVm7xv0cNxK/r1OOwzXFe+pAQaJ94IwNy0ZiiC8XmYojE7A9UmOtsNbY6U3Ba7pCXrLMIbYslMXEcwJ9RklXDF4uvn8nNsh6Sp/heRj2mno4YHkPLu5kMNDWa7R7uclo1hf6FerfzyHJV6gkvzpBLmH6VKKjZyaTNJAUXBrFNZm5epRrTBlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3HwtEIIsESQQQNRG53qkzk7kE6rGAZtmPB2IQksyK4=;
 b=afTnQl4mGEMOBUihYOuY6yKNrPno7pyJRCCDIDKEg9EKJ/+OEMGlEej+Px+5T0DoxUBZO9OaW5P+gi0uYordOp8HbCFi1VrcYNAyTVEAudCxYU/wTuvs75xjHdl2XChM7lGgo+nyy4P/Xh9riY6MxPDcaNPq9NVn9gg8QwjWQJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by VI0PR04MB11865.eurprd04.prod.outlook.com (2603:10a6:800:2f8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Fri, 26 Jun
 2026 16:39:31 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 16:39:31 +0000
Message-ID: <0e8b8156-fe59-4403-b76a-802fc76161d9@cherry.de>
Date: Fri, 26 Jun 2026 18:39:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: fully define SOLIBS-related variables
 in bitbake.conf
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <cb56b55a-6a0d-754e-a97c-a92c7780ab42@crashcourse.ca>
 <202c715b-2a08-4ebe-a80d-c7b63b60c05f@cherry.de>
 <e48816d2-1be0-71e0-adbb-270e93d7de65@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <e48816d2-1be0-71e0-adbb-270e93d7de65@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0239.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::16) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|VI0PR04MB11865:EE_
X-MS-Office365-Filtering-Correlation-Id: 65460b9d-8192-4771-0a06-08ded3a17f55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	4Qpu86zRC2C7m00xc9xfPX1NTTfiBKmJEX03P/QyvD7rq1IJLM8o5s8l2RqvgijOinABYKXPYvjHXMXzQk2QwvdtuUf7DTavk8IXvc4K4Gvh+bKk6OFwFP/dThv7Wp5KJ3XURmP3tpDm6YH0c4nDG/m1j558UUVFUcY8IquQvNfi1KRBxvXWOTu1csy0YksE4WrC4TCNRkGo0zAzR00I70foKX6wfQb6+o8Dlutkh3RzQmm889PVVzDuA6XtWHY77jNBmKUOouXpnzrMB3qZBkomsGC+xixLoqfFq0Io4zlViVdSZR+nLyrOdfeHPuo0fVP69WFePBtDE9L9B3Zw3TwgSip0a/uKeqlw0AAbK8fIGpINkxJtI91Uszi8n/y/1y0gudlLjclYEEUZFx3bud17NNJzS0Kp6WhgUkL0IqAcRiOQFtvaIDk8l/ufffpX9x8P5Zhmn4fHLpsG6MEf3fMSh3f6mz98X1lEjgywwErEsm+Q6dIYUIRx8InfvG2aj0tv+GaTuUYylqjXVRQw0TlGk8kVHJujUgrdlK5+SAs5ZRsIYBxIkI92Y5SgRra2Slp3+6/YD1f1jCLrxBEz/5qIj1t6crTEIGKxWs7+7ZxKe/BpJ9oug2sy0t5sOrt0O+2AhhNx07oouDcS6CN9fUvCddJqNToQAS4ncCAQvwE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZWJmNzVNUWJvYWtpL1RDTzhYVUNweFFQUUFYckU2VHZvYlRMVTdzTnZDa29O?=
 =?utf-8?B?ZkhNNUdXZkRPcEdBUjlpa2FCN2tGZU5FaGNkcG5BYlRHaUk4cnBnRE4wVU5O?=
 =?utf-8?B?RUVCSmFBbXQ4SXQyRW92MGZCUE5ZbXJ6OEJkY1RubVBCZGg4WVE4WGI1VER2?=
 =?utf-8?B?ZmNOaTE4bDZBcUhVR2pTUGdMWnptMFEyOVVzK0RGK3hFRjJEaitUMmw2eFVT?=
 =?utf-8?B?NXVvY3o4V2tJdnc3WDlrZERjS0VCYU5Td3FaL0grd1B2UEN6YThIU3NwVm5k?=
 =?utf-8?B?M1htMTlHTmZGaW54SGtGdDdBNldoTFlYNlE3TSsrUExXZ01ZWWF2V05SNUlB?=
 =?utf-8?B?b3JvKzhLQ2J5bE4vQ3VrMjM5ODE2Q2owTE92ZzB1NVNCUjhhVDdUazJFNTAy?=
 =?utf-8?B?VzBhRlNDUklFMDRPU0p1Sys5aHpiaHd6Nkc3bnBFNVBKZFhlSVVXMUpVK1ll?=
 =?utf-8?B?cS9naGhGUm91a3RDSDlrTFpRK1pQWDN0VTVRSk9BUU5IbC9pZm9GRzJudmxl?=
 =?utf-8?B?U1hla2Q4eXFEYS9WbEF2YWhWNyt2em50dzFPQVozSTBLR01LaGFHRjh0dlN3?=
 =?utf-8?B?N2N4aUhyNlZVd0EyVVZ0OU1Wc3dUOWNzVTZWSldOc0NwcFljVE9EY2JPWm9a?=
 =?utf-8?B?Z1hkQVhRUG1XeW04T0R3TTZ3aGNmTnZZVkpvN09odGl1VStnM1VndEhTOFlM?=
 =?utf-8?B?Zm1yMUIyODVSUGdTbm9zTnZJblhSNXJyMkpiOVFmamVqNVhvcENqeVJNemsx?=
 =?utf-8?B?Q2xWNk9CeHZrMENkQ0E0YUhlTXJkaWNzMXVzcjNrNHZrWmNheExvZ1lxZi9I?=
 =?utf-8?B?MGFLTVp1NVZZVlh2VzI3TFRLRHRqUmEzQ3hna2Y3cUhhZDdLeE5aZHdzVUhq?=
 =?utf-8?B?SlNBVjZVQkVxRXpXRlliMGZNNmpmNkU4cDZ2NTY4a3BFSzNMc1pXZ2VJME53?=
 =?utf-8?B?QXpJblBxNDUwOXg4VlN2MWNjZGg3V0RPZWcxYTNXc0toc25lOGlDM0hqTHhn?=
 =?utf-8?B?VS82SWcySFdoMjJ4VTJaYTVtOS9FcVF6UFQ2cm5XNlVDdkI0aXN5UFZETVZv?=
 =?utf-8?B?R0dzSUg3aUxmbS9BdDdOWmFYbVRmM0lOY21tLzFUOXhlVWlLR3ovNndXcnJO?=
 =?utf-8?B?MVNoRGRYaWNEQjVJejNJYlFMNWFuUjNqZjUxTHF2YzFvNFNuMW1UVWNYYzY1?=
 =?utf-8?B?Y1NvSWJlV0o1WFJRSGRrbmtMMUhDK28wQ2tZRjc0TVNQRDloK2JGT3FvTlpr?=
 =?utf-8?B?NDBnVzJ3VVpuTU05TS9UbndsMkhZM3JIT2ZqT3QxRFJ3cXppL0hKakVnYzdh?=
 =?utf-8?B?U0NqS2dMbVJjbXdUOHFDNXZKV2N2Ny9tNEZTbEY1Vi9VTWlUdERoSUlNc1dV?=
 =?utf-8?B?UDBseVZTSngyTVpMQUtXaEIyb1ZoVGZ1eDVWM3hUU3F0Y3A4MnFERG5MZzBu?=
 =?utf-8?B?aHQ0RVZlSHFxSW0yb2FpZXJUaVpGM3ZsSHgxaWxvS2xIK3lkY0VLSEgzTWtD?=
 =?utf-8?B?Z0wyVllmZllDZmZvWXEvWGxGdzRGaXNrRWdyOE1nbW5LSlBNbnBGZWhocEIy?=
 =?utf-8?B?ZmF1NER2YkJoK0luTm1hZzRkY05CdnhMM2FyQml4UndQRUM1aGZnZFlHK09v?=
 =?utf-8?B?R0w2T2h6WFV0NDFtbUM2MU9MRGRJUHJXUS9wb1NoK2hIVkt5aytMNm16UGxT?=
 =?utf-8?B?bDlIcHNYTEtycElISmVhUmpxNHZrcEx0Q21oM0E3dnRhaFpNR0JFRnNlbG5T?=
 =?utf-8?B?MGRtM3hhWXQ1Rmx4bDNpTnR4RU1BYU04emJyaERXOVF6VXdwSGFkb0RPSXZD?=
 =?utf-8?B?YXoxLy9uRWtZVFV5K3AxNjlVYzZ5YVBabENSYWlNTExRVkVNSVVsMFF0cVZK?=
 =?utf-8?B?N29BWjFQdnY4bjNzdklXUnJ6Rmc3QjhEWDd0ZUFuZk0wWVcyeGptd0NBandt?=
 =?utf-8?B?TWRHOFdtOXJlLzIza3lxbHk5T0pEYm5nazZDNEZtU3grQmZsNSsvdm1CUG9m?=
 =?utf-8?B?bllxQ2VzcjZvK2ozZGpUTVFwZzcxSTVDZGdTZFd2MkpuOWFFcGFIUWZRWW9Z?=
 =?utf-8?B?cTZSWE5nZTN5MDIzTUwyK2VrMlQ2YW84NWxxOUhQQmp5dEw5UG5uQ1dZK1Ay?=
 =?utf-8?B?bHBJMFlIaUtpdjdJSmJBV1Q4NFE5Zkx2cEpkYy85YUMzZ3hSVUJtOTNYQzFa?=
 =?utf-8?B?THRwdE1VdUtPZForT0JPeGhuMlh5QndTa2x4ZndzWjJXY3RueXZ6MnZ4MzJp?=
 =?utf-8?B?MHNrZkpQSkpCdVhoYUdPUkYxV05LbWIvQzFSWFI4ekQ2Sm9MTm9SMmpDeWE3?=
 =?utf-8?B?Q253Z3Z0Tzk4ejFWODZFaTdPMXhrTitZM3NkMXFYUFQ3bmM3dWp5Zz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 65460b9d-8192-4771-0a06-08ded3a17f55
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 16:39:31.3806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZoU/dMoARbnfbv5bIQ2pIvZtxAjAz8cX6LuwlSuM08hsDwRzPsW9S56Zpb4jlkZzypjXoddQROup0GQ9L3JUsCh/jxPIFzWB1Bzsbm9ZKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11865
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Jun 2026 16:39:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9912



On 6/19/26 7:35 PM, Robert P. J. Day wrote:
> On Fri, 19 Jun 2026, Quentin Schulz wrote:
> 
>> Hi Robert,
>>
>> On 6/11/26 1:39 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>>>
>>> The current (abridged) SOLIBS-related variables were not included in
>>> their entirety so add the missing content.
>>>
>>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>>
>>> ---
>>>
>>> diff --git a/documentation/dev-manual/prebuilt-libraries.rst
>>> b/documentation/dev-manual/prebuilt-libraries.rst
>>> index 59621ca16..9cc8bd2d9 100644
>>> --- a/documentation/dev-manual/prebuilt-libraries.rst
>>> +++ b/documentation/dev-manual/prebuilt-libraries.rst
>>> @@ -153,8 +153,8 @@ default :term:`FILES` variables in ``bitbake.conf``
>>> are::
>>>
>>>       SOLIBS = ".so.*"
>>>       SOLIBSDEV = ".so"
>>> -   FILES:${PN} = "... ${libdir}/lib*${SOLIBS} ..."
>>> -   FILES_SOLIBSDEV ?= "... ${libdir}/lib*${SOLIBSDEV} ..."
>>> +   FILES:${PN} = "... ${libdir}/lib*${SOLIBS} ... ${base_libdir}/*${SOLIBS}
>>> ..."
>>> +   FILES_SOLIBSDEV ?= "${base_libdir}/lib*${SOLIBSDEV}
>>> ${libdir}/lib*${SOLIBSDEV}"
>>
>> Funny that the ${PN} package matches all *.so.* in base_libdir while the -dev
>> package only matches lib*.so.
>>
>> In any case, that would be an issue in OE-COre, not the docs, thus
> 
>    i didn't even notice that. BTW, did we ever clarify the consequences
> of having some pathnames in bitbake.conf using "/*" and others not? as

I don't have time to investigate, so if you didn't, then no.

