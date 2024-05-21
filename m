Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B398C25B78
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:26:49 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.3475.1716316007419063001
 for <docs@lists.yoctoproject.org>;
 Tue, 21 May 2024 11:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Fr3wD1pC;
 spf=pass (domain: baylibre.com, ip: 209.85.219.46, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6a077a861e7so32487586d6.2
        for <docs@lists.yoctoproject.org>; Tue, 21 May 2024 11:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716316006; x=1716920806; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GqZdWzzTcwmxgdo/B3zSW4I51znfIuN/jlqhIWpqcNc=;
        b=Fr3wD1pCuf5npogAvgjpzt8+qs6y6EbPHqj3g3CGKzohhx6+6VY+NUJ0CWoVJ8GICx
         e9N7XxkrEExn75/6Kg2zVzQ/rqefnT4s670umLGDfsY7BBysuu8psaxe5kx3OFGStOYC
         0y52PVqZ3NCSZ0MEIqrPVS3ulnvwMMuOTsRw1lfulmoX6NMnPL1Oj/X7QyxUk/+zcfHa
         UJkUdq4/pFRve0/j3u3Q9Jn7iqohsbth8PmgDVEClKVAtj0S656dCJOsgD55IPuVBhd5
         ilHTHPVudQWM+mfYbj2S3+k674VUpO6DlAtteg3apLU2/wTVTtZ9qoIU7LQbqcM3sbaR
         /O7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716316006; x=1716920806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GqZdWzzTcwmxgdo/B3zSW4I51znfIuN/jlqhIWpqcNc=;
        b=k0EG7YEHLuM9Tz1Fs0wDingV8/xqiA6JVtQvSH3/140g0C50ekNzQX4uya47LZDn9U
         1Hetxph06Bj4lLFkXltThE8gCFS7yTWOkTXwPKicijTzJUFRA5CrBgRircP9OkEJzbn9
         kVMrwGSxvbv41puQO69X0Y95YQQ5V64/tgcG+aJO0tujAjKjMkuDxA7VsW8+w8Ts0aKS
         l+CvhBc0q94F/XkLxQLE3oPkP3ym/A/9o2wZVa45XHZYcf6KbAGUWIAUYcHGwB7Y+E5A
         +5hLLDE54QTPULvKl2Pthsl/+PQq7Se58VZgXmmrk6tC4NzreZhy90/QCo12OcCbvrUl
         usRw==
X-Gm-Message-State: AOJu0YyljNZ6/cjB/gZ0ozwgPoKfSqdlTWxGibd+O1ecDuQH2THlyvxI
	MdrB3cGAqGlFrhn+hgyarjH/w3Cp4nyOxSywzoiG3nS6NspO878/+JuGjceK8xW6vw3iyNZdmMu
	2
X-Google-Smtp-Source: AGHT+IFBHZB86K3xgzM3u0hE2B7HLP2VlSqaTum2ODRAx97rQr9yWUFVb+mnnHYX65UgBZiNMzGsog==
X-Received: by 2002:a0c:faca:0:b0:6a1:69ae:4d34 with SMTP id 6a1803df08f44-6a169ae4f5bmr275255346d6.20.1716316005836;
        Tue, 21 May 2024 11:26:45 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a35384037esm72870356d6.73.2024.05.21.11.26.44
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:26:45 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: docs@lists.yoctoproject.org
Subject: [docs][PATCH] ref-manual: variables: document PYPI_PACKAGE_EXT, PYPI_SRC_URI
Date: Tue, 21 May 2024 14:26:43 -0400
Message-ID: <20240521182644.1895419-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 May 2024 18:26:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5226

These are variables that some Python recipes are starting to use, but
there is no documentation for them currently in the reference manual.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 documentation/ref-manual/variables.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 3f37f42f2..09199b5c9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6829,6 +6829,19 @@ system and gives an overview of their function and contents.
       explicitly if that will not match the package name (e.g. where the
       package name has a prefix, underscores, uppercase letters etc.)
 
+   :term:`PYPI_PACKAGE_EXT`
+      When inheriting the :ref:`ref-classes-pypi` class, specifies the
+      file extension to use when fetching a package from `PyPI
+      <https://pypi.org/>`__. Default is tar.gz.
+
+   :term:`PYPI_SRC_URI`
+      When inheriting the :ref:`ref-classes-pypi` class, specifies the
+      full `pythonhosted <https://files.pythonhosted.org/>`__ URI for
+      fetching the package to be built. The default value is constructed
+      based upon :term:`PYPI_PACKAGE`, :term:`PYPI_PACKAGE_EXT`, and
+      :term:`PV`. Most recipes will not need to set this variable unless
+      they are building an unstable (i.e. development) version.
+
    :term:`PYTHON_ABI`
       When used by recipes that inherit the :ref:`ref-classes-setuptools3`
       class, denotes the Application Binary Interface (ABI) currently in use
-- 
2.45.1


