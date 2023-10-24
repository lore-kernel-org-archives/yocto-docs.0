Return-Path: <eero.aaltonen@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A40C07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 18:28:42 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.49])
 by mx.groups.io with SMTP id smtpd.web10.155430.1698172121085013490
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 11:28:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=c9JZRSjH;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.6.49, mailfrom: eero.aaltonen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVxwioM8Rmpn57TTI6r98RTwoqLLFeePo4IXlndXW/jjbkzFWAwONEWabVvqmXgafe1CnxHseCHqX05apAd1T0SsnKOYt++I0EUfNH0aXGXf5oHsjknRTT+N/EHmvcG8xnJGTZwb/hoIoKlT/53HhhUhQcrtkV03PFvNeDticBNfB1taWkfhWdG03xDmN0+k0LZXoSeVhNXsgvBmxv4036pHGXZvurJwPYioouejOJLTKsmsY+U1f8sY4od+pvcwznfet2QrAcEXf8e9opPB5x3e0HsLmux3DjiUTYtI6P6GFIICRzg0KT012fh1xqsxfoBFZmZOP/mAsbMBua68lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kl4NsBsUxib7cLBxAFDQ2Jbh0EHtOvzY6xI+Vzc4pw=;
 b=jKCotkgbKCC/dBusAM6ISbFerQsAWZKJXbSMQRZhkulPioGy0k/xNVCF4FRUsXT25cOTy9YiAPsZXWVw9smGwygCDzr4lKqgBNRhMQ8j0L32b8RFO/xxppoHeJgvSmrzI4fe0059TbwboRc0ZweBAD+lHOHJYsZrxGifwIJuZDB9gPbAgDvwymH+56i3nqERP2aYJt+cY1Wt7gjg1/qQnm7lpk6AaEEg0HGhm7OlcuxZUflSzweTea5RedWBDBiUnI8y4aIhrFO2Egoo4qpK4Kh8AbYKzYQl96SIUIOIH4Qybkl1Bh5aDcm8RYiDEQmtLh7fw3DKo8vfQfQVN7yfQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kl4NsBsUxib7cLBxAFDQ2Jbh0EHtOvzY6xI+Vzc4pw=;
 b=c9JZRSjHn+FwaNlpycDa/h+7BJK0GVV3zpTIdAZghOF94xRnu+dQVRMB6jg+hjHXQkvWbr5osv8wCiMxVup+Udvu1HspTv61SENXmtl/4sOysr9uALs/lmcBNqP4SACltLpPompZc67rb1pOU7jF7xyhlebYWlekRvOGHrl/pfDD9UrZ8b+ycDsqQ3FeHSIvzuf7WE5Tr+9RFXUQivwB5tWVs5lKDHoBzkrGsbGEf2L/1H0XFOu/VdwyeVEcIUWMvLWOgTQ39qrAFvtlkpqG1cB76+CCLkrhXWwhJBMNpqngmZ5lRu5BJV0tTPm3rfEdRv2xXleU40hj18NG7HrPIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS1PR06MB8515.eurprd06.prod.outlook.com (2603:10a6:20b:4dd::22)
 by GVXPR06MB9066.eurprd06.prod.outlook.com (2603:10a6:150:123::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Tue, 24 Oct
 2023 18:28:38 +0000
Received: from AS1PR06MB8515.eurprd06.prod.outlook.com
 ([fe80::ea1f:84d9:43d2:8f6f]) by AS1PR06MB8515.eurprd06.prod.outlook.com
 ([fe80::ea1f:84d9:43d2:8f6f%2]) with mapi id 15.20.6907.032; Tue, 24 Oct 2023
 18:28:38 +0000
From: eero.aaltonen@vaisala.com
To: docs@lists.yoctoproject.org
CC: Eero Aaltonen <eero.aaltonen@vaisala.com>
Subject: [PATCH] ref-manual: add systemd-resolved to distro features
Date: Tue, 24 Oct 2023 21:28:24 +0300
Message-ID: <20231024182824.50108-1-eero.aaltonen@vaisala.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0008.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::17) To AS1PR06MB8515.eurprd06.prod.outlook.com
 (2603:10a6:20b:4dd::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR06MB8515:EE_|GVXPR06MB9066:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d99a2e-869d-47de-1c39-08dbd4bf0a37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Yiwqx1v3+vkvKQkpYYekv+FMXiikA46J+kOymcOXFG8nzqZL8Bjb+a5eXvUgVWxjmgd7wWiKk3EcLMqZ5S90G0RtFOdG+Pr4shSn8XVoh3/fukCmmrJ1hQDEw66anDeMDayLSyYa2daDLQJMBzAYfYAKvaD8eBDinLOTra0lH6x0gkWE6wtyzKOO9+9/10QGs4gcgd/debdFqN8jnYxVvnp2xGSsEWDd4mNOKyo7+VYlLX59/Bu1CfPyAiblebNQMp6pDt4E1/RQidu9/IIdFkczoRPZCpb946cRu5Ufuni0tTKzQrkRBNzzQtBQDoBoghEYhXkgseFX87Fn8EuM4gOLwuYZPQlxwA+PufAsxr5vDexO8oH3+ECBdIV8qhewO969Jmn0vmKEqb2tRU69SdDzPCUltKG7/4AddVFs1H6cU4Se7GC5gOPPZl2sf3JYfDeFUejWNR7rb29F8ka2dZCQxsejUONpVmA3CVkqcSbN/tqzYuvGVwUn08DpQis9C4b2GgUztIjgniBonA4jHD1FRkyx2d3RQGBG/ZKopXHySHHs/szKGvIcDrW/H6auCOjOGT2pdNsIBpEcNJB8vu4wzfXUQbY06zqwh4kvxHJ/4UWtI6yaa5pJCOeSM6FC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR06MB8515.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(376002)(39850400004)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(1076003)(107886003)(2616005)(38350700005)(6916009)(66476007)(316002)(66946007)(66556008)(26005)(6666004)(478600001)(9686003)(6512007)(6486002)(52116002)(6506007)(38100700002)(5660300002)(86362001)(2906002)(4744005)(41300700001)(36756003)(8936002)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5vvDhEPReuti2TOQpt/qaSpQ/yMdFEM+1nMPW1fMACiYpqx/6NFAgf3keDJt?=
 =?us-ascii?Q?NAcdSAWqG8PSqHLuRyYcEVOpnJGlGOe+BxGCoXc3HgSC5s6LntJG0O023ID6?=
 =?us-ascii?Q?jn9f/39cKfRYNz7XXI18mYydWdY+fBloLR7naCSQ4ZC2lJTKWo1Af00J+W3K?=
 =?us-ascii?Q?x+exVQOzlEzHTSREZEQUK7fFN4o87FcYS4e+UIObj2MYpa4XcgVvs+6nl0Qe?=
 =?us-ascii?Q?L1FD3J6ObDdyJHnHEGJXXC3Ev8HREhFcvaDzDElvGIsU46VveOs5mDKxgeAS?=
 =?us-ascii?Q?LwpAf0bCiOMXeYzmWRH1yD3qu7fqA+Q05J2TS1Ot6OJWNXHmkv2z863evAIe?=
 =?us-ascii?Q?WBc1S1mf+gcQBxvgr8H+gr92GPCFOXwDZbJwGaXmO/Vjb4qK1J9lAW7ntToO?=
 =?us-ascii?Q?dyEk7VMp64R8m5LEbcep/6rYFr1DTXVKSFB/2hbxVIcBfXmievsyIDk4PWZV?=
 =?us-ascii?Q?+gD6OTqdm2T6n2VzK0Fg8bULZ2hep4LLHYVgdOkDONR7l2i1jjii5gHRsrSD?=
 =?us-ascii?Q?j5Zxp40Y1jjQTOuqfOQNI/rkzBLDIZ86iSTDX7WwbK6aDKWVTllsbIjNlHFQ?=
 =?us-ascii?Q?+myrpBFd14axuvSQ4ShyF9CL1O2mdpz7Yhu2MwKI8XBgmWR5jG081wP+3Fl9?=
 =?us-ascii?Q?JFFd88GGgnMb6XAGGMbvIj/gD4b79ptsXO87T/gQadhLzYsEQf4pnmZHOZR6?=
 =?us-ascii?Q?8VtW3y5gTGVQGba5AKXm0gIziXfj5GIlZW14q+kujDTmxlEuRAEKOeVJB8OL?=
 =?us-ascii?Q?Jn68oK8v247HwyL6PPIIZ96HH9NqsIYb14auExMC97KGYUeDP4EAHWLKPNLL?=
 =?us-ascii?Q?KYxTiERvJzcAk0G7FeKfghEQyHupyLGWolJADlyUy1RNvS+TwzyFDal1LnPB?=
 =?us-ascii?Q?k9V1hS6eSrWUzUPM2dydvUKpn5gVhh0w0S9+RMGU4ah92lCzZYZOeIxLhZ5c?=
 =?us-ascii?Q?qWaN4rNe8/dg2Rug2oZggYtB9POeeIzFXO3sJial4lCr269dxRQJak9NXeIz?=
 =?us-ascii?Q?6k7RdGJogBluJn1nda5Lop2iekwXovTamD/dY3F3PBiBFjpISNMIY/NRTaj2?=
 =?us-ascii?Q?HDMermo08J+QIWGHAn4dGVPrel185OUuISvf/QkkY07sk6giEKAKo1E2GSiO?=
 =?us-ascii?Q?LAxGkwnkAMVKzs+JzHN9WHL7JuyT9+/eLGw7po9BhElAFpu3Oly6oxrU2cPL?=
 =?us-ascii?Q?TPBWkESvrblKag8waHm+krD0dNqhAIIUiUzPpPA85DvHKtlaBeQx2uqLUcCF?=
 =?us-ascii?Q?Su5h7MAaxrtL4g6+kjtDIeTikXdvmgkpPzAk4GGhJiAebZknlJUGuSEHrGo2?=
 =?us-ascii?Q?hLgfMF94UvGOzS3wTWWudSjIsYLvliRplJV7KD7xGJnUz2qBzjkG3u810l4b?=
 =?us-ascii?Q?zKakg9Sb1smsZKSLpHRX7r0f8tPA60UGTIljIIbA1ibOjs4p75HT9iOYlnsn?=
 =?us-ascii?Q?Jn+BjXPdOb3mp4Jk3CXh7jyGp/emN+/U9gqKhHsZXt3Ktemk/p79n/3gSxpv?=
 =?us-ascii?Q?5B17bT87rng05zYE+Qy1+IabG0/Jc+7Eu9Dmu3kly5yy1p8ElH2RT2057OYp?=
 =?us-ascii?Q?/AdTmEorfIz/er228EYFsw07XBZGeVrExmjELth5vjWVbNibZSswSWoJjdQZ?=
 =?us-ascii?Q?9g=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d99a2e-869d-47de-1c39-08dbd4bf0a37
X-MS-Exchange-CrossTenant-AuthSource: AS1PR06MB8515.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 18:28:37.9824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FuPkkWe1JLcFZapyPRaKxJ2pteHGbvkISfC0oJ3HgfgiSPG6O6T6KtvA6rqKU6lRwWIeUUQ/H9kUiRW0zCB4GtdNwD80ZyO1souUzVfPiYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9066
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 18:28:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4493

From: Eero Aaltonen <eero.aaltonen@vaisala.com>

systemd-resolved is a distro feature added in poky commit
6f30e3586eb1b8e853cf23dd039f258d0dc0bc6b

Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
---
 documentation/ref-manual/features.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manu=
al/features.rst
index d6307f1a2..eb210bb7b 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -225,6 +225,10 @@ metadata, as extra layers can define their own:
    reduced shell overhead, and other features. This ``init`` manager is
    used by many distributions.
=20
+-  *systemd-resolved:* Include support and use ``systemd-resolved`` as the
+   main DNS name resolver in ``glibc`` Name Service Switch. This is a DNS
+   resolver daemon from ``systemd``.
+
 -  *usbgadget:* Include USB Gadget Device support (for USB
    networking/serial/storage).
=20
--=20
2.25.1


