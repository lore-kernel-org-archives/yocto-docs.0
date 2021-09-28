Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7CAC433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 08:55:26 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.40])
 by mx.groups.io with SMTP id smtpd.web12.11347.1632819324971972962
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Sep 2021 01:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=gSCllgJn;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.1.40,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AH8IdqHb0fUK6eBexwamckNrGjcMIHW/RvHRfyrFTSwcONrGg6hP4GF8G06QTpidH9MHVVTVJcRvNSkQY30tqCr00ILic8WqBGSPesHmMvHae6W9XNlW1iK7GW7wpq4PkREpiWlnVDriUv0EPN0MLzisttmmd48eXwngAGcYqqwt8bzAEMkhpKr4aWNh9jKkjRopUyaeNCyfV/Au8pnP7LYHSM7tje6yfAKQyoi+kxj/EX9dWXf8nST4n0zg95U3TcOweL5vddqkMhbNLEFC4m4G6mAvkPg3jmYC9gLe+Wd5sHSn2rN9cex20Ky9i1hG9XVPh7cGmqQxO7bpyFkNIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=crSL1Pc9ZdjFqvLAJvXIoWcRiaVXGB6cdZuqb0ei+hs=;
 b=YP73xE0zptYDhBh1c6k4PWNLrzC9QEs7i3KMP90/tkijw9jh8gwQF1XsKL0tkZuWjoz1jSo2fKel/Lwoyq6axQcINg7+hzhWy63ENW32M/zGY2FDuI/FpYQclthjoJIsM6Pq0UKrI7AiyVrT32f9I74750qN5crKwugTHsM28O1unrBHFjAHY42lejFITsgeuVzPo7fUMBwqAyrKUMWfC5+BpVgj8JeoHmfLhrMxq6f6lDbClFrXV9PDFw1Z/Cb4HT7Ao3H582U59tW4hoUelLZScSYcQbZ4UigMnnGMUGihLD9Z/ng3OwpNnQLV0emXbAxwwbJh9GEKzXt0OudiIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crSL1Pc9ZdjFqvLAJvXIoWcRiaVXGB6cdZuqb0ei+hs=;
 b=gSCllgJnyQe992qOEEzQeZNd+aKTrq/uV23Y1BXqIxhsHyY6OoFDF+Z5cesDHZVTE8VVaQSam043r2WFHt2SwayAq0sIHDtc4655ZbiuBZKPCRteFo0Tf7HDIJJobIuF81bIVcUyo5l1j5jdVCg6lSrSbMon8RAYuXpRkMO/wys=
Authentication-Results: crashcourse.ca; dkim=none (message not signed)
 header.d=none;crashcourse.ca; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM8PR04MB7940.eurprd04.prod.outlook.com
 (2603:10a6:20b:240::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 08:55:22 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::1d01:cb7d:b647:46a4]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::1d01:cb7d:b647:46a4%3]) with mapi id 15.20.4544.021; Tue, 28 Sep 2021
 08:55:22 +0000
Date: Tue, 28 Sep 2021 10:55:19 +0200
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] overview-manual: delete bad backslashes in
 SSTATE_MIRRORS example
Message-ID: <20210928085519.fuwlekowkuielyfl@fedora>
References: <75d586c4-dacf-ee38-13ad-6ab39d69b175@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75d586c4-dacf-ee38-13ad-6ab39d69b175@crashcourse.ca>
X-ClientProxiedBy: FR2P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::23) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by FR2P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7 via Frontend
 Transport; Tue, 28 Sep 2021 08:55:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 714b1a16-b8a5-49e9-cfd7-08d9825db45b
