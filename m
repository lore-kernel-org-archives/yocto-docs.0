Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD7DC61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 15:43:22 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15646.1787758998969922723
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Aug 2026 08:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=MrYDA0Ie;
 spf=pass (domain: cherry.de, ip: 52.101.66.8, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHbp+1BQVO9U7lNXL1f+E1WVdZSEI8GVc8eVDNUZlpnT0J/hgqcFngNzhbp+PJWB3U/THi872DnXpSNdLCfOr218zYGHNJ+/3ks5/Ey1xMvuOBr31G1dw3N2jo//6Fawklzpx0P6xnci3ETLQYuguYfaMGXrWwH6iimJxr3pKkirW4zgTshueOMKpw3UtXyZGQ73CxEDIsHYKklRzV4/j8tbpEMabLaRDlNCE5lI6ufVEP2i01Kl56dbJ2jW45XYsXker+N3EcTTgA2Fgz1ZG5MDvKgj+mPr+fPCAH4cj31ljhB8052QCt4mpOxQEMxJUPFAc2R4WZFCI0KFkV9JQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUch1OasHvhWpmsboh8ZYL+WR5cjrCLSC3hdQ8097qM=;
 b=EQK9rlRcN0H7k4Tw26G0zvCuVRpiZbGZfXlxep9IoDFGGTPL07sTYsMoVMVL4jpoPzVjtKcdRfqyI0OIZlJBtQG9CZDc+RipPxJ5dpHXzLWHeqMDiXi5qID/AopiKVbejfZaDbcGnjII60bZmOsjmhzIb+f0qfgzPWWI9Ob3zXMPL+p0rAmU1MCDn1UAi5Xuwcdxp2zs1YJ4Xj+WcUD0WrgXKPJzumDt08O8BzkYUB6UCD84GaL+r/4s/5TAhUImrhKqCmSW96IXSH5NPfATrvif5pBPGkZYqBQ4Ea8CBTFJ9Dyoc0NKJwcJ4no1sDkGJcDuqRLpFI8aP2uALKjeMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUch1OasHvhWpmsboh8ZYL+WR5cjrCLSC3hdQ8097qM=;
 b=MrYDA0IesQcftCK9tHMcbBJ7dmmKDlbbOG2Omi/pXhnpsgMzHR+OtqceUelLXORQ9gsl0bdcPxVwgKXcZYQ3NUn7SQikHYNtBeNKFVDMIcy8z9HIpgXPd6dIT0YU0G7wsYsbgJ5/bxSPwjI/W6cXWIFnqt0yFeMY8tJH1bjkevk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by DU0PR04MB9369.eurprd04.prod.outlook.com (2603:10a6:10:358::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 15:43:13 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%4]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 15:43:13 +0000
Message-ID: <6f60c33e-17aa-45c9-b23a-dd46baa1a207@cherry.de>
Date: Wed, 26 Aug 2026 17:43:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 00/10] docs: highlight BitBake snippets with the
 bitbake language
To: Antonin Godard <antonin.godard@bootlin.com>, twoerner@gmail.com,
 docs@lists.yoctoproject.org
References: <20260826013502.2674000-1-twoerner@gmail.com>
 <34c79745-33ff-41dd-bb85-144bb26b02a2@cherry.de>
 <DKYWEFNK1215.22ZC7DOYBOIH9@bootlin.com>
 <78a29634-d64c-48ed-a012-71fff5efcb75@cherry.de>
 <DKYYZ48110MA.28EKFR3DVIU9C@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DKYYZ48110MA.28EKFR3DVIU9C@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VIZP296CA0021.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::7) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|DU0PR04MB9369:EE_
