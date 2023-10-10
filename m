Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8AACD80DB
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 13:53:09 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.91712.1696945984298259601
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Oct 2023 06:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=uTFyRpdk;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3248e90f032so5590040f8f.1
        for <docs@lists.yoctoproject.org>; Tue, 10 Oct 2023 06:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696945982; x=1697550782; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ajlay+dlTsH7LbsEj8oYZhxnR85yFSD6WfFKhTrXS3g=;
        b=uTFyRpdkb7Iu4sJhOUVxakbBuFKUAonfrVH2tTSc7NsXGEXc9asesAF2A6kCEQp4CN
         +H6c8R5W9cox0I6ObsNntz4Yyy4kjj3ZettDHs9ojKEaPWgKa5A8YoZHSB8wGtWcZpy+
         2RT0K2S3PjWnE3M0yabQMyIlAcpYR/60uy4s4D+iDJjfZhnhiiEc9ysm7zwA0hETGWw6
         a/wzz+v9oSRGQDgMB7ey9mtRIR5DuyrLE6f0Z4dsnxxEoQWc4bXIOsfK8Kw1I6omj/1V
         +5DK35HTYXtkYM6L4FoOJjcEI2gS4QgmxdgEQYpK4aCeMIx/VkUotGnoBnpOo6r+CjzR
         hrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945982; x=1697550782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ajlay+dlTsH7LbsEj8oYZhxnR85yFSD6WfFKhTrXS3g=;
        b=Uc3JmxLuK22xKndeRy8geVesaQKxPXf44a+PB0jHZXJ59vKyUAKo0aW84leFc/ZpjM
         0taZlu1D364QIGKZizvozrdOfTVA/jM3NqMl60mPJ0spqnDkNspYVhqTHPM8V41NLxun
         7y75xuwhrRO8C/Fc6eRrsm7eRGccaHRkcY3eqWcCvORSmK5S2b580LSz6b690mZA0qfo
         piQDgl5Of8QfSdmkLxmIWVB4lPkawAvzOp3SBEacy3EtET0EQ/RTF/IQWhc+bztJLNe4
         CX4jKCPTTzcOxMdmKCmXknWIULLOmIDIV8F28el5kfdExFyqEczILK1cO5JZuQnZxU6h
         36Jw==
X-Gm-Message-State: AOJu0YwwdUDtWLajpI+AGJ46y72i4tSAvcV9SFZC7jVLLthqem08w1mw
	Zr3vhOOvwb6iz0xAxcdrtH7ogtVwhtpk94lMRDE=
X-Google-Smtp-Source: AGHT+IFocOPi5fFXFaK6nUZ3DN51tL9OaChkusaGoVGDqoV0IBF+ve+XxmkvvVOPslHmXUcZwJc81w==
X-Received: by 2002:a05:6000:1f15:b0:32d:1c5d:b47b with SMTP id bv21-20020a0560001f1500b0032d1c5db47bmr1464329wrb.57.1696945982010;
        Tue, 10 Oct 2023 06:53:02 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d68c4000000b003232f167df5sm12784579wrw.108.2023.10.10.06.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 06:53:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v3] ref-manual: Add documentation for the unimplemented-ptest QA warning
Date: Tue, 10 Oct 2023 15:51:40 +0200
Message-Id: <20231010135139.3995226-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Oct 2023 13:53:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4335

From: Jérémy Rosen <jeremy.rosen@smile.fr>

Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
Note: The code documented here has been sent to ML there:
https://lists.openembedded.org/g/openembedded-core/message/188892


 documentation/ref-manual/classes.rst   |  3 +++
 documentation/ref-manual/qa-checks.rst | 11 +++++++++++
 2 files changed, 14 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 3f0d4844e..c7a5e9a63 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1480,6 +1480,9 @@ Here are the tests you can list with the :term:`WARN_QA` and
    also inherits :ref:`ref-classes-features_check` in order for the
    requirement to actually work.
 
+-  ``unimplemented-ptest:`` Checks that ptests are implemented for upstream
+   tests.
+
 -  ``unlisted-pkg-lics:`` Checks that all declared licenses applying
    for a package are also declared on the recipe level (i.e. any license
    in ``LICENSE:*`` should appear in :term:`LICENSE`).
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 4a02e7206..63b2ecdc4 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -789,6 +789,17 @@ Errors and Warnings
     use a relative path rather than an absolute one, or to pick up the path from
     runtime configuration or environment variables.
 
+.. _qa-check-unimplemented-ptest:
+
+- ``<tool> tests detected [unimplemented-ptest]``
+
+    This check will detect if the source of the package contains some upstream-
+    provided tests and, if so, that ptests are implemented for this recipe.
+    See the ":ref:`dev-manual/packages:testing packages with ptest`"
+    section in the Yocto Project Development Tasks Manual. See also the
+    ":ref:`ref-classes-ptest`" section.
+
+
 
 Configuring and Disabling QA Checks
 ===================================
-- 
2.30.2


