Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392CCC43334
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 13:27:51 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.59])
 by mx.groups.io with SMTP id smtpd.web11.71666.1656941269032361494
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Jul 2022 06:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=KskTz0c6;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.59,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzHkkQz02vpzfIlNO1duX9vMT1WepoL7jf0R/n12YbYI6ndK7pVk5zqkrZoDgEtd9BbATL8hF5+bZZ1gfCsMt0Zag3Kn+0ZxnF6pAdui15PWO8t6M5k7ycOaeufwDre3rmWON6JQqs5VR8g+sYj5/VW1MhVg22TiUU1Geefb/B7OOAEU76mZQEX/KneMN4nf8uANl1DFuEyEQidhf2VvFGkDuww5Bw92vfuiVCoQuyxNltVBr+YyrZHe5NZUeyCyJdzve52eUhzFf6DDzM41GIvlXW0O2dmPUPw3ScEFrIgza6WdlLjmnoI0JmYn115iH6tgDjk78le9Eco+wTeUuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQZsL7m8o9Lmwhc6tg3297+SyOcS95gSY4YJXpgm75g=;
 b=XmC8fO2cGqchBXHa+psQBkNdUZc/cHFpwvRyFMonuAGDqx4Aw5a3BGSSHrpBzeJaWK8Fyp/7fNEHjoP9b8bcZGOh9NBrP3+gFAIvl9Mm/cxX17HwyeVEtjA6cQAFMKSKMo7i34DSfBTPQLE4xbtYf4y4MfXAqb4d3dC2Qf8OlBfe2I5emrNrJV2Fkb7mMaElbDBUSMKGsGLdS8bwOcl3jAq0Vn2D2M+4+v+Dh/+Gul0LcvNEmmOEGdNaYUolV7IB8Nl1t6poSkdbKkoje/2Zzaa6CP2WnsVb07J/nUnfn5MBYrFy1kel9jfHPb7IQxz/bJw3wwr9bH0p+45IxhCHzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQZsL7m8o9Lmwhc6tg3297+SyOcS95gSY4YJXpgm75g=;
 b=KskTz0c62zQDHWvsUcUB9xbJOq8HnR/tLSD2Z9SQRYz04HRnJW2pJn09XLcE0R0SlwFbfTlU7dTOzijyiOQXIGNlbmKu+p6S2ZGPTC16KTKBh2RoAUeNDBQOohKTA5z0lvTX6LQG9+Qxw9Un9w1hI+hhs5L+NH+IQiGPhwvrnZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by VI1PR04MB5679.eurprd04.prod.outlook.com (2603:10a6:803:ea::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 13:27:45 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::cc58:11a8:839f:895f]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::cc58:11a8:839f:895f%7]) with mapi id 15.20.5395.017; Mon, 4 Jul 2022
 13:27:45 +0000
Message-ID: <6e39dfeb-d84e-4e6c-8010-3c3050c0b7e9@theobroma-systems.com>
Date: Mon, 4 Jul 2022 15:27:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [docs] [PATCH] docs: make DISTRO_FEATURES examples more explicit
Content-Language: en-US
To: michael.opdenacker@bootlin.com, aatir <aatrapps@gmail.com>,
 docs@lists.yoctoproject.org
References: <20220623131543.46899-1-aatrapps@gmail.com>
 <d75a3a41-48e9-2cb6-e5db-76992c49df7b@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <d75a3a41-48e9-2cb6-e5db-76992c49df7b@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR05CA0008.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::21) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c130712-6ec9-4e39-718f-08da5dc0fab9
