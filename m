Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1903ACCF9EC
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 09:41:57 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.27])
 by mx.groups.io with SMTP id smtpd.web11.4455.1761644514097807107
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 02:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=G/wF0ntt;
 spf=pass (domain: ericsson.com, ip: 52.101.66.27, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbZ9zWaBZbLJGSfu1nmNsYDmr+tDIFkHH/OCOTp4B0dZCYF2Fc9l5Ow7ihTl02VKGOF21a6Aiv9E08JL8g3GdsL1CgxfLpvFajyI4Sh6K6hty1XDYFUhU5QXL1xhcMRQ6EpnVKkZ41J0cWTO1Uj+OdlMtln4Aa8DOCrWjfWvA/W+RcXOj7hjIlMvjF3upJtIrS8pOy/aLavpjMlTNgI/oYEEAEGVypcmJyaT/8neU8GI0JnF3+Ey8tSXRZ2qq9kzVBWrw/axmzc2QZljnBYPJUIrZjkfFYdwJIGtMjIY35QjxK5p74aKtqp9MZViKp5pmaY7oprBexUKjPw1YAekTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcVHlAKCBxxYfVq2F4g5Nvti/nA8sIGdV1G8cn76Z3Q=;
 b=NrAFsKlWPuCyBcSZ1+TVWOJGKMsEnGaUjhxSyNYsZQvaV+2wdKsYyOq3yJorxMtXU0log8pxcBVWpx3208aW91EgI7r8dV4ekZ4uSn5dcBF/tFlXmgZtOfxebvGyjZpGZH5krjrFRgKlRP6IbFKTvPAYcRS5+czOJYOtrvzljBlGxkLsUvqccGL1Y/tX3ku21DM1WpMUV/TM2vLMAh+6pG/GJnl17vtgqOD8ZDc5H/s7f6N2sQHAbv+ysRlIGqir1jOzBY/6/2t8rCF/uv/FA3jb5Nil1dM1O4PS/GgUYYZF33XvF8Fr/VbHe0/RUrKZFpQkqbFc/6O2V8+OHNxxfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcVHlAKCBxxYfVq2F4g5Nvti/nA8sIGdV1G8cn76Z3Q=;
 b=G/wF0nttwe0ADcMQWeTEqGS71niYtrWUerPg1Rc1GeMvhmQXH7mx8D4F+oRcn7NbrB+6teOAjlieEmnpJiV7SQ1bLOFi6TO+vLGqd98MogL5M17STb5e+kMklq+KDOzkLu7VbnZOQqmqThy+LJ5AmRD7pNYS9vgsje/8eRX3LNzO3vr9RUIm6WD1R1L6+18oQzuWzAO8NcuUEwSTI0Wi92vj272/AhpTJDo1gqSIk7UADe9DMT5VrqHEtheCPIFwovPlSCn1tOu40WrOJ94VBPVp0AHIWUFNt8ITqR3QAHfc8ZqYmQQXXDRyybNxqxHZETqLQpCSXkFjsiAl+h+hjg==
Received: from DUZPR01CA0107.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::25) by DB9PR07MB9392.eurprd07.prod.outlook.com
 (2603:10a6:10:45e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 09:41:50 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:4bb:cafe::9c) by DUZPR01CA0107.outlook.office365.com
 (2603:10a6:10:4bb::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Tue,
 28 Oct 2025 09:42:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Tue, 28 Oct 2025 09:41:50 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 28 Oct 2025 10:41:49 +0100
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id DF8D6402084F;
	Tue, 28 Oct 2025 10:41:48 +0100 (CET)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id CC6D4700CF09; Tue, 28 Oct 2025 10:41:48 +0100 (CET)
From: <daniel.turull@ericsson.com>
To: <docs@lists.yoctoproject.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH] vulnerabitilies: add section for kernel CVEs vulnerabilities
Date: Tue, 28 Oct 2025 10:41:38 +0100
Message-ID: <20251028094138.2607929-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0E:EE_|DB9PR07MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b150b4b-5486-4e33-0602-08de16063852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Tu4K6R9uBT85lH+KjBv2743dfp8dmj43FwDtDte28liHmhnirhGg/kMDf3JO?=
 =?us-ascii?Q?2wiuCbqkd1f9l8FXzgH4JM8yEoSoTFIfSd9Um4rlObCIM51Q7sWiW/3bLLkn?=
 =?us-ascii?Q?M2NyDF/qUXr3CviKtaenoI0Nc0YBUlfmeQsSLRe6l5U0iGnMM+Reascstbie?=
 =?us-ascii?Q?K9z+zt9IQ41V+i3TkWPBZWKjgjzttxSpUguu5TWUHEaKXK65gbPViPWyvbqG?=
 =?us-ascii?Q?rfmyfTXTjgqLTqFqMpMblCWABoC+9ZDVm4Bqpnkc/JY8P2AjJ0C21jKrKESy?=
 =?us-ascii?Q?7cBi8YFEeLcNivTdeUB5VjC4W9wMW6jkq47s3wMPU8VpJMwMuj5Siml4RDUT?=
 =?us-ascii?Q?MJwOkveOzzr2qRNrcMiEnVLdVIGtIO60NSrYw6wlXOsHQnVWMPGamwuWUvNN?=
 =?us-ascii?Q?ke8R5NnCSM1q7aH2T2fgqbrO+u3FDW6c0MpP6Eo67W3s/aHHHESIXBikDjg+?=
 =?us-ascii?Q?vTUYFjDvFGBIge3TZH5Kh0mRKWLQ1Z1aTqPYj/b0Q4E6Rx3LY3l2D7GcsMIG?=
 =?us-ascii?Q?qX2sTvms5QOJteV4Ig7zR7vb5Im37kDNkxPrRADurDQVT15rvEylxZEJknRn?=
 =?us-ascii?Q?JQWhCGOum6rcNiiQkkUXSaus2yw+gSsVfnn1YXHoLUU27Y2lakZ6O+snyFFp?=
 =?us-ascii?Q?hJtIBkv826ZK7JkwIAT6efurH8zUDhGF6LcT+om3emW09nsMaWfJ7EjL21TI?=
 =?us-ascii?Q?8Y3WQ/DwkN6XmCqhDQki8NLztu7+O4KjWuokoPwZ8olVkjgXZWz+PHwRzxIn?=
 =?us-ascii?Q?hWdepbi1mw9k8UKchOQSN+7fevE7xonlKB2CG0fw1g/nT9gkiwk6JN/wlYdW?=
 =?us-ascii?Q?GjKxbExxfCJ8wTYNNq9gKvZoL04s/O+2CCIR7eFHjFdAeM63IAMDsXtz6N5C?=
 =?us-ascii?Q?MV6aQRJ+AaGcLzTST0gJZt05EP3wnVkH2WX51vfIM/HXY0hjLHaR7fl8H52P?=
 =?us-ascii?Q?jsKcwUVsA7z97BWLMhSlb3/mWZuiG51YhLTe6oB8Nwg5/Uv5NYczXhyRI31m?=
 =?us-ascii?Q?GlCD0Xt7dsOUwd56/WVn6Gh2XvZmpamqobLIbHtTT42AlHcqdnZwTkTf4vVF?=
 =?us-ascii?Q?9daU9hC9Ri7Er+17Kebbpb6qk2kKZ33S7hcRo+fOuf8P/JmRRdD3TIfWPQkS?=
 =?us-ascii?Q?vf+HbOo1fdJ7FwrfDvBPjT/AhKLrjAvvtrNzAXroF5gCdLaoAnltFDljwQLp?=
 =?us-ascii?Q?LOea2jhJyxmHXdJjA+oubKDS4xZlrw1cRXfU9cbk3Q6skpG6fWR5ZVadyKSu?=
 =?us-ascii?Q?mDSMjSnWnJrTmlRtLniQr2nZvO4SPkEMiB8ySpCKE4EB8O3oQns7se59usHc?=
 =?us-ascii?Q?FSfMofbbYe+29OJg0lMBw/ZdeL9d1SEJfxPQPPAZ7e3n35ZIZaxLTfX08Mbd?=
 =?us-ascii?Q?HmrE2ijwEKZJH47kA3/1xH41q/4wp/DxtYG3StkJOQRfMTJeyDkcwaisvjd1?=
 =?us-ascii?Q?JkQp9ck7FESnMl1KSzftajJKGfnQOX0kgSJlXbeKrNE4fBu7UsOHb9PsHrzE?=
 =?us-ascii?Q?Q2AfQlcW5lF7YW0uUWcsvOvidG1qLCfklNje?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 09:41:50.2989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b150b4b-5486-4e33-0602-08de16063852
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB9392
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Oct 2025 09:41:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7875

