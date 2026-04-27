Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541D3FF8868
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 16:45:01 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.484.1777308300575604874
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 09:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=IDmoXtet;
 spf=pass (domain: cherry.de, ip: 52.101.66.32, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MO5UrKBth81o5LMBARZ3+Xw7oekZEOWOuVZPj0ASzgXwdSS69gRCX+8D2h0wtOCckimRk7pLcGfJM7T7LdbQZ/dZI4k+YZVN4BXIx0Zgyyg6D7bcY5u5QosKHhEGYzdgCKJz4yfG+fByX8a3Vog5RAtKruF1PH+pDt1g2fkLcNhwzeM5a6VYp2ScJStaOK7YzWxjwz+WeP75f71FMqKCeQUK4gPA+9BYdOKQFhL4J+EqxFKOJpPNDaz3dVEiSg3WwgV32Qa+CZpFnslzzGUbtsT4oAQYQi3IxACyExDoQjkeXZl7ASTtbmeg3D6ThQVoof1HoFVX9ixt0pIBS+ILRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsY3++jHW7lkO76lb0K+eXtbM4Ahf4djriCZu0hHhrs=;
 b=X31CquTr7cpqoVTwgMEJR4xIy5FzIbTnA5j/JEPy1pTv6D+iNu+0I2VkUxD8rQDgWN1N/V2QGBUw7JXbrNyw2zW/Ia3/YTw011ZgmmfDHx8rzfQI1CV9NFfTg+O+m6PKxjevz2rupM9gQ/aeKKAVzHG+ye3t1N63Ecr+3Zbrw1JSLAGOrf2EkVKl8DSElWJ/qnEOEohHIUc2K6Ey4UJa5G7zG+C2EwRNZQkqoEfEGvqzxGX0cnpeO2pRFZKwnlYB4EFH1w5T8r/GJgpPOOYW0A/65r3TpZUlQC4p0t8jqVDS2+3SaW+U+FN2RNgz5HkVOOGPQ8rI8+87p3JRpVt/8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsY3++jHW7lkO76lb0K+eXtbM4Ahf4djriCZu0hHhrs=;
 b=IDmoXtetNLy364rv+IYr/+zH8xC/05BsQ0Bu6iiUP97uo2fxlJwqfoj/DYg8WUVb02OIkYpuKZ3zwPeNuC+3gtrfAIdx9UqGooD+uuKSqvZP9s/s3vP6i9luL62GVB1BzJOF4zqhk3f3a8MHF6sIb0k1A8FCv1MLuitqUCtuz7E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by AM9PR04MB8971.eurprd04.prod.outlook.com (2603:10a6:20b:40a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 16:44:56 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.20.9846.016; Mon, 27 Apr 2026
 16:44:56 +0000
Message-ID: <abcb5550-13d9-4873-9ff9-df76e55d7fb9@cherry.de>
Date: Mon, 27 Apr 2026 18:44:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] Document shared state signing
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260421-sstate-signing-v2-1-7b572121f2fd@bootlin.com>
 <a4723996-6d07-41b1-a40b-35e12e48807f@cherry.de>
 <DI40MO4BDL1R.306ON3EYMK35F@bootlin.com>
 <1bcdee06-4590-42ae-afb7-1948d21d616f@cherry.de>
 <DI41OUUEK11E.3GOUTLCIKCHUC@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DI41OUUEK11E.3GOUTLCIKCHUC@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::18) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|AM9PR04MB8971:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b448f86-4be1-4653-a675-08dea47c500f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	2ghKoZgwEQ/7L4rlF1ZbcByxHMMbIVbGia7vKtanJVZnTEDRYbgJCED9/xm2b6tVYwc1P3Pa0pLxfKwlNc/YepKGpwlbfQAd72uJKtdrDl9wRLD1/rISqg0lmt40Q/dXd7R2jFcltC92VEuvNWXPW8iE+kVY8uIKDtHqz060tZMXU+Lj3kshIo1Wq2DMg4yy++9NcQoAwHTlSgbAA7SyyPMZZGNXw+tWKww2hQPJhFx4MgNePvuNqs8B1qbBd+vkOA23LWKmzPYMaTmFufH/QVy4y6ipunXzSNRF6v8ASh4Yo3WMSmWDKFo+pGqZO4SbwgIOK4d3O/c0ZYOYnRaThW0kNwByT6gsFminu3tTjWWPB8J/+40snICQVCrh8vyOrnrxph8hw2YuHO05M4Rlg8k9m2jQc0qPh+jB6gQb7hU/Z8JoP4tyZm75KQoivhKpVI4MICHnS9n3rg2CfsHRt9AZ6r9CM8nyOnomjWHPeCVhxgdbyiOXE13nG1ZqZRA5sBlzT6tj0I8pXyjeEEGlE3WQ8Vc7dRLiEJ0kCLpeYBrenXeSaD594M5j+3PpHc7bzeAjvzukMNQvGp31DNzY0OCp+YkqQVPRt7vBKKBFE5gX0VBhXjhV3GvZj2AsbhlcXKaB3cEEbQk6d0Vx95drQTL0q35vBz4qHkXgkhHEYOXMlcI120E3+LLX8Sf/wp7q
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z09uY0xScHRPamg1WHllZG1DMHVBMmRxemFlS1ZVSEpmWGQ4UFdUZzhlelpm?=
 =?utf-8?B?MmhSMnE2SUFTU0l2YlNtdVd2TlR4N0RhR04rcm5ZanFEQTNrdHk1ZWhNTm0v?=
 =?utf-8?B?MU95KzkzOStsTlA2UGJSdVR0OHVuYU1hdEYxa1dXa2VDZmN3U3drbWJEdlZT?=
 =?utf-8?B?QnBUWVlzT1lXNThxZ09JRDd4ZG5Iby9iN3JiTlVWZWduZHZicnNiOGllNjJi?=
 =?utf-8?B?c3RHTy9LODFYdTNWQVJKYmZLV3RUSVpZR2pKN1MwMjFKelNIVnJrV2t4SDhm?=
 =?utf-8?B?SmRWYnF4ejM5TERiSUpuZUpKazdDL1ZFc0xkV0E2TWk4VUlwTUNjdHdNcUFB?=
 =?utf-8?B?eHErd0tOZVQxblV6TWo4OVhhVnBManNMRU55UXViRjVQN0F6R3l0cktDNHJl?=
 =?utf-8?B?V2d0ZTNSWVdJVWY5OHdTbkJTVFVzYWFtSU5HMFVib2daZGJPOHdnMjRDTTUv?=
 =?utf-8?B?STNCbU45UTFYT09NUXdONzMzeXV1MGF1LzRBZ1ZvTUtJVTVZVzVHc3ZlTUZE?=
 =?utf-8?B?RjYwN3p4cTgwa0g5NW9XWjBncSt6WGZ0dlVURGhMU2pyWU9DNlFZL0ljWklS?=
 =?utf-8?B?RkJjbUZiamN2ZTJhd2tUbVZwTUZQUWFrZ1BNcmd3WVpRVEdaWmIySkxMdjRL?=
 =?utf-8?B?ZVVYaTFzOTZsTE1iVUlwSGh5SllMVXFLWDRaVW4vRkNraUpvYjV1bHViRnZO?=
 =?utf-8?B?ZWRtSERZRnhrZGRkS0hxd05mWEptL2NzdVlFaUszWXpUTzMvbEd5SzdVQjdx?=
 =?utf-8?B?cEMvRFZOY25YWEJhOTRIeUpDZDFGakxkK1cyS2F3dVRpMnFhSUY1dERIeXVs?=
 =?utf-8?B?VVlmTHFYbUlGb3BUNEpTZ0lGcHlRaFl1SktUNUVxOXdTcCtDOWJJWkFWb1pY?=
 =?utf-8?B?aVlGeGdWcE50SDlSN1JpcWVzSVdrMUxwb1hMSjRtVmdJZE5NT0t3RCtTRERL?=
 =?utf-8?B?U1hYOGV1SDdhUk84M24xVk5UbTVncndWWE9QTSszeGwxMkRURjl1MGtkRnk0?=
 =?utf-8?B?aG1vN01ITXBjSmZFLzJBNUVONGpWWCt6TS9UMEtJbElWendBTXlLL1dwbmhT?=
 =?utf-8?B?S1pNRVZybVRiRG8vNDdkRzlFb1puODdtL3I3OUdlOEhLcWkyUFRNdUtQN0to?=
 =?utf-8?B?YzRrV1I0ZDFzZXRiaU5MTGJOOHJPaVZzZU1DYjhqeEdrdHd0OCtxNkZKWjAw?=
 =?utf-8?B?dTJ1UUNlRzlQYk9OL3RWenhOdzVaZHVhTXBOK3lkcDhtalJLbU1Za2l0WHlm?=
 =?utf-8?B?VGdkUVdxMW5Uak03NWNHZHR1VHhTN0JFdjU4RE15L095V0RsL1ZDT0VrRFRm?=
 =?utf-8?B?VldkNzNLd0ROb282a1dHdkFCcjBrYkZiT0JaRytyVjAwZUFTdkwrdnk4N1hD?=
 =?utf-8?B?dTNXbmkwNDN3bERiMVU5dWJiaTVGbTA5cFB5MWtrUElLSnY2MlNhNmZDNGt3?=
 =?utf-8?B?eDQvLytGQjhtd2VDWGcrV3NJWHBLeHBRbHk5OGFyQWxtZmdCdWx5M2E3MlNq?=
 =?utf-8?B?NGxYT1htWWVtNHZpQ3lPQmhzYjFiKzFiL3VjZTB2YmdWMHgxRkZXZWFpTmQ3?=
 =?utf-8?B?OGh6QnRNdU5ZY3RkVTZEYzBUaEtDZE9GczF2V05nODZjZHVIOUkvN0ZCOUd3?=
 =?utf-8?B?d1gxMUV3UVdjdFlhRkg1Q1RhMFhMQUtieGpQc1M5M25SK2RTU3F2UGcyTjVt?=
 =?utf-8?B?clJsSnlXVzEzcWxVV1dBZmVGdXlxTS9FZ3Bxc1FIZThYb2NFZDRRYlJSRE5l?=
 =?utf-8?B?SjlHa3pLYW5vM1pXTDFMVEpSL2lQZGxOZjlmM2RJNVJZeVNidmIvNzZWY0Y4?=
 =?utf-8?B?UUlHR2trcllvU21HNkRuZkpiaW5GY0I3VkhUR0F3cFhJL1h3M3NIQ2YvbGY4?=
 =?utf-8?B?b2Q0ZkVRYzA4TUVqWmR4MTdGUUxZankvcWRZQnBxMnlpSmhjUjFvRTcvNXI0?=
 =?utf-8?B?U2ptb3JrMzN5TjNOb1cxc3ByU3YvM1JJZkVraWNZRmh0NkNDQzZiZGxvNlpM?=
 =?utf-8?B?S2pROFRwRGIxRmR1T0h3c1g0K2hIS1hWbWVsQVhZRFU1UHVGNzF6SG4yenpT?=
 =?utf-8?B?WU1lcVBEaFFocnBwamI1ZGJHVHVkTXZCL0pmVGJIQXhSdmFPemNvVVNKZnpt?=
 =?utf-8?B?N2FkSzl3WFNsaXFkTC9Lc3Ywb0JiSktvbkd0UmtBcXAwWnE0eGx5Sm9WUXFo?=
 =?utf-8?B?Zm8vQWVhMkhnTXVBdUhrOVl6bTgwMWNhRk8rMUp4NzVpbFRMcXJoT1NCMVhL?=
 =?utf-8?B?YTQ5THkxajYxUk1NeWxLVU14Z2EwdlNYbUxvcU9pZnB6QndZQm83UDJkLzJ5?=
 =?utf-8?B?bTlWYXM1V1JzUW5kM00xc0llUC9SSTQvMDA3YU5yNVdQYUtQbzZKc0E5RWVC?=
 =?utf-8?Q?dOD05U/EZtqn3A5AySKnYKsypfA+T2tWLnLJf?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b448f86-4be1-4653-a675-08dea47c500f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 16:44:56.0944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0MFFU5CxT6AJ2PtdFKD86V/xjHZAbXR2bCGohL5Rrng74uoRKHOfCnE0mdEWtz7DHax3HlLCMAGFHPt551ko8bo9lWbwrH+OYiYaiXkFMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8971
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Apr 2026 16:45:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9375

