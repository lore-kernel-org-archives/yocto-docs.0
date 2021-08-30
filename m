Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.88])
 by mx.groups.io with SMTP id smtpd.web09.14127.1630310275575516034
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 00:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=mrwgRtPb;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.88, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NkLEc/Yp92qkDoRV60SEGgrc6Awr5bdy5+NYIHGorq5axYROU8RGi7TkzW94aV4rnPP4YsVwZkQu9R5hh6IIb3kh7hap3MsUb2fKdIGqi5HmXiz3AUOu2vSDyXQAlo2seH8jg0L4N17zV2PRwndAm90P0i6N8mCr3Jc4mcvyoNmYEn5QEEJz4qTrTdWKK0deQV8etD8tIXfkoiA03m3XT7OqBwEfjOEM8nq90zd/BUq/WPHfwubFgQttReoGgVZ4IQWPFhL8RO+FX2mlB/sb0l0etz/Nrxu0CjM9vgKmj/FivegZnuU6WwksVlX7YZMP0AF5mz1snROBHbG9a3CP/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2y4+faj3ZYPBi6BIg7rmFwnHmnH4DukgbALuLIwvLRo=;
 b=KrxT91VqFv+ts/Kv2yl8UtzY2uzzYQTBSZfX+9UTB9s1aqrIRcJ1UWsdnIfZO8Ykv/G1bDL00JSecUYMtQ4DVyTGW5rcdD/6+KxfHOYCE78MZCB7kpXAzTx+0MevwRQEffhp7VEmuB+UAl9NQ8ViVJJJy2ocvx3mKL0ih3sqJXbt39R0jd/ilCbBM+UrYx2G2PqyuIq+Z2mIHRBjJ50p2zEWXpudIaFE0mifzeezcAZ6pMZZKC8jrfeFo69mIXo/E02j+qli6vK/UkiF3b40G/Xig4ulhfR+Vpy5uy4LOPDQW3Cl70ZXVtUvN/NSp3gjV9Uw4Wp9EiuT7QIiVgnqEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2y4+faj3ZYPBi6BIg7rmFwnHmnH4DukgbALuLIwvLRo=;
 b=mrwgRtPb/A5H9de7tfEyLcfdFpfpPUUL2b3ZB9QYUHGi1g8smCHg65C3FCT3Wr/JfebMtZKuStl8lASlFNDu9ydG3+jYwckhuuwSCB329Sevs2OnUuLrHC0wRKNoSKuHrawwdl1oQk4nwhdHGmhazqunhMaj2vlP7tV2fUNJ15w=
