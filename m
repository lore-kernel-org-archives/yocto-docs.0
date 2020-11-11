Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.9034.1605110891068137638
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 08:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rbQKKJs6;
 spf=pass (domain: konsulko.com, ip: 209.85.221.65, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f65.google.com with SMTP id j7so3064877wrp.3
        for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2020 08:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2RD8MIFaZjktwGLFLPpk2cgLpl2ljVgt8FjF8C5nM9Y=;
        b=rbQKKJs6UqW1ccnVY/4h426X8pGGxhSBrTv1gHCTIAjp6tohYyALXza0oAggKXk6G/
         HdmHDILnaa/NfR+cAVXamanLNew7B/Qq2BCtSuGzUvmDEOrBGmcs6DgRlybaVsBtl6/T
         5PyJbGcaBloBdC3sCRky5DRG4a4+AtKkDuNsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2RD8MIFaZjktwGLFLPpk2cgLpl2ljVgt8FjF8C5nM9Y=;
        b=iOVvwcYX2HmTO8mMq0fAF/BXRCxnG1wDECRu+9s21Pre5g6rP7xCmaAzZZ8irK8fWE
         gfkMxSpg1OrQxQ1FplTTnBF5QN5RJvCnrgJ2HP2YDpq5AGIb0erzEqZ/IoLwN/yCqe1y
         lufoPJBt2/sz7vdCoE1Rzutil5SsvrRzsFfnKgxTlZUovHd/6ab0cPdJkB+NvqHfUojv
         QNwIc0/cCL6Oc2hTDMqXbAZw5a+zsTUyMUBrCVbMBaTvhjJOU9hcIKp1dZErtRAh7KXE
         TqyGHsmSIvNAXSt81EMN820EEv+o7BO+NRRrDoGTQ4qnN5jdQ4ObeQ0SZlinAw7HMnvC
         AMyA==
X-Gm-Message-State: AOAM530z4j+3BOUO53W90lWWMWiQfZDcxepS31vjsyLgd9/zrZb1AC0/
	85SBRz3KWGCSDjzVkOzHNz5nkp3j7ff6sg==
X-Google-Smtp-Source: ABdhPJwm+y8nUHMNcjTyAR5gp9bsd/WWc1P1cWslU4wZBPOjcic7HrehJmakue/+wqVgGMo5uWdVAQ==
X-Received: by 2002:a05:6000:89:: with SMTP id m9mr802919wrx.412.1605110889404;
        Wed, 11 Nov 2020 08:08:09 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76132-clif11-2-0-cust249.12-4.cable.virginm.net. [80.7.160.250])
        by smtp.gmail.com with ESMTPSA id u195sm3174617wmu.18.2020.11.11.08.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 08:08:08 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 4/8] dev-manual-common-tasks: Describe git-send-email accurately
Date: Wed, 11 Nov 2020 16:07:56 +0000
Message-Id: <20201111160800.5669-4-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201111160800.5669-1-pbarker@konsulko.com>
References: <20201111160800.5669-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 documentation/dev-manual/dev-manual-common-tasks.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 641ca8539..b34602e16 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -10940,8 +10940,8 @@ without using the scripts once the steps in
       or to OpenEmbedded, you might consider requesting a contrib area
       and the necessary associated rights.
 
-2. *Import the Files Into Your Mail Client:* Import the files into your
-   mail client by using the ``git send-email`` command.
+2. *Send the patches via email:* Send the patches to the recipients and
+   relevant mailing lists by using the ``git send-email`` command.
 
    .. note::
 
-- 
2.20.1

