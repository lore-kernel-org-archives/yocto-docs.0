Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 990C0C61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 14:33:16 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37787.1787841194394054334
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 07:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=dnzBm8wg;
 spf=pass (domain: cherry.de, ip: 40.107.162.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qk3BxcOBMsjZYOcDGsiwesiml09SZS6kmIy1AbWg+bXswrzhl26/tOt3RzT5ns60gj6HzrnSuiYR6XjRXL0nD1hXXHX4aSsDzJhlkTm+rq1DLexn4jMKhRZf2A6SwbD9xLReRMYuDrk4d+/BD/BXU3ZpTfpKLROOi9oZ898ltkTRfUaE/o7QFrjYpjB6zfGewGTs+Z/5SoRcjIzVsVQBFKB+zDsAXJjveHrm1y1GmHLBXvPB4H0CHLTzCr0h1jhgFazwVqjwTa7IRq4HP0OWhdxxwl2+c95cpoLm9qMWBitnT2nC9y9jeX7MMtdXGAcI/eemB30r6ex6yP85NYh2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUb7b9cG3LuJRk36cDfBSBgmEpTkPCMDQ/JJ/2bKe6g=;
 b=EUDlh5AIKQJyLl98i9THwAe5mmPoOdwZFo1omXDbsVRYUTgeQK0tyXVoG2OqXa6efX2Qp1G4FXlZWSYzbHXDVOCMmpKF6zlqbXcWFjMSIGnk85++kA6gguNRr1adSHPA3XzJtqJDKaWDY5djOsq+vL37hUbzt8RBL9vIYbdWRFMke7nzJIY/IZziBHx4w7JIP8ahAJTwZO8/oT5IPgQJZch6OJVOmBTc8AM6IcheHRk5NlV8nBC9OmaAJ/BLrClslO7Uq5xXmi0Ksqp0HYacPgJELwaUKx2T84vGNF+QT5+vmkWyCiSs0ZR8QkdK7c1FSQ1Fu0/5MYXKFk+4Ppx0dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUb7b9cG3LuJRk36cDfBSBgmEpTkPCMDQ/JJ/2bKe6g=;
 b=dnzBm8wg4Exlxvsh9YlUa2jhtsRIZuN7txKMEE8G0DwP5h95U2MQMMQA5byf9/XR1oAzSx+3tBMd7OjbY5Ji8MaW4SevWGbn+J5CxI2L8M/8MBwLc4FTT1pALdgj4AvffrCt+HKsxFZuKvGCc+K0DNQsHFZskM0x1dPvdGTCwew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by AS5PR04MB9923.eurprd04.prod.outlook.com (2603:10a6:20b:67f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Thu, 27 Aug
 2026 14:33:08 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 14:33:08 +0000
Message-ID: <121fe43e-bdec-4f2b-9f54-e92dfa887e33@cherry.de>
Date: Thu, 27 Aug 2026 16:33:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 00/10] docs: highlight BitBake snippets with the
 bitbake language
To: Trevor Woerner <twoerner@gmail.com>
CC: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
References: <20260826013502.2674000-1-twoerner@gmail.com>
 <34c79745-33ff-41dd-bb85-144bb26b02a2@cherry.de>
 <DKYWEFNK1215.22ZC7DOYBOIH9@bootlin.com>
 <ao7pU4NN4uuZDzS1@localhost.localdomain>
 <66624f77-ae0d-4670-bd99-c6ea9d2b2a54@cherry.de>
 <ao9E-I2EAyMrtlIR@localhost.localdomain>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <ao9E-I2EAyMrtlIR@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VIXP296CA0035.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:36e::8) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|AS5PR04MB9923:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cec12e7-e4b9-4436-11a6-08df04481d0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|23010399003|376014|6133799003|11063799006|5023799004|10067099003|56012099006|4143699003|22082099003|18002099003|4133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	lMSRxbtnABEAwugBgNOoUp68Is7mRCIGqmqpG73VknWf/37/sJyr/I8wS2JRJtIERQqyvr688kEk2vytyuHEgSq8eY2V4tDCOLo/s1dErXJirJZqFGIhPMaF+r9k1OTTbImnF1AF77PwEw887FmzmFUvnBnLMpBkaxfxCsLv5Tz4F5XudkDukYzKwg4KEJROkU1w6IdmjsBnf3Mhv7B0R2j+t6Z615UbSdfPnHIktaxmzsx0438E9LTJBZqu+y0Pkjun5xzYL6GZ0Yj8XdUeNN6ma3A17WqeHNJe/h3hg0pQ22Yyu0GFIj8LADFRq3YVYcSYVjhnUQER+X7siFbdlY6WnTX6OR8YMyhgsFzYm1wdyXDKk/NOoEgFFGs6LdS8/2HVQ5vj6jy2iORFTrSfCZMb1taFSozmqLLAwI6ybtJkU2FitEkNkpBaSxPPHs96SUN/8eggr1CTMd/kv35Zrc2P+d+PMaTUAhek/Kcrmysi3MbN1QuYAWtqcZKtS2XW5CJRvvdw63D7r8cn7u/+liUg71RpxqOsrYn1aFDEXqOs9kDEWdwVnnHnd+hvv5t3XjZz+kUdSNB9HR1OupjhNd9rcz25pjI+U07O8MZiZwsbvuPnPItqBVeIBA8nvvAx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(23010399003)(376014)(6133799003)(11063799006)(5023799004)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003)(4133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xRU+D4N49Lun62to2ngsmblHrAzF5CI4cWdafolahuVfhwYaepC47Rg9O2RB?=
 =?us-ascii?Q?gMUSHd/2ydmRtBt/Yoi+vojF1s5YHqMiRUIWiCsvV1AcNTbp6tPZd2NOetQQ?=
 =?us-ascii?Q?kkMtoci+ZdXt4zD1d+gUpr8qbQmCJXq2+rCDPZbS+rzr9nUNjOiUa/Je1XUi?=
 =?us-ascii?Q?RsFd0DqqJmk1QHS5jQtVPiUJuRjUQYwJNuLef/QrNzP5K35MObhlVzZrAnyZ?=
 =?us-ascii?Q?8L9QEOhm7dhzv30tQzHhRJoRTxLQL3Pju72hRqm59K1uleZv2qPRKsVrl0Fj?=
 =?us-ascii?Q?1gSb9ZLAMDoX7Z3uXpDREy8DQgSjw6ydD7g9I+sr+ntaPUrG9VHXHOj5Bs8W?=
 =?us-ascii?Q?qSYxjIr42GzHq4BpS9mhahR5njznLUdpx3x3bT7YK9wFL/Gi3oLhX25tYLYN?=
 =?us-ascii?Q?ckoZYjQEYY5SMUPYZ187fXF4ahk9OFfMp9ERZTfP2qfcex4fhzuVXDOhiQJG?=
 =?us-ascii?Q?GPCtpNlNkVJTGoxNpaKwfpFn/3aFCdJiGnm8xFdnv0X2c7O015bZdTKyAdqw?=
 =?us-ascii?Q?P/fmV8q6iCMAOntcciRzbveoLuP1g6TQL8Di/0cSwgaC6B+/7ciFFJ5TC1mE?=
 =?us-ascii?Q?u/d1QqNTPggLqvYvd7LPWV7L7hUetSmytPWI4Wyo8imVoyAy1T4vgmOwiU9p?=
 =?us-ascii?Q?kJDN1YvxyGF7XpszC8GhXZcP99w79zBYRfZj1Of2PMXsgvsYgCJFi76Va4Yr?=
 =?us-ascii?Q?ppKV7ETzOCYBZvNOHYJ116QfuLcn5sNNBfhW2P1pHA4/i5O8radFMzFtizsm?=
 =?us-ascii?Q?Pna+uDz9nxEAv/admVsMVYHgsKo4vUhjOfdrw1sSPkXVguiCvG0ewDUFBa04?=
 =?us-ascii?Q?eDMkYRkFjAlguDTqWVAIW6JdW/j0xayn2zekZWz02jgAkfLy4qGmJaDZTu7e?=
 =?us-ascii?Q?canf8Z59W9RtWW8S6Fl2ZRX9sL5cTQeT6C5MydK3qn6uKbfzwsr3Ll9wKoMz?=
 =?us-ascii?Q?O9dI/EsHQzHVIwzk4LysK4qvh4EKTaIJohYbVq3/+sfsVJ9FLK03QfA6FB83?=
 =?us-ascii?Q?Nh8O8ymjXiI+nQvsEx6psk8hpisU91dzoz7q2xZ0AZWIuC8xC0FaBPcXEbeN?=
 =?us-ascii?Q?s35x/JYM6FS30dR1CkCyEE/qdj9SrFh31i75Tlh5eVNNThISrjWZyb38Pg9g?=
 =?us-ascii?Q?ImEJnQeIsT1ni5XW7fdFVtLZnNCxH4AwXr2HlBcIKbFkdsl4Qd15jSGFJzwJ?=
 =?us-ascii?Q?D2Tc3AiRGkTMbQPACfdkcj3njR3O5Lo9H51l3o9eWkUGPguAfkNvEWieXEf5?=
 =?us-ascii?Q?5B8s1vYOhIgSyUsqpwnPDVotu6kWMuetcZY/kfpmQiNsg3Z3bERwgEATmckY?=
 =?us-ascii?Q?uuKjhgkFc6sA9PDPGZ0XnPX8Q1aHjU7qQZ5ZnEssQj7cReUkGSbiJksrGpuU?=
 =?us-ascii?Q?KjoblWAgY/vNuSeO28T/32Yx6inwQosHP/8fg33mSfoHbJYnyCFY8wlinsmk?=
 =?us-ascii?Q?SNiNbe7xpkD9NWY7zUlBsGGaMQBP0O7S2xCB3J1LCnHjG40/0TMgNBghyRs5?=
 =?us-ascii?Q?Uci48t/tI402L/b6oTqQy1wKegPyC/i3fgPWU3kFuuH16P6FHSctXnjCgYGt?=
 =?us-ascii?Q?68PH8TwGKK8ZbnnNsw6NhciRBd7LQiNU4g3rypmyJAKRSMdq7lKEcbkfYAUG?=
 =?us-ascii?Q?TMFxOUuNKBoKvaLtcgFwjAY/PBqFyOeO/NUX7BRUv45WqJ+QPS3Y3SDx7cUG?=
 =?us-ascii?Q?Sd3Az1bQP6B1I32Giv1zWw95nVrknmto60FOM8KCFpUBvhYaVRay+JN+CPBk?=
 =?us-ascii?Q?nnGIjvgff/jecs8wtp173D/zZSj3Hc65FOljzRL1AAOSBgr7VNHofzcykglU?=
X-MS-Exchange-AntiSpam-MessageData-1: nzLIRa1/7gWLQihsBt7ApdLlRqqhdHt1+4I=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cec12e7-e4b9-4436-11a6-08df04481d0c
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 14:33:08.2693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0eJXM7zTE9K8m4ns96vi0jGfoCURK90HYhD+SG3uk4YAakCnnwE1eI/2J8TGuqkcgrrerz/+e+qxBsyfCpV8wF8phXzwaRAYB6u85v4yyi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9923
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 14:33:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10388

Hi Trevor,

On 8/26/26 9:56 PM, Trevor Woerner wrote:
> On Wed 2026-08-26 @ 04:45:33 PM, Quentin Schulz wrote:
>>
>>
>> On 8/26/26 3:25 PM, Trevor Woerner via lists.yoctoproject.org wrote:
>>> On Wed 2026-08-26 @ 03:09:23 PM, Antonin Godard wrote:
>>>> Hi,
>>>>
>>>> On Wed Aug 26, 2026 at 2:10 PM CEST, Quentin Schulz via lists.yoctopro=
ject.org wrote:
>>>>> Hi Trevor,
>>>>>
>>>>> On 8/26/26 3:34 AM, Trevor Woerner via lists.yoctoproject.org wrote:[=
...]>>>
>>>>> [...]
>>>>>
>>>>>> Depends on
>>>>>> ----------
>>>>>>
>>>>>> "docs: state the language of nine literal blocks explicitly", sent
>>>>>
>>>>> Link to the ML please to make maintainers and reviewers job easier.
>>>>>
>>>>> [...]
>>>>>
>>>>> I think this is going the wrong direction. We should actually make
>>>>> explicit the language of every :: that is NOT to be understood as
>>>>> BitBake code and then make the default highlight language be BitBake.
>>>>
>>>> But then this might get forgotten? How about having the default highli=
ghted as
>>>> "none", and make _everything_ use explicit code-blocks?
>>>>
>>>> Sure, this is more efforts and review time, but also this is how other=
 markup
>>>> languages work - like markdown, where by default (when using ```...```=
) no
>>>> syntax highlighting is done.
>>>>
>>>> This is maybe a more conservative approach but at least it doesn't lea=
ve room
>>>> for code blocks mistakenly highlighted with the bitbake lexer.
>>>
>>> Yes, I agree too.  Personally I'm not fond of "hidden defaults".
>>>
>>
>> There's already one.
>=20
> True. So the choice is between:
> - guessing python
> - guessing bitbake
> - or having the author state the expected language of every code-block
>=20
> Personally my preference would be for every block to state it's expected
> language. I don't think that's either too onerous or redundant. We put
> ".bb" and ".bbclass" at the end of every bitbake and bitbake class file
> even though it's obvious what they are by virtue of where the live or
> what the contain. In general we put ".html" at the end of html files and
> ".txt" at the end of text files.
>=20
> But assuming I can't convince everyone that the language should be
> explicit on each block, (and that each such item should have an explicit
> "code-block:: <lang>" tag) the discussion devolves into: which default
> is wrong least often :-) So i asked AI to measure it across all
> currently untagged blocks:
>=20
>=20
>                                  lexed   correct   wrong   unclass   plai=
n   visibly
>                                          (known)  (known)                =
     wrong
