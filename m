Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0779DC433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 14:59:42 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.80])
 by mx.groups.io with SMTP id smtpd.web12.10884.1647961170114927584
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 07:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=TSLYrf/8;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.4.80,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qxnv14Uj52/OEXlfatiQfvWFBgsVz/9jdbSxfaD47ER3igIcMDZsR41W9BCz5HXKp6totjVZCsmZadcgBveKztlbYIjhZoEkNsa/Bit2YgrsKyg5vLV4htnMtagGx9o9RSg0tsH6csC/oFkfL6urPGs3QWEESq8oGlEm3v9aqIKDhXYN2KLYZLMS4TJoDDkUFfddMXScD6sxL68Vh2hGR7sbQx1uO/J1JFQAkkLXbc2TK2WyLjnvdVtuwY53J49OFL+8cu30ltg2ioPOIMe3NgEU+QpVR0hLE+H2Q2X3hTFgGYDh5PBOQAW2B/uPWL7ByaWLhvQT4OFCazR2rQuX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQb0ljrNMtoUM2EmQFR69q+CRv5yTTQWN1OlhYyUePg=;
 b=PSh0lCwzwu0h9wwr5hbox00eWisqevEIsWDIF7GdRqz8axgefNb2w73j3LXjXAEW0xyqQeBbdsI3O2rBX5pHQlpwouEQxJTuRFTzclcoyz1pJlz0p6hFbLVJTVwchyl5svC9MTM9ec0GLx9ZoAfQ7XvqMcdrccOhgPwf47DBkXPf5L7y4x4mX8CHg2gViBm1DKVvuqZmv8z06NEx3wP3O7kfHcB4D+KzB2gAgezCgpIvaaEpFBm/XtohYo7yvLYPJh6XH2RF49NhjiYqwUd41KLAJmmt2rYez+pY67zh51WTABan4cYot2lrZ9gKaSywScl+QZKACX27RcVYD4MHgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQb0ljrNMtoUM2EmQFR69q+CRv5yTTQWN1OlhYyUePg=;
 b=TSLYrf/87by5BCDpAMoKlEWLmkFP+JVdPxQ2vamtqddQ+Z+A+GWSOSeHUXEfo5Iq0g0p0goXaq1SZxn11KG9GEP9xA/pRzWm4hnk7wi4Gp9QiZovLShd2xNMgOnUYhbKOKg0udHsEYu5UywsnXzatKtru2gkNew+XBcE1M4kQPw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by VI1PR04MB4350.eurprd04.prod.outlook.com (2603:10a6:803:3e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.23; Tue, 22 Mar
 2022 14:59:26 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391%7]) with mapi id 15.20.5081.022; Tue, 22 Mar 2022
 14:59:26 +0000
Message-ID: <81aefe5f-58b3-c1f1-c8fc-21722bba6f83@theobroma-systems.com>
Date: Tue, 22 Mar 2022 15:59:24 +0100
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
 <a7308598-4d69-ec6a-4edf-df198055ee93@theobroma-systems.com>
 <5bdb0cfb67587ad347f17bb59b0ea1b3a3e110b4.camel@linuxfoundation.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: 
 <5bdb0cfb67587ad347f17bb59b0ea1b3a3e110b4.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0001.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::13) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6216c9c8-e782-49ea-1733-08da0c148eac
