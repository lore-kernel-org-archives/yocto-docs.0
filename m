Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F45C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 15:10:02 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.126])
 by mx.groups.io with SMTP id smtpd.web11.19591.1710342592617524697
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 08:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=V7NdN5iw;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.247.126, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkn3izK5NhOGK3Ei0aF4eGEpCBVU12cqIdbEYxc5RyefGy0rQMSEU7u9SKlvGkToiYvNKXSADqqxKcGrExNV8hNRT74HVoQAhfIAc7ewjITQGj6hCypkQh/MFi/7dxJRqbIaANN/4GDxVaAtvdISPs1ifYeHU/XyEEvRaO/jxjGbLcHAxKEB3PtB14A1855s04QDb3DSrL9Fx6S6HRulOn7fRItdV/OL2qNuGReoRE1H1YVrM55g7tjc/lDai83F7hyzfyWbZQlll3NI38Kc4qyOr5OvOHhKMMlH7e5CBQcktzl1gV0in+kBXcO/pFUQ8ZvnxUqlMlVS+szNNVNdzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMfpBPxFnbc0GRIDybNc+h0EOjH47Szir78vpexBS+k=;
 b=U2sz+u7sARm31CQ1KasnjM937Vh6MzGBAzk9QUhIiLRfxQ1ERRyArcuvALl1VvdOwT6StxUj2fIDybVcnrMtzVc+csq4ZOvErjT8Ep9x/cEja4KxFU2ZOa8560zL8AjJ8/c3NMseNHxxs1T37uScWCCXDj6hbFJxNRyS/95qqs3JvXT4oqBZZ8fLTGZrtQEVQllpxzktVQT0TqaSfBM52bClUIpmyWMANrgaWnDs4/3KL8IlFK88XiYWFqa2apQYerIScIoTiX+Msg/Rvko3Br9PXhmitrmRSTCobHsUiWAhMUqt1RoVWTp5fPLJV3DXlN5/jia1G/AksS0PdRXrEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMfpBPxFnbc0GRIDybNc+h0EOjH47Szir78vpexBS+k=;
 b=V7NdN5iwq0slFgRRBmeuDtPAGp9XdCyNnHYWHdEDHiFc8ZZfOXjheSMb1XdZhG71U6ubeo2NW+ljMDdagoZ4S7d7cF2psnGp04x4sntoKzvWL6bu6zriEThnoyj8AWYh1lMQfJnjvwAbWrm0fFvYL7OCJjse+BjP6wfJvQ3CDdaMge43zeexbgLfmkKXkNJqXffzOkYhstdc1RZEvF3M744bfAq8GRQyReD1i6GSks9TKfSRfm08shLlUAZ1RiDKSMa4H0C7p5KvMacOm4gUFrDIRCFSdIfvPf0MGVOPwA9fYl/VTi8Fd4TW0yQt0DBxCoXwmTwnH0OXweMSjOnKrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PR3PR04MB7289.eurprd04.prod.outlook.com (2603:10a6:102:8a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 15:09:49 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::23:4118:ae4a:8dda]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::23:4118:ae4a:8dda%5]) with mapi id 15.20.7362.031; Wed, 13 Mar 2024
 15:09:48 +0000
