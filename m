Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.39574.1606154550108711979
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 10:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LM8EIcW+;
 spf=pass (domain: konsulko.com, ip: 209.85.221.54, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f54.google.com with SMTP id p8so19509773wrx.5
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 10:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TsmFnzEl7VVdyATLQFWLGj+HnO2ETSUgrJ4OWJnRFl8=;
        b=LM8EIcW+BkgNk7nWiydHw4DAsc2BjH+WEuW1luL3vca7flSltqIx8SnMgxZXYgpRuC
         pnMxNQb+JgBF+VmjOc8t2LUZws4Jc38GkbWQLl0jXSO9c7t72xjHrgauoFeYmU45t6dF
         5RRVCFPDri8YIZtWUis+Fv1WjUTvuUNiGN/I4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TsmFnzEl7VVdyATLQFWLGj+HnO2ETSUgrJ4OWJnRFl8=;
        b=B3EidTWUT/ucw28FjQMzOgw7c4lthWuymohZbAJCKM/AQWHcUOu/8JcXimsoSf55ft
         B0SMGeioe4rCiTjkZSzRebN/4S50stT5PaLztucyoMhJnMLCGKxQAT8EWqmOs549Qi/S
         TONlV+hshreZl6PxxKnbamO1DxIW5h8Hft2wm9GTTFY7sOyX2TD4Zs+wNO3LWItAclz5
         rs3xPCJNCJAnjdo60TaxlA0lalnZU1SAHv7BbYIc/ne7GmXLSof+LxoRRhkwBEXdMkHs
         5JvwLRCI1iuMip14W/Qs1VPILb40hJLQUGCwz+n6RUXDQrnUJpAxbNFMetaPpScWQBGZ
         WJ7g==
X-Gm-Message-State: AOAM531Csn4m2llu6a/lChtcIXRFbNsb/AQRfHO/PEjkOxhVAGFM3Su5
	hPl4UZfNJWXprRZi18tf24jNAN9QGprMvA==
X-Google-Smtp-Source: ABdhPJwJizXi55kL0xjhkq9tfDXEt69Qh8z44rRhXJn9zBesU+PlFhvbIOgykLZTR7Jm7YiF9g/Ubg==
X-Received: by 2002:adf:f6c7:: with SMTP id y7mr849304wrp.147.1606154548308;
        Mon, 23 Nov 2020 10:02:28 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id v8sm117315wmg.28.2020.11.23.10.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 10:02:27 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v3 6/7] dev-manual-common-tasks: Describe how to propose changes to stable branches
Date: Mon, 23 Nov 2020 18:02:18 +0000
Message-Id: <20201123180219.1966-7-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123180219.1966-1-pbarker@konsulko.com>
References: <20201123180219.1966-1-pbarker@konsulko.com>
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
index 4b76217ad..09f20a2bc 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -11004,6 +11004,63 @@ Lastly please ensure that you also test your revised changes. In particular
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

