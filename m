Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F62C47091
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.54])
 by mx.groups.io with SMTP id smtpd.web09.7979.1650631642081840696
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 05:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=Y+QzuJg+;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.54,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEw4viGV4x2REu2dcAglu5xV+tHPk9Esm+wD5ZKVmC0a2OVniqYOzDzDJVtF08CnlzpBk+Pz9Jk9YwToKjVISX5SpezraHnN1PdqWdFLDBy6QGVfUdpShWW9cuhmjH79+WmTy4XXszxXvkYsx97dm7hlF4E8hEG01pW+r0MGZiPw54xDSAwRe5mtXHe6G1a7bUaqAxbMHi98mHkpCgHmCNKgJlq9x43KpRRWSefRwt//f80UrGH8DU4wDo3S2Wg5+hhiNi4HRCNr9MtaB5aZo0adiVxwUcTLYkJxEdtDYrTn8L5tdV4WP8W/NE4+7Z2PAQagHDY3nQMRJsupM48O4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXXjcG+gEL2zCyK9ZQ3yEVD7ZvJurpUe3SrC0Wpu79E=;
 b=I2JISJXfCzBbk/ysI6nUFt53HMaEOL76d/ux9G6k+TJf0bBfexJ1lWFcnJp28X1aBkSIXU8E9tLPojxhDchFegha9KpCmPyYhD/iRw6VR+5c6ykTqSx8325weXzRCOJ2qzo3ampLXpJvb6C+DzkVQoEBm9c8TPWTaPK+3FkTVKiXhHaEx5TjzDp/uF4B5WUaqfVUqLRVeb9qEwYNPZYmJRhueO6yumZkynoIeVvfB9VpOCF27YRQKIDWF06FxIPFfGHnm6y03RAqZ2XPQteq6F/4BAxLyRTvYmfU9Zg6rdqMLNrA5kHUzTRoG5WktXTV8U86Xf8eKNZG2Zl1iRcHFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXXjcG+gEL2zCyK9ZQ3yEVD7ZvJurpUe3SrC0Wpu79E=;
 b=Y+QzuJg+S4tUDlDpEaWPQvG6YUf1zgQGLZPlwkQDvtFxt2RBaWIlDbE9hZRoTnGmskL2GBLmFI5PPUQdt4sh+4T9v3cJDauJMfw/kV3wMGdieAhJ3cM3dv+G6upo/S+PBCfT8MgsfXARToJuhmyvsc8R6WJtvv21RwPuZh1Etcs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM6PR04MB6629.eurprd04.prod.outlook.com (2603:10a6:20b:fd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 12:47:17 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979%4]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 12:47:17 +0000
Message-ID: <d7705830-c7a3-b3b9-51b3-c3b76232dccf@theobroma-systems.com>
Date: Fri, 22 Apr 2022 14:47:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [docs] [PATCH 6/9] ref-manual: add XZ_THREADS and ZSTD_THREADS
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Paul Eggleton <paul.eggleton@linux.microsoft.com>,
 docs@lists.yoctoproject.org
References: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
 <fde984bfa988c26cf7ef4cacf4ac830d974129b0.1650591341.git.paul.eggleton@linux.microsoft.com>
 <e843b4b7-3a45-d44a-c423-c004151a32c9@theobroma-systems.com>
 <9e8203a32b436c8c279727658bef00ec626f1da9.camel@linuxfoundation.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: 
 <9e8203a32b436c8c279727658bef00ec626f1da9.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0212.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::33) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80eba998-b46b-4bc5-3650-08da245e3b45