Message-ID: <16b6e7ad-e7f1-4e6a-8fb0-c5e3fee61fcd@theobroma-systems.com>
Date: Wed, 13 Mar 2024 16:09:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] manuals: add initial stylechecks with Vale
Content-Language: en-US
To: michael.opdenacker@bootlin.com, Quentin Schulz <foss@0leil.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 docs@lists.yoctoproject.org
References: <20240312210345.8832-1-michael.opdenacker@bootlin.com>
 <CB05F1E2-1F4B-4D7F-8920-D8914CB93E3D@0leil.net>
 <33bd7200-85c6-44f4-8b20-09045ec36566@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <33bd7200-85c6-44f4-8b20-09045ec36566@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::20) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PR3PR04MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 07ecc20f-d256-4889-9662-08dc436f9fe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NxjAuu6lfH1FScnn0vJi4XCkNlMAg7sDK2hjIp0OzBK45JBdmkhRNsoa4EbnENge2cI0Hl4fzeAPwWRhznkAFyWdBsW4cvcEHvywJwnGccG+b0zLefHIRmqM75YkBP5QjzeNUX6tvEnlHzmn3NLo34SoJhi9ZNqnZGinBUy5NXHuZ5r4p6gC8dzikQF4ie5ib4iXDTmyYzvD4CWKOVOyP80sGmDjE6Gkh6sTC5f25ACL4/awT8Vn8JIGSn5b/XBQWgQqkLIVBqQ5al7R87FEhNsZl0anQsMetQkdl/pd8uLFhEoTYy8p+ZHLTHp/hVN7UXIBKx1YZyg27SuWrcOlPN4CJxGb8s475EE9553m0ErmOmou1w+y6A5jxUV3314A1ULM4q3LgMXsBULhATrvypVB8aYD5PoTnrlcbSACg4CihoejRMOGcNSF+mdYidzREQEdm3fd12s/3FlFhzUspCl1vIsu5vI3cYOtweIJGtAcxMOqdsIDeXppj3Ahc1eu9YQ2JVVlFcP0G0A0rh3oyvi2W39Q45Ery5BxziyohinnUUxKPrTJv4AOj1d2gK04Hy85kbCJOCEzcXZgxVhp+vnZZmJAaxE+xX+DED3vW3w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K2dreDRaVysvQkNLRVJKVHoxN25xN0p3NWVkaDY3dGp1SzFGSjNpSm9rRnlK?=
 =?utf-8?B?cHp0bWR0anBKL3lETTNxbWpTS0VLUWtDa24wWUx6ZGV5Z015NDEyTXJveHN1?=
 =?utf-8?B?Y3pSYnAzT3BSS2diQnVsRnU2aEhrNCs3VUJEN0NXaHdFOGVTdXNlZFBaNjRH?=
 =?utf-8?B?dThKQm9oK0pNL09PbmRvYWE1Vzd2UVhYTGpJQ0oyajdxV3ZPb3NHbVBOZjB2?=
 =?utf-8?B?VndiQkNaRUZndWIvU2UrV0R6b3lBVnJaaStJaXlvSEhCdUR3VWYwcDlXU2Ur?=
 =?utf-8?B?N1dub3lpdEt4VncwY2Q5aGVPMnE4TTRVREc0bXBjdWxiS0R5bCtkb3hINHlx?=
 =?utf-8?B?c2xYd0JNWFQxc0t5Rmo0eGlOMWRGa1UycXRhRnd1VjhVZzVnYXFWSlhKM2N5?=
 =?utf-8?B?WFJBeXhWaFdSNkMzT0lmK1dpckI3MlJRKzF0SXhNRzhUUXMzZGFZN0V5WStO?=
 =?utf-8?B?U21iaVVjN25zSE1vbkNRSXFpK0EvTDJmUXRIWE8xczg2VVNsZ0lHdm80RzMv?=
 =?utf-8?B?N2RjdlJDb05kTFMrT0I0bVh6MEtlSll1OU5Yb2VFWTV6WkllcnhYQnpQNHp6?=
 =?utf-8?B?VmsrQWNKSDZZQUhZUGxjaitNR0pGK1V6OU1iQmFVQi9pYTJJd050RXl3akhp?=
 =?utf-8?B?T2syWU50V0JpNXJQTTFnNXhaZjBiTitpMzRzRTd1QndQNjBwOWlKdjI0czJ1?=
 =?utf-8?B?Ri9abEo1Tkoyc2lJSExFamhPbXNqUEJVMzcxWnh3eXEwU2JhU0d3aHRXNEZM?=
 =?utf-8?B?OEtId3M3TEhuQk5oU3B6M0pHd2FNcXNJUzhCNEN0c0thMWViVGg5bDJ5c0R2?=
 =?utf-8?B?eXR2YXNZV2VXeEZZL3RYK0dkaWRkOWpjOE9yMUQyT3h6cWNvNVBXMlNWMGtS?=
 =?utf-8?B?ZGJLWkNtbDF2d0NPSEU3NGJpenRraTlROXBVd04yVVJOL2d1MzRLdXJ2NElJ?=
 =?utf-8?B?M3VzUkdNK1lwcDQ0bm5KV3BhTklwMlV2cWpDZTlTQm9uWGUvZ244NDB6Mitn?=
 =?utf-8?B?ZW92ajNzc2Y3OHBrUno1aHl4R0NKaC9Qak5saG4wcnd5VWhwRDdOOHdTTUk4?=
 =?utf-8?B?REhJNDhNZWR3QWtsMVdjTjA2SzJ4aEptV3BhMTF1RVFQU1VMbEZCVVMraStQ?=
 =?utf-8?B?ayt0Qm1mVVQ3K2p0a1JKbjl3cVA5Zmx3RjVRblBCejF1ZUdYM0IvVjVhZGZW?=
 =?utf-8?B?b3AvNlkzY24vdEFHVkNBUDZsd3U4dTNvcExDSzR1cDZQbEdDSG43cW1TRlBs?=
 =?utf-8?B?aFVGbFRldGYzWTRKS1psM2hQS1dpdFZzZnB3aHNFSnc1b1kzNnMrMHdTMWl5?=
 =?utf-8?B?Y2VQSS9JcFZzMUp4b3hNWXBRWis1TVp0emp1UUNGQW40dEU3aDhOQTBqaVVi?=
 =?utf-8?B?VWJGNWRvNU5PQkdxZ2xya0xmaTVuaXMyOFJKOUd6UzR6U2s1ZDhZY2dycGZI?=
 =?utf-8?B?WDNUdlpLRmV6ZWI1Q3IyZ1lxRkNHajZpWHNRS2t3cGlmdER4VzMvQjRDZUFn?=
 =?utf-8?B?MDJCZDgwUisyQ29Bbmt5V0EzenR1dnZGSlVLTEc4bkRMR1QzaUx2eE9QSTNB?=
 =?utf-8?B?VmZZbXArVk5YVm40eE5IVy9LaVBFUThnTU55aVJVMWErRUJjRlozMG1UOXU1?=
 =?utf-8?B?TlNxOUVSalFZOXAvVUhveHlHWU10RDR1RTJmMjFVVlRidVJnOXN5akpacjJR?=
 =?utf-8?B?TmsyVURwbC9uSC9rSTBJVHBGQ2w0aVJLbmFoYTU5aG5ZUUtsNG00QnY5YTc2?=
 =?utf-8?B?WkNuY3pCYWhPM1ZBay9oYytmRzJRL1ZrZjZ6MGN3YWgwSzF6MUNES1Bzb1hK?=
 =?utf-8?B?cWU3dHU2dzFtdmRWTTNMYjNaZUhXMS9TdjlsZEEvbFdjMDk1c1BTdk0rNzdJ?=
 =?utf-8?B?bHp0YnFxYi9udXRQcE54ZHRqMjRseGtzN0xFclUyVDRHaWJYTkNmVDFLc0Jz?=
 =?utf-8?B?bG1BWE5wdEs0M0c0eEtkODhyeXA3UVVUK3MzSURtS24vdElVT3FBNXhUd0l1?=
 =?utf-8?B?NGdYTWFTU2dna0RucllLN0Z1OFdsd0hNeGEzSnhtendTNGsraWVPVGxTUXdX?=
 =?utf-8?B?RFF5RXo0ZDl2SE1ObXk1WGprWUxYRTVTQkVWbTNUVVRrY1ZtUDlZdHN2UXZT?=
 =?utf-8?B?N1VwamdUN1E1WDRwK3pFL0U3NnBFOVBwN2NsYkdQM3JlRWNQNXJNWEh1bFlQ?=
 =?utf-8?B?NUh3ZHZLTFBxWllVUHdnRVRucGIvTHZudkMzaFpWME9aaFpoUmtlQ2NBQTh3?=
 =?utf-8?B?UWVncy9XYkd4Y3pGdHVTYUZOaENRPT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ecc20f-d256-4889-9662-08dc436f9fe4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 15:09:48.9033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xd9TUKHV/+jxhbpJ7r6+qyIwSPPhHk+5P6HACFnylDa6BZX1L+hdnzGqf9OvqN2Ppo6Z6ndLbWBqigbj3bDcNP4NS0E7NwTfynGo/jIiY9y3JnOBxtCeIK2lcpH9f+D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7289
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Mar 2024 15:10:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4951

