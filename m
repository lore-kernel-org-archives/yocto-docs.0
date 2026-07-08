Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32ADC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 12:05:56 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6874.1783512355782404128
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Jul 2026 05:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=blxxnpk2;
 spf=pass (domain: cherry.de, ip: 52.101.69.29, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVgxcWfFcvU0Mg4r18t2gJq1dw486YxrgS5TALfkndo6/64h5Ait6qwPVxUX0AWtp7IbHcWl5TyIKK7df56yV4cBgGj5mG98rv8ngm31cRtB6U2NGMiBk8NZyHw7f++VwW2k950/m2CsEWXPjvcNoOOKr5FsvkaLn84I8vQIf0v4UjTlp85kyc53pTyxjAxkcwulTM1dDm1NKbOWGed6f9CBZN6gcpgw49qUrBqsIOg1aNqVDPw+RN+hi9VeYZbU2HY3GKB8IWQ4Vh24aIdPgofLYnAMRoNYeC1nVRgD365I1KdEOFoG8fTH8Afoa0Wji4kL5aFlJL+IXAZvViXQ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJxu2tZlcnRg0rISurQuTkGi1MH6CkAYsQboeajhWRE=;
 b=Uwv2yFNF4FbzpvwnmLy5co8q1a9mGtzMTKHWYq2pVCCoN/wNbbwNM6iT3GI5PSkjgrvgG9qTjWaYy8m83tLTioIr+MgUsfPnhvE0RRj341k5fsUm2U8B+Bb0mr0/9RAhNbSv9rAtJcvtSJvVvRoP5LJH6vqfKtMK4U+a7KblGTkZK8gkb7jq5ADqVZQZ5acbhmegHScUjVJDsCGxK9jL8zRZYK9ACPaR2qmTcjT/1h3ZppoNEfv5HfEdgVsvIQwwU+l8dHs+JWPWmZ7pxCQwA7aq6zR9H6unvLKWyfJW3wVyhAvDjruRQfZBS9stroVKCaSA1qZKmVHEoIVvJV7VAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJxu2tZlcnRg0rISurQuTkGi1MH6CkAYsQboeajhWRE=;
 b=blxxnpk2hwJjNuHK3x2HL6HBcZxftAwVcPnLI7hhvHfzwbjXS5FGnOzpLq5y5aJsdSdXAqEW1CemsyPixjPVVzuxNqDvs/73UOYi/8qqRFGTtFJc9lpDfyBRycXl5ygbK+u+Ndj3aJWa1gQMUX6v9slIMSKOwZj80Ez9pMpbF10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DUYPR04MB12690.eurprd04.prod.outlook.com (2603:10a6:10:65f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 12:05:50 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 12:05:49 +0000
Message-ID: <754789a5-9782-407f-8d7c-85942817a65c@cherry.de>
Date: Wed, 8 Jul 2026 14:05:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH RFC 0/6] Generate documentation links for OE-Core
 (cover letter only)
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260703-gen-doc-links-v1-0-c2c31c68a0c2@bootlin.com>
 <d7cfcd90-05b0-4694-9b37-8bd7ac5fa029@cherry.de>
 <DJT3RMDK1H4Z.2CCWEJB3VWC1L@bootlin.com>
 <ebb09a0b-babd-47d7-bbaa-a9d99d95c84a@cherry.de>
 <DJT67BR5EHYL.3TBALWGBB86R4@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DJT67BR5EHYL.3TBALWGBB86R4@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VE1PR03CA0028.eurprd03.prod.outlook.com
 (2603:10a6:803:118::17) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DUYPR04MB12690:EE_
X-MS-Office365-Filtering-Correlation-Id: b29958fa-20c4-4951-7ede-08dedce9403f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|5023799004|3023799007|4133799003|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	aK9WWH0seOcS7Zp2ooAHeSVhfSUl9diMHttIP5wxbUKkaFEx9rxkd5rIjFHac3CSvgvKziEYzhzj26WmWBnXfMFuApa6NPJFJfT/XXwl5pXTw/YSo2Cb7UyJK6j17iyNlnlQrilT3jt/9U9HcxSsNGPkkssqNZi6OP+SxNNWOwgLHPL334VYMLxbahJTnb8Xnd5e3jwObvvHAQKg/E63KVf8Pq8XGWHCOm1vtHsX7rPMjh1zXC9TRwzUrphZlKUBzekuYMwcb18G9MgYwq+cZAJKNAkj65zbaEQdvenRkq6T2PmO/0RrcvWGYKvkOIKV4Dv7H04Lt7najMaiSkMN1FwkrSWwM3LFB9fQILWj4ViRvx0ZhvI0I7uMHN5VMe34+dPM6wo83d6piIiY4m7udpvAPUlZg9K4i5app2LDccUrTkGj2b0z1wwZMX9iMCVvCBD0XHUA+NVN4IKoa95t2o2Kop2e2rf999p5Sl/R6YUWWpJabhIvwoUr/U/8vAksZsW5MUwKoNxjxaKoO3jf6pDEiDdjSRgAOkOxEWRpHpdOYlmrj7QkAek0Aiuls9pXjcSY7G/wir5w0U5e/nUJNDyCrfvPZ71vfxei9RdLzkE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(5023799004)(3023799007)(4133799003)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S05BZlhlanQ2dmJIRFBsWFRxditWSEIyczdXTnIwclBuR1pBU0pFLyswSDlB?=
 =?utf-8?B?TEdxR3BtTE1WNzlORTdSZHJ6a2VoQjZVMXMydWh6RmEyQXdYT0d2emF2YTFu?=
 =?utf-8?B?dEhRbGltVjZFQnVsNDc4SUZEVnZQVFFkdDlUcUtpOWRSMklQdmhidndZQUVR?=
 =?utf-8?B?NG45amhiTjlYVmxmOUg5OHVUQzJZMnNMN2V5a0VhQUZpZlg5K1Bna3dtRUdy?=
 =?utf-8?B?L0p3VVlnTjFVMjhnVDZJZ0IwMVJNaEdlbW53aTQyVU8vWTdvOUhJRktiSmxl?=
 =?utf-8?B?WmdmbDVhaFgwdTgwK0NXKzNuVDlhN3NYd0pUVWdsRDlCTEFtY3JyMmlyL0Fa?=
 =?utf-8?B?ODFRUUpNbkxkTDUxQ3V6bDVKQnVod1dlWmpMTFV3UG9rcW5DLzROcmFJb3pn?=
 =?utf-8?B?Vk5sa2U1VHlpdmlFVlVjbEdLMUhwckJDUEZkdDlOSVhkbjJIdzBOV0NyN1lM?=
 =?utf-8?B?MThSc1NBY2M5U0trRlpPMkl2S2oxWUJVaWo5WmFPWHZ6ZHE5R2RqbmdzK2Vm?=
 =?utf-8?B?UUFUS0xDOGdOeGNnNmg0OU5uWkZFaFF3dEk3NmxDcnk2c1F4d2NLU1lMUXNQ?=
 =?utf-8?B?REpiOSsvTCsvSGZ5MHVwaitYT2k5N0I3TFd4R0Zxc0VwdG5xU3Y3alVjb0U0?=
 =?utf-8?B?VFlXWEM1dXVoaXNZcVN5QXlGZlRhSUJJMUxaaXVqZmkvWGpFdis0NXVyaXc5?=
 =?utf-8?B?cmFINUF3cFZQWGQzV3FjYmlpZE0rck9vckphWE0vWFJ5TTlydVQ4VmQwTDl6?=
 =?utf-8?B?L1E3WkplYk5mM3BGUml6c2xuRU5EVE9Bb1F6cEdXZ3FTNExSMlNpMjgvTU0r?=
 =?utf-8?B?S09ka3lrUmFtWFhCR21JYTlNSlpLQmRBelNXa1owa1VNejE0UmxOaS9JNHBP?=
 =?utf-8?B?Q01QUXozVXEyK3ZaSkpCWlFsdkNEeERqd0ZiZW52NXlXUCtoKzFMMmRaTWI1?=
 =?utf-8?B?VGNGZmIzeE50K0dxbGsyQVh1M0Y3dE54TU5wMEljWk1vQUxxVlQ0OVZPZDUy?=
 =?utf-8?B?ZW84MVJPTmJ3N1VoVDZDS0F0cFNIMHJHYmRRRWl0eC9tZkJ5UzBtZEpBQit6?=
 =?utf-8?B?QVlRSEhKUndZTGR3bHFiUFFuSEFvMTliVDJXcFJ1b0s2OUV0ekc3L0xsWGZY?=
 =?utf-8?B?NTNiNUFpYWZ4WVFldVVnWWdyUGRMa0Fsd0JNZHpzVlJOWjlxanZBdnRvYkFj?=
 =?utf-8?B?cnJ6KzMvekF5VmZ4MndjSXlhWFdCTWw4eU5nOXdOVXBqMjhPWlZEWUxLdEFC?=
 =?utf-8?B?Qy8xa1N2eWNTSG4zdzIwSzlCdzRZY3JxSlY0YnhoVThmSW40MXhDY3NndUxN?=
 =?utf-8?B?QjRvQk93QUpsNjQ1RE82RkwyVnF4V05lQlZGMDh6eDVUM0JSWTBlQ21PaW5s?=
 =?utf-8?B?dFBFMGpqRGVDUmtPK2NKZVhmUDlWdVlrWUk1VjY1d1BMaHF1MWp3R2s4YUtY?=
 =?utf-8?B?cTdSTnVwNndtSTBwUDg4ZkIvbkFPTVNmNk1qb3lCa0pBdHBUT25NQXJDbExP?=
 =?utf-8?B?b0pPamlZMnZzbE82N0tLQlNTN3hjeHFsOHZxL3l2Q0lGRnVwMjlrSGNzYTBK?=
 =?utf-8?B?Um9Mem9ob3pUdzU0WHlTQTZjVkx6VmxuU3EyVENFK2s1dTN2QzIyQ0hxOE0y?=
 =?utf-8?B?c0NBUExmeXovdHJwWGtPRXNEREFHUGxzekpaWjRHMzVVdy9zcXF1R3ZZcng5?=
 =?utf-8?B?eEJLeTNjdUg2WmxKenBLY0JMVHJuSE1mQVRvUU9ZR29KREswR2lIcVpvQmN5?=
 =?utf-8?B?OEw1R1VKN1d4WS9ua1BBNXlja2pqdEowbzVXbTNSRnk3eXEwVmhIaFJ5K1ds?=
 =?utf-8?B?ZjgrUmxHQjRVSTRnS1dKbTQwREsrYjAzdEp1R1ZDUFhzSEFZTXZqS2ZaM3dt?=
 =?utf-8?B?QlBVdFVJc2hVY1FmVUZjVmdCQzV0Y2k3NnJnUHVnamJIMVQ5S2tLYTRaUElz?=
 =?utf-8?B?RUpIbEU3WGE3ZXZ4V00vN3Q1N0hCeFE0bzlKMUMwMFI1MDRTSVFMT0VPdFdz?=
 =?utf-8?B?eE1pSmJscGl3SjZUbVNLNldhKzNzZkljb3NobkZqWkpPUE9ucSt3NnNUUE1B?=
 =?utf-8?B?L0VUanNSMUhJbjJlcVVaaFBKT3B5eEdLOE9hdW9XdHNobUlpbUhNcXQ0NHRp?=
 =?utf-8?B?ejY5a0hBQ3pzMFZFQURDRmM4c3VoUFZFRG5kN0tOTzJrWkp4ZzNjd2F6SmhV?=
 =?utf-8?B?ZDhEYUloMXl6cGJldHhrTWN4NDNTakI2Si9kL0NmaXllY2hQbHNpTlVBbUV5?=
 =?utf-8?B?NTZSVm1PcGJEcEF3cEFacVNWTm5rRjBLengrclFxZTdGM3crOFgxQ2xrK3ha?=
 =?utf-8?B?U2N0eEJiTlFzUlJGVVlGdVpObzA4SGpLNk9Za0pQZHlSM1ZnSkg5Zz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b29958fa-20c4-4951-7ede-08dedce9403f
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 12:05:49.7926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QaDYTjLmwNutaiBHIfjkurQvk7qK8IXRkK5tYSri7qeRkBrxAMR4glrHFPwBYqTOpPNqczSPHbaRUZxnNoTFR0iD2+8PyQb352elkavPTe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUYPR04MB12690
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Jul 2026 12:05:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10045

On 7/8/26 1:58 PM, Antonin Godard wrote:
> Hi,
> 
> On Wed Jul 8, 2026 at 12:24 PM CEST, Quentin Schulz via lists.yoctoproject.org wrote:
> [...]
>>>> I've barely looked at it but the first question I had when looking at
>>>> this was "why a file per variable in the glossary?" and the few commits
>>>> I had a look at in the RFC branch don't really say. I think you may have
>>>> wanted to generate a list of variables that are in the glossary and
>>>> parsing Sphinx is a bit overkill, so just looking for files in a
>>>> specific directory would be easier? There are three issues with this
>>>> logic, first, we would need to do this for older releases which is
>>>> time-consuming and error-prone (I guess you probably wrote a script to
>>>> do it, so maybe not that much), second, it may become outdated, third,
>>>> you need access to the docs locally.
>>>>
>>>> Have you considering simply getting the objects.inv file generated by
>>>> Sphinx and available at docs.yoctoproject.org/objects.inv?
>>>>
>>>> python -m sphinx.ext.intersphinx https://docs.yoctoproject.org/objects.inv
>>>>
>>>> will give you something interesting.
>>>
>>> It looks like a great fit for this indeed. My only concern is that this
>>> is built after running a Sphinx build. So depending on this file to generate a
>>> configuration file that we maintain in yocto-docs means we depend on building
>>> the documentation to generate a source file. This is fine, but originally I had
>>
>> But the neat part is, you can download this file from the official docs
>> so you don't have to build it yourself or require a local copy of the
>> tree like this RFC suggests.
> 
> The script could always take an URL as argument and do the fetch part, if we
> want to do that out of yocto-docs (but do we, really?).
> 

I don't understand why you want to have it in yocto-docs. It would 
require a user of OE-Core/BitBake to clone the docs to have access to a 
file that says where to find the documentation of a variable in... the 
docs... on the Internet.

>>> a pre-commit hook that would check whether this doclinks.conf would require
>>> updating, and now this hook would require the documentation to be built to run.
>>>
>>
>> Ah, I did misunderstand the intent here. I somehow thought doclinks.conf
>> was supposed to be part of OE-Core, but I think it would be more
>> appropriate this way, don't you think? We can always provide the script
>> to generate such file, in case someone wants to generate something based
>> on it (like I could imagine some VSCode/vim/emacs plugin that allows a
>> click on the variable and open the doc link in a browser or something).
>> I'm not sure what's the usecase for third party projects to be able to
>> do it though, it'll point to the official docs, where we only document
>> variables in OE-Core/BitBake (and maybe other first-party layers, don't
>> know).
> 
> The advantage of keeping this file in yocto-docs is that it can be automatically
> updated as we add or remove documentation. I'd say that's nice considering that
> variables get added or removed quite a lot. If we maintain that in OE-Core, it
> means it would have to be updated regularly through patches, which I think is
> not ideal.
> 

It won't, because you cannot force users to use pre-commit and it's 
bound to happen someone will forgot to check and merge commits which 
don't modify the file and add a variable (but yeah, the next person 
running pre-commit for a commit will bring it back eventually and I'm 
assuming you would be one of those people :) ).

But maybe.... we don't need to version the result of the script? Just 
the script itself and if you need whatever this outputs, you run the 
script whenever you want to and you get data relevant to the current 
state of your tree?

Cheers,
Quentin