X-MS-Office365-Filtering-Correlation-Id: 761fa15d-0e5b-4367-3454-08df0388bd2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10070799003|4133799003|3023799007|10067099003|56012099006|4143699003|11063799006|5023799004|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	U5ZoN5vzLXkKLqtb8uM2lbjte15f7t7R1xzMJkDKdG18z4g3TEj8c8t9DR9+AGDb6PMBur6xj3ugH77nORy6JDyT/35I0ClaZCqRo4drf6l/dX6nxF3pyfUZAELdVphrNdqwW+MK8WnNrITTFxQZqsqwc0fDxwG6XufRNKveAE8MF0atiybMEl14Qqt3yuPtK5I0KYdekf0foBl3ZL659r353DfdgTY4xSqP1vkvHibF3Kgo1AInmHMlE+iPp8Lw4ywB7gqrUYBqmSqesgFjlcXOPi47Wvl+HfWJmXAYy7GRw0FkSXuddyTaxY8MshY+N+D1HFTXjAAIYZkIzUGNrX++jJwZIEf4bnB7rM6HpvxrWF57KWG5b+1gmH+vFctYy1VTbbEpuU1jk/eFFmFBo5rcoqhyYdnhuyxwOX7MVYEZ4QTm5v173B9OkO831ZB2Qmr+Uz3PZjALVbWR428at3uMrP206yHLlLQ/r8Hvr/U8XChSXPVOrHS3+EKxUWgHhDxaS8/TqtMRNiaNxmLV6cWC7ZkTZlWqneicunigpQEa8o9LFUnGqbpxu+mSOWI/AgDlP/1/5uiCALZXD/T04IUtf48NYETqH4XzvLAHGfZa8kqcLf2uphQ4PtOw0nzQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10070799003)(4133799003)(3023799007)(10067099003)(56012099006)(4143699003)(11063799006)(5023799004)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cllkamJNLzJqVUpYRXBLRVJXenNITDBJUVJvdG1BYWJUcXpvaGlPaXFRQmIv?=
 =?utf-8?B?ZmNvTytMTS9GNnU3RWt6YTF1TXBVR3pqYUd1MTFmbE5jM2JMQWxnWmFSZ0sv?=
 =?utf-8?B?c1VaY3VhaHhQZmRnclY5VWliVmRqMXBQdTgrb0xxY1JwdTZ5RU1yVjczMjJz?=
 =?utf-8?B?UkszQndXV0JET0pneXBzQXFTM1hEVkZEQUFJUDB6U2JOS1RaNVNVYWxna3Np?=
 =?utf-8?B?T2VPRHNxSXNtYWFQLyt0aWRZSmNLSVNuNlA2T2xuMnZIR0pLSkthSU1IK2Nz?=
 =?utf-8?B?ekphandNK0pyZGZqTTUrdXJrZDFtODkxYmpLdzc1b29yakJNTTB5aHl3NGlH?=
 =?utf-8?B?Q2NnbmRMTjdWOGZIc2N3VTZwdTF3c3M0bUJkNkdraVF1T2xERVV0TTcyYTFi?=
 =?utf-8?B?anV2ZFV6c0xDYit2dDkxazR2K0QxWDk4a0pWSmlnMHh4SnpFS2lrdXVkaDd2?=
 =?utf-8?B?K29SNVhYQlllMzhTSkdIbjFuT3N0VFhaN0FPQnFOVzdvdWFDMjEydmZ4bWwy?=
 =?utf-8?B?UXNGSHRyaWY2bExHSm5OcDlJckJkZUxIalJYYzg3OVJWRWRFQk12cWFUVld6?=
 =?utf-8?B?d1RmOTExMEF6OXRLUkNjNWxJamhxQ1VLQ29aQ2NvOWZpL01EWnBkUVN4Z05Y?=
 =?utf-8?B?R0FObVZKMzNpdmEyZGpKTTZaRzNIbElVNzJONm9nMzIxeFhrL0krVlBQZjJZ?=
 =?utf-8?B?MG1PaDZwTUxyanpEN2JpeGdENlJTQkpoNGFqWitUSmxWdFRLZDAyYkpuOGlC?=
 =?utf-8?B?WUd2Wks1NmxBOEFaUEpLdFlvMThSdHNHeDgxVDJLUy9KbE00a056eWd3bkQ4?=
 =?utf-8?B?bnJFT1FnWDZCeS9ZdDZPR2IzRGNjY0gwRFdnZDdOR1hFbnBjNjJqYWZ4VDZz?=
 =?utf-8?B?Y0dEbzVSNEdaamM1ZmU1cWtOcUJXYmhuUkZSUU9ERXpEV1RHTlJ6TUdMRkE3?=
 =?utf-8?B?VXZ3Mk9rRmFlRXBhZTcwNlM3RElNTjEzajZjNmNDUnJFOGxmZWFOQUY1TTBj?=
 =?utf-8?B?S0lqbWMyTVpubFI1OUxMNGZqRGVORHlZekxJL1RlbVFEMmZkOXdCSW1ZeHN3?=
 =?utf-8?B?OEpISGVJWjJJaUFTQmtRNWN1a2luSUtlbGxWcGZJVmJnU0s4N2tsTGlWTVA2?=
 =?utf-8?B?WTFubU1BdjVVY3c1MWlJSDl6eUtlMnJVSHZnTXhQdnpPTlIrdVlRK1pGdk9t?=
 =?utf-8?B?Q0JnK1JMazhnaW1VWTZtcGg0TUpjV0lJalFQWndPUXVyZlE2UWlhT2gzaVJL?=
 =?utf-8?B?Z0RJdEZaY1FITXREVjh2cURSTG5DZEVVUWNpS04veDQvTFltVmdrMlRrQUZB?=
 =?utf-8?B?c001Z0lMSlR6VzRNdTQwRk1LTCtxLzZzSTgxb25zUWJnY05FZXkrZnE1RTZI?=
 =?utf-8?B?bEIrc0ZhWmhwQ091RExpUlFTTXFlZ2RJbjdMM0YreTh1OEREcEdTTk9OS2x5?=
 =?utf-8?B?c0pVNnB4a1hEUGZ4QmJ2czY3bVhWMGlJUEFyS3lLYlJ6UTFmalpVK3Y2Ny9l?=
 =?utf-8?B?WE5rV0F4d0k1K0hOSVY2ZGRHSG9nYk0vTGU2TjZtclNmaFVDQm84bllnWFlT?=
 =?utf-8?B?NEs2MnZFMXNTQXM1VHRIQzNUQWtJTTF6bkV0aWNFMmUvUDkrM09iKzd3YWdP?=
 =?utf-8?B?Q2wxaW5ONUxRbGttY3RQRUptYTBWNHZ0OFd6eVUzM3I4anlLcnA1RTUzYVA1?=
 =?utf-8?B?c2FBVWk3RVFsMU1rWEdFRm83NElvRnl2MmdRZlFqakdMdjJvNjh4a0RTVk5o?=
 =?utf-8?B?SDh2SEw5M2hrZFE0L1NCaHBzYmtmd3BLV09xME95aFp2aUNmbk9qQnRTbjhz?=
 =?utf-8?B?S3Bqb1A0SGgvTlJuVGlFQ3lZeDhvSEQzNWp2RFFYUzdpTm5DcmpKRXpOeENi?=
 =?utf-8?B?S0hiS05YanR0M1FxY2l6TEsrK0pmSHZoTnEzdzh0MzZQT0RxMmhud1dZSGVX?=
 =?utf-8?B?eVk2eUJFeHV1K2FyOTcwMXgxN05YdTFXUDhGZ2tKcnBETmpuR1ZrZXk4VjVY?=
 =?utf-8?B?RmdZdnZBVmNhSkNmaVkrRFpwcVIzNm9zSUpGbTN3MjZEV1pIQk9qMGdpV0NF?=
 =?utf-8?B?Mi9FT01Vc2FwaW94WjNYOVVnSDl5WmpJazB5TWtPQVBKM2psbWFKaytYbjI2?=
 =?utf-8?B?cHljT2pvM0FnWnJHWXgycWlEMUxKK2tIU3NIODlXK3NPY3dOZGRLL2VSVVpz?=
 =?utf-8?B?UEFYZ1dpcy8vVVV0OTNiaHc5UTNhWnFBZGJ6bnh0UHQxd3Z6QnVhNTd1QlZU?=
 =?utf-8?B?bFpuU1RVdklRNndqQUdSR2YzZTZ2VFF0djNOZnRUQkh6c01aSHFSQTJ5SnFL?=
 =?utf-8?B?ZXpsV3ViajZCUzduS3hxK3I0ZVo2cXplQzdrZW15REJWMnVPL0dZS0dlNHZp?=
 =?utf-8?Q?J3sjDUu8EDu+tOK/464NE4j7zK2zkQvN+kryjh4AuSYRM?=
