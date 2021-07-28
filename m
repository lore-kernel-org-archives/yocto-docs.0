Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.77])
 by mx.groups.io with SMTP id smtpd.web10.2260.1627462134261871094
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jul 2021 01:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=R293M5hW;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.77, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nf3+yPbCTCi+t0FcOEtoG01yUlSsSO7jcXCFJt/O9MN2UewIvmYMlxtHRj7YEL724OlRzca1I65ydov0htw00GPekiYFjUxZTulXZlBuCAtdHbYPdmDMf0fhemsJAdj8Y0TLtiaseA+3yQLAYot+i6FVRAtKmqO7W9Wq9pPFRNJ+/qpTyCrs3MCxvQALq2oO2i/yUdXKJw9OwUiwNU8ew533C2eh83fujRL844Y86U4AEsW/3kKMbtPeePA+TRjAKquLVdrZzsjG8P0OFcQHy1r4GmdSHDMqAi9f7M8oF2eZUbfywUCCYda2sOmTU3p3iAvUvZR+uwOc/kHA/+sGnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zi2PRs8PAVqsesYBkLE5Jq+jBtgS4DFJBtUldOxs9Tk=;
 b=S3JjOtb17k3TCMrT5cNkH9Wx3/U5Z+ga7ZdatZ+9vjKSf1+4SEd0C2+ljMpSxQbvwdw/A5aQazkjIyVnDj0OlhNtTFfFyEfKynWeh8S27cjesv/HEg7/1jUG4cuTiJKEGXUjxH2O+RxDBBouIvvJlMSoWU2G0HbxwjyOa85dZehHyXqNOu5CjnePpZ8gDC6axJNFlN3Ruf/ez4OeiAD+hgIOy3TkBUnQQoGZVv3XXbnAPOrcIQY+iJtjbmzgtidpedJtrlqczkx5HgUgQR2NDOn91E99VM794MRZWTpjXanC3RuVWgwQOdK9/anOiE0NPH+lwel3bC9CKh1VeZ+bMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zi2PRs8PAVqsesYBkLE5Jq+jBtgS4DFJBtUldOxs9Tk=;
 b=R293M5hWDlpGCcM6uJTd83zxyMtRWic/5Kw+R+iCSex50SnHsKDX76+SJMPbPcUeRce3Y0sCeM0L1flwucnkx+nqs8MeU/P91ddNPMuyth2YTEUV+wjYKYeXXFedzO6XPF5BFkh4X8OtMw6O4XHnswSo/4yHTbjrapxyLuc1A3k=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM9PR04MB8275.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ec::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 08:48:51 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4352.032; Wed, 28 Jul 2021
 08:48:51 +0000
Date: Wed, 28 Jul 2021 10:48:49 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 0/3] Improve/simplify references to the BitBake manual
Message-ID: <20210728084849.i2snf4hxgnwnq7fx@fedora>
References: <1695B21F5A0B37B5.3345@lists.yoctoproject.org>
 <20210727171147.132288-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20210727171147.132288-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: PR3P250CA0019.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:102:57::24) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR3P250CA0019.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:57::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend Transport; Wed, 28 Jul 2021 08:48:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3ea34ba-a92c-4181-f00e-08d951a48618