X-MS-TrafficTypeDiagnostic: AM6PR04MB6629:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR04MB66297F6D157700402DCC8007C2F79@AM6PR04MB6629.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h7VTkHPdTYya0ow+8FfQ4T2vfd5/lhVHpxZnhsjF9JFOhKPdqfWSx6KNEdruSCuXCDm7q7DRxZywJC4J0YmZYSkHUS/HUR9tTgUPMvJ7ZerFgpFIBO6MEYozNvEg8jg1RcFvnucHNwGOeK+wsukS0UDJOgzvF6CGjywnpSiVfUBEmhy1x2+cE11A5HVdUJC9u+sHA+Enn0tONLYQsfCXoo0Zwb+nMvKtvUN92DFNjiG/x83QARu+ETqvLZYPRJcYqsUj4BdP9xCyUROVrLx89M+hmpKRtJlFHhw+NEtF24Us+QmJ5piLmNM1KjvuHy2qNWwnyN+0X/JuOzL4hlRv+M4eT1BxDs0nlK3S+35Jed0WnmVKkcScEd23buC1oLGCtjRfYCE+fDPE1IJYwNuYRErwp/xKrSD4xUNcP2EuTV6Dm0EIt319j16AucKZvSVtvVihpuyDWpXRZNEiql5e+//Iu6I87PV6YcNtI0YJo92dE2518Ay+uflkY4E9DsH9hKffEaN6EgROaCKmUOMuFLbPHhLQlh8vo/tEOXrB2wPqoJfRcFOdlpQAwJm56rr4CiLY47dIzgURQmD6cICqmOgJ4X11FHwrTHMNYBPSa22W0MIArdQIE9kvtOK4P71n5A+ZEGdGjd2tYLt9d5NWgz2DGr9mdYHxMfehsVe4/p7Rg8i4RmxrlBLA+VOSxmqZ2VyAgovu1R0etY8NIGH3rutHLpmE4KjmbVswP+xPBkVYHViPGL7VjETo74nmfBE+2hAyeiy4dYa8PgqDDtMuNw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(66556008)(66946007)(83380400001)(8676002)(6512007)(186003)(2906002)(53546011)(6506007)(31696002)(6666004)(86362001)(6486002)(2616005)(5660300002)(8936002)(508600001)(110136005)(45080400002)(38100700002)(44832011)(31686004)(316002)(36756003)(431254002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dzlGazFvTCtMbVEvQnNuaGxvdE9GVG83a09oK2NHbEM4KzdJWEJFS3pYcGpn?=
 =?utf-8?B?OFl1RXdiMEwyazY2N1dicUZ2QTZ5aitYVnFIVU5qdFUyVHQxM3ZiK2VtU29t?=
 =?utf-8?B?RE5JMEY3YnZSUUtBRitVTzNjK2FmZ2NSVktzQnM4WW96eTQwejFQbDlTWlk1?=
 =?utf-8?B?QWNhVUNENjdBWTNkTmVtRkZkZUVKQU9GM291bkxkOTRWNS9nQXNWbi9ySTU0?=
 =?utf-8?B?WUlpV1I1MGg2NDY2WnNlcmxWWVJwc0QzdEw2cWxER3V0QkdqSWtNUis1dzdB?=
 =?utf-8?B?bEJObHhsclpjVFVFeGlRK3RTQXdPM0dpRzAyWnpVcDBxK0IwZmJHcEx6QXdw?=
 =?utf-8?B?TlZHam1yNGZGRnhmUERkYkl3ZDJIT25udnNPVThWd3FkL2FEeEJVWEEyK1Rv?=
 =?utf-8?B?eTVaTUtLSkFsYU9GU1hKVE92TkY1eWJyeXNLbWxMRk5Sd1RTZVdJSnpsNmRT?=
 =?utf-8?B?R0wrOWErMGFYbkZIME0xWGFiWE1OQ0U2S3BXMXZJMFRBdVRMai8rQ2hrWnZP?=
 =?utf-8?B?VGtuTmVMRitrKzdUQ0s5Y2RrSnhjb21ITTNUaG5BTkpMUmtIdi9SbWN3T2JX?=
 =?utf-8?B?T2x6Y3h1d0pOeXltcXdTSzd0aGt5MW00VUJEUzkrOFJlVjhucnMyV3J5V2NN?=
 =?utf-8?B?SlB1b0o5d1lmTXpRRXNCWitxRjV4WVpuMjdoY1h3YW1ubkpFTFN3M09YeERC?=
 =?utf-8?B?a1hDQnVmUXhZZHg0clpoY1BRZkJWS0VNc0huSEc1cW44MDgwc2Z5a0ZEaWVB?=
 =?utf-8?B?dExGVlo4Z3NaVDFMVnE3Z2pHa1pzZCtoOVg2S3Z4aHFtM1NSbXpWR05JVmNW?=
 =?utf-8?B?S3h5eUhIUm5zSUZPM2RLTHFRd0hLSytIRFdmQ1BMSlMzN0hwK2p2OFdMcU1H?=
 =?utf-8?B?TEd3aUgxNUgrYWFKc0tyOHo1eXNCZ3lEMGRCUks5YWxnK1VJSzRsUG9DUWFh?=
 =?utf-8?B?c2hKQWhyY3o5aDBZSmYvZzdvd2ptUmg2UnpTUS9WYjA3RVRTZkZTQVhRTStY?=
 =?utf-8?B?dHh6N0lsTjJhdzRLVTFDVnJ5WFJueFRETlVESkh1TTl6cFZaNWs0azB6cnU0?=
 =?utf-8?B?RXFNMy8xQUthc21QcnJ4bzJRdnd4U0RHN2lCS3MwRkFrSGYwQVFnYnE1TmtQ?=
 =?utf-8?B?cENJMHRBaHYvZGp4TXJCam84SlUwL1Zha0hvVDdFbG1wT0FGaWlwN2NEWk9r?=
 =?utf-8?B?ckF6d2NvdDZpN3VhNXhqWWwxQ25ySWdKMEZRMEtjTW1GVTB3K0NVTDhiNTRT?=
 =?utf-8?B?dU1lQXM0UlBuOWlwZThrNkNhenBoZS9GWFBQanJENUN6R0RyTnVydk1mL0FZ?=
 =?utf-8?B?QXZDNmlzWlc4WDJBQTNNVHJpbW83eGFnLzVnc05nRFM1NG1VeTgxSmJPY1k1?=
 =?utf-8?B?ZjBTVEM5R3MyMlVpT2tEdUJkek1IM29COEQvYVZab1dvVHVVVzMyblBqWER3?=
 =?utf-8?B?UXZEeVhoVFFvZjlqZFdtN0Z2K2NHVkVvL1pKNkVCa3Y1cnBWZG4xUGtldzV5?=
 =?utf-8?B?VUdLUmpvVzJBa0RvSmJXUisvZ1pLblVCSmpLNkFHTGd4UDdPS3hUUGU4LzNC?=
 =?utf-8?B?emx6UjE5T21BTkdYWjczN2MrUW55dUJScjh0Ui9iTS82WVJ4b2J0c2M2VFY1?=
 =?utf-8?B?UmZwTEVUUERXV0hRQ1JjenUvWng0U282b0ZSZ2ZCTTRBQ2I2K0QrZWxQSnBv?=
 =?utf-8?B?WVdFYitTYWI3ZDZJK1c4ZzQxekZNUkVDeHdEQWowU3h1Q0JOcFdyZFcvNmxT?=
 =?utf-8?B?VW9mRVhjSjVnZGpMN3o2S041UnFlOFBNc0JOUFNCemdaMmsxdzUrR1ZQUExn?=
 =?utf-8?B?c1pQZ2ZtcHZuNGpoa0dpTWpvRk54ckdDRlpsbHExTEJ0MEJjQ29HOG43NUNr?=
 =?utf-8?B?UWtJdXdhWnVtRzBybDI2MDY5TzJLTldCcWMwNEczc0R0Zm5uZHh5cTdNOTNo?=
 =?utf-8?B?MFNkL2pINVdYMFEwR0daZ3J4Y05kcjAzYzNDMTlXWHdJYW05UlFvUlRtY0tm?=
 =?utf-8?B?VzIzWmZ3VVBmWDZ3Sm1adjByZ1F0bEYvamJaWmIvVllOUFRDakZwU2E1ZFpo?=
 =?utf-8?B?dEp3ak1EZTEyay8zU0I2SmpHLy9ibkErU1hiNjd3ak9JR3MvalVWTVYxMVNq?=
 =?utf-8?B?UTl2dy9BcjFJWTVEWmh2SWgzSWlKUGQ4UFl1cUJ6UVBKcUlqMERyMzdRRHI3?=
 =?utf-8?B?ZDdqUytmMlMxd2gxZXFnVDFrUnRvR3YxZXlwTU84THE5OCtYMWxvYy9lV2Nq?=
 =?utf-8?B?TG9paTdibWJNM2tuSWJmOEkrMy9FeXhINDJNcS9DU04xc2wzUVViRXcyVkMw?=
 =?utf-8?B?S3daYStUSGw5U2hzeExvOTdLc3VuK20vV0RtUFFXVTdBb1liKzNGc3NhZGl3?=
 =?utf-8?Q?uQSJwgWvgXqUZwbakZZX2nWPYEuzb6ZD9WcIwLHtsNwdY?=
