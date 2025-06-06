Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE62BC5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 15:21:52 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.15])
 by mx.groups.io with SMTP id smtpd.web11.36198.1749223309722584410
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Jun 2025 08:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=WoNlBpa1;
 spf=pass (domain: cherry.de, ip: 52.101.70.15, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1nPXjf9zRWzEgS0wiAdQP1ri1nqGcbs3R1DXu6hnROkhaExQ3A1UMsEWSVEa169H7Th7hgZpIkf1dWisekJ5nZ9Bh4GyTm26vUUDcMNoFjsWICR3KdQCacLVT9LjC0CCi4m1hQ1MO5KCDeOpWliHnCl3kNT0AofNWaI/sCBeHrRvreTk71E2O1IGN5wgVpLnse6D+i4rzZRqlyXxDVSeC53xBWijPuQLkwLar76qYzwVOQ7CW9Onrfyfmr6xjoisSIxi3PIyo/+pydX1Iz4o/L1mEGAtytpaSeNrmGCOkKX3p7GsSqaBuH0zjdxFOPHgD/uu7MQeRKTmCnNe02y4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBrxsMLXPBWuXXX9rFXC74NgNOlO1NGLIwjPTsjl2V4=;
 b=u16+PH41sBcrCI9bx4GqdqjjkfPYG41eI6tfFakSluk35F889gb2hBGmzoPNvX4lxEdX0r5VhNCelC/ZreY2QRD2f283FfXKM5a6XDMf12/xgqvnaOaBfTwvbVNzkoHdDkluoxNv2M8emsyaOgDpJll5hxDdEw5G5BFzCjqJ+vjTcVd1TRQTu12P0NKficGjnbuywK4EARdD4noflyzWF89FDpJ0uAn+CP5ctTTf7MW1wZHeD5yBmOnclYkWpe21mec181fyT1HgCoa3/mAKXmNNXyba7pLUCNFfwEJjnv3egYAzf+KhljpE+xwl+s4xOMHAMiT8QO/xoYdwA0X8Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBrxsMLXPBWuXXX9rFXC74NgNOlO1NGLIwjPTsjl2V4=;
 b=WoNlBpa1m6ahw+Q95bHAedKiOQTRea4jBhJWGSqy2dxLbxHWwDm0li6rBNH4aaWd3Dyq4VCxMKsc4oJjjTPhoSV80vzZlpslfWtaB/yRxQhSFJbCOARGwRcrteNF1nL1AVwk4ACcS+ZkGuwIkuwxYg8H1bGT7k4MIyUFzMP/IBo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10276.eurprd04.prod.outlook.com (2603:10a6:150:1af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 15:21:43 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8813.020; Fri, 6 Jun 2025
 15:21:43 +0000
Message-ID: <43816478-09d9-45e8-a4b0-dd83d46514e0@cherry.de>
Date: Fri, 6 Jun 2025 17:21:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] conf.py: tweak SearchEnglish to be
 hyphen-friendly
To: adrian.freihofer@siemens.com, "ejo@pengutronix.de" <ejo@pengutronix.de>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
References: <20250520094514.2672646-1-ejo@pengutronix.de>
 <ed79ddf30322194c0fdae914e9e07862d85f830e.camel@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <ed79ddf30322194c0fdae914e9e07862d85f830e.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1P195CA0064.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10276:EE_
X-MS-Office365-Filtering-Correlation-Id: 54be0baa-7f59-408b-c42d-08dda50dd835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8tf0JK8lmPTYPoieIw7ywDsM30pnz12oeaQuaWyRhZTMqoVjL1kmMGRyiTnD?=
 =?us-ascii?Q?92qGXVGv7r1wmQdrvMdgmWtFOCFUIq8GEELfLkZH2K7TZO1TzSc13F/blt+Y?=
 =?us-ascii?Q?bD+Gr4T+9FSXmzRK9GUeuCkvTgkO83ZvCb7NjbllMBfW19q42xu+JywxmZyp?=
 =?us-ascii?Q?5N1BJr5JLRa3wymiX3WOFO55AZ5aE+GiZ2JMQ2ck8Dvym4XPLPeSOtPaadCu?=
 =?us-ascii?Q?vKZ9tMISFG0m2QYnfe1VPsFC9WkGHEyyK6rdbpg+J9anaYs2Sz2CjDVwPuSX?=
 =?us-ascii?Q?bd+XDRPOcyuV5XpjsCoQyS3VHhlwFmrvtnPZ/+Vtm7JAi2YgIhhefXMn64CV?=
 =?us-ascii?Q?8JzQtu8liV3rccK3vAZ+62kk4rmnQYW01tVTf8E1hlI9+50fm2ZyEQBzLfcI?=
 =?us-ascii?Q?KrLM4c91NaN5eOKfCkv012B7Nq9VrpvDUwPmmvW2mM1u96IwZsCRPrWDfiYD?=
 =?us-ascii?Q?5cx0J5WFA4Dav78fRRW05vvSaHZbZBTIG99e0LbeB0apRUl617un10uqA3pI?=
 =?us-ascii?Q?zbw/7ig2Ey5p5FuFvCnaMyiU8oikHCcSJ6s+g0UvxKqpK6uErNvGV3hc97DV?=
 =?us-ascii?Q?KAEo1TPsg+msSFH0t+DXUyHkp8xiIjzx/UDcVZBKWRHrgsTC7TRP4PcBXjDB?=
 =?us-ascii?Q?aPA1O5ePaZKeBIPBRtnSfh1S8/xtDZh60XK4bnm0DYADp8K+ZzipRaOB3bdT?=
 =?us-ascii?Q?2Jp1iGNO6z0QL1SjgAgiL5gBJqSc8LFPK6LV8hzKGUfj/o/cRtpe/djOmxBM?=
 =?us-ascii?Q?GeUFpym7+Rb1TBQQRxtQtF88ay5R1bjnZ5l4pOK6fvV6CdBRv3S6ddsXHheq?=
 =?us-ascii?Q?iF6LPJSLDp+Ex18lieHORQM8fH6euWzhttEddgaJ9wuhGLX/umSIGis8o9tI?=
 =?us-ascii?Q?ta04snuYvxzfV+eM1yOHtPMPRKCJyiDvNpCF1snniWgaEeD6U923xxSPEOa3?=
 =?us-ascii?Q?iMwlqXqTIxbOJyCESja70yljIXdi3Izt5M1wwLCWDpoDvDzqRqtiFFP4Xucm?=
 =?us-ascii?Q?cE1uRadNjGPLJeMgKQMwj7hy25C7Pfk/8hsXlt0ylArUg/2OIxCWWbrZc+d9?=
 =?us-ascii?Q?m8OaEImM061MpJru/EsaCM4dnMWmWOOLtD1zH2Q3LpDNlJVEWWAPp0xC9BMD?=
 =?us-ascii?Q?YEW5Xx4lO+Tmr9gPM2BhAXQ5g5k7LTXFn0OkY4NPHPhlEMBSE6BqXGek7vNV?=
 =?us-ascii?Q?No6CZDqJANFF5iZYFsPOcKl1cIUwCuCljB2N+o0UcR/vAkgKkCe7bzmQtvlp?=
 =?us-ascii?Q?5V1Z89iaxBdsZNYDHYcKI9MvlF5mfpVzhySkO/LwS4/phSCcbZH/YlEWdl94?=
 =?us-ascii?Q?E2UJKTyOC6t6ctD0/twMV2ikd1oN3hi0RGkg2R0k0uxa2wpIo6aAtPmLvYsQ?=
 =?us-ascii?Q?6RhX5QE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dJ6BsU9gTnTAGUB8iZ46JIy+EMI5CPpDMFpHOCqkPVkqB1rq1XIDbp1nuNJf?=
 =?us-ascii?Q?vxtTJy18VRJEA/OhZ+Z3cT7bQP7D/N979HlTOtPjijT0ufpMQebX+5tBf0qZ?=
 =?us-ascii?Q?4Bx/0PDPE/VmQ+txCUsyLW5BBm9RQT9QLKcGFnRlVRkjzA1As09eEigGoYbr?=
 =?us-ascii?Q?lrDKgN3NcFPBWQNV3IKEQ8kIvtRksKkXbmYjUia01qfE24KkJW96pDKl1bBZ?=
 =?us-ascii?Q?IgK0/uCaHJeRyFZxqepS+xQCEDJXs/fj2HedshcxcyxGveKH78Ft8nDK33hj?=
 =?us-ascii?Q?m3+QEindntoeNn35Fr2c2eyT4K1UhTGDDa2q6bomNJS/dSyNNa3BRvIHFUlW?=
 =?us-ascii?Q?yz2hLhP8VjWqjGc+2f89BG765dPdEHL2IHvSqVMntAk10SW6/DQGLDx1h757?=
 =?us-ascii?Q?uM5tcuMGaUoWasPkw3Q2DDlqyujBMBpFv594xMAIYjVGx1SKlN2sXfFDq9ih?=
 =?us-ascii?Q?gbnnKxk1dkpRCfK70sKg/lVbQnh3kaMsprwRXRCg1/U0X23EU/UkDWPuzr4Z?=
 =?us-ascii?Q?NuxTJjtHKvRTltuEPzX3zSQT0huC0yciop8T5eEGMVRcwdL2huAbnsXvmp/D?=
 =?us-ascii?Q?uXRfpHDky1xV8kpOIrb4NE806oJnId6wlb0wRu+gsx+NQqUZwWnE1038vGsJ?=
 =?us-ascii?Q?qy7yh+RmoRYw2ZQT1JUrwkJAvUz9VkgLTsGHd07PBIN9hdlJqVyk9V+aNpFq?=
 =?us-ascii?Q?ksGOd5LgekfygPwgfKmQ6UqRleanftEgWhLYoIkVI8Aoy1I7zVD1net1MdIn?=
 =?us-ascii?Q?ToilhC+HoYfl7ygPD9pzTNvzUvA03IbZiN54MWX2IKdjb+u0I5AksYsTwnIV?=
 =?us-ascii?Q?1Z3oj9nHFz0IqnOycC6Aqrp2Eqd31nCKX3YT6lD9YNKOcDSR+9H2d8Q9hSvZ?=
 =?us-ascii?Q?L+efcxrLumIx7E135/CEKztOE/j8XVVAzZ4pT7BGgzgw6McTnMzfVW+JsZyn?=
 =?us-ascii?Q?3sxuitWDwDglfZkSaxliJh2Aya8tplvvCyA998whLKVFhZ/uN/r3FOeSDx25?=
 =?us-ascii?Q?nZrC9pqmaYWtHwBEoJE+38fN2R9Msv1Hm9yRwLTnkS6+Wze+xUkUoyzCCnwK?=
 =?us-ascii?Q?JnFtquZQNhmgd3cpwPjw/TXOpX18iA99E8nOzqfs96itF55BufJ9TDlaB/z8?=
 =?us-ascii?Q?1TMm7Fvj7EKFVQXOznhBTPyfEHtxnCZaIZBEVIOaxU5XjdYyN8why2e7mWVU?=
 =?us-ascii?Q?e1ytqNhunNCxWPaazYL1+zYm3LVzi25I65yYlVmwCSQi4jFM384pjRkqYDwi?=
 =?us-ascii?Q?exCVWPLnmJHIEq9JPXZHv+yJxl8AzB53OREg48mIWAQ31JnlGOsgfRVT3z4f?=
 =?us-ascii?Q?nud5M/ied9W9fJpM7CsOcljuZzGbNoZHOskP+VSTq5gzctWqam02o9ufeRFT?=
 =?us-ascii?Q?zcEHNnCtIjyMYrOH19hDpr+zHQA7+69PWw8MaRvkOj11TsUQntWBM/5HP9j4?=
 =?us-ascii?Q?ncGUwImH6OWWweDLfWsO+aWzQGj8kkqYD9bGyI6elRDX+94DGsmGV9xhwaOU?=
 =?us-ascii?Q?W1V7gEQEnqx9tDta0rzuaE76MUfwnc0+ZaXxMOBl86xKPeXoO/UGNZa/eBWw?=
 =?us-ascii?Q?PL+BqrE/qahjA4BoHMyb24DWaDPkIPD4xMhTeNg33798ZfX27GPOo1JbvYMK?=
 =?us-ascii?Q?AQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 54be0baa-7f59-408b-c42d-08dda50dd835
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 15:21:43.8754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0uu5M6smhY3hV00x9QHbvy4ZyNX3Wz+/eoR+QnElWnYLbPucwV3aJRzEmQUHQCb9BIc6/6bcDFI+GnAMN1HJeScx7Zw8sRxwVMSgrhzTYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10276
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Jun 2025 15:21:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7026

Hi Adrian,

On 6/6/25 5:18 PM, Adrian Freihofer via lists.yoctoproject.org wrote:
> On Tue, 2025-05-20 at 11:45 +0200, Enrico J=C3=B6rns via
> lists.yoctoproject.org wrote:
[...]
>> +=C2=A0=C2=A0=C2=A0 js_splitter_code =3D """
>> +function splitQuery(query) {
>> +=C2=A0=C2=A0=C2=A0 return query
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .split(/[^\p{Letter}\p{Numbe=
r}_\p{Emoji_Presentation}-]+/gu)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .filter(term =3D> term.lengt=
h > 0);
>> +}
>> +"""
>=20
> With this patch I get this warning:
>=20
> Running Sphinx v7.3.7
> ...poky/documentation/conf.py:188: SyntaxWarning: invalid escape
> sequence '\p'
>    .split(/[^\p{Letter}\p{Number}_\p{Emoji_Presentation}-]+/gu)
>=20
> Should that be a raw string? Like this:
> +    js_splitter_code =3D r"""
>=20

I believe so:=20
https://lore.kernel.org/yocto-docs/20250606-conf-syntax-warning-v1-1-4ebc90=
ae7d69@cherry.de/T/#u

Cheers,
Quentin