X-MS-Exchange-AntiSpam-MessageData-1: rabwSB2nU2RHQ/pufKjLb5lkOw6OUpfyiD4=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 761fa15d-0e5b-4367-3454-08df0388bd2a
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 15:43:13.6193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bb19sRdcLwCHMXjBHS8EHoDNK0Q2HXQPl1ulBA0u4AiohLJnWtJxToU42A1xIHylCz0VoIQER1Pwr86nZqeuIS4TsEbtjUQdp9MzbeUgBoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9369
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 15:43:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10370



On 8/26/26 5:10 PM, Antonin Godard wrote:
> Hi,
> 
> On Wed Aug 26, 2026 at 4:34 PM CEST, Quentin Schulz via lists.yoctoproject.org wrote:
>>
>>
>> On 8/26/26 3:09 PM, Antonin Godard wrote:
> [...]
>>>> I think this is going the wrong direction. We should actually make
>>>> explicit the language of every :: that is NOT to be understood as
>>>> BitBake code and then make the default highlight language be BitBake.
>>>
>>> But then this might get forgotten? How about having the default highlighted as
>>> "none", and make _everything_ use explicit code-blocks?
>>>
>>
>> """
>> The direct benefit is the ability to still backport whatever needs to be
>> backported without having to care about the highlight language being
>> explicitly bitbake (which won't be available in every branch but master).
>> """
>>
>> *exactly* the sentence after what you quoted.
>>
>> It's bound to happen someone will want to backport a patch with
>>
>> .. code-block:: bitbake
>>
>> Either we'll forget during review and it'll break the docs build, or we
>> need to adapt each and every patch/commit for stable branches.
>>
>> I'm usually the one trying to add friction to processes, but I don't
>> think the above is a good idea.
>>
>> I'm trying to avoid having code-blocks set to use the bitbake lexer so
>> we can easily backport without having to care.
> 
> Our current active releases where we backport patches are Wrynose and Scarthgap.
> Both use the same buildtools tarball on the Autobuilder, and contain the same

