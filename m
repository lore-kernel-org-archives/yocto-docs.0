Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4817D4416E
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 15:15:10 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.76])
 by mx.groups.io with SMTP id smtpd.web10.23459.1732029305774041918
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Nov 2024 07:15:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=fHf6xm14;
 spf=pass (domain: cherry.de, ip: 40.107.22.76, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhqwGQNi+OrAdAyS+d+urXx81uqSRyKMG54313uditx+5grMDaO8IN8kDjgxh3ay9sj/pC2fUTgv1PuyHeWqHjqpPz6jzD+ZKlLlED6gK+2Y8WYbFlaucd6L/wsXEzrX5bwPCiR9ktXMev3xW2yyxfV8UtXd3JvskPKRs1NxF2wuKYm4Pt1KzZOJFAzM68TeN2TfDM8cdO/C3PXoIK8r6VjJ9ALEoE9dm0z8+73mQp7IVf5Mz7iV0ba/3JCzPH/LbuffnOXz/QywOnVi5VC3LmOEHZiYWUGTUKixzIWajdOPprmHDVZUxo7ZfFShPvFkmBNfMbl+Lk6NN6f4BRQGgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNJlFJxGAPrmPxaDmSjqeCtTPa7hhuznfVVVMp01YMk=;
 b=vfMB+3C+XBh8Nj6aabUxmhn8pcCAfZktwvdVkXGHSqRdN6fdmftCRs4lh5pVyWGEwJXvH1wDxH+U1M+qJj86tacrmHguqFWRPUUv/fbFxM3TPtbIp+r9Ot46HbCy0yWYx4ZeoiRdKsqf2L7XNdfcMguTvGm75kFzjkvLdBdtfMLXURhhDmVnSsG1k2gaC7rIO9nk2eMQp18GH5hzV5bvf9SiprktUbWXF6U9/7nmx5v+uh9TT1xGspCWJwYRqkJ7NYHqpTTUfVb2gF4VhntAgEPMSikxBULp05nxh+VzD5Rc3dbm3YX5JHtn0ro8jzDLI6XU4hWqDqGBpuZjr65Oxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNJlFJxGAPrmPxaDmSjqeCtTPa7hhuznfVVVMp01YMk=;
 b=fHf6xm14C+cMInR15BLPTq4cDvXneUVV/WlQmGT36nB+/RU7/gcwrkVYOgeIJxmQXnMIbCG9Qhno8rRF5iIjwPFONED4XXhRhFp4Rgrby6X9MX6s10Nxwczre1og29LNnpRhTbq0Nz2Kp5+2MZfccQWaipJskLWQl0pe2AUAQk0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8194.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Tue, 19 Nov
 2024 15:15:01 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 15:15:01 +0000
Message-ID: <82c3cacd-edcc-4385-8403-3e997e2650fd@cherry.de>
Date: Tue, 19 Nov 2024 16:15:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH] ref-manual: classes: bin_package: fix
 SRC_URI example
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241118-fix-bin-package-v1-1-906f0148fdaa@bootlin.com>
 <5b61d56f-b04f-4fa0-8249-83c605036726@cherry.de>
 <D5Q8XTH54W4A.227VGN0AOS29E@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D5Q8XTH54W4A.227VGN0AOS29E@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: baf1e6c9-a7b9-4fa1-711d-08dd08acefe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YEvIHeIAkKUv+261ayB73JGrRFWHPBO3nBhRmQwwHxmYLS4KRb91hLT0mYTu?=
 =?us-ascii?Q?6wcJmfQz6MonXjn89T5ceJ5ssswvfBo3wKFRiM9euGJigIB/n4jbzKDd9s7I?=
 =?us-ascii?Q?RuLWe+J5k5rxNvHfVC5O7y9/4NAU2zHUGOVO5APAH4RB0V32SNNWoBlWp0I+?=
 =?us-ascii?Q?ZVNgRnheNAKDFGK5HUL8CgqxsEY18KaZ9TvmRnw8ClxhhDRdVVUxt+QA7Wa1?=
 =?us-ascii?Q?D3B6yWGxPR+ugL8r5qbGzD6hC1MEah4tDL8YjX4u+Vj6GpN6Dm7f5fOK2+sW?=
 =?us-ascii?Q?UbbRg2RzanKVszTZno8jgURjF++GscVAOH+Nvx865aU/nyZL1kLuic7dDfqZ?=
 =?us-ascii?Q?8pvSnpbHw/9TdFdOHNlfEX5Tzo9M8pvecqy28Ac4LZiM+SDrOkHbT41rzE/1?=
 =?us-ascii?Q?oh+IaSlgDOT9zhzkv9d78jFp+J85MgtV3OmN+z5M6LXIDp9BXvEnAoLyqGFf?=
 =?us-ascii?Q?qBbfH1cKY22ypDNMKEDl8tRmuksNJ7jUcOkSXKdW804VoyTfFdCJeP22sdg7?=
 =?us-ascii?Q?p4Y7meU/PZ7xlWTorOCryxUs2PFV/EjtUJzPIIcAJRv2u/iByK/ft3Hcc3Nn?=
 =?us-ascii?Q?qeha8VdxojLUvj4Xm+WF66oBz54UinEOavMQFfputIbpBGYcuQmaVCHMuGfj?=
 =?us-ascii?Q?FFlCQeCKtCAevVcsQVVD/6DOIQ6aOyQnpFE043UYNHUd//SPyuhdCuOj11fb?=
 =?us-ascii?Q?ykqaj8UrJOry0okfW8hRO7kd+WnAvEZQHcgjE9E1ZaV6oMO+49b8BESLrhMM?=
 =?us-ascii?Q?RhkLsmifS0w3uVAjm1jw5YY/Hx9Z7Gm4hi8qdyFCoUx4JnMvCAJyqqGc9ukA?=
 =?us-ascii?Q?Otn78xP9IoQ3nfzSNLYa93+TIQ3WeUF5+XNrWz4Wfh91Fn2PQMqajrprxBP/?=
 =?us-ascii?Q?uAX6vsbHcc+zXaDtDcH2ntd9JTXJBToFs1OzKbhnyl3WJjIMMDZHP7Dsz3Me?=
 =?us-ascii?Q?Wjjh3X1jYFhFqOLhC4iC8NZnPvHEdFFupFUFyEYNeMTJ+FRFLy4n1J/BCzME?=
 =?us-ascii?Q?XioTAYkP2xxlHnp/edqJ6rO4wiRu9xL8AerrJo8u9PR23oLMRKYM0bHkLSqe?=
 =?us-ascii?Q?+TKdnnX9EmJGOsVgRBTN2/mC3r/k/i0mIX42gV7qga3izqpyO3ED0RDMJJGh?=
 =?us-ascii?Q?8+ZyMveyk8vsEys+upQZM1x92qDbNowN6CSZZpuYnN/HSbSVFUwgLP5ObX06?=
 =?us-ascii?Q?IYc1SyDZLHzRa/wQPN45lwQ93GzjTPB5tK7Y+IZiLOtWZoTtxjGT9UoMX5cj?=
 =?us-ascii?Q?ST+hqz9Bo8P2v/s9edF/yb/qV8AzlanFRH4iRg+PbrKWLO5gdnijPanxLfSD?=
 =?us-ascii?Q?7Jf6cKox1nz4UiOezFWobW0X?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tOIkfzwEqeXqPchRA/1WCnJyTp6wpwTzvYwOkT90+RndQ8o5KOaTscCAD34C?=
 =?us-ascii?Q?8ga2zeeosXt0KdO/IQlvo6IrR9HzcdWmA9+A0Ix2Z7ViDhqqpgGo9A/UwYRk?=
 =?us-ascii?Q?lRoM2w8Mt2Kn7BpXC/6CCJ1e5ZTy+fS8au4dRdU0lBKTkY6HXhsVQOZebZt/?=
 =?us-ascii?Q?tMl9RHpYjUngYe6KQjtV7waKf49raV9dMv/fnYoViRsMkKQBy9chf4mTpFm+?=
 =?us-ascii?Q?TpOYaoe3n6VCGUxXfd7VizokczyTdm5e5iDTFPdlBRpgxDYfuOwcC2C9euJp?=
 =?us-ascii?Q?WYswMwJnhCrVqc3tyv2R8PfaGB2pdJU9rvd4un/t9FCgbMlOqclU1ER3WyHY?=
 =?us-ascii?Q?LH9VKUQLPGC2NUF+fENuifsAe9O/ztc2n6S//hD1mVbU7CXAKqP0WaYDrBbX?=
 =?us-ascii?Q?l0bWtvZoxY6LLELqRcadrtAzo7Jc0SBfWwBJZn8A2sp9UH4byu6DEB0ogceB?=
 =?us-ascii?Q?LS1JQ/gElsJ83QYo4/jqzAM2+OXB+XGaITqKiTmVpGhwII7bbPL8+pgWx741?=
 =?us-ascii?Q?X3Ya+ZlLxM6yXNfCzqPSHqtzrr+RzAOQ6e/T7pPwO5BAgojLbzp5TFVpfn7D?=
 =?us-ascii?Q?Sn2W13WuROUnjHGSXReCFo3psoevTRnX/0RZYCHdtlSYh6yNmUpEUJjpgrUJ?=
 =?us-ascii?Q?EubdSvmaX/h60thLnfxoUSVuQcBdSWmJcF/Rpr1+Ka7cpF5rNXthZ01I7LD6?=
 =?us-ascii?Q?oF9UA2Vi9q9g9nCXy5CXznLjpn7kxRZBldsnrj4vGRsX+dWCdbjFvFhGcev6?=
 =?us-ascii?Q?Ts+En2U6nFjqaNJH+5LG6Nl3Uqnj0NI2k9GJkBifngW+xlSyfxlYNF6Mf48h?=
 =?us-ascii?Q?l0jqRZnhxZaPdQtPPn1hMZsuof7ardV3hvTRqngY8TvnnkPze7de2E1V3ipg?=
 =?us-ascii?Q?usxGCw5oV5kaND+6P9sUXhN8u1nIJksZS1NO8tpH7pwYB4CRZU+MNgIip2vZ?=
 =?us-ascii?Q?BYEv++VhjdmQTjrF4cizPzDWfBDCINy+4Hb4/KUyrxsgskBqFi+34J8f6CMB?=
 =?us-ascii?Q?pM/vztO57CcgBKA+ygUxnqmYBhBGPiVR9AsqrrIxC9myaSvnD1KHmknKJRwx?=
 =?us-ascii?Q?PxT6SjWR/95itgc5eo6SFipzlBj+AuneVUSJRorvdpEP0/a6McZa5C8Jvkku?=
 =?us-ascii?Q?+ICKrYgXeu38CcxoI7zWSI6kh5CCVfsNg0kSgYlFgzUoUrcUQ3bobWeciq4X?=
 =?us-ascii?Q?aqZda8e5C1YbsHE/Q3rraK/Qkt6IbA9CH0O68vOao4E7/O4/wWWS+ACqpcTp?=
 =?us-ascii?Q?SN/0GK7+qBYiyuA0p5s+xeCwDoTFINvnMZPK8aZswzwIZqHcwOsla1RW9SF1?=
 =?us-ascii?Q?Td70B57KDcYl1EcoM1NXShuCdDx/esvY0F63eZ7Etjjkgyxh2HRFj8z952Qq?=
 =?us-ascii?Q?VTz1qa4c04Mgm/QVgGSWYa5BODCPiQMnQ3RyaZldieOp83pU6TyoiImeEPIT?=
 =?us-ascii?Q?ZEniGfvQxGjVrbvK9HBAV8FDyixeNbhJZiA0Ks7/S5LEpEzKYf6chIyheDa/?=
 =?us-ascii?Q?QFjmDp3zlRZM/Ky+SLMDPubbKR+dxk6pkDPesji2QQ4F47W+Rss+nm46BW1d?=
 =?us-ascii?Q?sqHH1grMSx2+vH3XSu927nWjio7GhHr9eOaNH7+f?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: baf1e6c9-a7b9-4fa1-711d-08dd08acefe2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 15:15:01.1461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ESicrgeORRYroq6mebOvNW/ndemFOMf3DJW2/OM9PRIUns7ZRpn9eEWM8sQXNS6QF4gxzjCLJhqnbJWjLkx4EJ54E3fq3/uVEwq957tpSOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8194
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Nov 2024 15:15:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5769

