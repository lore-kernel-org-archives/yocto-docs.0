Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.12807.1603799524125651728
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 04:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=k67Qyrjk;
 spf=pass (domain: linaro.org, ip: 209.85.221.67, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f67.google.com with SMTP id b8so1593628wrn.0
        for <docs@lists.yoctoproject.org>; Tue, 27 Oct 2020 04:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VCNLgZpn1cChncX9T7xCY58mfz1diu9q+b7o1vUmw1c=;
        b=k67Qyrjks60KeqP+6sNKLRyRFgS/Vk7/6NwlgoKfkEc1fnIgf8TX+8tH518KRGUMfa
         W1Rwbn7hCiK9MNrpK1dp4+BkZWg8Mtnsi5bf3Zf4Urnlia7nT+eE6oUT9UvmzcK0IG8z
         5N+aWrMfeml08P+zpjQ87zUIgvxIBB10SMLYDx7hDLWRyZTLc5UaKXtpomLceNblagPE
         9qVplfQY9zh/yWT8BGhABUJAzCJNqt1W4hUKJamsS0/XniE0f3i/Azwp6gNToEVjQZrz
         HTmGKlKQoMQtN8MAZoD75prQHbtPMtJ78Q6RXFlXHXkWi8m8f4m/i0qK+q/vXtrnMyqj
         jIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VCNLgZpn1cChncX9T7xCY58mfz1diu9q+b7o1vUmw1c=;
        b=aL1AuL066dgW80kWd5aiWYZEC9DKwYKAwUNmelXn4EBRXi8iBEarsZgoPvxPj1JRsI
         /BQAUcyVUl25r8l0uvcPNI9aqwI69inpvw8kGDP6G99Hw04zRCIprp5aJMcf2dsClZTO
         LAb4z2AaB/IwoNrqLHAn/KkFpkq8o79B0+tjVaYUc5yR3SV/Y0gLaA/YdHCXr1OhCJl9
         XeUUdl5gIPzGTbU6lnNdPXdwkupe5a13e11FvxhS2vS/osdI/Rth+bmuqHZ6bEAhLjm/
         3S0aTpbSbgZsPfi0CqrwS82b/why28buiPHqHOnaFE5IjNVVJ/5YNRJzc7EhYehc4jtc
         7tJg==
X-Gm-Message-State: AOAM532vWQtXq9ghsJzWKw7z+QYNhcSKxItSdfm/Ax+pITY8IPeWuRrE
	2Vq88/ry17y4G83M742ie6jAmz9tqKrXoP5U
X-Google-Smtp-Source: ABdhPJy1+wX2UXjKh351X0yTEo5NEQ0FrzjTRb47GIUN6Z5mgpx2bmTZCCq1NSa937/X4GIycSfaPw==
X-Received: by 2002:adf:e9c6:: with SMTP id l6mr2388322wrn.257.1603799522134;
        Tue, 27 Oct 2020 04:52:02 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from nikaia.localdomain ([2a01:e0a:1b9:3e10:924d:9ed8:52a0:2523])
        by smtp.gmail.com with ESMTPSA id u202sm1814467wmu.23.2020.10.27.04.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 04:52:01 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] dev-manual/dev-manual-common-tasks: fix typos and use extlinks
Date: Tue, 27 Oct 2020 12:51:48 +0100
Message-Id: <20201027115148.459514-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* fixed a couple of typos
* added a 'nicer' link to the repo using :yocto_git:

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/dev-manual/dev-manual-common-tasks.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index e1ee03da8..0630040e6 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -11493,7 +11493,7 @@ this function, you have to follow the following steps:
    Directory`. The following is an example showing how to generate spdx files
    during bitbake using the fossology-python.bbclass::
 
-      # Selet fossology-python.bbclass.
+      # Select fossology-python.bbclass.
       INHERIT += "fossology-python"
       # For fossology-python.bbclass, TOKEN is necessary, so, after setup a
       # Fossology server, you have to create a token.
@@ -11503,10 +11503,11 @@ this function, you have to follow the following steps:
       # If you want to upload the source code to a special folder:
       FOLDER_NAME = "xxxx" //Optional
       # If you don't want to put spdx files in tmp/deploy/spdx, you can enable:
-      SPDX_DEPLOY_DIR = "${DeployDir}" //Optional
+      SPDX_DEPLOY_DIR = "${DEPLOY_DIR}" //Optional
+
+For more usage information refer to :yocto_git:`the meta-spdxscanner repository
+</cgit/cgit.cgi/meta-spdxscanner/>`.
 
-For more usage information on meta-spdxscanner, refer to the repsoitory which you can find at:
-https://git.yoctoproject.org/cgit/cgit.cgi/meta-spdxscanner/.
 
 Copying Licenses that Do Not Exist
 ----------------------------------
-- 
2.29.1

