Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB32CF31AE
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 09:35:53 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.62])
 by mx.groups.io with SMTP id smtpd.web11.3268.1727861743674191091
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Oct 2024 02:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=KWQTboqD;
 spf=pass (domain: cherry.de, ip: 52.101.67.62, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVEgea6WuwVT0yMtMt5Fj4WCKTTncKSYT/zN1L6tSHmHcZumFakzfasWE9tP02+I51Pdv5bObhloEC+PbNhnjL8MA62n93jmiIYP5eVAMLDySAsxE8ZBf2oyzgK7sQraRJBDMySEBPJN5ICCg1muQ5Vd5zeQlVASRIybP9PlP6YlPtsrkfZN6IwzEfPmV7xUSixoqfSdo5EFZNDeXbM66JoiMk5cBImcU+E3c6EzvKY/xhqOTVWidhxc+mfSzovvpjbKp4U/F+QfzvKQ68eM0HFz81AWVxgLz8T+Lm2WEGLCVdxcr4BaesYKKMBV72FDgnZDvHZA1m+sBfPnukj8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UF698HVRKZgIK7y1cmaHba1huRLUVVlfsFKCsnaN9jI=;
 b=GIEpzB37nBgTdm3GDA/sXOggN3+oO3Z+p8QaeUg3+gB4MSYynDBuQBPTZDzfUHXN1YYuHL7pRleCZnNDAdxAdBQe8lS1G2Pth9mL7X8Yh49OflSNL1DZ+IOhDBMhNt4BJOeMwQXOxazf1L49L0gdLna1FLqgO++e8EnyJHIe5Ql6LDbWDMhMoqTHytbdRlqv3BCEKJAAXP4DY+ifGKCUhCdq0waJDop++h5ynGUbqZjTdnoPEaoXUQRDD//X1UwJdv41u3yL+tBtOP6/FqtUJFxy4hPCFuozTuKaAxjqm30eYZBOPjOK8+/vud6Z/hZr/8svx42zg7bA9QpzVs1QkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UF698HVRKZgIK7y1cmaHba1huRLUVVlfsFKCsnaN9jI=;
 b=KWQTboqDyqWDA9PUNfQa5g1P+SOBMXSBAvd6dB0aMUlOcPw2ZAcOl1g0yAAaRy3x9EhusYq6CuAbx7IJHf5W+DTwocWUC3Y85GAaNF0T2Gpf779RUaqgZiy/iIbtYMRl4YjQy+v1D6u7xT3Us7JLm0bF96H3TC7rHp3w9bjXy3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9217.eurprd04.prod.outlook.com (2603:10a6:102:232::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Wed, 2 Oct
 2024 09:35:39 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8026.016; Wed, 2 Oct 2024
 09:35:39 +0000
Message-ID: <ba6aa464-764f-4cfa-b5d3-56df3af76dcf@cherry.de>
Date: Wed, 2 Oct 2024 11:35:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 1/4] migration/release-notes-5.1: document
 oeqa/selftest envvars change
To: Yoann Congal <yoann.congal@smile.fr>, docs@lists.yoctoproject.org
References: <20240927220033.3941455-1-yoann.congal@smile.fr>
 <20240927220033.3941455-2-yoann.congal@smile.fr>
 <f71bb041-ad48-4294-aaf6-ab8d86b32a28@cherry.de>
 <3ca3c382-0c45-41e1-87a2-03fde24627b7@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <3ca3c382-0c45-41e1-87a2-03fde24627b7@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR07CA0274.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::41) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9217:EE_
