Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E50EC433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 09:42:35 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.48])
 by mx.groups.io with SMTP id smtpd.web08.6961.1635846154268451140
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Nov 2021 02:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=LusayWFc;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.48,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVsF/sGgjY17wYTr63F3CBuazXjC8bNQOG98xgiGokvmLpTfGn1VIq8AlPwIPwidvxt8miWAtpmGTrtm94hju7gN3UaeCM87FKYDegZciR7D2i+jGNd++jdis2hZhhb9DzvBet5GqaAOjvojLCze5mnuxEj8SzPZmAvlFpbPpUhN8IB9ttJIpDQtRDOgAZ/sbSVcVzTZrARCvsjsbbdOKHH6bQ6S07sM3ScGzr2zCOY+MK6p05BLiaKAv3sLZ4oHP2fa7J25BEClGLOdQkIB03N+t7P4f9+8I/NkrmhlMAtFYiy+bDVhzQEMQlCGxTo4ut158MP4+7akY1Ne07PYfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPaaRTyn/3L4MWwwauqcYsncrWjVrivxAKAdLPj588M=;
 b=dsOw3pg8hjlx3X7H6XeiD9GlkZDI7GKJlYIYiTx357CWRbkHqN+vjhGgJfAvuh47qqyweHEXe/66rNuKFIXIb9WDHhZlrGM1b4O0lRTL8ngAbAxA/m54igkB4shUUU4JDaxiqzY6N7TXSUKo7CLw842ERH4h1PF19UJjLm+6c1E7sNgDechES2VS1a7q57XubkA/p3zzL+phWSityitjnl08UvMRcqwy+zGAe2gpYYi1L5J/9G2qIIbn1y7soCAULZTz9VrgcUdB3HK4hAmzHGE93b5HK1CAkbMWMVb5IUTY8pBkO3XoZ7UpgqudJVIxUqosySZ5wkA+yybTnOX/Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPaaRTyn/3L4MWwwauqcYsncrWjVrivxAKAdLPj588M=;
 b=LusayWFcc2lDPQrHIZnqowBL7Bxc4mVieRdNIkxux0LdZxfOIXft3Wg7tyEhMU8jp2vMsNqFTnAAe8i8bNq6dGm3N6uo54trw+z0Ev1kpqoy7Qx7ifVQABdxOS+MLWzd5QuR3Qoo/o8ZUeJk9aKKT2pQaeczuAoJYzBcfFzg/90=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB6515.eurprd04.prod.outlook.com
 (2603:10a6:208:16f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 09:42:31 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 09:42:31 +0000
Date: Tue, 2 Nov 2021 10:42:29 +0100
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Ross Burton <ross@burtonini.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/2] kickstart: update busybox note regarding
 PARTUUID
Message-ID: <20211102094229.f5owpdhafau2l2r7@fedora>
References: <20211101122219.5965-1-ross.burton@arm.com>
 <20211101122219.5965-2-ross.burton@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101122219.5965-2-ross.burton@arm.com>
X-ClientProxiedBy: AM6P195CA0067.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::44) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by AM6P195CA0067.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17 via Frontend
 Transport; Tue, 2 Nov 2021 09:42:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97db61e9-e7e4-41e8-b3da-08d99de51763