From: Daniel Turull <daniel.turull@ericsson.com>

Documentation to include how to use scripts that can help
with kernel CVEs introduce by:

e60b1759c1 improve_kernel_cve_report: add script for postprocesing of kerne=
l CVE data
12612e8680 linux/generate-cve-exclusions: use data from CVEProject

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 documentation/dev-manual/vulnerabilities.rst | 108 +++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/d=
ev-manual/vulnerabilities.rst
index 6cc7f0494..065d853d6 100644
--- a/documentation/dev-manual/vulnerabilities.rst
+++ b/documentation/dev-manual/vulnerabilities.rst
@@ -335,3 +335,111 @@ When analyzing CVEs, it is recommended to:
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
of associated CVEs has increased dramatically. Security teams must address =
these CVEs to meet regulatory and customer requirements. Automation on iden=
tifying issue helps to reduce their workload.
+
+OpenEmbedded-core has two scripts that helps to characterize and filter CV=
Es that affects the Linux kernel, which use one of the following CVE source=
s:
+
+- https://git.kernel.org/pub/scm/linux/security/vulns.git
+- https://github.com/CVEProject/cvelistV5
+
+The scripts' location are:
+
+-  ``openembedded-core/meta/recipes-kernel/linux/generate-cve-exclusions.p=
y``
+-  ``openembedded-core/scripts/contrib/improve_kernel_cve_report.py``
+
+generate-cve-exclusions.py
+--------------------------
+
+When updating a kernel recipe, a helper script needs to be run manually to=
 update the CVE_STATUS for the kernel recipe. The script can be used for cu=
