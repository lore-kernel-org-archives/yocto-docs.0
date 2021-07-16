Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.4930.1626434971438930400
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Jul 2021 04:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q+CCu+jN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id l17-20020a05600c1d11b029021f84fcaf75so7988972wms.1
        for <docs@lists.yoctoproject.org>; Fri, 16 Jul 2021 04:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lsSsryJbcWiAtPBL3JUyqPM9L6QtU4gjobCMCZLHq3c=;
        b=Q+CCu+jN7uFuWqpGZ8jS4Q4Tcum/3O5XBEqZm1WtvKhiABy6aAFc89fNdBrwdVM9gF
         EDIOMljXz+a9spJBp1FprW6aXUd4lo+qew9IkHUpfUckmr4OooeSlEm+eeSQcSkjNZgN
         dYxMV+AUpm4Yc0WdLBAiLwzy2gUowwDEGFhHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lsSsryJbcWiAtPBL3JUyqPM9L6QtU4gjobCMCZLHq3c=;
        b=LaDTuVM6Ql6477ojfRDc7jJCAgQnC1gXrbipSQNBApyWofbSmsse5MHaxlH/OC8N1x
         AbIUxpJN0bD7dEYYblhEFrlKB/y1dYI3kbjHnzFynudCar/TbOpJOJbSJCVi3qkKwSQC
         gtGFCT9O26Ny2NQEkztz1YeSmCVpgFOUtsfb12pl9it5afOAaDJEkNVwq3LQLIsyxApz
         tdTnDgG8eAewJBhdExJ2TAWZUokZrMjor6IYIMm62A/itz8/qwMccwVtKVmCvf+kvC23
         uKP6bOV/OzBZkCDAoKSgZEs1XIX0BGvVLtvFOf9JBLvF1fnUHG4GGazTCK3wS1lVDVJe
         SVlQ==
X-Gm-Message-State: AOAM530tCXt2WgtbN+hZKoomI0AvaqK3nvcUU8g+GW1unIXcJfNOUJK0
	eC6igJRmvBImHywPkQbwBqWy/NWfIzH5AQ==
X-Google-Smtp-Source: ABdhPJyHhuwge6bgrnOaTVNoDLPDeEanCAD8Lj2VMgfrvluSW4Wj1ExvTEidawWcfbovf38Eo1QoKg==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr9961816wmk.146.1626434969616;
        Fri, 16 Jul 2021 04:29:29 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:4ccc:3fdb:8fa2:76b7])
        by smtp.gmail.com with ESMTPSA id d8sm10094994wra.41.2021.07.16.04.29.29
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 04:29:29 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] common-tasks: Fix conversion error in npm example
Date: Fri, 16 Jul 2021 12:29:28 +0100
Message-Id: <20210716112928.2934282-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/dev-manual/common-tasks.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 4eab12d83..7781a126a 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -7288,7 +7288,8 @@ The ``devtool edit-recipe`` command lets you take a look at the recipe::
        npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json \
        "
    S = "${WORKDIR}/npm"
-   inherit npm LICENSE_${PN} = "MIT"
+   inherit npm
+   LICENSE_${PN} = "MIT"
    LICENSE_${PN}-accepts = "MIT"
    LICENSE_${PN}-array-flatten = "MIT"
    ...
-- 
2.30.2

