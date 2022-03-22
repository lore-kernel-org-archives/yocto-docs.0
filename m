Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFA0C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 14:33:22 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.81])
 by mx.groups.io with SMTP id smtpd.web08.10617.1647959597068020590
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 07:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=JmrXUG7L;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.81,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgsCR0/dnoXOr2fRSIUe/0FZtnn6ON7Ar4DW2ckSSGHAeGIOGWsd9MEQl5t2kF7kaJrKpo1xm3l/LP71Fs56qu3dRYWfh8rK+OBDvyBUbuj8r0nU+yzucGJVGn4jaqHiEgZV82ct8qZynxkQW4eCKmdWI9cChlRmFMsqfOYx2IuGnXx3MGbepP/lYVzBOfwmEayuAFJErdNDlKhq6OWYoOFCHeUWt1oMrVSs9OlEJBX6X9Fcf8ywMzCmjLb9RVN35Lpn2Ku/qS1o1GEMlTtThPK0pLRqrkvFNKa4A0Yg2tnBz/dFdwpL/57zFOZaa0yNAK9hUmF+aSdo1Tyvy7ujQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPdbMDB9SB0v7ggVuvK70JseAcsiZLIAr4vPedwtwig=;
 b=iu38883gGrZFn9jE/qYVdqjrugqoYCE6scKyZW3YUCk0rTD24V3SQbajKKpIxNYm+LnLMgh2/2i1cntX9G69CLBDOdNUHRlLP+j9X28vvK0LTv5yoTne4Xd7Fby6vh3uRJGwxpES0+AOUTgr1aZeRTiH6iaEJbh1kLsWVA5Mgv8OIVQUk7WR/o5+iEbIfoCFU9py0uuDkiQALw62ljul9tpHFdHWQaIBhuZByETfF/kTs5c/f2nBh2eToJvJs4YWhPZyqvBFEBJBkAxLOQ4nUNQ2ujYL2LtX6XTD4U4HV5CdWgVnb8PoDxMFl2nnj+Fkx1wyksWMgXbjLa8BWOCuqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPdbMDB9SB0v7ggVuvK70JseAcsiZLIAr4vPedwtwig=;
 b=JmrXUG7Li1A5/FBdHF7xSVQz5RRT6gQ0v2PPCTXokmPpkNfbsMvrzBWARxQV3gPogskIIjsVOsjRmqo3DJzKLR3b5CNEPDRT6rJFpVKbOBsvH7vs3E8cpvqXQOUBkOpS7kQrxKtxjNA+Isa91eo+a6YhyDuzEBtjJYyk86CixTc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DBBPR04MB6297.eurprd04.prod.outlook.com (2603:10a6:10:cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Tue, 22 Mar
 2022 14:33:13 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391%7]) with mapi id 15.20.5081.022; Tue, 22 Mar 2022
 14:33:12 +0000
Message-ID: <a7308598-4d69-ec6a-4edf-df198055ee93@theobroma-systems.com>
Date: Tue, 22 Mar 2022 15:33:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] [PATCH 0/5 v2] Proposed docs version changes
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: docs@lists.yoctoproject.org
References: <20220321174455.1189669-1-richard.purdie@linuxfoundation.org>
 <CAP71WjxAtVJO2YvM3p4UM1TEYuqmM7TLpDo5kRytp+G=kQhSgA@mail.gmail.com>
 <ea41470f551f80509c947bf074eee5b29777953e.camel@linuxfoundation.org>
 <bc6e6ce9-2287-cfd8-a3c7-6d9f54ecc1f9@theobroma-systems.com>
 <9a19dcfedb95816a40a967bc87fa54f3da62fef3.camel@linuxfoundation.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: 
 <9a19dcfedb95816a40a967bc87fa54f3da62fef3.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::8) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2cd167b-c471-4301-80dc-08da0c10e500
