Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0615ECDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:38:39 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.215209.1697549909004871059
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 06:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=JCF72Dvd;
 spf=pass (domain: baylibre.com, ip: 209.85.222.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-777506c6109so262319085a.3
        for <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 06:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697549908; x=1698154708; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=S3vfSy1C3WwEVPKdq6XlJBPrXQYjVx2w7kNRAhHqjXU=;
        b=JCF72Dvd4peZI3WE15dAdE24uNvnqlB9E9oYixc8xhVbvxK/XgeJRTnaG48ce56BDR
         9AyBE1zP9hFNcH9NjrMXRxwmdPqV0S+IuqjNw+jIIbdfm4jtWVX2kwVHLBk/ACRb2EbW
         RJypaHgv/2/iKEsob4yqhxKF8y/LLj8p6XhTYRmJzGHycdTQuivYJRhRSPG6YS+JPALZ
         NhYC6MaGtkDNQAJU5OjMmZQFYlpum+XFZfIy33ZdfmcaAN2WsVgnQ8Rb3Xo7ZoKZXGsg
         g0BbOQOzUp3c5iL3R/5z3/MsGMcCugiwUCN2PylvSCWhCx9g6c7dFRdaa6wtH1/box8E
         NJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697549908; x=1698154708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S3vfSy1C3WwEVPKdq6XlJBPrXQYjVx2w7kNRAhHqjXU=;
        b=rtrKcM5wQXHSm5gPdr9ZNOJ0M+JrDjmOcmsCzBfePxd0dulhhfWZXmRhuS7vvXreTC
         LRh/rpN1IJBsQ0fQxLN5dkq0r1nXoKZiUipMVhDVFRpMVn/qUeFbBadAyG2xQxVNPB2u
         p/271O+lQBovaVRWup8DgGxHK/RxzyQcG/jjTpq7bqVHDbPK64O6gqUYKO1Nm8cvQBvV
         Oe04/kaXvm3pOQJG8i03lmVTuEBgtBstzLPTM/uXVKziFu0gslrnNuMaHS3MaFibjJUc
         7DFZBYa9sVNaFZWFfXEPM/XvYtteKitStXDj6s4UuP3Ex6pE4fSrDBek20FzYdMz1m5l
         8FSA==
X-Gm-Message-State: AOJu0Yw4rGqiV025ElgkLh4dJG07V2WDErq8W8wfX/XMTpELgtNxX+Pf
	I4RXlNF1JpeShJ2AXl8MaZti7gS2CayTHEn8gXQqmQ==
X-Google-Smtp-Source: AGHT+IFY0F8HWTPe5Wm2a964XMaN+rLQGfi1e3UuPI1R+6nVQGsNeJN3vvFTB3tJbMK+VvJHsAOnjQ==
X-Received: by 2002:a05:620a:4720:b0:76c:da86:3169 with SMTP id bs32-20020a05620a472000b0076cda863169mr2536997qkb.40.1697549907732;
        Tue, 17 Oct 2023 06:38:27 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id x3-20020ae9e643000000b0076dae4753efsm648445qkl.14.2023.10.17.06.38.27
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:38:27 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: docs@lists.yoctoproject.org
Subject: [docs][PATCH v2] contributor-guide: add patchtest section
Date: Tue, 17 Oct 2023 09:38:25 -0400
Message-ID: <20231017133826.2248800-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 13:38:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4402

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 moves the patchtest section to before "Sending Patches via Email",
cleans up some confusing instructions, and improves highlighting to be
more consistent with the rest of the guide.

 .../contributor-guide/submit-changes.rst      | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index cda2d12d2..8a300c366 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -279,6 +279,40 @@ Here is the general procedure on how to create patches to be sent through email:
    If necessary, rework your commits as described in
    ":ref:`contributor-guide/submit-changes:taking patch review into account`".
 
+Validating Patches with Patchtest
+=================================
+
+``patchtest`` is available in ``openembedded-core`` as a tool for making sure
+that your patches are well-formatted and contain important info for
+maintenance purposes, such as ``Signed-off-by`` and ``Upstream-Status``
+tags. Once you have generated the patch files and run ``source
+oe-init-build-env`` to initialize your workspace, you can run ``patchtest``
+like so::
+
+    patchtest --patch <patch_name>
+
+Alternatively, if you want ``patchtest`` to iterate over and test
+multiple patches stored in a directory, you can use::
+
+    patchtest --directory <directory_name>
+
+By default, ``patchtest`` uses its own modules' file paths to determine what
+repository and test suite to check patches against. If you wish to test
+patches against a repository other than ``openembedded-core`` and/or use
+a different set of tests, you can use the ``--repodir`` and ``--testdir``
+flags::
+
+    patchtest --patch <patch_name> --repodir <path/to/repo> --testdir <path/to/testdir>
+
+Finally, note that ``patchtest`` is designed to test patches in a standalone
+way, so if your patches are meant to apply on top of changes made by
+previous patches in a series, it is possible that ``patchtest`` will report
+false failures regarding the "merge on head" test.
+
+Using ``patchtest`` in this manner provides a final check for the overall
+quality of your changes before they are submitted for review by the
+maintainers.
+
 Sending the Patches via Email
 =============================
 
-- 
2.41.0


