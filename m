Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56676C02181
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 15:25:14 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.97])
 by mx.groups.io with SMTP id smtpd.web10.31724.1737905105976344800
 for <docs@lists.yoctoproject.org>;
 Sun, 26 Jan 2025 07:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=NDMCUwGI;
 spf=pass (domain: navimatix.de, ip: 40.107.249.97, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckEt20qk0iBZ+n8BjrwY504xlf2YkrVtAxrgK5eH9yaKBr1lrYzPoxGswHYzipZz/aw3UkqgGx+r07Kdsp+n7PvQqniisH2ckk9ZJAcfzcGpojXsNRYDgeAB3mLiHcDO2n4oB47FPw/W3wM185MsQTEOgF9vVjJbWUL6NUf6D4lCvzN40za9OEBr1O8gAwNhPQtYnogWNiBDk0x50fIT5Uj8KvsJ9HDsw1d81tdimqJ2vTulhYJtevwCrDa41OihGQqxEFJttzEh1WtGGN2gulCRrVWwet6uZKFpfG4h/itjtEONRpYKYxLV7YWYtUCmU6MI5bzDagOz9YsBfoNHkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiPl8ExDLHL9CBQTu7wEHqnqvgN2X0j95HfNc7wuG4g=;
 b=nXV+MQJqqh68/HCTZccY3JQJY5qJM5me4Jq313oseWisNfV+kRrDCe81aMUC1m5VZAOCgz9K9N2YXcuI4DsrMcJdI1a7b0M36qeCkrZYmoeMY4jzxs1fThAL2Vg2QH1q/rsypOgaecwQNSqsQaUoUfdPnM7H97nUo4afxc7ZRSlVdnWv97dr1skgiwV6IIyJ5kRkRovUuqKBZNaSDMZ159a98NLtzCxEMMfshmpXWVABUAuaf7G/YkU71MAs+nzHj9KWMOzDCLDmMSHI4CmTBLt5oqeJBQ4YGEf6ZZDePWPsfM3YI0JIex8r4nLoZc5f6Z9x4wlUKxby9X4ysYR+hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiPl8ExDLHL9CBQTu7wEHqnqvgN2X0j95HfNc7wuG4g=;
 b=NDMCUwGIee02zEhMkqYXbpgljAZ+b+W/cLBX00Ztxa5L5mpHvAb9AY3hId4tYHOFKpbf7gNxoPDBP28/e9nV5YBOAVWj2sEhiNiziUWGT9zKq3MvOL+Sc/p1EfNgwiN8aR5xeyAmQzK8TbhLE3CQCEWsGmZcj9jAvZVLXzwhMMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS8PR01MB7240.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:23b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Sun, 26 Jan
 2025 15:25:03 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.8377.021; Sun, 26 Jan 2025
 15:25:03 +0000
Date: Sun, 26 Jan 2025 16:25:00 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] doc/wic,README.hardware: add dd option conv=sparse
Message-ID: <hxkb5rwmau5lcil6xwof2wksghwsqbyrxys67uu4xv3goep3je@sepxesev554o>
References: <2cef35c707ab0d985578ca4d042cfb33902dbcb5.1737894876.git.joerg.sommer@navimatix.de>
 <2d28b3a78a7bdc3be27bee7d9d911e87bf4ad45b.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2d28b3a78a7bdc3be27bee7d9d911e87bf4ad45b.camel@linuxfoundation.org>
