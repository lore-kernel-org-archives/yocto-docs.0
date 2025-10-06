Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F229CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 13:48:09 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.34296.1759758485098175816
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 06:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G16cxmKz;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46f53f88e0bso9228155e9.1
        for <docs@lists.yoctoproject.org>; Mon, 06 Oct 2025 06:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759758483; x=1760363283; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cArmPFYDSWMSBsWKez0VX+JMH65RID4tu+oersb8Wao=;
        b=G16cxmKze5lhTzd/u2oIquuGE3z8bHL4n/BknHGUv+LsRg93OtWTCOBaXmX7DEbs8i
         a5jzrfCkpmGuEA3Gk15i7Iz2VjZCl9o117b+OSJEohcSyjzlfWy80ooC1EKXVU84oAUq
         0KSoGN2JhEaPUWWuvUuQyi2KB8diCETUVeprnXEJjozKmtIYETYlhBmmyt4Bwgi+a6am
         21+YaTZYTk/dAEoBwq7a+UBtoYX/k9temGLa2/5p49eepbO0xW9IR0hzTglbJa8rw5Ub
         ITLSd/3tFxA+yL9714yRRD1W+9MsoG9H2ua074X2Ad3PYNOO7NRCx+KnKZqg4wU1GB6I
         iF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759758483; x=1760363283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cArmPFYDSWMSBsWKez0VX+JMH65RID4tu+oersb8Wao=;
        b=eE6aydnjJ7leiMDSP56y5Tz9awJ7nX0EHKnAe0dHWZAbMcV8I/Nbnqexz0KcmRwz/l
         MNjGK2TSFohpFMyXaLapzVhkn4ZB1z6OFkE6j1a758Adpym0TCDmmgYytE2MoWNIRoqW
         mP9wu3m6jxSk+954bJF/odswNOPyivBsdf1xMb0fvYtTfJVFLaWFitNNanX7rBYFk9uo
         9qk4kTHtqPHpVLBLll19iiC65bRKLav6MaPCZdUj4wamI64plR6sX0Y64yYPfqnFy6kX
         ipsuKzi4Uh+qm+rFtYyz3dryELI+cmAoGBDihZt3Smm94SRfV+gHpOq7xx6UY/VaVbck
         sHTQ==
X-Gm-Message-State: AOJu0Yx8yN8lSzx0FZ0nClHruHPlI7YW5NA42h9lH7iLHUzxR5eLj9/5
	3+Sje/BAj7Sf5vFEUbnkO6H6UXlp8aFZyuXgpHT+KPwA5QUl6dGePUx9+6qc2w==
X-Gm-Gg: ASbGncvQUPwHg4WO1j9HHuH8oBLbl22vf8q4+tVMXwAgYllpgugHDSxB4sbIKX7hs8Q
	0b3a5FFC0kSclfhSwOWEdrCrQesvTrIBv6MEhTK4EXRKivxv+Pi30O3qK4B+99cYL1uTqJg1E8z
	2foFAfXkLjtLsEWwdBjGmQnxFwSGoH6zHjrZLsFkgFmEpWiJd+AHEh5ePVn5iDctnWWJ0pXZP/R
	bqrBIhZPPiLUrdfoQblfJkAcRDiwVFVY7XsGEn8/y6nXGjMZYDuB/VQ9QFMo0ewXr6YMRoBeIkR
	9oq/JUS1IYVWzXRCR68jAbruHm8qAzNHKeqpFhBRc9Ba2LTRH+dkByHEAS0yoNf4hiOibU3PyG1
	HTtNyw35Rlhh6GssTddwWMxr6Jyow6363fMt5nn44vkPgHhufj2sOYNt6DlcA9o1HkGDPNyn/50
	teERM+rkHIrQAW05wJN0Zv6NathGDjDBkTBBuvt6Ie+9zvIWoBn8Ag6kBEEmxLrbOJ37858wnZH
	X6R3iY0zJY0vyAQZZsF
X-Google-Smtp-Source: AGHT+IH5L81cYbWc3vsvo2/oK4Db2ioBRDUHRKmdT58ntEi2gEwK7MoDxA/swzsRYlgbN7cqVSSaDg==
X-Received: by 2002:a05:600d:41f3:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-46e7114444emr69706045e9.21.1759758483174;
        Mon, 06 Oct 2025 06:48:03 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8abe9bsm21180937f8f.22.2025.10.06.06.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 06:48:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] ref-manual: correctly document the difference between auto.conf and newly added toolcfg.conf
Date: Mon,  6 Oct 2025 15:47:57 +0200
Message-Id: <20251006134757.36206-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Oct 2025 13:48:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7657

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/ref-manual/fragments.rst |  4 ++--
 documentation/ref-manual/structure.rst | 15 ++++++++++++---
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/fragments.rst b/documentation/ref-manual/fragments.rst
index c0118876c..7fd08656d 100644
--- a/documentation/ref-manual/fragments.rst
+++ b/documentation/ref-manual/fragments.rst
@@ -94,7 +94,7 @@ Note that in this case, the fragment will be defined twice in
 :term:`OE_FRAGMENTS`, and the last value is taken into account:
 
 .. code-block::
-   :caption: build/conf/auto.conf
+   :caption: build/conf/toolcfg.conf
 
    OE_FRAGMENTS += " ... machine/qemuarm64 machine/qemux86-64"
 
@@ -103,7 +103,7 @@ In the above example, the value of :term:`MACHINE` is thus equal to
 
 When a fragment is enabled with :ref:`ref-bitbake-config-build-enable-fragment`,
 its name is automatically appended to the :term:`OE_FRAGMENTS` variable in
-:ref:`structure-build-conf-auto.conf`.
+:ref:`structure-build-conf-toolcfg.conf`.
 
 .. note::
 
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 1aaafcf79..0ef51fa4f 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -356,15 +356,24 @@ This configuration file is generated by :doc:`bblock </dev-manual/bblock>` and
 contains the signatures locked by ``bblock``. By default, it does not exist
 and will be created upon the first invocation of ``bblock``.
 
-.. _structure-build-conf-auto.conf:
+.. _structure-build-conf-toolcfg.conf:
 
-``build/conf/auto.conf``
-------------------------
+``build/conf/toolcfg.conf``
+---------------------------
 
 This file contains configuration variables that are automatically modified by
 tools such as :oe_git:`bitbake-config-build </bitbake/tree/bin/bitbake-config-build>`.
 This file should not be modified manually.
 
+.. _structure-build-conf-auto.conf:
+
+``build/conf/auto.conf``
+------------------------
+
+This file is intended for use by continuous integration environments, such as the
+Yocto Project's autobuilder. It should not be created or modified when running
+local builds.
+
 .. _structure-build-downloads:
 
 ``build/downloads/``
-- 
2.39.5