But should they? Aren't we supposed to build the docs with an SDK we 
build from the same branch as the one from the docs?

> version of pygments, so backporting patches that use the bitbake lexer won't be
> an issue (from an Autobuilder perspective).
> 
>>> Sure, this is more efforts and review time, but also this is how other markup
>>> languages work - like markdown, where by default (when using ```...```) no
>>> syntax highlighting is done.
>>>> This is maybe a more conservative approach but at least it doesn't
>> leave room
>>> for code blocks mistakenly highlighted with the bitbake lexer.
>>>
>>
>> It's currently mistakenly highlighted in Python if it looks like Python
>> to pygments (the default).
>>
>> It's the Yocto/Bitbake documentation, I'm assuming the overwhelming
>> majority of code-blocks should be BitBake code.
>>
>> If you really want to require explicit lexers, then set
>>
>> highlight_language = "please_specify_the_highlight_language_for_this_block"
>>
>> in conf.py and then everybody will have to set one.
>>
>> Again, if you explicitly use the bitbake lexer in master, you won't be
>> able to backport those patches to stable branches easily. Or you'll need
>> your users to update their build environments to use the new release of
>> pygments.
> 
> We can add a requirement on pygments:
> 
> diff --git a/documentation/tools/host_packages_scripts/pip3_docs.sh b/documentation/tools/host_packages_scripts/pip3_docs.sh
> index 852845783..d7a983731 100644
> --- a/documentation/tools/host_packages_scripts/pip3_docs.sh
> +++ b/documentation/tools/host_packages_scripts/pip3_docs.sh
> @@ -1,3 +1,3 @@
>   python3 -m venv --clear ./yocto-docs-venv
>   . ./yocto-docs-venv/bin/activate
> -python3 -m pip install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton 'sphinxcontrib-svg2pdfconverter>=2.0.0'
> +python3 -m pip install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton 'sphinxcontrib-svg2pdfconverter>=2.0.0' 'pygments>=2.21.0'
> 
> And backport it to Wrynose/Scarthgap?
> 

/me shrugs

>> Or maybe you want to write a custom bitbake lexer for stable
>> branches that is an alias to the "default" (the default value of
>> highlight_language) lexer, but only have it if the version of pygments
>> doesn't contain a bitbake lexer already.
> 
> This could be an alternative, yes.
> 
> Quoting your other email (https://lore.kernel.org/r/66624f77-ae0d-4670-bd99-c6ea9d2b2a54@cherry.de):
> 
>> Sphinx explicitly states that Python will be tried and if there are
>> highlights warnings, none will be used. c.f.
>> https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#showing-code-examples
> 
> This is interesting! If it behaves the same way with whatever highlight_language
> you set in conf.py, then this would be less of an issue I guess.
> 

I don't know for sure without looking at Sphinx's source code but my 
reading of the docs says "no", this is specific to "default" 
(highlight_language = "default", which is the default value if absent).

highlight_block() in sphinx/highlighting.py has a check when there's a 
parsing error to use none if the language is currently "default". 
Reading a bit further down, there's a check on the force flag. I'm 
assuming this comes from :force: from rST, so I'm not sure whether we 
can actually pass it by default (and in any case, we would still have a 
big fat warning, which we don't with the "default" value).

"default" seems to be a synonym of Python in get_lexer() as well, so not 
sure we can simply decide "actually, no rather bitbake instead of python 
lexer".

I haven't had a deeper look than that into Sphinx source code.

Cheers,
Quentin

