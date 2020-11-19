Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web09.7089.1605779939420842356
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 01:58:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZGSd0kZy;
 spf=pass (domain: linaro.org, ip: 209.85.221.66, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f66.google.com with SMTP id c17so5706211wrc.11
        for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2020 01:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zYpOvWjFOa3lRltwy2KhHkjllDGer8yfm/JNthNRMaY=;
        b=ZGSd0kZyv0DZIN3D/xHf90mkLQQDLgvQNi9UskI915f30dweXcpxFLmYBkWFxYES9m
         WwvYcDLggJDSVhQRFuspY/Z8J2M5+eW768hQoE4qvoLUFgbA5Fh84dexWiNF11L3SPYl
         N1WciFEQ/9PUw+OfAun1cLV3mxSTqv+au0hNqp1vVUm+SMz0U6VG9DdUbE2YVkP4foru
         +4i2RpEO7yEpiHdjGyyWzTJQ88VRi6gBzSKXel2EGmRL+ecBl9YBMduWAW9cmb7LOhvT
         AGR9k2zBO8x04F46b3xSGdOv544b9lRlhyvZZoYu4qsS+oOuzel/tSS4qam+OSyM3CAe
         Iy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zYpOvWjFOa3lRltwy2KhHkjllDGer8yfm/JNthNRMaY=;
        b=uOoWSZFW8Hz6Av+5Fw02P5OFq76o8CMcwoSUo9LPdqJzRgAir43IlwWLa/GqZAELaL
         yO8bdzobaovJeQjXVq59OvVRLWXFWqvHBOwxeIM28xSStUMdRJQeoBKJBavjDeviGbX7
         UM3seP3ldsIAGfE4PcLVHwJPjPgZICyvt5PVrNOTWgPjz4Cft385fDtLJHaiXN7liEkq
         BnOFnma5v6wyRIo8GVic9pSaK/pAsfabpHwHpuFkXqfUzWZguef8S2W23dOUHkk0P175
         fo4Rv1d47enpjcJJ30QxFN5UCk6XWiuDBLnsIvUDNrmr2jEr7xlxUJVhogLslY1yIc42
         l9RA==
X-Gm-Message-State: AOAM5333c9aB0O16+sTOwm7sQ0yU/1PvrjBCVN6QPY8cJ4ORhGZrQcib
	ZPNyETRysjzyEREP0pvv/xtiMZ1yPt5dn9eJ
X-Google-Smtp-Source: ABdhPJw6KPwtFZ2rz2/s1EMQz3yg2aoQnlODquWEhl9Pp5g2b98CmOqXkL7mE4sSexztjgKElgSdYQ==
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr2934465wrt.19.1605779937352;
        Thu, 19 Nov 2020 01:58:57 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id o14sm34725288wrw.4.2020.11.19.01.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 01:58:56 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 08/11] kernel-dev: remove unused labels
Date: Thu, 19 Nov 2020 10:58:31 +0100
Message-Id: <20201119095834.284864-9-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
References: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/kernel-dev/kernel-dev-advanced.rst      | 8 --------
 documentation/kernel-dev/kernel-dev-common.rst        | 2 --
 documentation/kernel-dev/kernel-dev-concepts-appx.rst | 2 --
 documentation/kernel-dev/kernel-dev-faq.rst           | 2 --
 documentation/kernel-dev/kernel-dev-intro.rst         | 2 --
 5 files changed, 16 deletions(-)

diff --git a/documentation/kernel-dev/kernel-dev-advanced.rst b/documentation/kernel-dev/kernel-dev-advanced.rst
index b1537ccbe..ca049316e 100644
--- a/documentation/kernel-dev/kernel-dev-advanced.rst
+++ b/documentation/kernel-dev/kernel-dev-advanced.rst
@@ -4,8 +4,6 @@
 Working with Advanced Metadata (``yocto-kernel-cache``)
 *******************************************************
 
-.. _kernel-dev-advanced-overview:
-
 Overview
 ========
 
@@ -478,8 +476,6 @@ concepts, and presents a detailed example using a BSP supported by the
 Yocto Project (i.e. BeagleBone Board). For complete information on BSP
 layer file hierarchy, see the :doc:`../bsp-guide/bsp-guide`.
 
-.. _bsp-description-file-overview:
-
 Description Overview
 ~~~~~~~~~~~~~~~~~~~~
 
@@ -583,8 +579,6 @@ types of configurations. However, the Malta 32-bit board does
    include mti-malta32.scc
    kconf hardware mti-malta32-le.cfg
 
-.. _bsp-description-file-example-minnow:
-
 Example
 ~~~~~~~
 
@@ -925,8 +919,6 @@ after any ``branch`` commands:
 
       include mybsp-hw.scc
 
-.. _scc-reference:
-
 SCC Description File Reference
 ==============================
 
diff --git a/documentation/kernel-dev/kernel-dev-common.rst b/documentation/kernel-dev/kernel-dev-common.rst
index 830b3e88c..72d9d7879 100644
--- a/documentation/kernel-dev/kernel-dev-common.rst
+++ b/documentation/kernel-dev/kernel-dev-common.rst
@@ -1301,8 +1301,6 @@ created to hold the configuration changes.
 For more information on configuring the kernel, see the "`Changing the
 Configuration <#changing-the-configuration>`__" section.
 
-.. _creating-config-fragments:
-
 Creating Configuration Fragments
 --------------------------------
 
diff --git a/documentation/kernel-dev/kernel-dev-concepts-appx.rst b/documentation/kernel-dev/kernel-dev-concepts-appx.rst
index 681faee52..470d6ce1c 100644
--- a/documentation/kernel-dev/kernel-dev-concepts-appx.rst
+++ b/documentation/kernel-dev/kernel-dev-concepts-appx.rst
@@ -4,8 +4,6 @@
 Advanced Kernel Concepts
 ************************
 
-.. _kernel-big-picture:
-
 Yocto Project Kernel Development and Maintenance
 ================================================
 
diff --git a/documentation/kernel-dev/kernel-dev-faq.rst b/documentation/kernel-dev/kernel-dev-faq.rst
index d6be98a0a..424e62617 100644
--- a/documentation/kernel-dev/kernel-dev-faq.rst
+++ b/documentation/kernel-dev/kernel-dev-faq.rst
@@ -4,8 +4,6 @@
 Kernel Development FAQ
 **********************
 
-.. _kernel-dev-faq-section:
-
 Common Questions and Solutions
 ==============================
 
diff --git a/documentation/kernel-dev/kernel-dev-intro.rst b/documentation/kernel-dev/kernel-dev-intro.rst
index 971420b22..309c65b4d 100644
--- a/documentation/kernel-dev/kernel-dev-intro.rst
+++ b/documentation/kernel-dev/kernel-dev-intro.rst
@@ -4,8 +4,6 @@
 Introduction
 ************
 
-.. _kernel-dev-overview:
-
 Overview
 ========
 
-- 
2.29.2

