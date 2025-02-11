Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B262C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 13:57:30 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.23])
 by mx.groups.io with SMTP id smtpd.web11.12994.1739282245117073744
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 05:57:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=UqG1hAhn;
 spf=pass (domain: cherry.de, ip: 52.101.65.23, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3zIYZdLuHVFs67RXsD7fWEEcbpOwXjo33hmkQd+QNkHeEJ6fFe1nlKG6nDgfRnr45dLHoOZ2AVxaFayCnd4ByTFZS/3vlva9XYr6zjjnCp/BuHTN6WF3piFIqZHqUWZRy1bGiW9+TwRSEFtaztZM1EZILlOpUjY7KSogYPRY2Tu0f6ELxXOtqX1rWowRNWRR4Vi/wjFeeC+z0VcIvXR/+OH6V1SIOrXEtuTyriEZd0R0TWENS/5JYje0YdmmJcQyMaPt0L/WU/AncvLj1Nr5YwmAAfK0F0YCVQKHTg6LX+rqWaEXWMw5lUdGz5bvFTL8psGPwnwE9+ZOeveU9yJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3I9qQrPihnqmpAY9rNM5XbtlJqQQHLm3Gros7IIkipY=;
 b=ksSjFE5egMUSndw4OvimXzhfVmZM18p81B42X25njRJ5HpCckFQ47Rs9RQfK66LYGyPbeJx0oacY0RwGZVtaKQYjQn+QQqyajPdnsCuzYMr0L7Lq6Kh6SgSQ75/BG2a1i77EpRamtgNEeiVX0Sh/yV/C1IZLxA7ycSpD5atG89MNCOYjMkKSl2CfX1gtQJIhW66ymvsD+1lr1c3p4ON8VvHCd/w4OxJjRnUbuCp6b/dFZ3NeBBMrAbfZOgYKsoS19v9/OM44NOI6H572ej2bGvQUM/56UK1xEWqAUIi+MKbi6ifKu/5H/A4Yp/wY3JYK6Nfm61KOeYWb9dQDnBDdiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3I9qQrPihnqmpAY9rNM5XbtlJqQQHLm3Gros7IIkipY=;
 b=UqG1hAhnmY6J7kdZtBAEUsSXjXY6OPWTlNpXM3cKdaFla2poouqcL8K35IAjts7rOkny7uSr9QV49AqiqZ9gB6OKN6xcOdUsW8pqvZBCa72tQcs+WpiaGrjGBJ5irdPnUcvhzllEeNpWoBj7L7J+KmUsXoGz0PUYOi0VnP42dik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB8138.eurprd04.prod.outlook.com (2603:10a6:10:25c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Tue, 11 Feb
 2025 13:57:21 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8422.012; Tue, 11 Feb 2025
 13:57:21 +0000
Message-ID: <56bf748d-4f6d-4b94-80e3-5625a9948e41@cherry.de>
Date: Tue, 11 Feb 2025 14:57:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 1/4] ref-manual/variables: document
 OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
To: Yoann Congal <yoann.congal@smile.fr>
CC: docs@lists.yoctoproject.org
References: <20250209233245.1397155-1-yoann.congal@smile.fr>
 <8b15c9fd-f33e-4b58-b306-e66822093887@cherry.de>
 <CAMSfU+6LtcGJGaEqPvHRk6Wo754=sO-P+qnvXE3FzpXuKRi4dw@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAMSfU+6LtcGJGaEqPvHRk6Wo754=sO-P+qnvXE3FzpXuKRi4dw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1P189CA0015.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::28) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: 0db4d002-dda6-4c15-7f9b-08dd4aa4016f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?u7HjcY17FBV6nwF4MHEru5bPneZITghYhuvipSQhWG9V99IiR7zVJ5nJTBbh?=
 =?us-ascii?Q?FLqFwSwmBhXFZIVDjppGx2+fSmG3BDRsUVNbFQ4YRx7ChypWmtZ4koJYiSCK?=
 =?us-ascii?Q?vVBPdQ32+OhpaW3KDTFETGakUrSfRo8jNGPOd2lA52JippmBB5o8uziZoVEN?=
 =?us-ascii?Q?kgFEmee+1nJe3ejClQzztXyYiaTuUsMRr/aJzAHtd3QrfLX2vNRQpQMl2Eec?=
 =?us-ascii?Q?qxStlRq82nwJrCxTXCH/GGwm1GpYIfXF6bu+kRelL8Exo/xH3hdCsgk9NPa9?=
 =?us-ascii?Q?BBiz3BctY0DtYTFw4E33W93CSI+urRAS1a4Rk5TWZPjf+GvdPKhQsklXrw4j?=
 =?us-ascii?Q?7+OKJAXJXKqDQb+3/zcr3JL8yYJ2iKrmKx9awzuE7pdpvbO4+vYn2sad2yDw?=
 =?us-ascii?Q?e5TXfBc6h3NUSj2dtEOlQTgLIZdLFgq8d/GiQAAdnoyskxc39Lr0g3PQCS73?=
 =?us-ascii?Q?n7PNNbbj6YPoIkTR0y5Zv3ezG8vXY5xDt6gU5MoT39a67Xy9eRDDmskk9kx/?=
 =?us-ascii?Q?XCxHXYyCYbfRzFihZnZ3o19qGhdsdJ3LzNR/COSAahMDmXH/5p+P4NsGz7Le?=
 =?us-ascii?Q?ntcYXmG20j7loTmnpRE1CWIo2TXDI2NpuqLmfuSwRfk9Ig+Uy4pBtEcQavgL?=
 =?us-ascii?Q?IFQF0yzPDqU3hSl6JYuL9BYlFFLratI7vrOnk3igYhGHiRIdXnD8SYXcvAul?=
 =?us-ascii?Q?w0unshUcdob54MEGlMBWqcYHMD8jpReXrhqRj7dJfB2WOlMLrUDiG7GKbFHH?=
 =?us-ascii?Q?yT+UqrAQZNwtKWxzx16rWjkyWiNk3wR+inFT6gk+GCL+n5+Yzh/U8L5SePul?=
 =?us-ascii?Q?ht910aMSMDE/JxNuTer/pbpzklqJw9WT5iWOJfaMwdcvAnTeLEXwz47+YfDf?=
 =?us-ascii?Q?1UTg8V+FjScHSL2pzStM6kgOzCZKN4FY9bTe96wlhOPRbhuRPZ9zf0xeMQyJ?=
 =?us-ascii?Q?vI126qkxBXjLqIJDq3G5J+fH33co6Sz6vJAwNTIzz0AKUNQ8OnB/Ayy//LcT?=
 =?us-ascii?Q?AQF7DsvnIasM7LWOhx62xG82c1/gq2k3jNvN/OxIT2oWQ39rYn5TI/JfSFBg?=
 =?us-ascii?Q?pwIt9KNfK/nFJkJRmgxIYp0UucgaxWFmBdzbySZP0IVfo3xFalVls7BtL38I?=
 =?us-ascii?Q?ZwHtU2QM0pIy8j+wcHD4IfEk5l+CgKfDzedegpQNQGcRDNHp1F50qguH/p+x?=
 =?us-ascii?Q?N4xyqMVr/N3rkoztrGaWNecFZ+D0/2HUrmn5cbdQoSr29EvNd13veR/L6gCL?=
 =?us-ascii?Q?zCDpqZdpgftMsGJCSkdllkTC9C8FcXG3PWB8tw0gvWYqncw6mfPTaMxcHZ3P?=
 =?us-ascii?Q?S4zKaUOVo64cD1uDi3umybzVUPJ56GkVtY3eEFBrvMcHJA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EcC3PrHBDMUBBW9Ies9ekzns3/Qtrkz2yK2SITCzpbs9LTdqhupl6/iMiIpV?=
 =?us-ascii?Q?uklb0CUYAmNXRPHh8hugGWKv58/QP+R9btiUpx2UBnZYSPm5oIsvjtTD5IRd?=
 =?us-ascii?Q?85m6GljefubwkzbF9UB0N4ozb/0bsPYH1LOeqKhkwEAMGVlUqBQ7pp5EfkvA?=
 =?us-ascii?Q?wQeuWritX+0x3kjiGb5Sj8O9oFYDVBKNrzw8lZPIibwQNUvzJQJzYwTi/+Mo?=
 =?us-ascii?Q?L3gseWFeTPYc2581ZD711Iz+BSlEkJd5Szu0HyW+lvZe8iOUn52cxB7asYGc?=
 =?us-ascii?Q?WL+4UThmhEO3B7405lyjCHQbGouMzoDfsN30CVng1MqEpBPnYnmHFiO6mns7?=
 =?us-ascii?Q?fbgUKanNj2kiz9BnYQikyOKUnqadJRH7JGb4t5BFVjvhi1GRhVKkF8E0vizc?=
 =?us-ascii?Q?GkxWdd+e1jEFnwSeOcfI8eBxiARYzl4iNA9K1TaaDbldyHRfk2Ei2T5Rl7W6?=
 =?us-ascii?Q?DM8lKmuVzGypC/ujijZumW9DfsOpSI2ioGH1tzj4LeHCnd2MWd30wa9+68uH?=
 =?us-ascii?Q?HjWE+srB4sJuuOiG4wixkLQOYCMaYU4Kzwc2qpoWDTO941w9kfkUYDiKqayo?=
 =?us-ascii?Q?tpuAWQvJkZu3pVrD0qLJ1r1TbuelQhcfw0aknyjDwOTd7vQB/l+DZ8klnXta?=
 =?us-ascii?Q?3uR5wAbxpnka7aON46byVHEoSsik4oYVuaWDt7sxRQZ4TXI0yFGmX17lrH4O?=
 =?us-ascii?Q?6XpNRYLxNagGOgK9/Fu1fx6mmJkbG1PhBz/YJS3FmfwLdv4vObQRQX2VYp1M?=
 =?us-ascii?Q?dRMlTCr43K4HoQZCSARn5wnzUkxXcYnWlv3+iQiWw7w0+CYjBM4P1fWBycZD?=
 =?us-ascii?Q?Zrp8XrIJXC+p2g5LjSdGmonimp0EaHuxtlKTAmOZ2sxF4Z5eqWOjVCNNIzOu?=
 =?us-ascii?Q?Ec5SkfnpAW3ENzFmknDssgv0M0vRDB85Ok2HmFvMzCFvHzDGoqNsoGle5hj3?=
 =?us-ascii?Q?hTbanykiVVW2Vgzfmh9sYHUTaCWvxi40VG1ZZQ2ed8JOfn9MFsmMwtCYgI/e?=
 =?us-ascii?Q?rJ+5pNSOnKpDjm9lahg0FNOiZgv1wfZur7bWNQFZVNBj7cP0JYh3UP+EV2/1?=
 =?us-ascii?Q?OsUATpsGtH977p87GG4aZwlS9/Z7FxlkCmFowb4KFT2nUccv2WcCvZndINZv?=
 =?us-ascii?Q?el5DMBCQ3O/dHPxSL3SnpKBepUxOgQq65hBJyiuJF63vhvtGoZFkuZg+XKpC?=
 =?us-ascii?Q?9K42MZ0P1yvjQvyJPMAsAHeW005K6kcRdt6Uaug+32j29idFN3RysP7fRR2G?=
 =?us-ascii?Q?liZ737FeWztAGZ6xeV5D8wgtXuSrRuiArKNrtDIh4r9nOND+hscVME8+jWoa?=
 =?us-ascii?Q?zjYsSTF3OF/q5Uk/S2WyueZ5DgfZROxMUTbIjuzu1KDawQ0ukuhZAHBAbn5f?=
 =?us-ascii?Q?QLCESMJ/seJeOfqN0DreDBEZEC7oTqZj0xZCqtzTOKLw4JLRDVgaEprJ7V1P?=
 =?us-ascii?Q?yiDc4P9n1kKwcGJAVv6i7CjA2tvMXKyr3cC/T15LwWahsLPRnDaDV5pkbwDf?=
 =?us-ascii?Q?N8fJxnHklm29lI5wn3hS/9eqLahM/v1fPeiyeggPxdULvHKv6wLWfrKfTRPw?=
 =?us-ascii?Q?pXjeFC9DmhHxxAHruE1rEQScpAVRgtl0xbRdmS2QnXpeRQ8ZhMD6dkqWCLyH?=
 =?us-ascii?Q?E1nzwqJIH4AIm8H3khwBopA=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db4d002-dda6-4c15-7f9b-08dd4aa4016f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 13:57:21.7281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YVwhpqdNIRobxd1DORjn1iOICoXcbUXXx6Nt23t+XRHSXHb59jNaugIC4+hktCrlBuSzgEgs/139wUwu8qXYpVNoJjVI3V1viHxnH8HKE4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8138
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 13:57:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6334

Hi Yoann,

On 2/11/25 11:35 AM, Yoann Congal wrote:
> Le lun. 10 f=C3=A9vr. 2025 =C3=A0 18:37, Quentin Schulz <quentin.schulz@c=
herry.de> a
> =C3=A9crit :
>=20
>> Hi Yoann,
>>
>> On 2/10/25 12:32 AM, Yoann Congal via lists.yoctoproject.org wrote:
>>> From: Yoann Congal <yoann.congal@smile.fr>
>>>
>>> This documents the variable used in the "automate testing a single
>>> recipe's reproducibility" feature [YOCTO #15701]
>>>
>>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>>> ---
>>> v2->v3: Quentin's review:
>>> * s/target/target(s)/
>>> * Removed Guillaume Reviewed-by (given privately)
>>> ---
>>>    documentation/ref-manual/variables.rst | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/documentation/ref-manual/variables.rst
>> b/documentation/ref-manual/variables.rst
>>> index adbef69d8..2f1937632 100644
>>> --- a/documentation/ref-manual/variables.rst
>>> +++ b/documentation/ref-manual/variables.rst
>>> @@ -5807,6 +5807,11 @@ system and gives an overview of their function
>> and contents.
>>>          For additional information on how this variable is used, see t=
he
>>>          initialization script.
>>>
>>> +   :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
>>> +      Set build target(s) for build reproducibility testing but activa=
te
>>> +      :ref:`shared state <overview-manual/concepts:shared state cache>=
`
>> build
>>> +      for most dependencies. See
>> :doc:`/test-manual/reproducible-builds`.
>>> +
>>
>> What do you mean by "most dependencies"?
>>
>> The code I glanced at in OE-Core seems to indicate it adds all DEPENDS
>> from each leaf recipe to the list of targets to build with sstate-cache
>> (the same way it's done for OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS).
>>
>=20
> Sadly, DEPENDS is not all the dependencies of a recipe. Some dependencies
> are added via
> do_task[depends] =3D "recipe:do_task2"
> Those don't appear in DEPENDS but are built anyway.
>=20
> Look at PACKAGE_DEPENDS for example:
> https://git.yoctoproject.org/poky/tree/meta/classes-global/package.bbclas=
s#n232
> There are other instances.
>=20
> I plan to improve the reproducibility test to include all of those with a
> suggestion from Richard, and then, going back to the doc and removing thi=
s
> "most" among other changes...
>=20

I can't believe how much I'm learning from reviewing patches for the=20
docs. I hope people understand that and we get more people reviewing and=20
sending patches to the ML :)

I missed the [depends] thingy and was totally unaware of the other ones.=20
Can you then make it explicit which dependencies we're talking about?=20
i.e. the ones explicitly listed in DEPENDS (which may not be all=20
dependencies, c.f. [depends] varflags, PACKAGE_DEPENDS and other=20
implementations).

Thanks for the explanation and pointer, much appreciated!

Cheers,
Quentin

