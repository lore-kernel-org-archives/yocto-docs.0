Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.6981.1605779934828483638
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 01:58:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Siu85ntK;
 spf=pass (domain: linaro.org, ip: 209.85.221.45, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f45.google.com with SMTP id m6so5734741wrg.7
        for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2020 01:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9eFtRiq7a+T3erRm0NXvGojbDUue5sJJXjRiKa0Mv3w=;
        b=Siu85ntKgv9iiW8y3t9VsS8eeAIKhzT0ixcC6Bxuaxd+jY3BCUPe28gyg3UN5AlHAv
         fgqJDTkcDs9d9mfVubvfI/ztzyJKIfd4OUS7SS/qHt8QUkrhwCjbR4EFOA84q08QjzQ6
         ovYLiFPn34tH0U/xpA64CvSqBWMvi4VlbsqSBGoEl2xiG+hB94uY7IICRSOvZi807E8p
         ZKVdkhgSITMWCozdNTTF7H221ana2yD+Qj4vDUtDOJbZ13vztL+wqUzeUfzfR2ZpxAcY
         2YFF/b5jWr9Q2eL9AE8H3oXij0kP5ltay7twFYFAi2J4WeqE2+QtynCOb5uPNLJq7snp
         wUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9eFtRiq7a+T3erRm0NXvGojbDUue5sJJXjRiKa0Mv3w=;
        b=l5sqoXYooMB4Gt5pILIyRKF8DWeYBGJXWSrLV7rVU2GPmo8L0zbtfGf8i0vgXZbeyt
         OXZn5AUVgK2rRn7O5SB7cEAorG231j/g9cyok4tf1V4WUwGcroj3gfY6aMV6L38Dy6i/
         uyjEvgtqheQtxgP9bFEsF62QHMdLo9fu3VceGMVtJrY0iqg34xit5NtocL+JolSRLBoe
         5caxuBiXcT8zNpQrBl3kU8WZblwKz3pn2xUbgXY/qa8gCewVUaCougW62OWI40OPnPCL
         Wwf75vPxkzNryW5HugV2uPRGCT4ZLrF9wDNjl7gN2xPfdJlaeqqTzg5q54+FDEToPNNm
         azkw==
X-Gm-Message-State: AOAM533+u4VHn+U9VdbCy14EN1oyAMT6LfOjnvJOhuYl7KZMfVsgNSjI
	EVLJ9SobnZfSZDaeoYKMOkz07NBCWWB3XJIZ
X-Google-Smtp-Source: ABdhPJyO1444mkhvsm6mSz9LTX4I6Zpw82/SYdO2303T8aCQ/CrHouW55TI7wlTOyAwiMcQQEQfJLg==
X-Received: by 2002:a5d:4690:: with SMTP id u16mr9612305wrq.263.1605779932917;
        Thu, 19 Nov 2020 01:58:52 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id o14sm34725288wrw.4.2020.11.19.01.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 01:58:52 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 04/11] dev-manual: replace labels with references to section title
Date: Thu, 19 Nov 2020 10:58:27 +0100
Message-Id: <20201119095834.284864-5-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
References: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../dev-manual/dev-manual-common-tasks.rst        | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 27aacde60..201e187c3 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -1143,7 +1143,7 @@ necessary when adding a recipe to build a new piece of software to be
 included in a build.
 
 You can find a complete description of the ``devtool add`` command in
-the ":ref:`sdk-a-closer-look-at-devtool-add`" section
+the ":ref:`sdk-manual/sdk-extensible:a closer look at \`\`devtool add\`\``" section
 in the Yocto Project Application Development and the Extensible Software
 Development Kit (eSDK) manual.
 
@@ -1819,7 +1819,7 @@ Here are some common issues that cause failures.
    For cases where improper paths are detected for configuration files
    or for when libraries/headers cannot be found, be sure you are using
    the more robust ``pkg-config``. See the note in section
-   ":ref:`new-recipe-configuring-the-recipe`" for additional information.
+   ":ref:`dev-manual/dev-manual-common-tasks:Configuring the Recipe`" for additional information.
 
 -  *Parallel build failures:* These failures manifest themselves as
    intermittent errors, or errors reporting that a file or directory
@@ -3048,7 +3048,7 @@ The following steps describe how to set up the AUH utility:
 1. *Be Sure the Development Host is Set Up:* You need to be sure that
    your development host is set up to use the Yocto Project. For
    information on how to set up your host, see the
-   ":ref:`dev-preparing-the-build-host`" section.
+   ":ref:`dev-manual/dev-manual-start:Preparing the Build Host`" section.
 
 2. *Make Sure Git is Configured:* The AUH utility requires Git to be
    configured because AUH uses Git to save upgrades. Thus, you must have
@@ -3216,7 +3216,7 @@ As mentioned earlier, an alternative method for upgrading recipes to
 newer versions is to use
 :doc:`devtool upgrade <../ref-manual/ref-devtool-reference>`.
 You can read about ``devtool upgrade`` in general in the
-":ref:`sdk-devtool-use-devtool-upgrade-to-create-a-version-of-the-recipe-that-supports-a-newer-version-of-the-software`"
+":ref:`sdk-manual/sdk-extensible:use \`\`devtool upgrade\`\` to create a version of the recipe that supports a newer version of the software`"
 section in the Yocto Project Application Development and the Extensible
 Software Development Kit (eSDK) Manual.
 
@@ -3356,7 +3356,8 @@ Manually Upgrading a Recipe
 ---------------------------
 
 If for some reason you choose not to upgrade recipes using
-:ref:`gs-using-the-auto-upgrade-helper` or by :ref:`gs-using-devtool-upgrade`,
+:ref:`dev-manual/dev-manual-common-tasks:Using the Auto Upgrade Helper (AUH)` or
+by :ref:`dev-manual/dev-manual-common-tasks:Using \`\`devtool upgrade\`\``,
 you can manually edit the recipe files to upgrade the versions.
 
 .. note::
@@ -4196,7 +4197,7 @@ view file dependencies in a human-readable form:
    directory.
 
    For more information on configuration fragments, see the
-   ":ref:`creating-config-fragments`"
+   ":ref:`kernel-dev/kernel-dev-common:creating configuration fragments`"
    section in the Yocto Project Linux Kernel Development Manual.
 
 -  ``bitbake -u taskexp -g bitbake_target``: Using the BitBake command
@@ -8143,7 +8144,7 @@ associated ``EXTRA_IMAGE_FEATURES`` variable, as in:
    EXTRA_IMAGE_FEATURES = "read-only-rootfs"
 
 For more information on how to use these variables, see the
-":ref:`usingpoky-extend-customimage-imagefeatures`"
+":ref:`dev-manual/dev-manual-common-tasks:Customizing Images Using Custom \`\`IMAGE_FEATURES\`\` and \`\`EXTRA_IMAGE_FEATURES\`\``"
 section. For information on the variables, see
 :term:`IMAGE_FEATURES` and
 :term:`EXTRA_IMAGE_FEATURES`.
-- 
2.29.2

