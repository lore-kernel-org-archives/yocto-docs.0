Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.22015.1605694033902987908
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2020 02:07:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=j2kPGe+w;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id c17so1526915wrc.11
        for <docs@lists.yoctoproject.org>; Wed, 18 Nov 2020 02:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ER1knx4xG48AC/xfbLTFPDyuX7HydAPW/0w3/N2IWGY=;
        b=j2kPGe+wJvefyd3ZDTc3eUe9jSUvQNPXgs9KfmsxGFJEkCjSCsUkeCVKxXXK+82pAN
         KXZ8LJ3+GR8Fe638Oe5BShdw+k8DlG/r8xdycOJckI9NG6v5hwhuRzHAuOmss0+njldi
         i7wKDREKeIjroiediuOtGIw/1v8aMwwAy2J/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ER1knx4xG48AC/xfbLTFPDyuX7HydAPW/0w3/N2IWGY=;
        b=FW+Oh/ao7o1aU9wAWpe/FJoKwHb4+nLuQv30B4ssRtH1WwDMv5NpP2g9K+A63yZTXS
         VSH7LnllUmujgIvqEF8CICnTeo5iPHDSKsiA4Maa9mYntQ0CdkQAXPI6aDbBzl5mlgqo
         AsXRswY3C/Kt1R7JCts62FinPLVG4EfR6leXBNZc93VAGcbmW4nspGDDkGwwQf/FxbiE
         158Z6G18kxry7FdOwDAqGsf4sAcSEmwYKSqX0fe/8RXJHj3MNp3oYvljCCxViw17egc1
         m8SUoSfYfmiAg4H8eyNgqwCUYg/fn3RODCG9Q2DmqPAt/7vVGf9WP/7vUx6KDC/MnVvO
         enrA==
X-Gm-Message-State: AOAM531fHvMoCQqRHYzVm5pK0zn40TZS+M1dhGIPKwUoAnHKJJSmRrL2
	66tM9DmU5hpcpUxYBb61wH4eCbN4fkWaWw==
X-Google-Smtp-Source: ABdhPJz3Z0uOrbfCWvfw5VMLcEXLC55DX3z2zQBPquphn3ZMvnAhO3HzDCFE5oGWuQ5yP/hv6JU6Og==
X-Received: by 2002:a5d:6046:: with SMTP id j6mr4005306wrt.317.1605694032136;
        Wed, 18 Nov 2020 02:07:12 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id a128sm3013391wmf.5.2020.11.18.02.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 02:07:11 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 4/9] dev-manual-common-tasks: Tidy up patch submission process
Date: Wed, 18 Nov 2020 10:07:00 +0000
Message-Id: <20201118100705.3656-4-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201118100705.3656-1-pbarker@konsulko.com>
References: <20201118100705.3656-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce duplication by pulling out the common steps of committing changes
locally from the steps of submitting those changes via the pull request
scripts or via email.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 .../dev-manual/dev-manual-common-tasks.rst    | 63 ++++++++-----------
 1 file changed, 25 insertions(+), 38 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index d53f68cc1..72481ae50 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -10689,19 +10689,10 @@ layers you are contributing to.
 
 The following sections provide procedures for submitting a change.
 
-.. _pushing-a-change-upstream:
-
-Using Scripts to Push a Change Upstream and Request a Pull
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Follow this procedure to push a change to an upstream "contrib" Git
-repository:
+.. _preparing-changes-for-submissions:
 
-.. note::
-
-   You can find general Git information on how to push a change upstream
-   in the
-   `Git Community Book <https://git-scm.com/book/en/v2/Distributed-Git-Distributed-Workflows>`__.
+Preparing Changes for Submission
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 1. *Make Your Changes Locally:* Make your changes in your local Git
    repository. You should make small, controlled, isolated changes.
@@ -10783,7 +10774,22 @@ repository:
 
          detailed description of change
 
-4. *Push Your Commits to a "Contrib" Upstream:* If you have arranged for
+.. _pushing-a-change-upstream:
+
+Using Scripts to Push a Change Upstream and Request a Pull
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Follow this procedure to push a change to an upstream "contrib" Git
+repository once the steps in :ref:`preparing-changes-for-submissions` have
+been followed:
+
+.. note::
+
+   You can find general Git information on how to push a change upstream
+   in the
+   `Git Community Book <https://git-scm.com/book/en/v2/Distributed-Git-Distributed-Workflows>`__.
+
+1. *Push Your Commits to a "Contrib" Upstream:* If you have arranged for
    permissions to push to an upstream contrib repository, push the
    change to that repository:
    ::
@@ -10800,7 +10806,7 @@ repository:
 
       $ git push meta-intel-contrib your_name/README
 
-5. *Determine Who to Notify:* Determine the maintainer or the mailing
+2. *Determine Who to Notify:* Determine the maintainer or the mailing
    list that you need to notify for the change.
 
    Before submitting any change, you need to be sure who the maintainer
@@ -10829,7 +10835,7 @@ repository:
       lists <resources-mailinglist>`" section in
       the Yocto Project Reference Manual.
 
-6. *Make a Pull Request:* Notify the maintainer or the mailing list that
+3. *Make a Pull Request:* Notify the maintainer or the mailing list that
    you have pushed a change by making a pull request.
 
    The Yocto Project provides two scripts that conveniently let you
@@ -10896,29 +10902,10 @@ mailing lists, see the ":ref:`Mailing Lists <resources-mailinglist>`" section in
 Yocto Project Reference Manual.
 
 Here is the general procedure on how to submit a patch through email
-without using the scripts:
-
-1. *Make Your Changes Locally:* Make your changes in your local Git
-   repository. You should make small, controlled, isolated changes.
-   Keeping changes small and isolated aids review, makes
-   merging/rebasing easier and keeps the change history clean should
-   anyone need to refer to it in future.
-
-2. *Stage Your Changes:* Stage your changes by using the ``git add``
-   command on each file you changed.
-
-3. *Commit Your Changes:* Commit the change by using the
-   ``git commit --signoff`` command. Using the ``--signoff`` option
-   identifies you as the person making the change and also satisfies the
-   Developer's Certificate of Origin (DCO) shown earlier.
-
-   When you form a commit, you must follow certain standards established
-   by the Yocto Project development team. See :ref:`Step 3
-   <dev-manual/dev-manual-common-tasks:using scripts to push a change upstream and request a pull>`
-   in the previous section for information on how to provide commit information
-   that meets Yocto Project commit message standards.
+without using the scripts once the steps in
+:ref:`preparing-changes-for-submissions` have been followed:
 
-4. *Format the Commit:* Format the commit into an email message. To
+1. *Format the Commit:* Format the commit into an email message. To
    format commits, use the ``git format-patch`` command. When you
    provide the command, you must include a revision list or a number of
    patches as part of the command. For example, either of these two
@@ -10951,7 +10938,7 @@ without using the scripts:
       or to OpenEmbedded, you might consider requesting a contrib area
       and the necessary associated rights.
 
-5. *Import the Files Into Your Mail Client:* Import the files into your
+2. *Import the Files Into Your Mail Client:* Import the files into your
    mail client by using the ``git send-email`` command.
 
    .. note::
-- 
2.20.1

