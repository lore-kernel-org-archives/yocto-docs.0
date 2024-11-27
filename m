Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9014AD6ACDD
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 14:16:00 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.80])
 by mx.groups.io with SMTP id smtpd.web11.72719.1732716957402042738
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 06:15:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=UZwG6xuh;
 spf=pass (domain: cherry.de, ip: 40.107.104.80, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JkV62yC4OyuRonVjTP0Qas/Sjma7KZZ6/frkaAq+ZxkgRKRFk3b4jQpdkyRfj/cexChX060SoxrKPt9tp9yC/Oo5PAbtTizzAfVw7tb8oV4LPBL2U+h+JaptVOwLdl09nu51nDy58c6pNFudufUDmjX06/wSZGEg8zmihol4sfxWIllo5cOCFWVIoPc5NCIiGz8N3uQb1TtyB6buxz2wYNlH2zvxrj1Ju9gGTHjsGk/xGNC9NSMiMoimmcXB/brLdykL0ZwvGMpx4VKzPhArokmPF1s6B05/KRaAhho7FsYo8IRGT/28HNUqRZ/fQyL2y/+kX+PNn7Notaw+wheqSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZ1wEMb+FU6quuOCYP7vUUWiQwLK8pyPCociogBm5h0=;
 b=ny6qVETIVz1OcXKnFs0OMr8rbcOg4vIWeEyeZ9XCp4zw6woVd9mZa7bU7dYIYntyLDs0QimPc5gxhcyTQoRRTHO/6zMJVaG/bgHer9vu9MMSPO25LxWLbJfcaItSRypKCREnJNNfigQACH2aBjeWhmtnZzn4hnrjX0OZRmWABONC5b2FYP7o1SJQ1++UotjS5XAYDGxlLoFFR1YWXhKc3jqaKQuR0dXM+j0Bbt3osAP1O5Wbry/sDAfB6oq7T/Zd+e1P49xbmfMZTtIcciC3CDX6Ti2NP4uujmGzYxBwzz1T5IpsA1e3fbHpWulu1Z3DXUB1jzZRHkw2WA9B3YacTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZ1wEMb+FU6quuOCYP7vUUWiQwLK8pyPCociogBm5h0=;
 b=UZwG6xuhEKn+RvVYIIEtBF3CSJ39bHlE7qunU2bpMGrJ35Ic3ObMCs57T8PW2pTMSLeOeMFJxvIhDEHoUrja4wT7cMp8aA441HDbURMsiVQpSmOgXvqWh3yHyhtbT2NfSUp9049d29waI/43HZNiod3e/k1e0QGjeRn6oJNEaT0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB9915.eurprd04.prod.outlook.com (2603:10a6:10:4ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Wed, 27 Nov
 2024 14:15:47 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 14:15:47 +0000
Message-ID: <0cf6ce20-4e81-4f80-8065-01558fffa52f@cherry.de>
Date: Wed, 27 Nov 2024 15:15:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs][PATCH v3] ref-manual: classes: fix
 bin_package description
To: Antonin Godard <antonin.godard@bootlin.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 docs@lists.yoctoproject.org
References: <20241127-fix-bin-package-v3-1-ee09055000ac@bootlin.com>
 <0b545655-dfc0-449b-8cdb-5712a0715f87@cherry.de>
 <D5X02UDHCLWS.1H3RX1HY2T7UP@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D5X02UDHCLWS.1H3RX1HY2T7UP@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1P195CA0054.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::43) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB9915:EE_