X-MS-TrafficTypeDiagnostic: VI1PR04MB5679:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rp9/3O4qtaLxVTJk3rNM96KuJZswaAvFr1/MNw4qV7i6kacfNtkq7yb8jkzUOab05S3jOAXCMDmFLeWmwRA6h3s5ttUI6gs+5ZDI582hQhzgxSm7S5IvMJf4r3lywg7fPBrv1uTlUtlzUVRg4xjUlbN6r2Ksfe+1dRlBFKSq0wPvt2ViM0QRFwz9HF3p50+jTHJAUprm8A6abx4l1g9LSQ5BbfwALad3qovO17bE6PTOSHjQpxZyEDqAfV3w7hkn+HvaIELQJekvHAt4OJByK+5wTwIxbwzbX/gvxCWv6ynm3ZMsvXuzqgrcMp6Uv4Y6cTnwi78Uwi9QbBgcyUiP9iNLHBN/VYjeuK7dZiC2iC6s9mAlS5NHWlJ6Ki+/LZnL+qgmy7vohttlBL9Ix1ZlcBOwuR5R+vJRW6wYl8B/Q3Nf7/X5Aea3ZdCEZHPMhA4XYH6v4h+GMCV1BNVo6ZLqgoISXwdQXDqVoz7Hn7eJb4qn4lcihcJnRof8/aP0j2HFGK1+UyxOoUoqSuqW+Pr7bwcRumZZvhDvW0olm+iYFj6kp83hSKcU+TNP4cwR5QoPIPD/Z4UCK2uvqYWrVglUjXlkFU/52/uGQSl6Er+u5ClCiq1GxRTSrBsj/qOHo7JoOc/zepOQA3xmeEXmyPaAfWVnB2zvuo2T6YBuRkOMQR9eVM88FnKW83v/YpuY26ok/9Daa+EVsfESJECwaVV/kFdi3YaYAVhYfOvsmxwYcrgOJnvzckdmb2pWV6uSJjJevC9fgYZ9RGevt6KydZT+AscuFIYbgGEOAWyGc4/FtYrHgWxtUk4pMQjsehQkEetYymbhzC+NH5kjfk20htgOEwUpLs6xqCGAFG/ARLph9HI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39850400004)(346002)(396003)(136003)(376002)(6512007)(44832011)(53546011)(5660300002)(26005)(6506007)(8936002)(66556008)(66476007)(8676002)(66946007)(86362001)(316002)(41300700001)(31696002)(6486002)(478600001)(38100700002)(83380400001)(186003)(36756003)(2616005)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w4YGJZZXgo//eJnn8VRYCOO+UnJV4mli5Ooe/ssLH7iVL1YPyAVRdpdREt2C?=
 =?us-ascii?Q?y1GeFxCieTbWr08oZGr6uFRPyxkni7q8G0qrpHPZSrTstSEE/yaqEt3m1Dlu?=
 =?us-ascii?Q?DtcF1F410UzvNpyFdtotu3sJF6x6ejwU9DcIqZvM/aHqKRx5HAIU1K+eXkX4?=
 =?us-ascii?Q?YujHRagdbsGLg8BhvmlbbqIWuyr+TD3+ChqvloMoY3+zDYfGncz5c16644ME?=
 =?us-ascii?Q?OSkPXvhkVFjhqlhalNth4LMC1Kt4WRTG2Qf9MY6SN+ekXR65FrsJ9jheQwgJ?=
 =?us-ascii?Q?kh7GvcVtSDDrCLWXcvY+kjRZ04iF8HCG2VtZPF2rksHsxbyMdN9oYpOgUk86?=
 =?us-ascii?Q?+6PDhgFsEX18fpgX13BzLvyl/PJLYB1ltsguxf4UJwCSE1LD3cvd1YBB7SrP?=
 =?us-ascii?Q?IhR9AHiCZNOurNWVkLcWiHMne1uqWHrimLlcYfJMGHVhPY4652LPDQNJH+55?=
 =?us-ascii?Q?Ix1Ze4JeVGvAwK5rBO245JVAjqL7bjZ0sdzFP6D3JTM8grtlEGA9DdBkxPi7?=
 =?us-ascii?Q?gtRlwdaJK5GJX+MEVsb+TJpvzzVp+y03vegSNYFDu4IBYuSGfAfh4uCkHbAg?=
 =?us-ascii?Q?S01sH6SkFkjrTtCi7v9wfTEv9N//6N+z5HQAJlUC7ZRxS0uEA9wjOnGFpLs2?=
 =?us-ascii?Q?UaGfPD4lpHXMk1fpFzh0UoMyeQeyqpbudo+3KnvCJOuyVF9Fyt1azKGFBi+T?=
 =?us-ascii?Q?kRE7LbW/GjJCmgfUAhf39nHFt2cOy6treyvra1ElLCCDtaOg9vioBpc2nYrv?=
 =?us-ascii?Q?PbEtTReKOB5AUrTZ1wogoIBehEECrX5EqdK3ex9/7N+7qHdh2ra6MM0rf+o8?=
 =?us-ascii?Q?isgae9FUhaDTLcfHrEH1V9fzmSEhzJqXRkrKIcT77H14PrVmGpBbrRRSTIFp?=
 =?us-ascii?Q?L89RmAa1Ohr0VSr01Xpa/xaVmCsScBa+bnma9WBZpQIQ3N1qmUQo1qq7Mt2W?=
 =?us-ascii?Q?HZwFnZf9DIfV5qp1QVBvKMD+wXX2+q+Em2rX0exZpuoaT8ycUmpyyyuNBrQW?=
 =?us-ascii?Q?Hp9JlKZ6UaeXGQqrxHWoqLPZua9YiSwAf2gdtztmJ88q15ITrMrUmKnXNx0y?=
 =?us-ascii?Q?Y4nRwqmfVAVD3zpLUqPvelbI5JN6DbfEu7CNhi4TY3tp6O3JI8i0Cp7ylx9h?=
 =?us-ascii?Q?y60JN7ZhTXlyV/XBz6Al3A6MBSIFxACY8c2BtaWniVIHPk1pjKt3PtMe2TI5?=
 =?us-ascii?Q?qNpEnCCwNSJiXspdwceHbGihzZp3/U9ZRV5G1H85g0D4e+68kOReFFCc0PDb?=
 =?us-ascii?Q?H8QN6kpSWUVgR4b24sf0GILpvxOFfwjAWFJoTn5xTW2zjEUTwfRwd9daFQjY?=
 =?us-ascii?Q?6vZAe7/inU3q/BRGTpuvDN3ay6KJeVDGM35wO8tXMu8rVM3HEwr22GEYiOhg?=
 =?us-ascii?Q?326UCpjsAoCWaiXRRMNM+lTZrl1eNbwzJQCuzCCuAD5wSdsIINiouATzrVow?=
 =?us-ascii?Q?gr6VfrDb+KDqmkERYcm8tRGEKIB0B3LYJfQIgqRTalvDHf1c/Z0vn8gkL34y?=
 =?us-ascii?Q?3C18MH1T2Dyaqifz8A3Zv2ivYD7LZRLVqfksWFC/isoBnsUm40oxvcdUB/0o?=
 =?us-ascii?Q?+TnghomukjmldFi6KQo8ZT1aMzJC//lu8CuLV1tzozA9HaL9xwBWW12JOm1M?=
 =?us-ascii?Q?q7QDosTs717ub4m8fosB+RA=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6c130712-6ec9-4e39-718f-08da5dc0fab9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 13:27:45.0420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HAm3EQK9yrkqek888wVKIAPlGg6Ex5QtSVaO6tgzq3nJY2LnNnW2etA4Xcd0936y4/QOS9D+tLeSUBibNnWOj9RtISAIexQDI89id5IEV3UOeoErNMzYlo/w+/h/TFNH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5679
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Jul 2022 13:27:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3048

