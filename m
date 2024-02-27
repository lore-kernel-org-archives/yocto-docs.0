Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9877C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 12:24:10 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.116])
 by mx.groups.io with SMTP id smtpd.web10.10942.1709036638519964296
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 04:23:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=hIw+jER2;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.249.116, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFp+1SfciMGiOWxp6Yr9L1vVC6C1IkHGZNhtr5Kh05lNLss0vNcsZpcgRcEUAWL1dBJ0lbhkVz6wiAUgtPhxHREgS9W2ItxOb2DgYXkEpBTo4q+Uz2xMK4zFkV3shRG7rdOuCkm90Zhn/ghGQgQx9Bwxq49PpokeewohAoNJTI1cjgTmKFL27e+Qw/Q2xhj6nBBNpyRR06bD6e44IFGkduA2HkwJJkbt/JhZPdiqjxRv4pTA8gTD9lu7Ee4yb/lwgS/RdN4tQyci8tyPJmU+5Gvy/+T1vOFUlka0s0QHkYD45NbeVP0tEwEmP+YdufC9C50hf4LaceNrMZpLoiV53w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDzih2SyiUDT/rR+W9oGOHXBI6tskI/utIsMYj7ExqU=;
 b=Kegy59a/7vhNajol26S4VmUt3/SAHvxAPRgt5xyFsdi2eoc3vHMpL3liEJ25j0vraV88jo5kR2zjFdoPjQBeXx0ioF1E86ejBB4y2RAOcWZ4kb1DCnxYym02fUpRJJK6c4d3Jiaq3SwV9HEhZrzK41JSB4Etk5arPoUQZRE/xzltKETu2nh8XjuTAzWGsTI4XvZocS5IA2Bdlql40phrTQBVj5h2i9s1pv528GEdOy9UYRng+GP3ekaGKGsTlO200QVaIQXwikV3mGrNS7/dU+JtZ8zeD52sPIs6fML75WyHp852xoLTagobI2dIoCetfK0nAwjQQqn6xU5GDde2ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDzih2SyiUDT/rR+W9oGOHXBI6tskI/utIsMYj7ExqU=;
 b=hIw+jER2/CteFI0Aw1t2Je4/yUiB5dNHNG8BOtNN9fG4cmIIMTcR7BKxA/rf/kbP8HVZK0UrmYjO9Knl3TOwGn7o3W2I+6n0txb58rPro8JibE7tosKkgLKPn/8HQkIKgd7oZZMD5LjX/0x2acfKSdbJ148n1PUMuN7RUEO3qqsap4lZJxnel3hioLYlygCZn5uc7Dyg2eRwtuf7UtUCyMQ+WwgyO36ZrMDJsEMi6wEQK4A3Jo3QLhyzb9q4rpF0uwbKp48kkgt1Hi/yVjC61wZDkEs0J2+8YPtRZ+tSq7yeQPE38p3YcEKvpW7e+xRFr+9vZxappvmDJ4dVl97QZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DBBPR04MB7531.eurprd04.prod.outlook.com (2603:10a6:10:20c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 27 Feb
 2024 12:23:55 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::550d:ad96:e3cb:9a6e]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::550d:ad96:e3cb:9a6e%5]) with mapi id 15.20.7316.035; Tue, 27 Feb 2024
 12:23:54 +0000