X-MS-Office365-Filtering-Correlation-Id: 731a2a31-db5a-4aaa-9dd8-08dd0eedfcf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pv7XhE/keDxXwcVVzt1f0StNZsSyhYfPWv+oC8s1dOgpm/crw2LPowzfDbc+?=
 =?us-ascii?Q?25uuVCKI6gsjXFy5ErEmph687Y0bwmXM8kV3jDjZIi433Yo+FmZu5q68Pd63?=
 =?us-ascii?Q?+0V5fwQFzFvBnZWi/VYmsQmthil5b7Tt/tAXUEoxGRmexUZPArieGWH5zP3c?=
 =?us-ascii?Q?5DyVK5kG7uzz0ZZX4zBRd/wb84auwJv+fsxARYa3Y+ENlKfLFhQHiP2oN2Zo?=
 =?us-ascii?Q?IXjwsFEvRiPlGYiky3Hl8mlBKKospRVvFFi00uX2I3y2JqJeQdqexRQzbpaG?=
 =?us-ascii?Q?9/xsmW4YABa+/e8MYX544Lhhk3Opk7gbUDtxDKMiMWD7DQ+Pa4upcDx43f0i?=
 =?us-ascii?Q?T5r5wFi46Xdb2SALzhhpiOk35jMyQ9SnVRbED/1a3wYYezvj5uyaZjq6t7Lv?=
 =?us-ascii?Q?Qyu4jqtMNzCaW7/PYyVUmHupoSp5+5NQgTZdRhyM+gHF/hhrXNpbk8kIAkKw?=
 =?us-ascii?Q?/fX4sSq/y9UWPdfqiqWKp3s4V3NHNsaSSdPrx3cIUksZsTs/GSxUYQKOmfq/?=
 =?us-ascii?Q?OKQTvly9eajUpVcUHn9Ib0rxqLttlDr5MzjgW8u2K6mwIgug30LuLlvAJgRM?=
 =?us-ascii?Q?C/HALtlURyVQBRWwVZ7YiUFnobMIDU8IEzdjO7VVl+QZtYwVzDGvLraicp2R?=
 =?us-ascii?Q?TojoTZI8vlAFNq7aTDP+bwZcUsro4S7fIzPtEpzmbAcygeJ2R/ik9AHILciS?=
 =?us-ascii?Q?yCDbGosOma1iCnfVhPM4UIKQh5NC3A+sINc9tK4s/Kw183QyJNpKBFHB0txa?=
 =?us-ascii?Q?xbL97HyTGT8QWnfXh4VvhUX9R2ZvGC9HQ4aO6Rfe5eFkjwvQRJ7KS3y5zeBI?=
 =?us-ascii?Q?RXCc0IMwcNNSkKbZWVAmjYje+sGQ/+38BK9iAH+RDPlIbyW0PxgyAtJNJ+Ih?=
 =?us-ascii?Q?/DnpVuNaN8Du/WViKaPrL94NEa1UkT6FUdaJ6UBU1FmWMr0/24qXvVNyHouC?=
 =?us-ascii?Q?PcI+2MX0lQn4QVWMUDCFBPEl7eLrh1MfAEXSTITzgFoOvVosqhkYotwa6Lq8?=
 =?us-ascii?Q?RO0WB30EYDHB4iMwiNivZTruvCr82aQeG6MWmNXwSVBCf0R7rC/0GtPVoWc0?=
 =?us-ascii?Q?XVQXQ4uAZArA+9se7nGpixTTj7VR0wqetON7cWaxcbbPUKoGiGwF8zkdXQMr?=
 =?us-ascii?Q?B3MJuSnltp5MFCWVx5mSRxIOKZLc4+pJcRLD4tDnnsp6sfHFMHqjnTY0mkYA?=
 =?us-ascii?Q?SSDNigrAhWCylbkABSEGPs4ASC+ANn3xbFoCObIhqKZPgv3Gh0wHgn5e1nA6?=
 =?us-ascii?Q?PcHOs84Jq5/52BrPOFyg8p/DCt7Kw+tB6cdhwObW9RGM9piRnMFlSnCnjHeX?=
 =?us-ascii?Q?u5E=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FKDRHtuh+moUY6Y1xMaaBO7eIy1YOAs7n4H2HCXDlNF2Y96A5ZhEccyHHujj?=
 =?us-ascii?Q?Y+qBEh8nmrhYtWFcWMXhTW4LSEf1Dn6rtgNNEN0fQEbMPNbO/toBL7MTPIf8?=
 =?us-ascii?Q?7xMfUT/g2ckXdRuFEoBM2sxPFGi7aMS1tU0ulVQ0kj366EzU2GBSH+x2HV1V?=
 =?us-ascii?Q?DnLuT0hc6RhWrcl4eeZc0pMuBZ8DvKrairEevod7VaFKam3b88d06cEeiRAz?=
 =?us-ascii?Q?iHzgar0UPKC60MWAxZfFVBKRoKH6UxtIfM6fXHecL8zqjKdS/z2hv+tXRQSo?=
 =?us-ascii?Q?mJh3akzpfi1N0/lwP202kTeQaxKAmbA76vwDSzravCe5TmAsZDniYRMQUED+?=
 =?us-ascii?Q?JcxO+kbcun4+U+Ri1TIQlCGlXgt2NiflbFE5BBuwEdo79lcskbrSIq5j1HXb?=
 =?us-ascii?Q?7siMUm2CS9s1wp32KDYJizCUX8Xs1YfBsIupslbMrFHzOzfHo0Ae1XXN0NfE?=
 =?us-ascii?Q?TE3HOSx7yZXZMIBPVlcmWNRGfHwsWUERERd1vN2zX73Mo9Xwri5Wj8jFYW10?=
 =?us-ascii?Q?0T1XPpEBxkzQmcUqobQOpovDAMCjc7lZULMGRRHVs8UsHJCY6c+ejbD/Gofn?=
 =?us-ascii?Q?BL8rI7FFjUpz+deJyupu6/funsELbWoEsmCYJ2uL0dHQ7sqANREOdnxZeV9u?=
 =?us-ascii?Q?Wd8eWFA1WcjHpgYCeZQMa6eipOLQNhX/1pU8+cF2rmLZaoZBQHBYc94L80RA?=
 =?us-ascii?Q?gyeRL+aLfyMfwtyvBY1qM3iVehkap1YYPKIMlsVTf5n9mYCu/Qz+/CnE9zvc?=
 =?us-ascii?Q?skQIJepzRRC8QnyhnECPodcVaOK173F+zSx1P7vVMoYwhYtiRDM8hNYe31Uz?=
 =?us-ascii?Q?SJlfb1pusgrYcrU3DuS42injvE6atH87SDv8mKpof8G7OdUscCPCkvctjLMi?=
 =?us-ascii?Q?0GNSolW1ZEnZHiBugjX7SRnTp5dh21lLALcJJ2ld8IPwGGBosSKpx8xlj7j/?=
 =?us-ascii?Q?W76/Fv1+T+39SaWrOvKTjVYlgf7gQUW5Kqi+5XTyOyjeb3zaQeC9GhF5cm0l?=
 =?us-ascii?Q?2EOnrDc7kNB9ct+juNCpeIcvS1Pi9ijxZXIIu89eXSsUyeUVNHO6sHS4lSjS?=
 =?us-ascii?Q?MGrq69YzNm1ACUbd7vjCkIwEpMIOm8wT3fBL1wWgdwzRN5FqeC3J+Rlp77pI?=
 =?us-ascii?Q?C4TPKEpLOdiQ4ykgcTM93+dNdCuABRTNprA6W7Hpx7ppptquIKp39zC97RtJ?=
 =?us-ascii?Q?8xDM5WkUk8nXAJBMAbKLSYNj1AYiq83r5WD7YWvmpII2OCsDbrKiLa2QEMlA?=
 =?us-ascii?Q?RzGEyWRNCCnfFZtY1bF2JaPdDayLebdwtIJ3NQgIhY/9rWS+FK9/pH6blzoL?=
 =?us-ascii?Q?2/1LZykvVkUMoxD/TuMhvuQfL0xEvi+v5r5KkkW/rqFuyKKuspceNIr0YILv?=
 =?us-ascii?Q?Ilx9Bp2c+WFGl40PVWVOLI6QysW+3g2tT6SvQScpYEN0BieBUTyAZ3/rukqu?=
 =?us-ascii?Q?ME4cbzCXIi9o/oZpYPij2IeE4CFRNCHsWMvoG8kirP6ua3VUi9NFAEfRZgQR?=
 =?us-ascii?Q?PlAaNSyjwHzXIGj44Pukls/o/SDt6Ie8+TrunMr09p8Oz0JsRi92PgqYmVxT?=
 =?us-ascii?Q?1ewPu8/9B3puVJOgLZAOB2mnAVUxBy5pxjgdb4M2QXnjq77VYUvd+T3nENqo?=
 =?us-ascii?Q?f0mgJQng0IV0D5e96zSojzs=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 731a2a31-db5a-4aaa-9dd8-08dd0eedfcf8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 14:15:47.2965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FqgnNKeOPdUaf7kBhJdmhKWzlttGmxne5sHLM2fkU2YGAcqjf2EkHeVPTUpQMUG+6HDZIEPVDvMb09bGBSxVj9KiCwo5paNHLsZMDo5P7zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9915
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 14:16:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5836

