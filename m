Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 807B3C77B7F
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 08:59:07 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.64])
 by mx.groups.io with SMTP id smtpd.web10.21351.1684486737450151685
 for <docs@lists.yoctoproject.org>;
 Fri, 19 May 2023 01:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=OW9x33FD;
 spf=pass (domain: siemens.com, ip: 40.107.20.64, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEJv7D49A/ioGCcHAHqvdC88RsPsjTO1pjv1xCDgVd05rjlj0+BJGY2WA37Y6kGxS+9Ug4VRfBBxe0rkOoT/naeCQX+TtRcYWfy1BjEklKIl9D2M6CBVDgFnzPUUqmNORjOatrklmqTCT0gKgFrqkIVZSlTY2hAzDdvr7/0ji7oItR+wObRbMEW4qQV0iYq+9TqN6c7lSVA0oJGbztAO4GsSTb8u0tFa2yVh9kp5QrAZdUQD6wJw/GksROMvd5rGMAgyd30v96YIsu2qkykEcOONtBHQH2vdSbyDgiMjYWv+/QYWodkRiS7xFgSJawdZDUFRQqzr4pTEqMi4eWYYGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GMYjFx1/Kuv0RJetP/oyRmePxusar2DRWKCLBmuhlM=;
 b=TWC/eKq5LPvJ6fYXQgsDgwP+HpUP4giQjGfh6XHv8d21rk/0NYZDJuTUp7BLF41gf0i6KAbKWM+J2c9YL4zUCrFLmmpLqabztyiK4aRlpe4VDBUxlaCxELppbu3QzDEBzW/F1kVYJrZ+NhMPFet0wX3YiSjflBZIwVQ9gIfZ8PNVYEcydSdtRLwhE6UKs8a8P+VSW0gobUCvofrSE+Jzu5jzvO+Z6rehybXW8s/6hPVEVQTCt8jq7mI3JrBK/RNa+H5f8DdG/j5ncQBhvQINaeY+HwTn0FDZvrda9Lmi/I8T15dz4hB/ks2hbTAyxW1bQPDnWfgU1pcne8OHMFR2ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GMYjFx1/Kuv0RJetP/oyRmePxusar2DRWKCLBmuhlM=;
 b=OW9x33FD4WUMGsf+jjL0/DAUmkGj36F5ehrxecvl9s4Nx0ioz09Amgmwho11VOsVMvtU6c9x6a3r90Xr+N1HuZRCduUDlVTiby9IqDBbeK+IWngO1G5aWsDNUzTVvea+mm5kfUDw9m0Kxq18y/3JdnvhJNijwEi6VZ31mj7tH6HAuOopzyrbBDdxKzH/EEb+zK/XIxAi2WdAR1QH24D+V3mI8yxcStPoq3usmU89QDu+mREG7YY+EZBXz0iF+pKqxppsE4naX9uDcdpt0NT9Bnbcr/kTx9rOL14xeCy3OsqBGTWe4r9L1gLc/Zri8UiCHn9XFXYNMhaBiPHVrCHIaQ==
Received: from DU2P251CA0014.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::15)
 by AS4PR10MB7965.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4fc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 08:58:54 +0000
Received: from DB5EUR01FT032.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::f5) by DU2P251CA0014.outlook.office365.com
 (2603:10a6:10:230::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21 via Frontend
 Transport; Fri, 19 May 2023 08:58:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 DB5EUR01FT032.mail.protection.outlook.com (10.152.4.250) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.21 via Frontend Transport; Fri, 19 May 2023 08:58:54 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 19 May 2023 10:58:53 +0200
Received: from md3hr6tc.ad001.siemens.net (139.22.107.140) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 19 May 2023 10:58:53 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <docs@lists.yoctoproject.org>
CC: <mikko.rapeli@linaro.org>, <michael.opdenacker@bootlin.com>, Andrej Valek
	<andrej.valek@siemens.com>, Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] ref-manual: document CVE_STATUS and CVE_STATUS_REASONING
