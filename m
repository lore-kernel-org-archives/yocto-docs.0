Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.71])
 by mx.groups.io with SMTP id smtpd.web08.31565.1627313710030936421
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Jul 2021 08:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=k6xBig3X;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.13.71, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmpzGdfqvdpljCB4vb2wrygfL3SLHI8YgI2K3ny0AE3S7WQoN5EV/fG/zHxP1n1FJpN0XdfnZoDgNfWoFWdMfldDa8ntmKDqD5IaOqpSgXxjDbtk5Df3p7zZTa9AoBM+rh8cnxEjnBvwuH273jYCZBfQ5/oOhf9cL33Fa4N0r8aY/awEmhoPm6TAJ1LMBPYnuvY/ZKMqJUqSzARe8/A+YL8+NPGQ2mBmBSXGCUT8wutyshk93vH7lY9XpSWrQXiUNXc3ZvuKvnsZ129GryjrBC7qP7nfRGef1tXldxtmVO2ERWWILuEY8w2R6kdXte5ET5spnSiDUmh1iT75bm2keA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H34LfM3yJztBdZYhJYrB2KJ8zEJM2G3Pei23BqpJL44=;
 b=RrnBQiR+P1zDKnNinm88cxz0D5Vhr9CUtlkFLRf89A0R1t/tVRbxkpTJRPkaY1a0cPYGm3ZhVEWasVwO7buq+8FrsVpf6S7zMCQ0UgE4uJOm5BqYVzJqRMjEC3n3oCuw4H8f1/HCR3NNFLWATDuJx+m4RW0DV2nFBYNGH4hnX7Vvu1IM0ymHattMa07S+PaXNIIPRXOYWVgjOqS3M754hQP7AHgyFrDWP8UvIjm1bEXk4GmY+fg/BxnC+l91Xap625fUUqjxS2o37YqxK6ldrP83UDRLaEVuLA3eoJEk05hdBgcbsqADt4LnKLvU2wlYPy6gDSVCc9O0yeMhhigRqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H34LfM3yJztBdZYhJYrB2KJ8zEJM2G3Pei23BqpJL44=;
 b=k6xBig3XS0Ty7LcdSZiclPbjVO5KbzZhrEi6J52IgmBOEFlLnKNYdOs7Uy4hYsXst1REImV79ykXPVSyNkfIiBB3T5VqnytaZDFQp1MlF3dM275tPQJyQXtg7O43QB2K+TlpkBTDUZfpbPB/0lVC8upH7kFgpz5ZbCoDfQG1V2o=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM8PR04MB7412.eurprd04.prod.outlook.com
 (2603:10a6:20b:1df::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 26 Jul
 2021 15:35:07 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 15:35:07 +0000
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: 
CC: docs@lists.yoctoproject.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH] doc: Makefile: turn warnings into errors by default
Date: Mon, 26 Jul 2021 17:34:46 +0200
Message-ID: <20210726153446.2503018-1-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: AM8P190CA0020.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::25) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (92.42.140.82) by AM8P190CA0020.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.30 via Frontend Transport; Mon, 26 Jul 2021 15:35:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd5a5a98-aeaa-4d40-3a12-08d9504af24c
X-MS-TrafficTypeDiagnostic: AM8PR04MB7412:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB741234C6C2E463FF58903F09C2E89@AM8PR04MB7412.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5CE0gp3tkg2f8bSHX7j3jaYWYRApSQxN4FdLdjBwrbCMS0xayWH+lMHa59VLuS5JGiDdE5vZ7ZdZtbnHqcbmDqPBZF6y7+Ix9ZxsrvEZxY2wH+6aGNY68ANNwuGaEGnSa3THSp/z2SgOxGLL2FFeNO2ERcbWATHasCHRu5tAwlkEekSt/1p3qj1lUHF3YPj8/1SEEVtd4jVn9kD/JC00DZF4wKCJkXSlKr4aUMJAgSEZch91LKLuWWAFzGM8c9roUWFc+YSvDuLbmtq/h54vQ/8wgcUmpCP091990pwRugAOlgKSVmv/MI4A+Q1gBGXVTAzXtMF4ZKsdgboDLdR+2RaDC+4oz0kg/HWJ5S+IGVWXiBQHqb09AjGLiHTEaPpTDs9ingG6yNfd6Bnon2Q2KtV/W2QDsqQRiPcOXllyOiDwvkqdszNnoa3MjUjn2KmzCPhrW76HQlicruqekc+UGq3J8eX7V6qv1rfwxTowWIu2bSEbVi02LU7tBqJhZ0pMWWAok8wgqEzXjp+Mk/C1OFrNTzrE+oh+RIQVGNuYofeQfakHGbeBE1kLPoPmtCj/hvhw8ieMBKtpvABPL86F7B3c0fvN3N5fC5/7cAyMEWHXQ6ZtESm6B2GsnRNSsOdqChP6V52lxMlwJK7r58ED8C9XuQalPUaBYpu9hTE48cMztl5ZqdIANojw5VKBDneqknrFYEpG/O6596ghxhA+Tf366jJLN+PDj856ja82ga0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(136003)(396003)(39830400003)(36756003)(956004)(478600001)(8936002)(6666004)(186003)(66946007)(4326008)(109986005)(1076003)(38350700002)(86362001)(6512007)(66556008)(2906002)(54906003)(38100700002)(83380400001)(66476007)(52116002)(6506007)(6486002)(2616005)(5660300002)(316002)(8676002)(4744005)(44832011)(26005)(266003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VascW5Azr5kNch9gpFJeqb2JtT98iDwcXDut/SVKp4utUO37KdSqkJCnS7w3?=
 =?us-ascii?Q?OguX0IH8cuUEVaDV7meMgTYiNkJkxjmoMxPbicbFkgl5RfJ31URWmnyTj6v5?=
 =?us-ascii?Q?+l3suYsYAL4jGGZPkMHarUoglFXrAvsdd6fixXDNELprfM1ehz3oGYp3xEQ0?=
 =?us-ascii?Q?pub6fjLxvmpm+aj7iuT+iaJEyePNVhlLGaIfVfuIWwJfPf7U0hE5ON7nityK?=
 =?us-ascii?Q?J4PnvSj6gq/CP45ePuxQZZbRicCMVrWuSPYDUi7oBjXy52rgCliOqj32Hxf/?=
 =?us-ascii?Q?d48xiU9bak/AfuMwoww0Jde/0MBGDvX2iSYzTGGeiw0WV+q4U0EmRzbPq+lE?=
 =?us-ascii?Q?lM1CMcEReDqh+Z7x24L6Uv+BKNxExsXVkb5iHF0fYkG6Z+2zP6uQq+UDmAlK?=
 =?us-ascii?Q?sc+wFHp7S/baN43X7ci+FLNvI4eJruW8VmK2M1prBDvYW1tpDdh8JodueYxI?=
 =?us-ascii?Q?lglrqNAO6E0RTazp/pvEAmc604EUhd1Oad069lc+jAxgxaFA7nW137wdYHjF?=
 =?us-ascii?Q?J405lNasyH0zAe2lwlWG63P7BG2pY54Z5WLVVq0ZP1XXZGWe2EM10+byafvd?=
 =?us-ascii?Q?31r3lWcfvOilrvApPNbNZoM9b7plhOu5cz/X3zCT6Xj+pMBr/gm7bpwd9Jsl?=
 =?us-ascii?Q?lRzcNPpYgiw5qlfI3IkLXP5oJVNZ+ILBV3n/BlzF/Z9MFrqX9GF1LkQUVc4Y?=
 =?us-ascii?Q?niONqpoaM2No21bd/BSLuDQwNINjEPnpo2uc72Sq6UMceFF6iSxNHr3CjY9N?=
 =?us-ascii?Q?HF37RXN3VEImE2oiV6+g6DO4pb4J0XsOwABzVMzvqviuRrNAlbqgbZN/hCMf?=
 =?us-ascii?Q?DcDCJUS65exh3PdYWAEyfc9N+aBwBdGcZhqLHtR9NyE8hRBz97aYjPvmnjAm?=
 =?us-ascii?Q?XFaZ7FRDFcBcHyu1tau838ccKG+Sr3tWwf1ZJaPs21yMwwKeKuGZI7VHZejv?=
 =?us-ascii?Q?yG5RuY9s+2mtMsCcq8+v/ndCgEyRjWzvO8cT5jWzsbhR0jqRBIn5Jqt7UPOo?=
 =?us-ascii?Q?xNtBgp7xbtX+zLSM/SB2K+14qPOjgOMHiMEzOk3ZoPixI8NNgAgN9CZEvM7J?=
 =?us-ascii?Q?gPu0NLW2aoMI6A5p3neiWX4fqxTVlRPIPRYWB0P0M6+GIWSjUwCLiPVFlrr7?=
 =?us-ascii?Q?NoIABG/At8PFkkhQmpla3+3AoU24gUTjwufkopr+Gut6JZnKW6YprZCuebsy?=
 =?us-ascii?Q?SSQyxWyhTYqT1YIdgyA10NWRpB6LBN/CHeTuigYVL4OrAyQtEkVJPKxsvPhZ?=
 =?us-ascii?Q?1rFqka9jgPVn9QEYCpqRRF0m+y7wnUd1RDwPW4qWWHrkBk6OgkkAUovyqnsZ?=
 =?us-ascii?Q?rYBuVUPySKFP0IbvM78cQP7h?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd5a5a98-aeaa-4d40-3a12-08d9504af24c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 15:35:07.3399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCuTTkFjpFydDPL1mh8AP0LcmUnhEx8/G9JnkrE6WyBVj6l6km2XSuI5OyH76kdz4FJ+D17DFzXKXDwhKpXZ3UhyqL8jrYhg2/C2cXRITe6rffHK/BIjGygftyTQzsPR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7412
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

-W is for turning warnings into errors, --keep-going to make sure the
whole documentation is built and all warnings will be printed before
failing.

Since there's currently no warning, it's time to introduce it!

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 doc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doc/Makefile b/doc/Makefile
index d40f390e..996f01b7 100644
--- a/doc/Makefile
+++ b/doc/Makefile
@@ -3,7 +3,7 @@
=20
 # You can set these variables from the command line, and also
 # from the environment for the first two.
-SPHINXOPTS    ?=3D -j auto
+SPHINXOPTS    ?=3D -W --keep-going -j auto
 SPHINXBUILD   ?=3D sphinx-build
 SOURCEDIR     =3D .
 BUILDDIR      =3D _build
--=20
2.31.1