Hi Antonin,

On 4/27/26 5:33 PM, Antonin Godard wrote:
> Hi,
> 
> On Mon Apr 27, 2026 at 5:08 PM CEST, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 4/27/26 4:43 PM, Antonin Godard wrote:
>>> Hi,
>>>
>>> On Fri Apr 24, 2026 at 5:18 PM CEST, Quentin Schulz via lists.yoctoproject.org wrote:
>>>> Hi Antonin,
>>>>
>>>> On 4/21/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
[...]
>>>>> +      .. parsed-literal::
>>>>> +
>>>>
>>>> You could use
>>>>
>>>> .. code-block:: console
>>>>
>>>>       $ gpg --list-keys
>>>>       pub....
>>>>
>>>> to avoid having to use a literal include.
>>>
>>> This use of parsed-literal was intended, as it shows the last 16 characters in
>>> bold. I'll add " (in bold text below)" before the colon.
>>>
>>
>> We can also use
>>
>> :emphasize-lines: <line-no>[, <line-no>...]
>>
>> in code-blocks, see
>> https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#directive-option-code-block-emphasize-lines
> 
> I want to highlight a specific portion of a line, I don't think this does that?
> 

No, but I vaguely remember there is an extension for that (there's 
always one for anything in Sphinx it seems like :) ). I don't think I 
was convinced when reading the code/README so wouldn't recommend.

