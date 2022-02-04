Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B13C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 20:23:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14444.1644006196374258650
 for <docs@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 12:23:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qEajrTb2;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=903448d3ab=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 214KFrZn025990
	for <docs@lists.yoctoproject.org>; Fri, 4 Feb 2022 12:23:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=3SGnWZHmjBTrqWUIFbKYfdYYaTIhkfBYrjlTnT5nC2s=;
 b=qEajrTb2jhH2psDRjK0jayiQflqpnQCZvjjkp0d3EC9ut5nGpKpWX0satQE5KSMiki45
 OdDG0S5MM1LnhZJYHZ5aC2qNf9lV1v0lErLJll6g/YT58VaC0l5Fv6ueL4urYTBmRD6X
 0puzcEGe7V9Zr/Pyjl9pYfcEf2UBRvrmfIfx9MqetUnC97U9jvfE90JhbT8EbvUuVDTD
 apnRH/D4FGbdotjxCU7qqvIffzYQ+uDU/4Q8/O9XUoK+v/2XkCTZuxFGkZyt1r8N/bJB
 HKhVlm1jD30iie+CGpW3X7Mcti0PR6pa9KpKk81o6YNSs0xTbAAr3tCnCJVBNULAncPb ew==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e0jpgh07f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <docs@lists.yoctoproject.org>; Fri, 04 Feb 2022 12:23:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6rNSkqRBVJ9JNr2rpZ1AIqXCuPDM9TSChySC6NGrmZkSQkDM53g1cLMt/HECmZeZb7olBsgJfVWyIe0HbfFXsOSEwUHRz0+es9veHLZTKGWpOeIXdpAU/NzEaHWSPVNRoqzIzQbgwUIl3KIFsItB+7+JKV79WacvAfQArAXrMLIMr8+sJ/BVSJyJ2ZwNO5ZQOEzUmvX52VX9UF6lSYZUFpAPRFiQqbiX34xp+DF9uFh5mxaQWO10DQfx+CEa2ga6njubDeF3JB73WxFuhnET9rVVvsJiqj5WpG7Xypp2zdHztwt6RloaK1bsvb5HAN0BYs79pmep+lo1m3bSHvNYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SGnWZHmjBTrqWUIFbKYfdYYaTIhkfBYrjlTnT5nC2s=;
 b=S99CCjhfyKegCAaRDjbrD4zwt8ZZiPgGsl1UTNdxlTWlrK4JKl+DWR/wyBfcEtwjO4N+rVPb/8twYMp7Mu+R1v0gkj4daPlXEzE7OLgPRbbuRGrC49DZatcnRm15fYfY/w5upeHiQeC+XzyTQQSPTj03tU4BIANNFsxfPI1ZWDUzcucoek1+U/veur8ds+/XAs/ZtkulieiiYw9OaRMgNeVDeIHd1QwHJBfpRXTLlR2EWjE1GDm48b/SheZ0r3MX6KNIHffYKugGUY/wQxVVFG1BktY4hWLSKCNY4Xkqc1+xZy9ZIN7GyXFMyeE4rhTGMATAi1Ue60LH0p4Fh584Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB4803.namprd11.prod.outlook.com (2603:10b6:303:90::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 20:23:12 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4951.017; Fri, 4 Feb 2022
 20:23:12 +0000
From: Saul Wold <saul.wold@windriver.com>
To: docs@lists.yoctoproject.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH v2] documentation: Update for skip_recipe rename
Date: Fri,  4 Feb 2022 12:22:58 -0800
Message-Id: <20220204202258.141312-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0061.namprd08.prod.outlook.com
 (2603:10b6:a03:117::38) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56fffe56-78f9-48f1-c363-08d9e81c2ad6