X-ClientProxiedBy: FR0P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::11) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS8PR01MB7240:EE_
X-MS-Office365-Filtering-Correlation-Id: d6846c1c-ebe9-4513-7ccf-08dd3e1d9ac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dU4uq3x23qPZf1za/hbkjOs4Pc0VlgxtqioASJxEGwfwS5V90a4HVBhaNQ2M?=
 =?us-ascii?Q?DnBSvX2cc+THFBIBzLBCLwpdFv/rfGEqhhyu4wpXgiGZImn7yj6vi2XgwTe/?=
 =?us-ascii?Q?QzOgCXhBDredIhmnivbmTr1JbIm2uLTd1jmTys58BYmv4vm4FtVycNwaJmno?=
 =?us-ascii?Q?0+YQUMAbFY9V7BLKofRdaOw/yrNE6Fs1nbZIa3wCzL0P2wzCFY+7BeyF+9vl?=
 =?us-ascii?Q?iLDAdKnfBoBfAEwIMhFrJqcDI+CBvpUKRmPM2vd/K3I1wmngNYYmtMe5NSNg?=
 =?us-ascii?Q?Z1JlShfVbYejAyxdGNNKDI5GyBwb2P1eLKdIePG5yuA7FSx4xsDL79+w6jk7?=
 =?us-ascii?Q?Gl4pAzExG8sguPfMkboQMB3kQeoHl3FxWpHfSXcDEg+Kf+R2we94SmyCcVWz?=
 =?us-ascii?Q?ffLf27tTrK9e6ymFyw1GNG/xGu+cH0ISLB5Zs+blJ+El2NzPSzxz1yZGgvp2?=
 =?us-ascii?Q?pAFN988BdoHlPStB/t+uuaVyM0ACzc0aBZ3dwwpRIy69PkRNQyZX2qCbUJpb?=
 =?us-ascii?Q?1peR65aaqHjROJbu747B8BreRfLYi0EE4RyvJ/JC/049q1oHcVsxic4wdiok?=
 =?us-ascii?Q?A9zUIaclKWy1p5eeZrBGGr85evVuHAm9cZ6buyerfmlAbHaFkqzl0ixG5pPB?=
 =?us-ascii?Q?ynykHyl5bh7FU3vPdOZTCye7X6OpGBHbIF0k+6QsD3LABbqL+0d3sXuIDoXw?=
 =?us-ascii?Q?Zwv+7KyC4M6TvcdP9n3yKNvWKalVP5zdW5bZovOE4wWkGjSL13qFPnMeVaef?=
 =?us-ascii?Q?MMHEEoRnhBTnXZ4Dnuoy3p9r00gqAE2YWZQtOltwjtO6DCh0/OdJf+ksQoe3?=
 =?us-ascii?Q?5/DrM0zpPexozFGBjAeaYJROsiZ9k7cqsihzw5HiRwXe8YWSwD7amjo1XvgB?=
 =?us-ascii?Q?AYXat+p2cJ6is4by1JOqlmWYOuNfocyFcx7iaJ8jjNQMyCV+g9D7qpvhvd4L?=
 =?us-ascii?Q?hPoJbP1id0tUk6w2rOOsYnogYOGwCFS9iiW2dZ98ZSlsNmx00b9Y+MJ5BOmj?=
 =?us-ascii?Q?FGXkHw97g2Mk5tFu6+YMe1gRlYrELvN8NfMd00ZRWeSMEeDZ1w8n7pAffSRT?=
 =?us-ascii?Q?bAM77r9/AOZKsIG7OCR7GOA169jre3WxFzRAJql+BmFlHMLSXBxXYqW+LOFW?=
 =?us-ascii?Q?fL2NhuHSYByUKTLdS9ZjrYluMAXGr6oaMSd/cPbBgeedsDodBYRXE6uqaiMy?=
 =?us-ascii?Q?NqIEK1TMHMhtwkmrgAeLsKMaohMmOOpPZOVqxtB9TDSvi5YdyBQxGw6yfB77?=
 =?us-ascii?Q?4PBg/4Mldc9xpUgvKjiOH8wX5AVyygXpHQJG1QjN0FLa/yu+Fr+ErZ5L8kiA?=
 =?us-ascii?Q?nQjbgwRnmn37trvRrD3pRM3c?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FKI9FSOec0KJRPRmzW8PwDIHsqeCOiE36dFWD/mAerIOqbmfGCTdyHuEFEog?=
 =?us-ascii?Q?Q2wYzr5vEMYLs9X5GKFN9CcpahRcq1BYZrPRPYSv6KXOPeZJVBJbnKhqkFkK?=
 =?us-ascii?Q?vubsm+wFAtABYxqQ4ZawV3IPMZ6NVAmZLqeL1vuSE8uM6GKOUDzJJMDCo0GH?=
 =?us-ascii?Q?R4LpA4jkdt7UmeeXBpuwxpQNKktvH3QB0aOi4nLrZzOsoLrsggmA1z+U35X0?=
 =?us-ascii?Q?l9xr6yLCuBmQxmc1boL+QRNRALRgZqfqhuxtnUC5xSMjRtnMlJ6orWnLQWgD?=
 =?us-ascii?Q?s8HcWa5ttr4D+pXW9J+nfnKi2Tf2ge8nBGJUU7yM/BOPUdy7hjSx8ATbrj+R?=
 =?us-ascii?Q?I+R+gmkvnrev/jiknzlLSzFgVDMMkjvja4RKi8OLbWSOJ+OnMMgqAtu5MEDb?=
 =?us-ascii?Q?m4b9reNekwab913Fx0lc6bfEr8j/vCS4nzvzeVeA3tEim+6tqWb63keu0X+4?=
 =?us-ascii?Q?5Bnc9c/u4wAw+tfUXj/5NnwSew4/GKXjQ6w2SAZBKPHuEYIPRHbfykhK/wXO?=
 =?us-ascii?Q?q9x+MKW0a/TYe3yNo92rQcOTCkGR6b6bC1GWiV2kGWYjhEt3amFKd/G6ElT8?=
 =?us-ascii?Q?SzldGe4y3Y3QxHk5yWzyxLaXeV51YvM8mX1j12c9s1ByrogdyE0k9CTur1eB?=
 =?us-ascii?Q?dvjWFcMgPzJLeR+P9JGMCU7ILw7XarfYi/bYGA9yH4XXGYt7QCXXbb67SEX/?=
 =?us-ascii?Q?CZin9gsE/w2UkK/tm06zfc7UhGeBlYIUD2OJ9FWslEPW6MZqmSe3x2rYbllA?=
 =?us-ascii?Q?M2T0PPNKztF4qZOwKmFSxq1ylnaRRmJBzsSiZqxppSuoWhgH01//Tn2qW7yl?=
 =?us-ascii?Q?R+qkhV1STMvL+BqHqE2PrJoRI34wKdcBiDZ+9wk0GiVDWM4aK/wCy2hRFRus?=
 =?us-ascii?Q?E+cuXKpTec+NijS5+wc6EdtQQ+Z+GrWN+cjT2+08i6GOBmzcTUxWyWPcTsNg?=
 =?us-ascii?Q?cAoMSHHQQ3hUD6WXAx0wf66tc0kzvdJCipOfgxRlZSNT39M4/+vBUeofkx42?=
 =?us-ascii?Q?wP8RWrrfQUFWGYkC3w62746fnzchFS93ZEYjz8VHNDnKvOGCW70BKYTqCuwx?=
 =?us-ascii?Q?eYlS4/9LRWwlpc37VNmuUGAzfYBKHTedElsNWEVv2Xxo7eRALIFkwJPYtpFS?=
 =?us-ascii?Q?bjmIcDKQ0C+7thAQ1UfkO0AUx0BVZGMjv01uezn1lj03VaunUHcXAYbQ4KSa?=
 =?us-ascii?Q?GMKiQaxQqFR/zgqxxSYROUPlTXYxXVh5oqllklrB0eqD3vB8aDJbdmPU2oxC?=
 =?us-ascii?Q?Wg2XnArhywhuEhZ5d82uyFvT5L+e9Xv/2aA5gpGPJk87ds++22iTI2912fdc?=
 =?us-ascii?Q?s2vLPeNM5/iNQEB5Ugw0jE4HCcwAqvWtVA6dujrW82iNRxRq8nc6JCrNw6Mv?=
 =?us-ascii?Q?0s5vZhwPzkTPYB/jt5eCTTNGC61MxygMF1/bWrgtXJYDW8LwAGzmPNRvfLap?=
 =?us-ascii?Q?XLCyyEuAaG0pVAGdrhUJ3VVOwHpB2SjLl4JJZ8eKsYyo/F/mJ9viaOPCQo+j?=
 =?us-ascii?Q?+VzJCz5AhEXD4EJjRY3wzvu2sAz7oe9CEUToYVQJMeteq1LQOejsr2knUVax?=
 =?us-ascii?Q?oaqDts3Wy5Wi4AhnbAPQOI0DcXYMnxLh7sxTNh/623Yu93UQq0ZB+YAcC9bf?=
 =?us-ascii?Q?aQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d6846c1c-ebe9-4513-7ccf-08dd3e1d9ac4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2025 15:25:02.9985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jaU3+HHIcojm5kKC102MJCSN7NZkW6NSURVpDKA38SJRBXJNFQI4e62Njg01yhLMSIsdVQJLvW3IST+XZbwdDwHHOh0oIuAO06SIqSTE5pY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7240
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 26 Jan 2025 15:25:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6182

