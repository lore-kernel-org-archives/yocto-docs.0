Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B7EC3ABB0
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 09:11:46 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.12])
 by mx.groups.io with SMTP id smtpd.web10.46004.1746436296113067763
 for <docs@lists.yoctoproject.org>;
 Mon, 05 May 2025 02:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=ZQsC7Xqf;
 spf=pass (domain: cherry.de, ip: 40.107.159.12, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvfS1Cm0Oqm9rRWPeO2TelMp8hY5/IcBP7iCTm8ktFdVW0iOBQCYMRT7gCEPwWCGQOlxILnJWT7ddmfdIJpNOQCcIYBv2rjKkLCIMpCqDIdJh5S1pMXGP6i8RPpZ8DvpXHGIZgdTfXhSsieUXY5A+p71q3BAOWZATeV0ezwdp2HvwAdw4dJhXQVIpKLn5WbKruu4fq5azIQIkk5L7oQWDD+qQIk3KTc26mfivcnjFmawi5PIDCpUgyykFih6fZtSHhOMChS+tmQjmZP5UVRRjxb7f7ybbJkia3S9+2V5Hf75IqlO+2kpyWd+7TYlj5lpiFHi0LpOJOURcFD4i495hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DrBd4Vjg6SO4X3AzE++SxRXC1mEEqHnBsTBWjDOGOI=;
 b=OEVZUaI/ywhjMhcZ5sbxHBAPqBzUh1BwcyYBSmwke+i+nDxH7jzXm7P49orDmQRRx/fbTE0iPfV8eARDoVt8aK72unw4R/QHNmG0NqtNI+gjohGO+nfv/ke8py6ZTSQe/MF+5ADTKJeVSe8fFzEtycq3Nofoz/wU4FSHrQfd6gm/wS3LZniLv75hhoD8V37RHwqOZhrhG7fWwzPYmhuJTkiuYICY67X+nP6RbyrXE+b5VCMHSeH2kEXVVAdAsQ1QSBSl65U1yoUJDPhcnGCMhRRpGl9Xe0RZEFChD2JbftpDyss71vbsAtd2ouNRjS/O8KmdUi0c8fZdVtlXRJgn0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DrBd4Vjg6SO4X3AzE++SxRXC1mEEqHnBsTBWjDOGOI=;
 b=ZQsC7XqfnJa0mhOMt0vKZ81jl1ldhUYJYPYaU4zXvf+o1yZKkr05AY0Oe05lC2w0IREsA+/bdb/rfNmanpF/ZIWcoUo0S6czs8STnyaMtQjyFSAX0gMhHwnxwg3yCZGqeZQk96hk7Gzfen2TM727qG0GelWSQRs6qNFVUxVZxFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB9497.eurprd04.prod.outlook.com (2603:10a6:10:373::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 5 May
 2025 09:11:29 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 09:11:29 +0000
Message-ID: <5484b251-9bd5-4de3-abb0-b3567ffd5631@cherry.de>
Date: Mon, 5 May 2025 11:11:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] conf.py: tweak SearchLanguage to be
 hyphen-friendly
To: ejo@pengutronix.de, docs@lists.yoctoproject.org
CC: yocto@pengutronix.de
References: <20250502203501.3364973-1-ejo@pengutronix.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250502203501.3364973-1-ejo@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15)
 To AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB9497:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c1fe9c6-dad7-4bca-d293-08dd8bb4d243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mcaEEs+c9/rY8GyMAI0VUieX/GyhIy18Aq6Q+/Z0EGYC8I8nhPPYDkb6AY5d?=
 =?us-ascii?Q?JAO31a1OZWEH+MdMrvqItwbIvR8iRCBdq3wU/2iz0FK4XO23fbsw4gS4heO+?=
 =?us-ascii?Q?pcoL9+uycdfTYhKgD3LA/Qx5iYjCtNvq4GAGaH9gctGkXgfKNB0NwgLg/EKo?=
 =?us-ascii?Q?iRGgmytNi1xr7SAMhoeNgyLBPJStEJPHklUPB2RHeKimoORzTz9nrlFbhDLJ?=
 =?us-ascii?Q?4YVPNugDIZOhGP0BcSo6/dZms/E1XWIKHx3bdgp+DmUTfAn5qIkWAfy5r1R6?=
 =?us-ascii?Q?rC32YCdLdqXb1k5TgWtDhqIMu8DPDIlXa4JQszY6QCvbfI9zf9CEK0A2T7+9?=
 =?us-ascii?Q?Vdl8uVJlfz3X9FOeXkHeN6ofeVtdLsARu+dkUil6fdV7hUwWOqb4GX88mBdd?=
 =?us-ascii?Q?krE6kP5QJCGSH/mbZKKCyUCm8m7VgZ+1ijxuiH6s3jKmI84A//OQmuNgXNvp?=
 =?us-ascii?Q?GEZFGUIe/FBhuAjYIlANm+DwEefWRJhNGHxwOzjudkHJ2Mlsa5SyUiU0oHik?=
 =?us-ascii?Q?sjRo32eDYHEq/kJouNGbLSfv5Gcm9M+Oupay3USDzGIbXBw1UYLKpxDVyBGB?=
 =?us-ascii?Q?wdhLvdwjAG2DoqPc20AGFq9WhMxktv6hvutrnlEcyzSFgv6Pv9NN42enNQlD?=
 =?us-ascii?Q?KgcKA1Ephpy+C9ESEpnFafbNt1KlZucV5SARSUtGGZMRKfmFRkruCbdlCLWb?=
 =?us-ascii?Q?jAkSEYmx6Mncig5RaE1oelG+RgpR06vxNeJKxIKlwtkeIotRtNpyooIFhqMy?=
 =?us-ascii?Q?gtEjVitF03l8dk0hRUhdoMg79KlXKaZgwRetlR8Uk+a6693Y/6UiqZl5n4iG?=
 =?us-ascii?Q?Ky2H91ffXaBQ8DSX96cSyOg6J7dVU7B+chYLL2DPXMeZvoVr/2i3mKZspq5Z?=
 =?us-ascii?Q?g7Qk7rmLgVfGzfNNb7dcD6vne/OHehKrXpfnaW6TItgi2vOyeI3noJrW0lDi?=
 =?us-ascii?Q?CRuQ+xbyVrZF5jsR/9kUQIrFESX/Jg1EO7EnfjWrI/37nlXhQtZ26a7zgaIo?=
 =?us-ascii?Q?IJwRxwmrCjVj/98TSr8bcC+bsbv8TgeLdzeHMGykj1dwiYwYIp8ZXZwTSJ5r?=
 =?us-ascii?Q?yTvJ6kAhkTv9IZBV3KePs7Ehq6WLbI+HhxYVDSrZ9w8Sc6RM34kzCsPSHFbP?=
 =?us-ascii?Q?ZN8vt2HU/Ri039fNRwmJjBTCBRxnxlbyoi8/DH8eL/Rz0dhdShndisWKRRqi?=
 =?us-ascii?Q?Sg+Mt/PPcm9eY3q6LJ2+HiXj0k69vAX5/X1HC5Wq0mgb5QY6K8yJ53cTusjJ?=
 =?us-ascii?Q?Wkn7UnAQ1XOd3JtXXwxq76t1EeMOr5Y69uimOBxy43e8bpqbj0hTpgh97Lzz?=
 =?us-ascii?Q?hnQnCuBSR/1lOY3fqkbju4TFBRS/Xg9MBEIv0FN6SuPQmrZ3lhinM6G0mMdH?=
 =?us-ascii?Q?mXVzTlG3ih+WS+D46qZ4P/heFLAdynW/bc0E4FE1rIQTkoqCRdcbuMQ4/miY?=
 =?us-ascii?Q?rwjbXOQrTc4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?V5aGrM41U1KbB4CrP5GGJiJd8cxcGXUbpNAXIRi6aJc63rjcHweoHGMoNrt/?=
 =?us-ascii?Q?vpH2TzXWNts5OeZuQnRjYDqWX3ZjqpS2un7+4PZ8qzZ4ZYAE2D/h6K9QfbZp?=
 =?us-ascii?Q?Y8tBZaE/pnAp2WATVYCwS0sOsY8biw2f+DU3yJwgY9LMRJ2Jh/AHzhdTZN05?=
 =?us-ascii?Q?t8itCOviXyseaAX2/4deFfgK5qjdLTIpdW4H7TWFBoejP69cRZTQMJMVfz8m?=
 =?us-ascii?Q?JQsOBMi8xvtXh61t0OYJ12zPGwor85ceZY3JnR4LtQQdU3caZPsmFI7pNQfH?=
 =?us-ascii?Q?x8XLGEBbCzJNBDmhw0Mzdc0NzhYhFlWeMS+1m/zf7VXyP4HzODzTJEzXPrRm?=
 =?us-ascii?Q?iWodqYBcA8YuZ1Sky8Y9zxIp7ImZatI1WSRxGfVZI0QMlWygV1bNVhsiE8/g?=
 =?us-ascii?Q?tKmi71iBJKQICRbQjoG1L47mQ4YCqOZwmn1g2Q4uWhSmiM8Kx/owbtZ1yYRk?=
 =?us-ascii?Q?IgTbx3z+jcOXaqlv7xTfYGeWB3R+A1Uaz2/C6DMKvfpzuD/RPX4yVjMptDdg?=
 =?us-ascii?Q?oGABUOsuWMhzQG+NlDeGvb6lmJxWmzpPVegnq6Uy5m5FMgwieisUDjS7vSMD?=
 =?us-ascii?Q?K3538vUX2VUOFjAoaBs2Bj9hcNEWwQfAQalZ7NZ1tTqn74LCWYlqlIhOgYg7?=
 =?us-ascii?Q?EwhYeWzDNT/C5vos5pRfuBmEVQq3hMZBKU2NAGKD/O7fWzryqB34/r1YVP5J?=
 =?us-ascii?Q?qDfGpmWmWwUK1qGgkPlZRsLWQOaMuulUyKuGPnZ6RwQaO52Ti5RTcB2+ErdM?=
 =?us-ascii?Q?7kj2A+D5wj3zrFd3c/PU/UYKSpkHp+Jk3ZHtSqTrxum4pz/wy7lQ2mbzNmcg?=
 =?us-ascii?Q?nlZVCluGnf6Y5hyRkCbXZyqz5cT5hC/7x7Gd0Xk4d1sDyAbWaQ6BGvZLmLDW?=
 =?us-ascii?Q?wMHbzmjduDXYh7Nnzr0MXl5pWwjkGJZOEh/SYzMHrt6QoGT4wUnih2mRuCnk?=
 =?us-ascii?Q?8z5Gi80SpGQ7t6awnZ/wur6zSVVf7fCkpopSn4X4pMl6CokjROXdhKEgw4/W?=
 =?us-ascii?Q?WgEnYxZ/lb0GCcYytbsC/3StX/D38Ftq1A7K4Vd3GloK7Pgm14LNr2WYzia6?=
 =?us-ascii?Q?4rGbCFjmccHifLuVUuJZnkXecoPKx5SMq2UTSSJ6Hk3bXIKsaAQky0FE+V6f?=
 =?us-ascii?Q?V6QDtlGMNI3cyia4YqZdQxVuC7SREe7qGh1r4ybdVNpp5q1AJO/D9prlxKfr?=
 =?us-ascii?Q?UHVkru8d9xBW8S9TeC0UwDxZqyoUVDMNlaSjUErPZQr7WiTFZuwcrGtUwuBq?=
 =?us-ascii?Q?LrNJ5M5+7peJn6REty+NrfN+d8oiflgUyZwXXeqz3OwD6+iYsEXLKaCcladN?=
 =?us-ascii?Q?3/slKN2BJa99Z3VnFnr+TWBcugJt3iGDqDVmxpkfjONDMimmPGKVWbvUjWAr?=
 =?us-ascii?Q?vaRj/pnD7KxiAEH/SBXHX4Y/eFYqrendbzSRIt8tbf+gfPqNJBw4Igd6ugFf?=
 =?us-ascii?Q?PMnXJ09MvT1LTIblnYi5yNtJKuYPOwMGAO8pYX1qyijxBcwa0jX63S2Kf2AT?=
 =?us-ascii?Q?te+lwVs8YAl6zNNo2n0iZxanFu32NhdQp3MzkXciYAoSMmutwiQlrkDUY1T9?=
 =?us-ascii?Q?B94j8EsHSV/AxiF9rdSMJGg2PYJpHaml1IgYPThXJYuaWnv2ngDdYz9w2wvQ?=
 =?us-ascii?Q?yw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1fe9c6-dad7-4bca-d293-08dd8bb4d243
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 09:11:29.5620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0d+DyHfpGEDD6Jo1MqqVjdUPSoCB9WK66aPTHDDpKysDX81sCQVAaOtDcfuKXuHxt9K1O/PsKyY8HOjKtX4cvGbwuo830gP39lK5Fa3mpK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9497
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 May 2025 09:11:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6796

