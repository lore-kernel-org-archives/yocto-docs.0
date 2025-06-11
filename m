Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86536C61DB2
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 01:54:16 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.675.1749606846509018177
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 18:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=ayTArWN+;
 spf=pass (domain: limonsoftware.com, ip: 209.85.160.54, mailfrom: anibal@limonsoftware.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2db2f23f174so3527377fac.2
        for <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 18:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1749606845; x=1750211645; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AQcdn6cJjyGs4iRBThx5XUzEvAzVh9kg6lygZuabucQ=;
        b=ayTArWN+d0i5WAa6J0G8FG4KyRCNpBBa8flGPJ+yKogA6vexj4Tx80HBtQUOr2wb+N
         TEFFf2m8uufw99+Eim/HPurbivH1K3Rl8PqmFy+QJX2077Whbl8pAAoEgyt2QlIrjs2t
         udOUpUBhiSBj/nFrUtxLhOJcmx4WIaUwr7shRCQtzOS4dSRu3kJB0ndWOgMunWp/Ab7I
         ibmBtjWso/+knV9onfKIJ8IHPN52sIZXXwpnpAc6kcrf4UwYBEgSNLJPWsroXn2943rp
         xVr8tpTjiHUcNLIbrk0XXCE0jwOWuxO/eUk3lLEwNFZgudsZIRJ/4V7ZRCYx7aTZ3sJS
         U3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749606845; x=1750211645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQcdn6cJjyGs4iRBThx5XUzEvAzVh9kg6lygZuabucQ=;
        b=KvxAAvOiY85IBynQE7APToTz79puzRm71TyF+WV9jPbLPs9un5qH42spaXf9ibPrKu
         ljKhqprfDvLnQvxVC5lQ1ZjYrGIi6A6xzXFRXFNENBVygXWUCOx5IOqPpJb9hERyjD6a
         u3N6ryBjbpbGlGVxN1+T1OGx/uKSyZYPVu2zSCsO6mXd2rdZcIWNo6OmdLFqc7/DLEsZ
         AtalrRGQ6u2wKU3jq9JqMZ2SwDp2jKSpeh4MpCiUoC9NrrrOw8KphtnIeWYb7ra6wXFc
         b1LzZbYjdPVmydTWrh0dWtFqAQqXerzbc3iaGR41U0luWMxEiInNklhjd40f7N+4yrEK
         A7oQ==
X-Gm-Message-State: AOJu0Yx4/eulPsWTcLzWz/Vbp6EX5U1IodMpd6MyOSUgBMFCKaSqF15s
	j8/wQmrm32WI59e83rYtyALEVRCyYEzff8ezFBkIJt9qlzJTcDchz6SwAcJag9UQmToKgIr/fbA
	AjRw7xMo=
X-Gm-Gg: ASbGncvgmHETskeeoglybf2YjfpdZ+A4Ro/ta6AM0evGDQ+7g+PwXzVNUaoyDDRtpfx
	sTJ9e2QjTVBBTjNVzu1jXs1FndgZjTqYbWEK4NjIIgwgpo1ruMadxl7B+Zx8GCq/5+Nx7YKDoSA
	wsNn6y8dhioT6p1RBYHY3itGtrevXr/A2skox5GQAUeVFKP0cuc3nUA5LslkDyPEgtEumGQEgf3
	7x9MTh5mwOrp9ZVeZGQnnR85ueW7vVmvXSECyY/zS1hoEWvbMIvdgJKmoSwW5mvJ2xQdj5W8DFA
	VBAvxm2CTq3mnMY8lKy5rnrX3k6qxHIFTvY0Ukf8QE4jrPFdKE61gY5iIG5nu5jcuZlLcUmbhyE
	FYCx87Ags38cADwwURVu1NqJOoxw=
X-Google-Smtp-Source: AGHT+IFBA0/Fa26+sOmFBRL8g/x6aVw7/j0O2LlJKfN9PcXZYaTmRIDdTwlehwQWSZcRtUEVxFdKFA==
X-Received: by 2002:a05:6870:168b:b0:2c2:5b08:8e42 with SMTP id 586e51a60fabf-2ea96f2825amr994828fac.27.1749606845574;
        Tue, 10 Jun 2025 18:54:05 -0700 (PDT)
Received: from ls.ts.net (fixed-189-203-87-169.totalplay.net. [189.203.87.169])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea073afbdesm2676147fac.48.2025.06.10.18.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 18:54:04 -0700 (PDT)
From: Anibal Limon <anibal@limonsoftware.com>
To: docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com,
	erik.schumacher@iris-sensing.com,
	yoann.congal@smile.fr,
	Anibal Limon <anibal@limonsoftware.com>
Subject: [PATCHv3] test-manual/ptest: Add info about fail state of ptest-runner/ptests
Date: Wed, 11 Jun 2025 01:54:01 +0000
Message-Id: <20250611015401.1342422-1-anibal@limonsoftware.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Jun 2025 01:54:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7056

On the ML was pointed about no specific information about
ptest-runner/ptests so improve docs around.

https://lists.yoctoproject.org/g/yocto-patches/message/1622

[YOCTO #15832]

Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
---
 documentation/Pipfile               |  2 ++
 documentation/test-manual/ptest.rst | 17 ++++++++++++-----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/documentation/Pipfile b/documentation/Pipfile
index 7ee1d2290..c99d09c75 100644
--- a/documentation/Pipfile
+++ b/documentation/Pipfile
@@ -9,6 +9,8 @@ verify_ssl = true
 sphinx = "*"
 sphinx-rtd-theme = "*"
 pyyaml = "*"
+vale = "*"
+sphinx-lint = "*"
 
 [requires]
 python_version = "3"
diff --git a/documentation/test-manual/ptest.rst b/documentation/test-manual/ptest.rst
index 2c021af51..e064419d7 100644
--- a/documentation/test-manual/ptest.rst
+++ b/documentation/test-manual/ptest.rst
@@ -46,13 +46,19 @@ Running ptest
 =============
 
 The ``ptest-runner`` package installs a shell script that loops through
-all installed ptest test suites and runs them in sequence. Consequently,
-you might want to add this package to your image.
+all installed ptest test suites and runs them in sequence.
+
+During the execution ``ptest-runner`` keeps counter of failed ``ptests``
+and use it as exit value, failing the execution if any of the ``run-ptest``
+scripts fails.
+
+Consequently, you might want to add this package to your image.
+
 
 Getting Your Package Ready
 ==========================
 
-In order to enable a recipe to run installed ptests on target hardware,
+In order to enable a recipe to run installed ``ptests`` on target hardware,
 you need to prepare the recipes that build the packages you want to
 test. Here is what you have to do for each recipe:
 
@@ -77,8 +83,9 @@ test. Here is what you have to do for each recipe:
 
 -  *Create run-ptest:* This script starts your test. Locate the
    script where you will refer to it using
-   :term:`SRC_URI`. Here is an
-   example that starts a test for ``dbus``::
+   :term:`SRC_URI`. Be sure your ``run-ptest`` exit with 0 to mark it
+   as sucessfully executed.
+   Here is an example that starts a test for ``dbus``::
 
       #!/bin/sh
       cd test
-- 
2.39.5


