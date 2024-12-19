Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58764E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 14:52:34 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.130504.1734619947964553803
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 06:52:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=x2y/fGzi;
 spf=pass (domain: baylibre.com, ip: 209.85.160.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-467a6781bc8so6255131cf.2
        for <docs@lists.yoctoproject.org>; Thu, 19 Dec 2024 06:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734619947; x=1735224747; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DD1Yc/4hm86xX+H8Ddw6xDHCIo53/7A3Rl18NHBaf7g=;
        b=x2y/fGziuQftSqMA2HJ0c4fp0CbrcToZS3Y6xpTIyRIAf22yOVsqoShFvxZyQH7EDz
         3+Gxjx9hzkPLVPt/wwOH3Hi7RNhNbFUwJwWr/QIASoUgkOGCysMw9Pjez7cL6SCos8UD
         W4Vzu2sI8QiB8Xy3O6agZxeXVw/M5tc76yUWIiTFTi6NvVfgk3IYWmWj4+VwlU6B/2dK
         f7Zrjv8ENB4M82E8L3wAk+oaeMxebQNXSvAjXNl3u93Jk8fdZ41eitFIUOMigXepg6SZ
         ZxgPB2FwI/j4r6lraNnXFoJX1SMGlBcRfJR6Ynp9SMiX4VTd/o38cbDB8NaRTLovTltZ
         foKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734619947; x=1735224747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DD1Yc/4hm86xX+H8Ddw6xDHCIo53/7A3Rl18NHBaf7g=;
        b=mtrySB6fn4SvGsX2wlqLagKfEOPQwBUMUiXZm35HgnN7j9OsxyfT++M+tRqv47kBXg
         SICTRqUTesPxYBqD3bBiDOkpwmHafmnMZexhsC+LVQES2UKjEGn4wxQN05PfZMXNL8+F
         ZgbyGOo5WaXwQRTCvyqkYFM77HyHX+nJlKBpwh3lfq7Qj4dOfBBcYtbX7ofG4EmcXO4I
         J0QV7T92wO2i/jXrqa2OfRWc7syQJ5rq9y1GmMSLgizKACWrm3kmHbKs+gqZ2oJ4f/L/
         3W4kQmpewH7rESE7aLmN4olUmdHow2fVFU5z0Pd5WNu5SSFpftzlv5nsVu6UbLYmgzI+
         Aw2w==
X-Gm-Message-State: AOJu0Yw5docZngZjvWR1/YyoT9eUahe6PMkLHqvZYcziQ9tp27EhNFzZ
	U4a+gBZtOhVBF0qtsW1B2b3immNnL+uSBqiXz4sx2z3xaIQV0iovg45/89pX906tn5bIJ7btTEG
	l
X-Gm-Gg: ASbGnctHr2lRPu+l4gi6tyUzfqIBFIqlN2S/tXUbKdG17yCeXC/RfKNL8ev3IH7SvXh
	aD0S9a92jrJljGH1EmdtXORx+Qtmn7UevjzHNQbyq4z8OX5GZKBIcctSAugdHK1+NAddauYRitH
	TtECk8D/Cy9i34pIe3tpKw3ACiHpW8xvre45/fEQclGSjPTjdVMsB59yp8BJawXsz2bAq/1xEDl
	8IUrs49PCKz6NihgL7fsvpdCv5l2OMGPKaSpCT+Z+ovDmJJN6AoPL7ofp7dpH+L+7HAQuYeRq59
	d0xbT+UMJttZSqPl
X-Google-Smtp-Source: AGHT+IEYtBjjb62TdZ3ZVVR2xxuTsjGHhvUlCBO+9ufGdUzmbHoQf9Gu6dQ/Ht+GKvYYGF8Cqhr1eQ==
X-Received: by 2002:a05:622a:1308:b0:466:a584:69f8 with SMTP id d75a77b69052e-46a3a884e60mr62130781cf.43.1734619946757;
        Thu, 19 Dec 2024 06:52:26 -0800 (PST)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb16ca0sm6616751cf.65.2024.12.19.06.52.26
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 06:52:26 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: docs@lists.yoctoproject.org
Subject: [docs][PATCH v2] reproducible-builds.rst: show how to build a single package
Date: Thu, 19 Dec 2024 09:52:25 -0500
Message-Id: <20241219145225.3367912-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Dec 2024 14:52:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5987

Add a bit to the "Can we prove the project is reproducible?" section to
show how OEQA_REPRODUCIBLE_TEST_TARGET can be used to test a single
package (rather than the world build), as this may be useful for
maintainers.

[YOCTO #15619]

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 adds the Bugzilla ID to the commit message, since this is logged in the
system already.

 .../test-manual/reproducible-builds.rst       | 22 +++++++++++++------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index 91f94a5c7..d581155eb 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -91,13 +91,21 @@ run::
 
    oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds
 
-This defaults to including a ``world`` build so, if other layers are added, it would
-also run the tests for recipes in the additional layers. Different build targets
-can be defined using the :term:`OEQA_REPRODUCIBLE_TEST_TARGET` variable in ``local.conf``.
-The first build will be run using :ref:`Shared State <overview-manual/concepts:Shared State>` if
-available, the second build explicitly disables
-:ref:`Shared State <overview-manual/concepts:Shared State>` except for recipes defined in
-the :term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS` variable, and builds on the
+This defaults to including a ``world`` build so, if other layers are added, it
+would also run the tests for recipes in the additional layers. Different build
+targets can be defined using the :term:`OEQA_REPRODUCIBLE_TEST_TARGET` variable
+in ``local.conf``. For example, running reproducibility tests for only the
+``python3-numpy`` recipe can be done by setting::
+
+   OEQA_REPRODUCIBLE_TEST_TARGET = "python3-numpy"
+
+in local.conf before running the ``oe-selftest`` command shown above.
+
+Reproducibility builds the target list twice. The first build will be run using
+:ref:`Shared State <overview-manual/concepts:Shared State>` if available, the
+second build explicitly disables :ref:`Shared State
+<overview-manual/concepts:Shared State>` except for recipes defined in the
+:term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS` variable, and builds on the
 specific host the build is running on. This means we can test reproducibility
 builds between different host distributions over time on the Autobuilder.
 
-- 
2.39.5


