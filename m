Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEEE8C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 18:40:59 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.74])
 by mx.groups.io with SMTP id smtpd.web11.40864.1701888053747136823
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 10:40:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=JR1Fe/QM;
 spf=pass (domain: axis.com, ip: 40.107.21.74, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRq3/iO4NrhNqP+Z6M1M+MNGXS+p3y106FcVnZCVXLkSoknpwvJes2a/fpIAkDM/Qx2t731MiZIJCM+omkMHpzwR0kjlo3hI9GUZJ8CJS44VH/VfontLub/espO17zlPLcS1UImD3doOy2y1fY5PfsV019P5eB8irniYZ6/9Ufmj1qRp/NY2riVqJrISln7NCpfkuRrxW0PIRravNxCCLHfiVEmNxFZ4XcAs3+8sp75VTWG54gAXTXD2Um/MbytuDUw4KA7fHM3ZC5nvyxqJj7jwMuTwSwXrP8BqsLaY964ETDUZzh/5d3iQ2BLE1ai+tFWbVrXB94NbNiboR0IStw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcfnXE1ONvopU3Xg0YQnFjj5nmG7x4Clayi7TTeV9pY=;
 b=KEZnEMDUuyncsB3dIfmDwKebzeQ/pcznR0Mr1/4EVlTpmsqmzpO0cvykw0bG5EOfHBWHGW2JPUJsQ9h6mhCfXSFtW+WDWn3u42W8nUYShvYTgEMMapYZsDSJWNZTO7zEf3xPYipM5F13GeO+wGznW6bt79iI1Xfkhqdc0/6nBqkhinz6dqva1GKuHt6UVphWVIrTM/fkcah0THK2pFLXCUngL61oehdL3kgsek9EhwX2jPv6O308cuKiJEFPCtGr0kvlEy+JO+VzVpsrS7oCpBCl+WsqZdGShJ8c13WVA5yKH7tq3XAJP1sPzI3ToSByLpGMbNBouJkTMNRt5GbepA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcfnXE1ONvopU3Xg0YQnFjj5nmG7x4Clayi7TTeV9pY=;
 b=JR1Fe/QM8reLr0rzEQwLksP7IQDx1+yXg5SSZ9CpJkLq1sxAhx9rzWtfQDNsmeOKesL5agaStxtKm2QksFZrP0glETNSo5yI0gB+uq/+PbgQsB6Vcwn07Z4O81qaZ5AewV+O7bhynX3M9oOXbGZtb5YkpOXu9+o0A1k7EMzPOTo=
Received: from AS9PR06CA0408.eurprd06.prod.outlook.com (2603:10a6:20b:461::31)
 by AS8PR02MB10241.eurprd02.prod.outlook.com (2603:10a6:20b:63d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 18:40:50 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:20b:461:cafe::11) by AS9PR06CA0408.outlook.office365.com
 (2603:10a6:20b:461::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25 via Frontend
 Transport; Wed, 6 Dec 2023 18:40:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 18:40:50 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 19:40:49 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 6 Dec 2023 19:40:49 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id C5D0FF66B
	for <docs@lists.yoctoproject.org>; Wed,  6 Dec 2023 19:40:49 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3B6IenKY2824614
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <docs@lists.yoctoproject.org>; Wed, 6 Dec 2023 19:40:49 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3B6Ien132824613
	for docs@lists.yoctoproject.org; Wed, 6 Dec 2023 19:40:49 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: Discourage the use of SRC_URI[md5sum]
Date: Wed, 6 Dec 2023 19:40:41 +0100
Message-ID: <20231206184041.2824572-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000003F:EE_|AS8PR02MB10241:EE_
X-MS-Office365-Filtering-Correlation-Id: efb6c493-6c50-436a-de58-08dbf68ade80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3ro/u5BhMF+sOscEWEYiEzN6ie6GCGA3GCvSxFkYRHYsEFuYuOs7bdfe8jMQX1pKrOTrnPUffuOy426m4Hig3Q8TiMXPBoq3QeiHQrgPsdustmSB+fJSgGUCV3XGu8y0fBk2NSHxDYirpe4B/WbWtSDxax7ZMNHsQ23rIpBVK0w6s2s6MBOIdyJqMFzNnKtD5O5Pg21U9qlb30CEdUGbHDJoQS4iN28o6UWmtn5Kf3xXyvKALtWx3Kn7I25sdtHy8h0dbZ8LwE59wZW7cgnhSrb3kVo6VVIRqb4cLTsOrSc4U97aLHUuhiEoApCHQu6fplnGmGG1e1X74gngevaZQ6HyRc6k9MK2sQHuR7GaSTAIZCsw0qPn6CE8hMhrhw2eLkbwyTwzLzr6+pJSAPfMabw+hoRf6FV2O2JeKgFLHmjbnHDlZpa2iKQM5dx/o691g02dbPqO2W1Y3HMIAqHymaMAT2P9DZFZsZ3sEqul5wyOQJuzgc0xlW7KGcU9CZqH3Hrfb4Tlibbn4q9wgv0+NWRwRMghDdjkhOlpoRoXBk52MyRyDxy5rSoAAODoRiYT3m8ActqQjh3YzUVNzHgtlDKssZmhXk/BykC9+8drf7/ZHtkJPe559hGzuoSJBHx+RFXqB1AMNuWemkzK1aTdpLqiuuAwcpU7C2FCnJO76H6Z3RpAKjd05uxjeATKsH5/kTKWXOEx8sUXZTLUFp3CJI+WxZe9J9gHbE32B8DQxgoPIjJUV+5Kb5r0GMGjfnncnXGgGfF+MOOmXhWhlmldfg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799012)(46966006)(40470700004)(36840700001)(83380400001)(426003)(40460700003)(6666004)(66899024)(1076003)(2616005)(26005)(336012)(316002)(70206006)(42186006)(70586007)(6916009)(40480700001)(5660300002)(2906002)(8676002)(8936002)(36756003)(41300700001)(478600001)(81166007)(356005)(82740400003)(36860700001)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 18:40:50.1651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efb6c493-6c50-436a-de58-08dbf68ade80
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB10241
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Dec 2023 18:40:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4663

SRC_URI[md5sum] has been deprecated for a long time. Discourage its use
by removing it from examples and note that it should be replaced by
SRC_URI[sha256sum] when updating recipes.

Also mention that bitbake supports other checksums, though they are not
commonly used.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 documentation/dev-manual/debugging.rst  |  2 +-
 documentation/dev-manual/new-recipe.rst | 27 +++++++++++++++----------
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-man=
ual/debugging.rst
index fea2cb30a1..bd1e716b0b 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -327,7 +327,7 @@ BitBake has determined by doing the following:
    the task. This list also includes indirect dependencies from
    variables depending on other variables, recursively::
=20
-      Task dependencies: ['PV', 'SRCREV', 'SRC_URI', 'SRC_URI[md5sum]', 'S=
RC_URI[sha256sum]', 'base_do_fetch']
+      Task dependencies: ['PV', 'SRCREV', 'SRC_URI', 'SRC_URI[sha256sum]',=
 'base_do_fetch']
=20
    .. note::
=20
diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-ma=
nual/new-recipe.rst
index e741cef0e8..2c1033eb35 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -303,28 +303,33 @@ If your :term:`SRC_URI` statement includes URLs point=
ing to individual files
 fetched from a remote server other than a version control system,
 BitBake attempts to verify the files against checksums defined in your
 recipe to ensure they have not been tampered with or otherwise modified
-since the recipe was written. Two checksums are used:
-``SRC_URI[md5sum]`` and ``SRC_URI[sha256sum]``.
+since the recipe was written. Multiple checksums are supported:
+``SRC_URI[md5sum]``, ``SRC_URI[sha1sum]``, ``SRC_URI[sha256sum]``.
+``SRC_URI[sha384sum]`` and ``SRC_URI[sha512sum]``, but only
+``SRC_URI[sha256sum]`` is commonly used.
+
+.. note::
+
+   ``SRC_URI[md5sum]`` used to also be commonly used, but it is deprecated
+   and should be replaced by ``SRC_URI[sha256sum]`` when updating existing
+   recipes.
=20
 If your :term:`SRC_URI` variable points to more than a single URL (excludi=
ng
-SCM URLs), you need to provide the ``md5`` and ``sha256`` checksums for
-each URL. For these cases, you provide a name for each URL as part of
-the :term:`SRC_URI` and then reference that name in the subsequent checksu=
m
-statements. Here is an example combining lines from the files
-``git.inc`` and ``git_2.24.1.bb``::
+SCM URLs), you need to provide the ``sha256`` checksum for each URL. For t=
hese
+cases, you provide a name for each URL as part of the :term:`SRC_URI` and =
then
+reference that name in the subsequent checksum statements. Here is an exam=
ple
+combining lines from the files ``git.inc`` and ``git_2.24.1.bb``::
=20
    SRC_URI =3D "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=
=3Dtarball \
               ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.=
gz;name=3Dmanpages"
=20
-   SRC_URI[tarball.md5sum] =3D "166bde96adbbc11c8843d4f8f4f9811b"
    SRC_URI[tarball.sha256sum] =3D "ad5334956301c86841eb1e5b1bb20884a6bad89=
a10a6762c958220c7cf64da02"
-   SRC_URI[manpages.md5sum] =3D "31c2272a8979022497ba3d4202df145d"
    SRC_URI[manpages.sha256sum] =3D "9a7ae3a093bea39770eb96ca3e5b40bff7af0b=
9f6123f089d7821d0e5b8e1230"
=20
-Proper values for ``md5`` and ``sha256`` checksums might be available
+The proper value for the ``sha256`` checksum might be available together
 with other signatures on the download page for the upstream source (e.g.
 ``md5``, ``sha1``, ``sha256``, ``GPG``, and so forth). Because the
-OpenEmbedded build system only deals with ``sha256sum`` and ``md5sum``,
+OpenEmbedded build system typically only deals with ``sha256sum``,
 you should verify all the signatures you find by hand.
=20
 If no :term:`SRC_URI` checksums are specified when you attempt to build th=
e