X-MS-Office365-Filtering-Correlation-Id: ee890404-0fb6-40f7-ad42-08dce2c59385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?O7eUi73Xjvc9IigqmtDca+Bub13zVOOHO2dTKVPZWq7xI74l0cwpO+H44jci?=
 =?us-ascii?Q?ccMR0V7JFXIV3yww4UkDxG+QFRgNSDoCxQ5paM96X2qy3Nfp6rG2HZBcm6Jd?=
 =?us-ascii?Q?1nd+3tuqXylnY6TbP+rpF3Oyh+64Uqrmbl3FwuB+6jDwcCAXT12qRc+piu2v?=
 =?us-ascii?Q?jewyDkMWghDO3SwtPI/b3DkafFh0Fip8QsnvJxoD7CTFCbIaHGGLm6GSZLoQ?=
 =?us-ascii?Q?+MSU5pJkLLTVlrwg+y4+fdwPuamMwctn08szWONUc0N7ASwXevSKv6WNNxvC?=
 =?us-ascii?Q?ZJJPhOC/AXa7+Ui5xlTVxogvDsJbgtkGjCBE9Sw1D0fBj83zQ1lcQPQcM+i1?=
 =?us-ascii?Q?S5qkcjVZCDRxkbzOca498ye7ejwJw/YfsZTkSUOKjm4tsNIu/HAHDbaaDFgg?=
 =?us-ascii?Q?JE2LdICF5jfqHqAHMQb2yeN8rPa505lyIE7kNSeXmKJqnUcen7LcBYkRSfqd?=
 =?us-ascii?Q?QhHtS8Ulsn6A1PP6hKsLtU8YX+l2rERPad8eK9k+n5TaYUtLaQo94foLGj0x?=
 =?us-ascii?Q?0eQLcVSUHhaqvxJD/35X32UKzxO7a4MkgXds4M2NWoEC4YMGGawXmmm7M7UA?=
 =?us-ascii?Q?FVNe+7PR5u+jxpFyuaIranGlGm3qq38nzJGUPUPscpwA1zOhruCA5wp233Pa?=
 =?us-ascii?Q?SolB/yknjlvSeBi+kdZ//IhomvwJTTlotvsehQUoNlDk2DC8kncuB4Pp17g+?=
 =?us-ascii?Q?Wv05xk8S4ftTAtWvmAutUJmQoEpXHreXtdZ8oVSI1qJfmZaFXdz9xHGDTH65?=
 =?us-ascii?Q?HHd548xIpYPiWo1uS6j3/c6jDLdwEx5S81W9og+dLBgVuFjP+oOENrtZk1ol?=
 =?us-ascii?Q?Cji0NRsB8V31vCTTqN2wjC6w1tCNNNS3IZjJLpfod5XdSmfxitsb2TjX7G9t?=
 =?us-ascii?Q?ZsiWFD8UIW4v1AKoI6V63Dc4TtTaHlS1VoVvwnZwNwo98LW4JK9ZxQ31AFp0?=
 =?us-ascii?Q?+TggRS5E9bfMTzY7sFiYbCOwQjiT9CNPE+VI9f1OYLviQpdaDuX7Ilka1zAt?=
 =?us-ascii?Q?Eda4ti8WhjDOGpJjj6JwcTvwOFVjixrmwpEHhHdJZvU4bYybSu4xcJkJICP2?=
 =?us-ascii?Q?E/X0dMlcyng7nRU1aftmD7OOeBwLLIQ+8GD5IuXzvk1XXYDlj7yzPdXtUsJ2?=
 =?us-ascii?Q?MKeOcz7/MQip6r8ld/rKiPxpQSirRfDzYIIaS9Q7y6pI3oxb7DE0UwzwCIIw?=
 =?us-ascii?Q?uFTa02O8n31sToXC/uyQmcRXdLz2TAaFbHBd6V7ZhyOwfaZ0mQodutIW6xo?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gYYRpjD9zSNlHPmHmqgu+FyIwZpXrkdh/3Q1bBhkxcPn4nbdlL1+hg7dQR9n?=
 =?us-ascii?Q?bHcaI9wwHOCMwGhFa3Jj4MueKfaOxNeWyoGRPFEB4Kk+Ga/QOr6Lnuixu4JX?=
 =?us-ascii?Q?5KOJtCzC8TPPrIKl8PJmonyLsfNmL57ixtLXO9+iRk/I7rNSTNcyocwOB4dL?=
 =?us-ascii?Q?1brCNqmDs2/cZ1Fk453+OMhtZ2c07f2Z1JsZvF4v/gKlYE4hVqMkSxCBxjX6?=
 =?us-ascii?Q?zddKPCAHIygbuWr1NqFURRmC2wOBZIpJ7F5xlsvIuVO9kzQR1yr7/Vlfe0sE?=
 =?us-ascii?Q?2H7fn2d/aYnZr93iiU74fthGEiXo8uXdUBHp//pvxR/nuSxmPRl++wqvETZV?=
 =?us-ascii?Q?LDJE+8WyevbozKGy7pBxMTJRN0pPpz6ZgN+xp3Zyc8VKFvrfnVlO3UxioCj0?=
 =?us-ascii?Q?tnY5AU6jC+WsGmCZp8z1Qj5yNfegyqn0oT/f/MM6xLduebd37NvoeLMsZOAr?=
 =?us-ascii?Q?78L3mzJu4EJGvgG8VYhGzAYa4qe/FJmF6JsLIXbBfqFzUlZe9/k1N660KiR4?=
 =?us-ascii?Q?jLCu9s6qoJakFp1icWD+lPxgKyKgYw2+6QTb7OUmoUTR7GqBi3Bxppd5/Ig1?=
 =?us-ascii?Q?MpJN5y0Zo1bZLahAQKoksM/alHaWvvjBu/WJfv62RSv+TC8rO/M9nDAbYmwK?=
 =?us-ascii?Q?a7smhHNh9sRhU/VhsKufX8YGX9hNyqSJ7brxHRyvIjmFpM1XKqRpin5ZxOer?=
 =?us-ascii?Q?ZTcbiWYPw3qe2G2KWxcwAcRPfuIx+Ez24cl+kR5eXAcL4Y68Va+ZtykAOTF2?=
 =?us-ascii?Q?O+V57jEQd2Y4UjJ3Z+rcOVOLkLvlxWKHINVu1dxnqpgqiQUjDRwQ9VSB/eRb?=
 =?us-ascii?Q?/LCDSKfATe1lGqOUznet96K5rMUHdQEmF/UawmLbP7fsDbR9FqV3BrNmlQB2?=
 =?us-ascii?Q?MzsbCVfJ+0J8n8z6njpa+LAaISqpRW7k64OTdfAX+Qyoh9uobTCzR9UVKRHh?=
 =?us-ascii?Q?/MPNlLClzlFav+VGMxlUoFJ4GgZbRuQIFNYmtRks8h6wVZPy8GTOKHhuT8c3?=
 =?us-ascii?Q?JX5ibx/NsuZ/Pk0KlAPd60rgCxP+R9yI2Tdz/ao44DrY/d4vgprwrV11iUyS?=
 =?us-ascii?Q?Mwzj28VCg0IJxMlf5ZscEGaWXXjKQdIB1ccitoR0H6H7oKizwtUsKaEVCk2X?=
 =?us-ascii?Q?IsQfnG04WEirJHbQsqnaIFRgDRPpD1xv56JUmwEc/3HUz6N2608yezwkYDuF?=
 =?us-ascii?Q?KtjeKlO0gzBq1WCwOPN8WqjCKoI0qICufLd7Is2TCBg2iLfnoyFot0GkEpQ1?=
 =?us-ascii?Q?Ufv3vdPRqpMv0Gzh9+GLxVyqACX+y5ecprlxOLPijaHXYxcl8a+5TEZKQtwP?=
 =?us-ascii?Q?YbNXjaDZrI5gb4ZsmkPPFjepb670styvvvL8hDpJAOeFqdF59Np+478Rf7eE?=
 =?us-ascii?Q?iB0zSyHJQ3v7dPz5Cd9caBmsdMukl50M9W9rEFZXVZcmrExko312AF0luM9+?=
 =?us-ascii?Q?C0/Ue8DSkw7DIcmknS70ArqAimZYLdepQ5d469d3TDQygkm/C7S8tBcHmD3l?=
 =?us-ascii?Q?LVB0Uy8/cOkd5g3NF08maRtICUHHeS7kyVJRvs35ChYo42EMLROpXU0gPbtP?=
 =?us-ascii?Q?rZamlJjuaVpE2glKvZ6/ESdkkW2pKGinSJI7JcpSsLstDtAE2wnlIPuCCtjG?=
 =?us-ascii?Q?Er4nfMT/vRkcjghlgG7NRdk=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ee890404-0fb6-40f7-ad42-08dce2c59385
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 09:35:39.5561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/shcPP7AaW1zdEwaeSbVKCpNiHI74lHwteDtqvwvtm7UNDilrljqsU1rX/OTTwkhaaBk2ptBlsSnFAz8Ou/gx1uZ7mhVBu8wKwOaSjq85Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9217
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Oct 2024 09:35:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5402