Hi Antonin,

On 11/27/24 2:37 PM, Antonin Godard wrote:
> Hi Quentin,
>=20
> On Wed Nov 27, 2024 at 1:36 PM CET, Quentin Schulz via lists.yoctoproject=
.org wrote:
>> Hi Antonin,
>>
>> On 11/27/24 12:36 PM, Antonin Godard wrote:
>>> The previous bin_package description was confusing: it would instruct t=
o
>>> use the git fetcher to extract the content of an RPM package using the
>>> `subpath` option - but that's not possible as the git fetcher can be
>>> used to clone a repository but not to do the extraction.
>>>
>>> Update the description by telling what it really does and what it
>>> doesn't do, and by giving an HTTPS+RPM example.
>>>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>>> Changes in v3:
>>> - Actually explain what bin_package does and what it doesn't do.
>>> - Link to v2: https://lore.kernel.org/r/20241120-fix-bin-package-v2-1-9=
17a5c2745d2@bootlin.com
>>>
>>> Changes in v2:
>>> - Instead of updating the example, update the description of the class
>>>     with a more common (and working) example usage of the class.
>>> - Link to v1: https://lore.kernel.org/r/20241118-fix-bin-package-v1-1-9=
06f0148fdaa@bootlin.com
>>> ---
>>>    documentation/ref-manual/classes.rst | 42 +++++++++++++++++++++-----=
----------
>>>    1 file changed, 25 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-m=
anual/classes.rst
>>> index b92f4e4f20ea8f702c90f4e3d29251b2461d07d0..ff9979d1f1ac0afb0ee59fc=
d193dec2c1323e1fe 100644
>>> --- a/documentation/ref-manual/classes.rst
>>> +++ b/documentation/ref-manual/classes.rst
>>> @@ -159,27 +159,35 @@ software that includes bash-completion data.
>>>    ``bin_package``
>>>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>   =20
>>> -The :ref:`ref-classes-bin-package` class is a helper class for recipes=
 that extract the
