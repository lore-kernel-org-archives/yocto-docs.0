Return-Path: <zach@mandolincreek.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C95C433FE
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 15:12:33 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.21025.1653577951979077349
 for <docs@lists.yoctoproject.org>;
 Thu, 26 May 2022 08:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aquabyte-ai.20210112.gappssmtp.com header.s=20210112
 header.b=CF+lBZXy;
 spf=none, err=SPF record not found (domain: aquabyte.ai, ip: 209.85.214.169,
 mailfrom: zach@aquabyte.ai)
Received: by mail-pl1-f169.google.com with SMTP id w3so1658445plp.13
        for <docs@lists.yoctoproject.org>;
 Thu, 26 May 2022 08:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aquabyte-ai.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y8IGOsGeu4cGRCWAcm9/Sa8HDVz1YgV/E7qDsQElafo=;
        b=CF+lBZXyvRHwXQ9fI85NRnULeZxngccBH5zqt66ZZjTu9O1sP+JMr6M1nnJwsOWh9D
         0s67S99kQOBKuGiOiJXsxHmzJNhDANQR/ghvXHaalbDBVkf9mPMnWJY7LcvI43LtdFuj
         K8fH8ydCnhmUxj9dzswYFZvx2VJHesA3t8m0JcIGvitKYfQuyia5ybAB+Vhzp3UHzp3x
         8hKnw4NTWvRiJD5Bu7W/9644GaYiJmOZbrsI6Q5j35qhXScK8uNVSVpz6iUlK9w9HAVl
         YJfB0np1HD9153HWTWC71+zPKfhsOhPdesjHiupAMr5DF6RBY0kf51vV/3CRIZkKfnX6
         wbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y8IGOsGeu4cGRCWAcm9/Sa8HDVz1YgV/E7qDsQElafo=;
        b=JYfROip4CKn92GuRmxwftrK7oe3OhMHfYa3S5aq0C5hQUYSfJ6P/0ScGKgi2iZG/G2
         0esUROIjJZVSoyIBXb/irhvGiTkTFEUIlNq85TD7cBSt+cZf9ee0f485YgA0xdq/hZBJ
         gTs8NaoCG3+QVUQf/ttT63G1Dju/ipuGOXUl3Dj74yhfgqVQVxMIk937CY0extQ48nHI
         EAOnn0NSpa5dDNsX63cfDDDKO8gaQlGC+uBeQGxubuW3Wyrm6t2uj2/jOZvmkPjFykxP
         Xf9CbpbUFmar81hXUAs82y98se1EH+VRbc9vcd7ZeaN+cNzBDSZ/M1EEkKjcgrftDn+Q
         0y4A==
X-Gm-Message-State: AOAM531LeKV644WtL8l5d2JRaWnmpiFM0J1tS0WihHBqRC6sOJ2xSLrH
	QLzNmO1q6eWSbyatK/Djnztnkw==
X-Google-Smtp-Source: 
 ABdhPJx9CMHWOiFVgSQQCeiorG0GGcIX74ApScpMcwOBgCHttEfCui1f7iondRLPKCeebyPYA5aDRQ==
X-Received: by 2002:a17:90b:3b8e:b0:1df:fd93:b37b with SMTP id
 pc14-20020a17090b3b8e00b001dffd93b37bmr3062181pjb.147.1653577951415;
        Thu, 26 May 2022 08:12:31 -0700 (PDT)
Received: from aquabyte.at.mandolincreekfarm.com
 (fluffy.mandolincreekfarm.com. [192.173.156.26])
        by smtp.gmail.com with ESMTPSA id
 19-20020a170902e9d300b0015e8d4eb264sm1740847plk.174.2022.05.26.08.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 08:12:30 -0700 (PDT)
Received: by aquabyte.at.mandolincreekfarm.com (Postfix, from userid 1000)
	id BA54C25200FC; Thu, 26 May 2022 08:12:29 -0700 (PDT)
From: Zachary T Welch <zach@aquabyte.ai>
To: docs@lists.yoctoproject.org
Cc: Zachary T Welch <zach@aquabyte.ai>
Subject: [PATCH 1/2] test-manual/intro: reorder bitbake-selftest steps
Date: Thu, 26 May 2022 08:12:27 -0700
Message-Id: <20220526151228.562281-1-zach@aquabyte.ai>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 May 2022 15:12:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2949

The addition of the verbose example interrupted the description of the
BB_SKIP_NETTESTS option.

Signed-off-by: Zachary T Welch <zach@aquabyte.ai>
---
 documentation/test-manual/intro.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index eb9ebe2d5..c445e28a7 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -179,16 +179,16 @@ Tests map into the codebase as follows:
 
       $ bitbake-selftest
 
-   To skip tests that access the Internet, use the ``BB_SKIP_NETTESTS``
-   variable when running "bitbake-selftest" as follows::
-
-      $ BB_SKIP_NETTESTS=yes bitbake-selftest
-
    The default output is quiet and just prints a summary of what was
    run. To see more information, there is a verbose option::
 
       $ bitbake-selftest -v
 
+   To skip tests that access the Internet, use the ``BB_SKIP_NETTESTS``
+   variable when running "bitbake-selftest" as follows::
+
+      $ BB_SKIP_NETTESTS=yes bitbake-selftest
+
    Use this option when you wish to skip tests that access the network,
    which are mostly necessary to test the fetcher modules. To specify
    individual test modules to run, append the test module name to the
-- 
2.25.1


