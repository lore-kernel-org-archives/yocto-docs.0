Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14810.1795781138948629989
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Nov 2026 04:05:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cB04P2Qr;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55bd96affd2so108709261cf.1
        for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2026 04:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795781138; x=1796385938; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3+RFSY8MvadtQcMdF+J6zcTtMU8DyFjjJGMmMGW+qpA=;
        b=cB04P2QrIvgff42Dw+tBSOl2RL2B2kabCvLR47ben0rQslFd9QGEENmK69LjD6Ov6+
         bm9IrcnYQIrFQTzcDNh/YNeY1O31q6uHwn6o0d8gatbbqLHnmNHEOiFizaL4Rnq39PIQ
         8+BnyMScfzmuEewYE3FnzmTMJeOU1dftFfvtZuNA3Btfm3is5zU8payLcM1pRikwsb9z
         clVENOaGUu6h83WrXIveXs3xwptMIiJpu9KCUQh7UJazIO2jvzseeXOD6qZWfXfeRjv0
         FSJYXgkxkFHbFt2Ko3EPeamIdboLq6EVz7SmTsum4x8Jww1E7pRioU9lcJNzIitPHwK0
         LdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781138; x=1796385938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3+RFSY8MvadtQcMdF+J6zcTtMU8DyFjjJGMmMGW+qpA=;
        b=ntCodomm6mkm5SGsM+/9dP7F82vyFFBHMSrojPnmnx0EFQAg/dlepmbXBR20/Apm0J
         +0jVGBto2ocbB/9eOPUj0tAPVcnbK0gdHHRCPz9niRkl8F+XYywSvRU0qT33MItzTtOX
         +vdHWrtASULScV3itLXQL9v5vzGe3rg/gS7YijYIm+KhMCWj0QsBqBwFgyBPG7sNRYzu
         RppZG4VCfVJy/Ehn6WOWRO1kVH3+p/mfIpYn/aT+4lXqan1mbbtWiNZsV/acGr9/6J7N
         D3umGnuCKI5tpUEpZFcwn7E6+hoB+YrD10pz1UPCxcVUo3lK3vN0aw2YMdCADJ3qnBb1
         416A==
X-Gm-Message-State: APuU4Z/FDw6StowSJbBdxH5Ynv7lt5onr4Q3sRB3QynJ4ueI8ZVS7f9A
	0hTrwsbkDNfjM/W1SylT+tFTMGYdlnFb19qaCrU24xSUFIvvWoOvkSV2GmdJqw==
X-Gm-Gg: AZFdTZc2DfDgsoaE6dI1trtNCr7FFu3mcZqDQFcgU2cbTGwx9E28AVt37a/w/OTk/ms
	rinjenD27ozJqEDzFpVbTrnuisQd0vR4DKq+BgI+0R5ajNXVdU74AWMSUfzH1B9QHQClfznic51
	KLdE/Q/9Fz9sHyr+gKDghjHuE1XkF78cKHvhkg/25UkQgse55baIXVK4VO9H+pTSRjmU2lh0ep3
	g2fv5uIKr8BrvlHjNLoWPQlfDSWCaOMsC7G2cbRW8o4waOjuQt2LnOV+Wsffqu7hXSqFfMPddml
	C0IqMbKlxonUgOeLDX3SfPFpMLip3IjqvQ+nNXDUn470y7FPCrJeiLnktIueDM11IP2n2QLC6eZ
	KsXFMJkXhu7lIgPz6iW/jnUFxFnoXqx/L9FuksOsEDEe7uHD4TwGGN/JUcTeuFgovI9v3lMFYT4
	JM0iKZq1ioZ4f4IT70CQsbm9Z/TBilmAZABg8Qge3HXtOHhvYfEziLA3reQ5fyykmOfgHnN6X4h
	5WmEp8raBb/A7Z3C4Y9rAlJUQSR18nNiV0sIDGrUTS9QfG+HbC/HgYkB965xgwilTV6skEUt2YN
	aJPUXDodfo8KhRx4wD3uDNqMW/fOMOy4OKFIR8cNOlqFb2yHZJ+HNsWZQA9vZ94AcKzLh4JH2ft
	hmq7BZH5VjF+O75BR
X-Received: by 2002:a05:622a:1aaa:b0:55c:307e:c961 with SMTP id d75a77b69052e-55d768a0566mr421340651cf.3.1795781137869;
        Fri, 27 Nov 2026 04:05:37 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7884b5e9sm208106041cf.18.2026.11.27.04.05.35
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:05:35 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v3 4/4] dev-manual: use the pydevshell lexer for the session example
Date: Fri, 27 Nov 2026 07:05:28 -0500
Message-ID: <20261127120528.837051-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127120528.837051-1-twoerner@gmail.com>
References: <20261127120528.837051-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2026 12:05:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10857
Content-Type: text/plain; charset="utf-8"

The pydevshell session example is left to the default language. Tag it
pydevshell so the prompt and the Python typed at it are highlighted, and
the results are not.

AI-Generated: codex/claude-opus 5.5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- new: tag the session example pydevshell, as asked in review
---
 documentation/dev-manual/python-development-shell.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/python-development-shell.rst b/documentation/dev-manual/python-development-shell.rst
index 034100ae8799..76167f5bacf4 100644
--- a/documentation/dev-manual/python-development-shell.rst
+++ b/documentation/dev-manual/python-development-shell.rst
@@ -13,7 +13,9 @@ specified target. Then a new terminal is opened. Additionally, key
 Python objects and code are available in the same way they are to
 BitBake tasks, in particular, the data store 'd'. So, commands such as
 the following are useful when exploring the data store and running
-functions::
+functions:
+
+.. code-block:: pydevshell
 
    pydevshell> d.getVar("STAGING_DIR")
    '/media/build1/bitbake-builds/build/tmp/sysroots'
-- 
2.50.0.173.g8b6f19ccfc3a

