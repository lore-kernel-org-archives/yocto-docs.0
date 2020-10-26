Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.9819.1603698643095901823
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 00:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=z3g2UdDy;
 spf=pass (domain: linaro.org, ip: 209.85.128.52, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f52.google.com with SMTP id c16so11427356wmd.2
        for <docs@lists.yoctoproject.org>; Mon, 26 Oct 2020 00:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4CJm+7aKasQN+D4zRjMDk+8vhFohYXreumrqLDGC0RQ=;
        b=z3g2UdDy+H8Dui7azx97d3yNZeiqF5AsuujH0iSJgWN6H4wdviU7eOguPaI2X09Roi
         L0+WZiZ1wNqRTCv5jVdk1UyEV6wCA81OTD5SGKfFkdHqhBgjLE+gLVi4z7XF6436pZXf
         th88ZW8jQmbLdNpzVwisvQkjjS7VTumIkKodct6BFYtotrlBnTKjuqobWhM/aFsTPIPi
         3gYCbqMgCu6/ehSjZOXEK/pfvQJdzGZwv3AMOUW/Xk36GHSBBDsX92V5FsbYxUjX5IYE
         zPTVYsyaSPA7rV2tdpfaFkhlkRcw03RUEdfRRJHxuCrM5bYvpyv0dph7HnJSqXoYjJim
         K2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4CJm+7aKasQN+D4zRjMDk+8vhFohYXreumrqLDGC0RQ=;
        b=RNKea8up8TVij2gnTAm5cmt3PwRM/g1e4rwDaAsW82Rc3XlW6VHo/wLIWa6n5hBxZL
         4IAxqFpERJ/Ecmd72J8SdhuO/5E1REfawVhXNQ7f/BRVT70pt3GkYrrXLq0VUyo3jtHG
         lZfPR1Hf8NUIXGAbd0AKzO/B6zC/ZXszRZaqXg4WbZR5Ws3brokqjgJYxTuhueba3/SG
         dWAjQBYqIhJ9IPsmM7FhCkdQyA3EPfC9qVfuQaeHVyNIpuBoPoRQw5WYq44thbojxhXu
         Ee3HNF5k1xG7ftmHkT9GHIpx8+9UQOUxZbfcx9CJnD757R85nHKR1Z90b1Bvx/pNnomy
         UGdQ==
X-Gm-Message-State: AOAM532LBtj7NR5buW+qAgRqJgRwF8Ny9cwk3MU37GTAcSUUlsOTX1ki
	65ZRZ0gNoIqYSSi7GwswggKjuVy5VfZGOhSL
X-Google-Smtp-Source: ABdhPJyHrEXBWCqm8zI6E6XSxnNM0UOlMEjINPszK2woJI5KE3N9x07H8C2X/5mAgt+09s/3tleIeg==
X-Received: by 2002:a7b:c7c3:: with SMTP id z3mr14336937wmk.43.1603698641244;
        Mon, 26 Oct 2020 00:50:41 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from nikaia.localdomain ([2a01:e0a:1b9:3e10:d6af:c5d9:8b6e:b994])
        by smtp.gmail.com with ESMTPSA id o140sm20512324wme.43.2020.10.26.00.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 00:50:40 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org,
	leimaohui@cn.fujitsu.com
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] dev-manual/dev-manual-common-tasks: fix warning
Date: Mon, 26 Oct 2020 08:50:36 +0100
Message-Id: <20201026075036.367907-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A new warning was introduced in
59908cecb528 (docs: Updated the status of spdx module.)

The code-block section belongs to the #3 item in the enumerated
list. While at it, also fixed a typo in the text.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../dev-manual/dev-manual-common-tasks.rst    | 35 +++++++++----------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index dedc30d7d..e1ee03da8 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -11487,26 +11487,23 @@ this function, you have to follow the following steps:
 2. Refer to the README in meta-spdxscanner to setup the environment (e.g, 
    setup a fossology server) needed for the scanner.
 
-3. Meta-spdxscanner provids several methods within the bbclass to create spdx files.
+3. Meta-spdxscanner provides several methods within the bbclass to create spdx files.
    Please choose one that you want to use and enable the spdx task. You have to
-   add some config options in 
-``local.conf`` file in your
-:term:`Build Directory`.
-The following is an example showing how to generate spdx files during bitbake 
-using the fossology-python.bbclass:
-::
-
-   # Selet fossology-python.bbclass.
-   INHERIT += "fossology-python"
-   # For fossology-python.bbclass, TOKEN is necessary, so, after setup a 
-   # Fossology server, you have to create a token.
-   TOKEN = "eyJ0eXAiO..."
-   # The fossology server is necessary for fossology-python.bbclass.
-   FOSSOLOGY_SERVER = "http://xx.xx.xx.xx:8081/repo"
-   # If you want to upload the source code to a special folder:
-   FOLDER_NAME = "xxxx" //Optional
-   # If you don't want to put spdx files in tmp/deploy/spdx, you can enable:
-   SPDX_DEPLOY_DIR = "${DeployDir}" //Optional
+   add some config options in ``local.conf`` file in your :term:`Build
+   Directory`. The following is an example showing how to generate spdx files
+   during bitbake using the fossology-python.bbclass::
+
+      # Selet fossology-python.bbclass.
+      INHERIT += "fossology-python"
+      # For fossology-python.bbclass, TOKEN is necessary, so, after setup a
+      # Fossology server, you have to create a token.
+      TOKEN = "eyJ0eXAiO..."
+      # The fossology server is necessary for fossology-python.bbclass.
+      FOSSOLOGY_SERVER = "http://xx.xx.xx.xx:8081/repo"
+      # If you want to upload the source code to a special folder:
+      FOLDER_NAME = "xxxx" //Optional
+      # If you don't want to put spdx files in tmp/deploy/spdx, you can enable:
+      SPDX_DEPLOY_DIR = "${DeployDir}" //Optional
 
 For more usage information on meta-spdxscanner, refer to the repsoitory which you can find at:
 https://git.yoctoproject.org/cgit/cgit.cgi/meta-spdxscanner/.
-- 
2.28.0

