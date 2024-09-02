Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68552CA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:41:08 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.47])
 by mx.groups.io with SMTP id smtpd.web10.35736.1725273661415905679
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Sep 2024 03:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=IbgBQIVP;
 spf=pass (domain: cherry.de, ip: 40.107.247.47, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1Y0jEkvRsSh1ekU/ABeaGCnCqq2W8KsYDW/xhxmq3uAhuxWYdmOApaO3x85i6/IHJ1zLsNkLaolcpUGKtPm5gXyZdToyvEqHTk+TC/8lddMd9J8yVMcCw0ez6YCpSNEGNpyRf01TIGYUf5hTpn4hOkht3X0V3/mh8ERkZ6AqjTsdeiFl8aFe+5Xeozw9+1sY+gX6Z0EyBp6Sbe+9Y6FBX4NF/VVgUKvDm8WMCAfJk2ek9iAT47QUUvpH2CEUGBxel3Or7ybztR7Yp6cnBZLOM+3KVx6zEghISd8XioUAbzcpEn6quw2KWz+gWMpPNbkMoY5+oUuQcd0ZDaDT9dzFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiyD4NqAWDrXtznQdBQccsr8o/c0sfhjdK4+wv90/Mg=;
 b=d/I+oDXgJSXEuf0FOpzGjWPfTTcgpHQGmhG/K4cx5fYX/pBqy1OwkS5kEs/VWdunDQaff2mYKT5zslN0l5cKXnfSPJBT6Pybv/vcTAl8fkLMj2g7pe4TULox5kJcsWV8WHuaffXgy2mEufh4ICy0PiAxfb0XziSZzHU9xgd2nnT7afvtjBRBRf+R//2cH7QWiIAqqQVyC0fc94Ejgtvuq9ep+Uyi+Oc+aFVCp5Ct5U2ahWM4TLmLABfM13H2oHa3j1kvmzsLSXXbjqHfxF+fB2SG7tcfXZimAlA7nltPf8M/MuNqFIIiEeSF4xwVKM+EPwMPx/VZjohBPEz2h+kn+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiyD4NqAWDrXtznQdBQccsr8o/c0sfhjdK4+wv90/Mg=;
 b=IbgBQIVPZH4Af4qisuCg/KeI6FbITgGBxYnqSTiS7ziXTIspuULAF9lyDQexVE3H2H/8tasuqjLYd0gRtnBwAdVVuGEWKPiC05oJWyzeJMv2xkBKqUP8/ZxmnS85vyoAH0kb2BZIRqQKQWSo1Nsr9A0HERGxQ/bfCUWmIlIKltA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI1PR04MB9906.eurprd04.prod.outlook.com (2603:10a6:800:1e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Mon, 2 Sep
 2024 10:40:55 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 10:40:55 +0000
Message-ID: <71c085db-d16d-4d60-a489-28d56bc07bbb@cherry.de>
Date: Mon, 2 Sep 2024 12:40:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] doc/features: describe distribution feature pni-name
To: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
CC: docs@lists.yoctoproject.org
References: <9288e40f901792887ac98417ae8c89fcc2f23a0d.1725018000.git.joerg.sommer@navimatix.de>
 <9275d1ee169aa794c789fd46d2e1f8f68befe281.1725088479.git.joerg.sommer@navimatix.de>
 <97f6df0d-8f41-462f-924b-5de4626eb26e@cherry.de>
 <jxpkr6zfcyhqattfqxvafzkzfiouoicvnpwdgtacztrfdodb4a@smhc47c3enzb>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <jxpkr6zfcyhqattfqxvafzkzfiouoicvnpwdgtacztrfdodb4a@smhc47c3enzb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI1PR04MB9906:EE_
X-MS-Office365-Filtering-Correlation-Id: b79b6e71-1cf4-4d8e-6639-08dccb3bb995
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Mn9lTg0/4NzBfElBJEAS52L10zl5/9cxj95Yrvsjz6eyRnX5XZl5keNmPDnT?=
 =?us-ascii?Q?Je2gY33KTQG4AK+RKf539FTMnu7SD8EWrvaqmEF9yt+hR1HdRtG3MxjcE0zT?=
 =?us-ascii?Q?O/V/4Oi64BhTxK5FiHtJP9z0E0r+bcTmbI9W16T73ksZglnJ6M+bpC6yKTfA?=
 =?us-ascii?Q?hdrVMNfazVskhUb8VurJrc947KFYITHKLTyxuFJoaAFS/a7ojQ2kTeC6WyHq?=
 =?us-ascii?Q?ZJgOPhnAILKBeVw8MmK7j30a0k6pKrmepwSmcQuKs+RkLkf/GdLb2agUr+/L?=
 =?us-ascii?Q?JOoG0dA83/Uphh2wglBhRvJYkT1GQBTd5HfuU31XzL46idTmQL3al1FKL12e?=
 =?us-ascii?Q?4M9f8g+fMl8+cGNAekvVUHbzb8GGGSrS/780eexGCvLrlvvjSnuFOWxHppaN?=
 =?us-ascii?Q?fwBo+eU8LzAeP5PQ/Pu9570CmX7XlgP4uEuW2ihQyXPw66Opp87YYEfQINKi?=
 =?us-ascii?Q?ZqlVqVZdLeaydTMXnvgNegNOwkzMKCZ16jQsi88oqc/FhRzGxFW6fZ+2ekrg?=
 =?us-ascii?Q?rjnGo4FbhMtDgIr7qALp3JstL4vNTHBkC0fF7SrQU9HRvfIASXI8jchCNLWH?=
 =?us-ascii?Q?s5tX7pTqg3hpgivKwDw/XgFROLHhtqzUoKUFcwuQIneNcTJzoxy3FntGjXeq?=
 =?us-ascii?Q?UR/DqAWyywMLbTi2rTXquEV1KQLuDNv7wi2ZXvz3YNpaVzh86AuWG2uLo1MG?=
 =?us-ascii?Q?yCamCf2wZZsy+NnTXMcQkqCuZ0MiHkuMvZRzpqIJqUy695MIIvwHjJZl4D4W?=
 =?us-ascii?Q?qvOksqvhOU49VuLeoRlMWVUwblmuSdscthyqrUNYoTuxzPAvvCTlRzjVnxyu?=
 =?us-ascii?Q?tVEIloG5PVm5wHFDnccwg6A3j+jnhH5DRkkzt7H5pw3qASK2HxnTFb1lmpZT?=
 =?us-ascii?Q?WIaS898n6Cv2bIraP9HJXOsyaSzWbBdD3KYFX5Q/EIgawVNWRsVlqYTdVaN/?=
 =?us-ascii?Q?3xBxllhuo1+kGFjvrUlMQtI76bcPlZ9SJCU1GkaMaDMdebtcgVZmZTE1rm67?=
 =?us-ascii?Q?NH2zlblOztHzpsNvSCxpJYvZFa8w9TXh7TA9L/h1OiWVx0MShKM0bcqcl3yC?=
 =?us-ascii?Q?btGsfjQ2Zx82OmfNVOL+6wwmXWzzJyiFowQeC0sJm0Xg9IWgqad3AytnGjgO?=
 =?us-ascii?Q?m5aKVvhnzmfHB5JGPWo+954Mv0I92Ju5BajUD1U4wEioPEcXwbV2FdGSJBX0?=
 =?us-ascii?Q?gZQBlGGsxYSzLwQBMScxMZA+uy2peXDosl88qXXHXJmesybR31v6ugiGDY3v?=
 =?us-ascii?Q?NsTDvz7KvnfGzer9cV7Dh+g2WubHVOW2slIyZLOSZNRbnc63KwzyXAI6O+FA?=
 =?us-ascii?Q?0zqs5t9kqYdUsvOGsYfodjMyyobdVprNNGWhQzhlA/IDQg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?93YMT/ZW6w68disQaBzsl0nZMEMtnLpPdCoUorEamvRZOtm7a7sFu6Qsa/BY?=
 =?us-ascii?Q?RR4Q9TwR4E3DM9zUPzGPE2LUZ0FbRTRjwU1iPN5sWGbIDSwk4dBJGX2xCF1v?=
 =?us-ascii?Q?r91DUcWn2yvCNLoVUgGX4rUIGlR2s7woySdpTDuGRmYShKHp1TeJ2qenmp42?=
 =?us-ascii?Q?5Ugswt3TN32uBKNJHqNCTU2wU8qbw/OJcNFFdP58KwHp3ASf8YFuD1Ov7yqG?=
 =?us-ascii?Q?uxpjoxHcbs3Vm+wS3KJbpLRG9DGj0N0BicAsnocJn1VUzxPdV/Cai05Q67yO?=
 =?us-ascii?Q?1CwcbjvMj2Q01qkroqaWjtMRl/ateaTy4rdPYxQZgJKnaR+xpiCfuFXGIsCe?=
 =?us-ascii?Q?zkLQNx9ogNS7fgMUENXO13bTtDMJZ1sQtfRnOpzs+Xofjjk9Hjee03ioV4vu?=
 =?us-ascii?Q?5PviIm8k1WNRhHkAlV9CJeARSf4qqFACAzRZG80/mIlBE/7mOCPUvn9BfIe1?=
 =?us-ascii?Q?ujcffL65ys+b0c7VS1dUWkO9umrsYI7NJnv7LEAIEt13FPuhnQGeSTUYqVr8?=
 =?us-ascii?Q?/zF9Dwr2/LszgYMVUdfM4qHNHAs77bmp5W7AXXGAjtCpqr4wdx5IfP47KLjT?=
 =?us-ascii?Q?KebD/fBOQxNi7ZmBuKDvRPcLL58nSzEDHR8t+7u2Y1510/fjWJ0A672pUNPd?=
 =?us-ascii?Q?4fwydXnJTmiP6wTNwGAIcQ5EemPY4qqzWmbEYJmerv/mM/Pcv7YxpLnGF26J?=
 =?us-ascii?Q?r41M5ln+DA9JJsTIcedBosXNYyaWjCijHu92VRBuSYxb0/W0raqmwxl4wlin?=
 =?us-ascii?Q?OZUZKcHsAsx2vt2X+Wm4c2alBzSiVd+rKjAw+KTAimBo6/jOi3EtGy2uADpT?=
 =?us-ascii?Q?7YcQj2PYX65cOySV7842mvWzYiB4ZG32Rm1l/T5bGiA8uFXnVMp3/VRpJmnx?=
 =?us-ascii?Q?BthGauK2ZKXNPRl5TKbxezyO0tEO9xXhGZd5YKyyIveth8vmyEZKQNRtojSG?=
 =?us-ascii?Q?5SWKcUcmKol4obVm6uz04JGTcrssr4XiCG1ifkPeCQUoaZLoUbqZRnP5CD4A?=
 =?us-ascii?Q?d+G9D9sBpKe25z/hEZ4vYFT/SHoC04ktXUBCCocaEzf39s7/U9WhZYWLBf9g?=
 =?us-ascii?Q?BiDbBSwkeHzOSK6akeyjojV3A3ZT8vEDkb4B3pjPbnzOQkhPOPLSvPglHGGN?=
 =?us-ascii?Q?tBxSbh0Im7PMM2HSOz1U8L00brsEe7BVsV78I9WnjbXGU3d2tM6ypYH9M6kS?=
 =?us-ascii?Q?kwHI8RBDqGv7juMflsw7F39hs+mfViWxNNsEdiTBhoG3+esFp/mv9n/ytWnt?=
 =?us-ascii?Q?v7BC3CReE3/rOSLurrQeGcEuFNUrQadSJU90Nj/gDLzZmUTjwCJ0bZ20l81s?=
 =?us-ascii?Q?jdDSHefWjeTSIIlVgM7AS4KIaRwZa8m5kFa7SvXGNZZOJHsAP2T1LgMZLxux?=
 =?us-ascii?Q?0tLJKujAt/Q6wg6eAHK+38JXOzTUBORnhBU8rnGeXzhvh4uRbUlqLDdG7uqJ?=
 =?us-ascii?Q?aYc1Os+beOV8DfJc51E88ChSejYsDLcj1spz1th1VGt/vLoD0fyGwPO3114K?=
 =?us-ascii?Q?4RomWJlknMmrCv+zGhqghN8LEf0Hjm6V2Mz/mxO3fM2CEKJA62PNBhDrWVln?=
 =?us-ascii?Q?2j0A5IB2bF3fsuwTm9Oxfd2Fv2giMEuSFCDYzKdvZL/V9l7D/wwn03YuXFsv?=
 =?us-ascii?Q?ew=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b79b6e71-1cf4-4d8e-6639-08dccb3bb995
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 10:40:55.8558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QEb/4RCkGBIZVoUsBp+1/mTgHQddruMICG3jhuBe8gcdpOzOx8akn2NtzeKu860urZ2IQkGUQPBxuP/y6ivmO8+tr4yqTIBKT/Ctt+Io+jU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9906
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Sep 2024 10:41:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5349

Hi J=C3=B6rg,

On 9/2/24 10:59 AM, J=C3=B6rg Sommer wrote:
> Quentin Schulz schrieb am Mo 02. Sep, 10:42 (GMT):
>> Hi J=C3=B6rg,
>>
>> Please try to add the v2 when sending the second version of a patch so t=
he
>> maintainer doesn't have to guess which one is the latest from their inbo=
x.
>=20
> Yes, you're right. I've realised it the moment git-send-email printed the
> subject.
>=20
>> Also try to add below the --- what changed between v1 and v2.
>=20
> Is there a git-send-email option to do so easily?
>=20

Not that I'm aware. I used to use git-format-patch and then edit the=20
patches by hand if I remember correctly. I've personally switched to=20
b4[1] about 2 years ago for my contributions to different projects and=20
the diff between versions is stored in the cover-letter, which is stored=20
as an empty commit on top of your series. If there's only one patch in=20
the series, the content of the cover-letter is added below the --- of=20
the patch.

[1] https://b4.docs.kernel.org/en/latest/contributor/overview.html

Cheers,
Quentin

