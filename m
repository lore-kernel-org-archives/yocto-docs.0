Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.22295.1605694032887588207
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2020 02:07:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=AvTyPdxb;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id l1so1546963wrb.9
        for <docs@lists.yoctoproject.org>; Wed, 18 Nov 2020 02:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E2hUlDTYUhMal1RpGLNRfvJEQxqMQadXfmBxAaI9EM4=;
        b=AvTyPdxbamgIALbb+p292PX1uiasVmX6caV9XM1iLtqIhwnu0bD1vapTFUfst7XuYy
         ies6Q9v/rBpi9/PQvzE8N6jyWXrYfT2GihnZxGxx/rZFVKbK9rpMagUKcr9TTnDlael+
         T923jbqKa4Cm9YDVQuLLeHwJPM2O+07J4kPsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E2hUlDTYUhMal1RpGLNRfvJEQxqMQadXfmBxAaI9EM4=;
        b=b/9Qm7IjMAp0t36NlPc8e983Igof9nKdPIrmKnHrxMP9OccZpLhV3S48ZlGoI75qZB
         g9PibhQpJeJI/GjfJx05/XOlEL+Sp6h1pDuWt7S15d68+VeMXdwdKzjGrcHm1KrubHfI
         /0v54w0h+tFGyPNVlm+KcgvYh8mPdUaz27zDtAk4l1pw36rG4cxh81ViQG/2OW8aDxmG
         j2d4qTvGxQXr3wHHiaw9FsM7GRFvpvadB3r6WqdXo156KYPJcndnxPoBs6e0mknQZHuF
         PfKAgXK4UkHHci+UExSQ4oD9YjVlwF7KWH34bRhddWksV0E7cDl5hXIPmpxrMzsvUXZJ
         d9Fw==
X-Gm-Message-State: AOAM531ca0NDhGTSvMxtvJQ8pdRGU3iAjBf9NsyTq8bQrbD5Rov8ZCHQ
	B/FHFpD9g7Z1nsx9KQ54xxjf5nsZLk0MCw==
X-Google-Smtp-Source: ABdhPJwGLRto3EjM4IjagbWZpqvAhAaD6kEsvIC292/fZrVz+XTrIU5GG0DX6KrYuPMjaGqnPgK6wA==
X-Received: by 2002:a5d:4591:: with SMTP id p17mr3966325wrq.361.1605694031248;
        Wed, 18 Nov 2020 02:07:11 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id a128sm3013391wmf.5.2020.11.18.02.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 02:07:10 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 3/9] dev-manual-common-tasks: Update & move patchwork reference
Date: Wed, 18 Nov 2020 10:06:59 +0000
Message-Id: <20201118100705.3656-3-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201118100705.3656-1-pbarker@konsulko.com>
References: <20201118100705.3656-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a link to our patchwork instance and note how submitted patches are
checked for common mistakes. This note is moved to the section on
submitting patches via email as that is the place where most users will
run into patchwork/patchtest.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 .../dev-manual/dev-manual-common-tasks.rst    | 23 +++++++++++--------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 6f526c203..d53f68cc1 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -10687,16 +10687,6 @@ Other layers may have similar testing branches but there is no formal
 requirement or standard for these so please check the documentation for the
 layers you are contributing to.
 
-.. note::
-
-   This system is imperfect and changes can sometimes get lost in the
-   flow. Asking about the status of a patch or change is reasonable if
-   the change has been idle for a while with no feedback. The Yocto
-   Project does have plans to use
-   `Patchwork <https://en.wikipedia.org/wiki/Patchwork_(software)>`__
-   to track the status of patches and also to automatically preview
-   patches.
-
 The following sections provide procedures for submitting a change.
 
 .. _pushing-a-change-upstream:
@@ -10991,6 +10981,19 @@ without using the scripts:
    command, see ``GIT-SEND-EMAIL(1)`` displayed using the
    ``man git-send-email`` command.
 
+The Yocto Project uses a `Patchwork instance <https://patchwork.openembedded.org/>`__
+to track the status of patches submitted to the various mailing lists and to
+support automated patch testing. Each submitted patch is checked for common
+mistakes and deviations from the expected patch format and submitters are
+notified by patchtest if such mistakes are found. This process helps to
+reduce the burden of patch review on maintainers.
+
+.. note::
+
+   This system is imperfect and changes can sometimes get lost in the flow.
+   Asking about the status of a patch or change is reasonable if the change
+   has been idle for a while with no feedback.
+
 Working With Licenses
 =====================
 
-- 
2.20.1