X-MS-TrafficTypeDiagnostic: AM0PR04MB6515:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB65152200A8406B4852029E85C28B9@AM0PR04MB6515.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yKP1NYLeHAxz3TanmcccTh1o+aczbRno0IEi8Keceo7Bn+QaLurINYyiwzBU0crCCs4b/6eVSvAb1oIfWW+BmnCslYnWXTNozZ43Y8sPbLFgvNqT4JwMghd5vhGsTsKpkANzjl066i32KQhO88vOhfClfzBx18zvZTDO/R+lavL2S2dd4Ez+UNszSifZ0bw3EGKEXG7dvxD1SnPIeQ9xXQAUkmS5wyTpTsOZ/DAdIOZieGqzvVfDnTXTreSFmW8KA/FL14GjTchJlZs5yn4YZwsoRHJ9/VnGlUL+4TL2VaFCYaJCx711uPXHIAiSII0O+3OpeUKjoXYCcll4GGDrZJCUalcPonMJUfIPodrzXNjHVXV6L8OHz/Sdg29tm/FpQ7NG88t2iwLTQ5AqzYEHEtFWsIk7YXKKuiGRhnSM/FHk62dBR54qWoMhEHojB48SvMj40FDpbe6Tm+glp3KZ5YllWeIu7BYihIygBs7BBypgSHvp3kAxsxgFFNT2R76vca6YAmW5JCBDKG3Ye1NhmCd7xZdoDj2V3/JVHDrslZJuPkDcq7fzQvP+0C56tQmPupKpla0F55QJFhJJe4WooXu7Yyr3WChP0J5quVcjAxWg7FjCH+YM/eXu9YC/29wmH9x8hnVL8VFyIOlIIF8tbMrZYOYWFYvfEUwSEBMaQoeAKjWaIdam+du2SraSTJXyS7i2EsJ+6mHKborsEAEA9g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(1076003)(9686003)(38350700002)(38100700002)(83380400001)(9576002)(44832011)(6916009)(8936002)(66946007)(66476007)(55016002)(66556008)(2906002)(8676002)(86362001)(5660300002)(956004)(558084003)(26005)(33716001)(4326008)(6496006)(52116002)(316002)(186003)(508600001)(15650500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2i6WlKRbfR+hJc6EbG3krl5lNHyclXEblZDU1h/a9AiSLKuRqtGXRUy6vbbD?=
 =?us-ascii?Q?uQsnsapJSn91YtkrOG4nMQsrJQPu43z7HKgyACtJgsDB/KNlOT5/NUDUvlGz?=
 =?us-ascii?Q?2PiUCigomPIJ9cMlX2UMIJAOC2Nm9vAytiCxGQt58DcglXpHX2D4mZrTEFby?=
 =?us-ascii?Q?g2ppoEh0uFIy7l8RnqJYTXumkrT5wuf/nvZ9JABngT5g2ULH7TnnamQKr4Qj?=
 =?us-ascii?Q?LwdFrSGQFsjuL25FOfY9v1fJOyj/nEImCZGAsxVGbxTpXJf5om0PYs37DSUH?=
 =?us-ascii?Q?3ISF+aht3eDBWSVFGJPMt1nU5FmXHH13HPOjSnCsvql//1HDgI+/QQgZhn+k?=
 =?us-ascii?Q?vGdah/HZaB2Ym9ufCV060QxjrO5SlpUARnIB29AEmZeBgFcGDf3yUrTwrPdd?=
 =?us-ascii?Q?59j3lfkgYK994kiBQ9CursfRJmJJl/nb8hfO5NP74hNKTSYUKuKdj5reyJEt?=
 =?us-ascii?Q?9wSXuRh5dkM7U4DWzfqnRaz4hJS0Fvv48ZMAF/GA8XaiNPod1z+RVkFCMrCs?=
 =?us-ascii?Q?elxosLfWsqVav9PtX2i5y91H/lUc+seGFX6P/KGR7d3UXyShKRxDHgi4nEnX?=
 =?us-ascii?Q?qAgTjRCV4WyAIyerG4tcihdd3JrZloWOuTXONPgopMhL8BBUvCw4inF+iU+Z?=
 =?us-ascii?Q?kFxcnpzK/Qx+B1ce05VzLtgQxhqdqlbwYX8ZXAAEhZOwmYeCzUFQAZn2YPBg?=
 =?us-ascii?Q?4Jg+giUefYKnMtMt6n2kuaCELWKF7cFZW4Y9DkwzGb4cdDJpkOO+++Dnv5NI?=
 =?us-ascii?Q?1qDP+8XewzqQSpd/zs3GwkEju2TAK0Zp82wUEfcepnAkXcp71bO9JxpIpiZl?=
 =?us-ascii?Q?WM8JDH2Tuc9Ypljso5+7CKVLgWzG0sZ/8L3oCAhDhlRNEcl7ePrQ7O0nEtFv?=
 =?us-ascii?Q?jfJa575zoFQuwmB+xRZee0qMam68BmsoDEDT6T3jHy8idYC/m5xkvqE1j5e5?=
 =?us-ascii?Q?XfKml8zqxPn1ByU0zRgsHo7NjFznuQX91crHeD+fQD0HWyLATUmZlbQCmEIx?=
 =?us-ascii?Q?lW+/hFZDf/sXVVYNl+Ccs+nlOHlv91IezJOWQQmmZXHzHqDvz/9llctOJhmh?=
 =?us-ascii?Q?+24GqRSI0AVMdPjMDzg2Dts1IHg/9dmWr/sSzUoj7rL0rLZEPXa5BchgpQOt?=
 =?us-ascii?Q?pYIAEvKYmJ5/rqylERon/R8lpIasyS1LwbEaoX7CyvH+RkzoHMIrp/9m6W9b?=
 =?us-ascii?Q?qXjjOQIN/JWSj9Wz8H5Mey6xTVuVP3XBExD6LNchp/bNECeawsw3oNHcVXFG?=
 =?us-ascii?Q?hEsypRwoN422zJQRqfnq01D81a8lcss1r4zSymK6tSOD0BKN1CN3W0TW8tUO?=
 =?us-ascii?Q?H2j59Z98+qwcaps9ClM26T+s7t0l6NoVFzuvF4sp/YUurQ0IfutQU+WbAugR?=
 =?us-ascii?Q?lo32vNjcxO6PMHHDPbjn7Tg1L5JJSMaMjdSKVe8pGOg1wTabwf2p4pSSUtvx?=
 =?us-ascii?Q?9MEmXgqYR5iY8F4dWtjcAdcLpjkXk2IQgHdLhmVV4RDyOeV3SvRvFIeYRIxA?=
 =?us-ascii?Q?YCoHR9Sc9oSRIgXPuPdf2MpTyb0VEFeWzMbHiRLJdKxYfeXNiiMsJ+5ve22E?=
 =?us-ascii?Q?EOvNlWHnX+ECISk9gMAoN/mqXslZw54Nu2WP4QIX/uO6OpySa8ODzrOfO4bL?=
 =?us-ascii?Q?D8KhGGZ6Qbkf2KvuUqTrm2qiqz00fZThWgQaKQBHg+O+hoyKUSu9EzfI5X8O?=
 =?us-ascii?Q?ICyBykYtL9lSo+CcVi4xbkW1BXikKCUOfR37z+76B8WHXnTXu/qskA7vAaup?=
 =?us-ascii?Q?Ac9S9SMmTw=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 97db61e9-e7e4-41e8-b3da-08d99de51763
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 09:42:31.6606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GkRSotPn/5g0vNM3t56oNCX3HuTWOXLm8Rjm96kPjFQkzKgy7Y4ExuaJ9JmT/u9v1sTTs68ohEm9La3np+Hhk8FhA1j0Vmj4UDoCYU6b+MTj+Xb/GN0AIeB+F4UK0ZRo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6515
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Nov 2021 09:42:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2061

Hi Ross,

On Mon, Nov 01, 2021 at 12:22:19PM +0000, Ross Burton wrote:
> As of oe-core c996cabf the default BusyBox configuration supports
> PARTUUID, so update the note to reflect this.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks,
Quentin