Message-ID: <1d1b0f9b-cc95-4024-8001-1c3a53546890@theobroma-systems.com>
Date: Tue, 27 Feb 2024 13:23:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 1/2] ref-manual: tasks: do_cleanall: recommend
 using '-f fetch' instead
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: docs@lists.yoctoproject.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240227-clean-tasks-notes-v2-0-35fb627e9ca0@bootlin.com>
 <20240227-clean-tasks-notes-v2-1-35fb627e9ca0@bootlin.com>
 <0ea73b57-b0ec-4a29-a0a2-fc16c01b077e@theobroma-systems.com>
 <20240227130009.02bd611e@booty>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240227130009.02bd611e@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::17) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DBBPR04MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: 321beac1-541b-4c0d-29db-08dc378ef6e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lj481YLvr1+XNO1KjOr54Tqaccs3l/Ldl+thXVXdJhIr0oH2p25jpGrDQYW7EQ615D6qdi25xT4+Ma4yzUmGoA3RKfODbldoflnvYoCOi3NhqLM6JZvoHn8OlHGJOJRzBahl7VJ92HTZLut401WzX+MjTlxAg6cVyGWgst7u0Yv3C6ylhNa1+ChvwnDPsL2sKv2LDXcJ2NnAfBm607TxbMgbOTJxTPE47KX/uNg6Z9ARNaDT+Em4rBk6xZ/WWVvmOLFGERvLsoBoJcEB4vytmewp2tErEi+rEadAcV8dvI4NU0m12EOn0POLtRRTRawaxEC/yUEUsjSt5Y4har7XEY1dwQK2zzw7MlBrqYvF3luGoQfL7VTVnyGwKeQwa+RmM35kJxwmhP/297CFYWZAXjdmpM0rCo6ina1rbIjA+LR0c5zrqY4GwLUcLmINJZlxB4KCf63lPVMvCcSAxFI3ApZn9dn42V1QZ+dqPApcmXLF9zU9z5BsksQY3Jn/ixQHif2nGJlm3r+L2XU+qeRPVgHlfCon7Ve+okgtQkGv6GUB/eO8ClL30LwREhvsvK6no0hDKktRRXZIEwBGFbYauQVPETLo99dQekHo3mbef6DY6SxlSP4EV2VIAGdSV3kjhpKDwJB31AGalMGGW9+EzA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Yzd2QUZMMzJSQWk2b3pySS9RRW5YQzJkK0FCdTJqNE9DMmVEVkU1dzdXejda?=
 =?utf-8?B?QjZqSVNnNWNSMDlmOTNYNmtTWVZLS0NYV0ZxZVpaRjROL1dpSG5oUDJsVTlX?=
 =?utf-8?B?eGtCTlZaVmR0Q2hFb0RxMUJIbTlIbGFUWXgvcWg2VzUyTmoybzV5ZWs2QVpX?=
 =?utf-8?B?alp4WkJ0UDBvampOTVZXdzFPNlVZMDN4L3BwQ1o5Z0FVOW04bUxPSTBUeEcy?=
 =?utf-8?B?cE5naFZrZmhzK0lkODFZZ0xCcWtsK2xvNnBBNUhpY3VaMGRETSt6YTlLL3dE?=
 =?utf-8?B?TFpTdCtqbHcvdGFTVmdHTnFDWUJjcFdsL1pIUWM0UmIvbGliLzkxMFBZSDNs?=
 =?utf-8?B?eVdTSnpmMlNRbHVEWDZPSlhoVFJXN3BBK3RQUm5MT1A1OVRvQ01jcVpLdHB5?=
 =?utf-8?B?MUlnd1dRcjN1R0xDa0RCSzkxUWVCYkFwcVhtYWpxT0haU2lmdHZla25KWHFs?=
 =?utf-8?B?SjBOK0dxM2NDa2FMN21WVmZaeVZ4NXhabVMyamtkdG5pczI4ZmNiOUFReFlz?=
 =?utf-8?B?eW5JSklRNmhvZXJZQzI2YnBHV0xsZTFTR0RRUm9sWU4wMURlSEpDNXhKWnlz?=
 =?utf-8?B?TVdZcllsNndhZnc4Q2grRm9STUhzZlRNZy9Gd3ZRNThRVEkrUkZYY2ZLdllx?=
 =?utf-8?B?dzZ1RllRUFJaQzR0UXYzMDYvYkhSaVhPcGp5SGV6MTBKZHYyMWlxcmN3all4?=
 =?utf-8?B?TGIrelJ2anUrN2J1MTExTWNWWVB3SWJQVi8xTFNFOEUxby9ZNmpBUVNiZjc1?=
 =?utf-8?B?bU14bnpUVU55Z0VlRXFzbVNFakZRMjhtb2t1cjhLb2VCV1QrdFhjQXBaYldV?=
 =?utf-8?B?WWVNZGNyYWRBS3ZtcjRveTQ2cU05bmVvbUI3endLYjZacnB0UnQzS3VNZzVy?=
 =?utf-8?B?WUhqMGF3RGhIRDhnQ2Rkc0JXN1ZrejlTelhaQ0J0V01GTTZ1WXRQUEpnRTYr?=
 =?utf-8?B?U1p0dnIySnNZZWxHWTM1cEtnVndZazRzMFpGVmlFZzMrc2xXNjBGYjhsTUdN?=
 =?utf-8?B?MUk0SWs2WHRjOHBCZmlSN2lwWUh6ZVA4a3dPeVlNYVFsZTRET2N1MnZFRHRB?=
 =?utf-8?B?NndXdWRuMGNEby9ML0VQekZic3NSb3lIVVBOZE9mMm4vUWdtTFIwbC8yNDF1?=
 =?utf-8?B?SGViT3NrMWorZWpMTlBsMndhWmNyVlBTNlJmY28vUFFLSzJSN25PSUx1elN0?=
 =?utf-8?B?Y0RRRDhsdlMya1VJbUxDNklCQkNSK3ZmN3VTNXA2M3ZCN1U5ZmFXdEpvZEZY?=
 =?utf-8?B?WXRlcnRTa08yS2RmYW42V2c3bi9XczNCNitXMnNYbGVQZXBQR0NveFlqWmxj?=
 =?utf-8?B?ZTFRcDNYUDJBZU1JMmxWSWlLL0I0MmhwT0VuMG1WdGtmUjE2QWxXU0pJdHVJ?=
 =?utf-8?B?M2JwM24ya1cvd25WdzNMd0F6RTREbHFXZlQzS1A2d21vMHFpOE9FZzlseDZp?=
 =?utf-8?B?cGI0ZmFpMUJldTZxMnNlMlB3VXNha2tsMHVvRFNxVUNjM1lSSEV1aGxCZkYz?=
 =?utf-8?B?RFpEVFN0SWF5ZnRxN25PeVdXSzNrNCtPYXFYTkhPM0Z6ZTRuc1dyY2hDRTVH?=
 =?utf-8?B?M1F4V2JTTUR4S0owY3VSYzdxeUZTai9jQTBvTFprWWJ5S2l1bkxxM2RjUmVR?=
 =?utf-8?B?dFpTVFpSdEVwdkh3V3haNm5vcXZyUnNpd2xBUGR6SEdGamlxSUk5VTlOdjF2?=
 =?utf-8?B?alJkdmx4NlZ1Z1RIbjM3d1ZNb0tnOGZad2VOVHlHc1FJbEU1dXV2QkU4WDRP?=
 =?utf-8?B?bGxhVk9abTdUTDN6ZDZhbS9PbUJXYUFXNjNDVjVjbEJMT0o1eWNOa3JQeEt5?=
 =?utf-8?B?aU8yK2JwaXIvUncxRlo0S0k3Y1hOMktoVFYxbVB4ODkvQ0g1TmF6b01SUlZR?=
 =?utf-8?B?UFNDeUJobWpYbEN5a21MaFhsTWZCNXVIaDd6NEI3ZTlXU1VweWFGS1NoaUIy?=
 =?utf-8?B?WXF0UFVXdkdreUFDMHhKeUxGd1g2cXBKSTN0UFd3aHZ2YlQ2eHkvV0VQbTdH?=
 =?utf-8?B?VWc2eHNQWGRzSFowZHFTTkZaMDJSR2FTTlpIWHNsM0ZQY2pPNVFWV2d5K0tR?=
 =?utf-8?B?aE41VXNOd0Vab3p2cWlyN1BZSXc5Zm5OU0VlUy8vTU1TNHRIZTRIVG1NdmRD?=
 =?utf-8?B?V0NlazhhV0h6QnliU0tZeXdOaWNFN1JNdXZmN1NLcHhhOFBEc3hqT2FlQ3RB?=
 =?utf-8?Q?snCJutR2mN1goYJ8iA2JEGg=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 321beac1-541b-4c0d-29db-08dc378ef6e3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 12:23:54.8228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcRyIbFKQfTV012rCM9NvV+5ElZbjrW6PSXG7MpZ/Y+ROmY8aU9JVxcwZjv6kBSSSb9MemB1qNdM4wui4FVdgAX/qSNC3RKzzfNagCbfcH4wOSX498JlQCEgp/aql8ik
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7531
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 12:24:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4883

