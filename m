Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.8769.1605110892906706359
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 08:08:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qSth1nc7;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id p8so3056653wrx.5
        for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2020 08:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kfxgyTIGucFPiWA8SSuyCrqbCjak+CssgJ/cDjxJ6O0=;
        b=qSth1nc7C8Ym7CYLEzL2HKyDqQ9EzaZsrimyqDWE2ITRKzVETp8NjkBT8nd9rlB6k9
         JEqmYwC9bGoWLMISeF1UI8VnFkTKgSwiDNmi67XExBFx4UGucD9ojed9FHqKdC4Epyfw
         chRiCQUAII2EPHQOlz+4zzj0EF6Dr25YmUGHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kfxgyTIGucFPiWA8SSuyCrqbCjak+CssgJ/cDjxJ6O0=;
        b=eO6EYKtWxOix5tnMCz8CeEsrddP/X4LNLYBYknfehXT/MoNvaGIx+LoB7TWzT/NXxh
         dZyTxFPwtBZ3qQ5c/Nvc73IQxnSWPjsn784KmoB0sJTZy1YuSZ+HOwR8+pAb7gJ/X88J
         KMdPZkUvDYWA2CMYBoic4KLWPSHFCuXZkPgABJ4k4V/87RUsVmvaoe3Zli7iSC8NVGZl
         5BovQgvJi7YOC4cN6TqEHhI0EIukyR8Q1GeKrPPCqi0sqWIpfRXRSZfXpC4VAz6RRLCV
         p3CrxVVdza03K+zQGZVUYJ/kdU/26+OsThrudIMYQgrHn6zpSZuAAgY5I4Ro0sEbYjWE
         ZMdg==
X-Gm-Message-State: AOAM53063daGZaV9qBvLCWsqWM6irtZDvVgxwaT0OR95YN4gx1+0nIln
	K8WNgE1AwOrdK5FdWN8ShSG4GRJ7G9vBbg==
X-Google-Smtp-Source: ABdhPJzw2CYFEJnNrxY5yrWVpSU69A9gYDXJRFBB0FfvhUFxWQNbtkGv0ojQnMhPjSn2tybSkfueCQ==
X-Received: by 2002:a5d:548b:: with SMTP id h11mr11491386wrv.306.1605110891112;
        Wed, 11 Nov 2020 08:08:11 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76132-clif11-2-0-cust249.12-4.cable.virginm.net. [80.7.160.250])
        by smtp.gmail.com with ESMTPSA id u195sm3174617wmu.18.2020.11.11.08.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 08:08:10 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 6/8] dev-manual-common-tasks: Describe how to propose changes to stable branches
Date: Wed, 11 Nov 2020 16:07:58 +0000
Message-Id: <20201111160800.5669-6-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201111160800.5669-1-pbarker@konsulko.com>
References: <20201111160800.5669-1-pbarker@konsulko.com>
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
 .../dev-manual/dev-manual-common-tasks.rst    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 0a3ab8241..e923ce834 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -11005,6 +11005,61 @@ Lastly please ensure that you also test your revised changes. In particular
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
+branch can be obtained from the `Releases wiki page <https://wiki.yoctoproject.org/wiki/Releases>`__.
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
+      branch use ``git format-patch --subject-prefix='dunfell][PATCH' ...``.
+
 Working With Licenses
 =====================
 
-- 
2.20.1

