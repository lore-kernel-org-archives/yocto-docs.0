Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DC9CDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 08:22:16 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6565.1782375729443356191
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 01:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=DqDVkbxp;
 spf=pass (domain: cherry.de, ip: 40.107.162.18, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmE+JXnRmL1LA7E+xRGP2O7G6BGoAUXYKGEKA8TIKFssZEgnWgCFZNm4OOa5nuNk6J8fYImtidyn8SKPzAmF2lnPd7J0XKTejgT8TyzSQCG5/iRJ9WAIatUHcPUbA0ZAw7muMMi9sWCwsSV7p09AwB0PlZfM9bZxcf5efsdwrcml5n3o+OI9MIq+yh0iOIr1h62VZKRf+T54k2pr9C2GYbo7C+wh6bXPeW4OfMgIqZOu2JHm6+X3sEKGhwkjOd7qvrO/k9G+KlUPhrMYYI0mE4UJLgHEB+Ge4AACxVbSgHEaaWZ3OJjNAKmOmpAQfxcjIekMANpr9sQ2nvZriKMqnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acl5rLXhaFqRhRIyC3uQI8gIrnr7CzHQqofU4nkVez0=;
 b=toQyuCdrrOa3O81i/MXxrbwtb4lRizEaiEyo5RNg88It3TV6s6MQj/Ty387oI5hnDdYrTiwTtmAZgOII2Cw153XLHgfF5GEPfdGdaAtkJAepRW6Svs5/7nh4iXJyA0RwFCc1XJsS4NH8u2P7l/CRKAYpkxg+HwhSOzG4tIl0XEhx0+FoD5XMH3uY5C/K/ogPYOIpRLqlLavsQS0QBQSrmEaOzWZ7nw/7zQD1sMRuE4m3+Y8EZfoDGxlinmd1RWf7YXzB5Xbw8GGG98AIiSlNh/I2cspSlN0EgyKiiz+cExKZGxHdFH4LwBmi33ORBJufo3GQHQdZOi5XJTJu+kaNyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acl5rLXhaFqRhRIyC3uQI8gIrnr7CzHQqofU4nkVez0=;
 b=DqDVkbxpHRLsNFjBvo5c1rzez0qi0zqZrG0pAnflTIl973YnK8liEB0BP4ZhwGQOtI8WydA5+wPZeEQMysl2VM6iu9o/TqkRK7FWjAlJ+T5jSrMT1zmsr/uoRS9yj6whb1lFygWN0iLAsIilfNWWDZx8pa8iN64k95fFVwCUQvo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM8PR04MB7266.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 25 Jun
 2026 08:22:05 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 08:22:04 +0000
Message-ID: <7f6e68e7-f145-42d3-800a-2c5d8b3df5a5@cherry.de>
Date: Thu, 25 Jun 2026 10:22:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] migration-guide: 5.1: Remove duplicated typo
To: Antonin Godard <antonin.godard@bootlin.com>, jaekyu.lee@lge.com,
 docs@lists.yoctoproject.org
