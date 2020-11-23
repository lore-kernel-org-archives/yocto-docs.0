Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.39245.1606154547474179496
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 10:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=J7ws6kg9;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id p8so19509625wrx.5
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 10:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wLJPULC83/yrKlvCFZVeu6msmigU/0mr9tZcuWOQugQ=;
        b=J7ws6kg9oXUiHtBgLc6D65JuW27qJwN0C8ehMGo66K3VmEwOS0+UWjMDdkOAN6bo3w
         wNb6QmZm/trIjR1H7MT3QFDSAQfdy140rODi410X9fHtAMtIjOMcDCeHz0gxHPhNJQIN
         36pNOezWXbKRjjYPlIAL1CSGnXNxubcd0m8KM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wLJPULC83/yrKlvCFZVeu6msmigU/0mr9tZcuWOQugQ=;
        b=dgs4ki4mN8sqoaXIlaGUiFbQcrxskPSexcK4vJZLBrqewARWDnUVy4FKWUWrQDJjak
         Lp/IMCx1oaYm+cSmR54LfM+eog81mBTbugZGYsr+O74UZvhMCPfZb6Clfl0wDEbKxpIC
         lDwBlnL378W0q/OC8GrTNDOWdqJAXYLhg2qV7ug4RPswQ03jHLjLIriewW5iQs6fIwbX
         8hrZI0x00dsIzxcRJh2TEMiElAtQglbREBO3Ua4KhCU+lZSPvsd+tZfEBEfM2cYkwxKZ
         Hk89GkyWqKAe5LJK6Z3Z9LNa7GJmXpDCbWaxU2NBbBBql0vyOGoGA8x+ETxu1gILB9ih
         KUPA==
X-Gm-Message-State: AOAM532lT7EsQys63LIImEwaOe1Y13vkeM+hybf/+CJso0Cn+wlBv/ok
	Obj/pt8Y3iD7CDc6o0YP3Xs2Djrf0eDmvw==
X-Google-Smtp-Source: ABdhPJydSR3jWjnF+B6yvoMP52eParOuhDszmkGInzK0QVj46Ojmo6oieuWnRIX+Hntm9K84BpI4Ew==
X-Received: by 2002:adf:f944:: with SMTP id q4mr932379wrr.120.1606154544185;
        Mon, 23 Nov 2020 10:02:24 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id v8sm117315wmg.28.2020.11.23.10.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 10:02:23 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v3 2/7] dev-manual-common-tasks: Update & move patchwork reference
Date: Mon, 23 Nov 2020 18:02:14 +0000
Message-Id: <20201123180219.1966-3-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123180219.1966-1-pbarker@konsulko.com>
References: <20201123180219.1966-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a link to our patchwork instance and note how submitted patches are
checked for common mistakes. This note is moved to the section on
submitting patches via email as that is the place where most users will
run into patchwork/patchtest.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 .../dev-manual/dev-manual-common-tasks.rst    | 23 +++++++++++--------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index e2957f479..d43205712 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -10688,16 +10688,6 @@ Other layers may have similar testing branches but there is no formal
 requirement or standard for these so please check the documentation for the
 layers you are contributing to.
 
-.. note::
-
-   This system is imperfect and changes can sometimes get lost in the
-   flow. Asking about the status of a patch or change is reasonable if
-   the change has been idle for a while with no feedback. The Yocto
-   Project does have plans to use
-   `Patchwork <https://en.wikipedia.org/wiki/Patchwork_(software)>`__
-   to track the status of patches and also to automatically preview
-   patches.
-
 The following sections provide procedures for submitting a change.
 
 .. _pushing-a-change-upstream:
@@ -10992,6 +10982,19 @@ without using the scripts:
    command, see ``GIT-SEND-EMAIL(1)`` displayed using the
    ``man git-send-email`` command.
 
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
 Working With Licenses
 =====================
 
-- 
2.20.1

