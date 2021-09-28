Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B308C433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 08:27:15 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.73])
 by mx.groups.io with SMTP id smtpd.web12.11179.1632817633162458202
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Sep 2021 01:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=mU0mkWcX;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.73,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euMy/zjo01Ievd0ZhxZi2YwGsavMw1XdeUx1CG9//9fuOAoHZFy/NYmvPna3MpQh9zP7Im9O0OS2CBQB6vnohDylDDUPTef+ph22W5s0U3ydQ3qSAbrzmUIdXoGCJBQCm9T0bO2FvWLQBSvbets9+dEmXWyv1ACsHEMkBRL8OqGGEYpkXoJ5OLpvUz9A4Ka5Trz4ffK0k1uac/0Cv2VoQsMTGFi8vUEQ6+H4gb8745sgvo8NzJVFyS/YbjKPDejE+cxIBmvEe57admAWMbTB4sSDo8soMOOAW6D+kaQWljhy5kkv5Bj+x1oWt6HblStcQTH4EFZO8Ut2Lj9QfW+sPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=k7pAotJcRNpwxm0uag6toj5P+WD0LFw6zrSWt2oDyzY=;
 b=oPbg2LG5EEd4Ahtt9zxBmmOHOtvbJchhPzhQqswxVus+ULDbpWV3hESFTJ/lSDVnS2DLlPKo5qyH2ZBuMXwKTaKxP/3xbNalBnvGhjGKAfv0kevUHUzrtzSCZU/uihns4OBppcr8lLxixVFpbojhdCIToyFeq536fOlq5xj2kdAfDNPE5SsSOVezGqgashVLYHE+j0YDP0MSegwCqZJy2B/mE/P4LrrEccDqGb1RLTO99bSA7HeibDC3VEiNeRco8gb/ZIyRdBnEPKnYNpvM+V6qxYEaIIgvM4hUZ3zo8QEDsAkfidxrtXd7u0YsDOFFpJxpH+9dbmF6mMgv2xOtpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7pAotJcRNpwxm0uag6toj5P+WD0LFw6zrSWt2oDyzY=;
 b=mU0mkWcXpwIVvQenHKx5hyMitbXnxxH30JmDXGlP8x+eVgLzF1QDiFDtEkvz/k0VOkwxhA938VoM++lQsgawgtAMLjrg+OhhKyfQ3V3ugpekEVJYXJYIxnXWj36XB0JEL+pf/sIEZ4UowY8k016w1ZarkSZh/iCb1GXfLYmRO70=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB4642.eurprd04.prod.outlook.com
 (2603:10a6:208:74::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.21; Tue, 28 Sep
 2021 08:27:10 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::1d01:cb7d:b647:46a4]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::1d01:cb7d:b647:46a4%3]) with mapi id 15.20.4544.021; Tue, 28 Sep 2021
 08:27:10 +0000
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: 
CC: docs@lists.yoctoproject.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH] ref-manual: fix missed override syntax change
Date: Tue, 28 Sep 2021 10:26:43 +0200
Message-ID: <20210928082643.4027030-1-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::15) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from localhost.localdomain (92.42.140.82) by
 FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::15) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7 via Frontend
 Transport; Tue, 28 Sep 2021 08:27:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9c4273c-731d-4985-08ae-08d98259c42b
