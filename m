Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A30CCF9E3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 08:46:12 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44142.1762764368507448672
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Nov 2025 00:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=Kus5m9/7;
 spf=pass (domain: ericsson.com, ip: 52.101.66.3, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyqppMwF51p9NueyP3meI5MGEZPeBFR5PFW7zl8G8l9mFXgKUmb8F3bDyqiLlsq5LtCqPmPsHfIv8O1hlvt5R6wsB6fMTmbtT8tcTTfIXZxyZvNK312vh1Yt6tARBXYIfs+H219zmkXGgrcyrC1K1kNyk34MHFjsUqi78X5heGq4B2wiGLjkueI5kL8VLT38xnYP4SmfbqViKaYGbI9Iw/UZFVb/hFvQu32OkS97SOFccPfPSsjXzGVukdDTMda6gtlu3sZ3UF4z+mi+ns3sKqf9ePf6QEqXiZ9hJJ3lpO34V79pphOYEdRCt2Zp3bTk2aSNxVbS/+rVPeCOrR08/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxctupZZbADsRfBS4RHifPoliGRakgG2x23pSvF3G3k=;
 b=od4rxsCYrqmEbOgN5uuq3ttQ/o27fKUGnXfBavBekvJ4ILIYRdDpZPm/VvoC57XqUYpWrlIP7vy+sBbZHerxmirboNqW0tzEmuJ7KD1fKPCRmzRLeWTdTq0fAuzBzbfRG4m2uC5R6z8OPBLMyEx6cnLmArmg95hplSc1lCW0lOizkiJNxAQjMzdFn7CFWqoQ6vgGk5u2lKc/jmISuBl7YEI8yl0IcdW5XuILlIR+AaYFgKDEtPqZxuc4/eNl3S+l3QQkaS+fPTpPtq/z+wGb91XDnXkLeJicKIlSAT8X42zFO6jShEnZ/xuBEmxLe/lDKG25QaO+vvN13fDA9OuHkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxctupZZbADsRfBS4RHifPoliGRakgG2x23pSvF3G3k=;
 b=Kus5m9/7WtAt/HZ6OTbgPou8kM/4kwWh5u1EifgW3KdPbw3yC77f2Z4EDax7Nub0ixYLaSz92SVV8BXjNhexdFzdCL8BzBSZxzcak7dYSvKvX3mJ8m6swOLKK2zxBiWeps1VyqEpWJ5FyRQM3qXO7umbvNge9l+gCjDTDCIzWHWT9LPvBFbB0MhQdD0YYq8g867mpFHl8VDGFA4Sgvys6/WYJerADSKDGA1gs7QVbGgx3MZHeWUliwfEAT3RJazam9pr5Kn4jSUEwQDD5HP4m79/X9dAfdTHBELE3KmzbZc4/4yskLBLIt93pCwm/RTjFQx/5CzhlR+7mXJ4Ukqbww==
Received: from AS4PR10CA0001.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::17)
 by DB9PR07MB10123.eurprd07.prod.outlook.com (2603:10a6:10:4cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 08:46:04 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::49) by AS4PR10CA0001.outlook.office365.com
 (2603:10a6:20b:5dc::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Mon,
 10 Nov 2025 08:45:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Mon, 10 Nov 2025 08:46:04 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 10 Nov 2025 09:46:03 +0100
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 9AAA24021580;
	Mon, 10 Nov 2025 09:46:01 +0100 (CET)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 7C67A700CF09; Mon, 10 Nov 2025 09:46:01 +0100 (CET)
From: <daniel.turull@ericsson.com>
To: <docs@lists.yoctoproject.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Antonin Godard
	<antonin.godard@bootlin.com>
Subject: [PATCH v2] vulnerabilities: add section for kernel CVEs vulnerabilities
Date: Mon, 10 Nov 2025 09:45:48 +0100
Message-ID: <20251110084548.3333453-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000041:EE_|DB9PR07MB10123:EE_
X-MS-Office365-Filtering-Correlation-Id: b3dbf263-6b22-49bd-4d85-08de20359569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/VZCLAvH8hPpnmFkFjR3DY6Pa6MbB1m0QfgvH/xr0PJuztQfcIhglYl8ribo?=
 =?us-ascii?Q?VUwmg330MEpEVR+kstaeQHjizpSiQ7gaOWepzYfxCzJPCA7e+OPB4sMkP9SH?=
 =?us-ascii?Q?bBMwl7VWPw8sFDJt1YShNo54lHHbqDDpdmCEztMXL0YR30o8oK69GkPI8cmg?=
 =?us-ascii?Q?jX83Mf7MIP09P1pPnGRDprzbD6S7AYLVYnFochiMmRR8x2JGYO+VT+UGy2QO?=
 =?us-ascii?Q?hGIDtBU+vBe2CWfxqdPASIFrITf5s595rJJ2RAW/2kkPCZCsLt6vZ6cLhJnV?=
 =?us-ascii?Q?w0A+ffZchduGO9IUdLZZhZSm35yVt2XlqS/Sj3RunTtGtqCP54AIDhyD8gQO?=
 =?us-ascii?Q?FT4kbSBVipPrgi54aLXwGUX1AzoIuWZSb0KOv8Hen1s7n9dVXDMIpGE4aRzi?=
 =?us-ascii?Q?PAiCqXvq6LbMspUuoYYh1ND06jO4tgyHlgiAzdwA+cKGzgYru5z64VO2K9mu?=
 =?us-ascii?Q?QILeRr5gs/qY1cdlaOq1ODaZwprH71HEVcaSymBJ6fQ2MmqOIYhKBrgmTror?=
 =?us-ascii?Q?MC8ScOeaShHwdX4JiHGYuIjr8/jk4dh2z4MKdu49srcsXVqE8pPOOt0sUN7L?=
 =?us-ascii?Q?ED4gSm/OQS5TRD4DCYfkJtJgrDzPGFbqf/cVgEz+mv7Gx78deTFpbzdUlfad?=
 =?us-ascii?Q?EzX5gucX+yQNt+NFwnm/AVNa1MGrF0QpyA+Et/EHUf01EAWg/Sz9OA79XB7A?=
 =?us-ascii?Q?WYI7+Ij0D50qtAtt0Kh18rD1eXP/jh2ozdvp8G/rqBvXrL0iaxA860pUB/Zy?=
 =?us-ascii?Q?p3Dat+9WPTCdXhMMdSi+o1vZoqBDi2pa0TqLCHEUVbKOVqplNeh+V3ln+YEk?=
 =?us-ascii?Q?6Lb+/wFXqEZb13HcxhaGyAQM+XS+ns9ctojyhqSwDQrHI9RXGlPPWqKMxfCs?=
 =?us-ascii?Q?q7RBiBGUHHjmGQ4lOrSdux8nDMVZYKmS89KzqxOHAQvxxLyeIeCUDE3+BrTO?=
 =?us-ascii?Q?3yraLy6HHLgk2fjJGhhj3GIHVaQ/0+fqFLq4n+5FJ9drEcppqBZzol3tYol2?=
 =?us-ascii?Q?f5311oqq4tvE1e6iuMSjEJ20+NZ7e6Itn1FxqIHrUEPrRMYn0hQQ7oBCQaSz?=
 =?us-ascii?Q?IWGWduhexoEQO3h7Dg1hzwvOrGGllqs6QuYI/SQZ5dQ7CQ83CGVrFdAzob63?=
 =?us-ascii?Q?U+6ab5rcuGLcUhAdkfk+n6NxH5vPj1CkmwVuYGaNS20o0XyjMhT6Ec7EQLgi?=
 =?us-ascii?Q?Dy68aznqIwF/uSTI2TuRx5Am4SpvgEXBGHzUEW4CCL/tqP8h60nT2bB6tKWj?=
 =?us-ascii?Q?OdoNkLT0rPV1nLXpB2bpI+nyy0irpr+1NZ6HahPu88kW/iybrsSOqs0fqp8Y?=
 =?us-ascii?Q?NZ35qMXYbBKc0Vl9VIS9VDDy/4CPj7KjESGdVHcziMG8Zt6uZ/Yme78p/Dzq?=
 =?us-ascii?Q?oKNCFKcTFGzAG81cFFXcaCRnEqqWDyUJIoAopI1A/h/iqAAGD3VfFETz/muF?=
 =?us-ascii?Q?yKeQxbAZKcX9oOs2+4Wv+xdOC9FypmlrI4gHxyFxQlrita4gbrysQQi/ELC1?=
 =?us-ascii?Q?8NXg/HzU+NMAHULTABA7IX4nY6TqIITa36nVXq7hb6X/4eYKwfsYifn2H6nN?=
 =?us-ascii?Q?cXV21DtJC5X18+DDYbA=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 08:46:04.4327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3dbf263-6b22-49bd-4d85-08de20359569
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB10123
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Nov 2025 08:46:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8020

From: Daniel Turull <daniel.turull@ericsson.com>

Documentation to include how to use scripts that can help
with kernel CVEs introduce by:

e60b1759c1 improve_kernel_cve_report: add script for postprocesing of kerne=
l CVE data
12612e8680 linux/generate-cve-exclusions: use data from CVEProject

CC: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>

---

v2: address all Antonin's comments
---
 documentation/dev-manual/vulnerabilities.rst | 180 +++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/d=
ev-manual/vulnerabilities.rst
index 3a83a40f3..9009d8b00 100644
--- a/documentation/dev-manual/vulnerabilities.rst
+++ b/documentation/dev-manual/vulnerabilities.rst
@@ -335,3 +335,183 @@ When analyzing CVEs, it is recommended to:
 -  follow public `open source security mailing lists <https://oss-security=
.openwall.org/wiki/mailing-lists>`__ for
    discussions and advance notifications of CVE bugs and software releases=
 with fixes.
=20
+Linux kernel vulnerabilities
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+
+Since the Linux kernel became a CVE Numbering Authority (CNA), the number =
of
+associated CVEs has increased dramatically. Security teams must address th=
ese
+CVEs to meet regulatory and customer requirements. Automation on identifyi=
ng
+issue helps to reduce their workload.
+
+:term:`OpenEmbedded-Core (OE-Core)` has two scripts that help to character=
ize
+and filter CVEs that affect the Linux kernel:
+
+-  ``openembedded-core/meta/recipes-kernel/linux/generate-cve-exclusions.p=
y``
+-  ``openembedded-core/scripts/contrib/improve_kernel_cve_report.py``
+
+``generate-cve-exclusions.py``
+------------------------------
+
+When updating a kernel recipe, a helper script needs to be run manually to
+update the :term:`CVE_STATUS` for the kernel recipe. The script can be use=
d
+for custom kernels.
+
+First we need to get an updated version of the CVE information from the
+``CVE Project``. Run it as follows::
+
+   $ git clone https://github.com/CVEProject/cvelistV5 ~/cvelistV5
+
+or if you have alread cloned it, you need to pull the latest data::
+
+   $ git -C ~/cvelistV5 pull
+
+Then, autogenerate the :term:`CVE_STATUS` information for the desired vers=
ion
+of the kernel::
+
+   $ ./generate-cve-exclusions.py ~/cvelistV5 <version> > cve-exclusion_<k=
ernel_version>.inc
+
+Example::
+
+   $ git clone https://github.com/CVEProject/cvelistV5 ~/cvelistV5
+   $ cd openembedded-core/meta/recipes-kernel/linux/
+   $ ./generate-cve-exclusions.py ~/cvelistV5 6.12.27 > ~/meta-custom/reci=
pes-kernel/linux/cve-exclusion_6.12.inc
+
+Don't forget to update your custom kernel recipe with::
+
+   include cve-exclusion_6.12.inc
+
+Then the CVE information will automatically be added in the
+:ref:`ref-classes-cve-check` or :ref:`ref-classes-vex` report.
+
+``improve_kernel_cve_report.py``
+--------------------------------
+
+The script in ``openembedded-core/scripts/contrib/improve_kernel_cve_repor=
t.py``
+leverages CVE kernel metadata and the :term:`SPDX_INCLUDE_COMPILED_SOURCES=
`
+variable to update the ``cve-summary.json`` file. It reduces CVE false
+positives by 70%-80% and provide detailed responses for all kernel-related
+CVEs by using the files used to build the kernel. The script is decoupled =
from
+the build and can be run outside of the :term:`BitBake` environment.
+
+The script uses the output from the :ref:`ref-classes-vex` or
+:ref:`ref-classes-cve-check` class as input, together with CVE information=
 from
+the Linux kernel CNA to enrich the ``cve-summary.json`` file with updated =
CVE
+information. It creates a new json file with updated CVE information.
+The file name can be specified as argument. Optionally, it can also use th=
e
+list of compiled files from the kernel :term:`SPDX` to ignore CVEs that ar=
e
+not affected because the files are not compiled.
+
+For this, BitBake uses the debug information to extract the sources used t=
o
+build a binary. Therefore, it needs to be configured in the kernel to extr=
act
+the kernel compiled files.
+
+If you are using the ``linux-yocto`` recipe, enable it by adding the follo=
wing
+in a :term:`configuration file` or in a ``.bbappend``::
+
+   KERNEL_EXTRA_FEATURES:append =3D " features/debug/debug-kernel.scc"
+
+Or by editing your kernel configuration to include DWARF4 debug informatio=
n.
+
+See the :ref:`kernel-dev/common:Changing the Configuration` section of the=
 Yocto
+Project Linux Kernel Development Manual for more information.
+
+For the following example, we will consider that the kernel recipe used is
+``linux-yocto``. Instructions also apply to other kernel recipes named
+differently.
+
+The sources for the kernel are stored under
+``tmp/pkgdata/<MACHINE>/debugsources/linux-yocto-debugsources.json.zstd``.=
 In
+order to include the information into the :term:`SPDX` file to filter out
+source files that are not used to compile the kernel, add the following in=
 a
+:term:`configuration file`::
+
+   SPDX_INCLUDE_COMPILED_SOURCES:pn-linux-yocto =3D "1"
+
+Finally, store either the ``recipe-linux-yocto.spdx.json`` or the
+``linux-yocto-debugsources.json.zstd`` outside the :term:`build directory`=
.
+
+The :term:`SPDX` file is under
+``tmp/deploy/spdx/<spdx_version>/<MACHINE>/recipes/recipe-linux-yocto.spdx=
.json``
+
+Once you have the input data, first you need to clone or fetch the latest =
CVE
+information from kernel.org::
+
+   $ git clone https://git.kernel.org/pub/scm/linux/security/vulns.git ~/v=
ulns
+
+or if already checked out::
+
+   $ git -C ~/vulns pull
+
+Finally, run the script by using one of the examples below. The most exact=
 are
+the first two examples, using the old cve-summary.json.
+
+- Example using ``--old-cve-report`` as input::
+
+   $ python3 openembedded-core/scripts/contrib/improve_kernel_cve_report.p=
y \
+      --spdx tmp/deploy/spdx/3.0.1/qemux86_64/recipes/recipe-linux-yocto.s=
pdx.json \
+      --datadir ~/vulns \
+      --old-cve-report build/tmp/log/cve/cve-summary.json
+
+- Example using ``--debug-sources`` file instead of SPDX kernel file::
+
+   $ python3 openembedded-core/scripts/contrib/improve_kernel_cve_report.p=
y \
+      --debug-sources tmp/pkgdata/qemux86_64/debugsources/linux-yocto-debu=
gsources.json.zstd \
+      --datadir ~/vulns \
+      --old-cve-report build/tmp/log/cve/cve-summary.json
+
+- Example using the ``--kernel-version``::
+
+   $ python3 openembedded-core/scripts/contrib/improve_kernel_cve_report.p=
y \
+      --spdx tmp/deploy/spdx/3.0.1/qemux86_64/recipes/recipe-linux-yocto.s=
pdx.json \
+      --kernel-version 6.12.27 \
+      --datadir ~/vulns
+
+Example output for a CVE for which the status was changed to "Ignored" bec=
ause
+the source files associated to the CVE were not compiled:
+
+.. code-block:: json
+
+   {
+      "id": "CVE-2025-38384",
+      "status": "Ignored",
+      "detail": "not-applicable-config",
+      "summary": "In the Linux kernel, the following vulnerability has bee=
n resolved (...)",
+      "description": "Source code not compiled by config. {'drivers/mtd/na=
nd/spi/core.c'}"
+   }
+
+Example of output for a CVE not in range:
+
+.. code-block:: json
+
+   {
+      "id": "CVE-2025-40017",
+      "status": "Patched",
+      "detail": "fixed-version",
+      "summary": "In the Linux kernel, the following vulnerability has bee=
n resolved (...)",
+      "description": "only affects 6.15 onwards"
+   }
+
+Example of output for a CVE that is vulnerable:
+
+.. code-block:: json
+
+   {
+      "id": "CVE-2024-58093",
+      "status": "Unpatched",
+      "detail": "version-in-range",
+      "summary": "In the Linux kernel, the following vulnerability has bee=
n resolved (...)",
+      "description": "Needs backporting (fixed from 6.15)"
+   }
+
+Example of output for a CVE rejected by the Linux CNA:
+
+.. code-block:: json
+
+   {
+      "id": "CVE-2025-38380",
+      "status": "Ignored",
+      "detail": "rejected",
+      "summary": "In the Linux kernel, the following vulnerability has bee=
n resolved (...)",
+      "description": "Rejected by CNA"
+   }
+
--=20
2.34.1