Hi Michael,

On 3/13/24 15:55, Michael Opdenacker via lists.yoctoproject.org wrote:
> Hi Quentin
> 
> I was sure the topic would interest you! Thanks for the review.
> 

It is actually a quite interesting timing, I myself was vaguely looking 
for linters for our user manuals yesterday.

So I can say I found the following:
- sphinx-lint (https://github.com/sphinx-contrib/sphinx-lint). This 
mainly complained about tabs being used, but maybe it would find some 
interesting things in the YP docs?
- sphinxawesome-codelinter 
(https://github.com/kai687/sphinxawesome-codelinter). This is to run a 
specific command for snippets inside code blocks with an assigned 
language. This will be useful to us because we wrote quite a lot of 
shell scripts in our user manual so having shellcheck run on those will 
be nice :) For YP/OE though... not sure. I think there's oelint-adv we 
could use?

[...]

>>> diff --git 
>>> a/documentation/styles/config/vocabularies/OpenSource/accept.txt 
>>> b/documentation/styles/config/vocabularies/OpenSource/accept.txt
>>> new file mode 100644
>>> index 0000000000..98e76ae1f5
>>> --- /dev/null
>>> +++ b/documentation/styles/config/vocabularies/OpenSource/accept.txt
>>> @@ -0,0 +1,4 @@
>>> +ftrace
>>> +toolchain
>>> +systemd
>>> +LTTng
>> Are those strings matched even when they are highlighted with 
>> simple/double tick quotes? If not, that could be a way to not have to 
>> expand this list too often and also it's nice to highlight the name of 
>> pieces of SW (well, excluding toolchain from my remark obviously).
> 
> 
> I've just checked by adding a typo, like "Yotco", and found out that:
> 
> - ``Yotco`` is not reported
> 
> - But "Yotco" is
> 
> So, yes, using "``" allows to write any string we want, and the tool 
> won't check such strings. So, this avoids lots of false positives and 
> this can actually help to locate instances when such double quotes are 
> missing!
> 

Thanks for checking!

That was the idea behind my question :) Nice to hear (though.... who's 
going to check for typos inside those single ticks now :D?).

Cheers,
Quentin