Hi Antonin,

On 11/19/24 4:05 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Hi Quentin,
>=20
> On Tue Nov 19, 2024 at 10:38 AM CET, Quentin Schulz via lists.yoctoprojec=
t.org wrote:
>> Hi Antonin,
>>
>> On 11/18/24 9:46 AM, Antonin Godard via lists.yoctoproject.org wrote:
>>> `subdir` is the correct attribute to use for extracting the package in
>>> the correct directory.
>>>
>>>   From the bitbake doc:
>>>
>>>     subdir: Places the file (or extracts its contents) into the specifi=
ed
>>>       subdirectory. This option is useful for unusual tarballs or other
>>>       archives that do not have their files already in a subdirectory w=
ithin
>>>       the archive.
>>>     subpath: Limits the checkout to a specific subpath of the tree when
>>>       using the Git fetcher is used.
>>>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>>>    documentation/ref-manual/classes.rst | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-m=
anual/classes.rst
>>> index b92f4e4f20ea8f702c90f4e3d29251b2461d07d0..2ac94630d80386cf613222b=
70f7bd6323b9948f2 100644
>>> --- a/documentation/ref-manual/classes.rst
>>> +++ b/documentation/ref-manual/classes.rst
>>> @@ -176,7 +176,7 @@ example use for this class.
>>>       are extracted into the subdirectory expected by the default value=
 of
