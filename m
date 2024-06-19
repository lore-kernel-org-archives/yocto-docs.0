Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537D7C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 11:42:13 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.109])
 by mx.groups.io with SMTP id smtpd.web11.18583.1718797331619616895
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Jun 2024 04:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=mUo7zmqI;
 spf=pass (domain: cherry.de, ip: 40.107.21.109, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUPE/yURXl5MnCwTS7srd+GVXBVrhDAQ7Cqmt+rC7YnD1WxlVU7KFAfsh6cHyUFnBfyAojPle/YAFx/6UxIw/E7ShUtokHpwCXs9facvs/xK9dh3Nwx58A/OuSCqM76el605KC08YToquJ+acHZweLRYqRgQJ+vY5tRGonDoXecMa4xeJmNfDxMhk/2R/pqlD3xTWA4PykEKKFSrlCblqTKF3repTzqxa4jgXuWkph5JLOEnayuoqN1xdj/SfCMy0Zmal2xOsJPc2s79U0ic2EnczzM0qWx/im7LUacPOnpYHSiim6S6d2/3XVanQvRwlT2MW7tkRuy+17PJHT10Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xesCIr0i1jVVyVg70mTnxdohrpA+ZNhIOhShTWEMDes=;
 b=BCOx8MDfdPpWjJzlpg6ySMnb3qx6iv6015PwiVCKZJQjiq3Esw66KO0k/uIFw96TqxTLssIWU6TTxoiJIwsWwSpaoqhI0Ug09G3OEhUa8raSrVhrqQNpeD6o8EV9u+YJyhklleVHu00q0rNTsKHM1wPal3IhGZvlecZnbrYG9B/NCnfsmwORJqHyXf5D6wFArNnx2f8yab5WlPvZSmTN9YGCy3f7HwmY0WjwD52izwL0lyKU02Dp2C1w7h2x6uRQHpMFgsoxJlR0gimdlNYtP7qN9Dgms8bfA3eSyyTlT35xHCQs+4sDGiN9Mq0x2g2a3RwBNRraHxjcJr3C7WVrpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xesCIr0i1jVVyVg70mTnxdohrpA+ZNhIOhShTWEMDes=;
 b=mUo7zmqIf5s46rBfYg53mNvBYMJnMjWMX3mCwB/ssEdxw3X1w8EVx5DmIsLM1Z7uVqsEi4MRdZc4JOHdDe0oRjDjiDyrOduo7TMXnkDxwv591rTRs/MCGiV0Z7Jdfy55r82vrUahI4RAY7MboW3rl3mYqP5b2q+5eEY+FYyjybs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9)
 by PA4PR04MB8000.eurprd04.prod.outlook.com (2603:10a6:102:c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.18; Wed, 19 Jun
 2024 11:42:07 +0000
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af]) by PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af%4]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 11:42:07 +0000
Message-ID: <ef9a45f9-6c48-4634-9316-5424c6e5a073@cherry.de>
Date: Wed, 19 Jun 2024 13:42:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] documentation/README: refer to doc package
 requirements
