Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E48C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 13:56:32 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.337.1635861391090326219
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Nov 2021 06:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UwsXyLWm;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id c4so3487904wrd.9
        for <docs@lists.yoctoproject.org>;
 Tue, 02 Nov 2021 06:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jSPz+kluWCdwMqjYGYDVeFyAW9Si5w28Vu5tiY9/Zdc=;
        b=UwsXyLWmuTmuNql20OXy1U16DWqblDUUhWRBiGiV9LGNa9712pJE15DJyy56+rCozI
         NxqnfcZeDLUp78zHJQQzwuMMM6h427IGJRdgkZawoH0Xuf95qVOcJgD/3ODjnkRHJjPG
         cQBEikYe6TWSjd9z2YriNQ8xyc2t/cteniAH3kH5TDOpiNYPTGH5gLDFhrnMCKRw272l
         dF+W4vysHc+MPa8ma/ozO6YVkzgcLzFEJXu6NgZOjI+ibU3qhU8Spr3glE29Dwe/MXTz
         Nvf64Bhbdi2vl8xuNbLin0p4BSxYiBvdL3JF2wVB4/iE8lAmDWBRBrqI0FSiADxQCKqF
         vLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jSPz+kluWCdwMqjYGYDVeFyAW9Si5w28Vu5tiY9/Zdc=;
        b=C14IDVhMlgQ1O8Z8OMfOa9vsQfRcZgPjGH+rI+JdYah334xNs9WWLINN2r/UoBkjwU
         z3ANxldLDXXcW7lOA+tZ9YHPfrrIGjGp27lyTI3K4tgKYNo7Z6hn59vfp/aOfS+2Z8hG
         JwMmN9FssYBA7jcYtJE4vjZGyVsBHHTwYIzbRlRHWf6hqeAEdNFsL5hWB+Pn8MU5+WFZ
         0ABZjBsneh2r/W6gdcCdpKj8wQbN0HAtErEmUuusWNo5fIUftCy8ZRWSj7qH3SSj9S18
         WjNuomu1UttQmuWDMsP0sGztS0oJANpCAcq/uamPNILaC9xLyEIorFzv12adDykeVVCv
         XBWQ==
X-Gm-Message-State: AOAM530vkcX9mfZko6d/RfCd4f0RrQ0f8a0yMqLoUu5wWeLvBXnUgSrA
	WnD4EYU6xH6rL683Uz4Hk/+HMGCJGU+1dQ==
X-Google-Smtp-Source: 
 ABdhPJwIln6MjQzipTgrxb14X3Ei/xjp5Gm+VaR/tugxA3Z6Wp8B0STrFv/O4gu6YeJLC+/UtTyRww==
X-Received: by 2002:adf:d0c2:: with SMTP id z2mr25150260wrh.330.1635861389119;
        Tue, 02 Nov 2021 06:56:29 -0700 (PDT)
Received: from slackware.local
 (dslb-002-205-236-012.002.205.pools.vodafone-ip.de. [2.205.236.12])
        by smtp.gmail.com with ESMTPSA id
 m2sm2588595wml.15.2021.11.02.06.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 06:56:28 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2] ref-manual: update overlayfs class
Date: Tue,  2 Nov 2021 14:56:14 +0100
Message-Id: <20211102135614.19552-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Nov 2021 13:56:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2064

Describe how to use a generated helper service to set up a proper
systemd dependency chain.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 documentation/ref-manual/classes.rst | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 9b1ead66b..5bc4472e3 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1742,7 +1742,8 @@ Then you can specify writable directories on a recipe basis (e.g. in my-applicat
 
 To support several mount points you can use a different variable flag. Assuming we
 want to have a writable location on the file system, but do not need that the data
-survives a reboot, then we could have a ``mnt-overlay.mount`` unit for a ``tmpfs`` file system.
+survives a reboot, then we could have a ``mnt-overlay.mount`` unit for a ``tmpfs``
+file system.
 
 In your machine configuration::
 
@@ -1752,6 +1753,19 @@ and then in your recipe::
 
   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
 
+On a practical note, your application recipe might require multiple
+overlays to be mounted before running to avoid writing to the underlying
+file system (which can be forbidden in case of read-only file system)
+To achieve that :ref:`overlayfs <ref-classes-overlayfs>` provides a ``systemd``
+helper service for mounting overlays. This helper service is named
+``${PN}-overlays.service`` and can be depended on in your application recipe
+(named ``application`` in the following example) ``systemd`` unit by adding
+to the unit the following::
+
+  [Unit]
+  After=application-overlays.service
+  Requires=application-overlays.service
+
 .. note::
 
    The class does not support the ``/etc`` directory itself, because ``systemd`` depends on it.
-- 
2.28.0