Hi Enrico,

On 5/2/25 10:35 PM, Enrico J=C3=B6rns via lists.yoctoproject.org wrote:
> This modifies the default indexer split() and js splitQuery()
> methods to support searching for words with hyphens.
>=20
> While this might not be an ideal, rock-solid, or fully future-proof
> solution, it at least allows searching for strings that include hyphens,
> such as 'bitbake-layers', 'send-error-report', or 'oe-core'.
>=20
> Below is a bit more detailed explanation of the two modifications done:
>=20
> 1) The default split regex in the sphinx-doc SearchLanguage class is:
>=20
>     | _word_re =3D re.compile(r'\w+')
>=20
>     which we simply extend to include hyphens '-'.
>=20
>     This will result in a searchindex.js that contains words with hyphens=
,
>     too.
>=20
> 2) The 'searchtool.js' code notes for its splitQuery() implementation:
>=20
>     | /**
>     |  * Default splitQuery function. Can be overridden in ``sphinx.searc=
h`` with a
>     |  * custom function per language.
>     |  *
>     |  * The regular expression works by splitting the string on consecut=
ive characters
>     |  * that are not Unicode letters, numbers, underscores, or emoji cha=
racters.
>     |  * This is the same as ``\W+`` in Python, preserving the surrogate =
pair area.
>     |  */
>     | if (typeof splitQuery =3D=3D=3D "undefined") {
>     |   var splitQuery =3D (query) =3D> query
>     |       .split(/[^\p{Letter}\p{Number}_\p{Emoji_Presentation}]+/gu)
>     |       .filter(term =3D> term)  // remove remaining empty strings
>     | }
>=20
>     The hook for this is documented in the sphinx-docs 'SearchLanguage'
>     class.
>=20
>     |    .. attribute:: js_splitter_code
>     |
>     |       Return splitter function of JavaScript version.  The function=
 should be
