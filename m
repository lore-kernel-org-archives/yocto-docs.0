Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC99FC4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 13:43:46 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.83875.1701956621780437103
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Dec 2023 05:43:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=AKyVZWJM;
 spf=pass (domain: snapchat.com, ip: 209.85.208.54, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-54dcfca54e0so782387a12.1
        for <docs@lists.yoctoproject.org>; Thu, 07 Dec 2023 05:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1701956619; x=1702561419; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Q7VTFt+or2q90t/4LUlME1HbegcYBtVF2dKa7Rihu4=;
        b=AKyVZWJMtfDl4QoO5OSfs0U550qM+gvXOwdxxIHOOCc1wsjUZToLARNz5W0gRtN3Ap
         8W4xhs0VS8BvCryifU3fd8ObTickhWmB1/c3co3WV7RTrftG8qq0WV5ZKWbxB4hWYFVG
         O2cgu7+hH8U2VL0Irnh5Wzq7zqnT75XlrJTtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701956619; x=1702561419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Q7VTFt+or2q90t/4LUlME1HbegcYBtVF2dKa7Rihu4=;
        b=o31UgJat4C5Tf0C8N6OKcDTPduHbylut2FaOO76Vh1FfGH3Xxra4VmBn9IATJd7T+Y
         gxptcKx06W3v5LehQLXZKueKha+jYmzVkTfwkY7AmmEXZFW1YeMe4FhQbN2VqV4nBfC3
         FpyTg61cBMEGH7i8WmQHisIbDneD0J3DSRsSv17JL422I29j+8YCfnVb22JQbDymUDeF
         agtLpgFXPOEKaN8elAECBOmrkDwrS5kCGTNFBl01VjTBxq3ZR3qs62Mmb6s/elteCpxC
         SuvPKLf/9Kz16EsH1jQcdk78nZ0a2ns7OjkUePwddQCn7Ail3pJ5oYcp4zqCmF3dwji/
         l9xQ==
X-Gm-Message-State: AOJu0Yzw9pZ0+6oRtmATNMJsRIPszqmxq2v3C/mKlUbBxisL5s32gg9S
	ee1/FhwlxsRDcih/7yFutN2WM0wevnAY5iAl6BLOsQ==
X-Google-Smtp-Source: AGHT+IEPiMAMWUVw7tN6mwe4NxWQBHu2qgwqTNIqO7ZKLsvk2JyjrUnG214y9LKiEqtZQgOzVRdt8Q==
X-Received: by 2002:a05:6402:1805:b0:54c:4837:a651 with SMTP id g5-20020a056402180500b0054c4837a651mr1445454edy.62.1701956619305;
        Thu, 07 Dec 2023 05:43:39 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id gy4-20020a0564025bc400b0054ca1d90410sm787139edb.85.2023.12.07.05.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 05:43:39 -0800 (PST)
From: ecordonnier@snap.com
To: docs@lists.yoctoproject.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] manuals: document minidebuginfo
Date: Thu,  7 Dec 2023 14:43:22 +0100
Message-Id: <20231207134322.3185149-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Dec 2023 13:43:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4664

From: Etienne Cordonnier <ecordonnier@snap.com>

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 documentation/dev-manual/debugging.rst | 15 +++++++++++++++
 documentation/ref-manual/features.rst  |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index fea2cb30a..75dc53649 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -1173,6 +1173,21 @@ To support this kind of debugging, you need do the following:
    Consider that this will reduce the application's performance and is
    recommended only for debugging purposes.
 
+Enabling Minidebuginfo
+======================
+
+Enabling the DISTRO_FEATURES minidebuginfo adds a compressed ELF section ".gnu_debugdata"
+to all binary files, containing only function names, and thus increasing the size of the
+binaries only of 5 to 10%. For comparison, full debug symbols can be 10 times as big as
+a stripped binary, and it is thus not always possible to deploy full debug symbols.
+Minidebuginfo data allows, on the one side, to retrieve a call-stack using
+gdb (command backtrace) without deploying full debug-symbols to the target. It also
+allows to retrieve a symbolicated call-stack when using systemd-coredump to manage
+coredumps (commands "coredumpctl list" and "coredumpctl info").
+
+This feature was created by Fedora, see https://fedoraproject.org/wiki/Features/MiniDebugInfo for
+more details.
+
 Other Debugging Tips
 ====================
 
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index dd14339bc..1320c3a58 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -161,6 +161,9 @@ metadata, as extra layers can define their own:
 -  *keyboard:* Include keyboard support (e.g. keymaps will be loaded
    during boot).
 
+-  *minidebuginfo:* Add minimal debug symbols :ref:`(minidebuginfo)<dev-manual/debugging:enabling minidebuginfo>`
+   to binary files containing, allowing coredumpctl and gdb to show symbolicated stack traces.
+
 -  *multiarch:* Enable building applications with multiple architecture
    support.
 
-- 
2.36.1.vfs.0.0


