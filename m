Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9314BEB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 07:32:14 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.81])
 by mx.groups.io with SMTP id smtpd.web11.7767.1689838328519034611
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Jul 2023 00:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=sQ/lMlbS;
 spf=pass (domain: siemens.com, ip: 40.107.247.81, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POZYH2e8DAGWT6KXAlLM/vQCiaUR/V+8GN8kiPhV49Rn8z9afQzSz6cYX8Cf7bt2KGUeBaUXAUz1QpuYCxl7VXQG4FXgFjyc3xv9xAW3vUBCcQ92zat722yyssdyPwsYvV1UEX3Yc0dOPsO5ZlipIkXp3SAav9accIkhhZE6EP7wpZMhBQODvRCFBEn8DtE/szL7OrrS1o8nlaCl4xvB/cSJyZXhLKvUT6vhcNHfwa1HBHBQ4m6hJso5F2tuP+oQyXchPszB5JrvyptILK2QaMr8GLYhTr7TONF5sLU9vUg9YG6eaGRvjof3w/aBqEMlatQ+Aq6dUruWyX2UbYe85Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DKup8ddEfCeeJitaStFBbAt8wHWFnqI8mUd2bY3maI=;
 b=YNr5xgsUEpZZEEjrZvLFmPKsJIzQ56Q7rViocdbWPG+K61wpc3RenO655qRNpOGSP/E9faaB0+RMysMO1EtxJjNw3OnF5sfRfjTLSicd3gb9fBuG6GHH0DxWQAmNI6Pi8AywmuaISUUpfmWJWZiK4SKHwvJ6I9ThKX3SNj94ggx03/v5QBWJxVymi53PlEuGV38N8Fq8VcMpxk+o9EY/lIcxfWuh+AaYWT0lC8pdhB62iBoocb6S8t062LgejhlBpLrSLIrvYF7rnBsfmRQwM4ABER36yWamthP2/vdpDtSdaZW3zt6IaJuBeKPzkxOuf3vqhXfOf8p58IWx3QA3Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DKup8ddEfCeeJitaStFBbAt8wHWFnqI8mUd2bY3maI=;
 b=sQ/lMlbS4XCfcpM/2kHiaXZtgDCvlwIXQoRVQJfXHXlK0r8aX78FtqcwEtJe+2jtNxi0z5/Jkf894UVcmc7lOPA1RMoC050Q0yKfZ466Tmp5AgugD7vsC53zCSkj/57zbYMA+da/3RqdyuL1Ckt1Yy2fDt32TpWXYs7gNPcxOWY9+yFJ5Sk6oXG/1WCRQqY8exZFbTZkKW6QuLwpePov9yiFMGBdFj0DxL75tx2rV2EpSo6wo4RxknP2IK1KlDL2cZBgmc5LLZBUoqzI2mtCAGTyJq/IqsCPgTGl1tV3lQg5YQt8L8RAl2lMtqqaklWmOddaIZhRFWUQsFQDZazuaQ==
Received: from FR3P281CA0109.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a3::9) by
 DB3PR10MB6860.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:43d::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.24; Thu, 20 Jul 2023 07:32:05 +0000
Received: from VE1EUR01FT074.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:a3:cafe::70) by FR3P281CA0109.outlook.office365.com
 (2603:10a6:d10:a3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.18 via Frontend
 Transport; Thu, 20 Jul 2023 07:32:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 VE1EUR01FT074.mail.protection.outlook.com (10.152.2.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.25 via Frontend Transport; Thu, 20 Jul 2023 07:32:04 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12; Thu, 20 Jul 2023 09:32:00 +0200
Received: from md3hr6tc.ad001.siemens.net (139.22.41.153) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 20 Jul 2023 09:32:00 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <docs@lists.yoctoproject.org>
CC: Andrej Valek <andrej.valek@siemens.com>, <mikko.rapeli@linaro.org>,
	<michael.opdenacker@bootlin.com>, Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v2] ref-manual: document CVE_STATUS and CVE_CHECK_STATUSMAP
Date: Thu, 20 Jul 2023 09:31:30 +0200
Message-ID: <20230720073130.41355-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230519085823.90027-1-andrej.valek@siemens.com>
References: <20230519085823.90027-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.22.41.153]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR01FT074:EE_|DB3PR10MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: fa27c277-d74b-42a9-f1fb-08db88f36a88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N2C5+rCTXVn4y2jQxPMt/kFx/uacuKqJ9nLZrYgMzUs+K/1+hdprPP9b8qU0WZ92vAEyAvWgIu2jf2w//Lcoxn60RFUmiIc6jXpafnedKw8Oj2ahISAgpPPIE5FnylHRfbc6ckrdCnwQH/l9EM6MN6V9Nr+fgi0q9He7p70gDg26YsXSYiSW2WizazbadgX97x5zBvpskGmZ4SkdydJBepjIe58EnkYKO0DnHCWGq32hFhaVPFx4vaFGa55laGOCGBXa0gqdChLYuhc9WVbHXjrN8Igqv1TP1VT3IrS9Q3tsvETaZUoMgg0iqPHF0RjjTqkD7TGn29iE3WVjWK3aZNTqo8S0GcLiCFb2fJ82makHH1SOVY7hm0lTeVcKA0z9VHgUQDFusPQZE3viFkhnlFLcX/khuCjPaAB6sBJ34iz419Miq8MNcdRUjq82ddEUenl9tKPun6yYf0l747wNwgu6+JxcNIEt8ZX3ekdu8EAeT+twfcsrKFWrWZc0rlJzd7I+eox++pa1TqbtpzaOVBxBmkosKXPYPC8wQeiRtedykXGfUV5CqBf/5a1gS9iEZos9d+Nug9mNkYEy258OwEIxolvOlPtQtzfaiL5hW48lB+hSpBiMEqXOQKwPlW8OxR8zF3a5Jtdz15tSuGHjX1jz7uc6FDQdE5KgL1UBIOkIUyfrSGCXBk3wwU9Tz5h5Yl7LQrU+/iZtV16wAoZOZB3bspE2J2bwM41ENOMSiAC6ZtxTaYEX87jizG0XFznPwN2daDkNwPSrkiaMAHTQhA==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(82310400008)(451199021)(40470700004)(46966006)(36840700001)(70206006)(40460700003)(44832011)(36860700001)(6666004)(81166007)(107886003)(2906002)(356005)(6916009)(8676002)(316002)(8936002)(4326008)(36756003)(47076005)(82740400003)(5660300002)(82960400001)(70586007)(16526019)(2616005)(956004)(186003)(336012)(1076003)(40480700001)(26005)(41300700001)(86362001)(478600001)(83380400001)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 07:32:04.8222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa27c277-d74b-42a9-f1fb-08db88f36a88
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT074.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR10MB6860
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Jul 2023 07:32:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4066

Deprecate CVE_CHECK_IGNORE with CVE_STATUS

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 documentation/dev-manual/new-recipe.rst      |  3 +-
 documentation/dev-manual/vulnerabilities.rst | 13 +++++---
 documentation/ref-manual/classes.rst         |  6 ++--
 documentation/ref-manual/variables.rst       | 33 +++++++++++++++++---
 4 files changed, 41 insertions(+), 14 deletions(-)

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-ma=
nual/new-recipe.rst
index 1be04a765..af390773a 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -1253,8 +1253,7 @@ In the following example, ``lz4`` is a makefile-based=
 package::
=20
    S =3D "${WORKDIR}/git"
=20
-   # Fixed in r118, which is larger than the current version.
-   CVE_CHECK_IGNORE +=3D "CVE-2014-4715"
+   CVE_STATUS[CVE-2014-4715] =3D "fixed-version: Fixed in r118, which is l=
arger than the current version"
=20
    EXTRA_OEMAKE =3D "PREFIX=3D${prefix} CC=3D'${CC}' CFLAGS=3D'${CFLAGS}' =
DESTDIR=3D${D} LIBDIR=3D${libdir} INCLUDEDIR=3D${includedir} BUILD_STATIC=
=3Dno"
=20
diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/d=
ev-manual/vulnerabilities.rst
index 0ee3ec52c..6d87d02ec 100644
--- a/documentation/dev-manual/vulnerabilities.rst
+++ b/documentation/dev-manual/vulnerabilities.rst
@@ -130,7 +130,8 @@ Fixing vulnerabilities in recipes
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 If a CVE security issue impacts a software component, it can be fixed by u=
pdating to a newer
-version of the software component or by applying a patch. For Poky and OE-=
Core master branches, updating
+version of the software component, by applying a patch or by marking it as=
 patched via
+:term:`CVE_STATUS` variable flag. For Poky and OE-Core master branches, up=
dating
 to a newer software component release with fixes is the best option, but p=
atches can be applied
 if releases are not yet available.
=20
@@ -158,7 +159,8 @@ CVE checker will then capture this information and chan=
ge the CVE status to ``Pa
 in the generated reports.
=20
 If analysis shows that the CVE issue does not impact the recipe due to con=
figuration, platform,
-version or other reasons, the CVE can be marked as ``Ignored`` using the :=
term:`CVE_CHECK_IGNORE` variable.
+version or other reasons, the CVE can be marked as ``Ignored`` by using
+the :term:`CVE_STATUS` variable flag with appropriate reason which is mapp=
ed to ``Ignored``.
 As mentioned previously, if data in the CVE database is wrong, it is recom=
mend to fix those
 issues in the CVE database directly.
=20
@@ -175,6 +177,8 @@ is found in the name of the file, the corresponding CVE=
 is considered as patched
 Don't forget that if multiple CVE IDs are found in the filename, only the =
last
 one is considered. Then, the code looks for ``CVE: CVE-ID`` lines in the p=
atch
 file. The found CVE IDs are also considered as patched.
+Additionally ``CVE_STATUS`` variable flags are parsed for reasons mapped t=
o ``Patched``
+and these are also considered as patched.
=20
 Then, the code looks up all the CVE IDs in the NIST database for all the
 products defined in :term:`CVE_PRODUCT`. Then, for each found CVE:
@@ -182,8 +186,9 @@ products defined in :term:`CVE_PRODUCT`. Then, for each=
 found CVE:
 -  If the package name (:term:`PN`) is part of
    :term:`CVE_CHECK_SKIP_RECIPE`, it is considered as ``Patched``.
=20
--  If the CVE ID is part of :term:`CVE_CHECK_IGNORE`, it is
-   set as ``Ignored``.
+-  If the CVE ID has status ``CVE_STATUS[<CVE ID>] =3D "ignored"`` or if i=
t's set to
+   any reason which is mapped to status ``Ignored`` via ``CVE_CHECK_STATUS=
MAP``,
+   it is  set as ``Ignored``.
=20
 -  If the CVE ID is part of the patched CVE for the recipe, it is
    already considered as ``Patched``.
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manua=
l/classes.rst
index e555a80b5..b8d07f102 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -517,10 +517,10 @@ The ``Patched`` state of a CVE issue is detected from=
 patch files with the forma
 ``CVE-ID.patch``, e.g. ``CVE-2019-20633.patch``, in the :term:`SRC_URI` an=
d using
 CVE metadata of format ``CVE: CVE-ID`` in the commit message of the patch =
file.
=20
-If the recipe lists the ``CVE-ID`` in :term:`CVE_CHECK_IGNORE` variable, t=
hen the CVE state is reported
-as ``Ignored``. Multiple CVEs can be listed separated by spaces. Example::
+If the recipe adds ``CVE-ID`` as flag of the :term:`CVE_STATUS` variable w=
ith status
+mapped to ``Ignored``, then the CVE state is reported as ``Ignored``::
=20
-   CVE_CHECK_IGNORE +=3D "CVE-2020-29509 CVE-2020-29511"
+   CVE_STATUS[CVE-2020-15523] =3D "not-applicable-platform: Issue only app=
lies on Windows"
=20
 If CVE check reports that a recipe contains false positives or false negat=
ives, these may be
 fixed in recipes by adjusting the CVE product name using :term:`CVE_PRODUC=
T` and :term:`CVE_VERSION` variables.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index ac5b97a52..7e93f731a 100644
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
+      This variable is deprecated and should be replaced by :term:`CVE_STA=
TUS`.
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
+         CVE_STATUS[CVE-2020-15523] =3D "not-applicable-platform: Issue on=
ly applies on Windows"
+
+      It has format "reason: description" and description is optional.
+      Reason is mapped to final CVE state by mapping via :term:`CVE_CHECK_=
STATUSMAP`
+
+   :term:`CVE_STATUS_GROUPS`
+      If there are many CVEs with the same status and reason, they can by =
simplified by using this
+      variable instead of many similar lines with :term:`CVE_STATUS`::
+
+         CVE_STATUS_GROUPS =3D "CVE_STATUS_WIN CVE_STATUS_PATCHED"
+
+         CVE_STATUS_WIN =3D "CVE-1234-0001 CVE-1234-0002"
+         CVE_STATUS_WIN[status] =3D "not-applicable-platform: Issue only a=
pplies on Windows"
+         CVE_STATUS_PATCHED =3D "CVE-1234-0003 CVE-1234-0004"
+         CVE_STATUS_PATCHED[status] =3D "fixed-version: Fixed externally"
+
+   :term:`CVE_CHECK_STATUSMAP`
+      Mapping variable for all possible reasons of :term:`CVE_STATUS` to
+      set of ``Patched``, ``Unpatched`` and ``Ignored``.
+      See :ref:`ref-classes-cve-check` or ``meta/conf/cve-check-map.conf``=
 for more details::
+
+         CVE_CHECK_STATUSMAP[cpe-incorrect] =3D "Ignored"
+
    :term:`CVE_VERSION`
       In a recipe, defines the version used to match the recipe version
       against the version in the `NIST CVE database <https://nvd.nist.gov/=
>`__
--=20
2.41.0


