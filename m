Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA511C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 14:08:47 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.84935.1701958121014206078
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Dec 2023 06:08:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=GsK5t/CY;
 spf=pass (domain: snapchat.com, ip: 209.85.208.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-54cfb03f1a8so1274075a12.2
        for <docs@lists.yoctoproject.org>; Thu, 07 Dec 2023 06:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1701958119; x=1702562919; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tvzzYVaMXk7EP/mj+FPhwSJqJSKXez8pJLectx2P0bc=;
        b=GsK5t/CYEfq+RoVjw0K8NgIkcvzhlrwpx7i7VQWBUusJWVjmhfDOKNyZncjhVMT2JP
         nlVqTGyZjYE75rKR7Y6Gtt/f4itIcIL96oMC70HvU46CY+VR6gxBiz0wDChaheH2B8ll
         jEWzNjHIQ/4TtHFvdbVQ9HWbUOuOYWW5Crk2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701958119; x=1702562919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tvzzYVaMXk7EP/mj+FPhwSJqJSKXez8pJLectx2P0bc=;
        b=mUkhbh9FTPSCNjNfPKSuFHn2kAb4DsZxJhXWGsPf7RfNZXE707J2qiwAMb2fshs3Cm
         0O6pxR97qsoQOa01ptSIt5OjorjDQR26C8PpUVVoaecQB/TW3lMOZWROeI7BSYoXECDr
         YW8akprfssXuf01v5xE30bbGw6/n1g/slWzSUd4mHOn6fUN+xGnaJl7nuuqUFpqhrSjh
         B13b/0IN4S95IqAUK8/+U+0WfarHgiofa3psZDFsFmk3hkmXJCqiqnbRGzQsmm8PKJVD
         K0+Y8UFLIPAUMnEquh9cCySgG1oQ6pX1lNROeccHSZhKE740fuUtY1L5gJ3xQO+uRUwd
         ZbVw==
X-Gm-Message-State: AOJu0YyBmMfjQhWRzD690j2BWSQhJxmQibvc3BRcZpBJeXccWBMhJK/Q
	dF1cnoLW0QHBN5EG7hgJ+jiLTxfyHrfwj8lLOBI+cQ==
X-Google-Smtp-Source: AGHT+IHrooTjw3zePqLCGRjZhgtpd1Tjhs9BgKR9sodUJ2ohV4F7v9wjmRwD2CWwo699RQkCo+5ZtQ==
X-Received: by 2002:a50:ccd3:0:b0:54d:c9c0:96e4 with SMTP id b19-20020a50ccd3000000b0054dc9c096e4mr615582edj.40.1701958119165;
        Thu, 07 Dec 2023 06:08:39 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id g16-20020a056402321000b0054afcab0af2sm806898eda.59.2023.12.07.06.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 06:08:38 -0800 (PST)
From: ecordonnier@snap.com
To: docs@lists.yoctoproject.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [docs][PATCH v2] manuals: document minidebuginfo
Date: Thu,  7 Dec 2023 15:08:28 +0100
Message-Id: <20231207140828.3201054-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Dec 2023 14:08:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4666

From: Etienne Cordonnier <ecordonnier@snap.com>

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 documentation/dev-manual/debugging.rst | 15 +++++++++++++++
 documentation/ref-manual/features.rst  |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index fea2cb30a..12694b01b 100644
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
+binaries only by 5 to 10%. For comparison, full debug symbols can be 10 times as big as
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


