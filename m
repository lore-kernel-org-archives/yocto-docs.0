Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99589C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 17:52:51 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.33])
 by mx.groups.io with SMTP id smtpd.web10.58798.1739209965247734939
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Feb 2025 09:52:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=TMQ1309r;
 spf=pass (domain: cherry.de, ip: 52.101.66.33, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcWmFlzrsfYzKFm9W1q/VJmuswkke76AtXnkP7BSuQ+WJ4P6D5GzTVIO/T71fzn2pZxcAVgAxV5NPwzrjIxkyWJkJ20y3aoT6g7eUJIBJT6ikVl7yO3x9h+3Q5tbT66btLZsFa8PZCHDaTosNHOmPC6c2yfN4ZH20M1wYa0Q05VXKHKilW5rnyOfVeJcmNY+BM52ySqmYVs43bq5l8K4BmfoIK5ij5zmKojV1sjTt5NNjJ0ebdrom0NLNkYRNw9n88xAV2DynPP6WSjsyWkL0tRV7X+dKJ5GwVFsczjuJ0yYtPIjwM+NdKxUteelEA6tqBX3E9i4TG2Lym+GnSLulQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnXgPxiAVTvQBRdepLI9AfIavAUDP2cD7hPy0kJTktw=;
 b=GkVPO8P06CGBbKTJM05vBpylLcyiHDNZKTBEHiurvCDF0KOLaIEbuziixHyZQek5RnXjrnkvdy7jg9M53dwEvMgqp7nAldbszKXvlAFx/lU3DwIwuEuYaeGJMpc0XrPqIR00HYNTPCdzNwb4fsK0R5RYGACPwpX8yZBKZfgRWdIY7wN4hv0vUY+F9ImcUgDzniSlZMhSE/Pvk/NeXdLl7LkaGcohmnE0wYML/R6ps4ppmzdiFPXYYIR2Eu8anO5X7qCNV49u8hUTcvA/jqp6Kf0hAAD+4njT1hBlVdDAdJUmOmYk3u2udq4DycMkpqOBCcyj0Ug89SK08A4JP4JyVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NnXgPxiAVTvQBRdepLI9AfIavAUDP2cD7hPy0kJTktw=;
 b=TMQ1309rjg8FgVi0Zvlz5Vo6YKQA3ETTbR0x8L1YKa+qQ39zROut6QrFucGbJK4C/XQOnLpVz44ZNrxWIv6fN2CgcIHR91DxPdb8ZC6Rv8oPzZxOBw0CW5ix52jbVGpGGclzTNihE3mTcO9AMemHbLeBT/9z8Lh8CBwkaxgJ5DE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB9208.eurprd04.prod.outlook.com (2603:10a6:20b:44f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.17; Mon, 10 Feb
 2025 17:52:42 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 17:52:41 +0000
Message-ID: <97784730-ad1e-4540-8eca-a1a962d71f51@cherry.de>
Date: Mon, 10 Feb 2025 18:52:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/3] reproducible-builds: add a "How to" section
 with OEQA* variables
To: Yoann Congal <yoann.congal@smile.fr>, docs@lists.yoctoproject.org
CC: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
References: <20250206131811.86935-1-yoann.congal@smile.fr>
 <20250206131811.86935-3-yoann.congal@smile.fr>
 <6a34b601-8ddb-4101-9ae9-d0996202f79e@cherry.de>
 <481d5eeb-7042-478c-b4cb-86b1981b5a8d@smile.fr>
 <cdef73b7-8b73-447f-ba06-8256f5ac8f0c@cherry.de>
 <2c8a8f6f-d545-44b7-a9d7-ab05ee90bb34@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <2c8a8f6f-d545-44b7-a9d7-ab05ee90bb34@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR06CA0164.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::21) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB9208:EE_
X-MS-Office365-Filtering-Correlation-Id: bb3aaafd-1488-4a3c-334a-08dd49fbb733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?961b/MaaFvzig2YGfTHa9fxIuLXe7PjLWgalLRc10aaXt+Vf1ukQ+4O4KpAD?=
 =?us-ascii?Q?08udB5iQfxB+e10pKyMEwsTsXkdRS9/h4iZ+n8ckFDXyt07+YgmAlwXonDnI?=
 =?us-ascii?Q?/DxfoIkRKjYRyimGt3el8VTeZLpvPCGZ2A7fL4Qw4bcd4UetQx8bV84PwmoA?=
 =?us-ascii?Q?r185I2w1nGSAu6/Ds3by+78Np+UfSOzTEdgciFGilMSxxb7OYaMcaJ+SpX4x?=
 =?us-ascii?Q?yvriRvOrIq9SfrOlHL/mgFCcD/BZ7NuOJLT7VPoB6KXVJR0+8JT8u3gKZjsa?=
 =?us-ascii?Q?cR/h1FcICqVP9d+ZkSoiArLcZALLzrFh3ZUR8zY1sMUvLIEWTpuxBLdW/AZv?=
 =?us-ascii?Q?ifpev3eqzq9I0qm3Ut438WqfKAtx7SNmNju6hz91QnqfndnbeDmD7XbNJvdd?=
 =?us-ascii?Q?viCfLFPT34Me3wnSzidr8D5IIcj+MXuuA4Ylh+t/Bm3iLqx+wdf9lXBEeBH3?=
 =?us-ascii?Q?OyTWL1kiHD8Vveanpb+n5m6HoFey6HjGZEiw7PnhkmZqDtRwBadEzK8DHqmv?=
 =?us-ascii?Q?AxgE9cBm4yMwDpvPX3XpzHrx2kFknOGo46aeJK7pXJ9DBfTvDX0FjSohh3H+?=
 =?us-ascii?Q?NAibX2kpFdOJBAjG8sOEUgIJTt2eLBvtNCPE3mcOEhvKVrDp+EDB8b8vcCJt?=
 =?us-ascii?Q?+a1lhHmu4GkhqGCp0TJN3c76j/YPMyQojGehDLjhjFn1MiYMTnjn6qqt/L0N?=
 =?us-ascii?Q?hWoOIWOJNVMTzmIcFaplZLzSuEQnfR/IC5g8FM5ZMeG74ddWT+ky0vn0epZG?=
 =?us-ascii?Q?WhrfmyMCHECYwGgdbcgQ4tqv8uscBNvka9jUqH+sU6t/kkXQhbv3mdjUwAy6?=
 =?us-ascii?Q?Xu5b72Sf567srQeCA/xNhfiItdq6/ZeFqot5LkrbMjDGLSSaPUk3R5Cm5I6Y?=
 =?us-ascii?Q?zTnHTq/yNPp+Qu5ahI+dP+Dultduy6yine4ej8wbEm9H03wB55CvOS1iU0NN?=
 =?us-ascii?Q?FDCWo1tHQvgGCBD+xoOY9kVsdzWGD8D4WzxGmECyniszUFtAeIhJwcqmYA+r?=
 =?us-ascii?Q?YHLEaT4S7OJfxag2MyHipK1+SwrLu2vETC3CgF02OGGAdqYtUoObSLt/nStx?=
 =?us-ascii?Q?DkzY2mShCAjxbePiXovCFhM2EqpmUjtFDJpn+eC8xs9KVB7Ht113JUS/7BVL?=
 =?us-ascii?Q?kfEPYECXcXdEX+ntI5r9fl3lD7WD02d2EscatgOb1rvJJZGqFH4qJ2nCy1Cs?=
 =?us-ascii?Q?GT6jo1wSSzojHK1lUVOrA1FHAtIJT7NNgn0bTrsuPWQiwIn6j6HeWyIHvAwb?=
 =?us-ascii?Q?T47C/b9BHdYI5erItM7iI1gUhE0/uY/rqcGfA1w+iaMuqfFy9IVS1zgWGpZm?=
 =?us-ascii?Q?c22RDk/gVo6rdTq4l99fkszs0wD+tcbu/X/I5VuLynYim3vH3tyjakT5fSD2?=
 =?us-ascii?Q?tF7OVNUzMS/iWDRRubwGmYfWxyO5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?38/WrPrzHmT1u7QMwxLGvGHmzd9hfBlroZG/iGuE5ypdLQfpW6zNwqyik70e?=
 =?us-ascii?Q?zxaojJNhzphbkFYsYLl8PO4JNaxFyha+DLz+pu6p0O5eX2h1GH6F1ShqHIYs?=
 =?us-ascii?Q?8HSTNg+Jy5CZMyWiRAD0xbCGFAqWFIUBXWyKPIwSWbTamEQTult33bPwNb/y?=
 =?us-ascii?Q?eyS6uqTCmLydFvfOGCrCm5PWxlDCtf6GTfLM8x/7Jth+VZ/yYkxOcCOCh2YZ?=
 =?us-ascii?Q?dy/CAwKdAd/8NMGq8Ly8znd8XvkN/A9lpGdZhlET7zXQJUZ5Kmye3V96C0aI?=
 =?us-ascii?Q?BN7vKYGHJ3nXPeBQ69wqBIyacyySIFBoHph1ssAQbobfFkY6Id9re41PvC/Q?=
 =?us-ascii?Q?GMNdPR8QkUnjuNmINE5oYa72o7BTCpOHAAbtFS9UWd+gDmm26t8yF9c94Jyc?=
 =?us-ascii?Q?tZWxJNuJV3tJcqeISrUzFsHJN0LaDK3ywJj5H33pm9sgW3Eid1ZAQIB/yJsh?=
 =?us-ascii?Q?1YFbC54eLxNt5ZF6ezrtnckMnJVLc+nIYzoywOU7bwlOt/aVojq0IjtgmVFh?=
 =?us-ascii?Q?91+CgDhDfUaFQS5LDGVgdP78GCAKXjn0hi0Qbrf6gUIdw9XwzOoVIxDh3D13?=
 =?us-ascii?Q?KJDkO9BVsNnekChBQmbLfdGrBHgrk4uB9uxItD7jXnSK75U2Y6EeOJVH4m1r?=
 =?us-ascii?Q?htuyr89ePJS++gbNWLG3YRVbjJfwse8hhmy+j4SD0exGsXJTya6P4kYhW/vl?=
 =?us-ascii?Q?K5VoHHK/LRJYZGsykmw9WxEGKq0IQvPZgneLGN6lfH8bk53Md+rzFsTwE4h+?=
 =?us-ascii?Q?8/efVCbWzi1hKFK/o7visf+dCve8jox9twSDT4u+5P5rQyVvdszCPkAxcYz8?=
 =?us-ascii?Q?zr4ZOuHUJws/4PkAtgE5u7qKjEhfgXT1D5a6fldi2mobJV/7wv/3+V5+OX2l?=
 =?us-ascii?Q?rvV6hG0+VxbX7UI2Tw+Ckb1a680vR1P443y11YwZwPf7Tj9uvoRSXrv52sb+?=
 =?us-ascii?Q?/AVFacckepDKVzuvTPot3SzUkK5m6a5HtfEiEaVfjs5QL2icsKvjDtkifMlp?=
 =?us-ascii?Q?3UmXtIhm+jzffN8+4J68FVSEB3eYAKdL+WzMpbCtX3eTUeCchP0p1JkAsvH5?=
 =?us-ascii?Q?psoaXjgcqbJxzloHZ7aaSiH8Glu+GwBHTaovpa+mhZzqfP7uEWVg5yZIXryC?=
 =?us-ascii?Q?v22vcwa4YvgSjqbDPp1V2WCm4fJiKyNEXuv+OoKS8kAB0hm5tNO9YJZ7VFUk?=
 =?us-ascii?Q?3IQzEdFK1vECPNsWwWZALHTl8FKgce3KLbFkQsNQEFxa4ehIgSO1uSFNvkIr?=
 =?us-ascii?Q?jDtiyBccl6lYPfSdHQk+HRDkELKXqVwnYmwNhmsGGw3bObFbtuy/Mxba19FL?=
 =?us-ascii?Q?Dv2uyoHTg6FrCMuolXBvLYzHyy3SWXo/1MpafqDGOTP5tCFQHzPeMhWEn54F?=
 =?us-ascii?Q?9BoJ3igHZOqAbepjg+JMqYqMxxoGWkja+XxHn0dyb6NjUwemo92uRxC6FW36?=
 =?us-ascii?Q?sTdeH/Czq33BVRU0qF6j1f/S6+5ChBgHqyMPE8L/Pg24qspkmr3her2iFK98?=
 =?us-ascii?Q?tbbFrgtjkopTVfubb7H2/g8k3NQQXPKb1sxnmgmpE7ImXpKyc24u1LbHdunM?=
 =?us-ascii?Q?vvi/J10PFm5zQH8jfEHgkuDc3UYsPDIWfptMDwyyYlYLjTOdMB2rLK4ACLwE?=
 =?us-ascii?Q?rZE6pddicdKOj0IDxbtp2EA=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3aaafd-1488-4a3c-334a-08dd49fbb733
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 17:52:41.9009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ynWhl6f8tEuqPl6hDiSBV/sfFDj1uiz2KmBFbqoUXVx+uSTiBxsZgvpN3n1LCcZND7Yf+e0ppLf4Di/4nAT2s3tVMYc/muN/T9ThQN6s5T4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9208
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Feb 2025 17:52:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6326

Hi Yoann,

On 2/9/25 11:46 PM, Yoann Congal wrote:
> Le 07/02/2025 =C3=A0 10:12, Quentin Schulz a =C3=A9crit=C2=A0:
>> Hi Yoann,
>=20
> Hi,
>=20
>> On 2/6/25 7:17 PM, Yoann Congal wrote:
>>> Le 06/02/2025 =C3=A0 17:08, Quentin Schulz a =C3=A9crit=C2=A0:
>>>> Hi Yoann,
>>>>
>>>> On 2/6/25 2:18 PM, Yoann Congal via lists.yoctoproject.org wrote:
>>>>> From: Yoann Congal <yoann.congal@smile.fr>
>>>>>
>>>>> Shows an example of the new variable
>>>>> OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
>>>>> and still mention OEQA_REPRODUCIBLE_TEST_TARGET/SSTATE_TARGETS that
>>>>> were
>>>>> shown earlier.
>>>>>
>>>>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>>>>> Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
>>
>> Since this is your v1, I believe you're not allowed to provide Reviewed-
>> by/Acked-by/Tested-by/etc... given privately. Guillaume should give
>> their Reviewed-by on the mailing list before you can add it.
>=20
> I did not know this was a thing.
> I did private reviews (with my Reviewed-By) for my coworkers for more
> than 2 years now and nobody told me.
>=20

Coming from colleagues, it's less fishy but I've recently seen patches=20
with Reviewed-by from maintainers in v1 of contributors where the=20
maintainers didn't know anything about the patch. A Reviewed-by is a=20
mark of trust that shouldn't be given lightly, so when it is given, it=20
is helping the maintainer(s) making the decision whether to take the=20
patch or not. Unless it is given publicly (hence "guaranteeing" the=20
person who gives their Reviewed-by is the person they claim they are by=20
the mail address they sent the mail from (though it's not a necessity, I=20
sometimes give Reviewed-by: <personal-address> from my=20
<company-address>)), there's nothing guaranteeing that this person=20
actually reviewed the code. For the docs, the impact of impersonating=20
someone in Reviewed-by is clearly not a big deal :)

Cheers,
Quentin