Hi Luca,

On 2/27/24 13:00, Luca Ceresoli wrote:
[...]
>> One of the issues with using -f is that it taints the build as far as I
>> remember and you'll get a warning for all subsequent builds until you
>> clean stuff?
> 
> Yes. But I don't see any other way out other than removing the entire
> tmp dir... the warning is maybe annoying but harmless anyway.
> 

I worked for a company whose build system was blurting out lines and 
lines of warnings and it took me some time to teach people to not ignore 
those warnings because sometimes those warnings were actually important, 
so that's where I'm coming from :)

>>
>>>
>>> Reported-by: Sam Liddicott
>>> Link: https://bootlin.com/blog/yocto-sharing-the-sstate-cache-and-download-directories/#comment-2650335
>>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>> ---
>>>    documentation/ref-manual/tasks.rst | 25 ++++++++++++++++++++++---
>>>    1 file changed, 22 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
>>> index 0db960b22f80..ebaa03dc7613 100644
>>> --- a/documentation/ref-manual/tasks.rst
>>> +++ b/documentation/ref-manual/tasks.rst
>>> @@ -470,9 +470,28 @@ You can run this task using BitBake as follows::
>>>
>>>       $ bitbake -c cleanall recipe
>>>
>>> -Typically, you would not normally use the :ref:`ref-tasks-cleanall` task. Do so only
>>> -if you want to start fresh with the :ref:`ref-tasks-fetch`
>>> -task.
>>> +You should never use the :ref:`ref-tasks-cleanall` task in a normal
>>> +scenario. If you want to start fresh with the :ref:`ref-tasks-fetch` task,
>>
>> Maybe we could suggest here that if one needs to do this, the recipe
>> needs to be fixed so that this isn't needed.
> 
> Not sure about this. As I understand it, do_cleanall should just not be
> needed in normal cases, full stop. I personally use it when giving
> trainings because I want to show that some recipes are actually
> downloading and building, and not reusing the whole sstate cache from
> my previous training. However I think this goes out of what should be in
> a manual, and I cannot see other valid uses for do_cleanall.
> 

