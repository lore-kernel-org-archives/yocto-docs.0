Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web08.39387.1606154634835797617
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 10:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=URGiJ5fx;
 spf=pass (domain: konsulko.com, ip: 209.85.128.67, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f67.google.com with SMTP id h21so94315wmb.2
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 10:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/jZE18zHHKkvsRZPh+ERqbDC744FdRA2aevturjdG9w=;
        b=URGiJ5fxaa+DzrbZlaLblTuduBw6U2/HbAD7srPaiR88N03YBONow50QxqYaBvK/XL
         /dUmPkUQ05yAxSsQ0sXxbkSZh0z/r9GpzCefYr061EfA6tyuliV5RuOs15SzrqP9XkIn
         0LMDbba0ILSnJK8uwiss7++92Wsmnhg3aLE4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/jZE18zHHKkvsRZPh+ERqbDC744FdRA2aevturjdG9w=;
        b=NMgYTbYv2Hmpx6EpZZQ/vxeUS0Ig21HG1/b4E2i6BeZyBjSFBfS1hdyVGv/62KdWC2
         Jn0tucqPMOaTbXMik7OzWkX3yUuvNQCr1FTxvOfNCNZHXIFsblhMNuQC/6rDJIOkBtVL
         /gkONozDFoLZ60jNQCOcOeL+Hla3HW8YqXZXgHObCh+4JOcxN2GcfoFohwHuyWM7evvV
         4KgEA+72DOdbUC5cChuVVIRbDmspMG/gUYBq+JXUB8xgu59oO1hFVkXJN2c4NBQpDUrX
         UVx4BTJt4+LXhzabvXMvYsQbZQNijdYaWObvVDqkb6UU+z3iGQMkkHF1LEdRsKW8beE9
         U+3w==
X-Gm-Message-State: AOAM5334J4CUeAbgupwykAyTLHn1gWdv+2KHapIJfaBPnTrr8Gx3tTBV
	0zqraiblcq/uy9op1lzKufiu6J+ArBBG+w==
X-Google-Smtp-Source: ABdhPJzJOArV94FNL0ZWYPBrAEQPJbZbLsWpM7fTNld+9DczfyMssa1bw1E1y09OOqYtG6ehoQWxSw==
X-Received: by 2002:a1c:96cb:: with SMTP id y194mr127331wmd.62.1606154633142;
        Mon, 23 Nov 2020 10:03:53 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id b18sm6238337wrt.54.2020.11.23.10.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 10:03:52 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH] poky.yaml: Define DISTRO_NAME_NO_CAP_LTS
Date: Mon, 23 Nov 2020 18:03:41 +0000
Message-Id: <20201123180341.2159-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows us to reference the branch name for the latest LTS release
(currently dunfell) in the text. When the current release is an LTS,
this variable will be equal to DISTRO_NAME_NO_CAP.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 documentation/poky.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index e184fa829..57da0a7c2 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -2,6 +2,7 @@ DISTRO : "3.2"
 DISTRO_NAME_NO_CAP : "gatesgarth"
 DISTRO_NAME : "Gatesgarth"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
+DISTRO_NAME_NO_CAP_LTS : "dunfell"
 YOCTO_DOC_VERSION : "3.2"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.1.3"
 DISTRO_REL_TAG : "yocto-3.2"
-- 
2.20.1