X-MS-TrafficTypeDiagnostic: AM9PR04MB8275:
X-Microsoft-Antispam-PRVS: 
	<AM9PR04MB8275775AFB0746BB4A59228AC2EA9@AM9PR04MB8275.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kFmludtw64ouRNkjRgEEVmFL46u3Fw1me7Nq8zUj28uu/7N6KoHzGIOBkAHEI0ZgPcZZGvUNlf9oes88mJ3gD0oLu7SD7uGfWtugUqtq4K1F4bXi3TozzJ7jwpiPonI+z0HnyPnhhnxj41GBE+UzGzQeWT0ChKbAksXPnDUdhkKbzc0Bqs7n4pKZpupjbBT9UdpnuJMlIN/Lzj6IiQ6RMxDYaED+Mv/Kv6KW6bIIMOShWdzIYBZt3ffopwJG7vvAT5VztBesWWZhCaXW04El/uHQoF9AdzOOHvMl8yfcBezf/cy+DnAWYZN85OFmruYawyMsoC+02NXxC4ZrKkLLWcmn/Rjtyv/0k5RjZYzTlK7kQpd6fMbNI+iNLZbtRIgMvnUdFs8wUu6K+J6fbSnSbP6G7l49Tyfx3VCvb30gQzKeVQo0t8r44TXG0N8Y2B68PosmaeBTmNyq4m6Q1vEcL6hSxyfBCu3agkneD0e8s06f6tkV/BakNbYrFY8+OBGoaUGDKfhhu+KU0i+BqthR+D4ZZin/TSGfUBRk1wd93c+1ljU9qqTwi8rEXg/QL0QdX54ASVrgK939dv2N6HPiaBVZzVzHBDNiQhnZ/pPmiiIUdG6TTz09VvM+ZUrZvXW+IAsweOBEUaNvcApvcFkvGdTWRDm0fD/FEzqVVJ+cEgmDj3e3We/+NgnllCvKl71f1rdf/TOop5hcuWRFGl8jSA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(136003)(396003)(39840400004)(83380400001)(52116002)(478600001)(4744005)(66556008)(38100700002)(66946007)(26005)(38350700002)(6496006)(33716001)(956004)(186003)(5660300002)(66476007)(44832011)(2906002)(4326008)(86362001)(6916009)(316002)(9686003)(9576002)(1076003)(8676002)(8936002)(55016002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8a1RM9ePvlD9i0R+BsB+DEeXsiJ91qUDum4ohj8PKnd5vP9p0EdkpWEjBu6k?=
 =?us-ascii?Q?5OTdU4S03gRB9rErd9wrMGuPmRUe9N5VBCBvRDmqSetizc5dAwLZKcxzjNJM?=
 =?us-ascii?Q?vdewj2iaDtc4UChiNJ00eF00VX0WUH+5VmJuLJlCAjSo6WDqZQ2+Zq31J2Sx?=
 =?us-ascii?Q?GWdc2s3KKxDoGkL50ZXnepsgwGsQtWiwXalOiLuwddG9fzRu5Q+4kEXXbydD?=
 =?us-ascii?Q?0RDPFvnMrPqi8XyclXCQCZ4fRT2Fwwfg+5uGvi8QKQiXnBkVRmNixORgwb5s?=
 =?us-ascii?Q?lVrZF00puOo0B3ZwxpYHpKJ8PZOcjwuOPXeutk83mif4GKkImq4gcPCvRzzG?=
 =?us-ascii?Q?2xDVpA7RJu8BhgsFuMqkm0A25ScmUndL/B1FSsqurVO3eIvnWOnrBkLLsCjK?=
 =?us-ascii?Q?ilzzjBdXPgUwePRkZz0N3j5JXZyb4I4h39URA/aZEYAhNbndwtOx8lapy6cq?=
 =?us-ascii?Q?IsJWGa8zVRgb/R6c80TAiR6gL8nSASu9PNelwJxqGPrjD81wHp8RqtYIrTnm?=
 =?us-ascii?Q?CPYBli/9hzr9/VYPBavdb0eXIuxboFZ57z/vFAu1YEhurp32Dicdyp8wOBXH?=
 =?us-ascii?Q?sjROhpnBmNRcLYO8G7ff+k7psfCnLXdE0tE6uq5111Ozh8+lJcs+lET4dA/0?=
 =?us-ascii?Q?m4dipYmQ84at0UNIQsJ6LSErOJHMFVVvetCzTg++yEuhKsMjp9CpxcSYBw2J?=
 =?us-ascii?Q?h5z6Ig2UawBGENSKNn7yweaL2ZxGs+r4xrNhJ+Q59P7b8Bx0hfUi3R3DKTtI?=
 =?us-ascii?Q?NCP2yZHiait6bsLG6xD8vcZHaHqIZj8Jxmf50SU2reR59bR2xmI8RJrHCdy+?=
 =?us-ascii?Q?TeiokomY7Ub8oymeyRc8KQCkWFK9KQdqPKP4kAHYCvonYp8Mj1xN2lrP9fby?=
 =?us-ascii?Q?GLraz5FLEoTf+X2UHLEoCKaAWedDIcT1n+ZZiPN0NgR62MwP3dpIiujXkK/k?=
 =?us-ascii?Q?QFj0StpGJnhgPdIKQboWWStmm6lpWilqNv1nWlfie3PUT56i+WFdv4ZiAiPW?=
 =?us-ascii?Q?XUY2+1yDeYf2fMDqwmLCfyaemzplyTsIogjxOE/VB8dNz1nZKucGUkIi3G8R?=
 =?us-ascii?Q?Xo7G5EDyb4bxbY1B25tqW4z6utS1e7qwOX1rQid/U0sfnYon+NbShEjNmphR?=
 =?us-ascii?Q?YgoZb6r4qjjNxzcuAQnh/t6HvZO5H8nsAHaNbaYIM8L86yDnVqDmktc7VkM3?=
 =?us-ascii?Q?Bs3mp9Z0atcluoLGLdR9ycEGSv2+8i6Kf0bzDO46yEu0VthGc4iDDrFfHwqx?=
 =?us-ascii?Q?nO5VSslH8UAiNATkJ/NeqIuY6rqHwsBNWQOyMgLNu8kHn0ytD7uMMkI/I8HJ?=
 =?us-ascii?Q?mOktpCKWlJhqj+eP676clx0E?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ea34ba-a92c-4181-f00e-08d951a48618
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 08:48:51.6573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58JaNrkEV7S+vUCEhaOGh6Treusuu9pNdNGpWxxA6AKVE+Zf5p1P7VSAUxIIPIfL3EJpyjhtI7UStu1kY/JGayY1IVrA5vT0Qr3tioBfKZpL+Fw0II+GFJE5Pj/PlGJ5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8275
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Tue, Jul 27, 2021 at 07:11:44PM +0200, Michael Opdenacker wrote:
> This new version:
> - Updates the guidelines about refering to variable descriptions
>   in the BitBake manual
> - Explains the simplifications made to the references to the
>   BitBake manual
> - Add a new commit to replace explicit references to term
>   descriptions in the BitBake manual by generic term references.
>   Such descriptions are taken first from the Yocto Project Variable
>   Glossary, or otherwise from the BitBake manual.
> 
> *** BLURB HERE ***
> 

Adding my blurb then :)

Except for a small change in patch 2 of the series:
Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin
