Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B168C433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 07:49:17 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.88])
 by mx.groups.io with SMTP id smtpd.web08.3128.1665042554138053677
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Oct 2022 00:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@theobroma-systems.com
 header.s=selector1 header.b=E1P0Ruq3;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.88,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/DgeURu7ZoVakxACmkWifCxn7N4hLR/epNMVHRC/CELiNo7gX/4xPumXvSQbkCoCBdL8DmOdFTKfk5idb+/GcELjrIOKzPX72D/A4d1mjWMwAc+rmDR6IgeBGHCbyryfMLlWlfd0oFCtn6T+wPr74wTReEUIRtew7uV/eAh4XzNknwhlcF9RgkfHBM2j8hC4QKh4FO4OSDKG4Ac4Tr3qBE2H0MPkNcY7t99v2AvLnBSXuhBIX/yNoHxiDYM02wjgJGWunEbXaNoveimvmajT2JyeAwk60zVHChTRHtiHp0XgK3U+NfdTPUynSG+mE9IzOGY5uDYxCbb5RXn3Tu44w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQnIIgv6DaKF7RKtfyVD4UUanR0UIfKJ1mk8hZYV0H8=;
 b=ON8YipTCT/AD3aXC6bEEdbS0Ncu6mdQiZ6uxm+8L0eVLtQtLE321m0VmQfDI6tl3c1x13Bmi66nH+Q6UjsCZK2Rc8OPpeX1dZpR1JIQ0zJrkNsRRVmSN8HDoAXv4HO2RnqWRoBVA43N+/lqbWB8PFjAnYIymrxH49WWn5tJvlK+I1RTJq/oPS4uI6PqUXtl807PWPyhrD83UHVsN3hGmwhYnQ6LvGX1n57uwqRb5mr6rEcXpKPmRpTnJlXW01D2VojCiU7WyVQKTqGgd//4vwPSXVCwtsab5DZcU2T3jRbY8WdqpcLanmn3ozrDaN6az39uJCh0GWM/tVMs1ah3yew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQnIIgv6DaKF7RKtfyVD4UUanR0UIfKJ1mk8hZYV0H8=;
 b=E1P0Ruq3rpwcrbUjwdFjvJBq/9RpKKqlyC0hv69w94btSjMCSkExqgtfH6dXBFAf/i7Uy5yysDXIolcBQ8djqGGqZmJIE1rzZrn+LsT/QCjq+IMmKQsUX5y0WLpSgXR3d6zWm749VKR/YdwBaUkx3DYAovEBFQz29ojP2ZVkwgD3rX8Nz3I+D7cGUU0CEwI+MTAhUC54xa4qcKiUzvrv/SxeMsneNKMmbE0HJVdbFaCGlPeo/RbRM7M6YZXrrn8+WhnU7Eq7rlU4qWUh89GUk4qpkhmZJnl0G7mjUS8ImBiGF3nD6UBAUakheBfXK8FbdOCQ/jIJ6rsaecKAwbX4DQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PAXPR04MB8406.eurprd04.prod.outlook.com (2603:10a6:102:1c4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Thu, 6 Oct
 2022 07:49:10 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 07:49:10 +0000
Message-ID: <16c3bbdf-16df-7e02-c0c4-86af806ddc45@theobroma-systems.com>
Date: Thu, 6 Oct 2022 09:49:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [docs] [PATCH 06/30] manuals: add references to the "do_deploy"
 task
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: docs@lists.yoctoproject.org
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
 <20220923175219.6652-7-michael.opdenacker@bootlin.com>
 <1b02c2c8-9d83-fc71-2ed6-d099de28884b@theobroma-systems.com>
 <06a1c1e5-0a0c-5c0f-d05e-6e51967be786@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <06a1c1e5-0a0c-5c0f-d05e-6e51967be786@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR0701CA0025.eurprd07.prod.outlook.com
 (2603:10a6:800:90::11) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PAXPR04MB8406:EE_
X-MS-Office365-Filtering-Correlation-Id: 34183ffd-8ffc-441e-1c77-08daa76f4166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nVUnbTdi41Pp3c8Zv6MYyN8lalQu5c4Z3E35FotcCm75sXHL68aeLSD1Lbgan/UezChguhFm18sm0fuzpN8QJMztlI7dBY/QpWkTl500ZKI4zC7x1aAOc59sFB5uUg+uxfOdhxycXO2rFbvQ1yooiwtL+pXL+sEp8E0GwYxZzY3Q4eyyNLyuXP9WZslNZdMA3bul4MrxqGTpHg8xqM81O28MeBcCTmX6Bwv3lKk/THVjnAazXs0yyqSpRBvMyvMYT5jH924l3qNKw12fgUEohMRlLEayKwUuQSEVF1hUrOUGcqmFQJaGhiQeGrATPGIqreefMI4koYu1vnGN6OCsggNVb2f72v6GW1e1Q63pjRJ1QuYu2ncDY18jx/HU8n1aRCCU+L2PoGQzhFzb4tSkUd+L/q0EPF/GFpF8T9L66BtombMc1FNNRVtD5CCHuDQTgCOcBBZ89Mnu/+36cvQKcXCALtpBvTSzOJ9kSgBTx9mQbYEoVN1pY5S2ccJxvPWZYAHetFIufUqLg3I4nFX/z6YhOH4mh9BUGCtyjsBT7uiV9O4Mv53WxlimNa5xSAlsi0kkwX554HGts6dikFnYmrOwFhjOIsr+HHCMBJpzUCuWbgRyhRZOwiu/yRABRgiCNFx67Pabuzqlaq/hjcP0Oiue2ngLmado0XO7h2n8sc6Z+1FzrGqt+qdrXTeBoYfUbFh58oat8ibgmzdA5Y5go4jrvCNBbAI9UPwRV3XX3ChOxu9A9iy38bIcWVxy08W6TxsKHmRa5rM8MUk/ZwdO8LTyCnwJ1/TDjL6GZrTm8sU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(346002)(366004)(376002)(136003)(396003)(451199015)(66556008)(31686004)(316002)(4326008)(8676002)(6916009)(66476007)(66946007)(6486002)(478600001)(36756003)(38100700002)(31696002)(53546011)(2906002)(6512007)(41300700001)(6506007)(83380400001)(8936002)(5660300002)(86362001)(44832011)(186003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c3JHEhYpXFUIVOvngqD5V+64KvKiGOXhengn9M0G8jMHXiC+v/VoKgo6gWDe?=
 =?us-ascii?Q?uO6FFX/wW+phGSqYLO2PXVkwjbE+J+lPwyhfz9p8Ahq6cdqIMbvpYMhHVYWx?=
 =?us-ascii?Q?g4XIgYUtODxTCthRCQJ0vn/m6NQLrm3JgBitGeZO9733zxHhf7AA9E+u7jKJ?=
 =?us-ascii?Q?rkdkuMXellMh7xF4cyRxxavrYMwG8x5/zmiMEs8lHg7Mifo6NWY5Axmnr+xA?=
 =?us-ascii?Q?fL22pIZUygohbruNrcRtjJnhdhmpQZnMd5BLVQ13hETP71EpIecHAUdN7ePc?=
 =?us-ascii?Q?QmMos1cT6sL51vglxldHK/juCCJsMWJOZeSxXkfEiEKB5DyHCk13VHUMeBqA?=
 =?us-ascii?Q?1toyDCVorqijKKP9bn3vZIZyeNXzPYJsMMQaw0538M3Jw+Fbb8oSLHHQXXfA?=
 =?us-ascii?Q?AdZ3PTBqcJRPzUkIRCzRsHTZeWl70Hi/Bk264Ts/P4m7SmLqC0YNgDph23nw?=
 =?us-ascii?Q?GsltljWedROt8d4VSl99jrtta0nphusTDslc7h0+/fcbAydt2zNu4ZcOSt9p?=
 =?us-ascii?Q?et1wmchOr/RWUOnKyTJt+REuRM5KoOyU62rEatAxnWpM3zjlSDNu9Jfh6i/d?=
 =?us-ascii?Q?g9+uFGXv/8fkacD8MIeWgZS6BwVTNb5R32krUDXeHs8qBOml0kiOkaKtf3kJ?=
 =?us-ascii?Q?oRcpjea5tN3+owcyqMd+39hV2fTYy0pKjzHRLvpkch5MP7fTfhiusHy689+K?=
 =?us-ascii?Q?l5avlB4nB5GAix1vW2zrdVX5IZ/716slyEdMHW9yCmxNKTIHFLDbqQGrZ061?=
 =?us-ascii?Q?Wlpt2Nd4t52Kt+17VDKVN+rAMptJdqJSa3V4h0iSbXPBqQdTRVeCDWI6CGGa?=
 =?us-ascii?Q?WR9U0Kk/8cM1lvYrp7WrmB7mjMLXoqLKs+HqdvZSf08IyrlIMD6VznsksKKi?=
 =?us-ascii?Q?QB/Y1Lts97Fbhk26S+2a4k/M+0/g55Wts8Dt4kZbb2OgSaplWApP0AxHjUcL?=
 =?us-ascii?Q?wHdjOeKABexwuAK1VI5/cpXUrTL4rMZ8RjQqGu3Xpm/yJyN8z17i80PAF8Il?=
 =?us-ascii?Q?HvJeXU6CoLKE0WIqeBcewwf14QsZIuhvtzCnZp2Cv3S44bl0UnHwwhQyK1qX?=
 =?us-ascii?Q?cKHX2NAkXx3BAn/6huEAt97gOrfxmwjt19mzMapH93AkNKusM5/HuiiXLRBG?=
 =?us-ascii?Q?+KKQmzuW7XRZyq/k3JmclWmSTqyuUalzeFNwOvQyfoMzUlPabRnUPwywuBpY?=
 =?us-ascii?Q?bm0bwnhsjcX3rT/I+lTF8Qa2oiBUu44s/uImAVZ9g5bi/e8mXpL5GAVDtp2B?=
 =?us-ascii?Q?iZwUqOPIfOanX01fbrXDQudV4T+u3NweMAGnjefgokXXX5EG0lWsZPvsLaM6?=
 =?us-ascii?Q?m6o6Owaqc8UGlqRA0dHi+C9ikLlDBjuxwiEA3lJWpeJXEZx4sL7gsJTY+P+X?=
 =?us-ascii?Q?qdWxBJGwNThDwGD67JOgJyX1X5HF2KWMIGuZavPkmypxvQtpWrMZx3Eenjt+?=
 =?us-ascii?Q?/gVO3pGHXT/TkGAkm9OZDLKGWlYE4CMk0y8aBY//o6pSy56mXx9m1M21tSqE?=
 =?us-ascii?Q?/HrqDvJo4Of1qB9nOtzDPd7US269AoqHxk9GbUob3GENFkYlq2Mhz8t+cyBf?=
 =?us-ascii?Q?3tiAXLGkY1vS67uRGySc6DElGn8MRQGAJGlNohl4mq1EsvAWGza4p5ZqaKR9?=
 =?us-ascii?Q?8l44a88sU/Alp+YH14ajv1vu8qPviLd6vXlWY4gy6p3W?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 34183ffd-8ffc-441e-1c77-08daa76f4166
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 07:49:10.8015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 m73u7Dp2Ss9gOOaYwhw7cVm+9AaITiJaAbQBI+U3be5ugoy2cixpZOK4ctA3CQYpNu+tWGMyZSIGQnN4RA2Ydxhz28lQfBRe7dqbMEQtumgPsoQrePeHFhpnjtjtTwCL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8406
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Oct 2022 07:49:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3293

Hi Michael,

On 10/5/22 19:57, Michael Opdenacker wrote:
> Hi Quentin,
>=20
> Many thanks for the reviews and your patience!
>=20
> On 26.09.22 15:40, Quentin Schulz wrote:
>> Hi Michael,
>>
>> On 9/23/22 19:51, Michael Opdenacker via lists.yoctoproject.org wrote:
>>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>>
>>> [YOCTO #14508]
>>> Reported-by: Quentin Schulz <foss@0leil.net>
>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>> ---
>>> =C2=A0 .../migration-guides/migration-3.2.rst=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
>>> =C2=A0 documentation/overview-manual/concepts.rst=C2=A0=C2=A0=C2=A0=C2=
=A0 | 18 +++++++++---------
>>> =C2=A0 documentation/ref-manual/tasks.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++++----
>>> =C2=A0 documentation/ref-manual/variables.rst=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>>> =C2=A0 4 files changed, 16 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/documentation/migration-guides/migration-3.2.rst=20
>>> b/documentation/migration-guides/migration-3.2.rst
>>> index 8a8d19d605..4c0de7b0f6 100644
>>> --- a/documentation/migration-guides/migration-3.2.rst
>>> +++ b/documentation/migration-guides/migration-3.2.rst
>>> @@ -207,9 +207,9 @@ files into a subdirectory and reference that=20
>>> instead.
>>> =C2=A0 deploy class now cleans ``DEPLOYDIR`` before ``do_deploy``
>>> =C2=A0 ----------------------------------------------------------
>>> =C2=A0 -``do_deploy`` as implemented in the :ref:`deploy=20
>>> <ref-classes-deploy>` class now cleans up ${:term:`DEPLOYDIR`} before=20
>>> running, just as :ref:`ref-tasks-install` cleans up ${:term:`D`}=20
>>> before running. This reduces the risk of :term:`DEPLOYDIR` being=20
>>> accidentally contaminated by files from previous runs, possibly even=20
>>> with different config, in case of incremental builds.
>>> +:ref:`ref-tasks-deploy` as implemented in the :ref:`deploy=20
>>> <ref-classes-deploy>` class now cleans up ${:term:`DEPLOYDIR`} before=20
>>> running, just as :ref:`ref-tasks-install` cleans up ${:term:`D`}=20
>>> before running. This reduces the risk of :term:`DEPLOYDIR` being=20
>>> accidentally contaminated by files from previous runs, possibly even=20
>>> with different config, in case of incremental builds.
>>> =C2=A0 -Most recipes and classes that inherit the :ref:`deploy=20
>>> <ref-classes-deploy>` class or interact with ``do_deploy`` are=20
>>> unlikely to be affected by this unless they add ``prefuncs`` to=20
>>> ``do_deploy`` *which also* put files into ``${DEPLOYDIR}`` --- these=20
>>> should be refactored to use ``do_deploy_prepend`` instead.
>>> +Most recipes and classes that inherit the :ref:`deploy=20
>>> <ref-classes-deploy>` class or interact with :ref:`ref-tasks-deploy`=20
>>> are unlikely to be affected by this unless they add ``prefuncs`` to=20
>>> :ref:`ref-tasks-deploy` *which also* put files into ``${DEPLOYDIR}``=20
>>> --- these should be refactored to use ``do_deploy_prepend`` instead.
>>> =C2=A0 =C2=A0 =C2=A0 .. _migration-3.2-nativesdk-sdk-provides-dummy:
>>> diff --git a/documentation/overview-manual/concepts.rst=20
>>> b/documentation/overview-manual/concepts.rst
>>> index 06220401bc..f3f8cbd95c 100644
>>> --- a/documentation/overview-manual/concepts.rst
>>> +++ b/documentation/overview-manual/concepts.rst
>>> @@ -1801,14 +1801,14 @@ from the :ref:`deploy <ref-classes-deploy>`=20
>>> class::
>>> =C2=A0 =C2=A0 The following list explains the previous example:
>>> =C2=A0 --=C2=A0 Adding "do_deploy" to ``SSTATETASKS`` adds some require=
d
>>> +-=C2=A0 Adding ``do_deploy`` to ``SSTATETASKS`` adds some required
>>
>> You missed one here.
>=20
>=20
> Actually, here we have a string to be added to a variable. Having a link=
=20
> here may hide the fact that this is a string, and it's a bit like giving=
=20
> a piece of code.
> Don't hesitate to disagree!
No, kind of makes sense.

Cheers,
Quentin

