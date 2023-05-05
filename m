Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBFBC77B75
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 12:48:04 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.26067.1683290878476016046
 for <docs@lists.yoctoproject.org>;
 Fri, 05 May 2023 05:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=fVM3v1Gx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-306f2b42a86so1151234f8f.3
        for <docs@lists.yoctoproject.org>; Fri, 05 May 2023 05:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683290876; x=1685882876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pNALD3oW4AxbwAmtSKOsjuP/bxUs5pF0pHi3ZUU+g2k=;
        b=fVM3v1GxqF8Bbf+RwSv/7j4Qbxs5k868Ff7uHCW4iG076YL+h6PBqK5tteC4AncF/s
         01UhC6MHPrnIC/0OhjjksjaZvSx+iWOl9oRmcGzC3dXBr0+3wLCXeMYLCIPFb5rP4bS6
         YImA06w3yRbMpYFp5TJx4y51Yj/sOoNHdWm9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683290876; x=1685882876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pNALD3oW4AxbwAmtSKOsjuP/bxUs5pF0pHi3ZUU+g2k=;
        b=ExkGPSV0UQ/FfP93NcVBNtwE2H0kHdSR9J8Fz4uPXjqwGZJn8XnfmRfTjTanHtOdc2
         zav7vyUi+CR2vy7rS0PWg4XbnpGYSASFrHjY2iOtEQMmfu7CP5w7MMN8OsFAiKZxN4mY
         GFd51echXIzEkoIiKTMqvEHAG9bbdSu5SZvWb6CgVScv4DM+4gDDzcxpwCjJgyEFSLk2
         RANid71uXj8NKMrWOCd14KZbpRkN7gRhQOd36JjIPOZn+JOtdI09+PGwLmLesK5Fvju6
         T5bAf9S/nOCmn6kFiLCtfUfEUYtvtADIGhkB1bDK0mcLH0Vtp4yKCJkTc18DR1AwWeoW
         fCeg==
X-Gm-Message-State: AC+VfDzKOcVLLe87+T7qbHNfEjF8+qzeaDYb7KJ988pYnauJEuVfqmeF
	NDjEocfL8qnmtR/gBe+WMkebaEJsLm8OlZ7nhnNAmQ==
X-Google-Smtp-Source: ACHHUZ7ULf4X/P8jq9eaC0LDrxjwmxJ1IqU39879qT19sffVZG0OkEbYmy8Blj+qJYLIm2h1fXA8Hw==
X-Received: by 2002:adf:f052:0:b0:306:284c:8f4c with SMTP id t18-20020adff052000000b00306284c8f4cmr1214593wro.64.1683290876175;
        Fri, 05 May 2023 05:47:56 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aa1b:875d:4fc3:dd86])
        by smtp.gmail.com with ESMTPSA id q4-20020a5d61c4000000b003063772a55bsm2324531wrv.61.2023.05.05.05.47.55
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 05:47:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration/release-notes-4.3: Add extra notes
Date: Fri,  5 May 2023 13:47:54 +0100
Message-Id: <20230505124754.3136997-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 May 2023 12:48:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3913

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../migration-guides/migration-4.3.rst        | 28 ++++++++++++++++++-
 .../migration-guides/release-notes-4.3.rst    | 11 ++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/documentation/migration-guides/migration-4.3.rst b/documentation/migration-guides/migration-4.3.rst
index 914012ce6..74e540126 100644
--- a/documentation/migration-guides/migration-4.3.rst
+++ b/documentation/migration-guides/migration-4.3.rst
@@ -9,6 +9,23 @@ Migration notes for 4.3 (nanbield)
 This section provides migration information for moving to the Yocto
 Project 4.3 Release (codename "nanbield") from the prior release.
 
+.. _migration-4.3-supported-kernel-versions:
+
+Supported kernel versions
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The OLDEST_KERNEL setting has been changed to 5.15 in this release, meaning that
+out the box, older kernels are not supported. There were two reasons for this.
+Firstly it allows glibc optimisations that improve the performance of the system
+by removing compatibility code and using modern kernel APIs exclusively. The second
+issue was this allows 64 bit time support even on 32 bit platforms and resolves Y2038
+issues.
+
+It is still possible to override this value and build for older kernels, this is just
+no longer the default supported configuration. This setting does not affect which
+kernel versions SDKs will run against and does not affect which versions of the kernel
+can be used to run builds.
+
 .. _migration-4.3-supported-distributions:
 
 Supported distributions
@@ -27,7 +44,7 @@ Go language changes
 
 -  Support for the Glide package manager has been removed, as ``go mod``
    has become the standard.
-  
+
 .. _migration-4.3-recipe-changes:
 
 Recipe changes
@@ -36,6 +53,15 @@ Recipe changes
 -  Runtime testing of ptest now fails if no test results are returned by
    any given ptest.
 
+.. _migration-4.3-class-changes:
+
+Class changes
+~~~~~~~~~~~~~
+
+- The perl-version class no longer provides the PERLVERSION and PERLARCH variables
+  as there were no users in any core layer. The functions for this functionality
+  are still available.
+
 .. _migration-4.3-removed-variables:
 
 Removed variables
diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
index 16320d3db..131465ff9 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -16,6 +16,10 @@ New Features / Enhancements in 4.3
 
 -  New core recipes:
 
+-  New classes:
+
+   - A ptest-cargo class was added to allow cargo based recipes to easily add ptests
+
 -  QEMU/runqemu enhancements:
 
 -  Image-related enhancements:
@@ -37,6 +41,13 @@ New Features / Enhancements in 4.3
 
 -  Miscellaneous changes:
 
+   - Git based recipes in OE-Core which used the git protocol have been
+     changed to use https where possibile. https is now believed to be
+     faster and more reliable.
+
+   - The os-release recipe added a CPE_NAME to the fields provided, with the
+     default being populated from :term:`DISTRO`.
+
 Known Issues in 4.3
 ~~~~~~~~~~~~~~~~~~~
 
-- 
2.39.2


