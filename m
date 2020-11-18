Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web09.21884.1605694035885248103
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2020 02:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OSC5Hbll;
 spf=pass (domain: konsulko.com, ip: 209.85.128.68, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f68.google.com with SMTP id s13so2137108wmh.4
        for <docs@lists.yoctoproject.org>; Wed, 18 Nov 2020 02:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0/XlUppyoLldGDHC8zwIA+hMN6vvisJXYFDe9wm+2Yw=;
        b=OSC5HbllmxA0BqijFNbgjTQlp8i0eYBINB7FnTNC02FgAmpuBEflvOIw7BeU+5hJoS
         lVjDzs/M2gFOt8TT4qmPArlx5mLo4I2eGwa7jj1L2YiqlVOLaASiMiZ+JcTSYRAT0ar1
         F0tvP/Pw2Y0CGxIfpObWFgBytV59Lu2Th1Pvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0/XlUppyoLldGDHC8zwIA+hMN6vvisJXYFDe9wm+2Yw=;
        b=m/tJbEQK+kYIdzVp4DSWbkDsXVwTKW/JZNBPbIJq4gYXUCxmm/4ACiMpJdwcaB/RtT
         NFLCjz3Q/hI0zwyERCnx5I8Bstc33ucF22gxHq6h8SSpfkCRdTeWvtthU8vQ1zc7Mvly
         uRcZwbxGqydcMoqYIfC1aIU5XKbSFoz1GoBEj6CpwnKtJvnui2wjtP5XQWABOCf3XGuR
         iluNkZrXD5GaMbSMpsyUHntARIhz0TI5hPUPekiSLdgqdOrVV3jatVxpWSqVw1G/9DZZ
         GrUQA6q5wOO7rAmn9GkiFJjRQRbx53Ug1aNxZhzGCy8XuKS0giPi5rzcbeCvkuJLHgvy
         3yQw==
X-Gm-Message-State: AOAM5333Ssh7oKQfDbPY0tuB3vZPQL+j67hRw8g72BFRIjb+Up1/0rLe
	ZyueazOWVIXdqd8ebQc0WUDBTFrhxHD5rA==
X-Google-Smtp-Source: ABdhPJw6wMpYgN0Zc4YUW4hYG2kFDA9vk+/Y/8P7ZvLQ45Tc5+KHFtV1KzvYH7gK5QCkOWtjPu6zoQ==
X-Received: by 2002:a1c:7d13:: with SMTP id y19mr3448374wmc.98.1605694033838;
        Wed, 18 Nov 2020 02:07:13 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id a128sm3013391wmf.5.2020.11.18.02.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 02:07:13 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 6/9] dev-manual-common-tasks: Describe how to handle patch feedback
Date: Wed, 18 Nov 2020 10:07:02 +0000
Message-Id: <20201118100705.3656-6-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201118100705.3656-1-pbarker@konsulko.com>
References: <20201118100705.3656-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The contribution guidelines would benefit from a brief section on how to
address feedback from patch reviewers and how to re-submit amended
patches. The information here is based on my personal experience and on
the existing notes on the "How to submit a patch to OpenEmbedded" page
on the OE wiki.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 .../dev-manual/dev-manual-common-tasks.rst    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 42163cb9b..61e66f464 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -10981,6 +10981,28 @@ reduce the burden of patch review on maintainers.
    Asking about the status of a patch or change is reasonable if the change
    has been idle for a while with no feedback.
 
+Responding to Patch Review
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+You may get feedback on your submitted patches from other community members
+or from the automated patchtest service. If issues are identified in your
+patch then it is usually necessary to address these before the patch will be
+accepted into the project. In this case you should amend the patch according
+to the feedback and submit an updated version to the relevant mailing list,
+copying in the reviewers who provided feedback to the previous version of the
+patch.
+
+The patch should be amended using ``git commit --amend`` or perhaps ``git
+rebase`` for more expert git users. You should also modify the ``[PATCH]``
+tag in the email subject line when sending the revised patch to mark the new
+iteration as ``[PATCH v2]``, ``[PATCH v3]``, etc as appropriate. This can be
+done by passing the ``-v`` argument to ``git format-patch`` with a version
+number.
+
+Lastly please ensure that you also test your revised changes. In particular
+please don't just edit the patch file written out by ``git format-patch`` and
+resend it.
+
 Working With Licenses
 =====================
 
-- 
2.20.1