X-MS-TrafficTypeDiagnostic: AM8PR04MB7940:
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB794087D86508047676138421C2A89@AM8PR04MB7940.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vunfzhbQ8O1uz3pSc9CKMzihyJUvMKm51cyGiGj5kC4GqKcXAStO8Eb0FsDV3z+y4yU9DPBjyKElc6OuRF9waDrj878CXCFCKnY213EEwBHCHj2Jez+UsqcpEj5CFXP+lCd5ji3em8hahWG+F/PLsn40lB5Vz59oU0a7fGRoGbxEE5V7ggxlWjXn3JoshnKzNMs+3UbZYdW37J/5NrzEnrcHXIWb+8txf+DkXVG4L+llSeMNMFhZLX9h5Erf+jxlnF5/FhF1RQqdXunb2kkO6SdMVO15LJjqDb/QWiiG98XND2GP1YS5xo9PMcKge2//Ja9gmor/EbY6OU3L2oelLfxDR3HsoZe94ryJLLJw+KxAV7Ng/FO10oGzXLqGMiwp0kitfiH03xbPE1Rge9xMHnKtb/SsZH1BTWs/gN0Q78aSb7aQecuPtuP3MlHHi19AzQFuBVNFy8KBIH3PCcvszTb2qB0tSMaLvdbs1STh8klFE3rxmwNJhSEisscvEqku/w9LC9XnsyaIvIt7iKe1OicIwYhEnDtY5welh5w5i3TSamP3KAM1KPKsTRhLMiT6Q/LlZNJ9J/8nKWN6KZS657OhF/ISl9xaWvBUb9UN/LBrBQTIrUsz/GCXUF6U574bxGmHs3YiiysyC3lH0RytWWr+C1OqGOcSzP5KGezURSEiKbXnRo3+CG7CDilLY8yfVdvuzq3U7fYUpXMaKQ7Pag==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(26005)(66476007)(38350700002)(66556008)(38100700002)(4744005)(1076003)(33716001)(186003)(86362001)(9576002)(316002)(508600001)(52116002)(6496006)(55016002)(9686003)(66946007)(4326008)(956004)(3716004)(8676002)(5660300002)(2906002)(6916009)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sv2+xGjSZcDhvW9Hp6UUudWn/Rj0+iBC60uq4sw56t7nFZ3UvSU0LaNWxUyE?=
 =?us-ascii?Q?J9+iE+LbmvHPHWMkxfMHDr4o+Zf5scSggaCm6sf3zqeVi65uwgzE2E9auK0h?=
 =?us-ascii?Q?nxhod20ZbSasVf+qLaMiolvbayh6nxJ9eo43U6+SuYume7FIe9E4VANXYwZU?=
 =?us-ascii?Q?c4l9w1oVq/YoMN1eBquKUNoWPEvdL93y6j/SNIEueeBHTBpsdnhlXvE/Kq2c?=
 =?us-ascii?Q?GNT53pCZk6XApc/TCaZOiUoTS6r2RFnur85sA3soOgcme6cwxbIyOPa6WlGr?=
 =?us-ascii?Q?dxkLHnq8BYaqs/E4HJ2jBri23OiNRULQF4X9S8781ptocQehszCx2QkTZEsL?=
 =?us-ascii?Q?A/7f09O/HvgeumiyIJsdgEHzCex6+JCkcmieNtHt12nQhSowbw7L1Ntdsiwc?=
 =?us-ascii?Q?zJyA0mc72BNLhRUlJ3A9de2hpyb4KTTXVNZWP2sJ5e8FRaVT+yzvDElDVFYP?=
 =?us-ascii?Q?Xh0WD7CqdylW71iq+pvFqiEgpZDXo2ZQ/l2ZhlayqA0xMkM88J8EAsUOoEaK?=
 =?us-ascii?Q?efVSyWarJeThyG2x/BgL5othp7JB3CZ9HXENdo6Mei2YG5lE8vL0jUtkG2zo?=
 =?us-ascii?Q?ZDDh6JrwWrZoOlYcJzPcarXpg5j9azYxPDzdksyA0Q4O/+gS45tb83Sj/rEz?=
 =?us-ascii?Q?irRaz+43135+WNmhLncP+Uqfw8X9n+l8BNG66gSCHq+yK6Hy0pNH8QyeZBNh?=
 =?us-ascii?Q?NasPIOzF9j/AHYmftTqGtKn2E4vP8yZK9n/CfsKfWQ8ZxxgahRw9bwjY/r04?=
 =?us-ascii?Q?QGa19pXuALeVEWmxInPu08WozzieTLn/u/pmOyQe13LWS/crTNkFS8I2SqZu?=
 =?us-ascii?Q?Kbbb2cpWSy0XS/9A/X2CmWH8DeR4VUvDWKIDCOrzKUuBGReFHXUEkBHROcIK?=
 =?us-ascii?Q?qcacWqSpuBmmJOgjAJ7yynq3G825KejACtCOwFH+dvC8svF2gmDCdPwYEZZD?=
 =?us-ascii?Q?WaftQ6mh4J/3/YRCITH3OyFOTuEFlfK01ennRcjmcO74qGoASlJE24emkh+9?=
 =?us-ascii?Q?hC7PlOLuh5WxY8t6kI1Mght08SfzB0uQzurGhDCLEj23mreYyazXeX8p/epm?=
 =?us-ascii?Q?80f4Chy1YyzxAT2GBtx6EqufyoqFIAdKvW1ssiyUWe45i5HGpQn+izzuCM99?=
 =?us-ascii?Q?lMxyJ0dJDFchNnuaiOj9mCXB5D3WR/+SZ05Otn7NdKqs9Ssekze0AlnfloNa?=
 =?us-ascii?Q?RgFtvPZibiQ4QcINlfkJVltCx1uHWPJm5KXqZn9I7TbelwkNigzcDBTguRmr?=
 =?us-ascii?Q?CWxIAtv9uXix/hwlIrHVbtEyCk1If2s8J9koxAG69fmClhQi6iaxyLPxEy/z?=
 =?us-ascii?Q?6jYTn6hB6UB+Jm17HIL03R4h?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 714b1a16-b8a5-49e9-cfd7-08d9825db45b
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 08:55:22.0540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0gt8UzYy5cc84GwH6Pg7+igXs/FIJ92LXjBrxYa3lyFxkVxYAX5KPj2wAbEM2dFMV/bbQFxODxy9ehOctar8SibcfQDL2yV/yt9g0M0AeRpQlYLq+Xf5FfdoMkBM1cos
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7940
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Sep 2021 08:55:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1895

Hi Robert,

On Tue, Sep 28, 2021 at 04:53:03AM -0400, Robert P. J. Day wrote:
> Two inappropriate backslashes in the example for setting
> SSTATE_MIRRORS are apparently the result of an error by the
> transmogrification script for migrating XML to rST.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin

