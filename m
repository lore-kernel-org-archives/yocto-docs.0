Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CF1CDB483
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:38:39 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.215867.1697549909399447378
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 06:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=ju+an+gJ;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-77386822cfbso388246285a.0
        for <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 06:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697549908; x=1698154708; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AtaWj9vwBHrKA9sWAQMNs1Szk9HiPNd5t+2hWVW92CM=;
        b=ju+an+gJqu6k5sMu7gL0yKBYvUtSmdlKtJfxH2UQKhJF3o6++CjGUJLisTIG3x0Piy
         83Zc8DEq18zZrq+JEMjeWrJsamYjL2ohVtW/+Xe62h9r28OHCbEIkPMzDf+hx7tmWTki
         EEcIp/CDE9JYxGm0SDoPEpaMYFJe96Ud8DDNm5dkRMoGCerHyE3NcySJiyqKOOXnSziI
         26nMan8inap55SChSth8KXI0fehtOBhKEv6JRnsvKochVQTjs4v/Ha4gWqilNR8veU6n
         rxuqxgr07JCz5xTwo46py/FwhHOou8RZCAwcTTKoERyhS8sNzeqtAPl54C3ZFcDqyuJl
         G7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697549908; x=1698154708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AtaWj9vwBHrKA9sWAQMNs1Szk9HiPNd5t+2hWVW92CM=;
        b=dfeHIOlkBtfu0ZqpFFZBJbe9nVub8zAHSMsZTgbh4JhYJz5w2HLzbTpCvexu2HP34k
         4LsaO/6aRQs7gahJsOi3dRveQW2efz91RaBCVgsOQzvGV/4w3DQ+t9kUrN+iiNzzuap9
         TaTnPCgXijHQq7VyMWb+Q1Ibo6bHtJ/T9E37sNR9EKzaISxQCy5ZMkRhU7lCORiZzItc
         92KJFQV1ODxpIwRfQaIjCF+goBnCed7eJXlMp/LOLX3tvcAox3UPvJcRG9oFD3Rv/NU1
         2ZLFpvp7Qb2DCj7CLH7h9dgPIedfAkBrTr752QOkFmJx/0X/HlcvMqFypkfHMtFnpyGf
         bDbQ==
X-Gm-Message-State: AOJu0Yxl8yhGQb4Sh9GyEGaYc5sSfzQvxXWBQCAXVT2IdqxFiWOIWJml
	ftJz/H9Aib+ZZv2NIGgP70FcKuWtM8EjiXLEBHrc3g==
X-Google-Smtp-Source: AGHT+IFkbFNRV6ZegS9fnR8uSo25xpXUUtm2+fUpy1h3KLJrFpdzgRp/WLKnNZZGcDVYvzwDEHwSuA==
X-Received: by 2002:a05:620a:3905:b0:777:68cb:9bd4 with SMTP id qr5-20020a05620a390500b0077768cb9bd4mr2602091qkn.12.1697549908295;
        Tue, 17 Oct 2023 06:38:28 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id x3-20020ae9e643000000b0076dae4753efsm648445qkl.14.2023.10.17.06.38.27
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:38:28 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] contributor-guide: add patchtest section
Date: Tue, 17 Oct 2023 09:38:26 -0400
Message-ID: <20231017133826.2248800-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017133826.2248800-1-tgamblin@baylibre.com>
References: <20231017133826.2248800-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 13:38:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4403

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
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


