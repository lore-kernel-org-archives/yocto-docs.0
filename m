Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.8767.1605110890328779666
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 08:08:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YHm4hzpJ;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id 33so3044487wrl.7
        for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2020 08:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OZVwJ9aaQMRHr8E9+1cTQhtb486V1lRyvaAYu4cSd98=;
        b=YHm4hzpJrqSlb+N2al89ns2aoF/zZ3ah7mjdbFy8rrXQ4BRVGrf2CZUd7BMszAnIxK
         eOX9bSR03HtBqwZba17FfT6S+Ai1AyC5Ft6aZnHYc2TiR30k/VxViX9vUQYcMO2XCTjN
         rQKJub6/L5DHlft0hmZ2WMishA89hRdnq4FDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OZVwJ9aaQMRHr8E9+1cTQhtb486V1lRyvaAYu4cSd98=;
        b=WJLhI++HrUMn8zpM99oZ35EQHy9Ac8zteAgCRq5S617LtmCyKJgcXfmcvbkycKS1+2
         y70ywFams0HsLieXTvUaX5z4CMl+yenPVfrJmqJCuT8+AWxu29DhPrcWJkCO65SvPsAJ
         8tArC3spip5qGhk9Doc8zQNqovQivqh+THv2IFxP991xlQnXJxz3Pwx89pdu9pYDHw+r
         B8l7+yNEJkurD72smRmMwYGJVCZOnNwK8LO0UZ05Z2/SHZ/AdNutgz4vUEZiZWNEP8WY
         SfMDogs7UcRYMZCHsQTnz2K17IQ8P5nNcGQKA88L5f60NiONXMfwy9YnJeEf4JZmhwke
         TPgA==
X-Gm-Message-State: AOAM532cLkhre/jMeaYIixqrP7KvD8PMgasaclkTX58D+S8+SUuyC0z3
	d4xGuJjqnnuZDKmTSq23MsLTXaxmvudPzA==
X-Google-Smtp-Source: ABdhPJxeb2l9OawbRLrCU4Qp5EdXZ/nPA8ejSoHNXMlBAkGGWpmny5yYKVfelrWZFd33dIHw39uGPw==
X-Received: by 2002:a5d:670f:: with SMTP id o15mr14240751wru.204.1605110888490;
        Wed, 11 Nov 2020 08:08:08 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76132-clif11-2-0-cust249.12-4.cable.virginm.net. [80.7.160.250])
        by smtp.gmail.com with ESMTPSA id u195sm3174617wmu.18.2020.11.11.08.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 08:08:07 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 3/8] dev-manual-common-tasks: Tidy up patch submission process
Date: Wed, 11 Nov 2020 16:07:55 +0000
Message-Id: <20201111160800.5669-3-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201111160800.5669-1-pbarker@konsulko.com>
References: <20201111160800.5669-1-pbarker@konsulko.com>
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
index 2f28cce62..641ca8539 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -10691,19 +10691,10 @@ layers you are contributing to.
 
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
@@ -10785,7 +10776,22 @@ repository:
 
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
@@ -10802,7 +10808,7 @@ repository:
 
       $ git push meta-intel-contrib your_name/README
 
-5. *Determine Who to Notify:* Determine the maintainer or the mailing
+2. *Determine Who to Notify:* Determine the maintainer or the mailing
    list that you need to notify for the change.
 
    Before submitting any change, you need to be sure who the maintainer
@@ -10831,7 +10837,7 @@ repository:
       lists <resources-mailinglist>`" section in
       the Yocto Project Reference Manual.
 
-6. *Make a Pull Request:* Notify the maintainer or the mailing list that
+3. *Make a Pull Request:* Notify the maintainer or the mailing list that
    you have pushed a change by making a pull request.
 
    The Yocto Project provides two scripts that conveniently let you
@@ -10898,29 +10904,10 @@ mailing lists, see the ":ref:`Mailing Lists <resources-mailinglist>`" section in
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
@@ -10953,7 +10940,7 @@ without using the scripts:
       or to OpenEmbedded, you might consider requesting a contrib area
       and the necessary associated rights.
 
-5. *Import the Files Into Your Mail Client:* Import the files into your
+2. *Import the Files Into Your Mail Client:* Import the files into your
    mail client by using the ``git send-email`` command.
 
    .. note::
-- 
2.20.1

