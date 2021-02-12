Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.7.1613106056001494708
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Feb 2021 21:00:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M6x2gzNM;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: champagne.guillaume.c@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id t63so7701349qkc.1
        for <docs@lists.yoctoproject.org>; Thu, 11 Feb 2021 21:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UQkax3lnmgVICVjXsm9UulJ6oiSkXDRqTQzXmOKOpU0=;
        b=M6x2gzNMOCQS8ifsm/V267ZvK5U8dy2y8PBWYHomHvgdXpik5kOLV/Kl6AKby9nfTL
         RQQdoQAjixK7/PoL0UAKnSXCmtYEv7QmoIFzGDZcEX0TNu4t7dE+wuwpLBQvrY0wpoOs
         lcLBUU6z93JDZ0jiHujpPnsCc2xQAbCx1pMl9HbOVcPNxB0gNvIXCFKk+E0a5Fqz4VMW
         dR9RgFZPfBr7jpn1W5aEoZZgny7HqU0Iod/zDMkQ9RIJJ1YOZWIeA9UtZt8o6YfAprN1
         DzE0s0UWsp1CwsXSM+7qPYpPEf+heAqaSVlkKEOUWaiQie1NQ6ACG9WtfnD1yAX9uMvk
         l2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UQkax3lnmgVICVjXsm9UulJ6oiSkXDRqTQzXmOKOpU0=;
        b=BwHDWOhfJi4fc61ohC0ni5dLblODUuAH8va3dH7YhZfdDN1ICE6lIAQwIAhRIQDgBp
         WaSMQHAwFOOXT0Bc1UcsOBD7hoh+i7eh5dbbYSh9It+i+/iObm4lcoZthjNtfj4n0KXM
         r5oKSyLHTzi3Yv+081zZDavrBLT9CBFiEBr8aZzfti3CoIOyNxXTYLNzV15cwhMe6ipi
         e79rpNQFSvYIiEU0AqTjoMR5JGihLwDuSV5AMHRNDlaH1twz9SlGOLzQX8HHUeBqm16I
         MSXotA54IPdt2RgtgeaO7R7nk5TFG1ZDlmznhtoBAolX0JRCanqLrDVhnfiFB7AFwWpj
         USQw==
X-Gm-Message-State: AOAM532oB5lg7qHY0GCr9llZ2u/X3y6bFSpp0sHpWmN4CVd3SFMPUL2R
	8OOco24OhJGaS7cu6novQd6A1AValxg=
X-Google-Smtp-Source: ABdhPJziHM/h+cpkpBcKGgfyX6IYV+FhKflD6pC50X+WlLeLPSWqLri5P4mGs5ttLWTyHTPWa/fGYg==
X-Received: by 2002:a37:9d4b:: with SMTP id g72mr1090634qke.71.1613106055043;
        Thu, 11 Feb 2021 21:00:55 -0800 (PST)
Return-Path: <champagne.guillaume.c@gmail.com>
Received: from gchdesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id b16sm4781199qtx.85.2021.02.11.21.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 21:00:54 -0800 (PST)
From: "Guillaume Champagne" <champagne.guillaume.c@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Guillaume Champagne <champagne.guillaume.c@gmail.com>
Subject: [RFC PATCH 1/2] dev-manual: change qemuboot.conf for qemuboot.json
Date: Thu, 11 Feb 2021 23:59:54 -0500
Message-Id: <20210212045954.18173-2-champagne.guillaume.c@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210212045954.18173-1-champagne.guillaume.c@gmail.com>
References: <20210212045954.18173-1-champagne.guillaume.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
---
 documentation/dev-manual/qemu.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 766691b97..92b234e7b 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -252,7 +252,7 @@ be a problem when QEMU is running with KVM enabled. Specifically,
 software compiled with a certain CPU feature crashes when run on a CPU
 under KVM that does not support that feature. To work around this
 problem, you can override QEMU's runtime CPU setting by changing the
-``QB_CPU_KVM`` variable in ``qemuboot.conf`` in the
+``QB_CPU_KVM`` variable in ``qemuboot.json`` in the
 :term:`Build Directory` ``deploy/image``
 directory. This setting specifies a ``-cpu`` option passed into QEMU in
 the ``runqemu`` script. Running ``qemu -cpu help`` returns a list of
@@ -355,7 +355,7 @@ Following is the command-line help output for the ``runqemu`` command:
      runqemu
      runqemu qemuarm
      runqemu tmp/deploy/images/qemuarm
-     runqemu tmp/deploy/images/qemux86/<qemuboot.conf>
+     runqemu tmp/deploy/images/qemux86/<qemuboot.json>
      runqemu qemux86-64 core-image-sato ext4
      runqemu qemux86-64 wic-image-minimal wic
      runqemu path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial
-- 
2.20.1

