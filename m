Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF061C433F5
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 10:56:26 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.56])
 by mx.groups.io with SMTP id smtpd.web09.9961.1633604184962983888
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Oct 2021 03:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=eONTt83L;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.56,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOpK39xDnJFCBkpoa+u1dDclHB3SnwwKqBWm24Z8cRtcBAM3Gj2xZFyoB/ANRRxjiA6j5Lplnv0RoQ1n/OZEjH0wt2/hgF0SvVXikAkQilhZe1bN/a+XKxEPGd2cqZ6tSxt4ttUjtssdTIeMzj/zz1bmxDNlkWyi+YBHjMxKgrwf0y4Ju2f/VM9RHWhmEeWjt94jxtxUPpmu3c5wWxfbV2ioTsDQ9IsCjQCHA6GIQLIdAeRuJwGatW0BQMnIIunO3nmbMz11jjBitN1oh4Ca9TmnHdsAFDGBTcK63AMDHdvmhT9RGdHQq5j5DyDXurD1JflzMVgGTQHWmVZPvg5FNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCm2B+jJ+hCj0xc9IM+azWF14IEm+dQFW0dtndFO2tI=;
 b=bBhv+xnoY/szG7zbjB/2SKArgUGQ72YGPkbXJTNZG/QN6jzZuG4dhDFEpOdR9bg+ercuqQa4MU18ommM/SzwYW+F8/Ea47sB5a3T/Wrkhz5+c/84O0AnTp2m370ITb2qeGDAsNotebj+29r6z/xHLA9ei7Vk5WEA7mRLZ7xZDXKfvv9V0KLvH3GAXKguj3EMZouzd5P8JR1jGnS9kLovH/0EKT59o4anSquJlWpKydZMPMaEgdbAbmHTX6u6Tz47ypaaGSL/MKdmDRcPeiON0mRS0c9QD3w4TlnFopb2LgRseWZrLRX5WZwOZI3n7bWZJDbwTMTBNry5KkCXDPJS1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCm2B+jJ+hCj0xc9IM+azWF14IEm+dQFW0dtndFO2tI=;
 b=eONTt83LXWxgKXSlSQxOuVy1wdcGiVuSGooV8thwBlpqrUwRk/L2KzzvREi5faLwWHry4Hm3pKSHuAorbeJqb96bL/UTjFljZjvSnSI+f4L7d7RS1SmuEftCt+9USbHfXfdhtO376SrEnme7kvjtNtigeZfLxxMhyxk+mzltIAA=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM8PR04MB8018.eurprd04.prod.outlook.com
 (2603:10a6:20b:236::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 10:56:22 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4587.019; Thu, 7 Oct 2021
 10:56:21 +0000
Date: Thu, 7 Oct 2021 12:56:20 +0200
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: replace "apt-get" by "apt"
Message-ID: <20211007105620.ywwbf6butt324ryg@fedora>
References: <20211006190319.963605-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006190319.963605-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: AS8P189CA0022.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::14) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by AS8P189CA0022.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 7 Oct 2021 10:56:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 390e0a26-3be3-47ff-84ab-08d98981193d
X-MS-TrafficTypeDiagnostic: AM8PR04MB8018:
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB8018144ADBC455B6D55F9DF5C2B19@AM8PR04MB8018.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n/1ibTPmPZg8m97rtg0NqeB1dzNbkvKC+LWybRry7UBP98B2NRbhdur6fkvpWFsGTLPau+c+vcvWRY6cBPxXKLCKE2Ive2gdPY5DKEfwNRCEfrv/BHmDGAB0Z+BKf4y8czeSTD2R1i2HXP9zE/fPkbDpNL+grzhOZsBeQ0wVhS/HBJ1VK8h72r/qiTkKotBhQ7cT2O5av+zEBpTwsoG8QRC1fO4MgyTyry52TDDfIvkzgIsoJ3aXApd/oHyBwx91eB+8Uw6IAZoMozUqD8l3OWGjLuQoKY5w2ne1vjQfXVMJfPFRxU4OnrwR5s5XVEHjyonk09j85l0QMNLML5DusE9imYrAxNWd3rcFK3fxaUznFw6J8YLFGVYGkSbMBHk46ni6/HhsjVl2UVInaKi6eE//Q5Fhw0SBQE5LOZIDZLvs9zcBbw83RQ/89dLLiUrkYGuQMTLNK2VzeBBltNn6Xut0+8I9vZewbZFh3hpOAR33yHq2d/vla8+WlKnQVcfjG62TI5AKRxNxdrk9lmBTpoqvkoWjUfd6BEYn7WxSzeOzdSyaNBGjsT7OgMCQLVBesrj2mtjWpXSaabtrloOMuijAPdP4JwCSjFmO4Sie0E8BhYFkD2d/+xm96a8TUrbJJHL97MkJ/RO09O0Zbc5ZMzaEhwo8r/GVGriAFbe1WDO/nK7VId0EI70CK6Toxa+V2tlNZ0+6F0Fsi+S+lVPN2A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(9686003)(86362001)(4326008)(1076003)(38350700002)(8936002)(66476007)(186003)(8676002)(38100700002)(55016002)(4744005)(66556008)(6916009)(44832011)(52116002)(9576002)(956004)(508600001)(2906002)(66946007)(316002)(6496006)(33716001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LWWNLvQ3v+h+SZoIkMqFuM+ZXiMI6yWDThOupQHW8wcimixs2kbwGs+jzcng?=
 =?us-ascii?Q?ZiCTv8Vqx0webjFuqA9LyDrh0g55urVP9Ts4vwtmmIdl3GcbjK9nHGjgy3Hx?=
 =?us-ascii?Q?ZvaN+Q8YVsDcbkcthewFLRt6D+4oOp06LB0YN6D1SYu5xLkL5jxycTuLWDVM?=
 =?us-ascii?Q?nrQH34ujqjCbKT53SrXsYm7rauOxMsCugS80sQzS0G7Z11B19cuqt8h7sPXP?=
 =?us-ascii?Q?QZOVZqPuAmczdGTZd0CYnGiCxvf4mj9DOE773owBLeTJIeLsqnFqyDtkncB6?=
 =?us-ascii?Q?PCn9fyOobipYQ/JS/KD5ZJyrwjFloS+0T63U421PSaWnxq1YYmwoWkPhIIGo?=
 =?us-ascii?Q?QyLSgGk5MmQRltykrT9o8HtYFaaA56fNT5sHMktPuUILisqgeVgKXkB+2r1/?=
 =?us-ascii?Q?+EE2uVlz1uKHhapPRFGjTeXgsA+hnbPJEwLukG84TGiiZs27KSLK9/aV0qKm?=
 =?us-ascii?Q?I3t8NPSsneGdZQDjdpCqYxVa3QNIYdZt7/Fo/DCwwkA+R5RrnGluW5Hzz6XB?=
 =?us-ascii?Q?F7M/6JCaLk3KTsRT4g2AYkrO5GsFE5uAoZVjy2Phiu5zenI53tuyBqD5/VYr?=
 =?us-ascii?Q?IN/dtH02ZsRPOIR0cqhRA5wNwCY3+5HBgW7IlzjNP5QrUTkhpn7GyqFsJ1jZ?=
 =?us-ascii?Q?sqEWZU/AMt+VpkmUASqogVVORgBZ6RLId3zIxQmLeLYV/PvkGJOjs+KRb2lg?=
 =?us-ascii?Q?MjpatunNZJXTiluIMoxtesKECDvYg9szIkuKeQbRuQVxuit7ZQB9JWmhBE1a?=
 =?us-ascii?Q?TSYakeTI5nWW5BIIxPYt1FMDy88FfsH5R3zmm8bcwY5q1QvKJEf0copnhswU?=
 =?us-ascii?Q?2uO3ithrBSdAwU03uu22JE3UW/snSX2x7Y9jvmc0/UtGbgJ3OAsGQb7Oqixg?=
 =?us-ascii?Q?1wOzstyIfZGDewWzXIrdUzqW2Wcol2dkaTvPcQij1W45KMbM6wrXV9Dv5V97?=
 =?us-ascii?Q?clwew++X4rVwxPuEwCCVz75XRbFcYga7TB7MfkYBF74KmsaIUYSJrACqqH4y?=
 =?us-ascii?Q?tv8Fc2dDhnZvPtJh7mDTLnl6NGfvfv7ArifEaTIboNl466Op51iPuDpn9TeJ?=
 =?us-ascii?Q?b2ODdmgvO1FApOfkurvFv4xshwdl48Guk0KWcEaYgMmfNh92mhA7bPM616Xn?=
 =?us-ascii?Q?P89JXOmYN6MY5jwopu5Cuvt3SzW++hpSdsM2cpGdLeKKMQKMebkRpWa8qblx?=
 =?us-ascii?Q?nEDbvjW4gjJVjNpRvQYkn6jIMoBAGYR0HtKssw5+MGzy2GG4b9pA1/r/bXUO?=
 =?us-ascii?Q?4PPd1sv/4w/CIBGXmFZPDTLd5IiadOaUeSg6psau5lw8tuKViINyRanm7miS?=
 =?us-ascii?Q?9pirz6tVcwlP0Fv36kvQE3IN?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 390e0a26-3be3-47ff-84ab-08d98981193d
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 10:56:21.8373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Xs2YNXTESV4xRQfJ9BGlkJLAvjeJrBZKizyN97ICxRiV0ca+63+ZmZbSYFC4ghWnWoSVHOyKzymut72ht66idcZxw8MGaP3DC8T6SvZLrZ5D3g8uH/Qi/toH4rbhaiBT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8018
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Oct 2021 10:56:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1942

Hi Michael,

On Wed, Oct 06, 2021 at 09:03:19PM +0200, Michael Opdenacker wrote:
> Modern Debian based distros (such as Ubuntu) now
> use "apt" instead of "apt-get"
> 
> Also make sure "apt" is invoked with root privileges (mandatory)
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

With Richard's change,
Reviewed-by: Quentin Schulz <foss@0leil.net>

Cheers,
Quentin

