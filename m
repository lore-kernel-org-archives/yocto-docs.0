Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC70C02192
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 09:13:11 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.59])
 by mx.groups.io with SMTP id smtpd.web10.65276.1738919583699274890
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 01:13:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=arxXNbXj;
 spf=pass (domain: cherry.de, ip: 40.107.241.59, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFwdPDnsiF3mtE0Esjc/RUtgPMG3YRlR9tGNpKDJgpa90r18EPq6NUyjtNFJcoZk1On/ZDueS0mHjq39CgdOGW+HuJzGK49RiL44S7wFOiNZgOGDd3USCCYgWmAaDPeOFgUOKNiPlGd1mwGQnD6VI6UPcDdaCeGjU06sz/9hfJVxo/Tlcuom91jn1C1U2y0xRaKR6TNud8V0wDnIDAKCGGYu6AlrrF/L/LQzRbMMCygA4H2nTC+x2165SZ6NMvlzASd3Rlb/xFnQbvu/MgM1GOpcTWeSsjzqfdjNvKJRBbjwqDjIFxT5StFAUZYWC9ClDmxOsTsaGkEd6kpFRUMakw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34twsl3Zn+EcVeaAgz7lv73/kEoJevvbzzQatvXuTsU=;
 b=xLGrfc2U+YHa6QSh4rfv7NDnL54ynetFlS8aEwMf32c9ABN08mUy4K+pXa2M40rELF/Lu4updHZlVewToOYGkbLgBrJdzb5vLoa8B2Idi00MoxvtURMuy0ORnmYlrcatGEefSOJUQXY9xEP9DcqyC5WsJkNSTCsnP9Udqh3WTFPX3em9g7+UTYvVWeJEF6xfGNHrfRoH9dmVH1tmAEoOUNQtRNLQdXsc1MW+nD4ieFh4r+X0TJ7CEsvxtSCPrjta/vlhn6O5yvFpXMs6XkmImD/qnoim2FDDhCV83dBcS/JOa4wrhu8E3EQ8SWYrsHii0aY59yEPM+PKGrM4caXyag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34twsl3Zn+EcVeaAgz7lv73/kEoJevvbzzQatvXuTsU=;
 b=arxXNbXj50/15basa9xXZ5v8E/QiZFtu5qkfbeBhzuiDcjYEyP+KfSV5woyTwVXOn/I1OrYz29MQwXeHF7r8kNTcPAShXYMDtHHj8wHfPQ3NaA9oo+gCnBEQdKTwcBEXYcAa/wTBIqKGRtez9qIDi5udhqC60Q0Iee+y3fep22E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 09:12:57 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 09:12:57 +0000
Message-ID: <cdef73b7-8b73-447f-ba06-8256f5ac8f0c@cherry.de>
Date: Fri, 7 Feb 2025 10:12:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/3] reproducible-builds: add a "How to" section
 with OEQA* variables