I've seen people "fix" pipelines by just cleanall stuff when it was not 
working and it magically worked then and that was good enough for them. 
In a way, that isn't really our problem if people want to fix it this 
way, except if it impacts our upstream recipes, but I understand we need 
to draw the line somewhere and maybe that's where we want it to be :)

[...]

>>> +   at step 3 will try to extract the downloaded archive and fail as it has
>>> +   been deleted in step 2.
>>> +
>>
>> It's been a few months since I've played with Yocto but I think the
>> example above will work just fine?
> 
> It definitely fails. You can try it easily:
> 
>    bitbake -c fetch zstd
>    bitbake -c cleanall zstd-native
>    bitbake -c unpack zstd
> 
>> -c unpack will still go through the task dependencies if they aren't
>> done already? I don't really see a usecase for bitbake to NOT do the
>> dependencies first?
> 
> The point is: "if they aren't done already". Here zstd has a
> stamp for do_fetch after step 1 so at step 3 it is considered "done
> already".
> 

Fair point, thanks for taking the time to explain.

>>> +   This can be even more tricky if using a shared download directory.
>>>  

[...]

>> I think we could also be a bit more explicit about the risks here.
>>
>> If a download directory (DL_DIR) is shared between different bitbake
>> running at the same time (e.g. multiple bitbakes on the same machine, or
>> spread over the network), removing stamps and source tarballs/git repo
>> from one bitbake would likely break the other bitbakes trying to get the
>> source from the common place that now doesn't exist anymore.
> 
> That's the example that was in v1 of this patch. However I now added an
> example of the error happening without a shared DL_DIR, which is much
> more relevant because you don't even need a shared dir. I then removed
> the initial example as I don't think we need a verbose list of examples
> here. i think we need to say: don't do this because it can fail
> even in the basic case.
> 
> If anything should be done about the last sentence would rather be to
> remove it entirely.
> 

I could suggest the following rewording:

"""
Note that this also applies to bitbake from concurrent processes when a 
shared download directory (:term:`DL_DIR`) is setup.
"""

In any case, the original is fine with me with the few typo fixed :)

Cheers,
Quentin

