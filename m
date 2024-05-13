Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5293DC25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 08:02:18 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.95])
 by mx.groups.io with SMTP id smtpd.web11.54992.1715587328970225890
 for <docs@lists.yoctoproject.org>;
 Mon, 13 May 2024 01:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=LV41lBcl;
 spf=pass (domain: cherry.de, ip: 40.107.249.95, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f66QbuwwIiMIP688DOz+sgFMUubPSHLaoBoMLwUwmb9s1+hDJwEHzjbIRraLErPdjmGYlOac2ZpDsR+VVXf90bvvSB10qrF3iTR9TFL2J0wDunrZuB5ejIqqhPtPc/CldZEJauczN6hOdS/vKM8IIP2o0IoBAmTPRur7vOmNR8jKOG5xS72sZNER3C3qf1Isq/Ptd3ir31Zpy1v/IbunFjsvcW65ftZh8vipSKAVa2XbNN2HdcjBAKqxDDMmgGzi7fLyPlR3BkNYJJAqDa1w0+47gO4WzIpi5QYmBqJrDGWlYhXNNxmVZcsQs//zVMsdjWjWofBBeBFbIgNYSX/JmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySyM54d/17sQvN/oPKunU1ZZBz1AmDbVME191usnKRI=;
 b=VB3kmy+gaXh1nfYlwwlRdsmT/egltSkzIbNEmg1m4pae2Z5n9JppWvns9KO4WG1k1L2E0cJq+J5wHvHUQyWZ+ED5eUEUjhRNJtI/hOzXSgia9dbzPa5uZHApTpnx4U/c7y7xs9003FBa09ofdaT76nWSPg4YvytLhXP3TA6j2ZEfELpGU3w1V1pEe8ZmtGZwsvKukNBLwbj/FWJnB9hZ9zs3iS7VYaGJibqS/6tBNzugc4LaOHqywacNuBM/GnL/rt0ee04A/M3XM/cHq8Q7G9LxFfJQMNGTPDnwJbd3hrKaFmKmXCM+0vLYXMPIn1o6N5gqTTAaVGrQE0L0A0wZzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySyM54d/17sQvN/oPKunU1ZZBz1AmDbVME191usnKRI=;
 b=LV41lBclb4ymkToeSCZuossPueAuI+rnK+oANPuNy+dTzdHhWldQ+fVMTXYHqxEnfpo9EhkxIjumE0sMXvVDaCd5zKP2j7+QjT9+FZNtl4SsfSkHjIK/1wDHDtMWkQrrenJeeT5kR99FpMVRfifABWxGreWJUCdqVIyHzu4T+b0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com (2603:10a6:803:128::25)
 by AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 08:02:05 +0000
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31]) by VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31%6]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 08:02:04 +0000
Message-ID: <c8326e40-c0b1-4f57-b25c-dc8b079cbb01@cherry.de>
Date: Mon, 13 May 2024 10:02:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: brief-yoctoprojectqs: explicit version dependency
 on websockets python module
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Quentin Schulz <foss+yocto@0leil.net>, Joshua Watt <JPEWhacker@gmail.com>,
 docs@lists.yoctoproject.org,
 Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Steve Sakoman <steve@sakoman.com>
