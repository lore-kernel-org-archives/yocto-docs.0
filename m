Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE11CE7C4C5
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 14:37:03 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.20164.1696430222849629296
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Oct 2023 07:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=ca3JdYAV;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40684f53d11so7409815e9.1
        for <docs@lists.yoctoproject.org>; Wed, 04 Oct 2023 07:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696430221; x=1697035021; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fQshZ8HAYHAzQgOAQ23b0jo+tNxKkNRWCFxhxlD+Mnw=;
        b=ca3JdYAVmhVttt0K83P7ex/u9Y/ErJrtQ8kCMZKrwHFLemDI15zEe29CTfs4CIQB+c
         syey1Wh14INy5/z0KUPSfyOvp3vFLjs+tEcrYp5Fo35AbF+u6eEgNuu4gMOkUiKlZQ6z
         qATYw7yzcRT165m/7U4m7KcSXm8xBk0O/seMIRlTZwvuwPmCGDnf2zePQwux8vH8iWLn
         vcwf3LcetQcOBICohPMbTp/7eplwK5gDWwmjikPCK65KKTiJCMStXsZuVhWDx/UTRzDK
         KCR9Uly7oPEKNwBTO2tynzsDJ9rsMa1cPl14gNmJh/fnIFAlBNNsJXkC/f1kuw0e/OwJ
         OXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696430221; x=1697035021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQshZ8HAYHAzQgOAQ23b0jo+tNxKkNRWCFxhxlD+Mnw=;
        b=vqYGC5Mzfhk5YEi7mxewSXrKauUZIUwH9kCw+61jDAb7155EA6kEpifDDZg8dibZ2d
         838c6HJhlCNJJxRKs41TX3NkrFrBSkjv2epnSBrqDa4EfuiPzy57kA7MI1X1kxqOpCmw
         iF+g0MypxwnHzvssp3HyVySOen4GtqR9mipXt7O5+NUwPQQxMkzKHI4Nrt1mHxI+oKji
         CuFYN2AqGW8T0vFxdcjybCM002emaCRvKMRtkr24KHL2lAh4LJyn4nkbS3GQKGWuJUcY
         PPwvEVCz9AytTy8MKl6x1Q8CEMVjM/jWpxVG1sl+TUUQXEb2drj5AhPov8CybjRVmOoH
         Chiw==
X-Gm-Message-State: AOJu0YzMTu3GgBKfC9s1hqD1v8P7HChv2MZLcBHGxLZSuZkxwQtbQNDN
	AFqM4QdzsNjG2zVN1R7qhwpXpmLXxe5JgPazvlY=
X-Google-Smtp-Source: AGHT+IGD1OJWNiP3e/NNAniQh0jW5Fj01jHGOoo+rjUePsHOn7MT3Hbv8fD+kiV+TVYcttCarMrcOA==
X-Received: by 2002:adf:f48f:0:b0:319:66b2:6798 with SMTP id l15-20020adff48f000000b0031966b26798mr2429054wro.43.1696430221044;
        Wed, 04 Oct 2023 07:37:01 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id r7-20020a5d6c67000000b00327df8fcbd9sm4034924wrz.9.2023.10.04.07.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 07:37:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2] ref-manual: Add documentation for the unimplemented-ptest QA warning
Date: Wed,  4 Oct 2023 16:36:51 +0200
Message-Id: <20231004143651.1796870-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Oct 2023 14:37:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4306

From: Jérémy Rosen <jeremy.rosen@smile.fr>

Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
This is the v2 for the doc of this series:
https://lists.openembedded.org/g/openembedded-core/message/188680

v1->v2:
* Fix shortlog tag

 documentation/ref-manual/classes.rst   |  3 +++
 documentation/ref-manual/qa-checks.rst | 11 +++++++++++
 2 files changed, 14 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 3f0d4844e..3eede8c7b 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1480,6 +1480,9 @@ Here are the tests you can list with the :term:`WARN_QA` and
    also inherits :ref:`ref-classes-features_check` in order for the
    requirement to actually work.
 
+-  ``unimplemented-ptest:`` Checks that ptest are implemented for upstream
+   tests.
+
 -  ``unlisted-pkg-lics:`` Checks that all declared licenses applying
    for a package are also declared on the recipe level (i.e. any license
    in ``LICENSE:*`` should appear in :term:`LICENSE`).
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 4a02e7206..cc9afeb7c 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -789,6 +789,17 @@ Errors and Warnings
     use a relative path rather than an absolute one, or to pick up the path from
     runtime configuration or environment variables.
 
+.. _qa-check-unimplemented-ptest:
+
+- ``<tool> tests detected [unimpemented-ptest]``
+
+    This check will detect if the source of the package contains some upstream-
+    provided tests and, if such tests are detected, that ptests are implemented
+    for this recipe.  see the ":ref:`dev-manual/packages:testing packages with ptest`"
+    section in the Yocto Project Development Tasks Manual. See also the
+    ":ref:`ref-classes-ptest`" section.
+
+
 
 Configuring and Disabling QA Checks
 ===================================
-- 
2.30.2