>>> -contents of a binary package (e.g. an RPM) and install those contents
>>> -rather than building the binary from source. The binary package is
>>> -extracted and new packages in the configured output package format are
>>> -created. Extraction and installation of proprietary binaries is a good
>>> -example use for this class.
>>> +The :ref:`ref-classes-bin-package` class is a helper class for recipes=
 that
>>
>> Would put a comma after recipes so people don't think it's for recipes
>> that extract the contents[...] but rather that the class does it for the
>> recipes inheriting it.
>=20
> +1
>=20
>>> +disables the :ref:`ref-tasks-configure` and :ref:`ref-tasks-compile` t=
asks and
>>> +copies the content of the :term:`S` directory into the :term:`D` direc=
tory. This
>>> +is useful for installing binary packages (e.g. RPM packages) by passin=
g the
>>> +package in the :term:`SRC_URI` variable and inheriting this class.
>>>   =20
>>
>> I would also provide tarballs as another example of "binary packages",
>> not sure how to word this though.
>=20
> I'll add another example afterwards.
>=20
>>> -.. note::
>>> +For RPMs and other packages that do not contain a subdirectory, you sh=
ould set
>>> +the :term:`SRC_URI` option ``subdir`` to :term:`BP` so that the conten=
ts are
>>> +extracted to the directory expected by the default value of :term:`S`.=
 For