>     =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81  =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81  =
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81  =
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81  =E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81  =E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81  =E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81
>      yocto-docs
>        bitbake                    1502       841        9       652      =
 0       96
>        python (today)              782         5      635       142     7=
20      777
>        none                          0         0        0         0    15=
02        0
>     =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80  =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80  =
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80  =
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80  =E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80  =E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80  =E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80
>      BitBake user manual
>        bitbake                     299       193        6       100      =
 0       16
>        python (today)              182         6      148        28     1=
17      176
>        none                          0         0        0         0     2=
99        0
>     =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80  =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80  =
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80  =
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80  =E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80  =E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80  =E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80
>      both
>        bitbake                    1801      1034       15       752      =
 0      112
>        python (today)              964        11      783       170     8=
37      953
>        none                          0         0        0         0    18=
01        0
>=20
>=20
> Setting the default to bitbake would be a real improvement on what we
> have today. But it doesn't get us to correct. Across both repos it is
> still wrong on 15 blocks we can name, it has no opinion at all about
> another 752, and 112 end up visibly wrong. Those 752 won't be right
> regardless of which default we choose.
>=20
> Assuming your proposal is to set bitbake as the default, then tag
> everything else. That _sounds_ good:
>=20
>                              untagged   bitbake   still need   % of
>                                blocks               a tag      untagged
>      =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81  =E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81  =E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81  =E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81  =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81
>       yocto-docs                  1502       841         661        44%
>      =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80  =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80  =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80  =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80  =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
>       BitBake user manual          299       193         106        35%
>      =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80  =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80  =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80  =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80  =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
>       both                        1801      1034         767        43%
>=20
>=20
> Under "default bitbake, mark the exceptions" we would still have to
> explicitly tag 661 blocks in yocto-docs and 106 in the bitbake manual:
> 767 by hand. Tagging everything is 1801. So we are marking hundreds of
> blocks either way. 43% is not an "exception".
>=20
> Which leaves how each scheme fails when somebody forgets. With bitbake as
> the default a missed block renders as bitbake - confidently and silently
> wrong. With none as the default it renders plain: bare, but it doesn't
> claim anything untrue. Given we're tagging hundreds of blocks regardless,
> I'd rather the mistakes look unstyled than look wrong.
>=20