X-MS-TrafficTypeDiagnostic: CO1PR11MB4803:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB48035A005A9BF096CB2CDAAAEE299@CO1PR11MB4803.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y+sl+j4HmFc1YanBDY8RtCh95XLEisEAriKBLK89Hv7sdawc0mRTiDr8fyL4LpNGOb19tyB/RhAVmjgSzjXQDql2FPw4CsTpJmFktLqwVtZ69UG7W40dhzy3A0S1LyNxB2FLNY5UqKbIx4GXA0JsyT6BwE8Iq+vkLDG0VyieT5arbIBIkuTHyJWopuu19Tp/zuD+c3cCYAJ+STtdzk6hfVJ4WGBm9iGP9H7+WSAD9sPYla9SX/PpBrvz+Yj/XYkGQ2yr1yyAI5Bm+WzmCUyK8gMigIQQQyw0GfKsq56VC+JWHIFwDDqqck0WDViaU932B+FU4tGoeqq3oj8MovCtr/aPzEwUZoioe0xxVddp9SpThFofWQr7bQ0oE4i2boXN2D1k2qrrnVvgcSNUg+ogbtRix7GUVUdPWvGd+RmtB1p84TonnwK6pXJw9vG179Evps5hig3QOT7FSPRePR6pOYWWSBDnUf7Ftl99+5dZauXoLeg6QSrNqbZRoYw3pxQ/h3SusXfK8xpfd1H/WtmSj9HaKvDMmfsp/Zo0WD3LZcJuZOg7LGny05h1edj8FrlY/RofwK8MjxEd7EMog2Fz0tSga3ijqFWJlAO2wGzdiRQayTT+J9w7nGg/lE2kOcu3horCHAu0jOMiCCqtZfask2/QBds3qYUNLGCgH4OLLdz2iiwniMK7F3hwcnE80KZ0pnaCNe79A2Na/cLNPYIBvg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(1076003)(316002)(66946007)(107886003)(6916009)(26005)(186003)(6486002)(508600001)(6512007)(52116002)(6506007)(86362001)(44832011)(2906002)(38100700002)(38350700002)(6666004)(8936002)(83380400001)(8676002)(36756003)(4326008)(66556008)(66476007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8WvoajxCWNYErdkbMCFHyLWdei/CX7N7yPGy7Hq91ZzFED/tlJLBrBoTHmEe?=
 =?us-ascii?Q?KGw3VYRCPApMH+AlCFb9tWDM5QapDjh7dH3F+YM/YoE53bxY1N1bsr3GG+ry?=
 =?us-ascii?Q?5AsrwXZTDlOsYasvjzTQwJgTv58Qo1Nrxy6VVu5Q/2acacdBtxswid6opoEf?=
 =?us-ascii?Q?X7TfQ3IGP2Ar7/iut62uEXyyVwvzaVV8tQN7RN1S+SuNCOECkR68xnE8ZMuC?=
 =?us-ascii?Q?c3FdlXc30+UTXvqpKcfB/71RLgCr6PNLJdLfRWaFjXL5kDg5Q0PO6Tdq9tKE?=
 =?us-ascii?Q?Ok1ikNTVNy+wIrxfmeZDIGLFlyki3DUjb7feD2wTgeZyzmNQZTRYhuA3EomB?=
 =?us-ascii?Q?OHx0+sJZ/o+MVzBtFCu9vhWWmZ4SC+fhmyoCe+pbNQ5ir/QXM/nMt6W5uEmQ?=
 =?us-ascii?Q?wQWkI1wBnLRcOBIAkVTngHiaBYVYHvYTZv+PrXx3FNDRtGUQ691l4UYQG6PH?=
 =?us-ascii?Q?N13Ua1eSxl9PwOrVO/2CUFe5PNAhNtZdLm1FhUHxHEvFDv5S/PIRQ/RPEpm9?=
 =?us-ascii?Q?9P9NPZuXtqlzzGmaedxUyeSYSvVi8ArP2BOzUqztf90TIchBplPR1qalPNJ8?=
 =?us-ascii?Q?c5Gq6l526xFU3OeAZmw36k3xusxt7N2E31HGpIVpR1otsvWX0mYInwwfLzgQ?=
 =?us-ascii?Q?XIF3DF5hNE/7OTzJ8frQKq0rR63DOw29jtWvaYT9Vltho3hfdYtBL96wUqKl?=
 =?us-ascii?Q?AUTQDIxeuI2Vl3xmWG0SFiyjc3vh62rz49bmMSyTx85EP1iPzM8yK22buFoj?=
 =?us-ascii?Q?PRslCT0/IGq9NMFfO+uxGLnqvNQ34pCj8RCuAbzQGZ70v30fh++Yr3bTVw3e?=
 =?us-ascii?Q?KhxFbn7rtE/p+i4jz7DpD15bqnAyxMW5pwMmk15uVhPwTdWff9nrboApBd17?=
 =?us-ascii?Q?mA/52qO9TIuuolerXvmR4IHxotpZoyKDmN5PFNIiaOeifNP98NWvHKDYf6vu?=
 =?us-ascii?Q?7MmTJnInoEDRSxwGnZq30ne2lYdPzYkKuG/8G1QlrLJ9XrjSWmPHfR+5JTHk?=
 =?us-ascii?Q?m2KKD1XctLTZoH4NfaWEuqnPgiG+A4crneVbqyZEDZNmm06yVFW9ER9jMh9L?=
 =?us-ascii?Q?iUd9hIcbFu7oahAtfZnoaHK1yMTZEJBd9LKatEOsqz4YcJckKFXPSWk5yZ2r?=
 =?us-ascii?Q?kuYEHVMhZYHP+DDhTxrQSbA6TpEKH1GhIaypuRLZ4Ju67G4uvO5RhB7+tY4/?=
 =?us-ascii?Q?A6AhrvkhDKE5whjGmZMfN33IWHjrEU0h8b6KcagqnHfgHmg5L5jvk2CzMxqM?=
 =?us-ascii?Q?ZF2Y9eBgOzJF96pvgzZbpiB86tfunO7HSmxB5nhjrqsXzwpmIDsTGSH01bk/?=
 =?us-ascii?Q?xA49Tp4jrYjcTwn8yJvRgB4XY+m5+EKg7mjlMNGQjysJLqvFvJ6JHDz+pQo4?=
 =?us-ascii?Q?n9qb3W4T4pHPoqHlw0wUP6NrXar2I/KRtXqqAo/aF1yNd7K+BKe3k95XrGng?=
 =?us-ascii?Q?66dXMsGLuGDSP3jBH4WAeqWQduxXP6PFGDSu8Wsc5JBsTXWzla3Q+KHJW0k1?=
 =?us-ascii?Q?a7BhzLTNKc92AZyR04PTFd96ycQwoTuf+yPF4RNX5B7RHIuvoNC4E2IRS+0K?=
 =?us-ascii?Q?iVs2PDs0ea0ZWY8nODKNXc7o+svGDD0Y3pRijwLngnFgt5Sckds6Iq90XX7Q?=
 =?us-ascii?Q?1yjjLnDtt3T9fKTnqgRHJHg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 56fffe56-78f9-48f1-c363-08d9e81c2ad6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 20:23:12.6956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9+HnD2FhQdZm0q6odpjG5+RQWdPIHXyHM5xXUQORBFT7+kwO38DVR5RLCQRmqsTEyGmMMzps+oNe1fU2LTWvHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4803
X-Proofpoint-GUID: xMuAh4cp36X8GyPNtd8t5VHB2EQ6rArb
X-Proofpoint-ORIG-GUID: xMuAh4cp36X8GyPNtd8t5VHB2EQ6rArb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=989 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040112
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 04 Feb 2022 20:23:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2463

This change better aligns the name of the variable with it's
purpose. Since we removed the odler class, the associated
documentation is also removed.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 .../migration-guides/migration-3.5.rst        |  8 +++++++
 documentation/ref-manual/classes.rst          | 17 -------------
 documentation/ref-manual/variables.rst        | 24 +++++++++----------
 3 files changed, 20 insertions(+), 29 deletions(-)

diff --git a/documentation/migration-guides/migration-3.5.rst b/documentation/migration-guides/migration-3.5.rst
index 8c2a7d2c65..29ce6fe14b 100644
--- a/documentation/migration-guides/migration-3.5.rst
+++ b/documentation/migration-guides/migration-3.5.rst
@@ -54,3 +54,11 @@ Recipe changes
 - :ref:`allarch <ref-classes-allarch>` packagegroups can no longer depend on packages
   which use :term:`PKG` renaming such as :ref:`ref-classes-debian`.
 
+bbclass changes
+---------------
+
+- blacklist.bbclass is removed and the fucntionality moved to base.bbclass
+  with a more descriptive ``varflag`` named SKIP_RECIPE which will use the
+  SkipRecipe() function. The usage will remain the same:
+
+        SKIP_RECIPE[my-recipe] = "Reason for skipping recipe"
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
index d4f40b6929..23f55b1d67 100644
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
+      recipe. Specify the :term:`PN` value as a variable flag (``varflag``)
+      and provide a reason, which will be reported when attempting to 
+      build the recipe.
+
+      To prevent a recipe from being built, use the :term:`SKIP_RECIPE`
+      variable in your ``local.conf`` file or distribution configuration.
+      Here is an example which prevents ``myrecipe`` from being built::
+
+         SKIP_RECIPE[myrecipe] = "Not supported by our organization."
+
    :term:`SOC_FAMILY`
       Groups together machines based upon the same family of SOC (System On
       Chip). You typically set this variable in a common ``.inc`` file that
-- 
2.31.1