X-MS-TrafficTypeDiagnostic: DBBPR04MB6297:EE_
X-Microsoft-Antispam-PRVS: 
	<DBBPR04MB6297FA524EB952F1524B5BEFC2179@DBBPR04MB6297.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3IzcMdApjWub/drkbzGRYgL1y9oHOPSfWgybt29SdARbPPvVpfYx3WWAuhaVuvt2Yc277BP4dgDrRy+Il9CrP1fCkdLszzUwHadxelVssS3H9l7uk/gEUHsEAfU0d7Tdufn5ni9rzgF5AJTConQGl5jWVBjfRD077Y3n+LYbCbilzfiBdQUhKz5oczJS6tMEm5Kl/9IBfuDuDDVU6Bv5Uqx10QZcxP9id82uCQoohhpono2wfNJrOaHhr3FWuIpDh/i0PdSk4lNAdcWrsQVRq/IGByF80o8RuuSWAUVanAz3qK/VNk2QtZv+cC5uJRK43eytA9ugY55gF8Oun5CTaCcsVTqZlgF2BKqd38/mjzomJEVjtPTFIoeZB/Jt0e/Oxxmme6iO2412+zKPpGFIIOD8xu1ycu6H07x14VQllijHiRzGgdiIZvEdTkY0okjh+LbI4CA/n0Lrv8eLG6rOG4rKChve71TlgqKZtZmiZG+x3IZdydAO81GNYP3s+LEFC2wGkm8xMhMxyUWm1Juf1b25Elf/OZF4Yo0bnZ0h/6p4zhRNt1pv1wSE9lhy3+MZipaNCwYmO0b+yq+CxhWGtejIJcmfaKoCq1WIEUgb8BqbkRZd8zoea1P238V+DwTVMmOCg4Q/v1JSFBGq7yQmo/G1SJVsdOE3TSl62S2zWjs6nTlUMJchgXR57t34lOgiVXFXC8+jOTuEsqsC8k/5aEz1nPu7Sd10tiS8zE2TvXlHZonacBoG/hfEu8+Df/zS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(316002)(26005)(186003)(44832011)(6486002)(38100700002)(6506007)(86362001)(6512007)(2906002)(8676002)(31686004)(4326008)(508600001)(36756003)(2616005)(8936002)(66476007)(66946007)(53546011)(66556008)(83380400001)(110136005)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MCtRUVJDNnZ0ZGduMit3cVltdzkvdmJENGtnQ2plRzNCcFdUeHBZbmJGMkNU?=
 =?utf-8?B?bU1vRVM3ZytCcjd1c2F5YkVkQXVyK0diL2U4bFZrN3IyV09jTzVjY3kwNTBZ?=
 =?utf-8?B?OWNEVTgwNGlkMWErbmpQWjh2aldEUnhlY3VJWEZROEJVMHVXaWUxTkRDVGpT?=
 =?utf-8?B?VCsza0cvNDNyamc0QjFvTjlFaWI1Ty9SUHZtcHU2bjdhclQzTjVqY3FOTFVB?=
 =?utf-8?B?ZWZZcG12ZmZKWXFWL3VRK1NSeGplMmI5NmZ2MVlkQjFMRE9qQVJhMXM4QWJF?=
 =?utf-8?B?NCtmcE55WFVYUjZOR1d5dnB5SGllM2IydFhmZFIySUlNTmhlTCtyM2R3QlhL?=
 =?utf-8?B?N1VudThFcTJaYnJuUDF4NkF6ZlJMQkYvRUlaMXlDNmIyUjYzSmJSUktLeEFI?=
 =?utf-8?B?UktLY0Q0cGE1UHFjNEpoTVhBMXo0V3FmL0Q3RityaTJFcy9hTjZRVTB4TGZs?=
 =?utf-8?B?OS9ZTk5PZ25Ebmp6ajhsRnNqM2VzMUJHWEp5WjFnRVhPQVBsdi96MzMxTlUx?=
 =?utf-8?B?SnF0cTRtV1VtTzlXN1M2eDkyMm1hSUx0Y0ZzZHRlcEJzMGkrZGo1S212cHJ1?=
 =?utf-8?B?eWFwQktTVDdhWHBRRU85SWNoTzdwbzlwMnFRMGpybGdQTHMxMkNwVFpPdG94?=
 =?utf-8?B?U2p6eGFGRVFSeUd6NzZnUkZTbi95Y21EbldHamYyMXUwUXhuYXhUK3lQKzl1?=
 =?utf-8?B?Q0luak1tMEo1TDJLUTBhcHdkVnRMbWNJcmxUMVd5UVVveXF6bjEyY0REbDdO?=
 =?utf-8?B?ellyZ0ljU3pEMHkwS00xMVVKTUJkUG1JMDNqL2MvL0hpcTZxY2xjWkR1MVpz?=
 =?utf-8?B?N01QTTZQVVA0SnNtVFJXdE5hR3BtV2h5Vk5XeGh1d0tYL1JVcXZoWmJYS0U0?=
 =?utf-8?B?cWh0ajNsVmxXTlFMWnhEUXZZT2IremRHbUR4OUkrbEhRajViT3MwOWFEMnl2?=
 =?utf-8?B?S2dLeGVCaUY5VStmZGszRTFLbHpMMVpIV0E0SFdMUzQxN3RkaDc3VE01YVBX?=
 =?utf-8?B?NG5tUFA1WStIRU45UlVTb2tDYndRTUpRYzA2VGNacFBCTEtYYXl2VzVDamVl?=
 =?utf-8?B?czBUbWNUejk3dEtnbGwvRCtJdFdQdnhQeHpUeTd5YW8rTlRZR1F1V1JLYWlu?=
 =?utf-8?B?bms0NjdHRno1U21NMTBpdnF0YjluUnc5YXMyL2NlNHRYQlFLcnhQN3JLV1cr?=
 =?utf-8?B?VldZaVRkc2JFeU9ESG9aOStCWkkxaGlkZ2REQXVGV1pBLzNBczliRmk5VE1h?=
 =?utf-8?B?aVY4SjNUcVFLcy8vbTZlNTl1S1hBTm01RUNHQjdES2REVVZHTXNRYUFFUkE5?=
 =?utf-8?B?ak1YV25LSmJOWThTNWJ1RHRCRFh4Rm1OVHpGTEdOT2VDNFdSa21LQ2VoL3M4?=
 =?utf-8?B?Qk5XNE9HWUtBc0N1Nngzb3U3cVRWZzl1aGNDTVN5VnBQM3h3R1Q4VitHNnRy?=
 =?utf-8?B?UzhQZFJyVWxMeDJwLzh3N1dIeGtOU0hYalltZ0I1cnE2Y1dHUXk4cnhWQmJw?=
 =?utf-8?B?TFhNMnFMS3NBR3ZjaWZxbDVqMU02L2dueHBnTXNDWXlnNm0rQ3ZoQ1VkNk01?=
 =?utf-8?B?anBBVE5iN1NHQjRML0YvMjBXbk1ObzZXK2ZCTU5EZDRzbXBZM0trM3cxL0hD?=
 =?utf-8?B?R3hyUHVpRlBEcE9GVDY3T2xSb0gzcGs2cHNrS0dRWFlNUmwvSlYwK0lsNGlh?=
 =?utf-8?B?MDJ5c040NzNPME9WbGkrTUJjZ3NTSjg1SEtvVFVEV0U5Z0wzMktMQ0NqdDU0?=
 =?utf-8?B?aERZUDhwY3hWb2RhL1R6ek5wcXgyeUx5bmR5MnNsdEJJUTFIcWdqUDYyY3Fj?=
 =?utf-8?B?SE1sSmRxajVPYlRMaDVrcVlveVJHcE1LeTVOMzdySkRrMVBpRTI2SVJhd0tE?=
 =?utf-8?B?SnNGaDhXNEVleGhrckxvZ2dOUG9DOFo2KzIzVHpGQmp2N0h6THIrTGJQcjV3?=
 =?utf-8?B?N0VtaVp2Qm1VWVI3WHZmSW54RmZzWFB1QzgrNWhiTTIxdHBUcmxyV0hkUGs1?=
 =?utf-8?Q?H3UsZ373iP3153LHnz8WZbvcjg2NWg=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f2cd167b-c471-4301-80dc-08da0c10e500
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 14:33:12.8309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FFWxC7l8dBcaOlN7v5eKdzcgpiD8aPWoraksg+yeUFC5ZBA1PIJk7xIQ7Fo6DwZQY9unRuaVnQzDju067I4LT+8mQAZFB4V10vcppFFK2+UjnGtiJOx8ipkg2/+KiYxW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6297
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Mar 2022 14:33:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2683

