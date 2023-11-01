Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D63C4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 06:26:28 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.1186.1698819984369349373
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 23:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q1fZhIGa;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: rybczynska@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6b1e46ca282so6528346b3a.2
        for <docs@lists.yoctoproject.org>; Tue, 31 Oct 2023 23:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698819983; x=1699424783; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c6ECQcn+0DfBGYYnhBztFomNTGrmZ0lb4WgJ+JkY+zk=;
        b=Q1fZhIGakVMk21fmTFyWoR522VWTaerY5hpZPeIUftzxJtlHKgHwDO/7l2UxNoq/48
         DhGH66DYcLT8yFxWN0Q3JVsOE0pNGLp1x+BVMDHxS6rqhpHTRGe/uOAz+1VIzZMdHc+I
         NF/vup1g2X1z+Yo+boPSSzI9WMgxZnMbyIE14VkjKyXNcdI3Qi2xa7aCXWGOjOX8Hha5
         YRI/OT9tEr5y+YV3yycUQjt36d3u3wn0YMbxD1pK45oDTGaDYf5JeEVT1jGbTNI6HG6S
         8M7tkzVkmB8maSxOzuTSzm2j2Ro5rMAPyYsYKNa58ORLl0VZSjJiLD8WYyiProYvdBMJ
         VNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698819983; x=1699424783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6ECQcn+0DfBGYYnhBztFomNTGrmZ0lb4WgJ+JkY+zk=;
        b=wK6SZCRsjsLTwsy0lsbQbmVKOuFB9dMSBN8FXpQ3Eszi/r2SK7Khgm5lM6DwclWz8C
         Zzt7sBURQR4VpCYLoUPyt1TPmJwlrfSHrMisDTh5mfOPoGCaoWgyowabZ/BNsT2Dlrnh
         QRdpPRbFF/vtAerKoitwetiZs71xClEO8/hnol9vWVeKxetxD0WN8cIcK9xETSMx+mKZ
         Px2uz3FBKnxHU2nzzpmjJPoVr+xrvbOy+inoKhRrV2ZPT2GhUEWySp6XoxNYV3S/LyuW
         AhrXPzEiIKanFfraMP1h6YaYUE6z/MnwiINfj+VXGZdIcbXT9DHEWJZXer1PaoBtRyGj
         M/Lw==
X-Gm-Message-State: AOJu0YwVhsv7HQE1H/v51zfxnWNAIvJ+hGSzIl51E39eIzIR5EwBb1XI
	6zPr0CHNJ0cAKYAQEOCHAsQVRihBSQEJDQ==
X-Google-Smtp-Source: AGHT+IFXkuBMTBm4kiTFkq71slxq+LUEGO/HPuVIsKGb9ZkkFCY8VvyTkxXgfidLvR/Nj69FJ1nTvA==
X-Received: by 2002:a05:6a21:a597:b0:161:76a4:4f74 with SMTP id gd23-20020a056a21a59700b0016176a44f74mr21611905pzc.1.1698819982761;
        Tue, 31 Oct 2023 23:26:22 -0700 (PDT)
Received: from localhost.localdomain ([61.84.2.32])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a018800b0028098225450sm228878pjc.1.2023.10.31.23.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 23:26:21 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: docs@lists.yoctoproject.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [PATCH] dev-manual: extend the description of CVE patch preparation
Date: Wed,  1 Nov 2023 07:26:14 +0100
Message-ID: <20231101062614.8357-1-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Nov 2023 06:26:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4544

Extend the description on how to prepare a patch for a CVE issue.
Add a more illustrative and current example of how to modify
the patch file. Add an example of how to use CVE_STATUS.

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
---
 documentation/dev-manual/vulnerabilities.rst | 111 +++++++++++++++----
 1 file changed, 91 insertions(+), 20 deletions(-)

diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/dev-manual/vulnerabilities.rst
index c492b62ff..1bc2a8592 100644
--- a/documentation/dev-manual/vulnerabilities.rst
+++ b/documentation/dev-manual/vulnerabilities.rst
@@ -129,31 +129,97 @@ NVD about CVE entries can be provided through the `NVD contact form <https://nvd
 Fixing vulnerabilities in recipes
 =================================
 
-If a CVE security issue impacts a software component, it can be fixed by updating to a newer
-version of the software component, by applying a patch or by marking it as patched via
-:term:`CVE_STATUS` variable flag. For Poky and OE-Core master branches, updating
-to a newer software component release with fixes is the best option, but patches can be applied
-if releases are not yet available.
-
-For stable branches, it is preferred to apply patches for the issues. For some software
-components minor version updates can also be applied if they are backwards compatible.
+Suppose a CVE security issue impacts a software component. In that case, it can
+be fixed by updating to a newer version, by applying a patch, or by marking it
+as patched via :term:`CVE_STATUS` variable flag. For Poky and OE-Core master
+branches, updating to a more recent software component release with fixes is
+the best option, but patches can be applied if releases are not yet available.
+
+For stable branches, we want to avoid API (Application Programming Interface)
+or ABI (Application Binary Interface) breakages. When submitting an update,
+a minor version update of a component is preferred if the version is
+backward-compatible. Many software components have backward-compatible stable
+versions, with a notable example of the Linux kernel. However, if the new
+version does or likely might introduce incompatibilities, extracting and
+backporting patches is preferred.
 
 Here is an example of fixing CVE security issues with patch files,
-an example from the :oe_layerindex:`ffmpeg recipe</layerindex/recipe/47350>`::
+an example from the :oe_layerindex:`ffmpeg recipe for dunfell </layerindex/recipe/122174>`::
 
    SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
+              file://mips64_cpu_detection.patch \
+              file://CVE-2020-12284.patch \
               file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
-              file://fix-CVE-2020-20446.patch \
-              file://fix-CVE-2020-20453.patch \
-              file://fix-CVE-2020-22015.patch \
-              file://fix-CVE-2020-22021.patch \
-              file://fix-CVE-2020-22033-CVE-2020-22019.patch \
-              file://fix-CVE-2021-33815.patch \
+              file://CVE-2021-3566.patch \
+              file://CVE-2021-38291.patch \
+              file://CVE-2022-1475.patch \
+              file://CVE-2022-3109.patch \
+              file://CVE-2022-3341.patch \
+              file://CVE-2022-48434.patch \
+          "
+
+The recipe has both generic and security-related fixes. The CVE patch files are named
+according to the CVE they fix.
+
+When preparing the patch file, take the original patch from the upstream repository.
+Do not use patches from different distributions, except if it is the only available source.
+
+Modify the patch adding OE-related metadata. We will follow the example of the
+``CVE-2022-3341.patch``.
+
+The original `commit message <https://github.com/FFmpeg/FFmpeg/commit/9cf652cef49d74afe3d454f27d49eb1a1394951e.patch/>`__
+is::
+
+   From 9cf652cef49d74afe3d454f27d49eb1a1394951e Mon Sep 17 00:00:00 2001
+   From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
+   Date: Wed, 23 Feb 2022 10:31:59 +0800
+   Subject: [PATCH] avformat/nutdec: Add check for avformat_new_stream
+
+   Check for failure of avformat_new_stream() and propagate
+   the error code.
+
+   Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+   ---
+    libavformat/nutdec.c | 16 ++++++++++++----
+    1 file changed, 12 insertions(+), 4 deletions(-)
+
+
+For the correct operations of the ``cve-check``, it requires the CVE
+identification in a ``CVE:`` tag of the patch file commit message using
+the format::
 
-A good practice is to include the CVE identifier in both the patch file name
-and inside the patch file commit message using the format::
+   CVE: CVE-2022-3341
 
-   CVE: CVE-2020-22033
+It is also recommended to add the ``Upstream-Status:`` tag with a link
+to the original patch and sign-off by people working on the backport.
+If there are any modifications to the original patch, note them in
+the ``Comments:`` tag.
+
+With the additional information, the header of the patch file in OE-core becomes::
+
+   From 9cf652cef49d74afe3d454f27d49eb1a1394951e Mon Sep 17 00:00:00 2001
+   From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
+   Date: Wed, 23 Feb 2022 10:31:59 +0800
+   Subject: [PATCH] avformat/nutdec: Add check for avformat_new_stream
+
+   Check for failure of avformat_new_stream() and propagate
+   the error code.
+
+   Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+   CVE: CVE-2022-3341
+
+   Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/9cf652cef49d74afe3d454f27d49eb1a1394951e]
+
+   Comments: Refreshed Hunk
+   Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+   Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+   ---
+    libavformat/nutdec.c | 16 ++++++++++++----
+    1 file changed, 12 insertions(+), 4 deletions(-)
+
+A good practice is to include the CVE identifier in the patch file name, the patch file
+commit message and optionally in the recipe commit message.
 
 CVE checker will then capture this information and change the CVE status to ``Patched``
 in the generated reports.
@@ -161,8 +227,13 @@ in the generated reports.
 If analysis shows that the CVE issue does not impact the recipe due to configuration, platform,
 version or other reasons, the CVE can be marked as ``Ignored`` by using
 the :term:`CVE_STATUS` variable flag with appropriate reason which is mapped to ``Ignored``.
-As mentioned previously, if data in the CVE database is wrong, it is recommend to fix those
-issues in the CVE database directly.
+The entry should have the format like::
+
+   CVE_STATUS[CVE-2016-10642] = "cpe-incorrect: This is specific to the npm package that installs cmake, so isn't relevant to OpenEmbedded"
+
+As mentioned previously, if data in the CVE database is wrong, it is recommended
+to fix those issues in the CVE database (NVD in the case of OE-core and Poky)
+directly.
 
 Note that if there are many CVEs with the same status and reason, those can be
 shared by using the :term:`CVE_STATUS_GROUPS` variable.
-- 
2.42.0