Date: Fri, 19 May 2023 10:58:23 +0200
Message-ID: <20230519085823.90027-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230505111814.491483-1-andrej.valek@siemens.com>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.22.107.140]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR01FT032:EE_|AS4PR10MB7965:EE_
X-MS-Office365-Filtering-Correlation-Id: 3be002e9-226b-43d9-609f-08db58474613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e2v780yMW6W8e1IZRwj3Lc0EaTvZQ7+yEXgYPiVij/cHC6KJ0+ripkoFj2uyaMiC8dYJMFgj+nspo62Vc5sIWEOe2etmjmlbhnFKzVDv1M8jpLZUB+VqEYCT8hkphzCnNTnTjN7XgKnImkNEY5/XuEOS2mF7orO53p7GPlG3c1+xYr6Vz1ytH7S29iHO9xbFlHLH4q8pcvGPBPCxRoJdwIOQiU0sOS3QdtguuXXRIeVh74Ydx2yyL5X7mtzfxuxIiF50HXerOwWzpbs8zXcS9tU1qLtG017au8QcJMnHlow6S/o7XVHrIQJG0Rl3OyqfS5r9/n+tPTqtgGuJly78uqvL23ddhSn3UpFOlafVGVPJfT2mzgRrbeYVEC7md+jwUoum/kpZxmWnu/ST2478s4ZatyGgwKn1tvv/0HUAIg8x/XhDT5hGwm1xCnOd5qwDQl9bwKgE4uJTM4rb6eBqas2C+JDhQojHOVZuna3kGoi0aEYczabxQcQ2mQV2jsMNk9UcDhzJujyyL3EQwywFkNjivd7cKrzK1YxZE2SXj5VzGch4wdLSPAmV6SOjAu/nlUgfKHUWZZ8kh9l+y7MNgGk1LQSlapCojC2A0Jlwq4ITVgUircgojege6Ve8g5h18HsgKxzdn68CAEqsmq3H7B1gdIFmp3UCkJUhFtX9wIUD+pyqJGnGRAt7Fi2Q5sQxU4fcfNBRn31mF6zNDjO8fAti5KXlkcZSmpVmQrHG+UmBZbrhnbPOXVQhPoCfEXmoCFi9gQ3kPtGXvPozsv76fQ==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(26005)(1076003)(107886003)(36860700001)(36756003)(336012)(47076005)(40480700001)(956004)(2616005)(86362001)(83380400001)(82310400005)(356005)(82740400003)(16526019)(186003)(82960400001)(81166007)(54906003)(44832011)(478600001)(316002)(2906002)(8676002)(4326008)(8936002)(6916009)(41300700001)(5660300002)(70206006)(70586007)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 08:58:54.3865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be002e9-226b-43d9-609f-08db58474613
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT032.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB7965
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 May 2023 08:59:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3950

Deprecate CVE_CHECK_IGNORE with CVE_STATUS

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 documentation/dev-manual/new-recipe.rst      |  4 +--
 documentation/dev-manual/vulnerabilities.rst | 11 ++++---
 documentation/ref-manual/classes.rst         |  9 ++++--
 documentation/ref-manual/variables.rst       | 33 +++++++++++++++++---
 4 files changed, 42 insertions(+), 15 deletions(-)

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-ma=
nual/new-recipe.rst
index 4e74246a4..008f4b1ce 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -1253,8 +1253,8 @@ In the following example, ``lz4`` is a makefile-based=
 package::
=20
    S =3D "${WORKDIR}/git"
=20
-   # Fixed in r118, which is larger than the current version.
-   CVE_CHECK_IGNORE +=3D "CVE-2014-4715"
+   CVE_STATUS[CVE-2014-4715] =3D "Patched"
+   CVE_STATUS_REASONING[CVE-2014-4715] =3D "Fixed in r118, which is larger=
 than the current version"
=20
    EXTRA_OEMAKE =3D "PREFIX=3D${prefix} CC=3D'${CC}' CFLAGS=3D'${CFLAGS}' =
DESTDIR=3D${D} LIBDIR=3D${libdir} INCLUDEDIR=3D${includedir} BUILD_STATIC=
=3Dno"
=20
diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/d=
ev-manual/vulnerabilities.rst
index 0ee3ec52c..071d80cbd 100644
--- a/documentation/dev-manual/vulnerabilities.rst
+++ b/documentation/dev-manual/vulnerabilities.rst
@@ -158,7 +158,8 @@ CVE checker will then capture this information and chan=
ge the CVE status to ``Pa
 in the generated reports.
=20
 If analysis shows that the CVE issue does not impact the recipe due to con=
figuration, platform,
-version or other reasons, the CVE can be marked as ``Ignored`` using the :=
term:`CVE_CHECK_IGNORE` variable.
+version or other reasons, the CVE can be marked as ``Ignored`` or ``Not ap=
plicable`` using
+the :term:`CVE_STATUS` variable flag.
 As mentioned previously, if data in the CVE database is wrong, it is recom=
mend to fix those
 issues in the CVE database directly.
=20
@@ -182,11 +183,11 @@ products defined in :term:`CVE_PRODUCT`. Then, for ea=
ch found CVE:
 -  If the package name (:term:`PN`) is part of
    :term:`CVE_CHECK_SKIP_RECIPE`, it is considered as ``Patched``.
