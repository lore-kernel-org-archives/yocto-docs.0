Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220F8C61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 13:01:37 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.42])
 by mx.groups.io with SMTP id smtpd.web10.41118.1676984486960904770
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 05:01:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=JvisrCr1;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.104.42, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/GM3X0X6jNFiSHUTbI9HVKBUcav6eWViaGujukpKquK4ehfUWQD9dvw99XFwJYyX1T0+1fId2M7qoHr/drut41VqXbHPKdpkhax4tvrxxPJnZS0mK+JEjdPc+Vc87O0kKs2Bvo/XI86XGDqbYbSUm0rHfpsoX6E1GSam7c2O/ZzCqvsjiW8tBBpzw3uUw5srbQKv3VAgzrKdlo4+qfepXevlOVgd1lT4soNpP819EakcGW6xMDRK+MS0UZmI1qDTEFhjQ4DpygI86E/qIYkSX9XfnX9ODWw1OKZaowdJ+BabYgDD+sEIhINEP5Sgxh41EAny24ysi/3YHkSOeJo+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4B9lv5F2zz1tQOAkvocV/IWhAykNgm6a6Kp3AtaCUE=;
 b=SNdqWqFJ7Grrhz3RX0AflFe25fbuUQTE+vKTCqOlTfE540JNwsqZmm4gYSM0jc3Qf5CaC3b9wj5DEo+05EYK5xYfBaA/1FrIpWhB68U4aYBWXvZli0hrPAFH1Mi4QMmdfgRejPX11HsIJwmFhcfW/YBprBTNxyUTBM6FJslDLZBqoe2GbRJ8hDZb0g5niCTrhoSxiCd71vHYAWCM3+f4mMMpNW0TyCieIhhSYTs4F2tMMaefNfFxxHp+r4qP/5OTW3qyCps6JY/EUcmEJcRaYy1RfnqAFlxF55A2JkjdgmRW4WIv28IgaraHNpGsytKkFb5MX5Svn+fA22F9gRFoUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4B9lv5F2zz1tQOAkvocV/IWhAykNgm6a6Kp3AtaCUE=;
 b=JvisrCr13PYzoMs1ugphP2zmO/luS8tnCD92UR+Sp6xiraf7aKawysJ1bBSehqpPCRbGfiSMl+38WKS6cQParrnyHzdkZFREKQLGOZX3z+lROdnPvVVa2i7jKR67pGlQA6PDwKJLQdENm0Ucxj8a0iDvW5BJBreDU5T59ZcrH1IUNOdxjV3LMtcTLn4HtKSV/fMsaZuKSmWAlYQSNs8NTbyto9rlTGC53arXLkh6Cl6xB5AXMN+pSlGjW7MJWGUCcC49JTji3Y+/DBbsFjA+bq1vF6N1lVf6kl5GM6SuudG7lZ9MdJnn7AEGn7I0kDGLnizdHeF9KLx1wY8GawALeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DB9PR04MB9404.eurprd04.prod.outlook.com (2603:10a6:10:368::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 13:01:23 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd%8]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 13:01:23 +0000
Message-ID: <3891ece8-e2e3-1e37-a372-dd88a7bbabf7@theobroma-systems.com>
Date: Tue, 21 Feb 2023 14:01:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [docs] [PATCH] manuals: document COMMERCIAL_[AUDIO|VIDEO]_PLUGINS
 variables
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: docs@lists.yoctoproject.org
References: <20230221104436.20516-1-michael.opdenacker@bootlin.com>
 <b218e63b-b446-25d7-165a-b4a9926cc047@theobroma-systems.com>
 <b827f17a-0d3e-7e49-dca5-cc1b2154f427@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <b827f17a-0d3e-7e49-dca5-cc1b2154f427@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FRYP281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::11)
 To DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DB9PR04MB9404:EE_
