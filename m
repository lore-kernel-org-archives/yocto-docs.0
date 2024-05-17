Return-Path: <ngalea@thegoodpenguin.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD38C04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 19:27:36 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.4412.1715974050520994849
 for <docs@lists.yoctoproject.org>;
 Fri, 17 May 2024 12:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.s=20230601 header.b=TCMwKzCK;
 spf=pass (domain: thegoodpenguin.co.uk, ip: 209.85.221.67, mailfrom: ngalea@thegoodpenguin.co.uk)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-3535fdf5ab0so326490f8f.1
        for <docs@lists.yoctoproject.org>; Fri, 17 May 2024 12:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1715974049; x=1716578849; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/oDC16FuObd7pMNnb6yjlqt0y+OAePMeTf6fBZuTigc=;
        b=TCMwKzCKBKtuVFHwgcXJ2PT9z3sLFXot73f+Mdl9zp24Z8QxccjLrPcrLatxSNq8CW
         824J1VWWkpAtRl4abCBXjwiOCLmjaGsOxWNi7mSsoGvHLLPKYk2NHWsbF4XMSzogaDoH
         pmMl+V/JEeJ8zF0xyNkgFZa8pAifOkt7uilMdpMZJgUrsAmdiBBX0XfmPuXYea71kQ54
         83qudDpYxmtm7oX+LySVe/meR7Upk036vKyiVYjx9Z9UFDeyeDBjp8Zd+G1oqCSWYqUt
         BmHusOG5mj+MsNqKIrrjPA4vDwrC5DyI/KsH1N6HemeTqysTHuv8p4j4J+nAeqYn0S6t
         w3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715974049; x=1716578849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/oDC16FuObd7pMNnb6yjlqt0y+OAePMeTf6fBZuTigc=;
        b=iHtEB6JhQN8CbG+KWel9Cs5tKwXBp8vOhiRrxv/kXkzZchJJwxrBq1+pyRPPSFvdvF
         rtfNx6toxZY16s8SI7YjmFY8pC810I04+59MvzyRdQJEhUfpdQXqwlJd2ygwjlCYJOPJ
         TGzacjVqABUlIVIXetPvVarYlHm+i04YH2zM55A7TyXbN2EIwerk2iRzWnMBf/545W+H
         iXnT+ucFunWkvf3lvvnWjaxAXd6eqHxkROs0ClFA59q6VUHL70NZSyELrreLD1DyQpz8
         VJxIQRh5NDnzA0rEfTVAqZkKIaN5YHKFZgsev7xZgx821uSw0mEmjMpe5G+gAnt6VjTr
         eRzQ==
X-Gm-Message-State: AOJu0Yzpc9lEvJQqadohTxOa8MT8Xw0yG70mCRRkz0LFInPBpkzabmgA
	xHyO7Ztt1v93n8e7itra5DXQfrSP3PK11hFhycDgvl/uHQgFJGhHBNijo0dwvtYaUpH4B6dZJyd
	wZF4=
X-Google-Smtp-Source: AGHT+IE2FxtgkalLK43NzkKKNGBzBAbFcNgcuEK3DqImr6p7pyNaeGrT/TAWoebk6twPOCPWrYXjmg==
X-Received: by 2002:a05:6000:1288:b0:350:1372:4c0a with SMTP id ffacd0b85a97d-3504a73c034mr15653559f8f.39.1715974048871;
        Fri, 17 May 2024 12:27:28 -0700 (PDT)
Received: from localhost.localdomain (watf-11-b2-v4wan-169690-cust2.vm45.cable.virginm.net. [81.100.40.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79bd09sm22152708f8f.14.2024.05.17.12.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 12:27:28 -0700 (PDT)
From: Noe Galea <ngalea@thegoodpenguin.co.uk>
To: docs@lists.yoctoproject.org
Cc: Noe Galea <ngalea@thegoodpenguin.co.uk>
Subject: [PATCH] manuals: document NVDCVE_API_KEY variable
Date: Fri, 17 May 2024 20:27:24 +0100
Message-Id: <20240517192724.7519-1-ngalea@thegoodpenguin.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 May 2024 19:27:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5220

Add brief documentation of NVDCVE_API_KEY variable, that was added
in 4.2.3, and emphasize that its use results in lower NVD API request
times.

Signed-off-by: Noe Galea <ngalea@thegoodpenguin.co.uk>
---
 documentation/dev-manual/vulnerabilities.rst |  4 ++++
 documentation/ref-manual/variables.rst       | 15 +++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/dev-manual/vulnerabilities.rst
index 1bc2a8592..983d4ad3c 100644
--- a/documentation/dev-manual/vulnerabilities.rst
+++ b/documentation/dev-manual/vulnerabilities.rst
@@ -57,6 +57,10 @@ applied and that the issue needs to be investigated. ``Ignored`` means that afte
 analysis, it has been deemed to ignore the issue as it for example affects
 the software component on a different operating system platform.
 
+By default, no NVD API key is used to retrieve data from the CVE database, which
+results in larger delays between NVD API requests. See the :term:`NVDCVE_API_KEY`
+documentation on how to request and set a NVD API key.
+
 After a build with CVE check enabled, reports for each compiled source recipe will be
 found in ``build/tmp/deploy/cve``.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 3f37f42f2..6b5b5c076 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5585,6 +5585,21 @@ system and gives an overview of their function and contents.
 
          NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot"
 
+   :term:`NVDCVE_API_KEY`
+      The NVD API key used to retrieve data from the CVE database when
+      using :ref:`ref-classes-cve-check`.
+
+      By default, no API key is used, which results in larger delays between API
+      requests and limits the number of queries to the public rate limits posted
+      at the `NVD developer's page <https://nvd.nist.gov/developers/start-here>`__.
+      
+      NVD API keys can be requested through the
+      `Request an API Key <https://nvd.nist.gov/developers/request-an-api-key>`__
+      page. You can set this variable to the NVD API key in your ``local.conf`` file.
+      Example::
+
+          NVDCVE_API_KEY = "fe753&7a2-1427-347d-23ff-b2e2b7ca5f3"
+
    :term:`OBJCOPY`
       The minimal command and arguments to run ``objcopy``.
 
-- 
2.20.1


