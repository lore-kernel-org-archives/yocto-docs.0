Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1505CA0FE5
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 12:19:48 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.56])
 by mx.groups.io with SMTP id smtpd.web10.12734.1725020380288354534
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 05:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=Tee5/b5B;
 spf=pass (domain: cherry.de, ip: 52.101.65.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SeDbGrhLvM/a068EMWzIhzjWFEUKTZb8xBACsyUEKrGuOqEWWRu8Kd4B7cC2StuMSFnGaa0jO8RnM/AOM737VVct19b0pcJ5HlIDFRFRuEjDlMIis2su5LoGh9fDn2Wdsos6qNwOtZBp27VrYPKN1uFAwhHdvzOZ3LlYa31k0CqCzc6KPYGySEAhLsWDYSYx6IhXTtx0Leb/3fm0XV3ZB1Wb8y+AZXOUdy+mo1RZQvVxR7IpMzYKhPxgyPEkwdTdVbEmT3eNiJUn8vpM4/swBn7VioRUVdhDBA3BwXQrAwpKYi2pNhAr/1C3avVTkiysS6aNKBGw70uJpJ+1Mt5vBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhcdw1NcWRrdv69feApFs4Q4b7FdMsqWZ798jw9E58o=;
 b=hUMmSPV6YSmuM58oVOmzhvcSWX3+ynUptRWsVCpnUd7UWUaSK3rMSoLDBK+4JNeyHVgpGOJ4PRUZsM4fJ1ck6yi/KNgf+MVaG1feN7Es/MGW65RqBZDImOsf/z5pDZT5ffJaIy8/DOl7rw+/DQgQrjTBe7i+RLJU/FwX48NslDKOzUTVcsxwq7vc85vICM4r55G7jg4ctB7yGqO9hHNFQtXmqqp1F4SFmczQ2uOStUHzMg097dnchtjJ+XTRX2ioADzq097k+wUb9ikIoUhg0FYdXHV89QVmaeRpsl3PmF8irSWwZL64+BWcGcW/7T25QFay3UmAIKgd4T7SOPhQ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhcdw1NcWRrdv69feApFs4Q4b7FdMsqWZ798jw9E58o=;
 b=Tee5/b5BwCBEEFqJ4GlTXc56QwKXnm55qrOIXbDIU7JaYcp9AhI/mEoHo5EHMQZt83Pm2A2xpkxbGk21Cg9Wh9N96dMMyWREio2KV0BmI8Ml3naq8n5P+Ad9eszA3chw7ohkzQTpf8C16mHvP+vX75kTpi0hr36HmMF+r55pfXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB7589.eurprd04.prod.outlook.com (2603:10a6:20b:291::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Fri, 30 Aug
 2024 12:19:36 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 12:19:36 +0000
Message-ID: <9260b59b-7ac2-42bf-b089-a54181770564@cherry.de>
Date: Fri, 30 Aug 2024 14:19:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/2] doc/features: describe distribution feature
 pni-name
To: joerg.sommer@navimatix.de, docs@lists.yoctoproject.org
References: <9288e40f901792887ac98417ae8c89fcc2f23a0d.1725018000.git.joerg.sommer@navimatix.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <9288e40f901792887ac98417ae8c89fcc2f23a0d.1725018000.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0428.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB7589:EE_
X-MS-Office365-Filtering-Correlation-Id: c07f134c-76d3-4e9b-5f3b-08dcc8ee0331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6ICSAko4ZtaYZdq2wRHwuJ98OAPHvUzrTzlVojS0byp9BYBbR13n2tRTF/v8?=
 =?us-ascii?Q?hLwcPrMzzuG4wI66KqBgeCFNMyHsB60sLHPag0cVxiRwHD5QRJsg4RyGxBCK?=
 =?us-ascii?Q?IKSGs3wDIwZeedHcSn+iFvsiXfLzvDIuzsfHHXMIxo/EIt3BjzmnJ7KeALt7?=
 =?us-ascii?Q?p4br6H9PZLhcv8fUaNqAUMU/7hLQG4XSfs+xbgBlELnaLDJ8U54i6l6Zw/P5?=
 =?us-ascii?Q?BCyLESRitwXBB4YN665lfwEcDcgo7LOHuuE6Ei7oMWYRuvJYWTWFW+VETqhW?=
 =?us-ascii?Q?qApHCzZe3/bo4R72HM9yQPmh3+bWGZjBo6P4owkdnSc/YoaeKyrQQNIZhwyg?=
 =?us-ascii?Q?NX+MpX1m2bp2G56wUzVJmGqebm8i5Az2+qb4Uci8yVI+bD0G/qB+SQUeDuWQ?=
 =?us-ascii?Q?WogSCdhb8ynFV0TNQCGK7YqPgFyWcY8NmRqz/oYpFivGKRoL7JPdz1/l8Dl9?=
 =?us-ascii?Q?ZiHAa32x0NGdc5baVYnvbor6CQQKckJhu+SVMkzm6NUHYaeQa4pW9JnhGsIm?=
 =?us-ascii?Q?r/tMYwiGRyfysO5TgmDREaPdQrQhDpt1T3gwzRSoHOkimSHFWVZgWtRgRhKm?=
 =?us-ascii?Q?2znCyMzi7M9v+kZwVKDIcpImcZeUKICDTavQnAgoCJ/F3AvWtY/JBjJyMyeh?=
 =?us-ascii?Q?Md0vOJ/DNErQeJdQgaV4C4onW+d0yO0jLQJpvzmS4CWYPd/JymXuslUKuc59?=
 =?us-ascii?Q?UnBou5K5RjBVrBp5D7DpZMlhHwuohHMBmH+DaAWhoxDkcXRUFpW6P+3YnNJZ?=
 =?us-ascii?Q?7xbS3x7IgMDO+hndhFw7TQJmegqQo0hyHf0hE/6nef0PRLvRHJHov6Axv6T5?=
 =?us-ascii?Q?EmnqiHJjXwBoojsA+tTy305BNg2Zvh+WAikH+jfTJw6/Z6BSgeZ2Q9FLHrKX?=
 =?us-ascii?Q?E2N4QWxgd0Ca53UEbJJZN8R9Fxnw80xAx1i4xxPN7tl6Ye7ijKicQdK0D1NT?=
 =?us-ascii?Q?rw1QcGehHeAK8QoBoNXV7gBdxnMAGAJMFP7lOaXS/0S+umTalKjTfhPQzTgV?=
 =?us-ascii?Q?9IV11Ci4xfFaFJj+AUnIECFczATsBEnQ4l8r0Qu6TKxOFtPvC2MEwsUBWHHl?=
 =?us-ascii?Q?yyxCzi/4AYvedkoWhAEuQTe3AFQM3mfK4ktPvqHeoBAJEYtRX4YrGKEttP46?=
 =?us-ascii?Q?v68CkCdLxldD2aAf+zgmbH48sIUiIlGLBQ1h3I3HD4tHMpZnLu9YmRZ/Z0ji?=
 =?us-ascii?Q?+uA6mhZ8yje1EGQEbKMLKEFcyzvPYMUsXoqDNfrvQgVvflt4tV8tfQXPvWI1?=
 =?us-ascii?Q?VEQTQfvvm9I8e0jkyF9BaHPuDyOe0ZoWXOKuQ0yv95jV+cr3dMBxM8xWllxK?=
 =?us-ascii?Q?C86oi2GwIxgZVYUbFvp+h96/r56ba98f2IAEgcYN1Coz8A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dfMyUra6/jq8wt66+Hva6OP3McYJldSV1DEePBIqUQAqreSY8tTCnmqRt6aR?=
 =?us-ascii?Q?rK0curDFuCqrk3HeYuHjTe2lYBYIIISWqGcE7niYZm3s5Zmvlj0wTw2N4W7T?=
 =?us-ascii?Q?OQ5BjM9r/HpeuzdSxD5vOqw63iGsnm6rizAgvRjplEGm1oTKAJMvRfKPdN36?=
 =?us-ascii?Q?RskRau/bmXTVxVyMWDiI8BeG4zwJRcVe3O/z/FXhs14xivOGaFNZmTHBrceD?=
 =?us-ascii?Q?wAH6ydtYXyDiT5xJ5EGpI93KbATU+on7j5X2iS7m+GeU32PTPjBxFBoZ0gSd?=
 =?us-ascii?Q?r6DOEfS+nhrIGoLcmC5rLFH9CdFuVQqhv0LSthcC7NtU2vt+/HdlPU6r9jI0?=
 =?us-ascii?Q?Q/cIuFmoLqF85UA2wqIX5WR3fAZZZm5Ts81AX1PX6FgKMiuzcmA4tz4jdcQi?=
 =?us-ascii?Q?XBxLGp0Wm5GzLOgbZua+B26nseIqXDi7VPaSU4iYZGMTbdj2tHj0AxIEzqjd?=
 =?us-ascii?Q?cENY8lkrMRjkBzig+nVU2wgaZ+s3xe4VcFRAXeZDEHq+zLQNoEoxet+Yc3lt?=
 =?us-ascii?Q?G8xrH3mXic8yZoSjjfmbHUs9KLHqtTWMZcdIjLiZESCa/LRCYV1l6Lhn+RCt?=
 =?us-ascii?Q?hQxlsK48KPY5tLYNuCQGX96m0Xcvyg3OxXY2UBsMUA7WSReqoGmXyL6ZcTFA?=
 =?us-ascii?Q?ctCDR31BGQSfyEHQcQr69sXTzNhO1C21zO0Sv2DurHiYzdyesKOC1EzeXzRH?=
 =?us-ascii?Q?ZWqOS5QwzerZTIjkTagHyJcCvNik6Wkb2bZi7T536jUADetYEt2MzOBjpQEl?=
 =?us-ascii?Q?fEHfvF1Xg21mmpwnyj6i0PstkxmuBFvTKOdvNaG7KJx8FvD3tsB3sxcl2sh6?=
 =?us-ascii?Q?JaML7GpXbpKoKInDU4cfWeb8tBq34qCh5d4TAyU6SjLOQMYxwRItWoIObnti?=
 =?us-ascii?Q?/sW5D5QRm4Q+tmmY72Pos4TMRMoH16FgnLRFQ9ccTuFk0RXe+8O8KXJtmTKp?=
 =?us-ascii?Q?G1y2Q+x4qCjKHC3J5E6n/q0DCkTrIZkxCGQcJSaIPSZ1C/wrUwnQm2jEJ5I9?=
 =?us-ascii?Q?xOhD6vULAIdQN8TYDQqbsPaP9xNjfA6drUIgBLarN8fnPpseCk9aVv1FY+iA?=
 =?us-ascii?Q?diJ1bVye2PSKBcvFJDipd1iktySN/f8EleeC1x439mx3CIl4Pf5uEb7tiq2x?=
 =?us-ascii?Q?eqidDojeV4/QBNaghOP3LXX3rv5IZmcgAJq24If16cNW3WdRiztQuHnxh5Yj?=
 =?us-ascii?Q?51YyP23IhrSpJQi93x0Ikx+DXAQsw316gPG1FOmfjrX5e6+83DwOYST/aHH4?=
 =?us-ascii?Q?dN7UwF3eyF7cLCzZA6qThyWJPSHpf7Pcoz44iSZV/O4GtkuXhOtP/RNfXAtC?=
 =?us-ascii?Q?zDFHaxGoR2Nz/e8t7jRHqR5i6Kxz+1+9zJCTIzKiSSHdTKmUniNqgv/9/nLY?=
 =?us-ascii?Q?8fCg+Do39k9MJYszX9ADYIoyXSTyOuyGzMHyyUsMwUvfHP/Q8MgNMNFlAD0z?=
 =?us-ascii?Q?KdXsZblRm1YXn398BaNUmjf7QGHcZ+2BpuIzSr4TbT6Ar1b0rPitqHVwHNC+?=
 =?us-ascii?Q?KHr8RCv+a9T7E9Rof6CXoTHIZiGWPv1yyiotxXZPI1x+qUam9nBA48SYmhhg?=
 =?us-ascii?Q?rN7IJ378VMMdqSzGZeI8n90cJQcPs61CMYPFFKH4X+Gv2WV0Bt8Z7IAQH8s8?=
 =?us-ascii?Q?LQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c07f134c-76d3-4e9b-5f3b-08dcc8ee0331
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 12:19:36.2269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYggf4nUPlq8uOx9WT/CRQ0VCkSJRDsCZ+TRrNexsDjMqTNajQOw7maPIQGxOzPNnLjRPshVSu1TVDfVXY8dwcrxMQbADU/31J4nwdV6qv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7589
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 30 Aug 2024 12:19:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5343

Hi J=C3=B6rg,

On 8/30/24 1:40 PM, J=C3=B6rg Sommer via lists.yoctoproject.org wrote:
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>=20
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>   documentation/ref-manual/features.rst | 4 ++++
>   1 file changed, 4 insertions(+)
>=20
> diff --git a/documentation/ref-manual/features.rst b/documentation/ref-ma=
nual/features.rst
> index 2ea946b31d..81f09f59d8 100644
> --- a/documentation/ref-manual/features.rst
> +++ b/documentation/ref-manual/features.rst
> @@ -197,6 +197,10 @@ metadata, as extra layers can define their own:
>  =20
>   -  *pcmcia:* Include PCMCIA/CompactFlash support.
>  =20
> +-  *pni-names:* Enable generation of persistent network interface names,
> +   i.e. it's tried hard to get the same but unique names for the network
> +   interfaces even after a reinstall.
> +

I'm a bit bothered by "it's tried hard to get". I could suggest:

"""
the system tries hard to have the same but unique names for the network=20
interfaces even after a reinstall.
"""

Whatever works best, not sure it's any better. In any case,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

@Alex: A `git log -S pni-names` in poky returns commits that started in=20
scarthgap, and all of them are available in scarthgap, therefore I=20
believe this matches the requirements for backporting to scarthgap too.

Thanks!
Quentin