X-MS-Office365-Filtering-Correlation-Id: ad935d8f-cf2f-4c67-6667-08db140bbc25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SAdOIzMlZ4UqZpASqAKWvkmYuTZvwjJYtYAuLGcYAtbuE0sUQe24lXEdST0lipl1hcbaizHbfAPNXQuORSvVKUCwgImQUquIz78hXmnC5Uh0gdJSiFKFqMqIdxrjzwdd9urI7QvoDNgcz3HvrAWG2Q3QvjmlYmMqv+2ICRqL6gOs1znBAHdgCJoFIVVv5EVtehu6exOV8415bRmWjJfgLUxgnwzcbXv+Ap1V4xLBz2ZZdTeYsXMh8LzxiDgfS+Bkj9wGYvrO5oLZzCuaP3GCWa21UWV0sORWG5MaaFifyfITe1ubllOZr/1bEiTSq4sCagI4FQr0jlZCUehZ7HufseeJe9Fch6urX2FY/PohLq506ZB3l2jfqQFo01/CUzq+9fXdyVVjc5AGXeao2k1cVEy0G40ZRbQH1MQc1XdxJyjVJgNNTc0lODov6zJgljDhA7lxHnZADQmPisnyV3Zc19hOOyQmp3+Cz2fSExSQgV3xNWb/K0V4mUkPSVkkUtr+iNEeeh+rnWQG3Eipa1Pggti9Ih4dAg16g3r1/tH8PYrTTZz3N90/xCJa88i8dJlAlZH3ntU6GWfy18euq+LGgxGcZMl2lhG9drb5v6JHHNEfwdfNy80m797rh/g1uwKIiexmFehCGctY5MApYkaNIVfOkw91DATZcpGvM+RFhgtGZGduFF2OdvujFWta8uSsqE2oJwsQ7wp6U0X/Y8ImtovtDb1l+Q6yq3dZUdHbsVp+SFDchcCtBUcVR55GyH2L
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(39850400004)(366004)(346002)(451199018)(31686004)(2616005)(31696002)(86362001)(478600001)(4326008)(83380400001)(8676002)(5660300002)(6916009)(38100700002)(36756003)(2906002)(66476007)(66556008)(66946007)(41300700001)(8936002)(26005)(53546011)(6512007)(6506007)(6486002)(186003)(316002)(44832011)(83133001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5m2lJXgrtFfhbwT6vlqp0q7eFNFN2e3tNpTQKt/5h68Xh+2+Hf/Xs0YtqdHr?=
 =?us-ascii?Q?QEMiHHZs+E82EPgwURxTMRDy81KGCn4Bos2uNSCKOPJLsnlYTqtaDsmbJ39s?=
 =?us-ascii?Q?Bpnys9wM4zzWBQU2pyP+SwoaTkF3bbZQZ7hZszQIo8OZMPZdhAFKNoEcYhEm?=
 =?us-ascii?Q?s9SJGhllkVl619bUEQt0Rv08Res+HynsXYBtzUg8BzRrNFZTe9zAPs/AzDVq?=
 =?us-ascii?Q?nXRAhW6yfEhc3nSBwRTrkjqRQ2wHKZRYdOF/ZKJCmgse3ZaDK3dRMHzRbSeY?=
 =?us-ascii?Q?o3/7NTfzhn6a+cKjEfiQ2EAhZ2Mvgy+sTi3pFtkCc491RQKVuy0m2wObFf+D?=
 =?us-ascii?Q?8v0Nnnexj8vkO8w5muMv5zguymufMinkdkhumr3xa6FnMaEztQWhu1M2Q2hp?=
 =?us-ascii?Q?dplSBZj3xJaUyxAJ7SOsgRt82uisHjGIMTCB/hgI0/E6ZqfVOnaQ6j8TZbjX?=
 =?us-ascii?Q?ncwoeX7ajSO/C+9dyfPWOXLY9xjdxRm5/zwPdyR16txshYOzXZwLAjXZT5xr?=
 =?us-ascii?Q?+xUmOlWIHpoo93I6a8p4cMHI/RmtQyTVKtIUYfBWCfnV9EYdcBYXJW98Tx87?=
 =?us-ascii?Q?7tUvevXKmVtRYbB+rii/4dOpDnW6O7soXc8KzOcxCBcXVT0UJppIrl1MaX3Q?=
 =?us-ascii?Q?Cnv/QrQHA20mW5TT0hVG631kh0OwrZSoEI9tDyURCv3YBLXEppeg6HbYdHuP?=
 =?us-ascii?Q?De5P8YLdy7MvIK4xgoBDqSgqfO2pnLzQftn8Dyt2lGb0fuyoJj3HX4ECr0Z0?=
 =?us-ascii?Q?NsR6zM94hHcPzi9q64nklTw9+BrznwAdUuGq4aK0/xbPUCFN2Lj97/xyuy/C?=
 =?us-ascii?Q?1ipbFK7ZR8klt6WXEzGX6wRsyYnsLOCbgQUyPhGdLROscA5+jZwDoZ6vlj0+?=
 =?us-ascii?Q?vbl6uSTvHkdBHIuJtUR7LX+S4JSGL1sxTw0SJF7jC6gVv6y6FczRz4VHxxut?=
 =?us-ascii?Q?oSbhmxFQUfFZ3wqXCItVkIX5cw3nAZm/qlQDa/y2yxXCF2qiPQifSuFIpm9p?=
 =?us-ascii?Q?MECUDXzEW0BdVc2t3u3j9uhHYWdOaPQx/JWBchDKZ31zzFSe+MynPLf5iLiy?=
 =?us-ascii?Q?6Hq6w/CTY6TceKrwcf7WytTzOudpwxvb/iirMTNuFe53XsDR+Pp6eYBkIu0A?=
 =?us-ascii?Q?dbxqOEPWmOATFMhO/THA5bhFZlM2B3qKgm8VwNwgJvt8mFRodMzDWzwRvMt0?=
 =?us-ascii?Q?ctDxVyRmOPFPmUyhfdJZb3K9FLNfoEegeL/gBUzWw3ktMJkAPtrQs4KmfYuh?=
 =?us-ascii?Q?P2XXzwa0hB8ImX5Hf763YNIqoEe/1gZMORL2rBBsFENi8ZhL8n2PV2bzCXSp?=
 =?us-ascii?Q?xVEH4VNczTwON9YcUhSbOOpGU698hv/cvQZYXEDvCBM1CrEe3082dkD5MKYz?=
 =?us-ascii?Q?zEuQt/JWf6RmWvLtUzzBxUcBprvn42j8tpuYjeuAeXCU2Lnu1oyThnTC/pbU?=
 =?us-ascii?Q?lg5fBvfg0U80ivE9ysGrgYRyV2zDu43WFEhJwQjmUccyjzuBw73nXsVkIaNC?=
 =?us-ascii?Q?qACQJQemGQLcyeL85AY0EaBY7TOa+wYA5T5pXyG68rN4k/L3LpRe3TQya+Pz?=
 =?us-ascii?Q?te4sXOQHyfk744WJBGXaC5zfQQJbKVtSS892ir8NshuLTvwTY6gVP2Y6e6zu?=
 =?us-ascii?Q?FGoYbB4qBFABlkWFtaMB4Vk=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad935d8f-cf2f-4c67-6667-08db140bbc25
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 13:01:23.8226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rquPl0aCInj3I94x/YTWbTePVngMrJB/8Z0I/fzq5aYwq87PBgyWTun5p2xFXtRYAi0SUR5XnN+CRhRjmOzVvx6TeA2NY0T/InMjfJh27jO1UjptnKa9kN4RMKB+VQli
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9404
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Feb 2023 13:01:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3707

Hi Michael,

On 2/21/23 13:57, Michael Opdenacker wrote:
> Hi Quentin,
>=20
> Many thanks for the review!
>=20
> On 21.02.23 at 13:01, Quentin Schulz wrote:
>> -``COMMERCIAL_AUDIO_PLUGINS`` and ``COMMERCIAL_VIDEO_PLUGINS`` statement=
s
>>> -(along with the enabling :term:`LICENSE_FLAGS_ACCEPTED`) includes the
>>> -plugins or components into built images, thus adding support for media
>>> -formats or components.
>>> +:term:`COMMERCIAL_AUDIO_PLUGINS` and=20
>>> :term:`COMMERCIAL_VIDEO_PLUGINS` statements
>>> +(along with the enabling :term:`LICENSE_FLAGS_ACCEPTED`) includes=20
>>> the plugins or
>>
>> s/with the/with/ or s/with the enabling/with the enabling of/
>>
>> as "along with the enabling <smth>" feels wrong to me.
>=20
>=20
> Right. I'll fix this. There were a few style issues in the existing=20
> text. I'll double check in other places.
>=20
>>
>>> +components into built images, thus adding support for media formats or
>>> +components.
>>> +
>>> +.. note::
>>> +
>>> +=C2=A0=C2=A0 GStreamer "ugly" and "bad" plugins are actually available=
 through
>>> +=C2=A0=C2=A0 open source licenses. However, the "ugly" ones can be sub=
ject to=20
>>> software
>>> +=C2=A0=C2=A0 patents in some countries, making it necessary to pay lic=
ensing fees
>>> +=C2=A0=C2=A0 to distribute them. The "bad" ones are just unreliable an=
d therefore
>>
>> s/are just unreliable/are deemed unreliable/
>>
>> Also mention that this isn't a choice of Yocto but rather gstreamer=20
>> community's?
>=20
>=20
> Right, this makes sense. This was my text this time.
>=20
>>
>>> +=C2=A0=C2=A0 should be used with care.
>>> =C2=A0 =C2=A0 Maintaining Open Source License Compliance During Your Pr=
oduct's=20
>>> Lifecycle
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>>> diff --git a/documentation/ref-manual/variables.rst=20
>>> b/documentation/ref-manual/variables.rst
>>> index 760c608bde..26215f679f 100644
>>> --- a/documentation/ref-manual/variables.rst
>>> +++ b/documentation/ref-manual/variables.rst
>>> @@ -1313,6 +1313,26 @@ system and gives an overview of their function=20
>>> and contents.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 optional at the distribution=
 level, in case the hardware=20
>>> supports
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Bluetooth but you do not eve=
r intend to use it.
>>> =C2=A0 +=C2=A0=C2=A0 :term:`COMMERCIAL_AUDIO_PLUGINS`
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This variable is specific to the :yocto=
_git:`GStreamer recipes
>>> +=20
>>> </poky/tree/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb=
>`.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 It allows to build the GStreamer `"ugly=
"
>>> +=20
>>> <https://urldefense.com/v3/__https://github.com/GStreamer/gst-plugins-u=
gly__;!!OOPJP91ZZw!g3-jyo-zyCDgt8PzhEQCODfcdBgZFn81oApK_JDf-SOUZOj7xU1NTcsM=
3TiT7ijx5ktBKoVFrB10eWRqoTwwCKsmaV88ozoHJZrdCVVHKI1r1avSgpDo$ >`__=C2=A0 an=
d
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 `"bad"=20
>>> <https://urldefense.com/v3/__https://github.com/GStreamer/gst-plugins-b=
ad__;!!OOPJP91ZZw!g3-jyo-zyCDgt8PzhEQCODfcdBgZFn81oApK_JDf-SOUZOj7xU1NTcsM3=
TiT7ijx5ktBKoVFrB10eWRqoTwwCKsmaV88ozoHJZrdCVVHKI1r1Wm8oVT2$ >`__ audio plu=
gins.
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 See the ":ref:`dev-manual/licenses:othe=
r variables related to=20
>>> commercial licenses`"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 section in the Development Tasks Manual=
 for usage details.
>>> +
>>> +=C2=A0=C2=A0 :term:`COMMERCIAL_VIDEO_PLUGINS`
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This variable is specific to the :yocto=
_git:`GStreamer recipes
>>> +=20
>>> </poky/tree/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb=
>`.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 It allows to build the GStreamer `"ugly=
"
>>> +=20
>>> <https://urldefense.com/v3/__https://github.com/GStreamer/gst-plugins-u=
gly__;!!OOPJP91ZZw!g3-jyo-zyCDgt8PzhEQCODfcdBgZFn81oApK_JDf-SOUZOj7xU1NTcsM=
3TiT7ijx5ktBKoVFrB10eWRqoTwwCKsmaV88ozoHJZrdCVVHKI1r1avSgpDo$ >`__=C2=A0 an=
d
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 `"bad"=20
>>> <https://urldefense.com/v3/__https://github.com/GStreamer/gst-plugins-b=
ad__;!!OOPJP91ZZw!g3-jyo-zyCDgt8PzhEQCODfcdBgZFn81oApK_JDf-SOUZOj7xU1NTcsM3=
TiT7ijx5ktBKoVFrB10eWRqoTwwCKsmaV88ozoHJZrdCVVHKI1r1Wm8oVT2$ >`__ video plu=
gins.
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 See the ":ref:`dev-manual/licenses:othe=
r variables related to=20
>>> commercial licenses`"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 section in the Development Tasks Manual=
 for usage details.
>>> +
>>
>> Please don't mention where to find the documentation if you link it.=20
>> It allows to move the source across manuals without having to update=20
>> the text, only the links.
>>
>> If you want to point to a specific section of the paragraph about=20
>> commercial licenses, maybe add a target in there? e.g.
>>
>> .. _gstreamer-commercial-licenses:
>=20
>=20
> Good idea. We have tons of references like that in the manual, but we=20
> could gradually update them.
>=20

Correct. And I'm now cursing myself for having updated some links to the=20
sections and losing the exact location the old xml documentation was=20
pointing at when I reviewed the xml to sphinx update. Specifically, we=20
lost that for the QA section where everything is a list now and we have=20
no automatic way for Sphinx to reference those items elsewhere (well, if=20
I had known/thought about those manual targets... :) ).

More work for future me/us :)

Cheers,
Quentin