Authentication-Results: crashcourse.ca; dkim=none (message not signed)
 header.d=none;crashcourse.ca; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB5251.eurprd04.prod.outlook.com
 (2603:10a6:208:ce::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Mon, 30 Aug
 2021 07:57:53 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 07:57:53 +0000
Date: Mon, 30 Aug 2021 09:57:51 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: drop "three" since there are four requirements
Message-ID: <20210830075751.lvklllqmay7c2bl6@fedora>
References: <4da9cc0-d5df-d2f3-493-4af3c2368ae@crashcourse.ca>
In-Reply-To: <4da9cc0-d5df-d2f3-493-4af3c2368ae@crashcourse.ca>
X-ClientProxiedBy: PR0P264CA0257.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::29)
 To AM0PR0402MB3348.eurprd04.prod.outlook.com (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR0P264CA0257.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend Transport; Mon, 30 Aug 2021 07:57:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90f77ac3-a2d4-4014-6e83-08d96b8bdecc
X-MS-TrafficTypeDiagnostic: AM0PR04MB5251:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB525149818FA4B207BDCFE7F0C2CB9@AM0PR04MB5251.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4Cb0CIwL3x59lHK87/CLgleGYkAqxHHNTOePAhU313Xn3faLHIGMia2eP0fcBsX89uln6hwNJN9l/aQdTAn6rj7MpRNaKP30lPA/VJpOujTRCrJupP6U8tJYC4WQrLZQNpyZbX0WVOIQKhrf2kK5vNgYh+E2vBfNeuH3J9irJB79+FnTj2fAF2SOCkXjbbcvL0Ly+evKCm91SvnQn3c1HcKS7Qh5Stq+11T/vThuqqEDLHfWNYGwKTlbK3bvoH87wNV+zcedGCPH8HabHiZMEO2ZXxs/vtChpvOuTTGJbR+EQ5wrkeE9mkeuJIS9SkOCOwhN3f9lpKNUTjMweHA9tglMllQVtFbQFSYjkljB2GBfReNbmClpDNvVBspDwnPanaD1PzsUyqmYA6EZA5nkpgIz0gwBghR/NVxLhQfXO4yQCiJRNg8sgstvEImZE1TzN8LMP2cmiYoXaux91KGcIaMfZUv28bzhSbUlYTBeYGXqNRsRKM7OjoLoWIctTGGJnkF0pULvZBoVOK5GD/ib421v2ypsk82rWRxbr0v9RE4mCc97HCIdUkQ3DiJzxeWol27i0bgeZa4tsLCvQQUdfkPPgc5hD0qnm8d1sd10md0eDw6z9QRvQlkIT8XfA/I8/VG7Ss9aWiER1+it7Y9pd7qCXaTYYxBw9igl/UzohyeE283si7Ka2rXkhD4aIPJnbPnQASYE/pSDSlLwCmGCog==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(366004)(39840400004)(346002)(396003)(8676002)(2906002)(66946007)(9576002)(86362001)(186003)(6916009)(66476007)(66556008)(6496006)(38350700002)(9686003)(38100700002)(26005)(316002)(44832011)(956004)(52116002)(1076003)(8936002)(5660300002)(478600001)(55016002)(33716001)(558084003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9Bx6X3imkAA548koIxRBTRoZmu5vQtvfaq28R/gHsVwkJtHcHVnB/h0dGZP8?=
 =?us-ascii?Q?KEMinuYtv8qEY9M3fdGL+ldgJ34UBBgpdFNkl53bAfQ2f6FsqcFm+9KHDyBI?=
 =?us-ascii?Q?ja+DrNSgRc5V1YmHtc4XWt8cQmWiGtBHBwsw16Zypo5QNjBXrB8dDZ/YMCNl?=
 =?us-ascii?Q?BZ3rxKDAdbYDJPcoXFE7lTBTK4Gxj6Y9H8dkSFsyDde7Yvs87HF9u1GIQW21?=
 =?us-ascii?Q?jBSz07c8P/Pcbm6h9z/ZgJMlG4pBQD4sptjm7pwgFkVferrnwAIt1G7TlA7s?=
 =?us-ascii?Q?Tc/9pyludGybS1PQ4fhZ3LD1b5b5DbrRF12YQbnG/ld4KAjAwzz9gIWQpFst?=
 =?us-ascii?Q?JMU2NlD8ovtKuouIEMep2HJ9KGtqIAzU9P40++0mR2TKLfPiqPKyEMizBbt5?=
 =?us-ascii?Q?l7nBvShEDRzN8adaPHFjbjJY6iLjHpErsoL0lJkc8U3XeRK5xdrkkWES7n2t?=
 =?us-ascii?Q?ExudqdQLMnKg7do7h44of7/TD2cHHlfyetbVqJ0JXhe/xy8Vn4NhGRJyCI52?=
 =?us-ascii?Q?hJs1ICU+pvL88lqqf6agjFm5TcYeGG646M8GaxMizN5uto275r9/xeEUnkkA?=
 =?us-ascii?Q?AEQIOJzCQZiiGNlyMQIRMFdEJX9nPxbQd4WcOttWJOcNtg9ZTqFXCQH4Xq5W?=
 =?us-ascii?Q?e9+Zrf2O+V7pMywEOO4lXOGxq/wD+5ihbrgwE/rc8Ls5QiPkPbcgkXiMkkR3?=
 =?us-ascii?Q?NBtEg0vg1txPz1wEzuGz4N5Ufdf2kCtptrA5FKCgK1J4CAIhbIytDtRnEsnU?=
 =?us-ascii?Q?Uj/O3+ng96dbw1UToy5JaklpvaihOgbMFFeMh7juP6GOxEmUCHTv7iYeYlKH?=
 =?us-ascii?Q?EroKP3lK6Vhg8GwUT3VWw+Bbmi+5o5BwaXHuEeFoYfj/d61STOej0om3PHau?=
 =?us-ascii?Q?RW9P+w93z61ofZAyD0xc479iMpyXNDoHrDwsYOBeEdGElrL4oBXS11t26DNB?=
 =?us-ascii?Q?aXcQM9dBVzmC7GMzPYTwFh4yX9EuB8GP+ANvBV0N42afGmH8ytFi/EL75aq4?=
 =?us-ascii?Q?Nrb7vt3X8Zvy881+tQeSbBOeEa49B/44+i1e6IqIZalGJLZ5mV8mDKR6uHP9?=
 =?us-ascii?Q?aFPh3VjijgJ6ai1GCHAQPKjk5GgQDq/np99ppjguuzvDOeGJ6DifFL6hDepd?=
 =?us-ascii?Q?1wEFyCh+QTis42TR1p/UMxXCSAMnaAtt+eC5/a9X8nJDkmdVgQXbVhrrZVc1?=
 =?us-ascii?Q?MKiWgcqrt/V4ZUFY5mtbMeVixH6Lamv6sCcCC4b9WdLKtcYVlIizFJjrX+A9?=
 =?us-ascii?Q?z0zN01rG1h6cRkfAWu49F8DtWRw2uaZWbweE5yXhBJxcpzTOWkabLCFeKy7z?=
 =?us-ascii?Q?Al9/T548YYdAHRyTN0DnShAf?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f77ac3-a2d4-4014-6e83-08d96b8bdecc
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 07:57:53.3940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //9K8iURzc6B1NkUDp9ALdX9kpP9zINN3MmxrOyePvJ0qFK+3gpBmr/z2Ogp454VVtEepLrP0YYIcmvwkJdOZQKbX0HNbyL3arpzgkA+6U45SCRaQtbEynxPJd0aNp89
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5251
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Sat, Aug 28, 2021 at 01:34:52PM -0400, Robert P. J. Day wrote:
> 
> Since there are actually four listed requirements, just drop the
> number to avoid future issues.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 

Reviewed-by: Quentin Schulz <foss@0leil.net>

Cheers,
Quentin