>>> +example::
>>> +
>>> +   SRC_URI =3D "https://example.com/downloads/somepackage.rpm;subdir=
=3D${BP}"
>>>   =20
>>> -   For RPMs and other packages that do not contain a subdirectory, you
>>> -   should specify an appropriate fetcher parameter to point to the
>>> -   subdirectory. For example, if BitBake is using the Git fetcher (``g=
it://``),
>>> -   the "subpath" parameter limits the checkout to a specific subpath
>>> -   of the tree. Here is an example where ``${BP}`` is used so that the=
 files
>>> -   are extracted into the subdirectory expected by the default value o=
f
>>> -   :term:`S`::
>>> +This class assumes that the content of :term:`S` already contains the
>>
>> """
>> This class assumes that the content of the package as installed in
>> :term:`S` mirrors the expected layout once installed on the target,
>> which is generally[...]
>> """
>>
>> ?
>=20
> I agree, better wording
>=20
>>> +installation paths on the target , which is generally the case for bin=
ary
>>
>> Spurious whitespace before comma.
>=20
> +1
>=20
>>> +packages. For example, a RPM package containing a library should alrea=
dy contain
>>
>> s/a RPM/an RPM/
>>
>> s/containing a library/for a library/ # to avoid redundant "contain" ver=
b
>>
>> s/should already contain/would usually contain/
>=20
> +1
>=20
>>> +the ``usr/lib`` directories, and should be extracted as
>>
>> s/as/to/?
>=20
> +1
>=20
>>> +``${S}/usr/lib/<library>.so`` to be installed in :term:`D` correctly.
>>> +
>>
>> It'd be nice to encourage people to use versioned shared libraries even
>> for binary packages but not sure how to word this here.
>=20
> Replace by ``${S}/usr/lib/<library>.<version>.so``? and implicitly encour=
age it.
> Not sure this is the place to give written advice on that.
>=20

It's actually ``${S}/usr/lib/<library>.so.<version>`` :) But would work=20
for me. Though considering FILES:${PN} =3D "/" once inheriting this class,=
=20
whether versioned or not doesn't matter to the packaging step (unlike=20
the default values, where .so goes to -dev package).

>>> +.. note::
>>>   =20
>>> -      SRC_URI =3D "git://example.com/downloads/somepackage.rpm;branch=
=3Dmain;subpath=3D${BP}"
>>> +   The extraction of the package passed in :term:`SRC_URI` is not hand=
led by the
>>> +   :ref:`ref-classes-bin-package` class, and is done by the appropriat=
e

s/, and is done/but rather/ ?

>>> +   :ref:`fetcher <bitbake-user-manual/bitbake-user-manual-fetching:fet=
chers>`
>>> +   depending on the nature of the package.
>>
>> What do you mean by "depending on the nature of the package"?
>=20
> I meant the type, like RPM, tarball, deb=E2=80=A6 I can replace by "type"=
, and add a
> "(RPM, Deb, tarball, =E2=80=A6)" in parenthesis afterwards.
>=20

I would simply remove "depending on the nature of the package", that's=20
already implied? Ah, or we can say depending on the file extension which=20
I believe is how the fetcher is actually figuring out how to extract them?

Cheers,
Quentin