=20
--  If the CVE ID is part of :term:`CVE_CHECK_IGNORE`, it is
-   set as ``Ignored``.
+-  If the CVE ID has status ``CVE_STATUS[<CVE ID>] =3D "Ignored"``, it is
+   set as ``Ignored`` as same as for ``CVE_STATUS[<CVE ID>] =3D "Not appli=
cable"``.
=20
--  If the CVE ID is part of the patched CVE for the recipe, it is
-   already considered as ``Patched``.
+-  If the CVE ID is part of the patched CVE for the recipe or has status
+   ``CVE_STATUS[<CVE ID>] =3D "Patched"``, it is considered as ``Patched``=
.
=20
 -  Otherwise, the code checks whether the recipe version (:term:`PV`)
    is within the range of versions impacted by the CVE. If so, the CVE
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manua=
l/classes.rst
index ab1628401..04c992a6b 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -517,10 +517,13 @@ The ``Patched`` state of a CVE issue is detected from=
 patch files with the forma
 ``CVE-ID.patch``, e.g. ``CVE-2019-20633.patch``, in the :term:`SRC_URI` an=
d using
 CVE metadata of format ``CVE: CVE-ID`` in the commit message of the patch =
file.
=20
-If the recipe lists the ``CVE-ID`` in :term:`CVE_CHECK_IGNORE` variable, t=
hen the CVE state is reported
-as ``Ignored``. Multiple CVEs can be listed separated by spaces. Example::
+If the recipe adds the ``CVE-ID`` as flag of :term:`CVE_STATUS` variable w=
ith status
+``Ignored`` or ``Not applicable``, then the CVE state is reported as ``Ign=
ored``::
=20
-   CVE_CHECK_IGNORE +=3D "CVE-2020-29509 CVE-2020-29511"
+   CVE_STATUS[CVE-2020-15523] =3D "Ignored"
+
+Possible CVE's statuses are ``Ignored``, ``Not applicable`` and ``Patched`=
`. Check :term:`CVE_STATUS`
+for more details.
=20
 If CVE check reports that a recipe contains false positives or false negat=
ives, these may be
 fixed in recipes by adjusting the CVE product name using :term:`CVE_PRODUC=
T` and :term:`CVE_VERSION` variables.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 6ee65e178..9575c5371 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1653,11 +1653,7 @@ system and gives an overview of their function and c=
ontents.
          and kernel module recipes).
=20
    :term:`CVE_CHECK_IGNORE`
-      The list of CVE IDs which are ignored. Here is
-      an example from the :oe_layerindex:`Python3 recipe</layerindex/recip=
e/23823>`::
-
-         # This is windows only issue.
-         CVE_CHECK_IGNORE +=3D "CVE-2020-15523"
+      Is deprecated and should be replaced by :term:`CVE_STATUS`
=20
    :term:`CVE_CHECK_SHOW_WARNINGS`
       Specifies whether or not the :ref:`ref-classes-cve-check`
@@ -1698,6 +1694,33 @@ system and gives an overview of their function and c=
ontents.
=20
          CVE_PRODUCT =3D "vendor:package"
=20
+   :term:`CVE_STATUS`
+      The CVE ID which is patched or should be ignored. Here is
+      an example from the :oe_layerindex:`Python3 recipe</layerindex/recip=
e/23823>`::
+
+         CVE_STATUS[CVE-2020-15523] =3D "Ignored"
+
+      Possible CVE's statuses ``Ignored``, ``Not applicable`` or ``Patched=
``, while the ``reasoning``
+      is optional.
+
+   :term:`CVE_STATUS_GROUPS`
+      If there is a many CVEs with the same status and reason can by simpl=
ified by using this
+      variable instead of many similar lines with :term:`CVE_STATUS` and :=
term:`CVE_STATUS_REASONING`::
+
+         CVE_STATUS_GROUPS =3D "CVE_STATUS_WIN CVE_STATUS_PATCHED"
+         CVE_STATUS_WIN =3D "CVE-1234-0001 CVE-1234-0002"
+         CVE_STATUS_WIN[status] =3D "Not applicable"
+         CVE_STATUS_WIN[reason] =3D "Issue only applies on Windows"
+
+         CVE_STATUS_PATCHED =3D "CVE-1234-0003 CVE-1234-0004"
+         CVE_STATUS_PATCHED[status] =3D "Patched"
+         CVE_STATUS_PATCHED[reason] =3D "Fixed externally"
+
+   :term:`CVE_STATUS_REASONING`
+      Optional explanation for :term:`CVE_STATUS`::
+
+         CVE_STATUS_REASONING[CVE-2020-15523] =3D "Issue only applies on W=
indows"
+
    :term:`CVE_VERSION`
       In a recipe, defines the version used to match the recipe version
       against the version in the `NIST CVE database <https://nvd.nist.gov/=
>`__
--=20
2.40.1