References: <20240503-websockets-module-v1-1-4065c348276d@cherry.de>
 <f99e589d583b7590d85b98320d22e18ac4c4a3eb.camel@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <f99e589d583b7590d85b98320d22e18ac4c4a3eb.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VE1PR03CA0023.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::35) To VE1PR04MB6589.eurprd04.prod.outlook.com
 (2603:10a6:803:128::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6589:EE_|AS8PR04MB8609:EE_
X-MS-Office365-Filtering-Correlation-Id: ae58ac9e-497c-473d-b9ac-08dc7322fa46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RDdjTGR0RkIrMHdwMGdrMW9aV1FPRVpRc3NROUxxWTJTNGc0YVR1bXV0QW5T?=
 =?utf-8?B?cm1ER1JvN3BmcXFTOTFKVzFNOFk4cjJDVFFrc3BzaC9ZWEtBR0RjZllOYUhG?=
 =?utf-8?B?N2pGRks1ZnRJQ2lmZVJrbHJKRlErdTlMakdsemJ0eTdodmxHOEh3SmtUR2ZL?=
 =?utf-8?B?SW5ZNkYwRi8xUXVyR2s3d1cveWFwZFZFSnhOSjQwVmVLckpHWDRaSTJYUDE0?=
 =?utf-8?B?WlAzbmFoWGovcnJiTEU4c0NLTUpCTDVDWTAwbmJxUjlUNFRXTnlQVkJ3SlRT?=
 =?utf-8?B?T1EyK0QwUTRVUy9qWWpQL0lBWjdBL3hTU0djekNmY2FqNjYyNmx0ZUZTRlB5?=
 =?utf-8?B?d0p3U3ZKczd4cHJVTUFOR3BiZlpOTEdFRUR0MVYrRmp5Y3Q0UlZscGNTSm9C?=
 =?utf-8?B?cWZ0eHFkLzBqNU9oNVdzYkl1UU9tNGFLQmxkQllOUzVCRE5FbmxRWnFzM3E4?=
 =?utf-8?B?ZzZnTlA4UERVVXdaSFNFWHRHUU5SZGMzVmx6VEtDcHRqR0F1NjFBejZjZXA3?=
 =?utf-8?B?V0hkU1VNNFlEaTZGVjFMTVlEckZmSGRrWGl2dm9BcVp6Ykh6dndhajFrQ2lE?=
 =?utf-8?B?UzJjV0FGVmNmdnl5K1JsOFBsY2FnUUlTRjFsTTI0Zzk1NVBSLzdOeU1ZRlYv?=
 =?utf-8?B?VjJmdUJBUU1VMHZJWXZoSXptdUM3SDlHRXZsR3V3aDdpZnN4bVZVWE5iQWhV?=
 =?utf-8?B?SUlMbzl2b1NLdVNpU2I4ZGsyUm04UUV3bkRtRE53eFVDUGN1UHZiUG5rY3JN?=
 =?utf-8?B?RjR2KyttcFIrQnpqQWt0ZGVjUnkwV0lPMGhRRFhWdFpNMFpRWHRHUFcreGZx?=
 =?utf-8?B?aGtWSEJoeDFHQkh5NWZmdXF5ZGJ0YlZSVXNZUmdRbGFqdHBKN1RFU0xWOEt3?=
 =?utf-8?B?OWNrZXN6SXYwSjJOUlJUL1M0ZGFlaFQzZk5YRVY4UW5HL3czWkZyajNrYTVS?=
 =?utf-8?B?V1dSSElRMlZHclZGdy9UaWo2SFA5cDZkeXZKa014OEpZYTlJVkVYUVJXVTJS?=
 =?utf-8?B?ek9NajZjVFhtckQvNGx3L04wQ1l2azdnelQ5RUpKMjV0b3dQQ3RGRkRUc1ph?=
 =?utf-8?B?WlM4NGVtU2o5TEhLbkZCY2kvdnpYSUIvdzdWTWJDWVJqbVczMXg3alFwdldq?=
 =?utf-8?B?VzczU0Nqa01oTXZFT0pVL09IRHVraEFEY2dPZUNXekw3UlJRNEVMcmJIOWlS?=
 =?utf-8?B?Mmdwdi9obTVPc2dRTWxyaWdKK3JJSGJ4TnVxTVVRTzVQaldVdDNPMDZVN0dl?=
 =?utf-8?B?RnNFR2NXd2RrWTZsVmhHRFlOZWhibTF2bzBwYkRRZUNmK3paS2NjcVBVeUJ3?=
 =?utf-8?B?c0NQVUhibG9sRVZXdjY2dFh3YnE0VTBKeVphdml6Qm1pUGlWeHpwMk9zczEv?=
 =?utf-8?B?SzJDNm5vK0V2Qk4wOGlJdXZMUG9kbEQ4cWJVZlZuMW1XejhwZmRuTng4K1hp?=
 =?utf-8?B?SkZZcGw5ZUYwL0IvQXdMUStWSmc2SkVCRXZuQzg2SVJxOWZBT0hYS3labDl0?=
 =?utf-8?B?SXJrT0pqcG5NdFlJTlVkRmRXaXpTSXhjWFBrTTc1Z3IrN2lkSE1EZkhBcHhH?=
 =?utf-8?B?eUlvd0hUSlhuWXUzUzA5T3BCTFlaeGJGZEdwNE5hV20xcmZoeVdqUUN4R0Zt?=
 =?utf-8?Q?qhNBolMLLsrK7Idnhkbxbyj8vTkvRNnvhu6jYukBa+30=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6589.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YzhISkRsUmlSRytvUVNsdTNGNFdYTXF1RjMzbDl3S0xheEFoN2VscmYwblVT?=
 =?utf-8?B?ajR5dGhSQVFFcCtXTzg5dTd2SVJHRy9BdzVLLzBkUGpWaUZab2JkQXAxajND?=
 =?utf-8?B?emdyTDZLeW9yeWRvc2RRem55NUROSDcvNVhnZ2tZUENrUGYvelNzU0VSWHkz?=
 =?utf-8?B?UlhoSko3OXJZOTlKU0JTaTdYTVREVjdWSUNEaFlkWVc5Vjk4YXlaQ0s2a1kw?=
 =?utf-8?B?L212cFNIU1U4cDFhVkpDYXlMb3Rxalp0dVFtVGlvZ0EwVGI2RnViWXVYYStk?=
 =?utf-8?B?UG5zV0E2Z29SUDU1bVVnM2JxYW1rOEhVNG45VkNOcW1lMjBrOVNINTc2NVAv?=
 =?utf-8?B?QnVCT2VNWFFzNHJ4amVGQ1d5bEEwVGpkU2M3bGtjekUzWVlTdlFNL2psbDZS?=
 =?utf-8?B?bVVmSzRKYmR6VzRuMlhnSUxjRVlTakZqVXltaEdXMUZrS1MvYk1xQTJNVlFF?=
 =?utf-8?B?SW0vWGZkWmpNZVQxTUZabjBxRzZURm51anZqNXRzRWZzczhnUm80SC90MlJV?=
 =?utf-8?B?c3hPOWRVQ3k4Z0drRUN2TWZVYzB2aTNkQmVBenM5ZkdTZHRramM2QXNQZ0tQ?=
 =?utf-8?B?UlVFRG5SYUNCL2hVZW9xOFdoSGlWWHF0K0ZnUFdhNENaQzE4ZzVIRTB1YjZr?=
 =?utf-8?B?WUtFNENHeGtQZFVYVFV5OFpqOUpkR2tlak5KYWczcll5VkJVdERSdzJLZVJZ?=
 =?utf-8?B?MWlaQWJ3WlJDSjVDcnJ4MGRDUWRPb0ZCc0RjS2RwZklzSUZ6eXZNVEhxQ3RY?=
 =?utf-8?B?aUo1Y3F6Y09FWUxieGd5NUlxUUZUZ1lkU2dOT3lndGtCWjBkaEhRQWlWNTJw?=
 =?utf-8?B?NDBKK1BRQTFpZm9QYVlkaWFlUTFVVTdwME92V2tQd0VZMzlWK01Sa2VqY0lO?=
 =?utf-8?B?ck5JSWswMlNtZ0lvRHRndllsRTVoVXBxWjR4R2tvclZpMFdzcll6eWJqNnFB?=
 =?utf-8?B?LzZnYU9ydTBabWhHTStXbjMxUTVGNnQzVHpzNHM1RnVtaUM5WTd2bXJqNUN2?=
 =?utf-8?B?aEI4NkNSdmwyWnlsLzRhOEdSdlRCRWpoeWh2TDJkdVlITG9yS0NjOFVKcHIx?=
 =?utf-8?B?YVo4TXpxcEh4Njg2RGZHbVZJZ2NMQ0I2eVFTOTZMT0s3U0M0V3VkSFdDN1NI?=
 =?utf-8?B?NytOeXArNVZVZXFsRDFOUmN5NDV2bHJnaEhJQkVwY1o5YXZXUUtyYktVZlRH?=
 =?utf-8?B?TWVkVjRDWVFkYWRIR09QcVpOR0JsTFpXNkZGK2x3NElSNTY2SVJwQ2pyZXRT?=
 =?utf-8?B?TG1XY1JnTThudndHUkdSN282TEJBRDhsNkxhUmVHUUp1RHpjd2tiZ21XYUtt?=
 =?utf-8?B?bkpoc3lPRzRHaU1Kb01QWEdLbmswbUhsTWNySW5VckMvZ2dxVEZ1VjJlQkpX?=
 =?utf-8?B?YitrRWZCT3pBZHVGczVFanZvNTJKUWlXS1VtR3prNnl3M0hIYitsN1RmTVBB?=
 =?utf-8?B?U0xHM043SHdrNUFGZXBuYjZncWZCWmFBK3ZSRndwOWdpZHVMZXExVlVEY1RH?=
 =?utf-8?B?WFZiaE5rbFl1eUx0aUkzcVhLbDBhL0ZLNGdicjZROUs4Q2hYdzIxRS9nMTJN?=
 =?utf-8?B?ZGVpNXJhZ0lJV21rNlFTeEtVd2h5K2NvSmxJeGRGRWNoYzQ4UVJRTU9yektE?=
 =?utf-8?B?WlN1aHE4UTNYeURBZ0RNNGlTWXo2Wk9XOHY2VmlGQkV0ZHBwcW5SbmZnU3Vs?=
 =?utf-8?B?VHpvb0VqV1dEQlBJQ2JSTVJJcjV0YW9uSnRUT3JJMmFqbkY4N3lab1RiZld2?=
 =?utf-8?B?NS9rQ2pGVFFjcmkwaTYrV2trbWJaZWpPbVRURnJOOU13dE5nOE44bTU0WVdS?=
 =?utf-8?B?S0xzQk1zcDhtcXQ5UkR5eUZkRVJHSyt0NjZGU1JKYVE2dkY4dURXR3RCU0NP?=
 =?utf-8?B?eEpaQUlTOGs0ZllhemtXTGVqNWJWbTY2RGdMa1J2L3hPbGIyZzNGOUhmWXRP?=
 =?utf-8?B?YWcvMnlScnc1VUVoWVRiN1QzU0VETENFWU5QcXl6M1N1aXVRNWwwblRPK0ta?=
 =?utf-8?B?MUhXdFZMSlVnYzhRV1QxekIvbXhuQUdVemV2R0lBZDdYWEgzbmJJUHpPZTVw?=
 =?utf-8?B?d1gwYzV1ajVobStSRllwZUpiRElKME5GYnVKWkk3UEZBeHdkaVRXaExUVWlh?=
 =?utf-8?B?dFVwY1QvNFJBREpSc05raXZhaHdkci9LWnNRSGVJcXpoS0Q1bEZWOVNKMnV1?=
 =?utf-8?Q?w9pM65QYIvN6j8wdrNGR+SE=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ae58ac9e-497c-473d-b9ac-08dc7322fa46
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6589.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 08:02:04.6367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 630oCo+8gs7xsFOUq5M/HjOy6337xeoRMsRQ/+93PE3EtAJKAcMcd0ROUBLo84wkSG+o5q8QWAQ9a+ojjjt/GZcQLySUa0P3xv8O5Cf7RlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8609
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 May 2024 08:02:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5217

Hi Richard, Michael,

On 5/9/24 12:59 PM, Richard Purdie wrote:
> On Fri, 2024-05-03 at 19:07 +0200, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> We now check that the websockets module version is at least 9.1 in
>> bitbake itself so we can specify more precisely what "recent version"
>> means.
>>
>> While at it, list which distributions have a recent enough websockets
>> python module in their package feed and give some hint at how to
>> support
>> other distributions.
>>
>> Cc: Quentin Schulz <foss+yocto@0leil.net>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>> This is done according to the pending patch:
>> https://lore.kernel.org/bitbake-devel/20240502183516.1216885-1-JPEWhacker@gmail.com/T/#u
>>
>> Still wondering if we should add this to poky.yaml.in as a "hard"
>> dependency? If we do, how do we plan to handle distros which do not
>> have (a recent enough) websockets python module?
> 
> It isn't a hard dependency since you could just not use the hash
> equivalence server.
> 

OK. We could document it the same way and in the same place as we do for 
the docs:

https://docs.yoctoproject.org/ref-manual/system-requirements.html#required-packages-for-the-build-host

"""
Here are the packages needed to build Project documentation manuals:
"""

and do the same for the hashequiv server?

Just looking for how to handle this best :)

Cheers,
Quentin

