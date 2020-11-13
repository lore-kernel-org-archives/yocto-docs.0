Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.14308.1605229936009153278
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 17:12:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gLMIg/c9;
 spf=pass (domain: linaro.org, ip: 209.85.221.49, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f49.google.com with SMTP id 33so7958625wrl.7
        for <docs@lists.yoctoproject.org>; Thu, 12 Nov 2020 17:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w9NIpfJaKCetOiLKlXcsxHyvqH70WzAUyNJl0mv4upk=;
        b=gLMIg/c9Sy3lfXsi4T52p+PIolF0/MknhclonPSzFjJ4I7sVdsSdun10NvlXBzaV6L
         +zOnPcWsUf6djimX0lpTRx6nsMSB4i3iE+IksTLb0AHeRNzrsYg5f+bBIu9v8L41xNKE
         gj6macQVg7IzuA1KQ9p9SESGfQnut6ADPwRLGeCsVXUwXKRdISrgu+leVf98HD1SogdX
         lGsCkIwfpOStE9/sVrUu4RfzibgrZjyDLEAMmQ34NKbkW71M+oYyGS0xvjB0mhb36bcc
         hwwdNlLEv0B8zGn5RMAvAVP7RL75CumnqzK3T+XHRvkETImu+W8Hv/E6qVGlOXZoKIAu
         dPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w9NIpfJaKCetOiLKlXcsxHyvqH70WzAUyNJl0mv4upk=;
        b=YGwJHxmSAZ7x4RCuqL/UuvDjqJgoGq+U+XrKaNmDIFejKJGHKOseivfLKmz5bPJMzj
         zoB5y1GidacXIXmNb3FHvig59bhrwuK/rrqE13T7wBc7CVj1iP6bkkP8FS8VVPH+/4MG
         L4H2gt/UFpGObPodrWnIkOhj3ZOuDZnWg57WgMQof0xAXkXjlp7+Hw1JDqTf0QDsHuXb
         3V/VDB2ymWI4P4ZBG90H5paY4Tizc9ee9lEKsAcFS5ndg6lbnRPkQ7k9XLhRWK+sWuHU
         l71dJCHnFJxpm+0hokz2Nrc+xfBMeeFgEMwFcP2labQzxxHWjVUdX0nBr0GVDr+Fx4BT
         Wozw==
X-Gm-Message-State: AOAM532CiYOObi2g4nJlMg/crNvuwRqGUSNZqm4u+gyoE0OWXQNJ0XjB
	VPE6RaRwBuojACBZIJmkn/3c5EEHlTm4hBDM
X-Google-Smtp-Source: ABdhPJyj8AVNdIfmsq26RZZ9fJqlJF72U/oiVps+qncM2GhmZX0+VkTlqB2EofU13PXlXhBIZ/HptQ==
X-Received: by 2002:adf:f181:: with SMTP id h1mr2596384wro.267.1605229934221;
        Thu, 12 Nov 2020 17:12:14 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id j8sm5502107wrx.11.2020.11.12.17.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 17:12:13 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] sphinx: releases: add link to 3.1.3
Date: Fri, 13 Nov 2020 02:11:30 +0100
Message-Id: <20201113011130.20493-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/releases.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/releases.rst b/documentation/releases.rst
index 536c3a6d2..9992f97d5 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -11,6 +11,7 @@
 - :yocto_docs:`3.1 Documentation </3.1>`
 - :yocto_docs:`3.1.1 Documentation </3.1.1>`
 - :yocto_docs:`3.1.2 Documentation </3.1.2>`
+- :yocto_docs:`3.1.3 Documentation </3.1.3>`
 
 ==========================
  Previous Release Manuals
-- 
2.29.2