X-MS-TrafficTypeDiagnostic: VI1PR04MB4350:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR04MB43506D644DCEB516172FF86EC2179@VI1PR04MB4350.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pEQAxQ4dkAuiRS9K4vaj/GmvWSPxus1evYBh5m7Xj9XsNcSPqxoAe0XTFV+zGUqlxJKGsYFxHxQtBSZgHsF9GITcXTlBfBMglXjxxof1t6ofDlRVx377eJ6315u6XtoQMwrDgEkCZHigDGzU/otYUNC3bLWj0GSX77bjigmLhJ+uOjFGV9MONMLZU3Nl7nj7817c8OinYW9Wbeb/+LYon7IMFu12qCC+UAr++KrPQNB7+2treJJyxTcoG9hRjMrdAX6Po8PYYtNqKXW7WSvNdH8yo86LyG91sTJFEG5f1p4qjPE9cE0D6EvXOUIAA60IxV1SCELnJbOP6/bKqFvBawwXXwlzabzosDtxijr5la1sGOLXlD//HiYFHHE5KDMfJq9h7qN6ek50KkQdjPLuhhRy0/haub59B2m9TXG/f6A5wHCCpF9IGBfeMESBhyOSiiUf2VevrN84Tn+7cmUCbjsZFu1xZwtsgE7M66cEU1eUBvjabq62uEiRHEhLcv45amp57RRGq9ZqfjBn0jfVr+oJJKS0RhXnz2SgC0Krktu+Bwr9EOGGXAzEnqg16KAM57TrtiySTDpmp2I/NckUD6qGUqxxd1d6mfkHKOIAE094u7J5yiT8xHqX3nhLHZtO8b+UyWN5Q90mR+nAnyZaC5QrnitLf8jhnd3XEEwJJikjlgcDjrmkkZuWbOG+H3J416ofta/bzYD+essC+dh5tISGVmpFtM+3jhluoKgOurGThuaC3P441Q7+GnzjLJco
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(66476007)(66946007)(26005)(186003)(8676002)(2616005)(5660300002)(4326008)(44832011)(8936002)(86362001)(53546011)(6506007)(6512007)(38100700002)(31696002)(36756003)(2906002)(316002)(110136005)(508600001)(31686004)(6486002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OVlQUmpUeHlvRURETDhOSzVyeHhKc0FQczRTUXZvN2dqRnU0SHE1T3pvOWZZ?=
 =?utf-8?B?cGdCTzV5Zjc2Q05wVm9xZUZNTkF6dDB1cTlzM3Q0Qmt6ckxFVmZtVXQ2bzMy?=
 =?utf-8?B?dWdRdHh1eXBrdlBxMjV1R1BoT2grb0dHUXEwalB2UjQwb0FLMEQ1dU9TTVp6?=
 =?utf-8?B?cXpoaS81SDRJYVYyTkkwL04xYy9JeXBUOEcxcDZmOE5CMmNGMFMwaWhzSzI5?=
 =?utf-8?B?Q3dPZjRmMnZFUk1Ea3AxSGYwajBVbURyTElhOWF6VTQ4N00vZDdJUDAvaG95?=
 =?utf-8?B?NDBDN0FTMkZqRlBxWUhMSTVMQmkzS3lZSTNybUNwdG9DdzRmRmp6alllelp6?=
 =?utf-8?B?WVhYM3NUTHFxMzczbmw5UDI1am9nMms4WjZPSWhqRi9LdXg4aVViMDRnYVJR?=
 =?utf-8?B?NDlUNEt6bUN2QTIwSlZqUmlzcmsxSUptcjJjYmtUSXZHelZNczNYK1g0eFJs?=
 =?utf-8?B?cHdGaGpuT3duTTJ5T2ZZU1lWZXA0dzNKSkZ3SVFpUXh6WWhpZEZJZVFyUTdJ?=
 =?utf-8?B?OS8zd0lWZ1pKN0lrU3NYYWNmMWFKNVJNWnRQVnpjUk9pZkk4WjVHbWpwUnZp?=
 =?utf-8?B?TWFOOStlNlRjM2ZnWEM2K0VRTUlzcHhqcStSVGZqZWFXbXdWbVZ1UDJyK0lT?=
 =?utf-8?B?K0pPZ1VtRXJOVURoWlVKbzN4Sm1aT0NPQ0lsdEZtcDVXd2czYThKd0tkNWxm?=
 =?utf-8?B?Vi9QTVJXa1U0dU1wcmZQS091UUdWaXFhUXBMK1VTZ0dYOTZrSFV5RG5rNHRo?=
 =?utf-8?B?QVlUeGVqUjdud053bmdsVEhHUlZGcnRlZHFZU2R1WjJIN2NSK2lzTWVXaXRD?=
 =?utf-8?B?QzhadjJCMFAwNm1OTEFWVW9KOTlJaEIwc1NyTnlCZUVGRjc2blZhTDNYV0wx?=
 =?utf-8?B?WFI1THR6czZuME5rM1Y2Y3A3QTJES1lqdE03YmFTbzBMS2wyTGVNdDZwa2FR?=
 =?utf-8?B?allySHdoS1kzU3BtK2pBRWVhcEwwdEFtK1hBbDRVRncvdk83NW1mUVNwak5E?=
 =?utf-8?B?L0xSb3NiWEFMa1lBTWxTL2Q5MTlDRkVXUHFEQjlENU0wS3NxUzBoVmd6VEt6?=
 =?utf-8?B?VzcvUExDMEk1Y25udTBOVFVxOW02UzdxTlNmZTUvZlk0RU1aZ21ScnI2NTlP?=
 =?utf-8?B?UmJuS1M0VmVoTnZBSzIwWVp3b0VtTjBkS2t5SWNrVmZDMUllbzNFd1NTL1JN?=
 =?utf-8?B?WVVFODRpdEJ4VkY4SXE4OE1nb2VCcWNIOFpNRXdSS3liZDFLMkpmMk9oNzY4?=
 =?utf-8?B?WGZBVWVtSjk4OE1tYm5RNTlxRC8yUjY2QmpFRW1hSWRmS1B2VDJ2aWFKTk5Z?=
 =?utf-8?B?MUQ1TmRJSnoybXV5ZXI0T1lFaGM4RzhGUTBXejRYa0xTYUxCcWNUM2dVZHRa?=
 =?utf-8?B?SkJZS3RWdGxBS0NjSDN3VjZ2eDVvcG9zZFoyayswN0J5QmJBOEltaFh3a3FN?=
 =?utf-8?B?WkNhazllVXZ6YUFrbzRaSUJwTTU1d3EvcTNvM3dYZzhSVWdHanJuaUE5WHdt?=
 =?utf-8?B?R25HZDJlUXJCaHdFYVEvTmdES0E2aGxpTi9LeHpIWGlUTS94RjBiMEhucGRH?=
 =?utf-8?B?aDZ2RkhIVEk1dCtNbDM5SUJsT2M4WCtHcU5qTDVFSVJsMjVJTnEzK09yQ3la?=
 =?utf-8?B?UEpZTm5lOHBSOWRxYkJnNWVOYnBvWFBlYnVHc3cyN0l2cjdyNmk4ODU3bHBz?=
 =?utf-8?B?T3BUQXo2cWgzUitPK0hkeWpoTVNkbFZNc0c4VGUvNXltclJCRTRZM2sxZ2xs?=
 =?utf-8?B?L2I2RDNuMlFtZU9oandVc2hsaEQ1VGEyUnF6dnQ0UUJEdWRIelQ1WjVpY2w0?=
 =?utf-8?B?K3IrdXh3cnBHZFhwMTZxN3dPZTZRY3pxeVJBQk1oYkF4VktoMTZpdERydTJX?=
 =?utf-8?B?d2tlTmtxdE5seldPNDNjUlovclBsamtMK0F4S3RPa2RXV2xWK1dRU05sOFVX?=
 =?utf-8?B?c3JhR1dhSStIUW1lV2VpUG82NXQrVzgvQmU4amlVMWRSZzVQbmE1OEZwMkUr?=
 =?utf-8?B?NTZUaHAvc1hKWU5YdmswVk1uTzVtR0NEcEhLSGkxSDd3NUtXSWkreHF6UnJM?=
 =?utf-8?Q?I218Lw?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6216c9c8-e782-49ea-1733-08da0c148eac
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 14:59:25.9962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cqnHf079FRNc06WfK5zGI1Loa6IVpVPf0wHLb4Ch21cbyEB6T5KW9QJOxIOiFzRsDqWf2l5fMzpDiXufdMcoJrlqh8v7m2Oe7+ldWIKeq6/m0okQOjd/heDwhTGCT3Bm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4350
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Mar 2022 14:59:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2688

On 3/22/22 15:54, Richard Purdie wrote:
> On Tue, 2022-03-22 at 15:33 +0100, Quentin Schulz wrote:
>> On 3/22/22 15:25, Richard Purdie wrote:
>>> On Tue, 2022-03-22 at 14:58 +0100, Quentin Schulz wrote:
>>>> Hi all,
>>>>
>>>> On 3/21/22 23:06, Richard Purdie wrote:
>>>>> On Mon, 2022-03-21 at 22:56 +0100, Nicolas Dechesne wrote:
>>>>>>
>>>>>> Would it make sense to implement what you have in set_versions.py directly in
>>>>>> Sphinx 'native' code ? e.g. directly in conf.py, or in a module loaded from
>>>>>> conf.py (see how kernel does it at [1]) or yocto-vars extension, or as its own
>>>>>> Sphinx extension?
>>>>>>
>>>>>> poky.yaml only purpose is to be loaded by yocto-vars.py which is a local
>>>>>> Sphinx extension we created.
>>>>>    > Possibly, yes. I've done it like this as it was easier to validate it
>>>> was doing
>>>>> the right things and also easier to apply in retrospect to previous docs
>>>>> releases. What we want to do going forward is an open question and it does feel
>>>>> like that script would be better off as a module that at least for master, the
>>>>> docs code called into.
>>>>>
>>>>> I think that would make most sense as a follow on to this series if/as/when
>>>>> people have the time to work on it and test it accordingly. As it stands the
>>>>> series was already quite painful to develop (I got hooked on Friday and had to
>>>>> fix it on Saturday whilst I still had the pieces all in cache).
>>>>>
>>>>
>>>> Agreed. I don't think this patch series makes the doc building situation
>>>> worse than it currently is so there's no reason to hold it off. Makes it
>>>> even easier on stable release maintainers so it's good :)
>>>>
>>>> I just would like the behavior to be unchanged wrt versions listed in
>>>> the switchers.js, the rest is fine and can be modified later on.
>>>
>>> Just to be clear, you mean adding gatesgarth and zeus back?
>>
>> Keeping the current behavior which is the latest dot version of all
>> releases up to Warrior.
>>
>> dev
>> 3.4.2
>> 3.3.5
>> 3.2.4
>> 3.1.14
>> 3.0.4
>> 2.7.4
>>
>> is what I currently have.
> 
> Sadly I can't make this work easily since there are no tags for 2.7.2, 2.7.3
> ,2.7.4, 3.0.2, 3.0.3 or 3.0.4. There are a bunch of older releases missing
> too :(
> 

Quite unfortunate...

We could have 3.0.4 and 2.7.4 hardcoded in switchers.js and use git tags 
for the rest?

Quentin

