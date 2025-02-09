Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12282C0219B
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 23:32:53 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.39924.1739143970746524747
 for <docs@lists.yoctoproject.org>;
 Sun, 09 Feb 2025 15:32:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ry7Z4E6P;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43634b570c1so24665245e9.0
        for <docs@lists.yoctoproject.org>; Sun, 09 Feb 2025 15:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739143968; x=1739748768; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xYwUep+EyoipBYbK5nKiOerkrtGs1L4B3F6sEj2JkYY=;
        b=Ry7Z4E6PDdiKAIZgkNvFdZeLn38dAzCLtBzrQtwlNNdmoaSiHQqYEnG5+PqaVk5mmN
         znKODI0K2uf6VB9+7J5YZNfikVU54qYm4F6eSdGZwuGsiUnDasR8p/B8zhyXuEUyOpGQ
         31JVMYqpnQvaORdAq7hx4x43+riEmWW+RE7VU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739143968; x=1739748768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYwUep+EyoipBYbK5nKiOerkrtGs1L4B3F6sEj2JkYY=;
        b=azmQrR6anTXyL4jhOwpTKUM1JBTAjyMfZfQzyismk4/f5oQqncDwO2lprnckXYyn0K
         nUIcqCgojhrurd83hUXj9+AqOH6LXRjT8zuffHEki1N42GWZuyxR99Nc8Q0MV6bieFUM
         kl7qdDMZCj1wO1SpG3ArL3L3jF6iBnmB475OVTW3UAB/Juq+CVqF2Izd+SN/knYgEXmb
         6QFeL7qlY9dTTdExvTythHPYAyh9e50Utc2R54yJn7uvb7azXFXdecOjXEWwOzvFqLXI
         uNjrt6Ht9MXLK2GLapWaywaeK+J3MWtUmhTEh63HrjEWk4sT02k/ThEQ3BgxTxfxqm6q
         LI0A==
X-Gm-Message-State: AOJu0Yw5fQQ29DFRwFU3AA0wYrj+C3L6PwAYeRZe9KaJH1my07zR+0nS
	31pYPxJEO2+vYmseZbnmjeN2dF5/GjfZOEBPerPN+Ek/kl2ntg/sFxklA4/3Hjo/iV5QwB8hZRT
	D
X-Gm-Gg: ASbGncuzL3B7u1lZi2T/GGpYOEWeR/gk49CFpOYVfrVd1TkhnHtt38UtM0yp4bp/HtL
	CIaKdvScy2vxwxQ6d8dEeczO2pTTZpb+xI8gVOjNnjCTplVg4NTnxOcvwMamIdAksl/N5uS8znx
	jLrWpxzYO86NjEpOi6vmKXnpTen7AYI2upY3xlybhuBq3iin7pSR27kk+KT3BEvYOeFKmxykx2z
	C8KdGDSUaQ7z+N9OoRIWDlmhJWyG8YJgNfAH55y8nOvINe9mo70qe22G1xxOv1JVM/mKS6VyJFb
	AUfupUl+JTKe1DilkCvbitW4XDSpYiN8kZGKLFpNY0upZUGJ9iiicnZji92Kkbro0Hn1ayBaEGO
	5rYJXZRYy6gboaOTH/B7CEg==
X-Google-Smtp-Source: AGHT+IHOG6ppSsVNAZbrcWGWTJ3oZWY+r1VR5cJOnZt9s1ZGUDn1A9HHmWXIrk3OzF9WnxLWDdVubQ==
X-Received: by 2002:a05:600c:46cb:b0:433:c76d:d57e with SMTP id 5b1f17b1804b1-43924972d1amr99856285e9.5.1739143968565;
        Sun, 09 Feb 2025 15:32:48 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef000367a1a7f22add27b.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:367a:1a7f:22ad:d27b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm17027895e9.40.2025.02.09.15.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 15:32:48 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v3 1/4] ref-manual/variables: document OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
Date: Mon, 10 Feb 2025 00:32:42 +0100
Message-Id: <20250209233245.1397155-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 09 Feb 2025 23:32:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6313

From: Yoann Congal <yoann.congal@smile.fr>

This documents the variable used in the "automate testing a single
recipe's reproducibility" feature [YOCTO #15701]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v2->v3: Quentin's review:
* s/target/target(s)/
* Removed Guillaume Reviewed-by (given privately)
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index adbef69d8..2f1937632 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5807,6 +5807,11 @@ system and gives an overview of their function and contents.
       For additional information on how this variable is used, see the
       initialization script.
 
+   :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
+      Set build target(s) for build reproducibility testing but activate
+      :ref:`shared state <overview-manual/concepts:shared state cache>` build
+      for most dependencies. See :doc:`/test-manual/reproducible-builds`.
+
    :term:`OEQA_REPRODUCIBLE_TEST_PACKAGE`
       Set the package manager(s) for build reproducibility testing.
       See :yocto_git:`reproducible.py </poky/tree/meta/lib/oeqa/selftest/cases/reproducible.py>`