Just to be clear, we do not use none today. We use "default", which uses=20
Python except if there are warnings, in which case it falls back to none.

> That matters more here than it would in most projects, because bitbake is
> a genuinely bad language to guess mechanically. Shell sessions,
> TEMPLATECONF=3D environment assignments and buildhistory output all share
> bitbake's NAME =3D value shape, so they pick up variable-assignment
> colouring without being bitbake at all. In a lot of places our snippets
> look like console, or bash, or python - or maybe bitbake.
>=20
>>> By default a non-specified block will cause pygments to guess. So if I'=
m
>>
>> Sphinx explicitly states that Python will be tried and if there are
>> highlights warnings, none will be used. c.f. https://www.sphinx-doc.org/=
en/master/usage/restructuredtext/directives.html#showing-code-examples
>>
>>> looking at a lot of reST and seeing no tags, I'm going to assume the
>>> authors have left pygments to guess. I would have to go looking in othe=
r
>>> places to see if there's a default in place for non-specified code-bloc=
k
>>> tags, which I'm probably not going to think of doing, which will
>>> sometimes probably cause more confusion before it becomes clear.
>>>
>>
>> This is the Yocto/BitBake docs, we're documenting that project, which us=
es
>> BitBake syntax. Would you want to write
>>
>> .. code-block:: rust
>>
>> for every code-block in the Rust documentation?
>=20
> Yes.
>=20

