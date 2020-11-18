Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.22195.1605694034914725694
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2020 02:07:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LiSiMA/C;
 spf=pass (domain: konsulko.com, ip: 209.85.221.67, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f67.google.com with SMTP id l1so1547070wrb.9
        for <docs@lists.yoctoproject.org>; Wed, 18 Nov 2020 02:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G93si09s9m5bLA/7Hkij1M2Hw+Oh6w7IDHfIfrAGq3k=;
        b=LiSiMA/CQBsOfOAAMZ60n0VShWZA24660ehy1GaGa73fOUmtnmGolQaFrnMBSIwQop
         wTgYT3tk0z5Sn8bN4XipJMR0i1m8+a5xdW63DBn6qfw2XagXZeSwvfFIbCCCq0q9UV+V
         RDokN7kJlRMlJwYdwHM4RMFrEqE9J9JwciJ1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G93si09s9m5bLA/7Hkij1M2Hw+Oh6w7IDHfIfrAGq3k=;
        b=Ga2WBHNPRAXg0s4LJ6kJ0qsO4lwUxNNK15iL5KrDAd8yESodwIM3H71XWWGC8E3Gf/
         ymJ0mW+YUHuMCxUJMMQJolkT65PF2nY6j45WCBB8YXOx0whw4hR/yKmiZ0T/odCechvn
         SbX7eDsJPbR3xEHpPAHp1CaqOKBxNVDTvdpAjQOZbv65pVrq4vKKEt7hXCUZkNrYgQEW
         zBMgh4LuMmUrrQERiNKScBzcS6SwgWRbEvI5XS/q6hAmylWny3jAzCrpn53QcaAb2cn5
         Y8sT5gW0JcuQFf9q5lX+5KqFloZtpxcgAFzmsFlSYJVNoPEm42rCTfxhp9hVX8Ge644U
         aRUw==
X-Gm-Message-State: AOAM533Z9ijfUMxqu4qqcHUMZpCr5PjtERW6NubsrseAVWPXcaCvjXnK
	Cq6q0XJKv7CyxER5g1osTw74CICOOFfiBg==
X-Google-Smtp-Source: ABdhPJwZYJZDoQWlxogqGb66KJlUEJr6hAatL5DhJIOUu4tfQk1DyKex0I1fuFGu29HkHbrwG1Slcw==
X-Received: by 2002:a5d:5405:: with SMTP id g5mr4058544wrv.350.1605694033036;
        Wed, 18 Nov 2020 02:07:13 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id a128sm3013391wmf.5.2020.11.18.02.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 02:07:12 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 5/9] dev-manual-common-tasks: Describe git-send-email accurately
Date: Wed, 18 Nov 2020 10:07:01 +0000
Message-Id: <20201118100705.3656-5-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201118100705.3656-1-pbarker@konsulko.com>
References: <20201118100705.3656-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 documentation/dev-manual/dev-manual-common-tasks.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 72481ae50..42163cb9b 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -10938,8 +10938,8 @@ without using the scripts once the steps in
       or to OpenEmbedded, you might consider requesting a contrib area
       and the necessary associated rights.
 
-2. *Import the Files Into Your Mail Client:* Import the files into your
-   mail client by using the ``git send-email`` command.
+2. *Send the patches via email:* Send the patches to the recipients and
+   relevant mailing lists by using the ``git send-email`` command.
 
    .. note::
 
-- 
2.20.1

