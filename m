Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.22299.1605694036459151632
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2020 02:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=TFvYjDcc;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id p8so1594901wrx.5
        for <docs@lists.yoctoproject.org>; Wed, 18 Nov 2020 02:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E6GKtcHaEHc8s7+rvKu/bHmFPJmOfa+0/PSxm7+sji8=;
        b=TFvYjDccqZ6Gu38vGCONYF8SLGmwAbqDofUy2udZZvt3Ote1q0fLJSmFeAJ+FbOasr
         uX77ofzsj/xYxH+6HdDJCWk7gtUnpLXnX7S4gnp3vlU3gnnnDYaWH0cXZRBUF+wes3ba
         laTWk9mzsIui2G0uAj3bJb8uHaAWRhlEdFvig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E6GKtcHaEHc8s7+rvKu/bHmFPJmOfa+0/PSxm7+sji8=;
        b=r/E3JVEHeyjsv4LnWqAtWEJzmjOg7e3R6tR16TiXR1AI7zmeWhGSp+vmzlnDa1zmTp
         cbnimakwOkRwgSWuU67s3INtzNEJNYsrytz+HCNd3IkJbHFIxOL4I+vrcAkouOkM4eKH
         f3uNj05cua8fXLOKsSyOaGyZ9Fw8YM/5MwI1JWH3yru/qEyvn5stgzKdxsDA0UsR2q+4
         5PvJBxdr7k8IP3rKEXUvObE/e+iAwWa+DLTIw2BUTImZyOncevmKkcYj6fQ/lcOm8rC+
         dhtdcAvuWOFCiwx2ObTwchJd/HT7UWBHXF5VZPwTh9cszqh7aqJTgo4VRMU+lBWMHiD/
         xIWA==
X-Gm-Message-State: AOAM533WAVHT9pDFn7RkpeeZGQgsWi2cIZ+x8jkbdoRYiMjjv57Zk4w4
	DhZV54najhlUAcOGMzT8wy3b4sJf23lXhQ==
X-Google-Smtp-Source: ABdhPJwjfqecnjJHmGl3nTA/auYNI3RP3tqfOk0HlAIvoUIOVPN2ilpM90rclwkhZgYtG98tVdIQfA==
X-Received: by 2002:adf:a3ca:: with SMTP id m10mr4036256wrb.228.1605694034706;
        Wed, 18 Nov 2020 02:07:14 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id a128sm3013391wmf.5.2020.11.18.02.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 02:07:14 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 7/9] dev-manual-common-tasks: Describe how to propose changes to stable branches
Date: Wed, 18 Nov 2020 10:07:03 +0000
Message-Id: <20201118100705.3656-7-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201118100705.3656-1-pbarker@konsulko.com>
References: <20201118100705.3656-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation on submitting changes to the project should cover the
ways in which the process differs for stable branches. These changes add
a brief description of the typical policy for handling changes to stable
branches and give some steps to follow when proposing changes to these
branches. The information is based on my personal experience and on the
existing content of the "How to submit a patch to OpenEmbedded" page on
the OE wiki.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 .../dev-manual/dev-manual-common-tasks.rst    | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 61e66f464..700c60ab2 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -11003,6 +11003,63 @@ Lastly please ensure that you also test your revised changes. In particular
 please don't just edit the patch file written out by ``git format-patch`` and
 resend it.
 
+Submitting Changes to Stable Release Branches
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The process for proposing changes to a Yocto Project stable branch differs
+from the steps described above. Changes to a stable branch must address
+identified bugs or CVEs and should be made carefully in order to avoid the
+risk of introducing new bugs or breaking backwards compatibility. Typically
+bug fixes must already be accepted into the master branch before they can be
+backported to a stable branch unless the bug in question does not affect the
+master branch or the fix on the master branch is unsuitable for backporting.
+
+The list of stable branches along with the status and maintainer for each
+branch can be obtained from the
+:yocto_wiki:`Releases wiki page </wiki/Releases>`.
+
+.. note::
+
+   Changes will not typically be accepted for branches which are marked as
+   End-Of-Life (EOL).
+
+With this in mind, the steps to submit a change for a stable branch are as
+follows:
+
+1. *Identify the bug or CVE to be fixed:* This information should be
+   collected so that it can be included in your submission.
+
+2. *Check if the fix is already present in the master branch:* This will
+   result in the most straightforward path into the stable branch for the
+   fix.
+
+   a. *If the fix is present in the master branch - Submit a backport request
+      by email:* You should send an email to the relevant stable branch
+      maintainer and the mailing list with details of the bug or CVE to be
+      fixed, the commit hash on the master branch that fixes the issue and
+      the stable branches which you would like this fix to be backported to.
+
+   b. *If the fix is not present in the master branch - Submit the fix to the
+      master branch first:* This will ensure that the fix passes through the
+      project's usual patch review and test processes before being accepted.
+      It will also ensure that bugs are not left unresolved in the master
+      branch itself. Once the fix is accepted in the master branch a backport
+      request can be submitted as above.
+
+   c. *If the fix is unsuitable for the master branch - Submit a patch
+      directly for the stable branch:* This method should be considered as a
+      last resort. It is typically necessary when the master branch is using
+      a newer version of the software which includes an upstream fix for the
+      issue or when the issue has been fixed on the master branch in a way
+      that introduces backwards incompatible changes. In this case follow the
+      steps in :ref:`preparing-changes-for-submissions` and
+      :ref:`submitting-a-patch` but modify the subject header of your patch
+      email to include the name of the stable branch which you are
+      targetting. This can be done using the ``--subject-prefix`` argument to
+      ``git format-patch``, for example to submit a patch to the dunfell
+      branch use
+      ``git format-patch --subject-prefix='&DISTRO_NAME_NO_CAP_MINUS_ONE;][PATCH' ...``.
+
 Working With Licenses
 =====================
 
-- 
2.20.1