To: Yoann Congal <yoann.congal@smile.fr>, docs@lists.yoctoproject.org
CC: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
References: <20250206131811.86935-1-yoann.congal@smile.fr>
 <20250206131811.86935-3-yoann.congal@smile.fr>
 <6a34b601-8ddb-4101-9ae9-d0996202f79e@cherry.de>
 <481d5eeb-7042-478c-b4cb-86b1981b5a8d@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <481d5eeb-7042-478c-b4cb-86b1981b5a8d@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR09CA0166.eurprd09.prod.outlook.com
 (2603:10a6:800:120::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB8461:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a721b8-7de6-4230-d70e-08dd47579cc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Hr9lTNScHTlam6Hun2CUF8mBW4kLa/A883PTiywn5AQR1RvRyZ0SSGdFujPN?=
 =?us-ascii?Q?UIf+mILO4Nou9g6R17LsjiWO4mWr1tj90lNZAdKdFa4U9Kknb2HNpPJjEukH?=
 =?us-ascii?Q?7RZhZapsuKb0v/DY2Rld63yo2yk09G4abL1wHfarrHG7+CB4v+rJgm6D4364?=
 =?us-ascii?Q?wB56hY1cRTiD/zRchMMdlCE5/8G0LB2Kc2TKVUBjG8+aDcrcqO4BJC9S9Vwi?=
 =?us-ascii?Q?9jUTqjyjQAzWtCb2uU28NwRQrVM/HmD6dXSocjy0k1POYfjzNiORGiVyMeez?=
 =?us-ascii?Q?lENcxm7xdIWVMMVjbkdXKl2cw4V8iNIdx3ehdyj6sZCePM7CnCVOR80IshTf?=
 =?us-ascii?Q?f76VPdIA3v9OA0x3/VoUzhel5FQV2VcZj2OoZJCObbnOMcV/7OpmPYy/wdoc?=
 =?us-ascii?Q?Qbisq554bY9absrVrLbUMQXa77a3RbwijOjEwcXXn4X05nNa0ynCoXGg51/7?=
 =?us-ascii?Q?j1JEuqfTvpkHzAfBfLzJ4m7Z66ZU7dXuvxfAE6LPLh5isAXdAxvI5m1YIjZi?=
 =?us-ascii?Q?oXeucR9ysdlekdyyoucXgiRBwZCc301Knm/a4Xmqm+u+SfehFPsnhdj/CFgI?=
 =?us-ascii?Q?QPzoAog7ZKm+xLMYkWlUFWRZ31lD5aBmZsA9gWS5S2gvrRo/Eb7mG94L4AJI?=
 =?us-ascii?Q?oWmlaGVkI8fsDpCeZuFqxRGgmsKGLYcX8bQ2io2dBb+yzsxkHkSoU74q7WHB?=
 =?us-ascii?Q?ENmGcJzavyFGfxFzsP8zHz7FRnJerGCrxP7i7q0RO/pr0XrsiexcuEpF+sAC?=
 =?us-ascii?Q?kvsQ6Fpmy+oQaQw6Mu5SOo94vwKn8jkLhAinRUFj1JajxK/HZiUueijj+d5T?=
 =?us-ascii?Q?qp1rGIM3sJJV64aFOKzB6DmAWYR8XmuDV3jO56PM6WI9TFFoxG5VGIhr1QRj?=
 =?us-ascii?Q?UV1kYowYt12dxxuH3SaOk2nSwjIY7mCZKEqDjfG1DUdzpGvoCcq1ZcdOn6oC?=
 =?us-ascii?Q?JT9k4V3DYYTt3V2IeEBXokhA7AgZNZFvtBYai0w8zwCUshPWQUc0tw9qyQIQ?=
 =?us-ascii?Q?mSZqXxq+NDc/6tWZtiuRDnRupOKHqeqBYIIYQs7Tic28orq9tR/4SpDN8sWv?=
 =?us-ascii?Q?nAiKqoj5KTAQpL2bxrXtbqkN6ryUPsAS2Sg2hcAG6texSVMF54v/ykQ2AHTn?=
 =?us-ascii?Q?oO/Cz0RaHcfk0zxyKgZmYtyTHd39bwg4HRXK4Q2Qoc6mWRP2mYm0IjTamNRP?=
 =?us-ascii?Q?EyZ6J9APEBiRrEXMdwpO+UvoQKgO42KW7fdh6uXnGfRKIxSVtzIK7ctgMB7N?=
 =?us-ascii?Q?SdbYI4kmkXyFRGLKEOMf/ZqkQaVURmB3nqHgtSJ6SIBg135UO495Rt5RVqhx?=
 =?us-ascii?Q?3sQ5p6wm8DenAEdSpCzHoaV4h39mE+OUdZ0IqH8VhQ6ijg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B5N7fhx5vpiQ5iYl+yPXlU3nXH+ZhUClBpLAen7i4p72y/AwtPj9GgJdRe/6?=
 =?us-ascii?Q?wbYYYZO/gBvVOsdNlbAZsm3zRniV9bxP/pbAbmTzZx6M10cZq0hjUYzq2/fA?=
 =?us-ascii?Q?/LsCivapQ5piXWcx5DUcExN6gmtwuOLYzmYh9IIweqq7IR08dGN0/X+uVWvG?=
 =?us-ascii?Q?5Fk+KFTbSeq82mBbJNNbSRORw6zbMwLK7Q5PGmZqt1REiUuVHXnE4F2uZQoU?=
 =?us-ascii?Q?T3btjBKtbHg1kKdi/6Xu9xiXqwZHrrcsg9QxOTJO8byFFZ7WS/06NJn6KC9N?=
 =?us-ascii?Q?vGXDkk1iCnjUGbixBX7vhaQpBsGcYXEn2i/hwKK3SheAVHNI1HY8ENFYpepO?=
 =?us-ascii?Q?P1OKsjVxImcQAisDptpKyFpH80BFmsUS/3ySxjb3Nv0aypstuNJeplTj8w+n?=
 =?us-ascii?Q?xaESOQVrs72zL4Gf3NULx0gbd6Bm9EZr0JT6gDSboASQu8IDWXo4geDYkZfo?=
 =?us-ascii?Q?LROgaFpScSAnW52JUp5D9unvfRTVc8w1oWEEotVceDiGwo2Ix8nswpPLuq43?=
 =?us-ascii?Q?mz+DCwM5jE71SGyRgTYqoCPlEiv+paYd6w1DS73PChmXQIrI47domkJ9PrVh?=
 =?us-ascii?Q?8GgSqsfSzwrKVBHlB4HOWyJbPXRc9O9bfXwCkavwFvdkN52T7sIxOR6fTSei?=
 =?us-ascii?Q?SrwfWXNEgpXzCsUcrwxl7hYMxAeviDCY8Knp+FakFSvleQpTIzAdYaDThPb+?=
 =?us-ascii?Q?cixhmVoh2U9u6lKhzijPRvl1lTRjJwW+LKjS6Lds4gLcoBBTeEvFTafQKeYT?=
 =?us-ascii?Q?N0C9TeahD038sTxf8rh4W+4EWWler2w+SfZVGXeLFNxxf5f/P7qIAR9CWGf0?=
 =?us-ascii?Q?ZP+3lRioGsIrcMa6snG90ZDbsP0chEf/7FHgTMs0IVwp7U28b8LVWBAT2k4W?=
 =?us-ascii?Q?4Ogv7UIssRnYtPmBgg23j1g3oL8tW7uy410WWqmSkjfcYqTfZaste2njaNi2?=
 =?us-ascii?Q?sLnCqC6c1fAq2FdRFIkj5wyoAdC60tTz9xL7S1fBlJRhDjW4zhfBQ8AHKAVs?=
 =?us-ascii?Q?Ykq24Dv1TmqZ9TABdHtuaIkzCqPtdn/2Qe44oWdvPNtZbZTroR3gF9QdAknk?=
 =?us-ascii?Q?FALoGVRfKX6UPCmLl8tiNRmGAMJldil9x1/RUi/w+6oqinlelk/VANIYLkqJ?=
 =?us-ascii?Q?UCv/L+D3w/7ZyQOUVaJu9vZ6F/oCM39SKKUT8U9qGlqIKAhcdB7vmvONjvol?=
 =?us-ascii?Q?F44XYLi55mg2uTVwoRKBDE4tBzbwkogkT+KBCEoROCdDYe+JCIAbnYQu2s+6?=
 =?us-ascii?Q?O6Kf5D59QfuWrjFdYogbB3trQP04qnyDDknyoTmOkFobodAPLD8kC22tTfZv?=
 =?us-ascii?Q?tdDA5A1n6r7Wa9Nz3HaQUw1A8ifov8F7W5tf9DRCj9Ajz5+CrOCC37ATH5O3?=
 =?us-ascii?Q?axhT0VygcCh1Qrn2vVZXJ+kk1VzRhzJRQZugsUhIX0p9nb5Zl/9ueeV40XfH?=
 =?us-ascii?Q?B9XrbBypwQspF4I6+o4b50QYp2654HD3fK13MGt2htyXQF8qU3MgZH4IvHxG?=
 =?us-ascii?Q?V2dbahny5uRMYXX8JjZGigL3puRUE0Zfdb/MjQaMXGkzjw+e1+vR+KrdH62r?=
 =?us-ascii?Q?jh5tdzBs+kO0hgbD/f2JbdsCQRumDNJmgyGQY1f0Mfx/wlw5ATbkMKQNutaa?=
 =?us-ascii?Q?KrRNGPB4XhhrUIvf4T1uv7I=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a721b8-7de6-4230-d70e-08dd47579cc0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 09:12:57.6031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bdoGY9oNFSvWv8SDkLnNHtkbgBe0Oy1Q53TrxFhcWqqsxq1bcKjzlz/EUsfg73uQesIVTICbzVi8hKvX1YkaKZ8+0/Dkhm/ewJ5teTg+e78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8461
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 09:13:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6283

Hi Yoann,

On 2/6/25 7:17 PM, Yoann Congal wrote:
>=20
>=20
> Le 06/02/2025 =C3=A0 17:08, Quentin Schulz a =C3=A9crit=C2=A0:
>> Hi Yoann,
>>
>> On 2/6/25 2:18 PM, Yoann Congal via lists.yoctoproject.org wrote:
>>> From: Yoann Congal <yoann.congal@smile.fr>
>>>
>>> Shows an example of the new variable OEQA_REPRODUCIBLE_TEST_LEAF_TARGET=
S
>>> and still mention OEQA_REPRODUCIBLE_TEST_TARGET/SSTATE_TARGETS that wer=
e
>>> shown earlier.
>>>
>>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>>> Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>

Since this is your v1, I believe you're not allowed to provide=20
Reviewed-by/Acked-by/Tested-by/etc... given privately. Guillaume should=20
give their Reviewed-by on the mailing list before you can add it.

[...]
>>> +This will test the reproducibility of ``my-recipe`` but will use the
>>> +:ref:`Shared State <overview-manual/concepts:Shared State>` for most i=
ts
>>> +dependencies.
>>> +
>>> +You can have finer control on the test with:
>>> +
>>> +- :term:`OEQA_REPRODUCIBLE_TEST_TARGET`: lists recipes to be built,
>>
>> Reading this I'm wondering if this includes the recipes that will be
>> built using sstate-cache as well, i.e. all recipes that will be built?
>=20
> OEQA_REPRODUCIBLE_TEST_TARGET is the list of all recipes to build twice
> (once with sstate globally enabled, once with sstate globally disabled)
>=20
> Before the second build, the OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS set
> of recipes will be built using sstate so that the second build (without
> sstate) does not have to build them from scratch.
>=20

This is actually documented at the end of=20
https://docs.yoctoproject.org/test-manual/reproducible-builds.html#can-we-p=
rove-the-project-is-reproducible.=20
I feel like a reminder wouldn't be too bad of an idea in this section=20
even though it follows the one it's explained in, but not a requirement=20
per-se, up to you.

> We usually want OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS to be a subset of
> the dependencies of OEQA_REPRODUCIBLE_TEST_TARGET but it not enforced by
> the test.
>=20

If my understand is correct, OEQA_REPRODUCIBLE_TEST_TARGET could be a=20
recipe A and OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS could be dependencies=20
of that recipe A, so it's not necessarily a subset? But they should=20
relate otherwise they are noop?

Thanks for the explanation!

Cheers,
Quentin

