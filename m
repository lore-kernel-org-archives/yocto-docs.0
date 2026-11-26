Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6922.1795732616878624283
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Nov 2026 14:36:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=C0eQtKey;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-92157f2e8c1so58580666d6.1
        for <docs@lists.yoctoproject.org>; Thu, 26 Nov 2026 14:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795732616; x=1796337416; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P1OWVU62l40giFw7hio7PLhjDGYJ4BA0AF2/wBaUbfc=;
        b=C0eQtKey1GqaURF0OTjha99GFx2Yjwo0jJQV02OmGUdadAHPhSfFlb5tnprffYNf1T
         Wsi8t+JRg9/x/Edo9lsdFozs+rRalm+xkXy2g/zEgezoNmJhmShk5EQkuCa3JjaMeqAs
         80fxP12odSJbrXBPMyfjYY712HTYP4aQoXL0cGKsvL4jaFBCtam6n80KVdzW3fYvbz8h
         bOfliTaJNzvc4Q7BsKtFrmvIboGPtbTtGC7v32i3bjW+WcVWR/YsqBsXZSdrzfp7jWT2
         glfY30El7+Y1gCENuiMve3dgTZvXPPB+ufBCHLdbDKxXKv444s/tV2YdlssNMTuQb4QK
         z5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795732616; x=1796337416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=P1OWVU62l40giFw7hio7PLhjDGYJ4BA0AF2/wBaUbfc=;
        b=w1DUhHwO2bEtJHqISu59H+kGSzsgHNjd3crtDsuGjRpP99tRmPMPsI6yAdxsvuZXGZ
         bGzwBxThET9Xdykp6G+R4z9ytrsxZ+z6EUdGMT1bjEm3qj99KR2cU4/X6iUvManxNIlk
         6QbT1Kd3g73yxJYKltqfTwLwZX5lS7s1iU8K10QCvcfCes9aUhfcmQPdlFJcFLEYt549
         Jvnrj52/HRVPPHaFU7nGduxgOE3dug61nn5rdFhNKCruz6pPxfzHSAmMLPByf1wf9171
         oy7t/sn4UfEMtU129dv065DfbuV1KHIENbCNw3zu/bXS+u64Ekr5jsI16bVfO6UJJOcd
         LCDQ==
X-Gm-Message-State: APuU4Z9JIGkcBbcmhKzpxlYqokR7+NXVgvy+c7QgifR7iGAjraTjw5bX
	JcwX7AKQUW27J57YLzaZuebbz8Teq166NDFwnT04oz5GUV/wAPIgEki0MG9NWA==
X-Gm-Gg: AZFdTZcU4I6Ak4Qwi5XujB9BQKrh5F/Kt+khJPrW/OKpP6Z0y6XgLIA1ycJMtOfcr1s
	uBWsxU6ZVH/1hbMyLGKryMkZehRuRUn/o9wBqmjooD46emh3PBBpj2HQxvtdmKaJunMV0TK0lR6
	mllR/qrjmJCsP2WsLTnILldgLNBLa6PEm0ndmS6+2UEf0xkTR85RqQPoOQexfvjmtTgLhE9Zh3A
	QCxnaFwkST9FUkS7lx1RMKFyhnIqbxHiXi1AvO/fVzP6t5yu+h3yef4oJEuAUUD/GeTYyno2bE8
	HQXe5/LXx1giPWOyrxUWL2Ygput9hYv3vgGZvSyT9kMEfInxecwoKGfkzUBpTaGk/B3+sC+LSQJ
	8k9IhntWoFXtqdX9ZYXiVg3NFDJScFslarIw4PuYPNYl292L54NxTHUaeofiLy1SVZsCPdJobkT
	y9DAmkbq1yyAxWCp20jwq9H/4HUXxJfDMI6tcc1rGaLE7evdSzDjO46nxXG0bBsMPplzrGkyu4q
	TQnSYSfmPQFaJAz1huAB20ZEXq7pOJhw0MRhjbZpmYdLRJP+n5h6uxtwUdehqvvDKfgfj4jSwSc
	5Hi7IvQjx5rfGZ3g6I65ahe5rCs3YziloUHl6BAnqkSPbzLwPhsywNUsg4VGWDxIKqkIA+qNjDT
	+tYTKeINUhwYUqtCFP1eqrahGpx/uxPw=
