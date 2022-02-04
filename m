Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15DCC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 17:29:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.12297.1643995783422027429
 for <docs@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 09:29:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=j5opR5y1;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=903448d3ab=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 214DEoCg008767
	for <docs@lists.yoctoproject.org>; Fri, 4 Feb 2022 17:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=k94PBzskaI05ncVV3gpJCocVBpydMd69YGQm5TzNcVI=;
 b=j5opR5y1Wzp/R3UB/T7JR88SgP/UNL2lJ4ehOA+/bHXj3AAzFpRwZM9MVVLMkhaqbjgP
 h3Bx4K09fDGCbwhcUR1rizYcLUxsWrcos2Q3PeMMHtK7WDKvVpklL2XlckoJIBN6PsTJ
 4DJSllWsdonqUOm3YTe08Lv6X1kgYiaX5bPQPJlC1JfwdhuGDeUa9p3k9PQG4MNjmKNl
 1/7cEgNkYyeLlwo4iC5pUptTkk+xiuvE5nLYZNg/N080VfSL5Nbsg7mZHlNEXhBftYTe
 7VPEHJ6YHkdq2V4x4EHteF82EhlEHKU62+vnw4pNvmYlZ3KyLmOrcgfHPlTGREgzOu9l jQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e03e79e94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <docs@lists.yoctoproject.org>; Fri, 04 Feb 2022 17:29:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AeZx84Ua46isQyN2zpr7cK3+MaU9+nMCbOP49G3S5sZWUOOECPTXMXWmGL7nwMbvMMngULf+w9GlulPYYtXDUMPIuNG0Dn4jD0j4x564HniqUnqsYom+/zv2cwyixNPbU5QSmaAQ2JUc00s4NMFVjhxaO9/rlErPAqqRvXLC55RTu0sjFCI5sTMXpx2SK3n2q3GLmGU42TOrd6ADNiUzehbA6VVQJ5e7bIE2CwmQubKraps+xaaww23D8Edw+hhM9jM8CX4gHoeLUBwqrHdilsXkBAVHv9GRn5eJJvwMiTNjrwXnZmnBQqfu4nsuTYXif7EuFzlbHXjtq1T2O4jJcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k94PBzskaI05ncVV3gpJCocVBpydMd69YGQm5TzNcVI=;
 b=A2y3a7Dm8C5tVqF+KDu9Mfz337VCoH+P0OrtrglPvrKrp+stkcdBcIgP/XU9CDNDbvanzl01dBYmnRyPa7i0JGRtb8G21TJCrxK8DdCPzamIdPlV3/NdVdYa8GdCyy3UNhdazxg+l7rjwLoSvpR11nFxCueTQWK4Abgg6VPQb7HWGW7LHWKDIExpRe1FWzv6WXHKWtbXO2fJLVT0N6uwBH94RQJJBpS+UUv0Vs/pM+dT0Q1EjmKhOntqb2TqLFgyA0ywA/wtOGcl3h3aIAsKwrTAQEVtdiQY4+ISJZKe7+mcKVJXubYySpTSSKlKpwsqcL3qBYj1tGDIp0pst1Zy5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW5PR11MB5860.namprd11.prod.outlook.com (2603:10b6:303:19f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 17:29:39 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4951.017; Fri, 4 Feb 2022
 17:29:39 +0000
From: Saul Wold <saul.wold@windriver.com>
To: docs@lists.yoctoproject.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH] documentation: Update for skip_recipe rename
Date: Fri,  4 Feb 2022 09:29:17 -0800
Message-Id: <20220204172917.110423-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0071.namprd05.prod.outlook.com
 (2603:10b6:a03:74::48) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d81f7201-c18a-46d4-5d83-08d9e803ec43
