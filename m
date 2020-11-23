Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.39630.1606154547177249260
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 10:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rSHJKJ88;
 spf=pass (domain: konsulko.com, ip: 209.85.221.67, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f67.google.com with SMTP id 23so19467017wrc.8
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 10:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+vLRKAP9+2cotMGuLFBHL/zYpn0zH8VJWKwvuq8M7ZM=;
        b=rSHJKJ88zDun0XuFPc++zDcEybUZgwkS38xIHkR6Fq7X9nv2zH1uBq9Q5L2/7WdJNS
         vtZ2qcuWRD1muZ86jbJy4+oCcX3qo7AUW+bb+GRzeL0ybx17GUE5kyBapbFj2I/yRFHb
         QdgMHZXbGQs3HJc4TJYLM3feub1RqHJW1Z5ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+vLRKAP9+2cotMGuLFBHL/zYpn0zH8VJWKwvuq8M7ZM=;
        b=nNVPAgtAbfiJPagodxDznlN193QcKkWuWV8+l6YCV73uDrZzb28uxk1i5ood2B+Zqg
         arXavUXYob7L0Dnz1Zagz4Ubu4Klv/TYz+U8gTGj5QLXzRaeLMUL4yq47KnuWdeFn31v
         ZcdAh4c523yLlVTqOJKGRAzMQO86EUdn2UpTgq8H/xuo86MXuDxnuQmhqhkKZJrEPccp
         aOa0MPt0ruGIUi5ULTUzWaJIJd5GEc4fXy20gAHRGDgrDIzkyhCWksErWEj2hGzArL/y
         Mi8LNPtjHYSNiwLcAm0ZbyZb5sJqd2rCXhUFj/pMAOczUHjGfjzCo6mY8slI5+25Vklp
         1PZg==
X-Gm-Message-State: AOAM533OxdLnmbt0E73J0ibMyi7lTX/nNtyvhgNe2fawcmNQSgphluDd
	DaFzlQgunzeZoh1QYfap99dgNW3Pa1Or4g==
X-Google-Smtp-Source: ABdhPJzxM+M75C2cv3un+uNWr+t/454c8lUV+SjLB2X+YyEWXbAeJd4FAZ2wdKtFOoVGxrKxUe2AMA==
X-Received: by 2002:a5d:6452:: with SMTP id d18mr933130wrw.200.1606154545332;
        Mon, 23 Nov 2020 10:02:25 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id v8sm117315wmg.28.2020.11.23.10.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 10:02:24 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v3 3/7] dev-manual-common-tasks: Tidy up patch submission process
Date: Mon, 23 Nov 2020 18:02:15 +0000
Message-Id: <20201123180219.1966-4-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123180219.1966-1-pbarker@konsulko.com>
References: <20201123180219.1966-1-pbarker@konsulko.com>
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
index d43205712..2a521905e 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -10690,19 +10690,10 @@ layers you are contributing to.
 
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
@@ -10784,7 +10775,22 @@ repository:
 
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
@@ -10801,7 +10807,7 @@ repository:
 
       $ git push meta-intel-contrib your_name/README
 
-5. *Determine Who to Notify:* Determine the maintainer or the mailing
+2. *Determine Who to Notify:* Determine the maintainer or the mailing
    list that you need to notify for the change.
 
    Before submitting any change, you need to be sure who the maintainer
@@ -10830,7 +10836,7 @@ repository:
       lists <resources-mailinglist>`" section in
       the Yocto Project Reference Manual.
 
-6. *Make a Pull Request:* Notify the maintainer or the mailing list that
+3. *Make a Pull Request:* Notify the maintainer or the mailing list that
    you have pushed a change by making a pull request.
 
    The Yocto Project provides two scripts that conveniently let you
@@ -10897,29 +10903,10 @@ mailing lists, see the ":ref:`Mailing Lists <resources-mailinglist>`" section in
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
@@ -10952,7 +10939,7 @@ without using the scripts:
       or to OpenEmbedded, you might consider requesting a contrib area
       and the necessary associated rights.
 
-5. *Import the Files Into Your Mail Client:* Import the files into your
+2. *Import the Files Into Your Mail Client:* Import the files into your
    mail client by using the ``git send-email`` command.
 
    .. note::
-- 
2.20.1

