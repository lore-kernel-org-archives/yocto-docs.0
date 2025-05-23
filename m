Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0D0C54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 14:34:51 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.49475.1748010883209290830
 for <docs@lists.yoctoproject.org>;
 Fri, 23 May 2025 07:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=ZkBEg4ac;
 spf=pass (domain: snapchat.com, ip: 209.85.218.50, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad56829fabdso917214866b.1
        for <docs@lists.yoctoproject.org>; Fri, 23 May 2025 07:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1748010881; x=1748615681; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+1yF1Hjn2kGLEJUJ2zbLbMXrbzpsFotuKHFDOpC7Ncs=;
        b=ZkBEg4acfjcxiI+svXeJA1cCibWYwj82JceMLzWPCOrlGgB7ysL7Dl8YuxmXHrGLeZ
         EtzRfrlRznl77Ha6mvt9Pu7QNS8/gTUVQ89zrfQ36NEznHm6WlZeQzz1YPvFAx18uiS7
         6YXfjiJt/RyFWF2zQ0nMvKxLGZmqHuUa1creU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748010881; x=1748615681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1yF1Hjn2kGLEJUJ2zbLbMXrbzpsFotuKHFDOpC7Ncs=;
        b=VmndBqMLsFO+g5GL1KNzzr7X2J4/sndPZ/iDJwzzvU0cakBS13VxOPYi5BalsLI0M5
         3MUsZbu+PVh4bl7Qd96XEp1rUhN9jDvwJrN8hTBGjAZf8TSwavw/P3BrQC1TYHL+aE8n
         0PBNRCPOqCGmZoVpkaV0iVJ58IJz3eKIYKBPw0EZzJbcTTGZR5rCbF1fj0NPt52MC2KT
         Juerx8J+qqNCehQLqSddON4ugxXqMnFfGHuBLbDsvwrWRbS+K1VeGn7OahzyMb60a7fF
         f8CAlwuZNexGsn70f4jshMPKoqewCm3gDhANrJw9yTLu/3juLX1upSqQCa3I3GU1HJvT
         qNAg==
X-Gm-Message-State: AOJu0Yyjd7a9LVtBrHhnByhUFwX9j0CKXYGHXlJ8KoNB4sCr81K0i27S
	vc+TJC5YYXB2ZvryrleuzWv/xUPdD1r2xYqM8TynX9zHN67KWa6fUIkcdQMTvp48BkStxE0Oywg
	kwArIY24=
X-Gm-Gg: ASbGncuf9ETwv3y1/kn1bFxkDHjpB/QkfFgqedZkvA4E2hx5/vLE+uzVW2e3Tu5+Iz5
	UiIaIfvoKL8SV/A15kU+lJeiUXqRo2GBFDBWwGQM/1Xph1wqpoYwhizPXNoom42dYdyGZ0l+4YH
	0gykuQmEspekYigwDVXuSJ0yZHskoUQgSBnoRGzm5wRWF1cIXybpYTAnwgGAdDOuprX1Dsz3Xss
	TlP7Uwa+9vSAnpqOHwNydhC/rUBh8Sz0+OdhGaup3PHmZuWLBTeJtlDMRN9gaZZb+U2d7yQc63D
	BodlTBXjR/UUz2MEJxWmYoDT/LG1zmklQA8rh8ZRFWi+N+I/O955kU/ApLPH4ls=
X-Google-Smtp-Source: AGHT+IEYHwTEVCOLCtWpoXoWWGJ4NMRDjsoxsNMBHJBsQEIL7rIfXIqXAKXNAcUqDjDUokVWqXyFwA==
X-Received: by 2002:a17:906:9fc4:b0:ad5:3746:5906 with SMTP id a640c23a62f3a-ad7085589a5mr294269466b.49.1748010880793;
        Fri, 23 May 2025 07:34:40 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d275d9fsm1234632766b.74.2025.05.23.07.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 07:34:40 -0700 (PDT)
From: ecordonnier@snap.com
To: docs@lists.yoctoproject.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [docs][PATCH v3] ref-manual/variables.rst: document SSTATE_SKIP_CREATION
Date: Fri, 23 May 2025 16:34:29 +0200
Message-ID: <20250523143430.194305-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 May 2025 14:34:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6890

From: Etienne Cordonnier <ecordonnier@snap.com>

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 documentation/ref-manual/variables.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 643a3e7ae8f..e2ec4e97599 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9049,6 +9049,26 @@ system and gives an overview of their function and contents.
 
       For details on the process, see the :ref:`ref-classes-staging` class.
 
+   :term:`SSTATE_SKIP_CREATION`
+      The :term:`SSTATE_SKIP_CREATION` variable can be used to skip the
+      creation of :ref:`shared state <overview-manual/concepts:shared state cache>`
+      tarball files. It makes sense e.g. for image creation tasks as tarring images
+      and keeping them in sstate would consume a lot of disk space.
+
+      In general it is not recommended to use this variable as missing sstate
+      artefacts adversely impact the build, particularly for entries in the
+      middle of dependency chains. The case it can make sense is where the
+      size and time costs of the artefact are similar to just running the
+      tasks. This generally only applies to end artefact output like images.
+
+      The syntax to disable it for one task is::
+
+         SSTATE_SKIP_CREATION:task-image-complete = "1"
+
+      The syntax to disable it for the whole recipe is::
+
+         SSTATE_SKIP_CREATION = "1"
+
    :term:`STAGING_BASE_LIBDIR_NATIVE`
       Specifies the path to the ``/lib`` subdirectory of the sysroot
       directory for the build host.
-- 
2.43.0