X-MS-TrafficTypeDiagnostic: MW5PR11MB5860:EE_
X-Microsoft-Antispam-PRVS: 
	<MW5PR11MB58607BB025162F9D3A78E66CEE299@MW5PR11MB5860.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ryWoV7Hqem0JYYrVavHJSswc0kUXI3rzhk47lr64fC6YwpDe/zi7HwekQ9In/1NXPilpBYodKeCyVkOHQDJoaBCJLUA1yu8znKDuMOtCi3qmupv7QcFPsk1fOGzqe8CUP2r/uwqLEA/y0FtjQH2fOApK/2v7PbzvOZIEdh9Enmz/fcuhHUQ1caEF7UiuBmDQw9/76TGmTOntga6mHoGgHmCzQiX2LHsccgKlpODku8JNy5FAIyvJxcENzIh9VuUQIlc9wpeiMu9Vm4+6vx3UoF4oGX5LWj0jZuqCfJeuh7vxLtews25dkezZdFBVpDvBetyb2X9/LBX4R9aWoTPmAllYAIN5EsXc9MnGhIwYKmRgqYHWKnEawtORPivOqGaaUHbdnWul7GE1uRhLoefgkmjqxi0H0Zgy995U9glkckFDvY5kuAmQzEgL32AxpB+2OpIZ3atoA5MXSDG/r2266TpwtGef3g2RYWfQP1Rlvu/0hyhQgqdPOZb78GASfC01gX8SHJe/FTgx7b4/bLP14nQWZkqQQjluEJ6lIgaOR6gR7S/WiQyjoSFs0DUsScEAH+esUGVJHIXurWWzXBZrkcQ6j5A+f58Hq8/LzffyRzHRy9sX52kV0ZRci0aP1Mn1dcPEd1pnwgqvpAsk68KMSiv7m47GKwYHpwl/9aEzF6oaoRQ1e0546EWkwBSSOE3tcv3/FgbKdTdyLGKMgA9Hng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(8676002)(66556008)(66476007)(6666004)(6512007)(8936002)(508600001)(52116002)(26005)(6486002)(66946007)(1076003)(6506007)(186003)(4326008)(316002)(83380400001)(38100700002)(6916009)(36756003)(86362001)(107886003)(2906002)(44832011)(2616005)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uTmT3DWTzumKGedY3x6+9bOm6iix6x+adt4ULpAbxRf1rFbzsogavm/h3iuk?=
 =?us-ascii?Q?D5KF4hTkcd7ZWbdLVilxPk5At5RcEJCADm3ITwKnaD9E7RXd+suFR/LVzJy8?=
 =?us-ascii?Q?7Q6VOz/UA18aCud8Pcw2rSv/2mTB2cuaQPAzhFTUwjZGw6qMgbs+8ELSvP3E?=
 =?us-ascii?Q?kgHRPsL1fT6E/LWhMSZc7zlrrgLJlLg5jgOJLffrAl7BV+OryoG+6YC13Vxr?=
 =?us-ascii?Q?V5C6H1K7zBQpf9h4wfGBUUDkuRD98Fv+Zg6QfPzhRduySKITDlc/Cd3lt8HR?=
 =?us-ascii?Q?OWhBq8/u3XSMmNKcQlI/f+s/psRlqhZb0uQ/tL5XhvNRBSrehLmzrhXpoV9L?=
 =?us-ascii?Q?Z3INS694Cpj7eQULu5RWgEXadshEUDgq+aQbS3OarifPvHKn8d8aa+89TwA0?=
 =?us-ascii?Q?X7ki7sRjX9QLt4RJbgYSQ8sB2J2v4m5sO6xvc/zlaII5NstNB9hIjUjuOZrv?=
 =?us-ascii?Q?lTLwmE68v7BJkgk6iHO7XKBlO/gURBhS2qs8pb6a8SUfm6SaAFmZfyaiudwd?=
 =?us-ascii?Q?OtPPFACx3MGbMmNJc3iqDRnSYIkC2l0foGviqCdYvMH0HtSGSFqynKhXaSJW?=
 =?us-ascii?Q?kf5vEiFRakH8S/i8Lncj4Ki+OKVsfecnzLgKrBiegA23vZMLslUYQraPN9A6?=
 =?us-ascii?Q?4RO5FvY8Kmr6VFssBlZsnZHRoRQKMVCWUmP6QcWZULoX1suHI4/TBcBce+7+?=
 =?us-ascii?Q?9OpW8VbaAWPm8e3mlJh/uWdM2GL/u0rQ8z1K8pqdMUIU0iPAWYUJ0gCvkVHb?=
 =?us-ascii?Q?wUKehvpEVODBEDAbzWOVmn71HmjZ/nNpAwv78GQzp214hyduIJahxGmIdi+/?=
 =?us-ascii?Q?q4tjl/6DB3JVUlDs3Urw9e2ZJXH/kWE4eBLER0EZraXnFKlXUDjw4lFxqRg2?=
 =?us-ascii?Q?F14/0X4KdsitPoLnavPcmxmvQWGffbrRKUz0js0AImaUsuvybxsvxGQVwft0?=
 =?us-ascii?Q?OR2XF85n64i+HqVHLR6gPZ9A0+RovUyYhbTxStPELEyVYN+FaLp07m8sEsz/?=
 =?us-ascii?Q?BIWojFosH3jROwDGwltDqWNuAQxvPBJ27pwu7OTHfavsvnIGJfEnYuihw1Ld?=
 =?us-ascii?Q?uxm1Dc/Y6kGWL3CemuzNgyZmNWRSZCLD1qy/RDwf5nH3VhDzPYD8IHzBPWCB?=
 =?us-ascii?Q?sJbKdzR0WsIzfIuUDjU60HwHQDjAf4m45pZ/miV1phSW3fecjR76IqyL8dnj?=
 =?us-ascii?Q?hO5JKC+ArHxF8OS7p/Wc/eqfxcdZ41yiznbkXgR0yWi+N2b0s3byVrAMlJzG?=
 =?us-ascii?Q?iuiujCmGQy4XKLMMJx83WGL9cRNy+6GqyHlBCKGzCpvU8HhoitNylSGWldva?=
 =?us-ascii?Q?/9WpjsmI2EeOD+RdXgeS2RAb4m9FlX0msh1GEDFfRdpG/2k/OMv3FA+Qf80y?=
 =?us-ascii?Q?/ND9g8yiGOf5b/L3gBFDfu+GBTuVAn7wYKzt4pLuTH213MjkdVHSNDZfYyen?=
 =?us-ascii?Q?HkC964fB2Ne1FqPDdYfgT2BAbyNc/y5k5RR2ptSA+HK15wFO6OXf5f4SMwMz?=
 =?us-ascii?Q?m6aRq+dccpDFNsbMz1RUmPEXIpbQFrFSpK3VdUkpJ7f05/FDVy9E/wNt5pj3?=
 =?us-ascii?Q?JqCQpSdvgjvjhx0VkyXl4cFfa5qlLcP/j+ToFsjpy4Q0f5nRzHRP7MZWa+E8?=
 =?us-ascii?Q?vf2FPnF6h7FnH1ImDYMsECE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d81f7201-c18a-46d4-5d83-08d9e803ec43
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 17:29:39.7269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pCOXwEf2vMGFr1cHXCYhMCthrolPXoMmvqyFP2rF1SpZTa0GHMijJUIBOZv72TyLqRmbaiSZ6GSgHkQ8E3K2iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5860
X-Proofpoint-GUID: CrE-AVSSunyYqFH0Q7a8Sh-LMwdR3one
X-Proofpoint-ORIG-GUID: CrE-AVSSunyYqFH0Q7a8Sh-LMwdR3one
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 mlxlogscore=983 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040097
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 04 Feb 2022 17:29:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2461

