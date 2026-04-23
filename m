Return-Path: <elmehdi.younes@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9794FF589CB
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:59:15 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18753.1776949153427624687
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 05:59:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qDechTw+;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: elmehdi.younes@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so6812386f8f.3
        for <docs@lists.yoctoproject.org>; Thu, 23 Apr 2026 05:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776949152; x=1777553952; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k/4hBCCvCg3fxF4NMTfBccJXsJpN+9XxGeN7TaPikhY=;
        b=qDechTw+eXkBprJ2eFcynnudaA/Q2dNEsZ45XPQbNQ9XsaoSZLV142O7IvqzjkjrqO
         KThUxUlzfLOxceQaj4X0o0P8+NaGL2FWBBiCaBh9+DxWccgcjQ1NQjJ2GaRm0nneZPtA
         FRll1VCEUZWcXfrLXMTrqISMwbWHjeJPBSGuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949152; x=1777553952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/4hBCCvCg3fxF4NMTfBccJXsJpN+9XxGeN7TaPikhY=;
        b=nW6h/JgGBP1vZUaoUAUKy4WfpaZ5rvQKp3+fFIyX7ML+LO/E1mJ4kzSocDpMK4biX5
         FNzU8CMoMSnNmbeFq2lmOlo7LmWYp9r2RDauN7yJOcaK9IiiwUbLTrVLkrK4jpCu7Y+B
         wEFPe83gGqN8SqCM3Zt9z8FpsqGCn0zKK8fO9g+p7mu8xhJ/d83fVgV4qWE+agHUUoXA
         Z3f3qeoh5AKuZp3XgRRnMpST5JvX7z6qkXGqQzyhgPmWrK/B/nLT60OrZgyzspZk7DT0
         5INZvx89MpwiZG2gUVDQKPlKETSTD0RDL+PGO6jN8u/oNpd0rqa+RSyJGLv5kfbDyXUP
         7HAA==
X-Gm-Message-State: AOJu0YzCLC2lJkhPalH9ReEjQOuGpw64pHJpjuB7JpBRL75629vd3lwE
	PJWKftBon36nlfUTN8ZSGy8Rp2XSjWj31ar0cfmfM4WmyxW+fYNWGNvhhbwUThtzvPM=
X-Gm-Gg: AeBDiettxXrjnmJitgf3/Pp9CTMeL9OO35yg49Rd7+vhfg0rDE6Y0GqaWGaNt6QYzIH
	PPrcZQGaj7X6WqdRUFc62h80dajv8d6CcNA9FH3LhDg6BYD7AF4hw/jgOZ1xRER+6RT5FNnURWA
	Xh1fgHk9QTVk0KuKXOmvsfrW8fth7OIPZg/06n9VTGeQXz3n6Na9nTcGDu24hY6Mef7MMxfbsB4
	PTrRi/+BSrdBjXuPDaRCUl7fGo/m4KjivPwNkkuM9Q7fLXVPvIwOEiKmktbfm0Wx75KY5xWbZiH
	JmGJ//D6TUQqnmxCyaQZ0FuyvyA/ocm5t1AQt5WKQ6/VfZmI1qOFvt66X9icKmp+AYA4HtH7Zp5
	zYudZ8LHqiX6gxYfgZnvrli+7mxlG16aH1ioKydumrySPmpZqBhgT+te1PT7MsLa0CMNhbdzyox
	x3LuzpDXA8M8yY0Gq0vAKQTi9SCKCM02DdtZhSPf/9XaTyryGXgwqjH+y7iFPvu/vfuf8eYektc
	Zcv3noVSYBCTgO9s1byBN8W5dUPfsBA
X-Received: by 2002:a05:6000:22ca:b0:43d:50c:6f33 with SMTP id ffacd0b85a97d-43fe3e0bde7mr42417334f8f.26.1776949151682;
        Thu, 23 Apr 2026 05:59:11 -0700 (PDT)
Received: from FRSMI25-BOLET.. (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm50709086f8f.31.2026.04.23.05.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:59:11 -0700 (PDT)
From: El Mehdi YOUNES <elmehdi.younes@smile.fr>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	El Mehdi YOUNES <elmehdi.younes@smile.fr>
Subject: [PATCH] bitbake-user-manual: Fix bitbake-setup settings command
Date: Thu, 23 Apr 2026 14:59:02 +0200
Message-ID: <20260423125902.1146038-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Apr 2026 12:59:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9334

Typo in the bitbake-setup documentation.
use "bitbake-setup settings set ..." instead of
"bitbake-setup setting set ...".

bitbake-setup: error: argument {list,init,status,update,install-buildtools,settings}: invalid choice: 'setting'

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 .../bitbake-user-manual-environment-setup.rst                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
index c22e19bd6..77fc4c3dc 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
@@ -674,7 +674,7 @@ The ``bitbake-setup settings`` sub-command helps modifying the settings of
 
 Settings must be set with a section and a value, for example::
 
-   bitbake-setup setting set default top-dir-name bitbake-builds
+   bitbake-setup settings set default top-dir-name bitbake-builds
 
 Will set the value of ``top-dir-name`` in the ``default`` section to
 "bitbake-builds".

