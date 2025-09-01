Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56455CA1000
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 13:49:10 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.7])
 by mx.groups.io with SMTP id smtpd.web10.52215.1756734542188468134
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Sep 2025 06:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=ZYmJaP+j;
 spf=pass (domain: cherry.de, ip: 40.107.130.7, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLeO2/Pgoa62XClTzKOarzTkaD6N/nwkZui/aEF5rvfuE07zO7aHZqJ1dNGiGkptSNzNfpZv+cN3fsp/Gzc4hAmNwsCihYzDtZdKLs7t6wGXgc1nueCsg9UXVmXlVOtAsny1RnKEV+Lex8KYl5hYGEBXSUcLn5vWG9+FLvDZmHvc4GEj9+CI1C0ItnMDOHOqvMDnV2ocgQsQ9UetEQDFVDOBBtGJMt7rlLUHyyBHINpFrG7JmgCGE4K1PgVLDu2gDQYrQjoO5NDpwQfRBbVZQMvTqKm3f8P0HATz8Cyc0tv8apiUSo8f1G6jYqgszFy6Ph8/If2qoWo5eKOxDqNPwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oiDSVFmbIYA6Zy0SIuy7RfqzVyUXjcanXHIYVtyxYhk=;
 b=Qq1iPxM+zxnuuZmOW17gqDbBBB0SKX3azWzf7ZbcnQBBcDDrG9ow+ZsTMUJMODnIHJTeXQxrHAY1CRGI/xg4HzYYIeUrEFaHMXRkfw5PF1dbUo+usUo2C8a/MT6svqpr1Vm8uINyD/AIOPZsaM1kBKhFP0YLPeAIRQnm9LkxnGQoXPHsa0VW2jZENLuC79CB056aIY4AEeL8AhqQ/j5zPcGD8zxnCtoXqHg8tE7J8Pdj1OZplgaGRvpM7QIEMjwNZ9NFA8a9v3+uxmlPA7La79ZlOyd9a4+Lcaaj+r/xlWP2ERWLya1JhuhUKcC2hnjunUdHFtJhQUd2Yc8eMeY97A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiDSVFmbIYA6Zy0SIuy7RfqzVyUXjcanXHIYVtyxYhk=;
 b=ZYmJaP+jMOgqBju43ef+HPajX4Wlkg1GpycuKBayl5PFC63y5pIHXxY562ZgYMgQllcF4JkEIyG4v9tmotS0ttL0TNlI/FHqIY9eXb5/6LatYbVc8UUHr1WBQ5VmXcRylbHnqP+cpePcFH8axOcBZwauLLf+gbqEJNXVrCGNv2I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU4PR04MB10648.eurprd04.prod.outlook.com (2603:10a6:10:586::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Mon, 1 Sep
 2025 13:48:58 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%5]) with mapi id 15.20.9094.015; Mon, 1 Sep 2025
 13:48:58 +0000
Message-ID: <d8c8841d-ec9d-4753-9330-e39ae463254a@cherry.de>
Date: Mon, 1 Sep 2025 15:48:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs][PATCH] ref-manual/variables.rst: expand
 IMAGE_OVERHEAD_FACTOR glossary entry
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>,
 docs@lists.yoctoproject.org
CC: thomas.petazzoni@bootlin.com
References: <20250819160431.382820-1-joaomarcos.costa@bootlin.com>
 <a106fc65-b72d-4701-b1f7-917dbfe5bfc6@cherry.de>
 <e8d962a1-5b99-4ea4-83db-2a19acd1fd31@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <e8d962a1-5b99-4ea4-83db-2a19acd1fd31@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU4PR04MB10648:EE_
X-MS-Office365-Filtering-Correlation-Id: 593ed363-9a04-46a6-d768-08dde95e4ca3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kcV40ZAUOuAJa8pdBYNgveurdRNuNODkk/CrL2UjhETEZ1OxyR5kZkNWI/RC?=
 =?us-ascii?Q?ybS15u51zyh6LTMwNMPieNqxwVC2ZU9atJB9AtIsInyT1K4pqKCzeogaI5vv?=
 =?us-ascii?Q?9e/kPThFmFjtfJthQaowF5hRdeGEJGXEWZzGmKZJFL2K7jamzTDwUI3aiGPa?=
 =?us-ascii?Q?5f3pdyqspYWaIg+l8NzE9A0yOM5iTfmUYuS8t2krm8F+aGP3z1WEIDBYDyKk?=
 =?us-ascii?Q?L0/OmWXmd8S3jYz8FS/P0wB+Py0/6EDTOkHaDNQsVAVPT0McEPWOTgQzDrYV?=
 =?us-ascii?Q?11Za9LOTSKS5I19Lsxl+Lu0mX/6UVhNFHwgFzQY/5S7yp/MNYl+9WqEEc6pm?=
 =?us-ascii?Q?e9Y45iu+sQE8obQxGb/1zzByhxQW49OnaZHOViFCKMVHI2RqyLoKgz2KvnFB?=
 =?us-ascii?Q?aSPvz8xqb5OBAS+gXOhjV1Eocoz6NezwZWN9qtJLnxAqvHdEMF/ZcEVSkc4I?=
 =?us-ascii?Q?Gj/UQBZkBeLjkRA4pr9FwYLPq0CrriwSmjcDFu2MRhsq+crP6ZYW7SZ2DX7B?=
 =?us-ascii?Q?MFOQEMob7MteHvC9JtPcmwkIdS2Fn8Dz+jjg/FT+Zmp6FN4rhbIzCQu1/yVB?=
 =?us-ascii?Q?Egvq50tBJj34anFn8nrJ6kk4VQcagT26eSKmm0EHqxE6/mKO2sVUGPv86dZa?=
 =?us-ascii?Q?DvjI3by25xE3adjawCs956djoFJCfcp+KOCcw+7S5xe2jwzlaolkLKT0JIHX?=
 =?us-ascii?Q?lU9mGkQU2tMsDUiRZYdNCQhMvnoRd6mbcZhQH5hqwlis3qnbMr+s3OCWiBQW?=
 =?us-ascii?Q?FThBdEwnrojZEu8pnjNABOqgHKHIB7qc6SUBolQdH0h1IIpgQ6iljA25Tp3Y?=
 =?us-ascii?Q?jT4iFf9WgrwPbKQDWmvI+if4nJVEgc2zojmJ7n8SI4krj5KrThcPkeBfsakg?=
 =?us-ascii?Q?54PwgPOb2qnXUJiRmANnazClDKqQeCLPoIPCg0/+9ED7GOAu8xyA4JQlCLZ/?=
 =?us-ascii?Q?YNHxpTIW3z3s3e6PEmxGEh2LSOJW/gGtnmONqrke80+iwfsOyK6PnYd+QCl0?=
 =?us-ascii?Q?m99QwDzzkwSJ8gPXAOgeH2OgxhFk3KCZFpBMrZVGxOQ3LhwZqD5wwNu7zpfu?=
 =?us-ascii?Q?2OnluGOp3p9WenLtNzYoSSwwVcFRfs9qFrqovJcxmWge754HnMc/Snt6QSRN?=
 =?us-ascii?Q?7LtjHMBKi3bqb17cZqWY9QBZ6ey5i703WMGeTodl8hJwIfTLEAt67IvS/hCp?=
 =?us-ascii?Q?rmcb4r13NH5g7RHjhppSP84nEN/CG0uMt6d0a0TPoD9wPdoxUTpJ43KyUXgZ?=
 =?us-ascii?Q?oYwXv0WZ6VV8FHir0zDzGwiR5Hyca7mM1qgYdnHBbyutucsbJZc2D0Sg5zey?=
 =?us-ascii?Q?SZGXLrbGFzMMrGrRQAsnTLgMuw1JTj72R5tTw6pnQVWIv+xG3/DVmPJGffS7?=
 =?us-ascii?Q?BBZIfao=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B026MttUQxCHGUz6mxuUtRdvOueHTSsV45swKqGqbl97GIKBxQAdRtDvJjjv?=
 =?us-ascii?Q?qIb/rTLf4G+tiREIAfv+iAZk5mUQt3aREmB4WkB3vTfg2dWoSIhZCfhAVQx6?=
 =?us-ascii?Q?30qo0k4AQkKumfa5TNCse01+vlVXR1k1PkIzU47jP8oOuQIXpqhq5yFT+wYb?=
 =?us-ascii?Q?n9a6J3lwVbawuOav3V2biElQfJDMo1za89pECl41IGeBa/dGYJ7wbJr25x7b?=
 =?us-ascii?Q?+EbBGH42lhDIfG0HIBiXZf5C+xnn7HbCfRjK5XzDyVa8pEe7BQKa2cnFrgzI?=
 =?us-ascii?Q?xwRylkXvFBRKJsmJU9WXcqfMXCxdQ7RS28qj+YdoHKf0S53IDG6dbQliAPfn?=
 =?us-ascii?Q?/Qbv58UVOJTP+USYk9Q3k4bIJpdtWDV2lxnOyX9Wa/wXk+S5qSXuH4QBrqE4?=
 =?us-ascii?Q?naXN7LjSZlDj1bfxGnmCSORb6WHCQ7GdFD9h/0/5rjMnARxOaL6bWtVBVljZ?=
 =?us-ascii?Q?CsBS1IcbEfe4YplgNA+9mj6nMbIkF3LOwusY+8o8SdnutnjkvqpW9zRUefIz?=
 =?us-ascii?Q?Ycc2r8onqzZAl6hg1hJ6/N3706NLTzVt7Tq0ZJ7WV6kcmvsGwSs1unB8M+Ef?=
 =?us-ascii?Q?OhrLE/XFishxHzrOAi7cqCOT2hod+tnoeMh+Ic4te0RTuW+WHd1fh6VQg6Tm?=
 =?us-ascii?Q?sAxPa2OqxlucuA6MgZGlElnB+fujdOfZq6uBo/V6SgkbUlygQ+FYzIbU3Gif?=
 =?us-ascii?Q?eiWhg31b3hz5TUp3q+rV5JJDoSBgXc55/14TCIiIyldZ3cqHRNPz7Srw0bnN?=
 =?us-ascii?Q?bO774l4f5wZ3wHgz4nTBd1GZTrgoFwteqO0haQufzouU/SrxwjeWfCOcS5Fg?=
 =?us-ascii?Q?BNPITpAwLTj1Iv/RVMU3i+FNF4/tKFXOgmCj0uzvIK3kzlyQeBf483nxFDLs?=
 =?us-ascii?Q?QM3eJnZu53cgaYaPyHAdKOrIYMx5xHb3qda7Qi063oqUFKNu6cUujwWvmZfG?=
 =?us-ascii?Q?TjwQ6UzPMYAgHS4eMzVej5dTp79XQQ4J+sph3AeIdw8yg80TM6dWclWWhL3r?=
 =?us-ascii?Q?MaUwgqBU4crq3t1hMgmHl/yfne6QyhMWu2+3j0Ow7Go6Gb57XypG72VD8vLE?=
 =?us-ascii?Q?i/tlwvFyoN2vu6O+CJrgMCfv3Ebjjx5p9MC4HJWnHlecoUvG70PohVFTEblK?=
 =?us-ascii?Q?WagmcaTl1M5fIs0xEE/illTPzzye6M014Zs59d4J6PR+Hm/pwMBIFe/HMTfH?=
 =?us-ascii?Q?aG4F/1m7sirhl1MikSQf7aTm9GgESnk0LHgk8qCdi2uATGL0qnmI3lhZN3Ov?=
 =?us-ascii?Q?i9qaFCs18EgQHfAwrSBqOaWZGDwc6j5Pr4XFoP8FpqJinhUDaA54q1dq0RHN?=
 =?us-ascii?Q?+Efa+OIyogrNzAF5Tqh5MXIyuPoUbC2SCAhPc1KG1+XHRCtEjB9FVsEPim4R?=
 =?us-ascii?Q?Js0IHC9e+yj8sDBmlSLXN+mv6lH3r7WzYmsLmM6ZZZvPKPuACqbsAWjCIYkt?=
 =?us-ascii?Q?5l32s3wamyLhVnHQOOqH0NtPtgnIuqP2ZjBgiQ61pPMmHLoilRAPx4pK0P/+?=
 =?us-ascii?Q?fTTnObIQZd9bRZJQP7x76baKexIGBOH+1N53W34qUhWMO0Fh+DDTzIzJGRTg?=
 =?us-ascii?Q?tKCzQCfeN5u2zOQj/1GVuMQS4kfMQAqwLETJ+sDqUiUcElZVPmIKvEmVxYfD?=
 =?us-ascii?Q?lw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 593ed363-9a04-46a6-d768-08dde95e4ca3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 13:48:58.2257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBkCyEy1lWAcMlVa3k0R2yAgdWx80jYeXS+nNNuULW9reetBXwspgqjnMZseWhEhvSzVMhaO2UzL9JCY5twS6Zq+tvBm0qQLh5tVWf7/45Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10648
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Sep 2025 13:49:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7475

Hi Joao,

On 8/29/25 9:36 AM, Joao Marcos Costa wrote:
> Hello, Quentin
>=20
> On 8/22/25 16:32, Quentin Schulz wrote:
>> Hi Joao,
>>
>> On 8/19/25 6:04 PM, Joao Marcos Costa via lists.yoctoproject.org wrote:
>>> From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
>>>
>>> There's a (second) overhead factor applied in images generated with Wic=
,
>>> and this is already documented in the .wks reference. However, the
>>> IMAGE_OVERHEAD_FACTOR entry does not mention it, and by looking at the
>>> partition sizes (e.g. with parted) one may find it confusing that they
>>> don't match with the expected rootfs size (e.g. in a scenario where the
>>> extra space is "0" and IMAGE_OVERHEAD_FACTOR=3D"1.0").
>>>
>>> This second overhead is already documented, though:
>>> https://eur02.safelinks.protection.outlook.com/?=20
>>> url=3Dhttps%3A%2F%2Fdocs.yoctoproject.org%2Fref-=20
>>> manual%2Fkickstart.html%23command-part-or-=20
>>> partition&data=3D05%7C02%7Cquentin.schulz%40cherry.de%7Ce48ea4510efd49c=
6331b08dde6ced62b%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C638920498249=
508207%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIs=
IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DsVfz7=
%2Fa8eR9YyX71dpb05PmJIg3DKkpVRiIlVhaAMUY%3D&reserved=3D0
>>>
>>> Mention the '--overhead-factor' option in the glossary entry and add a
>>> reference to the wks documentation.
>>>
>>
>> I'm wondering if this isn't rather a bug than a feature?
>>
>> Why would we need to have two overhead factors?
>>
>> Also, I'm wondering if this isn't a case of:
>> - IMAGE_OVERHEAD_FACTOR for setting an overhead factor for the filesyste=
m
>> - --overhead-factor for setting an overhead factor for the partition
>>
>> In which case you would have a filesystem which doesn't take the whole=20
>> partition. I assume if you have systemd-growfs/systemd-repart it'll=20
>> take the whole partition at first boot?
>=20
> Even though I like the idea of having a partition size coherent with=20
> what was defined by those IMAGE_* variables, I wouldn't say this is a=20
> bug. I see it rather as undocumented behavior, hence this patch.
>=20
>> Both would have a valid use-case. I imagine that it'd be perfectly=20
>> fine to have an overhead-factor of 0 for a filesystem that already has=20
>> an overhead (e.g. for journaling).
> A "no overhead" would actually be "1.0" (since this is a multiplier),=20
> not "0.0", right?
>=20

Correct.

>>
>>> Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
>>> ---
>>> =C2=A0 documentation/ref-manual/variables.rst | 5 +++++
>>> =C2=A0 1 file changed, 5 insertions(+)
>>>
>>> diff --git a/documentation/ref-manual/variables.rst b/documentation/=20
>>> ref-manual/variables.rst
>>> index d559899c6..c18bc7ba4 100644
>>> --- a/documentation/ref-manual/variables.rst
>>> +++ b/documentation/ref-manual/variables.rst
>>> @@ -4166,6 +4166,11 @@ system and gives an overview of their function=20
>>> and contents.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 added to the image by using =
the :term:`IMAGE_ROOTFS_EXTRA_SPACE`
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 variable.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 When using Wic tool, beware that a seco=
nd overhead factor is=20
>>> also applied.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This overhead's value is defined by the=
 ``--overhead-factor``=20
>>> option, and
>>
>> Gut feeling says we shouldn't us "'s" here.
>=20
> Not sure if I got your point here. Is there any link between the "'s"=20
> and the possible misinterpretation?
>=20

Not related no.

It's just that "This overhead's value" sounds wrong to me, but I'm not a=20
native speaker so it might just be that my intuition is wrong here :)

Can be easily replaced with "This overhead" if you want.

>>
>> How this sentence is worded could be interpreted like so:
>>
>> "I do not put --overhead-factor so there is no overhead factor"
>>
>> whereas what actually happens is that the default is 30% if this=20
>> argument is missing.
>=20
> I'm not sure about the likelihood of this (mistaken) conclusion, since I=
=20
> refer to it as "a second overhead factor is also applied" rather than=20
> "may/could be applied". Maybe replacing "defined" by something more=20
> bullet-proof? I'm open to suggestions.
>=20

"--overhead factor option, which defaults to 1.3 when omitted, " for=20
example?

Cheers,
Quentin

