Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C507C98321
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 17:29:29 +0000 (UTC)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3772.1790270969173303134
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 10:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VFfbL4l4;
 spf=pass (domain: gmail.com, ip: 74.125.226.204, mailfrom: twoerner@gmail.com)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97ea5bd53b4so43857241.0
        for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 10:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270968; x=1790875768; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=evrITKAmrmrAZEbz6xgdJyqZke7wj7FiYh0+udie8Uw=;
        b=VFfbL4l4vzWmiajhQFg3ViQloayCV8A2a03NpXftTloP90rHerJED7HA3i0OXPtlap
         rCfvnqTS1CnAUWCWa8ZkP0dTcbebOW6REMezRj23YjdgouAt02k2CnAg4QlZ96nl7euD
         c2mgQ1j1wvPik47fzQhg1YDOyLFNWtq1qRnSP7vByC3kw6+uZt/4sJadEf8V950DAXal
         pjq/TEbPslqhRSlOWxwgpTAv/l2GpuyvZ4xJKRXXWW8aK8BF6gfDBAt40SZnho0v20lG
         RCp9QtgjQqhNYeXeg+48BTWZK8HMX8Bz+loR+oYI34itsXbVSsXitiorlpQbpHz7LfOW
         MJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270968; x=1790875768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=evrITKAmrmrAZEbz6xgdJyqZke7wj7FiYh0+udie8Uw=;
        b=mqTHuZGQd6y4FnMSs+3QbMR3RQ2uNI2vnaqoFsyBzr+d830SRKM3hCh9wlhmjEDuyR
         dpegwUPuCD6Gn7mKYjhxtySBU2SNeG6DkQmfXwjiWKCfZCx8dJJ1LHy+FVbPYRzwl4zO
         oFnk3DFw0glcAg0tvmmJrSHtaiza6pl2iSwnqqEmKVWT9aC5WsrD89IoIdfk76wUnaAU
         sJxafUJKt9SWUJ1VhKDmxxN/vVRfMldDyzDWvl478jeHog6GMTaIMjqacOLIUUHYrqmG
         p+E32LGx10cRPwqzaa87+kIAhbcJZCHsyOtJKQEUGedP9P+sQRgyZHiGi4MlTWxIbuPr
         edMA==
X-Gm-Message-State: AFuF++mhvM3GrGqkXDB6JyEub0mE2kT+pIAbpk3npL1LRk/09TJBz72v
	IrsvWjglR3sxTFCLRLIj0uFEmrZ4BrbEXI/LAWRcSYdaUVZZtFvmO2WrnASTWQ==
X-Gm-Gg: AYBFou2Esj/w9RYjnwOrDJYt3ogZwWQTzahn++WO3B+I430SqhyS8zIy3a8iooICHyz
	xEppPHOdABHf+xh+VJnCqGj1GYuIOqNgEaQ3Kv8V80/Zbxr/w6Nd+HQGv1N862I+P0hMmvk2sLw
	cOpteqO2Z+pBuYCSPbNaRlCIeRX97iNh2MY/LX10Y1J7u6xHXRmPU4Bhm+SQRHij1siraz5cE4k
	9Is3/rkN7Ep9pK+NkFPCSJ41hh08mJh2Hqyv7oRdL6TDDjCInLzUY6KqdjH3aS6l0YlL+r1Hh58
	4fBe+Uo3B5diezEMfl0+I5Fgv9tZV9QKqLQ51+Rp4rPdnF1IdZByR2FwmLHaO7nqTJqWX6kV4zJ
	v6ui+LaQGbiCBSwuAiaQVURCeBfAptM09f9nbyncxy1mhQHwYjYuWIoETcLTeZ2/mgxvX2gtvS7
	DTUKkfxC1yutb25AiPOiZPR+k9iP2DOtw0LXFwQCjeWeWu9fDKqueG6o11pPF7+9PW5an/shick
	DuTliON9yF1FQQpbFS96b/CW5hnt5KvLKqnnrRw
X-Received: by 2002:a05:6102:a47:b0:7a5:4fe2:b380 with SMTP id ada2fe7eead31-7af1eff6903mr1555033137.26.1790270967878;
        Thu, 24 Sep 2026 10:29:27 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98530725838sm1797974241.0.2026.09.24.10.29.26
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:29:27 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v3 10/10] dev-manual: indent a list continuation so the code block ends
Date: Thu, 24 Sep 2026 13:28:53 -0400
Message-ID: <20260924172853.2665062-11-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260924172853.2665062-1-twoerner@gmail.com>
References: <20260924172853.2665062-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 17:29:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10633

The second line of the enumerated item is not indented, so the item ends
after its first line and the "::" opens a literal block at the top level.
Everything more indented then belongs to it: the assignment, the paragraph
explaining what packageformat may be, and the note beneath them. They
render as preformatted text inside the code box, and the note loses its
admonition styling.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- back in the series: applied on 2026-09-22, then unapplied by the
  master-next rewind
---
 documentation/dev-manual/packages.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 8cd90b9f25b1..380d806be041 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -561,7 +561,7 @@ to use. In your configuration, you use the
 variable to specify the format:
 
 #. Select the desired package format as follows from your
-:ref:`structure-build-conf-local.conf` or distro :term:`configuration file`::
+   :ref:`structure-build-conf-local.conf` or distro :term:`configuration file`::
 
       PACKAGE_CLASSES ?= "package_packageformat"
 
-- 
2.50.0.173.g8b6f19ccfc3a


