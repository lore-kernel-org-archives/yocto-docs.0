Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.39040.1606154551627233546
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 10:02:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nTUCWA98;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id e7so1963903wrv.6
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 10:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+ljM5yYJeyevwbktKsRF85qQTyE+CcKUXwfDsRcr+7Y=;
        b=nTUCWA98upHnqx+jnVG0sxDgU5RWdjtjcpBfJWqwWZIMt8wNKKe1Ffe467HLpbg4Sc
         wa1v3bhg9OB6kXfQI8vGygw0vXMe+pqIxAVykxMjbz+sX0Vk+YUfSPh8CPMOb9T7kH+l
         Li+El+4KzqyFHqZJ56w8WQ0A9U/65sxSVal3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+ljM5yYJeyevwbktKsRF85qQTyE+CcKUXwfDsRcr+7Y=;
        b=TiBL6R0RZb3pKJTOBITPSSuZ0zxrr/qPrFOrWfPi30+rG0FDymSB0du+C25ESkieNq
         DfRfCWszYab1ZjeirKx34xbr/Meh/QNDaCKJ6hdgj6govUwTfTY2SdbXP4xr2qZQRvh9
         e0NLh9FY9RZBP7uB3N4ajnM1zcZvTG95q1xKrYrHMVEP5MtzcknebD6aDiyat1udM7R1
         sjswK7bip/RjZDJHaUvGyEfy+Hg5e/YU78QMnyEMtD7kjzUwT2AB66RfkSP1y2UU5aBT
         QQyDGbUtmt5K0nuhc5m40AS6AIYd2RYKZLLgcOT6h+op0YgckkudypX8I0bBiXP64DIg
         PRbw==
X-Gm-Message-State: AOAM530QIcpvTLOhcZif5oW3v9/rpojaMQgsj6Qrv13q2x1JGVlYsGAo
	BXsKLrujoo5DErQT0A/gC30lN7evprONDA==
X-Google-Smtp-Source: ABdhPJyYlhG0qVoDt3dJNCWebWM0JbLa2hRewQQOMdT0NwQypq30HzMRQZVcQTTohy1zupDcDGS6uA==
X-Received: by 2002:adf:f84b:: with SMTP id d11mr920327wrq.216.1606154549330;
        Mon, 23 Nov 2020 10:02:29 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id v8sm117315wmg.28.2020.11.23.10.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 10:02:28 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v3 7/7] dev-manual-common-tasks: Re-order patch submission instructions
Date: Mon, 23 Nov 2020 18:02:19 +0000
Message-Id: <20201123180219.1966-8-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123180219.1966-1-pbarker@konsulko.com>
References: <20201123180219.1966-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

New contributors to the project will usually be following the steps to
submit patches directly via email as they may not have commit access to
a contrib repository. For shorter series of patches this is the more
common workflow which we see anyway.

The documentation here is updated to reflect this, addressing the email
submission process first and then the pull request process. The new
opening paragraph for the section on submitting pull requests is taken
from the "How to submit a patch to OpenEmbedded" page on the OE wiki.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 .../dev-manual/dev-manual-common-tasks.rst    | 196 +++++++++---------
 1 file changed, 99 insertions(+), 97 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 09f20a2bc..683f5557e 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -10775,11 +10775,110 @@ Preparing Changes for Submission
 
          detailed description of change
 
