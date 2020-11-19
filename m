Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.6980.1605779933771318161
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 01:58:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=z0ewJ3+J;
 spf=pass (domain: linaro.org, ip: 209.85.221.52, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f52.google.com with SMTP id l1so5721146wrb.9
        for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2020 01:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KO5hts58KP21zqKlEW1+SJFt7CeXTOWyxMkbtfgtOsU=;
        b=z0ewJ3+JMlauUABO+nJoNB8xcwAk0icFXnyEGj5d+LTZ5RkkOBJuyyjdi7knvYYzxq
         My8Ji9Dcd5PmOWnv1sBQ5UF0lU5kzrzvarFJ4KAReszZQO+26KTU6+fG+OcbCkmVbPqm
         rVgqQoq+0zYAcnKoRO/2us9xBzh9R9JyicOtTd57/0/5Iduyf2M8Y1fsjIVPMB9Mr4EL
         MCT09sIoVMAcKAFpAnI9k6hTtNcqDMXBm1W9R/BA6UePinqap69tDBe3yT8KbPnDkyDN
         GSOoaFNYa8XUNqumBz4lp4H6jywO45UolwC+m1zScwfpGvdPtgPP58LKeV/jc4w1+1pO
         Scvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KO5hts58KP21zqKlEW1+SJFt7CeXTOWyxMkbtfgtOsU=;
        b=PPhg4ZRnCUbcESE5Ss6iknIMT7kar3k6A0VAsA4xBBrUvdssAK+Eum1OKQo5NA1Vq7
         VdnT7N/YhUeZ6PAVrThFY5XCbGTd8+U8is9v445oBrraE6RsK9SXPrdnSfNkDbXbrwx/
         MmaqSy3DzTxYdhKpAI3Qmq9Ya4aNHUvC9qdSJoVvd5SeeDCeDORMelR4Ztd06JMTNAG5
         RmS2sqivO4erKDa40Dxw4Ld3opSPhilPUoOOcYfEdj1NMozItgEjq4Y4IB8U6UzSkKoc
         n862/jtVrxZWEBciyodgvzrIvM/FtaXIFoioZnGR+hQoN8j7bFvXffule19Z6fc62zpg
         9EqQ==
X-Gm-Message-State: AOAM531yjzOCdKvX+/0W0wwwOHlYQ99xZf0HcqBTS5bxzJCyAw3c2BKp
	b6vigb8EnLBzt51lt++0X9p88v6gDOf//Mfm
X-Google-Smtp-Source: ABdhPJzbBC4wAmGLMZn0Ff4b1DQncD95F0o9C1DJzdXEmpRidcFI8/Kov/endQyBWqnlJN8PdhqEyQ==
X-Received: by 2002:adf:9cc6:: with SMTP id h6mr9400665wre.341.1605779931944;
        Thu, 19 Nov 2020 01:58:51 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id o14sm34725288wrw.4.2020.11.19.01.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 01:58:51 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 03/11] ref-manual: replace labels with references to section title
Date: Thu, 19 Nov 2020 10:58:26 +0100
Message-Id: <20201119095834.284864-4-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
References: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/ref-manual/faq.rst                   | 4 ++--
 documentation/ref-manual/ref-devtool-reference.rst | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 8c2b34be5..576863eec 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -207,7 +207,7 @@ section in the Yocto Project Development Tasks Manual.
 **Q:** How do I disable the cursor on my touchscreen device?
 
 **A:** You need to create a form factor file as described in the
-":ref:`bsp-filelayout-misc-recipes`" section in
+":ref:`bsp-guide/bsp:miscellaneous bsp-specific recipe files`" section in
 the Yocto Project Board Support Packages (BSP) Developer's Guide. Set
 the ``HAVE_TOUCHSCREEN`` variable equal to one as follows:
 ::
@@ -220,7 +220,7 @@ default?
 **A:** The default interfaces file provided by the netbase recipe does
 not automatically bring up network interfaces. Therefore, you will need
 to add a BSP-specific netbase that includes an interfaces file. See the
-":ref:`bsp-filelayout-misc-recipes`" section in
+":ref:`bsp-guide/bsp:miscellaneous bsp-specific recipe files`" section in
 the Yocto Project Board Support Packages (BSP) Developer's Guide for
 information on creating these types of miscellaneous recipe files.
 
diff --git a/documentation/ref-manual/ref-devtool-reference.rst b/documentation/ref-manual/ref-devtool-reference.rst
index 9b9ddf53f..ad8889ed2 100644
--- a/documentation/ref-manual/ref-devtool-reference.rst
+++ b/documentation/ref-manual/ref-devtool-reference.rst
@@ -438,7 +438,7 @@ revision to which you want to upgrade (i.e. the
 forth.
 
 You can read more on the ``devtool upgrade`` workflow in the
-":ref:`sdk-devtool-use-devtool-upgrade-to-create-a-version-of-the-recipe-that-supports-a-newer-version-of-the-software`"
+":ref:`sdk-manual/sdk-extensible:use \`\`devtool upgrade\`\` to create a version of the recipe that supports a newer version of the software`"
 section in the Yocto Project Application Development and the Extensible
 Software Development Kit (eSDK) manual. You can also see an example of
 how to use ``devtool upgrade`` in the ":ref:`gs-using-devtool-upgrade`"
-- 
2.29.2