>     |       named as ``splitQuery``.  And it should take a string and ret=
urn list of
>     |       strings.
>     |
>     |       .. versionadded:: 3.0
>=20
>     We use this to define a simplified splitQuery() function with a split
>     argument that splits on empty spaces only.
>=20
> [YOCTO #14534]
>=20
> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> ---
>   documentation/conf.py | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>=20
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 2aceeb8e7..02397cd20 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -13,6 +13,7 @@
>   # documentation root, use os.path.abspath to make it absolute, like sho=
wn here.
>   #
>   import os
> +import re
>   import sys
>   import datetime
>   try:
> @@ -173,6 +174,26 @@ latex_elements =3D {
>       'preamble': '\\usepackage[UTF8]{ctex}\n\\setcounter{tocdepth}{2}',
>   }
>  =20
> +
> +from sphinx.search import SearchLanguage
> +from sphinx.search import languages
> +class DashFriendlySearchLanguage(SearchLanguage):

Could you extend SearchEnglish instead, which is I believe what we=20
should be using today?

> +    lang =3D 'en'
> +

This would then be redundant.

> +    # Accept words that can include hyphens
> +    _word_re =3D re.compile(r'[\w-]+')

I would recommend to have the dash as first character in case we ever=20
want to expand this regex to avoid inadvertently making it a range, c.f.=20
https://docs.python.org/3/library/re.html#module-re [] section. Or=20
simply escape it so it's explicit what we're expecting from it :)

> +
> +    def split(self, input: str) -> list[str]:
> +        return self._word_re.findall(input)
> +

This is already what the split method from SearchLanguage does,=20
therefore no need to override it.

> +    js_splitter_code =3D """
> +function splitQuery(query) {
> +    return query.split(/\\s+/g).filter(term =3D> term.length > 0);

Why not simply add '-' to the default splitQuery as in=20
sphinx/themes/basic/static/searchtools.js so we keep as close as=20
possible to the original behavior, just with the added dash?

Cheers,
Quentin