Richard Purdie schrieb am So 26. Jan, 12:53 (+0000):
> On Sun, 2025-01-26 at 13:37 +0100, J=C3=B6rg Sommer via lists.yoctoprojec=
t.org wrote:
> > From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> >=20
> > The GNU implementation of dd supports the skipping of sparse blocks whi=
ch
> > can speed-up the write, esp. of wic images with big holes:
> >=20
> > =C2=A0=C2=A0=C2=A0 $ sudo dd if=3Dimage.wic of=3D/dev/sdb bs=3D2M
> > =C2=A0=C2=A0=C2=A0 2683+1 Datens=C3=A4tze ein
> > =C2=A0=C2=A0=C2=A0 2683+1 Datens=C3=A4tze aus
> > =C2=A0=C2=A0=C2=A0 5628735488 Bytes (5,6 GB, 5,2 GiB) kopiert, 84,2773 =
s, 66,8 MB/s
> >=20
> > =C2=A0=C2=A0=C2=A0 $ sudo dd if=3Dimage.wic of=3D/dev/sdb bs=3D2M conv=
=3Dsparse
> > =C2=A0=C2=A0=C2=A0 2683+1 Datens=C3=A4tze ein
> > =C2=A0=C2=A0=C2=A0 2683+1 Datens=C3=A4tze aus
> > =C2=A0=C2=A0=C2=A0 5628735488 Bytes (5,6 GB, 5,2 GiB) kopiert, 11,3314 =
s, 497 MB/s
> >=20
> > Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > ---
> > =C2=A0documentation/dev-manual/wic.rst=C2=A0 |=C2=A0 8 +++++++-
> > =C2=A0meta-yocto-bsp/README.hardware.md | 20 ++++++++++++++------
> > =C2=A02 files changed, 21 insertions(+), 7 deletions(-)
>=20
> I'm torn on this as it is potentially dangerous. It depends whether the
> blocks really need to be zero or their contents doesn't matter. You
> could leave existing data behind if you use the sparse option.

Isn't this the same what bmaptool does?
https://github.com/yoctoproject/bmaptool?tab=3Dreadme-ov-file#concept


Bye, J=C3=B6rg

--=20
Es ist au=C3=9Ferdem ein weit verbreiteter Irrtum das USENET =E2=80=9Ahelfe=
n=E2=80=98 soll.
Tats=C3=A4chlich wurde USENET nachweislich zur pers=C3=B6nlichen Belustigun=
g
seiner Erfinder geschaffen.
J=C3=B6rg Klemenz <joerg@gmx.net>, <b4ai4o$1u8vmt$2@ID-21915.news.dfncis.de=
>

Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