On 3/22/22 15:25, Richard Purdie wrote:
> On Tue, 2022-03-22 at 14:58 +0100, Quentin Schulz wrote:
>> Hi all,
>>
>> On 3/21/22 23:06, Richard Purdie wrote:
>>> On Mon, 2022-03-21 at 22:56 +0100, Nicolas Dechesne wrote:
>>>>
>>>> Would it make sense to implement what you have in set_versions.py directly in
>>>> Sphinx 'native' code ? e.g. directly in conf.py, or in a module loaded from
>>>> conf.py (see how kernel does it at [1]) or yocto-vars extension, or as its own
>>>> Sphinx extension?
>>>>
>>>> poky.yaml only purpose is to be loaded by yocto-vars.py which is a local
>>>> Sphinx extension we created.
>>>   > Possibly, yes. I've done it like this as it was easier to validate it
>> was doing
>>> the right things and also easier to apply in retrospect to previous docs
>>> releases. What we want to do going forward is an open question and it does feel
>>> like that script would be better off as a module that at least for master, the
>>> docs code called into.
>>>
>>> I think that would make most sense as a follow on to this series if/as/when
>>> people have the time to work on it and test it accordingly. As it stands the
>>> series was already quite painful to develop (I got hooked on Friday and had to
>>> fix it on Saturday whilst I still had the pieces all in cache).
>>>
>>
>> Agreed. I don't think this patch series makes the doc building situation
>> worse than it currently is so there's no reason to hold it off. Makes it
>> even easier on stable release maintainers so it's good :)
>>
>> I just would like the behavior to be unchanged wrt versions listed in
>> the switchers.js, the rest is fine and can be modified later on.
> 
> Just to be clear, you mean adding gatesgarth and zeus back?

Keeping the current behavior which is the latest dot version of all 
releases up to Warrior.

dev
3.4.2
3.3.5
3.2.4
3.1.14
3.0.4
2.7.4

is what I currently have.

Quentin