X-MS-Exchange-AntiSpam-MessageData-1: vT/KNCtTgrOgWfiWbs2Bjau3Q+FNurvCAqc=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 80eba998-b46b-4bc5-3650-08da245e3b45
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 12:47:16.9700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Kvlleaqnaw0hyAaXQUUOQtYp6vH/wJ2y1bS1M1+PlZ0DPOUMAzti22hlU7dLf2Kq5OoSUdP6LiBp/GxjqdjwqdJxLOuHGxyc7Lp+UqnV9J7fBdTSeFIrghVSUDiftbah
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6629
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2849

Hi Richard,

On 4/22/22 13:46, Richard Purdie wrote:
> On Fri, 2022-04-22 at 12:40 +0200, Quentin Schulz wrote:
>> Hi Paul,
>>
>> On 4/22/22 03:40, Paul Eggleton wrote:
>>> ZSTD_THREADS is new for kirkstone, XZ_THREADS was introduced in dunfell.
>>>
>>
>> Separate patch please so XZ_THREADS can be backported to all branches up
>> to dunfell.
>>
>>> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
>>> ---
>>>    documentation/ref-manual/variables.rst | 13 ++++++++++++-
>>>    1 file changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>>> index b9448b8..4803578 100644
>>> --- a/documentation/ref-manual/variables.rst
>>> +++ b/documentation/ref-manual/variables.rst
>>> @@ -8737,4 +8737,15 @@ system and gives an overview of their function and contents.
>>>    
>>>          The default value of :term:`XSERVER`, if not specified in the machine
>>>          configuration, is "xserver-xorg xf86-video-fbdev xf86-input-evdev".
>>> -
>>> +
>>> +   :term:`XZ_THREADS`
>>> +      Specifies the number of parallel threads that should be used when
>>> +      using xz compression. By default this scales with core count, but
>>> +      is never set less than 2 to ensure that multi-threaded mode is
>>> +      always used (so that the output file contents are deterministic).
>>> +
>>
>> I don't see how having it set to 1 breaks deterministic builds, do you
>> mind explaining?
>>
>> Also, this feels like explanation of the implementation more than what
>> the user should do with this variable.
> 
> I think having a cautionary note here about reproducible builds is important.
> 
>> If the variable should never be <2, then it needs to be explicitly
>> stated here (and eventually the reason).
> 
> You can set it, you just won't have reproducible builds.
> 

My understanding right now is that builds with XZ_THREADS=1 are 
reproducible, and XZ_THREADS>2 are reproducible too. But if you switch 
between them, the builds aren't reproducible.

Is that correct?

Cheers,
Quentin