stom kernels. Run it as follows::
+
+   openembedded-core/meta/recipes-kernel/linux/generate-cve-exclusions.py =
<datadir> <version> > cve-exclusion_<kernel_version>.inc
+
+Example::
+
+   cd openembedded-core/meta/recipes-kernel/linux/
+   ./generate-cve-exclusions.py ~/cvelistV5 6.12.27 > cve-exclusion_6.12.i=
nc
+
+Then the CVE information will automatically be added in the :ref:`ref-clas=
ses-cve-check` or :ref:`ref-classes-vex` report.
+
+improve_kernel_cve_report.py
+-----------------------------
+
+The script in ``openembedded-core/scripts/contrib/improve_kernel_cve_repor=
t.py`` leverages CVE kernel metadata and the :term:`SPDX_INCLUDE_COMPILED_S=
OURCES` to update the ``cve-summary.json``. It reduces CVE false positives =
by 70%-80% and provide detailed responses for all kernel-related CVEs, with=
 the files used to build the kernel. The script is decoupled from the build=
 and can be run outside BitBake.
+
+The script uses the output from :ref:`ref-classes-vex` or :ref:`ref-classe=
s-cve-check` class as input, together with CVE information from the Linux k=
ernel CNA to enrich the ``cve-summary.json``. It creates a new json file wi=
th updated CVE information. Optionally, it can also use the list of compile=
d files from the kernel :term:`SPDX` to ignore CVEs that are not affected b=
ecause the files are not compiled.
+
+BitBake uses the debug information to extract the sources used to build a =
binary. Therefore, it needs to be configured in the kernel to extract the k=
ernel compiled files. Enable it by adding the following in your ``local.con=
f`` or kernel recipe::
+
+   KERNEL_EXTRA_FEATURES:append =3D " features/debug/debug-kernel.scc"
+
+Or by editing your kernel configuration to include DWARF4 debug informatio=
n.
+
+The sources for the kernel are stored under ``tmp/pkgdata/<MACHINE>/debugs=
ources/linux-yocto-debugsources.json.zstd``. In order to include the inform=
ation into the :term:`SPDX` file to filter out source files that are not in=
cluded in the binaries, add the following in your ``local.conf``::
+
+   SPDX_INCLUDE_COMPILED_SOURCES:pn-linux-yocto =3D "1"
+
+Finally, store either the ``recipe-linux-yocto.spdx.json`` or the ``linux-=
yocto-debugsources.json.zstd`` outside the build directory.
+
+The :term:`SPDX` file is under ``tmp/deploy/spdx/3.0.1/<MACHINE>/recipes/r=
ecipe-linux-yocto.spdx.json``
+
+Once you have the input data, first you need to clone or fetch the latest =
CVE information from kernel.org::
+
+   git clone https://git.kernel.org/pub/scm/linux/security/vulns.git
+
+Finally, run the script by using one of the examples bellow. The most exac=
t are the first two examples, using the old cve-summary.json to identify th=
e kernel version.
+
+- Example using old-cve-report as input::
+
+   python3 openembedded-core/scripts/contrib/improve_kernel_cve_report.py =
--spdx tmp/deploy/spdx/3.0.1/qemux86_64/recipes/recipe-linux-yocto.spdx.jso=
n --datadir ./vulns --old-cve-report build/tmp/log/cve/cve-summary.json
+
+- Example using debug-sources file instead of SPDX kernel file::
+
+   python3 openembedded-core/scripts/contrib/improve_kernel_cve_report.py =
--debug-sources tmp/pkgdata/qemux86_64/debugsources/linux-yocto-debugsource=
s.json.zstd --datadir ./vulns --old-cve-report build/tmp/log/cve/cve-summar=
y.json
+
+- Example using the kernel-version::
+
+   python3 openembedded-core/scripts/contrib/improve_kernel_cve_report.py =
--spdx tmp/deploy/spdx/3.0.1/qemux86_64/recipes/recipe-linux-yocto.spdx.jso=
n --kernel-version 6.12.27 --datadir ./vulns
+
+Example of output for a CVE that the binary does not include the source co=
de due to the kernel configuration::
+
+        {
+          "id": "CVE-2025-38384",
+          "status": "Ignored",
+          "detail": "not-applicable-config",
+          "summary": "In the Linux kernel, the following vulnerability has=
 been resolved (...),
+          "description": "Source code not compiled by config. {'drivers/mt=
d/nand/spi/core.c'}"
+        },
+
+Example of output for a CVE not in range::
+
+        {
+          "id": "CVE-2025-40017",
+          "status": "Patched",
+          "detail": "fixed-version",
+          "summary": "In the Linux kernel, the following vulnerability has=
 been resolved (...),
+          "description": "only affects 6.15 onwards"
+        }
+
+Example of output for a CVE that is vulnerable::
+
+        {
+          "id": "CVE-2024-58093",
+          "status": "Unpatched",
+          "detail": "version-in-range",
+          "summary": "In the Linux kernel, the following vulnerability has=
 been resolved (...),
+          "description": "Needs backporting (fixed from 6.15)"
+        }
+
+Example of output for a CVE rejected by the Linux CNA::
+
+        {
+          "id": "CVE-2025-38380",
+          "status": "Ignored",
+          "detail": "rejected",
+          "summary": "In the Linux kernel, the following vulnerability has=
 been resolved (...),
+          "description": "Rejected by CNA"
+        }
+
--=20
2.34.1