+.. _submitting-a-patch:
+
+Using Email to Submit a Patch
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Depending on the components changed, you need to submit the email to a
+specific mailing list. For some guidance on which mailing list to use,
+see the `list <#figuring-out-the-mailing-list-to-use>`__ at the
+beginning of this section. For a description of all the available
+mailing lists, see the ":ref:`Mailing Lists <resources-mailinglist>`" section in the
+Yocto Project Reference Manual.
+
+Here is the general procedure on how to submit a patch through email
+without using the scripts once the steps in
+:ref:`preparing-changes-for-submissions` have been followed:
+
+1. *Format the Commit:* Format the commit into an email message. To
+   format commits, use the ``git format-patch`` command. When you
+   provide the command, you must include a revision list or a number of
+   patches as part of the command. For example, either of these two
+   commands takes your most recent single commit and formats it as an
+   email message in the current directory:
+   ::
+
+      $ git format-patch -1
+
+   or ::
+
+      $ git format-patch HEAD~
+
+   After the command is run, the current directory contains a numbered
+   ``.patch`` file for the commit.
+
+   If you provide several commits as part of the command, the
+   ``git format-patch`` command produces a series of numbered files in
+   the current directory – one for each commit. If you have more than
+   one patch, you should also use the ``--cover`` option with the
+   command, which generates a cover letter as the first "patch" in the
+   series. You can then edit the cover letter to provide a description
+   for the series of patches. For information on the
+   ``git format-patch`` command, see ``GIT_FORMAT_PATCH(1)`` displayed
+   using the ``man git-format-patch`` command.
+
+   .. note::
+
+      If you are or will be a frequent contributor to the Yocto Project
+      or to OpenEmbedded, you might consider requesting a contrib area
+      and the necessary associated rights.
+
+2. *Send the patches via email:* Send the patches to the recipients and
+   relevant mailing lists by using the ``git send-email`` command.
+
+   .. note::
+
+      In order to use ``git send-email``, you must have the proper Git packages
+      installed on your host.
+      For Ubuntu, Debian, and Fedora the package is ``git-email``.
+
+   The ``git send-email`` command sends email by using a local or remote
+   Mail Transport Agent (MTA) such as ``msmtp``, ``sendmail``, or
+   through a direct ``smtp`` configuration in your Git ``~/.gitconfig``
+   file. If you are submitting patches through email only, it is very
+   important that you submit them without any whitespace or HTML
+   formatting that either you or your mailer introduces. The maintainer
+   that receives your patches needs to be able to save and apply them
+   directly from your emails. A good way to verify that what you are
+   sending will be applicable by the maintainer is to do a dry run and
+   send them to yourself and then save and apply them as the maintainer
+   would.
+
+   The ``git send-email`` command is the preferred method for sending
+   your patches using email since there is no risk of compromising
+   whitespace in the body of the message, which can occur when you use
+   your own mail client. The command also has several options that let
+   you specify recipients and perform further editing of the email
+   message. For information on how to use the ``git send-email``
+   command, see ``GIT-SEND-EMAIL(1)`` displayed using the
+   ``man git-send-email`` command.
+
+The Yocto Project uses a `Patchwork instance <https://patchwork.openembedded.org/>`__
+to track the status of patches submitted to the various mailing lists and to
+support automated patch testing. Each submitted patch is checked for common
+mistakes and deviations from the expected patch format and submitters are
+notified by patchtest if such mistakes are found. This process helps to
+reduce the burden of patch review on maintainers.
+
+.. note::
+
+   This system is imperfect and changes can sometimes get lost in the flow.
+   Asking about the status of a patch or change is reasonable if the change
+   has been idle for a while with no feedback.
+
 .. _pushing-a-change-upstream:
 
 Using Scripts to Push a Change Upstream and Request a Pull
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
+For larger patch series it is preferable to send a pull request which not
+only includes the patch but also a pointer to a branch that can be pulled
+from. This involves making a local branch for your changes, pushing this
+branch to an accessible repository and then using the ``create-pull-request``
+and ``send-pull-request`` scripts from openembedded-core to create and send a
+patch series with a link to the branch for review.
+
 Follow this procedure to push a change to an upstream "contrib" Git
 repository once the steps in :ref:`preparing-changes-for-submissions` have
 been followed:
@@ -10885,103 +10984,6 @@ been followed:
               $ poky/scripts/create-pull-request -h
               $ poky/scripts/send-pull-request -h
 
