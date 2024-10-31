Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF20D767E9
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 16:56:39 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.17508.1730393793170098224
 for <docs@lists.yoctoproject.org>;
 Thu, 31 Oct 2024 09:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=XGwAb7MJ;
 spf=pass (domain: baylibre.com, ip: 209.85.128.44, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43155afca99so14339195e9.1
        for <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 09:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730393791; x=1730998591; darn=lists.yoctoproject.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4n/Gg1JnuXBIk4IMJplrznWJqonQXXzJTzd0kzIUh0E=;
        b=XGwAb7MJUonIIIZmBxKUEMlfO3KZTsMz/8pmBJKH5UDw5qIQVtXfw/6tJ2Zn4zXnBZ
         XamlnTPeKUFdE+UomI3WlI4GIbQUpyq5gsLXnDF31+rZ7n04CaunhBIzCEFMhn8U42ew
         hiXTzNAs36Z2GIdxURX58Jk99vRMvB8fkjTCpwvrNFqU/4tcnp8O4biYihFNf2hJMzYw
         RJ6AmBrwPyST0vqsqOYzVmvecpA2fvJwXkipowWLeg73M3P0SdpeFY2H+WHSXE1Bzldz
         gRreVurcFFDfxK+kG4Gb4HvpgKWjVAWmmqOucsqsDwDCxd8yTpRJcY532rqmGxIQmiVD
         CBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730393791; x=1730998591;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4n/Gg1JnuXBIk4IMJplrznWJqonQXXzJTzd0kzIUh0E=;
        b=uVslV9RtjrGxddQ+4TPSc95L9mW0AcaV37loTqlbH6vNycK3/Gq2kdcEugc1l5Lslh
         Vz1Wxs7EIg2Po61jh30I9RUtNA6hB2+j5vkTNZTr+uSrSd0UANHiS1pamcqLw/yMSQaO
         7klmlMb0YYePdyMQMkGwKAcAuFJ04GfKzJRJOcJ43yj6940Uw9rN6aEDq0J/U/1GjR9e
         V2myNh5gcoTgqkvkoQR1pAseMVjeU/4yJ8J2Ob1nKn/3/BeAPM4qe5Di7EUbIneY8vnS
         E9AeWXVTVejUZfMMde+/qBkavE7GZxKCUOZ+GHjv33xekFWSdmRFh9XI5SHV/s1sX5w1
         ZuwQ==
X-Gm-Message-State: AOJu0YyHcbfQC6hHSWzBENdiMu0hJMmChWozzNkQyf8hcGAl1nXVTQOI
	HbuBufH+6QbtV/ksNsdtQLq0akGm32N8CpvzOvHxbuJ0NIo9niloM/Qbij2oJOowjSxqjslxXzY
	RByc=
X-Google-Smtp-Source: AGHT+IGXgAXs4Beanu48Q7ZnKxOoBWmYY/jDMzpQ7JR8Ix9EGGhSF1qbCOu/MuibrX4Q+vgx64MvyA==
X-Received: by 2002:a05:6000:2a2:b0:378:8b56:4665 with SMTP id ffacd0b85a97d-381c14d495cmr2654311f8f.24.1730393791592;
        Thu, 31 Oct 2024 09:56:31 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e747csm2660525f8f.64.2024.10.31.09.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 09:56:31 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 17:56:19 +0100
Subject: [PATCH 4/5] ref-manual: variables: add SIGGEN_LOCKEDSIGS*
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241031-add-bblock-documentation-v1-4-32b89093bbda@baylibre.com>
References: <20241031-add-bblock-documentation-v1-0-32b89093bbda@baylibre.com>
In-Reply-To: <20241031-add-bblock-documentation-v1-0-32b89093bbda@baylibre.com>
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 16:56:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5640

Variables SIGGEN_LOCKEDSIGS, SIGGEN_LOCKEDSIGS_TASKSIG_CHECK and
SIGGEN_LOCKEDSIGS_TYPES are used to lock specific tasks to specific
signatures. They are used by bitbake -S <lockedsigs> and bblock, so add
documentation for them.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 documentation/ref-manual/variables.rst | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 07ed143ac5606617c720301ac6621355a341f90a..8cfb978e795e43e3ef25f3e18e11baf7c2a28d54 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7880,6 +7880,39 @@ system and gives an overview of their function and contents.
          might break at runtime if the interface of the recipe was changed
          after the other had been built.
 
+   :term:`SIGGEN_LOCKEDSIGS`
+     The list of locked taks, with the form::
+
+       SIGGEN_LOCKEDSIGS += "<package>:<task>:<signature>"
+
+     If ``<signature>`` exists for the specified ``<task>`` and ``<package>``
+     in sstate, BitBake will use the cached output instead of rebuilding the
+     ``<task>``. If it does not exist, BitBake will build the ``<task>`` and
+     the sstate will be used next time.
+
+   :term:`SIGGEN_LOCKEDSIGS_TASKSIG_CHECK`
+     Specifies the debug level of task signature check. 3 levels are supported:
+
+     * info: displays a "Note" message to remind user that a task is locked
+       and current signature matches the locked one.
+     * warn: displays a "Warning" message if a task is locked and current
+       signature does not match the locked one.
+     * error: same as warn but displays an “Error” message and abort.
+
+   :term:`SIGGEN_LOCKEDSIGS_TYPES`
+     Allowed overrides for :term:`SIGGEN_LOCKEDSIGS`. This is mainly used
+     for achitecture specific lock. A common value for :term:`SIGGEN_LOCKEDSIGS_TYPES`
+     is ``${PACKAGE_ARCHS}``::
+
+       SIGGEN_LOCKEDSIGS_TYPES += "${PACKAGE_ARCHS}"
+
+       SIGGEN_LOCKEDSIGS_core2-64 += "bc:do_compile:abcd"
+       SIGGEN_LOCKEDSIGS_cortexa57 += "bc:do_compile:efgh"
+
+     Here, the ``do_compile`` task from ``bc`` will be locked only for
+     ``x86-64`` and ``arm64`` but not for other architectures such as
+     ``qemumips``.
+
    :term:`SITEINFO_BITS`
       Specifies the number of bits for the target system CPU. The value
       should be either "32" or "64".

-- 
2.47.0