X-Received: by 2002:a05:6214:1943:b0:921:4cf4:5472 with SMTP id 6a1803df08f44-9214cf4550emr318283046d6.18.1795732615734;
        Thu, 26 Nov 2026 14:36:55 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349ec64csm201742136d6.28.2026.11.26.14.36.54
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 14:36:55 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2 2/2] sphinx: add a lexer for pydevshell sessions
Date: Thu, 26 Nov 2026 17:36:50 -0500
Message-ID: <20261126223650.3701672-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261126223650.3701672-1-twoerner@gmail.com>
References: <20261126223650.3701672-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 26 Nov 2026 22:36:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10848
Content-Type: text/plain; charset="utf-8"

The development manual shows a session in BitBake's Python development
shell, and no lexer reads it: console wants a prompt ending in $, #, or
%, pycon wants >>>, and both mark the whole block as program output,
which the theme greys. The prompt cannot be changed to suit them either,
since devshell.bbclass is what sets it.

Teach a session lexer the prompt instead, with Python inside it, so the
expressions the reader types are highlighted as Python and the results
are not.

AI-Generated: codex/claude-opus 5.5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v2:
- rebase on master, where conf.py no longer lists the dropped lexers
---
 documentation/conf.py                    |  3 +-
 documentation/sphinx/pydevshell-lexer.py | 48 ++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 documentation/sphinx/pydevshell-lexer.py

diff --git a/documentation/conf.py b/documentation/conf.py
index 8992496f7569..7d0e103042fd 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -52,7 +52,8 @@ extensions = [
     'sphinx_copybutton',
     'sphinxcontrib.rsvgconverter',
     'yocto-vars',
-    'wks-lexer'
+    'wks-lexer',
+    'pydevshell-lexer'
 ]
 
 # current_version = "dev"
diff --git a/documentation/sphinx/pydevshell-lexer.py b/documentation/sphinx/pydevshell-lexer.py
new file mode 100644
index 000000000000..a0dd7c9fa684
--- /dev/null
+++ b/documentation/sphinx/pydevshell-lexer.py
@@ -0,0 +1,48 @@
+"""Lexer for ``bitbake -c pydevshell`` sessions.
+
+The development manual shows a session in BitBake's Python development
+shell: expressions typed at a ``pydevshell> `` prompt with their results
+beneath. No existing lexer reads it. ``console`` is a shell session and
+wants a prompt ending in ``$``, ``#``, or ``%``; ``pycon`` wants ``>>>``.
+Both mark the whole block as program output, which the theme renders in
+grey, so the block ends up dimmer than the prose around it and no better
+told apart.
+
+The prompt is not ours to change: ``devshell.bbclass`` sets
+``ps1 = "pydevshell> "``, so what the manual shows is what the reader
+sees. That leaves teaching a lexer the prompt as the only way to render
+one of these correctly.
+
+``ShellSessionBaseLexer`` does the work once ``_ps1rgx`` matches: it
+splits the typed line from its output and hands the typed part to an inner
+lexer, which here is Python.
+"""
+import re
+
+from pygments.lexers.python import PythonLexer
+from pygments.lexers.shell import ShellSessionBaseLexer
+
+__version__ = '1.0'
+
+
+class PyDevShellSessionLexer(ShellSessionBaseLexer):
+    """A session in BitBake's Python development shell."""
+
+    name = 'BitBake pydevshell session'
+    aliases = ['pydevshell']
+    filenames = []
+    mimetypes = []
+    url = 'https://docs.yoctoproject.org/dev-manual/python-development-shell.html'
+
+    _innerLexerCls = PythonLexer
+    _ps1rgx = re.compile(r'^(pydevshell> )(.*\n?)')
+    _ps2 = '... '
+
+
+def setup(app):
+    app.add_lexer('pydevshell', PyDevShellSessionLexer)
+    return {
+        'version': __version__,
+        'parallel_read_safe': True,
+        'parallel_write_safe': True,
+    }
-- 
2.50.0.173.g8b6f19ccfc3a

