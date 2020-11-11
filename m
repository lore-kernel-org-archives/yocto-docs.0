Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.9033.1605110889371662208
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 08:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=o3DJgk0Q;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id k2so3067778wrx.2
        for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2020 08:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qT1TaQEdYyMO1485I0PnFyRnywBxlxyBbYjLYxpUsOQ=;
        b=o3DJgk0QTvbk0H6wc7y0w1F/nsIN7hOHzmDJN8sJaKN5ESNsmyAbWGcCNlehqiPmnZ
         /ltACIUnYn5ZtviS8b+P1NFzmRkOuqgAbYPeGMcIYUQEWNjzSH1CCMO3LIygabOewbbw
         0iKHzG29hur/RsH2PrBaYCBtyffPUkUoCdV6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qT1TaQEdYyMO1485I0PnFyRnywBxlxyBbYjLYxpUsOQ=;
        b=IMXdnwhYcE5nZ2ULWbPRrVGBordDX3nqXbIAeA4OE+GFwSTzQM8Svut/zpqL6GMcCs
         fMXFiZhiAjIr+27cgfdJ1r5iddE45F0wIufgpo9fZXSD2+vmj0PwDq6reimLIxKGBrKm
         5QvKRJwW/D5aAJX55eAjpg7+nCrBCv3PqyUsCRoyK5JXdfeTcgHFb0XQradzlcU5Y2O2
         K2+DGUTIOZ69PBbovsvBuWJO3y6DTskQKcOkPqqEf22aLdaE+RlovPwMJf7RAwWzrEvy
         +TOQ9qFl8fH/wG+5y2xHowxNtAsm8ZTfUsp7KJguHIKPLpYxIPpyf3kY7BdpOjS02grI
         uDrw==
X-Gm-Message-State: AOAM533hubAXKWHxEGGgZ3i8FMAao9JIB5pUXh2cDaarZBl/7wGZj4PL
	7jBAxpm4P56a88W5pzDWU6Jxq+2L9CrCGg==
X-Google-Smtp-Source: ABdhPJxfDImAErEYzaVTeVC5vgldFjL67ZLI+Q0X4X4nWp6QJDtG7v4JQ2rR+sB2UEjg/pJ/5BVAQw==
X-Received: by 2002:adf:ebcb:: with SMTP id v11mr30282979wrn.408.1605110887534;
        Wed, 11 Nov 2020 08:08:07 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76132-clif11-2-0-cust249.12-4.cable.virginm.net. [80.7.160.250])
        by smtp.gmail.com with ESMTPSA id u195sm3174617wmu.18.2020.11.11.08.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 08:08:07 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 2/8] dev-manual-common-tasks: Update & move patchwork reference
Date: Wed, 11 Nov 2020 16:07:54 +0000
Message-Id: <20201111160800.5669-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201111160800.5669-1-pbarker@konsulko.com>
References: <20201111160800.5669-1-pbarker@konsulko.com>
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
index 698b27377..2f28cce62 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -10689,16 +10689,6 @@ Other layers may have similar testing branches but there is no formal
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
@@ -10993,6 +10983,19 @@ without using the scripts:
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

