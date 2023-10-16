Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3E8CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 19:55:52 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.178185.1697486151875139457
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 12:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Z+9V7dz1;
 spf=pass (domain: baylibre.com, ip: 209.85.160.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4197fa36b6aso29049091cf.3
        for <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 12:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697486151; x=1698090951; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=F9I10pDOHcD0vVao6FfClI9LOJQDjT9t29DTLHumOIo=;
        b=Z+9V7dz1a/U/fS63DleFDEu0kZpqAzKGYr1HCGS3Ty4arlYSPDrgMwfjTZzkz3DXa/
         0BHYdz0JTXYYqJwNruN8d0yfYXmAA/KPGVUs2LKShuKetz6czwQ7lUg/u86vINvIrT5C
         qV/2RYwguQDIiobDMt8Yv8z52lOs/r/Xpe6RfKbiRhH11AGPjlorRdlhPnqC7vBBfRML
         mPlWsGwocMGiYSx/Ef3MZIl5VYjA1qCB3YCT2U7cK9PFPHzIqxJlvjkWt9uhuHFprGL9
         sZRXXX/RoCaMd72/oHChi8aZOrVjSb/rXKhRUG6eDRZIdjDgW1yoUHGUAgxFP6BAlL4r
         irXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697486151; x=1698090951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F9I10pDOHcD0vVao6FfClI9LOJQDjT9t29DTLHumOIo=;
        b=e1KeXv99EJrnl3ZBrCvH/41FfM3vz1PqMMjSg8kFF920GBKbZjyqgOeRvUqwTxDwUu
         Fgpbqz213MmsHPiJsp7eOAYSf/IDkdvvbmHRX7Jmjbd7+cvtm3voZB+Zv/zXq2B/a0x5
         GHGO270Hj5wfKQJsL+LuYqTQV+xTCBYoh8eKonHJXOPUgsxFOICv6TJKred868CnAQmg
         bNN2YMtG9CCcqLpQQUomYG+tA2qAkFVs//GJyC9CTGM1UCpZ4Qu9NplnxFbuOpNVfHaT
         GL1LxjMaUCnf6d4nEXs+A3dwNX+7g92ytEnSEub8EYtuyQw/7hFUXYmgTZq6LfE1QvYd
         fXbQ==
X-Gm-Message-State: AOJu0YyIJJFS8gohdiKcJxMOvYHvKhZFYOvne4k1MzgwkctKudATZ9Wd
	tBqtoK3/j5H7eF67yeGbWy5t75IN+WlNx6bodEI+NQ==
X-Google-Smtp-Source: AGHT+IE/pmDStCRuJ7UNwnenBYDg/l8LCncjYfDNk21kyuMdp2fTdxSnS4uaY1mapcUD+nQu9ZKH5Q==
X-Received: by 2002:a05:622a:14c6:b0:417:af73:9eb9 with SMTP id u6-20020a05622a14c600b00417af739eb9mr346185qtx.62.1697486150647;
        Mon, 16 Oct 2023 12:55:50 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id r8-20020ac87948000000b004166905aa2asm14440qtt.28.2023.10.16.12.55.50
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 12:55:50 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: docs@lists.yoctoproject.org
Subject: [docs][PATCH] contributor-guide: add patchtest section
Date: Mon, 16 Oct 2023 15:55:49 -0400
Message-ID: <20231016195549.2243243-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 19:55:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4384

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../contributor-guide/submit-changes.rst      | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index cda2d12d2..6dfb0ffec 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -401,6 +401,43 @@ Anyway, you'll also be able to access the new messages on mailing list archives,
 either through a web browser, or for the lists archived on https://lore.kernelorg,
 through an individual newsgroup feed or a git repository.
 
+Validating Patches with Patchtest
+=================================
+
+Patchtest is available in ``openembedded-core`` as a tool for making sure
+that your patches are well-formatted and contain important info for
+maintenance purposes, such as ``Signed-off-by`` and ``Upstream-Status``
+tags. Once you have generated the patch files and run ``source
+oe-init-build-env`` to initialize your workspace, you can run patchtest
+like so::
+
+    patchtest --patch <patch_name>
+
+Where ``/path/to/target/repo`` may (for example) be openembedded-core,
+with the actual patchtest tests being kept in
+``openembedded-core/meta/lib/patchtest/tests``. Alternatively, if you
+want patchtest to iterate over and test multiple patches stored in a
+directory, you can use::
+
+    patchtest --directory <directory_name>
+
+By default, patchtest uses its own modules' file paths to determine what
+repository and test suite to check patches against. If you wish to test
+patches against a repository other than ``openembedded-core`` and/or use
+a different set of tests, you can use the --repodir and --testdir
+flags::
+
+    patchtest --patch <patch_name> --repodir <path/to/repo> --testdir <path/to/testdir>
+
+Finally, note that patchtest is designed to test patches in a standalone
+way, so if your patches are meant to apply on top of changes made by
+previous patches in a series, it is possible that patchtest will report
+false failures regarding the "merge on head" test.
+
+Using patchtest in this manner provides a final check for the overall
+quality of your changes before they are submitted for review by the
+maintainers.
+
 Sending Patches via Email
 -------------------------
 
-- 
2.41.0