Hi Yoann,

On 10/2/24 10:57 AM, Yoann Congal wrote:
>=20
>=20
> Le 01/10/2024 =C3=A0 11:40, Quentin Schulz a =C3=A9crit=C2=A0:
>> Hi Yoann,
>>
>> On 9/28/24 12:00 AM, Yoann Congal via lists.yoctoproject.org wrote:
>>> From: Yoann Congal <yoann.congal@smile.fr>
>>>
>>> This covers the Poky commit:
>>> 61186bc98a5 (oeqa/selftest: Only rewrite envvars paths that absolutely =
point to builddir, 2024-09-10)
>>>
>>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>>> ---
>>> v1->v2: Reviews from Quentin Schulz:
>>> * environnement -> environment
>>> * oeqa/selftest now only rewrite*s*
>>> * Add exemples for the selftest change
>>> ---
>>>  =C2=A0 documentation/migration-guides/migration-5.1.rst=C2=A0 | 15 +++=
++++++++++++
>>>  =C2=A0 .../migration-guides/release-notes-5.1.rst=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
>>>  =C2=A0 2 files changed, 17 insertions(+)
>>>
>>> diff --git a/documentation/migration-guides/migration-5.1.rst b/documen=
tation/migration-guides/migration-5.1.rst
>>> index b43fecc2d..4625ff0e1 100644
>>> --- a/documentation/migration-guides/migration-5.1.rst
>>> +++ b/documentation/migration-guides/migration-5.1.rst
>>> @@ -141,3 +141,18 @@ QEMU changes
>>>  =C2=A0 Miscellaneous changes
>>>  =C2=A0 ~~~~~~~~~~~~~~~~~~~~~
>>>  =C2=A0 +-=C2=A0 oeqa/selftest now only rewrites environment variable p=
aths that absolutely
>>> +=C2=A0=C2=A0 point to builddir (i.e ``X=3D$BUILDDIR/conf/`` is still r=
ewritten to point to
>>> +=C2=A0=C2=A0 the selftest ``conf/`` directory but not ``Y=3D$BUILDDIR/=
../bitbake/`` which
>>> +=C2=A0=C2=A0 still point to the ``bitbake/`` directory)
>>> +
>>> +=C2=A0=C2=A0 For example (taken from autobuilder environment): ``BB_LO=
GCONFIG`` is an
>>
>> nit: could use :term:`BB_LOGCONFIG` here since we have it defined in the=
 reference manual? We could probably even avoid explaining what it means he=
re (not necessarily though).
>>
>>> +=C2=A0=C2=A0 environment variable containing a path that configures bi=
tbake logs. In
>>> +=C2=A0=C2=A0 autobuilder, it is set as:
>>> +=C2=A0=C2=A0 ``BB_LOGCONFIG=3D"${BUILDDIR}/../bitbake/contrib/autobuil=
derlog.json"``.
>>> +=C2=A0=C2=A0 Note the relative path starting from the build directory =
to outside of it.
>>> +=C2=A0=C2=A0 This path is not changed by selftest anymore.
>>> +
>>> +=C2=A0=C2=A0 Environment variables containing relative paths from test=
ed build directory
>>> +=C2=A0=C2=A0 to outside of the original build directory may need to be=
 updated as they
>>> +=C2=A0=C2=A0 won't be changed by selftest.
>>
>> selftest should be single-tick-quoted as defined as standard in the git =
repo, c.f. https://git.yoctoproject.org/yocto-docs/tree/documentation/stand=
ards.md
>>
>> This was done by Michael but he's not the maintainer anymore so I guess =
whoever replaces him may have a different opinion, in which case extending =
or replacing it would be most welcome, is that you Antonin?
>=20
>=20
>> On a side note,
> I've tried to make it clearer, I'll answer your questions inline maybe we=
'll find a better wording?
>=20
>> I still wouldn't really know which variables I need to look after
>=20
> That can be any environment variable containing the build directory path =
but relatively pointing to outside of the build dir (like $BUILD_DIR/../bit=
bake)
>=20
>> or what happens if I don't (is there an explicit error, are there side e=
ffects, if so, how do they show up?).
>=20
> It depends on how this variable is used.
>=20
> Ultimately, there was a bug (https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D15241 but the bug is more global than just BB_LOGCONFIG) and the wo=
rkarounds that users may have been used are not needed anymore or broken.
>=20

Note: I don't want this discussion to prevent merging this patch in time=20
for Styhead release, we can always improve later.

Are those environment variables necessarily in the **shell** environment=20
or are we also talking about variables that could be defined in bitbake=20
conf files for example?

If they are shell environment variables, I believe (hope?) selftest/oeqa=20
can only access them if they are part of the BB_ENV_PASSTHROUGH and=20
BB_ENV_PASSTHROUGH_ADDITIONS variables? If that is the case, then we can=20
simply tell people to look for relative paths in all variables listed in=20
BB_ENV_PASSTHROUGH (via bitbake-getvar for example)?

Cheers,
Quentin