I find this very unnecessary but I guess we can agree to disagree :)

> First off, not all blocks are going to be rust, just as not all of ours
> are bitbake:
>=20
>                            Total blocks    BitBake    of all    of untagg=
ed
>    =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81  =E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81  =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81  =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81  =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81
>     yocto-docs                     1929        841       44%            5=
6%
>    =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80  =E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80  =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80  =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80  =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80
>     BitBake user manual             334        193       58%            6=
5%
>=20
>=20
> You might also be suspicious of an LLM's ability to judge what language
> a block is. So am I. So the classification isn't what the numbers rest
> on: every block that got tagged was then fed to BitBake's own parser,
> using the regexes out of ConfHandler and BBHandler, and anything the
> parser rejected was re-examined. That's how a Makefile, three U-Boot FIT
> source blocks, five Python unittest classes and five kernel .scc files
> got caught and pulled back out of an earlier version of this series.
> The counts above come from parsing the built HTML.
>=20

I actually forced a code block to be Python and attempted to make it=20
syntactically wrong, the lexer still happily chugged along. So I'm not=20
sure any tool will get the numbers right.

>>> Maybe it's just me, but I prefer to see every example block using an
>>> explicit code-block tag and specifying a language. That way the author'=
s
>>> intentions are unambiguous, and we have an expected output.
>>>
>>
>> You won't be able to backport patches with
>>
>> .. code-block:: bitbake
>>
>> which is what I would like to avoid. But I'm not the one sending patches=
 to