-
-.. _submitting-a-patch:
-
-Using Email to Submit a Patch
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-You can submit patches without using the ``create-pull-request`` and
-``send-pull-request`` scripts described in the previous section.
-However, keep in mind, the preferred method is to use the scripts.
-
-Depending on the components changed, you need to submit the email to a
-specific mailing list. For some guidance on which mailing list to use,
-see the `list <#figuring-out-the-mailing-list-to-use>`__ at the
-beginning of this section. For a description of all the available
-mailing lists, see the ":ref:`Mailing Lists <resources-mailinglist>`" section in the
-Yocto Project Reference Manual.
-
-Here is the general procedure on how to submit a patch through email
-without using the scripts once the steps in
-:ref:`preparing-changes-for-submissions` have been followed:
-
-1. *Format the Commit:* Format the commit into an email message. To
-   format commits, use the ``git format-patch`` command. When you
-   provide the command, you must include a revision list or a number of
-   patches as part of the command. For example, either of these two
-   commands takes your most recent single commit and formats it as an
-   email message in the current directory:
-   ::
-
-      $ git format-patch -1
-
-   or ::
-
-      $ git format-patch HEAD~
-
-   After the command is run, the current directory contains a numbered
-   ``.patch`` file for the commit.
-
-   If you provide several commits as part of the command, the
-   ``git format-patch`` command produces a series of numbered files in
-   the current directory – one for each commit. If you have more than
-   one patch, you should also use the ``--cover`` option with the
-   command, which generates a cover letter as the first "patch" in the
-   series. You can then edit the cover letter to provide a description
-   for the series of patches. For information on the
-   ``git format-patch`` command, see ``GIT_FORMAT_PATCH(1)`` displayed
-   using the ``man git-format-patch`` command.
-
-   .. note::
-
-      If you are or will be a frequent contributor to the Yocto Project
-      or to OpenEmbedded, you might consider requesting a contrib area
-      and the necessary associated rights.
-
-2. *Send the patches via email:* Send the patches to the recipients and
-   relevant mailing lists by using the ``git send-email`` command.
-
-   .. note::
-
-      In order to use ``git send-email``, you must have the proper Git packages
-      installed on your host.
-      For Ubuntu, Debian, and Fedora the package is ``git-email``.
-
-   The ``git send-email`` command sends email by using a local or remote
-   Mail Transport Agent (MTA) such as ``msmtp``, ``sendmail``, or
-   through a direct ``smtp`` configuration in your Git ``~/.gitconfig``
-   file. If you are submitting patches through email only, it is very
-   important that you submit them without any whitespace or HTML
-   formatting that either you or your mailer introduces. The maintainer
-   that receives your patches needs to be able to save and apply them
-   directly from your emails. A good way to verify that what you are
-   sending will be applicable by the maintainer is to do a dry run and
-   send them to yourself and then save and apply them as the maintainer
-   would.
-
-   The ``git send-email`` command is the preferred method for sending
-   your patches using email since there is no risk of compromising
-   whitespace in the body of the message, which can occur when you use
-   your own mail client. The command also has several options that let
-   you specify recipients and perform further editing of the email
-   message. For information on how to use the ``git send-email``
-   command, see ``GIT-SEND-EMAIL(1)`` displayed using the
-   ``man git-send-email`` command.
-
-The Yocto Project uses a `Patchwork instance <https://patchwork.openembedded.org/>`__
-to track the status of patches submitted to the various mailing lists and to
-support automated patch testing. Each submitted patch is checked for common
-mistakes and deviations from the expected patch format and submitters are
-notified by patchtest if such mistakes are found. This process helps to
-reduce the burden of patch review on maintainers.
-
-.. note::
-
-   This system is imperfect and changes can sometimes get lost in the flow.
-   Asking about the status of a patch or change is reasonable if the change
-   has been idle for a while with no feedback.
-
 Responding to Patch Review
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.20.1

