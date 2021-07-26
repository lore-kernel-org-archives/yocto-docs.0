Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.59])
 by mx.groups.io with SMTP id smtpd.web10.31604.1627313755447824358
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Jul 2021 08:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=m142vjdQ;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.14.59, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0g55sZMgGhtEQeaLKAniQRjAj/F+UajrIxs/JMFd5uXTZgSsMwTj50dKnLeyYIDpbYUg/DiGv9EIg5a5ex4g++VPIJs+oPFN89YYqhs23UA5c4n9uWJdLWdzzDFnA7srKLG8x4pC9LvMhLnxby7lyfo1qStOwx/WqKF/4mlCgbIJ1bzJ/LMxW7RM/VOwv5zpdA/pcnEwRA2ZKZQQahOndT9yTUBEV/WMGU//Jgw3JhnMHYlvaEDYtNpTi9CTZbXOdoFtDulCP+Ki5AodJzA4aVvO1bCTEi1Lgn4WR3sVqRAESVrgKgo3hApp8T/XTuBGGEcyeRwzzn6rjxcUaFncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuXXD4Ej2XelclCAKIfLh8I7N1PyaUHk0iT1xNSkqNU=;
 b=dDtKgJR+KvSxnQEHrsJO6z+XRLbTcI5pOYzqy9x/Ti9yswzJ1sDU704CpnEfCiLUNP4X3wZNUE9fz2dzv317ubIXZFRa/LGweUVALOG5yNHXbEskBCjcEclBQ06YDz2RA8z5ZV4D3xESlfKTWVJH1V4ksFFrZD4PagbBb7svZ5XnxSAN+tyGSyIVWzAOr1u7AvbtsHqBcLAWmgJgn9HRPATHERgp7WzTDX08IcxHLquHBi0tjMRD5SqfqrYsmaXsQQrF4nWlrQVGnYN3Q0QHyC5r6V5gexEFVL16cKeMbhjOkqgJGno/4OJg10lNmR0taXjRTG7Z4xwSdr2DFTyIbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuXXD4Ej2XelclCAKIfLh8I7N1PyaUHk0iT1xNSkqNU=;
 b=m142vjdQ1e8z9DDU0L1tXg8+9aRgRss5Oh5Lvm5JV/fkWp3RcIQvzwM96vQBY1HbxWYNrTmWDTLIHuZliQbmbW6JtHzp3Uh6RaH8NXjDlQf5kygN+t0LOzyAKbmBItLigvkJIWqnj+etw3USWrsoDcLoL1iUd3iCaEL9tRRcVj4=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM8PR04MB7412.eurprd04.prod.outlook.com
 (2603:10a6:20b:1df::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 26 Jul
 2021 15:35:53 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 15:35:53 +0000
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: 
CC: docs@lists.yoctoproject.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 2/2] doc: bitbake-user-manual: ref-variables: force glossary output to be alphabetically sorted
Date: Mon, 26 Jul 2021 17:35:23 +0200
Message-ID: <20210726153523.2503355-2-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726153523.2503355-1-quentin.schulz@theobroma-systems.com>
References: <20210726153523.2503355-1-quentin.schulz@theobroma-systems.com>
X-ClientProxiedBy: PR3P193CA0024.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::29) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (92.42.140.82) by PR3P193CA0024.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend Transport; Mon, 26 Jul 2021 15:35:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4b8d579-b51c-4c82-cb61-08d9504b0d5f
X-MS-TrafficTypeDiagnostic: AM8PR04MB7412:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB7412ACA928898EDF4E7DCA27C2E89@AM8PR04MB7412.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7xzPLhypHKCUrzQtGXjTQpopbEIZP5a8eN5Yrou8i8+BEUKJd87q8bxYNdlr+GH+MEa0abp5S2gAVjiZGK24Pk+STwZoThLkH397YnfYCbl7BlbLNq/bVdab9JhcHCO9HKldZChTq0jI6bOpX/QMfol1SlI48uVRiaMNXsrgSyLVAiBByBQfXavgL7DdkJ3b86RWMuLtAPWS05RZwj46Ietdn35gaZYagDnnSK4Jsp14YCAYs2Xf6Uy9VcOrLem9Znzp3/kjzn81mpy+XEatQl2ICZ/j+lbkqJdE6VVYk2Rvky4PfetfBgVyQR+GZri0tFfFgYn653UCzafGuCjXI2dWbLPS0QzmP1pPxmeJzV8khLYfiIhw6DyWj156Bk4rEAWrqpWnnjrpfZCkmpHa0eVT+gG4GEWIE2TVLSpIQEMUfRduIEypSE202C3GhO+HaLTFVB1SF148g79fXgboQ7vuJVCAAf03RwklRkNJ5epVXQPydBsNVrQ+Z77W8/sboOLZDbIVyhkMpWQAU6wYHYa8le/9JvFTEYOiVlAkqDobLWqkmnnTgudC4zklbkdesMIQwHbslv+o62cByhj7d832nAJipz4/W9CmgBO2rSIFXk9TY0FRAwKVPMee4h+rC1yNENu9fS9P26ro/cXWFAPOYHodt5VPp2lDZkNYIaURMnfFc3EC2U3qrEvqClG7YocDCPnaFQHuhCwTy4+VGg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(136003)(396003)(39830400003)(36756003)(956004)(478600001)(8936002)(6666004)(186003)(66946007)(4326008)(109986005)(1076003)(38350700002)(86362001)(6512007)(66556008)(2906002)(54906003)(38100700002)(83380400001)(66476007)(52116002)(6506007)(6486002)(2616005)(5660300002)(316002)(8676002)(44832011)(26005)(266003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8Ckh3BREhozS749I5D2M0QXeZPmDsIsP9u2avvfEmnvnLtCBTIDRJZmAwlSo?=
 =?us-ascii?Q?GK89OKvvKUQM02tPdmptupeXrzQtNj/kx0uuadpd5o5QUEngevOPo6/v5asn?=
 =?us-ascii?Q?Pq37kb4PHTHVkrZkbD3evuTR5hPi3IlG2zw0BZYRaq8HdLluz0yztCsRiCbW?=
 =?us-ascii?Q?0e+IhVcJcC+qpQuadA33z5lNb1F3xWTOzMTjFWT2125rzyKMbB9ieDAnDvGE?=
 =?us-ascii?Q?jiK3nkxDDzayzkXiXzsr+8XsjUexdppV0s/iRY+3rCyDBYtzHymFKwigIqh5?=
 =?us-ascii?Q?OXUpeEFZpI+DJmnWIPlka64M32imM404f4UHGc66BFSlnlYQdCRbeWeQV1Ie?=
 =?us-ascii?Q?PEurVC1giAhKHHdltQkHuMBGndJj3RTlrsba4yngZsRKRkVmI1pWryAbRcmi?=
 =?us-ascii?Q?BoxF9XQeqiz8y3a2/prjRAbqyNl9zng6p+pToh5/Phpz1sOakK/EMOTtV5Ol?=
 =?us-ascii?Q?sjuSx/wND5yo9SvpwlcvAWXLhbEgSO+xHghGf/wjNNws6OZ05AWH3YA6sp4f?=
 =?us-ascii?Q?jhx0+z4survEmaI5GLu4jrWQiNx7D+l0AOvkr+MKuMWqfIe2xNst9EWsuimc?=
 =?us-ascii?Q?5Rtz9941IK0/C+XhYt8jZUoCtAEfuX35bc50C4Bn+4h06e8cAMlFmk8fd7jB?=
 =?us-ascii?Q?DAbzbjJF6OYPuBcRuBaqFlsKewsTCIbSKdBVSrjptnQqbuo7yeSgRYezPUGZ?=
 =?us-ascii?Q?hgY7K5VbVHs+fXT30nBnhfBAJ8/lxQKt6B6bsBGsakJLynMZYma9L5jB/F20?=
 =?us-ascii?Q?Mz0tBfhfeKJ+US5PTWsn7hH4uAuEl0VoXaw91f6ybi9uxEWE0OGiVmcGZ/fH?=
 =?us-ascii?Q?pb4E3BejvwwEUvYq8bnSt5Y1QVORDw16Vib0NW7XvWJ2RX0vEaeZO30aZL6S?=
 =?us-ascii?Q?QLyghg23RN54w73M/TZMHfroA2AzV35TDKDC2HNUx2WK0n1G4XYLhnyj5Nk6?=
 =?us-ascii?Q?gMDBImXbniiLBM22BFkDZ3YKTGMj1r7Jm9CrajfzzspB+UotYKq6sGciHgl5?=
 =?us-ascii?Q?Y1yj2dadPpPrsqC8c8sP1euNi88LTrOYGoV8vEZo3n7ejzI02THgBXzCtyYr?=
 =?us-ascii?Q?4Jxla/jjbYRfenpLGUaTFqHyVztFs1ej9/Z2IQcJ9jA3RLmc9Wmx5kZf1SC/?=
 =?us-ascii?Q?I86r8NTN2KVVRxEOdJOe1k+bBAXEQ45z2xoXfJ+1KhtT8CjjKaSYR4rPNmPY?=
 =?us-ascii?Q?roh3iIer/9du+8Q/jjkHVDfH7DbDWyZgy7Hygdn/mbFMzmFwkT36gOH6gdoC?=
 =?us-ascii?Q?9ss2NTMKpHdg5ZlVsQ4DUthVYjgkGQWw4Vin/EJsv5o6c6miOZGaPpBITN8r?=
 =?us-ascii?Q?yVFLpprbbn9CiwQHGnSUXHZE?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b8d579-b51c-4c82-cb61-08d9504b0d5f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 15:35:52.7696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bccJ3oF/LbjYSMrt9zh+sWgBqfzsBIxsALECWhYYJAmwyD+GHFljpke+2PlV1xGTCCez/5oBZrj+0q0NiKl02FIhSXvY/TEwOVivBzYnY2hbe5k/Izno2+XTHsm47IJk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7412
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Even though, care should be taken to have the terms in the glossary
sources alphabetically ordered, it is possible some terms might be in
the wrong place.

This makes sure that whatever the order of terms in the glossary
sources, the generated medium is correctly sorted.

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst =
b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
index 7b5bbc28..797e2a00 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
@@ -24,6 +24,7 @@ overview of their function and contents.
       described here in this glossary.
=20
 .. glossary::
+   :sorted:
=20
    :term:`ASSUME_PROVIDED`
       Lists recipe names (:term:`PN` values) BitBake does not
--=20
2.31.1