>>>       :term:`S`::
>>>   =20
>>> -      SRC_URI =3D "git://example.com/downloads/somepackage.rpm;branch=
=3Dmain;subpath=3D${BP}"
>>> +      SRC_URI =3D "git://example.com/downloads/somepackage.rpm;branch=
=3Dmain;subdir=3D${BP}"
>>>   =20
>>
>> This is not enough, subpath is mentioned in the note admonition just
>> above a few times, those need to be fixed as well.
>>
>> Additionally the wording is weird for the bin_package class.
>>
>> "class is a helper class for recipes that extract the contents of a
>> binary package (e.g. an RPM)"
>> [...]
>> "For RPMs and other packages that do not contain a subdirectory,"
>>
>> Maybe we should use another example of a binary package (e.g. a .deb
>> package) in the first sentence?
>>
>> Also I am not entirely sure what this example is supposed to show.
>>
>> SRC_URI =3D
>> "git://example.com/downloads/somepackage.rpm;branch=3Dmain;subpath=3D${B=
P}"
>>
>> This is very confusing to me, is this really a somepackage.rpm **git**
>> repo? or was this a mix between fetching via git and unpacking an RPM?
>>
>> I'm wondering what we were supposed to show with this example. Is it
>> about fetching an RPM from a git repo and only extracting a part of that
>> RPM? Is that even possible? If so, we probably want a combination of
>> subpath and subdir? subdir for the path internal to the repo to the RPM
>> and subpath for the path internal to the RPM to extract?
>=20
> Actually I think I missed the point of the class description at first. It=
 seems