References: <20260624094747.3447103-1-jaekyu.lee@lge.com>
 <d2292a79-16a9-4786-9b69-30d7d320de50@cherry.de>
 <DJHZ8NO9H30L.21LIRZ1HGY82W@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DJHZ8NO9H30L.21LIRZ1HGY82W@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::9) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM8PR04MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: 0131f6f9-cb27-46db-af33-08ded292d6ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	/BeK+0Xs1Q2+ZJWI1+lv17svULrGPTeEWtV/GPi3osXSscD0C9cGd7MNL/yciX0lTIicb1uGagDfblvxDaTy+r65YogwbzOMx4Oq7BE8B8OnHuKNYhuRxdfQKjHi2QcpxJLdncIMP3QvVGGVrnPY9/um31rJcbM+LPzzbUl9Q3zCAkkzxEYbTbI/fK1XuEUap+OX0XzYLqIs+MQFJxWtxowYCeGp6IqxfnKPCA8mRokHw8GPYXluBXHqDvOe8xa0SOj+RAIpQUEMV29JC341STlnjU8rgnHoszz3+0g3yAKI8haq1y0vnAyQ2msUXLhCVNcgXlxa4UQi0PKMY5xpS5RsKWEdLTkBK9Dmx2rh9I9spg7JVOU6LooEUof30ha6lz6da8Y7guzbhJUyqgY1PfIwoqfb9xT/4Ng+j2XjIlIffy8NC+vtKSjKyLCjA1f9+fo7xaANADXJoMnvexFdndus4eDrXs3zNKxSPLD+hqKuw8wIjKsjS5oOOCGwjedeYS3t4JaJAK600ONjWl9M5MutNSqnqBbSngisUKPMI+Z6wrdSFQlvmxiyCvNGWU76o4X5XCAUURj4ZInT53vg/COGxHg4mC/zZOImAphZedSEruysqT+6jzX20UmRc7w3SDKNiHNi6pqsB7bwVpw7iMELP7mB5WO5G9u3+0n+8+Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OGduaTRqelJhcE8rWHQ3VTZ4YmhiODF0UTdFVDV4ejRLK3ZUM1EzSFZlZlhY?=
 =?utf-8?B?N2lrREhmektUWUZvR3FmeExvcjA4dCs1RkdQNm91ZnVGVWFPWHhEK1hseE5h?=
 =?utf-8?B?akI5R1k3Nld3YkZxc1h5dGJWQjNJdDVJM2JWSWxNMEhscFozNXhKVTJFek1L?=
 =?utf-8?B?QndoT3kyLzIycDd4aURHTW15QVc0QlFMZlFpTWFyZzFJZURoc29NWXFJb1Ru?=
 =?utf-8?B?NGhHQmh2MkRQYWl2bzI5YjhUT2s1MEQ2YmxZdjRwNTQzOVViMmJxd0JNOTBr?=
 =?utf-8?B?OGFybEw5NHF0L1JmaEVKMWNqenIra05hSHlub05Zek9yRTBaVzdPeTI2NE4w?=
 =?utf-8?B?MnhIZGU5U2UxYkRObUlLTmcwdHp5VXZhNkxoZnZSODBlQkM5SUg1SWVSeUJj?=
 =?utf-8?B?eFQvZjZKQWIxbE14ZlBMYnBtVWdzaEZKWHMyUXhvNnpCd1FKS1huWkwvaGE3?=
 =?utf-8?B?TkExcUQzeDljY003NEZVYmQ2cnA4RDhLRnJOSFJvWlJ1ZEhPdTlpeWZYeWhu?=
 =?utf-8?B?aXp2WUtyMHhCdkJwZGtscmNoNUdJNnRxL2wzL0N0UktxS21yZ3gwYnNTQS9Z?=
 =?utf-8?B?NmVvREJQUUk4LzJlMGE1UmN6eTJxL3BpZFZHOUdYdmNnQXhLcUJoUi9uYmcy?=
 =?utf-8?B?aXVFQkNHZi9DekI5bUJzVlhtTE1abmQyaThNNVhWNjZMbVNBZy91b0VVaWhI?=
 =?utf-8?B?Z2M1WUlKOW5kbjE5SENNSnVOTnBxSTNNQ3dLNitxWWlSUXdXUlhKZXhnWmJ6?=
 =?utf-8?B?MzhBZVg5TFB0dko4cGZCekowSVMwQVliOUJtVzN6UFZ6Nmk0OTdGOEJNWmRx?=
 =?utf-8?B?alJiZkNrYjdlZXp4RjFWS0lvU3VuVldzUFQ2Nnh0OFZrbkRHT2dyNVBHVVRC?=
 =?utf-8?B?OFB5T1Z3SXNDM0MzSEVKSVVqdGRtWkdWZXVlVXF4cm5NZTJ6TFNBWml6OWdB?=
 =?utf-8?B?S0JoS1FORW1JZFdrSmhFMXk1aXhxNS9HeHZuMjFVOVoyL0NIZURna2k4M0ph?=
 =?utf-8?B?akZ0QVhBTGwzNGREeVllZDI1S21RV0pVeWVmczlCc1pQTTAvTzJNVTVvaXph?=
 =?utf-8?B?djJ1WFBQNndQVnVkNTExdzRhd0ErR0JoM01iM1FxeG4vTWxjOEpTQ21WTytO?=
 =?utf-8?B?eEJUK3JoVjRZYnBSNFlzK1dJVnJnaE5wU2w3Y25WYmZLQWkrb1N5d2pVdFhU?=
 =?utf-8?B?VTRDdkNwRU1NQzBDSGJjakhQWUZERGNiMXNPaTM5TkpHbUttbFlkRldIK21S?=
 =?utf-8?B?ZldUUnlDQ2wvMTNOcjgrakxhWUo5ZlJxVkg3N2ZIcCtkbWVTQW9hdkdVdEZu?=
 =?utf-8?B?Nmtzc0tZSWliV2V0SndDb1FHeGN0VUl6bVZDWWZJTHdWdVdPb2VKTjlreXhj?=
 =?utf-8?B?LzJBempIT0JXajhBbVlnRjQ4dVB3MXoxM2Q0NXZaNkFUVmMycGFjVkV3cGZy?=
 =?utf-8?B?b0tMRXIrcTAzbkdsdytDdEZVNHlsOTYyemJXRTFFQU54cnhUUUJBaVZWb3ZQ?=
 =?utf-8?B?eEZQR0VvSzBzVm05d1lkTUsrVTQ2bDVsNkU4anFYdWxvTUd6b1J4S1ZKbEgy?=
 =?utf-8?B?NlVWdzdpVi9tTGtBN24yYmZXNXFJRno2K01YdzZzOU02MUJ5V0JSbEt4cWVK?=
 =?utf-8?B?UlJtZUhORjVBSXdXaHdqZ2cwbnBPb21EdEE0UTlEcjhpM1E3eDdFazJmM3hW?=
 =?utf-8?B?YkIzQWFnVU0rTHdsVmxna0poejdwam1HdFNpT1M2SlByVVFOMFdWWmp5TmpU?=
 =?utf-8?B?dVlsT3dXM1IzOFNPcXYzQnhOdE1NaFJuYjh6dHg1QXlmeHVBNWxVMzFZVG9o?=
 =?utf-8?B?YXoyL3ZveHZYaWkyQnFZVE55YTgxemRmSjRXc3dIeU9sYnhoMG1vYkUyZTVy?=
 =?utf-8?B?c2tidUtvUmRrdUJjd2VYVjU2MDVyWW1Id2VqcFFmNzZSejA1dS9CSElFS2Uz?=
 =?utf-8?B?dCtuZEhoWThpSGZUVUJqR1h6SVAvZEZlVkJvMkhDckhWVy9SUXVQcW9GY1Fo?=
 =?utf-8?B?azlObmxSQVJudTYzQU1abTBFbmlXN2psSElYcWROd2tPRytERFpwR3hVVUpR?=
 =?utf-8?B?dWZIZDh1WUl4SU1qRW1XNjhBblJOaFVPVmg4aXJ3cFBYa0NjUXVyMVJIUmpE?=
 =?utf-8?B?bXQzOVB0djM4a0UzZmxVSE9KUFp1cTljd2hINXl4U3dnd25DUTBPMDFrc2xs?=
 =?utf-8?B?cXNBbE8vVGxFMEtEdktsaDkzWjlYNW9ERkdwZ2hIMm9OemV2QkMwTkJNUnlK?=
 =?utf-8?B?R0JGQmJVOU9RN05KeWJlbjVFZ2hxMWl1UHl5alBSOE9TLzdaTFhoa3pyQW55?=
 =?utf-8?B?OUZqSmJmUVlFK2hJYnhCQi95MkMvV1A1TENqYmFGUTRGNzI2Uk5SUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0131f6f9-cb27-46db-af33-08ded292d6ef
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 08:22:04.8670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojcrGG8GRI0F3rAK0eo28Zdefk5KOlebHp4LJdqoosol/XX2dc4M1MD/++XfxMTeFsoZ9I6uMiVJ/yh6+iDB3VdSJCQpyzvuIl7cvsM2+G4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7266
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 08:22:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9876