X-MS-TrafficTypeDiagnostic: AM0PR04MB4642:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB46423094A2647001E06469F5C2A89@AM0PR04MB4642.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CD+WNTNg4XSN8Tfwp7Kmx0O+YtRBE+4/ep28OoU7eFVlkocTOWTWU3YAteOcjAkdublsuB+tT8/RWIBmnIPBYY1hMa9t7u6Zoa6Lb/hgonzZx2wwCwPbKEY2YKaA+4d3XvREyQ30yAKFBMG9PCe4KL/4WLBS5Lqvxdw/cXYYBSmdefQnaQIHj/yStFkBk/AVHPYEYcsAz2wM8kysJmUnFXtBEeLOaaK0FE7gr1VLFDFx5uAjZSah4Gqku4T/8pnfvDEbAf8jJ6tWULPKuOM0S8F0LpvaXBxvgRHy2HdWzZkM0iEcdoGMeU1O4lBoiYBumONWBYCWZB6jfUD1Pn55Y7PAAB1uDF1CGFaTZDW9PmUxgDw2em/1NQAMEUUp6fCqrHB0SGaRUyoUt4wFk6765ThpfYZ0nRbEtRcYCQJg2xnn+Mt60y79dXmRXBVFV4y79zxbnsbfsl+W49gsjysrVgik9mOvgxf6V+t3N+FjDd/Ojpu6hL8WlYsmI7E7nN1WR55GKKUyjK8YRUAe/eE7uXpbzKp2oRVKIB30GNHY606GjHGfZJn6301orxKYEOBFWRQQ7l6T6xWcgGtFZ0L6JXUBcFaUwTR/KPlNk28WAjGO4YS6JCRhTZVDemg8Cz3jipDi9t75hjp1PFepRleJZOzXTdNHG57D++FJFsIgZYt+gD1ZieM5Zt5m3BiFd1EVNM7nCc+ig2cDQkM/VLm/TVkVccWhLcbLws7KEtgQqps=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(86362001)(8936002)(6486002)(36756003)(26005)(2906002)(186003)(83380400001)(6666004)(38350700002)(66556008)(316002)(6506007)(66476007)(66946007)(6512007)(54906003)(109986005)(2616005)(8676002)(52116002)(38100700002)(956004)(1076003)(4326008)(508600001)(44832011)(266003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?E5eccF8o7NLqboMGxhISXyYlPQy3Pfw9KUeA5cFbNZgFlDoevxKBmLSun/7p?=
 =?us-ascii?Q?zTIueXvVhbRgc30UlFcRtTcjMtkt4PlBGcuoCYSwPuwMJ6Kv9J8bfq0PSOOn?=
 =?us-ascii?Q?TySLH3vudiZTIesZQFF0dFwD8cxSnazpOQOsije+Ug/YoZmSClbTR78m1V8N?=
 =?us-ascii?Q?WunRi4f1nfDZAtuD4PxUMBcVIREY94ull20/suE/shhjv01oQhlTkRBoeQXl?=
 =?us-ascii?Q?mRzzD7TZB9F7eY3kSS456aTt5BmFA4sLIFRldX4FHp1ifSmM4POXnxAi855Y?=
 =?us-ascii?Q?XsvXurXrMSLwiHJqOeswfU1KQi7R53Dg4hbwRtIfbaP3rIsOd2jiJNXyl8if?=
 =?us-ascii?Q?BdTuA4a5f9576/lojyIPpS38Ja7q/sI7iNfXUXiHJeWCioRAAK+dji3aIr3d?=
 =?us-ascii?Q?zo+QSjpdKu79YiF0viRfFJ+8WeOYwUJ+lTeD/qWGPk5qZyTfxsxxoyWVZu/5?=
 =?us-ascii?Q?Ng2zp4UGuuiuPG6rQfSXYrwdNNfyI3jNArnur5MbewniAPO92KrSrPQACVaY?=
 =?us-ascii?Q?dBRTr9P6zQ9VPb+U6ZbTEOdSieIAlCg5MMLiaADaQvCbZ+L9GzYmvLtTjXpp?=
 =?us-ascii?Q?8SevwgrPj9hXAeT/wfjlGOyAgmeWk9WPg0X6HC/+qjE/Yp02f1Gvsc5oXNxX?=
 =?us-ascii?Q?d3wDEfmScwghhjWrdvLkP8XK5R/L2IxF35nTH4dLb5xf9y56WI/I76d6DxQL?=
 =?us-ascii?Q?nH/kFckqipSX4GWJpqnvkff8SOy3a383OptRljRd8c4riI3wV8LiTTlHA3ah?=
 =?us-ascii?Q?wSDCz0EtCIBFDsBB58Cg0L7pwlH+xNm85JzkKp2L9WfaVlYhGRr14Ulc2zFc?=
 =?us-ascii?Q?P7VmDQhx7c+V5Q2Ces7OYI/m3NyEBBZjoUVGJZNnvOGWX40UCeBbIiAu9CdG?=
 =?us-ascii?Q?2gCQOY7UV30n3ndehSfH70uL6xbfCvOv+f75G24EdORyVgNJoyhyHkNpACv5?=
 =?us-ascii?Q?kdAYSgM0U6kxNzLzfhEKauCMYijGcssgOb/1joQopsPuHCYLZDzN5stZl8rV?=
 =?us-ascii?Q?xd1KUbmfAE9HS5YivGnG9xVXdS5KLtlbetl+dwGHmAyB0ZgyAwQfL6UjX/KX?=
 =?us-ascii?Q?RUX/ps6uWqUdzobUaBiEeArobJ3p333Mqu0/B/PTstzpa1m6gP/afEX3Xevs?=
 =?us-ascii?Q?dhcbaTjUeGBLxAlRcU2H3aaPVZ8Sc6emFxLieVlXmtMY8pFB/oL7hVT/G+JJ?=
 =?us-ascii?Q?QGhe6meYGXa+2nEoI86MmgNA+prv+Pi4stkag2UmTgl4YTtg0X4uqqBBaaK0?=
 =?us-ascii?Q?OKnubKSmXPrZA21obSIXysO1pxU9ZtLM2PIUR4+/0hX+egUzFTPzTlzKWmEq?=
 =?us-ascii?Q?k5s+vxxcJkmH0FBQ2SMFuJO6?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f9c4273c-731d-4985-08ae-08d98259c42b
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 08:27:10.5869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SP2+8pEomJmKbmhVPKC37EXx4sOJvUcDgBQ2a7UGDKLAoEHWdO/rMQhyhDHFjbdPI4xNXVFc2jF5gEXmSx3fjw3y5etmn2/Ccpt3wFMjdUP+Np8IOaNl0W80ZlKw7vlm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4642
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Sep 2021 08:27:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1893

Cc: Quentin Schulz <foss@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/ref-manual/qa-checks.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-man=
ual/qa-checks.rst
index c3e40dba5..792c099d0 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -151,7 +151,7 @@ Errors and Warnings
    occur if you add a path which contains a ``.debug`` directory and do
    not explicitly add the ``.debug`` directory to the ``-dbg`` package.
    If this is the case, add the ``.debug`` directory explicitly to
-   ``FILES_${PN}-dbg``. See :term:`FILES` for additional
+   ``FILES:${PN}-dbg``. See :term:`FILES` for additional
    information on :term:`FILES`.
=20
    =C2=A0
@@ -435,7 +435,7 @@ Errors and Warnings
    (e.g. :term:`PN` happens to be the same as :term:`MACHINE`
    or :term:`DISTRO`), it can have unexpected
    consequences. For example, assignments such as
-   ``FILES_${PN} =3D "xyz"`` effectively turn into ``FILES =3D "xyz"``.
+   ``FILES:${PN} =3D "xyz"`` effectively turn into ``FILES =3D "xyz"``.
    Rename your recipe (or if :term:`PN` is being set explicitly, change th=
e
    :term:`PN` value) so that the conflict does not occur. See
    :term:`FILES` for additional information.
--=20
2.31.1