> to document how to fetch a subpath of a git repository containing rpm fil=
es=E2=80=A6

Would the content of the rpm files be extracted if they are fetched by=20
the git fetcher?

> Which makes me wonder: how often do you need to fetch binary from git
> repositories? Probably not often.
>=20

Probably not, but not THAT uncommon. For example Rockchip provides the=20
libmali binaries mostly via deb packages (they provide "sources" but I=20
was unable to compile them into something that works, so....).

> I would have thought a more common case to be for extracting a local file=
, or
> fetching a file over HTTP.
>=20

You can still want to version deb/rpm packages. But I think it makes the=20
example needlessly complex, though we could still keep that example for=20
this special case (provided it actually works).

> So I guess the description should be updated to give some more examples, =
yes. I
> would even remove the git binary example, as it's bad practice to store b=
inaries
> in repos anyway=E2=80=A6=C2=A0What do you think?
>=20

I think it makes more sense to store the binaries in a git repo than in=20
the layer itself and properly setting up an HTTP server is not=20
accessible to everyone (especially if it's public, GitHub/GitLab is a=20
pretty reliable source for example).

>> Or, we should provide two examples, one for RPM downloaded from HTTP for
>> example, using subpath, and one for a directory from a git repo, using
>> subdir?
>=20
> Actually: you'd use subpath for the git repo (to extract only a specific =
file
> from the repo), and subdir for e.g. a tarball, to extract it in the right=
 place.
>=20
> The current description of the class is really confusing, I'll send a pat=
ch to
> update it.
>=20

At least we agree on that part :)

Looking forward to it!

Cheers,
Quentin