Hi Aatir,

On 6/23/22 18:04, Michael Opdenacker via lists.yoctoproject.org wrote:
> Hi Aatir,
>=20
> Many thanks for the patch!
> Here are my comments...
>=20
> On 6/23/22 15:15, aatir wrote:
>> Make DISTRO_FEATURES example more explicit by specifying
>> that DISTRO_FEATURES alone can't select build configurations,
>> and need mechanisms like PACKAGECONFIG setup to take care of
>> selecting build configurations.
>=20
> I would talk about "DISTRO_FEATURES example" but instead=20
> "DISTRO_FEATURES description" here.
>=20
>>
>> Signed-off-by Aatir Manzur <aatrapps@gmail.com>
>> ---
>> =C2=A0 documentation/ref-manual/features.rst=C2=A0 | 4 +++-
>> =C2=A0 documentation/ref-manual/variables.rst | 5 ++++-
>> =C2=A0 2 files changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/documentation/ref-manual/features.rst=20
>> b/documentation/ref-manual/features.rst
>> index a8d0dac99..6f9edf1a1 100644
>> --- a/documentation/ref-manual/features.rst
>> +++ b/documentation/ref-manual/features.rst
>> @@ -100,7 +100,9 @@ packages, and they can go beyond simply=20
>> controlling the installation of
>> =C2=A0 a package or packages. In most cases, the presence or absence of =
a
>> =C2=A0 feature translates to the appropriate option supplied to the conf=
igure
>> =C2=A0 script during the :ref:`ref-tasks-configure` task for
>> -the recipes that optionally support the feature.
>> +the recipes that optionally support the feature. Appropriate options
>> +must be supplied, and enabling/disabling :term `PACKAGECONFIG` for the
>=20
>=20
> Oops, there should be no space between ":term:" and "`PACKAGECONFIG`",=20
> otherwise Sphinx doesn't create a reference. You have multiple instances=
=20
> of this issue.
>=20
>> +concerned packages is one way of supplying such options.
>> =C2=A0 Some distro features are also machine features. These select feat=
ures
>> =C2=A0 make sense to be controlled both at the machine and distribution
>> diff --git a/documentation/ref-manual/variables.rst=20
>> b/documentation/ref-manual/variables.rst
>> index 28267101d..48bdf3810 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -1873,7 +1873,10 @@ system and gives an overview of their function=20
>> and contents.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 optionally support the featur=
e. For example, specifying "x11" in
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :term:`DISTRO_FEATURES`, caus=
es every piece of software built=20
>> for the
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 target that can optionally su=
pport X11 to have its X11 support
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enabled.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enabled. Note: just enabling :term: `DIS=
TRO_FEATURES` alone=20
>> doesn't
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enable feature support for packages, mec=
hanisms such as making
>=20

I would use .. note:: directive here instead of Note:. This way it is=20
properly highlighted by Sphinx and the user won't miss this important=20
piece of information.

Cheers,
Quentin