>> the stable branches nor the maintainer(s) handling stable, so maybe I
>> shouldn't care.
>=20
> For everything going back to scarthgap, the auto-builder uses the same
> tarball for building the docs, regardless of branch. Therefore backports
> amongst everything from scarthgap to master would be fine, once that
> tarball is updated.
>=20

This is looked at through the autobuilder scope, the docs are still=20
supposed to be somewhat buildable without buildtools or autobuilders.=20
but fine.

> For backports to branches earlier than scarthgap the AB doesn't use the
> -W flag, so those would simply emit a warning and render the blocks
> plain. I checked this against the actual pairing in the older tarball,
> sphinx 5.1.1 with pygments 2.13.0:
>=20
> 	WARNING: Pygments lexer name 'bitbake' is not known
> 	build succeeded, 1 warning.
>=20
> with the block rendering plain. So that's not breakage, it's plain
> presentation.
>=20

I'm not sure saying warnings are fine is something the project wants to=20
get behind. But maybe it is fine, I don't have much power there :)

> And it's arguably better than what those branches show today. Of the 841
> blocks this series tags as bitbake, 632 currently render *highlighted
> as python* and only 209 render plain. So on an older branch a backport
> would be trading incorrect highlighting for none, rather than losing
> anything.
>=20
>=20
>>> That's what I've enforced for our reST at work, and I've also
>>> differentiated between "bash" (for actual shell programs) versus
>>> "console" (for interactive work at a shell prompt, a shell most likely
>>> to be bash).
>>>
>>
>> We differentiate console and shell in these docs here too. If you're see=
ing
>> one that is using the wrong lexer, please fix it.
>>
>> Cheers,
>> Quentin


