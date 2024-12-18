Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97460E77187
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 20:06:37 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.114637.1734552393724107723
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 12:06:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=ix+xPCpU;
 spf=pass (domain: baylibre.com, ip: 209.85.160.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-467a3f1e667so38798271cf.0
        for <docs@lists.yoctoproject.org>; Wed, 18 Dec 2024 12:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734552392; x=1735157192; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OjL4ucmNYHuWfLR6u5SbrfpyTouzcWKNP00lSYhY6K8=;
        b=ix+xPCpUe7G0mjOy+c67Im+iV5C9zxpjN9dt1dmfHEgtw0KF2WIgJay+LACSKlwAmG
         mRPbR6iCdUyHmD/EcAbpdb6RuvtedgX16Fb1gSzCGYyFSMTngFFF/tPlN2QWwVN04k4v
         Jaj3W9KCZB1QUGX0yxZRDFk6UWH8hbxXa8yU1i8qlX0i4ZkcXxzQoKf7ldN0/4VoZNki
         7n3kkP2duvFxkVR48dTVBRCfUvPJqkWYdCeNyHYfYaxb9vzkTuxO8xM1AFqdBp/EfPqD
         ONwkRZwKsV37wWJ8dz8ummDxJXrCkfWF0x/b+PXcNkiyuBTWSSkVJOEMFJ7LBpr4zrO+
         kzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734552392; x=1735157192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OjL4ucmNYHuWfLR6u5SbrfpyTouzcWKNP00lSYhY6K8=;
        b=s3KZY+ri622c+m6WfmKzGNa53sUVnP+gxqC1eH9Zlx8rC0wpgKBlJvbDzyFHviGC1W
         SCaf/5zpEyOZ2k9L/5uz0Jxh59Sp0PVfu1ypiKCvcfnu5OolouOL11y7d0cbwAD+gqUU
         j1qypmixfAa7N89DIJIgATfXge2/qympxHW/ctPKvumpGi92P9n42LnmBl0hmGqg55Zn
         m23W2oYhftqHuTbBHBuJyvNIje2A3GwFE/uopPrTAadBqK9q93zP97W3pQ9tCsmgOUSW
         bkIvd87x1IoZr7O3QUu6Ll1dvVhHNaZVnNwH5p/6qkUvq/zDOygWJmFYZulYY64BEWzt
         WniQ==
X-Gm-Message-State: AOJu0YyVFCr3soauNrl7McNV4sDpKQXPIYtsFryTp7FAUlBlUBQOzBYn
	jx7Hmgg+OSHpmPRcyuyOHzx+ka8fdlsMUKPfWKlH5Q1RI+goDonORDMVG4XPqiIT1HfDXF8MePT
	d
X-Gm-Gg: ASbGncvdZFwLdINXazmLsgfaSxXyYHTSn0thoIWYubEOziXSNn8ggo+p8M8iA0+FH8g
	zftgaB2NUK0ppkFDnMRnQaLfWYL8aQQIix6fKD7dUbrrUB/pmgGTleMHRcn+bdStVqtggr1GLlG
	/v6nYnQXgSi426sx0a33lQaa64FaM5NooIq7QSOb4Zge8tI0iNS40hfmSPORo/i7mGd9IlBdfTI
	QYe4Qi+zkhfx/ycMsesPSKnC3bZFNyAmrK+n3Thqlb4ILoOcVz9TnHm9cWo5b4yH9BfHhQs5AGM
	i/uHOu7E1hRA6urC
X-Google-Smtp-Source: AGHT+IFDNHmyT7Ykcbo1nJnG6qGK0olPoWHrTaGVfKNJgHB7RHWg7Sn2j4mFdelTW1yqprDDWFK+Gg==
X-Received: by 2002:ac8:5a48:0:b0:467:65d4:7e07 with SMTP id d75a77b69052e-46908ec9ab6mr63075351cf.53.1734552392492;
        Wed, 18 Dec 2024 12:06:32 -0800 (PST)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2c6bb9bsm54503231cf.10.2024.12.18.12.06.31
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 12:06:32 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: docs@lists.yoctoproject.org
Subject: [docs][PATCH] reproducible-builds.rst: show how to build a single package
Date: Wed, 18 Dec 2024 15:06:30 -0500
Message-Id: <20241218200630.823299-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Dec 2024 20:06:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5983

Add a bit to the "Can we prove the project is reproducible?" section to
show how OEQA_REPRODUCIBLE_TEST_TARGET can be used to test a single
package (rather than the world build), as this may be useful for
maintainers.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
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