On 6/25/26 10:11 AM, Antonin Godard wrote:
> Hi,
> 
> On Wed Jun 24, 2026 at 11:50 AM CEST, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi jaekyu.lee, Antonin,
>>
>> On 6/24/26 11:47 AM, Jaekyu Lee via lists.yoctoproject.org wrote:
>>> [You don't often get email from jaekyu.lee=lge.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> From: "jaekyu.lee" <jaekyu.lee@lge.com>
>>>
>>> - Remove duplicated typo, do_compile
>>>
>>> Signed-off-by: jaekyu.lee <jaekyu.lee@lge.com>
>>> ---
>>>    documentation/migration-guides/migration-5.1.rst | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
>>> index 94b527bdc..f1c953c7e 100644
>>> --- a/documentation/migration-guides/migration-5.1.rst
>>> +++ b/documentation/migration-guides/migration-5.1.rst
>>> @@ -23,8 +23,8 @@ supported, and an error will be issued. The recipe should be changed to::
>>>        S = "${UNPACKDIR}"
>>>
>>>    Any :term:`WORKDIR` references where files from :term:`SRC_URI` are referenced
>>> -should be changed to :term:`S`. These are commonly in :ref:`ref-tasks-compile`,
>>> -:ref:`ref-tasks-compile`, :ref:`ref-tasks-install` and :term:`LIC_FILES_CHKSUM`.
>>> +should be changed to :term:`S`. These are commonly in :ref:`ref-tasks-compile`,
>>> +:ref:`ref-tasks-install` and :term:`LIC_FILES_CHKSUM`.
>>>
>>
>> Asking the same question since it was ignored on v1 such that Antonin is
>> aware of it. I am wondering whether we didn't rather mean configure,
>> compile and install tasks instead of the compile task being duplicated.
> 
> You're right, can you or jaekyu send a patch to fix this?
> 

Since they have sent the patch, I'll let Jaekyu take care of this.

Cheers,
Quentin