This change better aligns the name of the variable with it's
purpose. Since we removed the odler class, the associated
documentation is also removed.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 documentation/ref-manual/classes.rst   | 17 -----------------
 documentation/ref-manual/variables.rst | 24 ++++++++++++------------
 2 files changed, 12 insertions(+), 29 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 949217bf42..8444fa4621 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -208,23 +208,6 @@ scripts to be disabled should be specified using the
 :term:`BINCONFIG` variable within the recipe inheriting
 the class.
 
-.. _ref-classes-blacklist:
-
-``blacklist.bbclass``
-=====================
-
-The ``blacklist`` class prevents the OpenEmbedded build system from
-building specific recipes. To use this class, inherit
-the class globally and set :term:`PNBLACKLIST` for
-each recipe you wish to ignore. Specify the :term:`PN`
-value as a variable flag (varflag) and provide a reason, which is
-reported, if the package is requested to be built as the value. For
-example, if you want to ignore a recipe called "exoticware", you
-add the following to your ``local.conf`` or distribution configuration::
-
-   INHERIT += "blacklist"
-   PNBLACKLIST[exoticware] = "Not supported by our organization."
-
 .. _ref-classes-buildhistory:
 
 ``buildhistory.bbclass``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d4f40b6929..323f9a4ced 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5683,18 +5683,6 @@ system and gives an overview of their function and contents.
       packages for the target and for Multilib, :term:`PN` would be ``bash``
       and ``lib64-bash``, respectively.
 
-   :term:`PNBLACKLIST`
-      Lists recipes you do not want the OpenEmbedded build system to build.
-      This variable works in conjunction with the
-      :ref:`blacklist <ref-classes-blacklist>` class, which is inherited
-      globally.
-
-      To prevent a recipe from being built, use the :term:`PNBLACKLIST`
-      variable in your ``local.conf`` file. Here is an example that
-      prevents ``myrecipe`` from being built::
-
-         PNBLACKLIST[myrecipe] = "Not supported by our organization."
-
    :term:`POPULATE_SDK_POST_HOST_COMMAND`
       Specifies a list of functions to call once the OpenEmbedded build
       system has created the host part of the SDK. You can specify
@@ -6929,6 +6917,18 @@ system and gives an overview of their function and contents.
 
          SKIP_FILEDEPS = "1"
 
+   :term:`SKIP_RECIPE`
+      Used to prevent the OpenEmbedded build system from building a given 
+      recipe. Specify the :term:`PN` value as a variable flag (varflag)
+      and provide a reason, which is reported, if the package is requested
+      to be built
+
+      To prevent a recipe from being built, use the :term:`SKIP_RECIPE`
+      variable in your ``local.conf`` file or distrbution configuration.
+      Here is an example that prevents ``myrecipe`` from being built::
+
+         SKIP_RECIPE[myrecipe] = "Not supported by our organization."
+
    :term:`SOC_FAMILY`
       Groups together machines based upon the same family of SOC (System On
       Chip). You typically set this variable in a common ``.inc`` file that
-- 
2.31.1


