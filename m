Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FD5D2F32D
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 19:25:04 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67745.1768332302116812071
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 11:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VOd++N0f;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id d75a77b69052e-5014549c439so691491cf.2
        for <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 11:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768332301; x=1768937101; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pKmIjGXtpfTcaXG85KjqBkml6uOsM+1O5SWBgKCaOHU=;
        b=VOd++N0fqX0i5bdl0x9kbDkUh3dqTqdN5Kisgfk1e98iv9tnudhEIjuTOYWYpwg7MI
         gN/hq2uRZmjOGaGHzMEsgjH7+bZXZ1M9ghOWtAeT3m2++vQSAtBL1u451yX7qyKyPUbS
         ho2rq7wDjjGWr7AxC7CV5UaEocehE3gsUk/ETV00olmxfi6a4ILXNYAtvuwRWzNuJH6h
         TjIiVHE0ObrcHywILErELKE1cTddZCr5k0SvLeIFr1l0S6Vvfqf7edYmwtX3qbLoj4+i
         08M/FqWm9xJOGqtdKP0brnnPinRmwy7W+yp194fKGFFKDoLXjWz+r3KSVfkTiecGHz35
         fyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768332301; x=1768937101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKmIjGXtpfTcaXG85KjqBkml6uOsM+1O5SWBgKCaOHU=;
        b=eIwJuNPlDKaDvovNLSGzp8oN0UXRCrMKHOc1wcaLm35j9FST2XnE5RoIVubMDMLhBw
         mU1Ray2OFOdu2wiavPivbnLeas8itlxMdr8DYo+XBWZt7jlAsVxfjoXCpIX50QTrdmmD
         txt/4vyj96/OFrrXAZoICKepe1cqy1BFmG1A0oEYdEd74HzpUZ9lF7HykngB+ePQtIJx
         UCXPlUOoFftsV9tgnYo9VaL1xCkEsw0S47lXIO5F57BdBUU+T+QHNVvNaBtVP7gYdQVq
         GRpnpIcPGprxsIwzTEj9DqvL+svrLal4zWSy5mQ6+uDD3VHMDMMlPgEcCi5Gz2dPovI3
         DbSA==
X-Gm-Message-State: AOJu0YwWmdMrywItlpA2DY5uS0NdkBRDk0HAPfT5wnEF3e8rFUfnN1oK
	o1PW48Bm/cd5f+7igskf7gWQ5I2sfBVuJRB6wgCjQQJkRdSAxCMkWdk5q1UECVgGuiMT+Q==
X-Gm-Gg: AY/fxX66fJIhTU/B3F4goDU+P/bADohtP2hXK+l2QgFD1eeoyaw/P/4Oz9gG6oSjEVI
	5Drt1e2IZENZ/2pbmfObfD2vdmtpy6tmMdXI1N5mQl5F5gTDKYNDlj/56jjkR8qrndzZyhf5MCG
	pXeednXXL+u7JG7EerHBkl8Eu0X+itEziWhYIMuTl93HBGBk9+zScUDbMDpEdaXfW4E+wG+RGxv
	/ujyyw++kV8j04lbKWFjYfVpClnbwU7O+4Bi4PlKmupV2WNYrIOCXTdHvHdJnGi1NcEC2hTKdrs
	5h1GlTNPife3cub3LXnSLHwj4F4BNWBL2sPSXhuCS2X2rkP2ql3SJTB+lopFiJAOIJTiz8StNws
	MGFRGeM+LfjX9g4+S1uQJ+NUffYEYVwzRRsS/oqzj8/GkwJLEM8SlBtbEuo7+ab0oFs2WoTkI7q
	Sj74BXvdfsG4DpebkZ3/VwZBo8QZ2G9NV1/JcF8T2I1J0qGEeEgDFLVtM=
X-Received: by 2002:a05:6214:4f06:b0:882:63cf:3970 with SMTP id 6a1803df08f44-89274323a1emr363476d6.1.1768332300808;
        Tue, 13 Jan 2026 11:25:00 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772681desm162790186d6.51.2026.01.13.11.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 11:25:00 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: docs@lists.yoctoproject.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH] vulnerabilities: add support for new bbclass
Date: Tue, 13 Jan 2026 14:24:57 -0500
Message-ID: <20260113192458.3478804-1-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 19:25:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8544

Update the documentation to add the description for:

*generate-cve-exclusions.bbclass
*improve_kernel_cve_report.bbclass

This .bbclass haven't been merged yet in openembedded-core. This doesn't
need to be merged until the two following PR are validated:

*PR for generate-cve-exclusions.bbclass: https://lists.openembedded.org/g/openembedded-core/message/228924
*PR for improve_kernel_cve_report.bbclass: https://lists.openembedded.org/g/openembedded-core/message/228932

Request to set the documentation up-to-date:

https://lists.openembedded.org/g/openembedded-core/message/229041

Signed-off-by: ValentinBoudevin <valentin.boudevin@gmail.com>
---
 documentation/dev-manual/vulnerabilities.rst | 62 +++++++++++++++++---
 1 file changed, 54 insertions(+), 8 deletions(-)

diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/dev-manual/vulnerabilities.rst
index 6eaf75758..a1eb8105a 100644
--- a/documentation/dev-manual/vulnerabilities.rst
+++ b/documentation/dev-manual/vulnerabilities.rst
@@ -346,15 +346,47 @@ issues helps to reduce their workload.
 :term:`OpenEmbedded-Core (OE-Core)` has two scripts that help to characterize
 and filter CVEs affecting the Linux kernel:
 
--  ``openembedded-core/meta/recipes-kernel/linux/generate-cve-exclusions.py``
+-  ``openembedded-core/scripts/contrib/generate-cve-exclusions.py``
 -  ``openembedded-core/scripts/contrib/improve_kernel_cve_report.py``
 
-``generate-cve-exclusions.py``
+The usage of these scripts can be automated with ``.bbclass`` files:
+
+-  ``openembedded-core/meta/classes/generate-cve-exclusions.bbclass``
+-  ``openembedded-core/meta/classes/improve_kernel_cve_report.bbclass``
+
+``generate-cve-exclusions``
 ------------------------------
 
-When updating a kernel recipe, a helper script needs to be run manually to
-update the :term:`CVE_STATUS` for the kernel recipe. The script can be used
-for custom kernels.
+The kernel recipe requires :term:`CVE_STATUS` variable.
+
+Two methods are available to generate the CVE exclusions for the kernel:
+
+- The class ``generate-cve-exclusions.bbclass`` can be inherited in the
+  kernel recipe to automatically set the variable :term:`CVE_STATUS`
+  during the build, based on ``https://github.com/CVEProject/cvelistV5``.
+
+First, modify your kernel recipe to inherit the class::
+
+   inherit generate-cve-exclusions
+
+Then, you can invoke the ``generate-cve-exclusions`` task to generate
+the CVE exclusions for the kernel version being built.
+
+.. code-block:: shell
+
+   $ bitbake -c generate-cve-exclusions <linux-recipe>
+
+The task will create a new folder named ``cvelistV5`` under the kernel
+working directory.
+
+This folder will contain an updated version of ``https://github.com/CVEProject/cvelistV5``.
+
+It will also store a ``.json`` file which contains the update for
+:term:`CVE_STATUS` variable for the kernel version being built.
+
+- A script named ``generate-cve-exclusions.py`` that can be run manually
+  to generate the CVE exclusions file that can be included in the kernel
+  recipe:
 
 First we need to get an updated version of the CVE information from the
 `CVE Project`. Run it as follows:
@@ -391,7 +423,7 @@ Don't forget to update your kernel recipe with::
 Then the CVE information will automatically be added in the
 :ref:`ref-classes-cve-check` or :ref:`ref-classes-vex` report.
 
-``improve_kernel_cve_report.py``
+``improve_kernel_cve_report``
 --------------------------------
 
 The ``openembedded-core/scripts/contrib/improve_kernel_cve_report.py`` script
@@ -442,8 +474,22 @@ Finally, store either the ``recipe-linux-yocto.spdx.json`` or the
 The :term:`SPDX` file is under
 ``tmp/deploy/spdx/<spdx_version>/<MACHINE>/recipes/recipe-linux-yocto.spdx.json``
 
-Once you have the input data, first you need to clone or fetch the latest CVE
-information from https://git.kernel.org:
+Once you have the input data, you will have two options to run the script:
+
+- Use the ``.bbclass`` file ``improve_kernel_cve_report.bbclass`` to
+  automatically run the script during the build. This class can be
+  inherited in the image recipe as follows::
+
+     inherit improve_kernel_cve_report
+
+  The class will run the script after the ``cve-check`` task and
+  generate a new version of it with a new entry in
+  ``tmp/deploy/images/machine/`` finishing with
+  ``.rootfs.scouted.json``.
+
+- Run manually the script ``improve_kernel_cve_report.py`` as follows:
+
+First, you need to clone or fetch the latest CVE information from https://git.kernel.org:
 
 .. code-block:: shell
 