Is it really necessary to highlight that specific part of the line? A 
small sentence after the code-block to say we are interested in 
DECAFBEBE in the highlighted output could be good enough.

But not a blocker, for sure!

[...]

>>>>> +-  :term:`SSTATE_SIG_PASSPHRASE`: the passphrase used to protect your private
>>>>> +   key when creating the key, chosen when creating the key pair.
>>>>> +
>>>>
>>>> Am I the only bothered this is an option? Is there no way to use a
>>>> keyring or the gpg-agent instead?
>>>
>>> I don't think so, no.
>>>
>>
>> Terrible security practice :(
> 
> Yeah I agree. Maybe it's worth opening an enhancement "bug" on Bugzilla for
> this, what do you think?
> 

I guess so. Considering nobody touched that code in the last three 
years, either it works really well or not many people use it :) Doesn't 
hurt, it's only one more bug in the Bugzilla :)

[...]

>> +            return True
>>
>>            import re
>>            goodsigs = []
>> @@ -145,6 +148,7 @@ class LocalSigner(object):
>>
>>            for sig in valid_sigs.split():
>>                if sig in goodsigs:
>> +                bb.note("Signature file %s successfully verified with key %s" % (sig_file, sig))
>>                    return True
>>            if len(goodsigs):
>>                bb.warn('No accepted signatures found. Good signatures
>> found: %s.' % ' '.join(goodsigs))
>>
>>
>> ? I think we may have a few people resisting this as I'm guessing this
>> is on the hot path so adding messages isn't the best (even if disabled
>> most of the time).
> 
> I see what you mean. You might be a bit more convincing by passing them through
> bb.debug?
> 

Sure, I randomly picked bb.note() but anything will do (though, does it 
appear in the logs, which is what we're after after all?). Even 
bb.debug() writes to the mainlogger, so I'm assuming there's *some* cost 
even if it's not printed. Did you try? Does it work? (Because I just 
wrote this without even running bitbake with it :D)

Cheers,
Quentin