To: michael@opdenacker.org
CC: docs@lists.yoctoproject.org
References: <20240611125026.22702-1-michael@opdenacker.org>
 <6495eea0-e391-43a9-a55f-22cf78fc96a8@cherry.de>
 <fff06fc0-4768-4fbd-a65d-77ba1dc7527a@opdenacker.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <fff06fc0-4768-4fbd-a65d-77ba1dc7527a@opdenacker.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR04CA0078.eurprd04.prod.outlook.com
 (2603:10a6:802:2::49) To PA4PR04MB7982.eurprd04.prod.outlook.com
 (2603:10a6:102:c4::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7982:EE_|PA4PR04MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: 37d2e770-f26a-4ba8-f877-08dc9054d8df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0Qfiyzok97jDL4X4t65A4tsxpospOc8kCFM5/enqzNYpKw91RpF1L0RsuvJQ?=
 =?us-ascii?Q?Us/d5OWmjKiLq4nsQN7rI/sVXTzfON7sB/kDTgp/IpaVOASChh8zNGNnudEi?=
 =?us-ascii?Q?y9d5r4+Cn7Nmfd9a0fTC+SYG/tbLQ4rElacq0cylEVWC1mNNUYwK8LkBXVI5?=
 =?us-ascii?Q?EHTpEwcDsQCq0q4gRIRhPOrRQ/ItYtJF4z19cGznU2bwBagqy7gWKq7RUVCh?=
 =?us-ascii?Q?psH6tbAsQemX+n+pZob/567U5uA9bv0HZ1Ij4KdnK4LmP+BCMHssEl6xGJ3L?=
 =?us-ascii?Q?Nb1yIbw+8ikVonDQgzBzBvoZszRY5RmY7xrHvSyLk5G3rFi0pRR+H7babvMf?=
 =?us-ascii?Q?eSEujK+60+gDyuvGnU9oWN3Fkk/34W9pm9r0s57csEnOchqpqhPAkPxdHLaB?=
 =?us-ascii?Q?0m+Gdte0eVOu0vyjaaEvqBtutF+sGaBMSDPomoaBVNtBvyl7R2NlnmjzD4KK?=
 =?us-ascii?Q?p8Xh116Kpv7x5Arn2K2rgIgjdGaQZbvNLpv2UYiaIcu9Szg9tH4lQCYeAx32?=
 =?us-ascii?Q?Dmfrb6WT/ZMB3zRSMcU5qJRzY1E50TlLBB4DmiJFJaD6Zt3NyGiQoR7mWgRk?=
 =?us-ascii?Q?1GZZqcv1BSQ5w9+81tuSxkvlLcAGSQIhxn0FAY0TQg4TZXKPceumkwIn0yOY?=
 =?us-ascii?Q?5a33xBYMJ4jH8cpFkbwHxHeYOuF465+zbMFaRid8OAzocBf7QvWBP0dyWnfv?=
 =?us-ascii?Q?Ddjc51uh08/dr7K6SMAzDYrxo9AzefoCu0WCkuX3uufTCMtzheLSq2s2U+k2?=
 =?us-ascii?Q?uCT4eL5vw6s8aDYtrMcNmNGRGXZOUwV9dXj+ZvNLmqk4Ay96dACWMuC+eYP3?=
 =?us-ascii?Q?fuiTmOkfmmcJv72aD1giGvW4g0zH6h9tJcBzEclfq9xnIwh8mSVfUbOOm6oU?=
 =?us-ascii?Q?XlNw8sr5rTU0C6VLn6iJc455DvYB64/3Og2nVKEHBY/Rv2zgNnuteFDkott9?=
 =?us-ascii?Q?T0cfqqtE86Os2Eh5T/Q9mpm7ROSf+RboOXNOBN4lTkaW7AuXozATCiHTYUjm?=
 =?us-ascii?Q?c5CYiQ3JMQLDPodd5EwnIjB742jLUnXeWuLwXMruUkUizzDsbmDzf5yl2LBL?=
 =?us-ascii?Q?e37KJdKMFu3Q47IJR+BBketOBzs5yKBrFu6S3QoHDFcce79dcXfoQrvf0UqC?=
 =?us-ascii?Q?8Q8yBhz9bAs12drM5XgcMMmAcgSadNEDNfRcsOK7NKG7niC6GqTERH+E6JoD?=
 =?us-ascii?Q?QDisRkqe/Nsqxfn1Jza07fSQnPrvoBNpGNXOlgXgnQmVYI8S9EwmSEUFKW5z?=
 =?us-ascii?Q?lcgBExCubmHGOypp8vcr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7982.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(1800799021);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?79DsPJS0aTUHYRla4XU1DSu+yvQ/lyMDRF9+8dbPVXbFZKwIxuSEsCY/hj87?=
 =?us-ascii?Q?gQlXi4+tZJm9X4Kb6ZawvXXdPSTmca3f6Q5BgVBESQclJ7Q411hfb18ZBhHN?=
 =?us-ascii?Q?UJVi7eWQ/t17elapVw/77GK8Bo8xIGX3rJ5zPmIabSWvUBn0JUaFx7Ja8bc8?=
 =?us-ascii?Q?+sQQ/PjsXd1xixYxg91JG8acAT316tcQrSpqMju5T6rgZ/01MGwpNYIzeEd3?=
 =?us-ascii?Q?GWIFT+/z73WcHFy0/zal0pndzwDDWIjDvxaNb7Ja+2fXUvf5o8aKk8tFA7F3?=
 =?us-ascii?Q?a3uGe6szbLdJ1rc3MuQ/EEJdk3xHf1KZDaYbIRBtskG1A7tAd9pKTLoLaxXr?=
 =?us-ascii?Q?S03XQ+9OW23y01iYWicnVKkZXQpqN4lZWsMH0Ceg7IrGA2r+AfVFL0hfDbzf?=
 =?us-ascii?Q?brrrpTTmq2jLJU60dZPoCjd1GxQFYXD3vjHPQTGEhEDSJhlfoIgKby6CFe2W?=
 =?us-ascii?Q?lkbnJFqxn5U+WsTjLYF0uZAC/uCT2CSRQm4bIrYRfzgQMl+pjuoH5iIRW8Z0?=
 =?us-ascii?Q?yxxiW5wwCG+RvRmxr4XcXe8zXm6APfpclygBaFrK5M5U/UbBbslSoudmqisF?=
 =?us-ascii?Q?FzNCOMWnqQb98CLCzbiK+Js8lsOmhQ+heIibJATvEMfDiJp6xsApLt29yRGy?=
 =?us-ascii?Q?1+W9oRiW7ge8uScDmIBxOi4lLRO40+qzPT2KdGHdBddGTwfEm9bSRlwrCfn1?=
 =?us-ascii?Q?g8fAOzxg/Gh4vm/l/2mc4M+XlGF+YzTjO/Y+kaVIl7R8KbPZF7TwFgmLUtEs?=
 =?us-ascii?Q?zVREz2MAlQaqQzzZ2Yirp/YUPJOPdivR8kQjvd4eTgjmbfO8oAK9+gEFjprY?=
 =?us-ascii?Q?/DyUAuHyuGrpyjWT9hT+UwzkV8MH+06VfmsqxFzfQHZ30Fwm6MQ5PUUAuiXQ?=
 =?us-ascii?Q?neQpmBQzz0IYy1cHAmf0Xv2GCJRU2Oc5tE7ynTMPwnhyuqdjhqBQ65rqyr78?=
 =?us-ascii?Q?J+KPINvdLPZsW0i4h0dm7LazB+M5JEL39+e7IwYs+oM2Jt5Lpcia5/o2HPl3?=
 =?us-ascii?Q?t/CjJsFFsNTb1bCOCwA/T+QkZ2r8vTlTRI//nVo3tBFZ7OYb4GparooIwJw7?=
 =?us-ascii?Q?Hel3YG2JYw0po2fZrzNH8jhdNo0IhivGXv0aSpLWFmn1dy9vxQezBwscqKwx?=
 =?us-ascii?Q?vTvE6NjGPdaJusGmBoaCsNh2sLqbFe7xldhI5sEsLNVw+U2vduXy4c+HVjb+?=
 =?us-ascii?Q?jVx8aAE04HO2FYo6QcX4k11VOxg1GvjcX/oJpfYyI+J19BtSCq2847iUuC8A?=
 =?us-ascii?Q?gxIkfdfAyWaEC84GOkxk2OsVw2q7uCxlZ6VSQcS+IvUiE2O7T3z3qsF13nlw?=
 =?us-ascii?Q?XXTXy6cqZnBFhQLdn9AgwtpFBnDcZWaRD6FLrb5gZ8pw/rY0IjBvs7rb45sG?=
 =?us-ascii?Q?psAXYHXQjUMePvp5LVQvFGTViaocKyYTnN26tqVjTHul7+9EtXko1INt5t/p?=
 =?us-ascii?Q?wRn81MSBKnMhqXhPnf7H/PCGRhhPhMM1pcY0HZCNQqhmA7kq8hAxvgUVvQow?=
 =?us-ascii?Q?93u5gUXELcJVqY4pa6uMfJw6h7DhpiXz/syw1xc5r2D5HZvGrQzLca5jkxQq?=
 =?us-ascii?Q?Gk90Fpn4IJ37b3mXJUNwmizRORc+h2gADYQa4U1O91jb+IVfSKnB2q0dPdDW?=
 =?us-ascii?Q?O77Aa+PhzOfvRyR9Yj8V2fw=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d2e770-f26a-4ba8-f877-08dc9054d8df
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7982.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 11:42:07.1124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAzsaWUlxxvlBdGm7JKKdUhmLK7+9LsBOCUZw4czvRqUHQDYe01msLOBEr6P939QzbvvM6354/BXLEyQYnj5/rnFmu4HF1gV2H6waJ/Z5cI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8000
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Jun 2024 11:42:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5298

Hi Michael,

On 6/18/24 4:52 PM, Michael Opdenacker via lists.yoctoproject.org wrote:
> Hi Quentin,
>=20
> Thanks for the review!
>=20
> On 6/13/24 10:37, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Michael,
>>
>> On 6/11/24 2:50 PM, Michael Opdenacker via lists.yoctoproject.org wrote:
>>> From: Michael Opdenacker <michael@opdenacker.org>
>>>
>>> Refer to package requirements for building documentation
>>> from supported distributions. The simple instructions
>>> previously listed no longer work on Ubuntu 24.04, for example.
>>>
>>> Signed-off-by: Michael Opdenacker <michael@opdenacker.org>
>>> ---
>>> =C2=A0 documentation/README | 29 +++--------------------------
>>> =C2=A0 1 file changed, 3 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/documentation/README b/documentation/README
>>> index b60472fcbf..c888b666a8 100644
>>> --- a/documentation/README
>>> +++ b/documentation/README
>>> @@ -108,32 +108,9 @@ generated with DocBook.
>>> =C2=A0 How to build the Yocto Project documentation
>>> =C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =C2=A0 -Sphinx is written in Python. While it might work with Python2, =
for
>>> -obvious reasons, we will only support building the Yocto Project
>>> -documentation with Python3.
>>> -
>>> -Sphinx might be available in your Linux distro packages repositories,
>>> -however it is not recommended to use distro packages, as they might be
>>> -old versions, especially if you are using an LTS version of your
>>> -distro. The recommended method to install the latest versions of Sphin=
x
>>> -and of its required dependencies is to use the Python Package Index=20
>>> (pip).
>>> -
>>> -To install all required packages run:
>>> -
>>> - $ pip3 install sphinx sphinx_rtd_theme pyyaml
>>> -
>>> -To make sure you always have the latest versions of such packages, you
>>> -should regularly run the same command with an added "--upgrade" option=
:
>>> -
>>> - $ pip3 install --upgrade sphinx sphinx_rtd_theme pyyaml
>>> -
>>> -Also install the "inkscape" package from your distribution.
>>> -Inkscape is need to convert SVG graphics to PNG (for EPUB
>>> -export) and to PDF (for PDF export).
>>> -
>>> -Additionally install "fncychap.sty" TeX font if you want to build=20
>>> PDFs. Debian
>>> -and Ubuntu have it in "texlive-latex-extra" package while RedHat=20
>>> distributions
>>> -and OpenSUSE have it in "texlive-fncychap" package for example.
>>> +To build the documentation, you need Sphinx and a few other packages,
>>> +which depend on your host GNU/Linux distribution. Such packages are=20
>>> listed on
>>> +https://docs.yoctoproject.org/dev/ref-manual/system-requirements.html#=
required-packages-for-the-build-host
>>
>> This points to the latest commit in the master branch and not=20
>> necessarily the one which contains the appropriate instructions for=20
>> the version of the yocto-docs one currently has checked out. We could=20
>> point at documentation/ref-manual/system-requirements.rst and=20
>> PIP3_HOST_PACKAGES in documentation/poky.yaml.in though but not sure=20
>> it makes it easier to know what to do. A bit of a chicken and the egg=20
>> problem as to get a simple up-to-date instruction on how to build the=20
>> docs, you need the docs built.
>=20
>=20
> You have a point. Maybe just pointing to the production version of the=20
> docs=20
> (https://docs.yoctoproject.org/ref-manual/system-requirements.html#requir=
ed-packages-for-the-build-host) would be a acceptable compromise. This way,=
 people don't have to build the docs to know how to build them, and then ca=
n then use the version switcher menu to find the docs that match their part=
icular version.
>=20

I guess we can still keep dev/. I just didn't like too much to point at=20
some URL which is bound to be not relevant to the current state of the=20
yocto-docs repo. The alternative I suggested isn't really user-friendly=20
either. So I guess we can just pick the one that has the less friction=20
albeit maybe outdated/not applicable, so we can just keep the link.

I realize that "In any case, this needs fixing, so" could be understood=20
different ways. What I meant is that the current info in the README=20
needs to be fixed, and your patch is one way to do it, so I was fine=20
with it.

Cheers,
Quentin

